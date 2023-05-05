package com.example.financeManager.controller;

import com.example.financeManager.dto.Result;
import com.example.financeManager.dto.UserInfo;
import com.example.financeManager.entity.User;
import com.example.financeManager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @version 1.0
 * @file UserController
 * @Description: TODO user相关controller
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;

    /**
     * 定向到登录页面
     *
     * @return {@link String}
     */
    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    /**
     * 用户登录
     *
     * @param request 请求
     * @return {@link Result}<{@link UserInfo}>
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Result<UserInfo> doLogin(HttpServletRequest request) {
        String loginName = request.getParameter("username");
        String password = request.getParameter("password");

        Result<UserInfo> result = userService.doLogin(loginName, password);
        if (result.isSuccess()) {
            session.setAttribute("userId", result.getData().getId());
        }
        System.out.println(result);
        return result;
    }

    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "register")
    public String register() {
        return "register";
    }

    /**
     * 用户注册
     *
     * @param user 用户
     * @return {@link Result}<{@link String}>
     */
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public Result<String> doRegister(@RequestBody User user) {
        return userService.doRegister(user);
    }

    /**
     * 注销
     *
     * @return {@link Result}<{@link String}>
     */
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ResponseBody
    public Result<String> logout() {
        Result<String> result = new Result<>(true, "success");
        session.removeAttribute("userId");
        return result;
    }

    @RequestMapping(value = "/manageUser")
    public String manageUser() {
        return "manageUser";
    }

    @RequestMapping(value = "/userEdit")
    public String userEdit() {
        return "userEdit";
    }

    /**
     * 获取当前编辑的用户信息
     *
     * @return {@link Result}<{@link UserInfo}>
     */
    @RequestMapping(value = "/getEditUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Result<UserInfo> getEditUserInfo() {
        Integer userId = (Integer) session.getAttribute("editId");
        return userService.getUserInfo(userId);
    }

    /**
     * 获取用户列表
     *
     * @return {@link Result}<{@link List}<{@link UserInfo}>>
     */
    @RequestMapping(value = "/getUsers", method = RequestMethod.POST)
    @ResponseBody
    public Result<List<UserInfo>> getUsers() {
        return userService.getUsers();
    }

    /**
     * 删除用户
     *
     * @param request 请求
     * @return {@link Result}<{@link String}>
     */
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Result<String> deleteUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        System.out.println(id);
        return userService.deleteUser(Integer.parseInt(id));
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    @ResponseBody
    public Result<String> editUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        session.setAttribute("editId", Integer.parseInt(id));
        return new Result<>(true, "成功");
    }

    /**
     * 获取用户信息
     *
     * @return {@link Result}<{@link UserInfo}>
     */
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Result<UserInfo> getUserInfo() {
        Result<UserInfo> result = new Result<>();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            result.setSuccess(false);
            result.setError("用户未登录");
            return result;
        }
        return userService.getUserInfo(userId);
    }

    /**
     * 更新用户信息
     *
     * @param user 用户
     * @return {@link Result}<{@link String}>
     */
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    @ResponseBody
    public Result<String> updateUser(@RequestBody User user) {
        Result<String> result = new Result<>();
        Integer userId = (Integer) session.getAttribute("editId");
        user.setId(userId);
        if (!user.getPassword().equals("")) {
            userService.updateUser(user, true);
        } else {
            userService.updateUser(user, false);
        }
        result.setSuccess(true);
        result.setData("success");
        return result;
    }

    /**
     * 下载用户信息到excel
     *
     * @param response 响应
     */
    @RequestMapping(value = "/download")
    public void downloadUser(HttpServletResponse response) {
        userService.exportUser(response);
    }

}

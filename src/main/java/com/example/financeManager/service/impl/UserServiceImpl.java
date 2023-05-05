package com.example.financeManager.service.impl;

import com.alibaba.excel.EasyExcel;
import com.example.financeManager.dao.UserDao;
import com.example.financeManager.dao.UserFinanceDao;
import com.example.financeManager.dto.ExcelUser;
import com.example.financeManager.dto.Result;
import com.example.financeManager.dto.UserInfo;
import com.example.financeManager.entity.User;
import com.example.financeManager.entity.TbUserFinance;
import com.example.financeManager.service.UserService;
import com.example.financeManager.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * @version 1.0
 * @file UserServiceImpl
 * @Description: TODO 用户服务实现类
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    UserFinanceDao userFinanceDao;

    Md5Util md5Util = new Md5Util();

    @Override
    public Result<UserInfo> doLogin(String loginName, String password) {
        Result<UserInfo> result = new Result<>();
        User user = userDao.getByLoginName(loginName);

        if (user == null) {
            result.setSuccess(false);
            result.setError("用户未注册");
            return result;
        }

        if (!user.getPassword().equals(md5Util.getMD5(password))) {
            result.setSuccess(false);
            result.setError("密码错误");
            return result;
        }

        result.setSuccess(true);
        result.setData(new UserInfo(user));
        return result;
    }

    @Override
    public Result<String> doRegister(User user) {
        int userId = (int) System.currentTimeMillis();
        user.setId(userId);
        user.setType(2);
        //密码加密
        user.setPassword(md5Util.getMD5(user.getPassword()));
        userDao.addUser(user);
        //增加用户默认报销余额
        userFinanceDao.insert(new TbUserFinance(userId, 10000.0));
        Result<String> result = new Result<>();
        result.setSuccess(true);
        result.setData("success");
        return result;
    }

    @Override
    public User getUserById(Integer userId) {
        return userDao.getById(userId);
    }

    @Override
    public void updateUser(User user, boolean hasPassword) {
        if (!hasPassword) {
            userDao.updateUserWithoutPwd(user);
        } else {
            user.setPassword(md5Util.getMD5(user.getPassword()));
            userDao.updateUser(user);
        }

    }

    @Override
    public Result<UserInfo> getUserInfo(Integer id) {
        Result<UserInfo> result = new Result<>();

        User user = userDao.getById(id);
        if (user == null) {
            result.setSuccess(false);
            result.setError("未查到用户信息，用户id=" + id);
        } else {
            UserInfo userInfo = new UserInfo(user);
            result.setSuccess(true);
            result.setData(userInfo);
        }
        return result;
    }

    @Override
    public Result<List<UserInfo>> getUsers() {
        List<User> users = userDao.getUsers();
        List<UserInfo> userInfos = new ArrayList<>();
        for (User user : users) {
            userInfos.add(new UserInfo(user));
        }
        return new Result<>(true, userInfos);
    }

    @Override
    public Result<String> deleteUser(int id) {
        userDao.deleteUser(id);
        return new Result<>(true, "删除成功");
    }

    @Override
    public void exportUser(HttpServletResponse response) {
        List<User> users = userDao.getUsers();

        List<ExcelUser> excelUsers = new ArrayList<>();
        for (User user : users) {
            excelUsers.add(new ExcelUser(user));
        }
        try {
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            String fileName = URLEncoder.encode("用户信息", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            EasyExcel.write(response.getOutputStream(), ExcelUser.class).sheet("用户信息").doWrite(excelUsers);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

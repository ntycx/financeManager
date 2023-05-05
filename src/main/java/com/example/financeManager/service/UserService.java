package com.example.financeManager.service;

import com.example.financeManager.dto.Result;
import com.example.financeManager.dto.UserInfo;
import com.example.financeManager.entity.User;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @version 1.0
 * @file UserService
 * @Description: TODO
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */
public interface UserService {
    Result<UserInfo> doLogin(String loginName, String password);

    Result<String> doRegister(User user);

    User getUserById(Integer userId);

    void updateUser(User user, boolean hasPassword);

    Result<UserInfo> getUserInfo(Integer userId);

    Result<List<UserInfo>> getUsers();

    Result<String> deleteUser(int id);

    void exportUser(HttpServletResponse response);
}

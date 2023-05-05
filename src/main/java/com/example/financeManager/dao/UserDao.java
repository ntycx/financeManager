package com.example.financeManager.dao;

import com.example.financeManager.entity.User;

import java.util.List;

/**
 * @version 1.0
 * @file UserDao
 * @Description: TODO
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */
public interface UserDao {

    /**
     * 通过id获取用户
     *
     * @param id id
     * @return {@link User}
     */
    User getById(int id);
    /**
     * 根据用户名获取用户
     *
     * @param loginName 登录名
     * @return {@link User}
     */
    User getByLoginName(String loginName);

    void addUser(User user);

    /**
     * 更新用户-更新密码
     *
     * @param user 用户
     */
    void updateUser(User user);

    /**
     * 更新用户-不更新密码
     *
     * @param user 用户
     */
    void updateUserWithoutPwd(User user);

    /**
     * 获取用户列表
     *
     * @return {@link List}<{@link User}>
     */
    List<User> getUsers();

    void deleteUser(int id);
}

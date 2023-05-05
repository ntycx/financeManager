package com.example.financeManager.dto;

import com.example.financeManager.entity.User;

/**
 * @version 1.0
 * @file UserInfo
 * @Description: TODO 封装用户信息
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */
public class UserInfo {
    int id;
    String userName;
    String loginName;
    int type;
    String idNo;
    String phoneNo;

    public UserInfo() {
    }

    public UserInfo(int id, String userName, String loginName, int type, String idNo, String phoneNo) {
        this.id = id;
        this.userName = userName;
        this.loginName = loginName;
        this.type = type;
        this.idNo = idNo;
        this.phoneNo = phoneNo;
    }

    public UserInfo(User user){
        this.id = user.getId();
        this.userName = user.getUserName();
        this.loginName = user.getLoginName();
        this.type = user.getType();
        this.idNo = user.getIdNo();
        this.phoneNo = user.getPhoneNo();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}

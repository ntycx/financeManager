package com.example.financeManager.entity;

/**
 * @version 1.0
 * @file User
 * @Description: TODO
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */
public class User {
    int id;
    String userName;
    String loginName;
    String password;
    int type;
    String idNo;
    String phoneNo;

    public User() {
    }

    public User(int id, String userName, String loginName, String password, int type, String idNo, String phoneNo) {
        this.id = id;
        this.userName = userName;
        this.loginName = loginName;
        this.password = password;
        this.type = type;
        this.idNo = idNo;
        this.phoneNo = phoneNo;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                ", idNo='" + idNo + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                '}';
    }
}

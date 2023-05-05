package com.example.financeManager.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import com.example.financeManager.entity.User;

/**
 * @version 1.0
 * @file ExcelUser
 * @Description: TODO
 * @Author 袁陈翔
 * @Date: 2023/4/14
 * 用于导出excel的用户信息
 */
public class ExcelUser {
    @ExcelProperty(value = "姓名", index = 1)
    String userName;
    @ExcelProperty(value = "用户名", index = 0)
    String loginName;
    @ExcelProperty(value = "身份证号",index = 2)
    String idNo;
    @ExcelProperty(value = "手机号",index = 3)
    String phoneNo;

    public ExcelUser() {
    }

    public ExcelUser(User user){
        this.userName = user.getUserName();
        this.loginName = user.getLoginName();
        this.idNo = user.getIdNo();
        this.phoneNo = user.getPhoneNo();
    }

    public ExcelUser(String userName, String loginName, String idNo, String phoneNo) {
        this.userName = userName;
        this.loginName = loginName;
        this.idNo = idNo;
        this.phoneNo = phoneNo;
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

package com.example.financeManager.entity;

import java.io.Serializable;

/**
 * 用户报销余额表(TbUserFinance)实体类
 *
 * @author 袁陈翔
 * @since 2023-05-05 17:13:12
 */
public class TbUserFinance implements Serializable {
    private static final long serialVersionUID = -16133291802976492L;
    
    private Integer userId;
    /**
     * 报销余额
     */
    private double reimbursementBalance;


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public double getReimbursementBalance() {
        return reimbursementBalance;
    }

    public void setReimbursementBalance(double reimbursementBalance) {
        this.reimbursementBalance = reimbursementBalance;
    }

    public TbUserFinance(Integer userId, double reimbursementBalance) {
        this.userId = userId;
        this.reimbursementBalance = reimbursementBalance;
    }
}


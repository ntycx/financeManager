package com.example.financeManager.dto;

import com.example.financeManager.entity.TbFinanceInfo;

/**
 * @version 1.0
 * @file FinanceInfo
 * @Description: TODO 封装收支信息
 * @Author 袁陈翔
 * @Date: 2023/5/5
 */
public class FinanceInfo {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 报销人
     */
    private Integer claimerUserId;
    /**
     * 事由
     */
    private String reason;
    /**
     * 余额
     */
    private double balance;
    /**
     * 记录人
     */
    private Integer recorderUserId;

    /**
     * 报销金额数
     */
    private String sum;
    /**
     * 报销类型
     */
    private String type;
    /**
     * 事由发生时间
     */
    private String reasonTime;

    public FinanceInfo(Integer id, Integer claimerUserId, String reason, double balance, Integer recorderUserId, String sum, String type, String reasonTime) {
        this.id = id;
        this.claimerUserId = claimerUserId;
        this.reason = reason;
        this.balance = balance;
        this.recorderUserId = recorderUserId;
        this.sum = sum;
        this.type = type;
        this.reasonTime = reasonTime;
    }

    public FinanceInfo(TbFinanceInfo tbFinanceInfo, double balance) {
        this.id = tbFinanceInfo.getId();
        this.claimerUserId = tbFinanceInfo.getClaimerUserId();
        this.reason = tbFinanceInfo.getReason();
        this.balance = balance;
        this.recorderUserId = tbFinanceInfo.getRecorderUserId();
        this.sum = tbFinanceInfo.getSum();
        if (tbFinanceInfo.getType() == 1) {
            this.type = "支出";
        } else if (tbFinanceInfo.getType() == 2){
            this.type = "收入";
        }
        this.reasonTime = tbFinanceInfo.getReasonTime().toString();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClaimerUserId() {
        return claimerUserId;
    }

    public void setClaimerUserId(Integer claimerUserId) {
        this.claimerUserId = claimerUserId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public Integer getRecorderUserId() {
        return recorderUserId;
    }

    public void setRecorderUserId(Integer recorderUserId) {
        this.recorderUserId = recorderUserId;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReasonTime() {
        return reasonTime;
    }

    public void setReasonTime(String reasonTime) {
        this.reasonTime = reasonTime;
    }
}

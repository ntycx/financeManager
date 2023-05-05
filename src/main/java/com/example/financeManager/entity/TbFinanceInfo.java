package com.example.financeManager.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (TbFinanceInfo)实体类
 *
 * @author 袁陈翔
 * @since 2023-05-05 13:19:20
 */
public class TbFinanceInfo implements Serializable {
    private static final long serialVersionUID = -35087440844491334L;
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
     * 记录人
     */
    private Integer recorderUserId;
    /**
     * 逻辑删除 0=未删除 1=已删除
     */
    private Integer isDeleted;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 报销金额数
     */
    private String sum;
    /**
     * 报销类型 1=支出 2=收入
     */
    private Integer type;
    /**
     * 事由发生时间
     */
    private Date reasonTime;


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


    public Integer getRecorderUserId() {
        return recorderUserId;
    }

    public void setRecorderUserId(Integer recorderUserId) {
        this.recorderUserId = recorderUserId;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getReasonTime() {
        return reasonTime;
    }

    public void setReasonTime(Date reasonTime) {
        this.reasonTime = reasonTime;
    }

}


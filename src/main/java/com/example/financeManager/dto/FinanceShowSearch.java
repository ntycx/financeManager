package com.example.financeManager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @version 1.0
 * @file FinanceShowSearch
 * @Description: TODO finance展示查询条件
 * @Author 袁陈翔
 * @Date: 2023/5/5
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FinanceShowSearch {
    public Date startTime;
    public Date endTime;
    // 报销人
    public String claimerUser;
    // 事由
    public String reason;
    //分页数据
    public int page;
    public int pageSize;

}

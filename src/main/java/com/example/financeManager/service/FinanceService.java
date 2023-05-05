package com.example.financeManager.service;

import com.example.financeManager.dto.FinanceInfo;

import java.util.List;

/**
 * @version 1.0
 * @file FinanceService
 * @Description: TODO
 * @Author 袁陈翔
 * @Date: 2023/5/5
 */
public interface FinanceService {
    public List<FinanceInfo> getFinanceList();
}

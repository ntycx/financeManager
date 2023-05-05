package com.example.financeManager.controller;

import com.example.financeManager.dto.FinanceInfo;
import com.example.financeManager.dto.FinanceShowSearch;
import com.example.financeManager.dto.Result;
import com.example.financeManager.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @version 1.0
 * @file FinanceController
 * @Description: TODO finance相关controller
 * @Author 袁陈翔
 * @Date: 2023/5/5
 */
@Controller
public class FinanceController {
    @Autowired
    FinanceService financeService;

//    /**
//     * 定向到index页面
//     *
//     * @return {@link String}
//     */
//    @RequestMapping(value = "/index")
//    public String index() {
//        return "index";
//    }

    /**
     * 获取收支列表
     *
     * @param financeShowSearch 收支查询条件
     * @return {@link Result}
     */
    @RequestMapping(value = "/getFinanceList",method = RequestMethod.POST)
    public Result<List<FinanceInfo>> getFinanceList(@RequestBody FinanceShowSearch financeShowSearch) {
        return null;
    }
}

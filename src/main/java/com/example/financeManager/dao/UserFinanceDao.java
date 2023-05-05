package com.example.financeManager.dao;

import com.example.financeManager.entity.TbUserFinance;

/**
 * 用户报销余额表(TbUserFinance)表数据库访问层
 *
 * @author 袁陈翔
 * @since 2023-05-05 17:13:12
 */
public interface UserFinanceDao {

    /**
     * 通过userId查询单条数据
     *
     * @param userId 用户id
     * @return 实例对象
     */
    TbUserFinance queryByUserId(Integer userId);


    /**
     * 新增数据
     *
     * @param tbUserFinance 实例对象
     * @return 影响行数
     */
    int insert(TbUserFinance tbUserFinance);

    /**
     * 修改数据
     *
     * @param tbUserFinance 实例对象
     * @return 影响行数
     */
    int update(TbUserFinance tbUserFinance);


}


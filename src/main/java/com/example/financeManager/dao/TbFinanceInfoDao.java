package com.example.financeManager.dao;

import com.example.financeManager.entity.TbFinanceInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.List;

/**
 * (TbFinanceInfo)表数据库访问层
 *
 * @author 袁陈翔
 * @since 2023-05-05 13:19:20
 */
public interface TbFinanceInfoDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TbFinanceInfo queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param tbFinanceInfo 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<TbFinanceInfo> queryAllByLimit(TbFinanceInfo tbFinanceInfo, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param tbFinanceInfo 查询条件
     * @return 总行数
     */
    long count(TbFinanceInfo tbFinanceInfo);

    /**
     * 新增数据
     *
     * @param tbFinanceInfo 实例对象
     * @return 影响行数
     */
    int insert(TbFinanceInfo tbFinanceInfo);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<TbFinanceInfo> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<TbFinanceInfo> entities);

//    /**
//     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
//     *
//     * @param entities List<TbFinanceInfo> 实例对象列表
//     * @return 影响行数
//     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
//     */
//    int insertOrUpdateBatch(@Param("entities") List<TbFinanceInfo> entities);

    /**
     * 修改数据
     *
     * @param tbFinanceInfo 实例对象
     * @return 影响行数
     */
    int update(TbFinanceInfo tbFinanceInfo);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}


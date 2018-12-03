package com.github.tangyi.common.persistence;

import java.util.List;

/**
 * Crud Mapper
 *
 * @author tangyi
 * @date 2018-08-24-18:59
 */
public interface CrudMapper<T> extends BaseMapper {

    /**
     * 获取单条数据
     *
     * @param entity
     * @return
     */
    T get(T entity);

    /**
     * 获取列表数据
     *
     * @param entity
     * @return
     */
    List<T> findList(T entity);

    /**
     * 获取所有数据
     *
     * @return
     */
    List<T> findAllList();

    /**
     * 插入单条数据
     *
     * @param entity
     * @return
     */
    int insert(T entity);

    /**
     * 更新单条数据
     *
     * @param entity
     * @return
     */
    int update(T entity);

    /**
     * 删除单条数据
     *
     * @param entity
     * @return
     */
    int delete(T entity);

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    int deleteAll(String[] ids);
}

package com.github.tangyi.common.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.persistence.BaseEntity;
import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.common.utils.ReflectionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author tangyi
 * @date 2018-08-25-17:22
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudMapper<T>, T extends BaseEntity<T>> extends BaseService {

    @Autowired
    protected D dao;

    /**
     * 根据id获取
     *
     * @param id
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public T get(String id) throws Exception {
        Class<T> entityClass = ReflectionUtil.getClassGenricType(getClass(), 1);
        T entity = entityClass.getConstructor(String.class).newInstance("0");
        entity.setId(id);
        return dao.get(entity);
    }

    /**
     * 获取单条数据
     *
     * @param entity
     * @return
     */
    public T get(T entity) {
        return dao.get(entity);
    }

    /**
     * 查询列表
     *
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return dao.findList(entity);
    }

    /**
     * 查询分页
     *
     * @param page
     * @param entity
     * @return
     */
    public PageInfo<T> findPage(PageInfo<T> page, T entity) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        return new PageInfo<T>(dao.findList(entity));
    }

    /**
     * 插入或更新
     *
     * @param entity
     * @return
     */
    @Transactional(readOnly = false)
    public int save(T entity) {
        if (entity.isNewRecord()) {
            return dao.insert(entity);
        } else {
            return dao.update(entity);
        }
    }

    /**
     * 删除
     *
     * @param entity
     * @return
     */
    @Transactional(readOnly = false)
    public int delete(T entity) {
        return dao.delete(entity);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @Transactional(readOnly = false)
    public int deleteAll(String[] ids) {
        return this.dao.deleteAll(ids);
    }

    /**
     * 插入数据
     *
     * @param entity
     * @return
     */
    @Transactional(readOnly = false)
    public int insert(T entity) {
        return dao.insert(entity);
    }

    /**
     * 更新数据
     *
     * @param entity
     * @return
     */
    @Transactional(readOnly = false)
    public int update(T entity) {
        return dao.update(entity);
    }
}

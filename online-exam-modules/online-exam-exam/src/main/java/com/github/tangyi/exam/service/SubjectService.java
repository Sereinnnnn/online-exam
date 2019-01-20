package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.SubjectMapper;
import com.github.tangyi.exam.module.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 题目service
 *
 * @author tangyi
 * @date 2018/11/8 21:23
 */
@Service
@Transactional(readOnly = true)
public class SubjectService extends CrudService<SubjectMapper, Subject> {

    /**
     * 查找题目
     *
     * @param subject subject
     * @return Subject
     * @author tangyi
     * @date 2019/1/3 14:24
     */
    @Override
    @Cacheable(value = "subject", key = "#subject.id")
    public Subject get(Subject subject) {
        return super.get(subject);
    }

    /**
     * 根据考试ID和序号查找
     *
     * @param subject subject
     * @return Subject
     * @author tangyi
     * @date 2019/01/20 12:22
     */
    public Subject getByExaminationIdAndSerialNumber(Subject subject) {
        return this.dao.getByExaminationIdAndSerialNumber(subject);
    }

    /**
     * 更新题目
     *
     * @param subject subject
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subject", key = "#subject.id")
    public int update(Subject subject) {
        return super.update(subject);
    }

    /**
     * 删除题目
     *
     * @param subject subject
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subject", key = "#subject.id")
    public int delete(Subject subject) {
        return super.delete(subject);
    }

    /**
     * 批量删除题目
     *
     * @param ids ids
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subject", allEntries = true)
    public int deleteAll(String[] ids) {
        return super.deleteAll(ids);
    }
}

package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ExaminationMapper;
import com.github.tangyi.exam.module.Examination;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 考试service
 *
 * @author tangyi
 * @date 2018/11/8 21:19
 */
@Service
@Transactional(readOnly = true)
public class ExaminationService extends CrudService<ExaminationMapper, Examination> {

    /**
     * 查询考试
     *
     * @param examination examination
     * @return Examination
     * @author tangyi
     * @date 2019/1/3 14:06
     */
    @Override
    @Cacheable(value = "examination", key = "#examination.id")
    public Examination get(Examination examination) {
        return super.get(examination);
    }

    /**
     * 更新考试
     *
     * @param examination examination
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:07
     */
    @Override
    @Transactional
    @CacheEvict(value = "examination", key = "#examination.id")
    public int update(Examination examination) {
        return super.update(examination);
    }

    /**
     * 删除考试
     *
     * @param examination examination
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:07
     */
    @Override
    @Transactional
    @CacheEvict(value = "examination", key = "#examination.id")
    public int delete(Examination examination) {
        return super.delete(examination);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author tangyi
     * @date 2018/12/4 9:51
     */
    @Override
    @Transactional
    @CacheEvict(value = "examination", allEntries = true)
    public int deleteAll(String[] ids) {
        return super.deleteAll(ids);
    }
}

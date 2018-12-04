package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ExaminationMapper;
import com.github.tangyi.exam.module.Examination;
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
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author tangyi
     * @date 2018/12/4 9:51
     */
    @Override
    @Transactional
    public int deleteAll(String[] ids) {
        return super.deleteAll(ids);
    }
}

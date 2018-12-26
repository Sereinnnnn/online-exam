package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ExamRecordMapper;
import com.github.tangyi.exam.module.ExamRecord;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 考试记录service
 *
 * @author tangyi
 * @date 2018/11/8 21:20
 */
@Service
@Transactional(readOnly = true)
public class ExamRecordService extends CrudService<ExamRecordMapper, ExamRecord> {

    /**
     * 根据用户id、考试id查找
     *
     * @param examRecode examRecode
     * @return ExamRecode
     * @author tangyi
     * @date 2018/12/26 13:58
     */
    public ExamRecord getByUserIdAndExaminationId(ExamRecord examRecode) {
        return this.dao.getByUserIdAndExaminationId(examRecode);
    }
}

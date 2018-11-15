package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ExaminationSubjectMapper;
import com.github.tangyi.exam.module.ExaminationSubject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 考试题目关联service
 *
 * @author tangyi
 * @date 2018-11-14 9:41
 */
@Service
@Transactional(readOnly = true)
public class ExaminationSubjectService extends CrudService<ExaminationSubjectMapper, ExaminationSubject> {

    @Autowired
    private ExaminationSubjectMapper examinationSubjectMapper;

    /**
     * 根据考试id查找
     *
     * @param examinationId examinationId
     * @return List
     * @author tangyi
     * @date 2018/11/14 9:39
     */
    List<ExaminationSubject> getByExaminationId(String examinationId) {
        return examinationSubjectMapper.getByExaminationId(examinationId);
    }

    /**
     * 根据题目id删除
     *
     * @param subjectId subjectId
     * @return int
     * @author tangyi
     * @date 2018/11/14 9:40
     */
    int deleteBySubjectId(String subjectId) {
        return examinationSubjectMapper.deleteBySubjectId(subjectId);
    }
}

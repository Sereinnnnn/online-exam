package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.ExaminationSubject;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author tangyi
 * @date 2018-11-14 9:38
 */
@Mapper
public interface ExaminationSubjectMapper extends CrudMapper<ExaminationSubject> {

    /**
     * 根据考试id查找
     *
     * @param examinationId examinationId
     * @return List
     * @author tangyi
     * @date 2018/11/14 9:39
     */
    List<ExaminationSubject> getByExaminationId(String examinationId);

    /**
     * 根据题目id删除
     *
     * @param subjectId subjectId
     * @return int
     * @author tangyi
     * @date 2018/11/14 9:40
     */
    int deleteBySubjectId(String subjectId);

}

package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.ExamRecode;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试记录Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:12
 */
@Mapper
public interface ExamRecodeMapper extends CrudMapper<ExamRecode> {

    /**
     * 根据用户id、考试id查找
     *
     * @param examRecode examRecode
     * @return Score
     * @author tangyi
     * @date 2018/12/26 13:56
     */
    ExamRecode getByUserIdAndExaminationId(ExamRecode examRecode);
}

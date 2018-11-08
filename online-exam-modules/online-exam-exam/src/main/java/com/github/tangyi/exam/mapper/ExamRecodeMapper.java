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
}

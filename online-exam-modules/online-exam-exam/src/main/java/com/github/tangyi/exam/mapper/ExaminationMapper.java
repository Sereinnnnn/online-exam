package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.Examination;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:11
 */
@Mapper
public interface ExaminationMapper extends CrudMapper<Examination> {
}

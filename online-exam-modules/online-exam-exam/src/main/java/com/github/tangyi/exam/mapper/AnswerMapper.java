package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.Answer;
import org.apache.ibatis.annotations.Mapper;

/**
 * 答题Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:09
 */
@Mapper
public interface AnswerMapper extends CrudMapper<Answer> {
}

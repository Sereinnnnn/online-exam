package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.IncorrectAnswer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 错题Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:13
 */
@Mapper
public interface IncorrectAnswerMapper extends CrudMapper<IncorrectAnswer> {

    /**
     * 批量保存
     *
     * @param incorrectAnswerList incorrectAnswerList
     * @return int
     * @author tangyi
     * @date 2018/12/26 14:37
     */
    int insertBatch(List<IncorrectAnswer> incorrectAnswerList);
}

package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.Score;
import org.apache.ibatis.annotations.Mapper;

/**
 * 成绩Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:14
 */
@Mapper
public interface ScoreMapper extends CrudMapper<Score> {
}

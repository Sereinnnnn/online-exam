package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.Subject;
import org.apache.ibatis.annotations.Mapper;

/**
 * 题目Mapper
 *
 * @author tangyi
 * @date 2018/11/8 21:15
 */
@Mapper
public interface SubjectMapper extends CrudMapper<Subject> {
}

package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.SubjectCategory;
import org.apache.ibatis.annotations.Mapper;

/**
 * 题目分类Mapper
 *
 * @author tangyi
 * @date 2018/12/4 21:48
 */
@Mapper
public interface SubjectCategoryMapper extends CrudMapper<SubjectCategory> {
}

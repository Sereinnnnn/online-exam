package com.github.tangyi.exam.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.exam.module.SubjectBank;
import org.apache.ibatis.annotations.Mapper;

/**
 * 题库mapper
 *
 * @author tangyi
 * @date 2018/12/9 14:10
 */
@Mapper
public interface SubjectBankMapper  extends CrudMapper<SubjectBank> {
}

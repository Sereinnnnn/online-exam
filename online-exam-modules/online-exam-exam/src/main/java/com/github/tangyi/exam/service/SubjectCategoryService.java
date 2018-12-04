package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.SubjectCategoryMapper;
import com.github.tangyi.exam.module.SubjectCategory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 题目分类service
 *
 * @author tangyi
 * @date 2018/12/4 21:56
 */
@Service
@Transactional(readOnly = true)
public class SubjectCategoryService extends CrudService<SubjectCategoryMapper, SubjectCategory> {
}

package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.SubjectMapper;
import com.github.tangyi.exam.module.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 题目service
 *
 * @author tangyi
 * @date 2018/11/8 21:23
 */
@Service
@Transactional(readOnly = true)
public class SubjectService extends CrudService<SubjectMapper, Subject> {

}

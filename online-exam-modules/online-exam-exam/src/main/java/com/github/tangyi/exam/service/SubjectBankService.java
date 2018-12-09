package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.SubjectBankMapper;
import com.github.tangyi.exam.module.SubjectBank;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 题库service
 *
 * @author tangyi
 * @date 2018/12/9 14:11
 */
@Service
@Transactional(readOnly = true)
public class SubjectBankService extends CrudService<SubjectBankMapper, SubjectBank> {

}

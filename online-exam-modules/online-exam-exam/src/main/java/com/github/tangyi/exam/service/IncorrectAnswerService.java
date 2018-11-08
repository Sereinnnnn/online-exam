package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.IncorrectAnswerMapper;
import com.github.tangyi.exam.module.IncorrectAnswer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 错题service
 *
 * @author tangyi
 * @date 2018/11/8 21:21
 */
@Service
@Transactional(readOnly = true)
public class IncorrectAnswerService extends CrudService<IncorrectAnswerMapper, IncorrectAnswer> {
}

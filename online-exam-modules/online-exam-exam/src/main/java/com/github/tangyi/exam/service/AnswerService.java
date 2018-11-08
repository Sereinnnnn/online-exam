package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.AnswerMapper;
import com.github.tangyi.exam.module.Answer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 答题service
 *
 * @author tangyi
 * @date 2018/11/8 21:17
 */
@Service
@Transactional(readOnly = true)
public class AnswerService extends CrudService<AnswerMapper, Answer> {
}

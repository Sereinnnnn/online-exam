package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ScoreMapper;
import com.github.tangyi.exam.module.Score;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 成绩service
 *
 * @author tangyi
 * @date 2018/11/8 21:22
 */
@Service
@Transactional(readOnly = true)
public class ScoreService extends CrudService<ScoreMapper, Score> {
}

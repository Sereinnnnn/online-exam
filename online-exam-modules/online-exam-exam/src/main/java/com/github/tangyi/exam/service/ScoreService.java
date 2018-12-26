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

    /**
     * 根据用户id、考试id查找
     *
     * @param score score
     * @return Score
     * @author tangyi
     * @date 2018/12/26 13:58
     */
    public Score getByUserIdAndExaminationId(Score score) {
        return this.dao.getByUserIdAndExaminationId(score);
    }
}

package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.ScoreMapper;
import com.github.tangyi.exam.module.Score;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
     * 查找成绩
     *
     * @param score score
     * @return Score
     * @author tangyi
     * @date 2019/1/3 14:16
     */
    @Override
    @Cacheable(value = "score", key = "#score.id")
    public Score get(Score score) {
        return super.get(score);
    }

    /**
     * 更新成绩
     *
     * @param score score
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:17
     */
    @Override
    @Transactional
    @CacheEvict(value = "score", key = "#score.id")
    public int update(Score score) {
        return super.update(score);
    }

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

    /**
     * 删除成绩
     *
     * @param score score
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:17
     */
    @Override
    @Transactional
    @CacheEvict(value = "score", key = "#score.id")
    public int delete(Score score) {
        return super.delete(score);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author tangyi
     * @date 2019/1/3 14:17
     */
    @Override
    @Transactional
    @CacheEvict(value = "score", allEntries = true)
    public int deleteAll(String[] ids) {
        return super.deleteAll(ids);
    }
}

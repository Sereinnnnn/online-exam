package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.IncorrectAnswerMapper;
import com.github.tangyi.exam.module.IncorrectAnswer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 错题service
 *
 * @author tangyi
 * @date 2018/11/8 21:21
 */
@Service
@Transactional(readOnly = true)
public class IncorrectAnswerService extends CrudService<IncorrectAnswerMapper, IncorrectAnswer> {

    /**
     * 批量保存
     *
     * @param incorrectAnswerList incorrectAnswerList
     * @return int
     * @author tangyi
     * @date 2018/12/26 14:37
     */
    @Transactional
    public int insertBatch(List<IncorrectAnswer> incorrectAnswerList) {
        return this.dao.insertBatch(incorrectAnswerList);
    }
}

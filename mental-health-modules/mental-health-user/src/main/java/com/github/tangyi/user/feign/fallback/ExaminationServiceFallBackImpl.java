package com.github.tangyi.user.feign.fallback;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.user.feign.ExaminationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 考试服务熔断
 *
 * @author tangyi
 * @date 2019-03-01 15:22
 */
@Service
public class ExaminationServiceFallBackImpl implements ExaminationService {

    private static final Logger logger = LoggerFactory.getLogger(ExaminationServiceFallBackImpl.class);

    @Override
    public ReturnT<Integer> findExaminationCount() {
        logger.error("调用{}异常", "findExaminationCount");
        return new ReturnT<>(0);
    }
}

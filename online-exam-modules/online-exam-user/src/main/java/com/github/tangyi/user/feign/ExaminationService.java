package com.github.tangyi.user.feign;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.user.feign.fallback.ExaminationServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 考试接口
 *
 * @author tangyi
 * @date 2019-03-01 15:21
 */
@FeignClient(name = "online-exam-exam", fallback = ExaminationServiceFallBackImpl.class)
public interface ExaminationService {

    /**
     * 查询考试数量
     *
     * @return ReturnT
     */
    @GetMapping("/api/v1/examination/examinationCount")
    ReturnT<Integer> findExaminationCount();
}

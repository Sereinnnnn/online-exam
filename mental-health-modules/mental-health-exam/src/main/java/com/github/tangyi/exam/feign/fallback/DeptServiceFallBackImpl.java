package com.github.tangyi.exam.feign.fallback;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.DeptVo;
import com.github.tangyi.exam.feign.DeptService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * 部门服务熔断
 *
 * @author tangyi
 * @date 2018/12/31 22:05
 */
@Service
public class DeptServiceFallBackImpl implements DeptService {

    private static final Logger logger = LoggerFactory.getLogger(DeptServiceFallBackImpl.class);

    @Override
    public ReturnT<List<DeptVo>> findById(@RequestBody DeptVo deptVo) {
        logger.error("调用{}异常:{}", "findById", deptVo);
        return null;
    }
}

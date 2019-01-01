package com.github.tangyi.exam.feign.fallback;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.exam.feign.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * 用户服务熔断
 *
 * @author tangyi
 * @date 2018-12-30 23:21
 */
@Service
public class UserDetailServiceFallBackImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserDetailServiceFallBackImpl.class);

    @Override
    public ReturnT<List<UserVo>> findById(@RequestBody UserVo userVo) {
        logger.error("调用{}异常:{}", "findById", userVo);
        return null;
    }
}

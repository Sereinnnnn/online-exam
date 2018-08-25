package com.github.tangyi.feign.fallback;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.feign.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 用户服务熔断
 *
 * @author tangyi
 * @date 2018-08-25-14:53
 */
@Service
public class UserDetailServiceFallBackImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserDetailServiceFallBackImpl.class);

    @Override
    public UserVo findByUsername(String username) {
        logger.error("调用{}异常:{}", "findByUsername", username);
        return null;
    }
}

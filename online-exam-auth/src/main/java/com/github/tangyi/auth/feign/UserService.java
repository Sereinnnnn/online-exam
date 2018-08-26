package com.github.tangyi.auth.feign;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.auth.feign.fallback.UserDetailServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
 * 用户服务接口
 *
 * @author tangyi
 * @date 2018-08-25-14:49
 */
@FeignClient(name = "", fallback = UserDetailServiceFallBackImpl.class)
public interface UserService {

    /**
     * 根据用户名获取用户
     *
     * @param username
     * @return
     */
    UserVo findByUsername(String username);
}

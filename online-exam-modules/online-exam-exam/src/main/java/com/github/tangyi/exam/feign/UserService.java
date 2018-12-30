package com.github.tangyi.exam.feign;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.exam.feign.fallback.UserDetailServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 用户服务接口
 *
 * @author tangyi
 * @date 2018-12-30 23:21
 */
@FeignClient(name = "online-exam-user", fallback = UserDetailServiceFallBackImpl.class)
public interface UserService {

    /**
     * 根据用户id获取用户
     *
     * @param id id
     * @return UserVo
     */
    @GetMapping("/user/{id}")
    UserVo findById(@PathVariable("id") String id);
}

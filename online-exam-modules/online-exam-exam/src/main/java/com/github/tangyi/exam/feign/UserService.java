package com.github.tangyi.exam.feign;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.exam.feign.fallback.UserDetailServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.context.annotation.Primary;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 用户服务接口
 *
 * @author tangyi
 * @date 2018-12-30 23:21
 */
@FeignClient(name = "online-exam-user", fallback = UserDetailServiceFallBackImpl.class)
@Primary
public interface UserService {

    /**
     * 根据用户id获取用户
     *
     * @param userVo userVo
     * @return UserVo
     */
    @RequestMapping(value = "/api/v1/user/findById", method = RequestMethod.POST)
    ReturnT<List<UserVo>> findById(@RequestBody UserVo userVo);





}

package com.github.tangyi.auth.controller;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.token.ConsumerTokenServices;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 认证
 *
 * @author tangyi
 * @date 2018-08-25-14:44
 */
@RestController
@RequestMapping("/authentication")
public class AuthenticationController extends BaseController {

    @Autowired
    @Qualifier("consumerTokenServices")
    private ConsumerTokenServices consumerTokenServices;

    /**
     * 认证页面
     *
     * @return ModelAndView
     */
    @GetMapping("/require")
    public ModelAndView require() {
        return new ModelAndView("ftl/login");
    }

    /**
     * 用户信息校验
     *
     * @param authentication 信息
     * @return 用户信息
     */
    @RequestMapping("/user")
    public Object user(Authentication authentication) {
        return authentication.getPrincipal();
    }

    /**
     * 清除accesstoken
     *
     * @param accesstoken  accesstoken
     * @return ReturnT
     */
    @PostMapping("/removeToken")
    @CacheEvict(value = SecurityConstant.TOKEN_USER_DETAIL, key = "#accesstoken")
    public ReturnT<Boolean> removeToken(String accesstoken) {
        return new ReturnT<Boolean>(consumerTokenServices.revokeToken(accesstoken));
    }
}

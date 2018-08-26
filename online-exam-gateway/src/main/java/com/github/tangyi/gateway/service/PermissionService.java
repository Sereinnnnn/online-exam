package com.github.tangyi.gateway.service;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;

import javax.servlet.http.HttpServletRequest;

/**
 * 权限服务
 *
 * @author tangyi
 * @date 2018-08-25-14:10
 */
public interface PermissionService {

    /**
     * 判断请求是否有权限
     *
     * @param request        HttpServletRequest
     * @param authentication 认证信息
     * @return 是否有权限
     */
    boolean hasPermission(HttpServletRequest request, Authentication authentication);
}

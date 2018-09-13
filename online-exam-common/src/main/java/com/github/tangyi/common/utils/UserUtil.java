package com.github.tangyi.common.utils;

import com.alibaba.ttl.TransmittableThreadLocal;
import com.github.tangyi.common.constants.CommonConstant;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

import javax.servlet.http.HttpServletRequest;
import java.util.Base64;
import java.util.List;

/**
 * 用户工具类
 *
 * @author tangyi
 * @date 2018-09-13-20:50
 */
public class UserUtil {

    private static final Logger logger = LoggerFactory.getLogger(UserUtil.class);

    private static final String KEY_USER = "user";

    private static final ThreadLocal<String> THREAD_LOCAL_USER = new TransmittableThreadLocal<>();

    /**
     * 从token中获取用户角色
     *
     * @param httpServletRequest httpServletRequest
     * @return List
     */
    public static List<String> getRole(HttpServletRequest httpServletRequest) {
        String token = getToken(httpServletRequest);
        String key = Base64.getEncoder().encodeToString(CommonConstant.SIGN_KEY.getBytes());
        Claims claims = Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody();
        List<String> roleNames = (List<String>) claims.get("authorities");
        return roleNames;
    }

    /**
     * 从token中获取用户id
     *
     * @param httpServletRequest httpServletRequest
     * @return Integer
     */
    public static Integer getUserId(HttpServletRequest httpServletRequest) {
        String token = getToken(httpServletRequest);
        String key = Base64.getEncoder().encodeToString(CommonConstant.SIGN_KEY.getBytes());
        Claims claims = Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody();
        Integer userId = (Integer) claims.get("userId");
        return userId;
    }

    /**
     * 获取token
     *
     * @param httpServletRequest httpServletRequest
     * @return String
     */
    private static String getToken(HttpServletRequest httpServletRequest) {
        String authorization = httpServletRequest.getHeader(CommonConstant.REQ_HEADER);
        return StringUtils.substringAfter(authorization, CommonConstant.TOKEN_SPLIT);
    }

    /**
     * 设置用户
     *
     * @param username username
     */
    public static void setUser(String username) {
        THREAD_LOCAL_USER.set(username);
        MDC.put(KEY_USER, username);
    }

    /**
     * 从thread local 获取用户名
     *
     * @return 用户名
     */

    public static String getUser() {
        return THREAD_LOCAL_USER.get();
    }

    /**
     * 清除用户
     */
    public static void clearAllUserInfo() {
        THREAD_LOCAL_USER.remove();
        MDC.remove(KEY_USER);
    }
}

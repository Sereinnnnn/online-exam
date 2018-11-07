package com.github.tangyi.common.utils;

import com.alibaba.ttl.TransmittableThreadLocal;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.exception.CheckedException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

/**
 * 系统工具类
 *
 * @author tangyi
 * @date 2018-09-13-20:50
 */
public class SysUtil {

    private static final Logger logger = LoggerFactory.getLogger(SysUtil.class);

    private static final String KEY_USER = "user";

    private static final String BASIC_ = "Basic ";

    private static final ThreadLocal<String> THREAD_LOCAL_USER = new TransmittableThreadLocal<>();

    /**
     * 判断是否为管理员
     *
     * @param roleCode roleCode
     * @return boolean
     * @author tangyi
     * @date 2018/11/7 17:37
     */
    public static boolean isAdmin(String roleCode) {
        return SecurityConstant.ADMIN.equals(roleCode);
    }

    /**
     * 解析header
     *
     * @param header header
     * @return String[]
     * @throws IOException
     */
    public static String[] extractAndDecodeHeader(String header) throws IOException {
        byte[] base64Token = header.substring(6).getBytes("UTF-8");
        byte[] decoded;
        try {
            decoded = org.springframework.security.crypto.codec.Base64.decode(base64Token);
        } catch (IllegalArgumentException e) {
            throw new CheckedException("Failed to decode basic authentication token");
        }
        String token = new String(decoded, CommonConstant.UTF8);
        int delim = token.indexOf(":");
        if (delim == -1) {
            throw new CheckedException("Invalid basic authentication token");
        }
        return new String[]{token.substring(0, delim), token.substring(delim + 1)};
    }

    /**
     * 解析header
     *
     * @param request request
     * @return String[]
     * @throws IOException
     */
    public static String[] extractAndDecodeHeader(HttpServletRequest request) throws IOException {
        String header = request.getHeader("Authorization");
        if (header == null || !header.startsWith(BASIC_)) {
            throw new CheckedException("请求头中client信息为空");
        }
        return extractAndDecodeHeader(header);
    }

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
        Object object = claims.get("userId");
        if (object != null)
            return (Integer) ((Map) object).get("user_id");
        return null;
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

    /**
     * 获取系统编号
     *
     * @return String
     */
    public static String getSysCode() {
        return CommonConstant.SYS_CODE;
    }
}

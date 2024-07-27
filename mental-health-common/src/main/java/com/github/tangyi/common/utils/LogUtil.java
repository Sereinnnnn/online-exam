package com.github.tangyi.common.utils;

import com.github.tangyi.common.model.Log;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 日志工具类
 *
 * @author tangyi
 * @date 2018/11/1 21:39
 */
public class LogUtil {

    /**
     * 正常类型日志
     */
    private static final String TYPE_ACCESS = "1";

    /**
     * 异常类型日志
     */
    private static final String TYPE_EXCEPTION = "2";

    /**
     * @param request request
     * @param user    user
     * @param ex      ex
     * @param title   title
     * @return Log
     * @author tangyi
     * @date 2018/11/1  21:46
     */
    public static Log getLog(HttpServletRequest request, String user, Exception ex, String title) {
        Log log = new Log();
        log.setCommonValue(user, SysUtil.getSysCode());
        log.setTitle(title);
        log.setCreator(user);
        log.setType(ex == null ? TYPE_ACCESS : TYPE_EXCEPTION);
        log.setIp(request == null ? null : getRemoteAddress(request));
        log.setUserAgent(request == null ? null : request.getHeader("user-agent"));
        log.setRequestUri(request == null ? null : request.getRequestURI());
        log.setParams(request == null ? null : request.getParameterMap().toString());
        log.setMethod(request == null ? null : request.getMethod());
        log.setException(ex == null ? "" : ex.getMessage());
        return log;
    }

    /**
     * 获得用户远程地址
     *
     * @param request request
     * @return String
     * @author tangyi
     * @date 2018/11/1 21:49
     */
    private static String getRemoteAddress(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Real-IP");
        if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("X-Forwarded-For");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("Proxy-Client-IP");
        } else if (StringUtils.isNotBlank(remoteAddr)) {
            remoteAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
    }
}

package com.github.tangyi.common.aop;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.utils.SysUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * Controller Aop
 *
 * @author tangyi
 * @date 2018-10-29-17:27
 */
@Aspect
@Component
public class ControllerAop {

    private static final Logger logger = LoggerFactory.getLogger(ControllerAop.class);

    /**
     * ReturnT切点
     */
    @Pointcut("execution(public com.github.tangyi.common.model.ReturnT *(..))")
    public void returnTPointCut() {
    }

    /**
     * PageInfo切点
     */
    @Pointcut("execution(public com.github.pagehelper.PageInfo *(..))")
    public void pageInfoPointCut() {
    }

    /**
     * 环绕ReturnT切点
     *
     * @param joinPoint joinPoint
     * @return Object
     * @throws Throwable
     */
    @Around("returnTPointCut()")
    public Object handleReturnT(ProceedingJoinPoint joinPoint) throws Throwable {
        return handle(joinPoint);
    }


    /**
     * 环绕PageInfo切点
     *
     * @param joinPoint joinPoint
     * @return Object
     * @throws Throwable
     */
    @Around("pageInfoPointCut()")
    public Object handlePageInfo(ProceedingJoinPoint joinPoint) throws Throwable {
        return handle(joinPoint);
    }

    /**
     * 从请求头获取用户信息
     *
     * @param joinPoint joinPoint
     * @return Object
     * @throws Throwable
     */
    private Object handle(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        // 获取用户名
        String username = request.getHeader(SecurityConstant.USER_HEADER);
        if (StrUtil.isNotBlank(username)) {
            logger.debug("get username:{}", username);
            SysUtil.setUser(username);
        }
        logger.debug("URL : {}, HTTP_METHOD : {}, IP : {}, CLASS_METHOD : {}, ARGS : {}",
                request.getRequestURL(), request.getMethod(), request.getRemoteAddr(),
                joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName(),
                Arrays.toString(joinPoint.getArgs()));
        Object result;
        result = joinPoint.proceed();
        logger.info("{} use time: {}", joinPoint.getSignature(), System.currentTimeMillis() - startTime);
        // 调用完成，清空当前用户信息
        if (StrUtil.isNotEmpty(username))
            SysUtil.clearAllUserInfo();
        return result;
    }
}

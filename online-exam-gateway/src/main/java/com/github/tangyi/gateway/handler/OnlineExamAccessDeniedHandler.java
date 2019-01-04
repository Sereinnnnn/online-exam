package com.github.tangyi.gateway.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.exception.OnlineExamDeniedException;
import com.github.tangyi.common.model.ReturnT;
import org.apache.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.oauth2.provider.error.OAuth2AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 授权拒绝处理器，覆盖默认的OAuth2AccessDeniedHandler
 * 包装失败信息到OnlineExamDeniedException
 *
 * @author tangyi
 * @date 2019-01-04 15:48
 */
@Component
public class OnlineExamAccessDeniedHandler extends OAuth2AccessDeniedHandler {

    private static final Logger logger = LoggerFactory.getLogger(OnlineExamAccessDeniedHandler.class);

    @Autowired
    private ObjectMapper objectMapper;

    /**
     * 授权拒绝处理，使用ReturnT包装
     *
     * @param request       request
     * @param response      response
     * @param authException authException
     * @throws IOException      IOException
     * @throws ServletException ServletException
     */
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException authException) throws IOException, ServletException {
        logger.info("授权失败，禁止访问 {}", request.getRequestURI());
        response.setCharacterEncoding(CommonConstant.UTF8);
        response.setContentType(CommonConstant.CONTENT_TYPE);
        ReturnT<String> result = new ReturnT<>(new OnlineExamDeniedException("授权失败，禁止访问"));
        response.setStatus(HttpStatus.SC_FORBIDDEN);
        PrintWriter printWriter = response.getWriter();
        printWriter.append(objectMapper.writeValueAsString(result));
    }
}

package com.github.tangyi.gateway.service.impl;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.constants.MqQueueConstant;
import com.github.tangyi.common.model.Log;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.common.vo.LogVo;
import com.github.tangyi.gateway.service.LogSendService;
import com.netflix.zuul.context.RequestContext;
import com.xiaoleilu.hutool.http.HttpUtil;
import com.xiaoleilu.hutool.io.IoUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import com.xiaoleilu.hutool.util.URLUtil;
import org.apache.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 日志服务
 *
 * @author tangyi
 * @date 2019-01-04 15:40
 */
@Component
public class LogSendServiceImpl implements LogSendService {

    private static final Logger logger = LoggerFactory.getLogger(LogSendServiceImpl.class);

    private static final String SERVICE_ID = "serviceId";

    @Autowired
    private AmqpTemplate rabbitTemplate;

    @Override
    public void send(RequestContext requestContext) {
        // 发送到mq
        HttpServletRequest request = requestContext.getRequest();
        Log log = new Log();
        log.setType(CommonConstant.STATUS_NORMAL);
        log.setIp(HttpUtil.getClientIP(request));
        log.setRequestUri(URLUtil.getPath(request.getRequestURI()));
        log.setMethod(request.getMethod());
        log.setUserAgent(request.getHeader("user-agent"));
        String params = HttpUtil.toParams(request.getParameterMap());
        log.setParams(params.length() > 200 ? params.substring(0, 200) : params);
        Long startTime = (Long) requestContext.get("startTime");
        log.setTime(String.valueOf(System.currentTimeMillis() - startTime));
        if (requestContext.get(SERVICE_ID) != null) {
            String serviceId = requestContext.get(SERVICE_ID).toString();
            log.setServiceId(serviceId);
            log.setTitle(serviceId);
        }
        // 正常发送服务异常解析
        if (requestContext.getResponseStatusCode() == HttpStatus.SC_INTERNAL_SERVER_ERROR
                && requestContext.getResponseDataStream() != null) {
            InputStream inputStream = requestContext.getResponseDataStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            InputStream stream1 = null;
            InputStream stream2;
            byte[] buffer = IoUtil.readBytes(inputStream);
            try {
                outputStream.write(buffer);
                outputStream.flush();
                stream1 = new ByteArrayInputStream(outputStream.toByteArray());
                stream2 = new ByteArrayInputStream(outputStream.toByteArray());
                String resp = IoUtil.read(stream1, CommonConstant.UTF8);
                log.setType(CommonConstant.STATUS_LOCK);
                log.setException(resp);
                log.setTitle(resp);
                requestContext.setResponseDataStream(stream2);
            } catch (IOException e) {
                logger.error("响应流解析异常：", e);
                throw new RuntimeException(e);
            } finally {
                IoUtil.close(stream1);
                IoUtil.close(outputStream);
                IoUtil.close(inputStream);
            }
        }

        // 网关内部异常
        Throwable throwable = requestContext.getThrowable();
        if (throwable != null) {
            logger.error("网关异常", throwable);
            log.setException(throwable.getMessage());
            log.setTitle(throwable.getMessage());
            log.setType(CommonConstant.STATUS_EXCEPTION);
        }
        // 保存发往MQ（只保存授权）
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && StrUtil.isNotBlank(authentication.getName())) {
            LogVo logVo = new LogVo();
            log.setCommonValue(authentication.getName(), CommonConstant.SYS_CODE);
            logVo.setLog(log);
            logVo.setUsername(authentication.getName());
            rabbitTemplate.convertAndSend(MqQueueConstant.LOG_QUEUE, logVo);
        }
    }
}

package com.github.tangyi.gateway.service.impl;

import com.github.tangyi.gateway.service.LogSendService;
import com.netflix.zuul.context.RequestContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

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

    @Override
    public void send(RequestContext requestContext) {
        // TODO 发送到mq
        if (requestContext.get(SERVICE_ID) != null) {
            logger.debug("发送消息:{}", requestContext.get(SERVICE_ID));
        }
    }
}

package com.github.tangyi.gateway.service;

import com.netflix.zuul.context.RequestContext;

/**
 * 日志接口
 *
 * @author tangyi
 * @date 2019-01-04 15:39
 */
public interface LogSendService {

    /**
     * 发送消息
     *
     * @param requestContext requestContext
     * @author tangyi
     * @date 2019/1/4 15:39
     */
    void send(RequestContext requestContext);
}

package com.github.tangyi.gateway.handler;

import com.marcosbarbero.cloud.autoconfigure.zuul.ratelimit.config.repository.DefaultRateLimiterErrorHandler;
import com.marcosbarbero.cloud.autoconfigure.zuul.ratelimit.config.repository.RateLimiterErrorHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 限流降级处理
 *
 * @author tangyi
 * @date 2019-01-04 15:58
 */
@Configuration
public class ZuulRateLimiterErrorHandler {

    private static final Logger logger = LoggerFactory.getLogger(ZuulRateLimiterErrorHandler.class);

    @Bean
    public RateLimiterErrorHandler rateLimitErrorHandler() {
        return new DefaultRateLimiterErrorHandler() {
            @Override
            public void handleSaveError(String key, Exception e) {
                logger.error("保存key:[{}]异常", key, e);
            }

            @Override
            public void handleFetchError(String key, Exception e) {
                logger.error("路由失败:[{}]异常", key);
            }

            @Override
            public void handleError(String msg, Exception e) {
                logger.error("限流异常:[{}]", msg, e);
            }
        };
    }
}

package com.github.tangyi.common.config;

import com.github.tangyi.common.constants.MqQueueConstant;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Rabbit mq 配置
 *
 * @author tangyi
 * @date 2019/1/7 19:43
 */
@Configuration
public class RabbitConfig {

    /**
     * 初始化 log队列
     *
     * @return Queue
     */
    @Bean
    public Queue initLogQueue() {
        return new Queue(MqQueueConstant.LOG_QUEUE);
    }

    /**
     * 初始化 手机验证码通道
     *
     * @return Queue
     */
    @Bean
    public Queue initMobileCodeQueue() {
        return new Queue(MqQueueConstant.MOBILE_CODE_QUEUE);
    }

    /**
     * 初始化服务状态改变队列
     *
     * @return Queue
     */
    @Bean
    public Queue initMobileServiceStatusChangeQueue() {
        return new Queue(MqQueueConstant.MOBILE_SERVICE_STATUS_CHANGE);
    }

    /**
     * 初始化钉钉状态改变队列
     *
     * @return Queue
     */
    @Bean
    public Queue initDingTalkServiceStatusChangeQueue() {
        return new Queue(MqQueueConstant.DINGTALK_SERVICE_STATUS_CHANGE);
    }

    /**
     * 初始化zipkin队列
     *
     * @return Queue
     */
    @Bean
    public Queue initZipkinQueue() {
        return new Queue(MqQueueConstant.ZIPKIN_NAME_QUEUE);
    }

    /**
     * 初始化路由配置状态队列
     *
     * @return Queue
     */
    @Bean
    public Queue initRouteConfigChangeQueue() {
        return new Queue(MqQueueConstant.ROUTE_CONFIG_CHANGE);
    }

}

package com.github.tangyi.common.constants;

/**
 * @author tangyi
 * @date 2019/1/7 19:23
 */
public class MqQueueConstant {

    /**
     * log rabbit队列名称
     */
    public static final String LOG_QUEUE = "log";

    /**
     * 发送短信验证码队列
     */
    public static final String MOBILE_CODE_QUEUE = "mobile_code_queue";

    /**
     * 短信服务状态队列
     */
    public static final String MOBILE_SERVICE_STATUS_CHANGE = "mobile_service_status_change";

    /**
     * 钉钉服务状态队列
     */
    public static final String DINGTALK_SERVICE_STATUS_CHANGE = "dingtalk_service_status_change";

    /**
     * zipkin 队列
     */
    public static final String ZIPKIN_NAME_QUEUE = "zipkin";

    /**
     * 路由配置状态队列
     */
    public static final String ROUTE_CONFIG_CHANGE = "route_config_change";

}

package com.github.tangyi.admin.filter;

import com.alibaba.fastjson.JSONObject;
import com.github.tangyi.admin.properties.MonitorProperties;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.constants.MqQueueConstant;
import com.github.tangyi.common.enums.EnumSmsChannelTemplate;
import com.github.tangyi.common.template.MobileMsgTemplate;
import com.xiaoleilu.hutool.collection.CollUtil;
import com.xiaoleilu.hutool.date.DateUtil;
import de.codecentric.boot.admin.event.ClientApplicationEvent;
import de.codecentric.boot.admin.event.ClientApplicationStatusChangedEvent;
import de.codecentric.boot.admin.notify.AbstractStatusChangeNotifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;

/**
 * 服务下线通知，将通知发送到mq
 *
 * @author tangyi
 * @date 2019-01-08 14:56
 */
public class StatusChangeNotifier extends AbstractStatusChangeNotifier {

    private static final Logger logger = LoggerFactory.getLogger(StatusChangeNotifier.class);

    /**
     * rabbitMq
     */
    private RabbitTemplate rabbitTemplate;

    /**
     * 通知配置
     */
    private MonitorProperties monitorMobileProperties;

    public StatusChangeNotifier(MonitorProperties monitorMobileProperties, RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
        this.monitorMobileProperties = monitorMobileProperties;
    }

    /**
     * 执行通知
     *
     * @param event 事件
     * @throws Exception 异常
     */
    @Override
    protected void doNotify(ClientApplicationEvent event) {
        if (event instanceof ClientApplicationStatusChangedEvent) {
            logger.info("Application {} ({}) is {}", event.getApplication().getName(),
                    event.getApplication().getId(), ((ClientApplicationStatusChangedEvent) event).getTo().getStatus());
            String text = String.format("应用:%s 服务ID:%s 状态改变为：%s，时间：%s"
                    , event.getApplication().getName()
                    , event.getApplication().getId()
                    , ((ClientApplicationStatusChangedEvent) event).getTo().getStatus()
                    , DateUtil.date(event.getTimestamp()).toString());
            JSONObject contextJson = new JSONObject();
            contextJson.put("name", event.getApplication().getName());
            contextJson.put("seid", event.getApplication().getId());
            contextJson.put("time", DateUtil.date(event.getTimestamp()).toString());
            // 开启短信通知
            if (monitorMobileProperties.getMobile().getEnabled()) {
                logger.info("开始短信通知，内容：{}", text);
                // 发送到mq
                rabbitTemplate.convertAndSend(MqQueueConstant.MOBILE_SERVICE_STATUS_CHANGE,
                        new MobileMsgTemplate(
                                CollUtil.join(monitorMobileProperties.getMobile().getMobiles(), ","),
                                contextJson.toJSONString(),
                                CommonConstant.ALIYUN_SMS,
                                EnumSmsChannelTemplate.SERVICE_STATUS_CHANGE.getSignName(),
                                EnumSmsChannelTemplate.SERVICE_STATUS_CHANGE.getTemplate()
                        ));
            }
            if (monitorMobileProperties.getDingTalk().getEnabled()) {
                logger.info("开始钉钉通知，内容：{}", text);
                rabbitTemplate.convertAndSend(MqQueueConstant.DINGTALK_SERVICE_STATUS_CHANGE, text);
            }
        } else {
            logger.info("Application {} ({}) {}", event.getApplication().getName(),
                    event.getApplication().getId(), event.getType());
        }
    }
}

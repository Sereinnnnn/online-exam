package com.github.tangyi.user.listener;

import com.github.tangyi.common.constants.MqQueueConstant;
import com.github.tangyi.common.model.Log;
import com.github.tangyi.common.vo.LogVo;
import com.github.tangyi.user.service.LogService;
import org.slf4j.MDC;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 消费日志
 *
 * @author tangyi
 * @date 2019/1/7 19:46
 */
@Component
@RabbitListener(queues = MqQueueConstant.LOG_QUEUE)
public class LogReceiveListener {

    private static final String KEY_USER = "user";

    @Autowired
    private LogService logService;

    @RabbitHandler
    public void receive(LogVo logVo) {
        Log log = logVo.getLog();
        MDC.put(KEY_USER, logVo.getUsername());
        log.setCreator(logVo.getUsername());
        logService.insert(log);
        MDC.remove(KEY_USER);
    }
}

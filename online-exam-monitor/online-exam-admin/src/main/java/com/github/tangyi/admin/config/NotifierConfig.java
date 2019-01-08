package com.github.tangyi.admin.config;

import com.github.tangyi.admin.filter.StatusChangeNotifier;
import com.github.tangyi.admin.properties.MonitorProperties;
import de.codecentric.boot.admin.notify.RemindingNotifier;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.concurrent.TimeUnit;

/**
 * 监控提醒配置
 *
 * @author tangyi
 * @date 2019-01-08 16:04
 */
@Configuration
@EnableScheduling
public class NotifierConfig {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private MonitorProperties monitorProperties;

    @Bean
    @Primary
    public RemindingNotifier remindingNotifier() {
        RemindingNotifier remindingNotifier = new RemindingNotifier(mobileNotifier());
        remindingNotifier.setReminderPeriod(TimeUnit.MINUTES.toMillis(1));
        return remindingNotifier;
    }

    @Bean
    public StatusChangeNotifier mobileNotifier() {
        return new StatusChangeNotifier(monitorProperties, rabbitTemplate);
    }

    @Scheduled(fixedRate = 60_000L)
    public void remind() {
        remindingNotifier().sendReminders();
    }
}

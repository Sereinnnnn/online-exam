package com.github.tangyi.admin.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 配置
 *
 * @author tangyi
 * @date 2019-01-08 16:00
 */
@Configuration
@ConfigurationProperties(prefix = "notifier")
public class MonitorProperties {

    private MonitorMobileProperties mobile;

    private MonitorDingTalkProperties dingTalk;

    public MonitorMobileProperties getMobile() {
        return mobile;
    }

    public void setMobile(MonitorMobileProperties mobile) {
        this.mobile = mobile;
    }

    public MonitorDingTalkProperties getDingTalk() {
        return dingTalk;
    }

    public void setDingTalk(MonitorDingTalkProperties dingTalk) {
        this.dingTalk = dingTalk;
    }
}

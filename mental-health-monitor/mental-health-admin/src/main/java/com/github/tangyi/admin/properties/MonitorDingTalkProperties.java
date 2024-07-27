package com.github.tangyi.admin.properties;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;

/**
 * 钉钉通知配置
 *
 * @author tangyi
 * @date 2019-01-08 16:01
 */
@ConditionalOnExpression("!'${webhook}'.isEmpty()")
public class MonitorDingTalkProperties {

    /**
     * 是否开启钉钉通知
     */
    private Boolean enabled;

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}

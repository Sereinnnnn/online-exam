package com.github.tangyi.user.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 附件配置
 *
 * @author tangyi
 * @date 2019-02-24 20:06
 */
@Component
@ConfigurationProperties(prefix = "fdfs.http")
public class AttachmentConfig {

    private String host;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }
}

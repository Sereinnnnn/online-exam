package com.github.tangyi.user.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 默认用户配置
 *
 * @author tangyi
 * @date 2019-02-25 12:11
 */
@Component
@ConfigurationProperties(prefix = "user")
public class UserConfig {

    /**
     * 默认头像
     */
    private String defaultAvatar;

    public String getDefaultAvatar() {
        return defaultAvatar;
    }

    public void setDefaultAvatar(String defaultAvatar) {
        this.defaultAvatar = defaultAvatar;
    }
}

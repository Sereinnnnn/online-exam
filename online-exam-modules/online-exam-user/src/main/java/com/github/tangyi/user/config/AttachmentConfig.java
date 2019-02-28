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

    /**
     * fastDfs服务器的HTTP地址
     */
    private String host;

    /**
     * zuul上传地址
     */
    private String zuulUploadUrl;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getZuulUploadUrl() {
        return zuulUploadUrl;
    }

    public void setZuulUploadUrl(String zuulUploadUrl) {
        this.zuulUploadUrl = zuulUploadUrl;
    }
}

package com.github.tangyi.common.model;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * @author tangyi
 * @date 2018/9/1 0001 15:22
 */
public class SysZuulRoute extends BaseEntity<SysZuulRoute> {

    /**
     * 路由路径
     */
    private String path;

    /**
     * 服务名称
     */
    private String serviceId;

    /**
     * url
     */
    private String url;

    /**
     * 转发去掉前缀
     */
    private String stripPrefix;

    /**
     * 是否重试
     */
    private String retryable;

    /**
     * 是否启用
     */
    private String enabled;

    /**
     * 敏感请求头
     */
    private String sensitiveHeadersList;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStripPrefix() {
        return stripPrefix;
    }

    public void setStripPrefix(String stripPrefix) {
        this.stripPrefix = stripPrefix;
    }

    public String getRetryable() {
        return retryable;
    }

    public void setRetryable(String retryable) {
        this.retryable = retryable;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    public String getSensitiveHeadersList() {
        return sensitiveHeadersList;
    }

    public void setSensitiveHeadersList(String sensitiveHeadersList) {
        this.sensitiveHeadersList = sensitiveHeadersList;
    }
}

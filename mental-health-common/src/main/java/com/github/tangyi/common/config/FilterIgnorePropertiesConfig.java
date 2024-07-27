package com.github.tangyi.common.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: tangyi
 * @date 2018-08-25-13:53
 */
@Configuration
@RefreshScope
@ConditionalOnExpression("!'${ignore}'.isEmpty()")
@ConfigurationProperties(prefix = "ignore")
public class FilterIgnorePropertiesConfig {

    private List<String> urls = new ArrayList<>();

    private List<String> clients = new ArrayList<>();

    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }

    public List<String> getClients() {
        return clients;
    }

    public void setClients(List<String> clients) {
        this.clients = clients;
    }
}

package com.github.tangyi.gateway.config;

import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.serviceregistry.Registration;
import org.springframework.cloud.netflix.zuul.filters.ZuulProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

/**
 * 动态路由配置
 * @author tangyi
 * @date 2018/9/1 15:16
 */
@Configuration
public class DynamicRouteConfig {

    private Registration registration;
    private DiscoveryClient discovery;
    private ZuulProperties zuulProperties;
    private ServerProperties server;
    private RedisTemplate redisTemplate;

    public DynamicRouteConfig(Registration registration, DiscoveryClient discovery,
                                     ZuulProperties zuulProperties, ServerProperties server, RedisTemplate redisTemplate) {
        this.registration = registration;
        this.discovery = discovery;
        this.zuulProperties = zuulProperties;
        this.server = server;
        this.redisTemplate = redisTemplate;
    }

    @Bean
    public DynamicRouteLocator dynamicRouteLocator() {
        return new DynamicRouteLocator(server.getServletPrefix()
                , discovery
                , zuulProperties
                , registration
                , redisTemplate);
    }
}

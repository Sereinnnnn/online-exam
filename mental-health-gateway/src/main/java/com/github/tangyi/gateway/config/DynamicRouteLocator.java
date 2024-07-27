package com.github.tangyi.gateway.config;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.SysZuulRoute;
import com.xiaoleilu.hutool.collection.CollUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.netflix.zuul.filters.ZuulProperties;
import org.springframework.cloud.netflix.zuul.filters.discovery.DiscoveryClientRouteLocator;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 动态路由
 *
 * @author tangyi
 * @date 2018/9/1 15:17
 */
public class DynamicRouteLocator extends DiscoveryClientRouteLocator {

    private static final Logger logger = LoggerFactory.getLogger(DynamicRouteLocator.class);

    private ZuulProperties properties;

    private RedisTemplate redisTemplate;

    public DynamicRouteLocator(String servletPath, DiscoveryClient discovery, ZuulProperties properties,
                               ServiceInstance localServiceInstance, RedisTemplate redisTemplate) {
        super(servletPath, discovery, properties, localServiceInstance);
        this.properties = properties;
        this.redisTemplate = redisTemplate;
    }

    /**
     * 重写获取路由
     *
     * @return
     */
    @Override
    protected LinkedHashMap<String, ZuulProperties.ZuulRoute> locateRoutes() {
        // 读取properties配置、eureka默认配置
        LinkedHashMap<String, ZuulProperties.ZuulRoute> routesMap = new LinkedHashMap<>(super.locateRoutes());
        routesMap.putAll(locateRoutesFromDb());
        LinkedHashMap<String, ZuulProperties.ZuulRoute> values = new LinkedHashMap<>();
        for (Map.Entry<String, ZuulProperties.ZuulRoute> entry : routesMap.entrySet()) {
            String path = entry.getKey();
            if (!path.startsWith("/")) {
                path = "/" + path;
            }
            if (StrUtil.isNotBlank(this.properties.getPrefix())) {
                path = this.properties.getPrefix() + path;
                if (!path.startsWith("/")) {
                    path = "/" + path;
                }
            }
            values.put(path, entry.getValue());
        }
        return values;
    }

    /**
     * 从数据库中加载
     *
     * @return
     */
    private Map<String, ZuulProperties.ZuulRoute> locateRoutesFromDb() {
        Map<String, ZuulProperties.ZuulRoute> routes = new LinkedHashMap<>();

        Object obj = redisTemplate.opsForValue().get(CommonConstant.ROUTE_KEY);
        if (obj == null) {
            return routes;
        }
        List<SysZuulRoute> results = (List<SysZuulRoute>) obj;
        for (SysZuulRoute result : results) {
            if (StrUtil.isBlank(result.getPath()) && StrUtil.isBlank(result.getUrl())) {
                continue;
            }

            ZuulProperties.ZuulRoute zuulRoute = new ZuulProperties.ZuulRoute();
            try {
                zuulRoute.setId(result.getServiceId());
                zuulRoute.setPath(result.getPath());
                zuulRoute.setServiceId(result.getServiceId());
                zuulRoute.setRetryable(StrUtil.equals(result.getRetryable(), "0") ? Boolean.FALSE : Boolean.TRUE);
                zuulRoute.setStripPrefix(StrUtil.equals(result.getStripPrefix(), "0") ? Boolean.FALSE : Boolean.TRUE);
                zuulRoute.setUrl(result.getUrl());
                List<String> sensitiveHeadersList = StrUtil.splitTrim(result.getSensitiveHeadersList(), ",");
                if (sensitiveHeadersList != null) {
                    Set<String> sensitiveHeaderSet = CollUtil.newHashSet();
                    sensitiveHeadersList.forEach(sensitiveHeader -> sensitiveHeaderSet.add(sensitiveHeader));
                    zuulRoute.setSensitiveHeaders(sensitiveHeaderSet);
                    zuulRoute.setCustomSensitiveHeaders(true);
                }
            } catch (Exception e) {
                logger.error("从数据库加载路由配置异常", e);
            }
            routes.put(zuulRoute.getPath(), zuulRoute);
        }
        return routes;
    }
}

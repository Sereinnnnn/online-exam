package com.github.tangyi.user.config;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.SysZuulRoute;
import com.github.tangyi.user.service.ZuulRouteService;
import com.xiaoleilu.hutool.collection.CollUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.EmbeddedServletContainerInitializedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 动态路由配置
 *
 * @author tangyi
 * @date 2018/9/1 0001 15:44
 */
@Component
public class ZuulRouteConfig {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private ZuulRouteService zuulRouteService;

    private static final Logger logger = LoggerFactory.getLogger(ZuulRouteConfig.class);

    /**
     * 初始化路由配置的数据
     */
    @EventListener(value = {EmbeddedServletContainerInitializedEvent.class})
    @SuppressWarnings("unchecked")
    public void init() {
        logger.info("开始初始化路由配置数据");
        List<SysZuulRoute> routeList = zuulRouteService.findList(new SysZuulRoute());
        if (CollUtil.isNotEmpty(routeList)) {
            redisTemplate.opsForValue().set(CommonConstant.ROUTE_KEY, routeList);
            logger.info("更新Redis中路由配置数据：{}条", routeList.size());
        }
        logger.info("初始化路由配置数据完毕");
    }
}

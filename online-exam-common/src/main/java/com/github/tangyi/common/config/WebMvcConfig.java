package com.github.tangyi.common.config;

import com.github.tangyi.common.resolver.TokenArgumentResolver;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.List;

/**
 * mvc配置
 *
 * @author tangyi
 * @date 2018-09-13-16:49
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {

    /**
     * 用于解析token
     * 要去掉@EnableWebMvc注解才生效
     *
     * @param argumentResolvers argumentResolvers
     * @author tangyi
     * @date 2018/9/13 15:31
     */
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(new TokenArgumentResolver());
    }

    /**
     * 解决集成swagger访问不了UI问题
     *
     * @param registry registry
     * @author tangyi
     * @date 2019/01/04 22:02
     */
    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations(
                "classpath:/static/");
        registry.addResourceHandler("swagger-ui.html").addResourceLocations(
                "classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations(
                "classpath:/META-INF/resources/webjars/");
        super.addResourceHandlers(registry);
    }
}

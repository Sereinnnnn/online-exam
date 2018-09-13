package com.github.tangyi.common.config;

import com.github.tangyi.common.resolver.TokenArgumentResolver;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
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
}

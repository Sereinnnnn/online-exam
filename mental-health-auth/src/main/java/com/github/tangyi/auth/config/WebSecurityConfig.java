package com.github.tangyi.auth.config;

import com.github.tangyi.common.config.FilterIgnorePropertiesConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;

/**
 * 安全配置
 *
 * @author tangyi
 * @date 2018-08-25-14:25
 */
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER - 1)
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private FilterIgnorePropertiesConfig filterIgnorePropertiesConfig;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry =
                http.formLogin().loginPage("/authentication/require")
                        .loginProcessingUrl("/authentication/form")
                        .and()
                        .authorizeRequests();
        // 开放配置的接口
        filterIgnorePropertiesConfig.getUrls().forEach(url -> registry.antMatchers(url).permitAll());
        registry.anyRequest().authenticated()
                .and()
                .csrf().disable();
    }
}

package com.github.tangyi.eureka.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

/**
 * 解决前端加载不到iframe问题
 *
 * @author tangyi
 * @date 2018-11-07 9:15
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // Configure HttpSecurity as needed (e.g. enable http basic).
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.NEVER);
        http.csrf().disable();
        // 为了可以使用 http://${user}:${password}@${host}:${port}/eureka/ 这种方式登录,所以必须是httpBasic
        http.authorizeRequests().anyRequest().authenticated().and().httpBasic();
        // 如果是form方式,不能使用url格式登录
        http.headers().frameOptions().disable();
    }
}

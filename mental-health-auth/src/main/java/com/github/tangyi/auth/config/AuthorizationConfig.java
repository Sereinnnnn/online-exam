package com.github.tangyi.auth.config;

import com.github.tangyi.auth.utils.UserDetailsImpl;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.constants.SecurityConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * 认证服务器配置
 *
 * @author tangyi
 * @date 2018-08-25-14:27
 */
@Order(Integer.MIN_VALUE)
@Configuration
@EnableAuthorizationServer
public class AuthorizationConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // 从数据库加载client
        JdbcClientDetailsService clientDetailsService = new JdbcClientDetailsService(dataSource);
        clientDetailsService.setSelectClientDetailsSql(SecurityConstant.DEFAULT_SELECT_STATEMENT);
        clientDetailsService.setFindClientDetailsSql(SecurityConstant.DEFAULT_FIND_STATEMENT);
        clients.withClientDetails(clientDetailsService);
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        // 配置token增强和JwtAccessToken转换器
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(tokenEnhancer(), jwtAccessTokenConverter()));
        endpoints
                // 将token存储到redis
                .tokenStore(redisTokenStore())
                // token增强
                .tokenEnhancer(tokenEnhancerChain)
                // 认证管理器
                .authenticationManager(authenticationManager)
                // refresh_token需要userDetailsService
                .reuseRefreshTokens(false)
                .userDetailsService(userDetailsService);
    }

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        security
                .allowFormAuthenticationForClients()
                .tokenKeyAccess("isAuthenticated()")
                .checkTokenAccess("permitAll()");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        ExamJwtAccessTokenConverter jwtAccessTokenConverter = new ExamJwtAccessTokenConverter();
//        将签名密钥设置为空字符串,避免在jwtTokenEnhancer bean创建时遇到HTTP 401错误
        jwtAccessTokenConverter.setSigningKey("");
        return jwtAccessTokenConverter;
    }

    @Bean
    public TokenStore redisTokenStore() {
        // redis存储token
        RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
        // exam前缀
        tokenStore.setPrefix(SecurityConstant.EXAM_PREFIX);
        return tokenStore;
    }

    @Bean
    public TokenEnhancer tokenEnhancer() {
        // token增强，增加license和用户信息
        return (accessToken, authentication) -> {
            final Map<String, Object> additionalInfo = new HashMap<>(2);
            additionalInfo.put("license", SecurityConstant.GITHUB_LICENSE);
            // 获取用户信息，包括角色信息，放入token
            UserDetailsImpl user = (UserDetailsImpl) authentication.getUserAuthentication().getPrincipal();
            if (user != null)
                additionalInfo.put("userId", user);
            ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
            return accessToken;
        };
    }
}

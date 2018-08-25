package com.github.tangyi.config;

import com.github.tangyi.common.constants.SecurityConstant;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import sun.security.util.SecurityConstants;

import java.util.Map;

/**
 * @author tangyi
 * @date 2018-08-25-14:41
 */
public class ExamJwtAccessTokenConverter extends JwtAccessTokenConverter {

    @Override
    public Map<String, ?> convertAccessToken(OAuth2AccessToken token, OAuth2Authentication authentication) {
        Map<String, Object> representation = (Map<String, Object>) super.convertAccessToken(token, authentication);
        representation.put("license", SecurityConstant.GITHUB_LICENSE);
        return representation;
    }

    @Override
    public OAuth2AccessToken extractAccessToken(String value, Map<String, ?> map) {
        return super.extractAccessToken(value, map);
    }

    @Override
    public OAuth2Authentication extractAuthentication(Map<String, ?> map) {
        return super.extractAuthentication(map);
    }
}

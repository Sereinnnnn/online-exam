package com.github.tangyi.gateway.filter;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.gateway.constants.GateWayConstant;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import com.xiaoleilu.hutool.collection.CollectionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * @author tangyi
 * @date 2018-08-27-8:48
 */
@Component
public class AccessFilter extends ZuulFilter {

    private static final Logger logger = LoggerFactory.getLogger(AccessFilter.class);

    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return FilterConstants.FORM_BODY_WRAPPER_FILTER_ORDER - 1;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    /**
     * 增加用户、角色头
     *
     * @return Object
     */
    @Override
    public Object run() throws ZuulException {
        RequestContext requestContext = RequestContext.getCurrentContext();
        requestContext.set(GateWayConstant.START_TIME, System.currentTimeMillis());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            RequestContext currentContext = RequestContext.getCurrentContext();
            String username = authentication.getName(),
                    authorities = CollectionUtil.join(authentication.getAuthorities(), ",");
            logger.debug("username:{}, authorities:{}", username, authorities);
            currentContext.addZuulRequestHeader(SecurityConstant.USER_HEADER, username);
            currentContext.addZuulRequestHeader(SecurityConstant.ROLE_HEADER, authorities);
        }
        return null;
    }
}

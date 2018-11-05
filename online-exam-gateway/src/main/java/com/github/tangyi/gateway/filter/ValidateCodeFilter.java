package com.github.tangyi.gateway.filter;

import com.alibaba.fastjson.JSONObject;
import com.github.tangyi.common.config.FilterIgnorePropertiesConfig;
import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.exception.ValidateCodeException;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import com.xiaoleilu.hutool.collection.CollUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;

/**
 * @author tangyi
 * @date 2018-11-05 13:45
 */
@Configuration
@ConditionalOnProperty(value = "security.validate.code", havingValue = "true")
public class ValidateCodeFilter extends ZuulFilter {

    private static final Logger logger = LoggerFactory.getLogger(ValidateCodeFilter.class);

    private static final String EXPIRED_ERROR = "验证码已过期，请重新获取";

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private FilterIgnorePropertiesConfig filterIgnorePropertiesConfig;

    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return FilterConstants.SEND_ERROR_FILTER_ORDER + 1;
    }

    /**
     * 是否校验验证码
     *
     * @return boolean
     */
    @Override
    public boolean shouldFilter() {
        HttpServletRequest request = RequestContext.getCurrentContext().getRequest();
        if (!StrUtil.containsAnyIgnoreCase(request.getRequestURI(), SecurityConstant.OAUTH_TOKEN_URL, SecurityConstant.MOBILE_TOKEN_URL))
            return false;
        try {
            if (CollUtil.containsAny(filterIgnorePropertiesConfig.getClients(), Arrays.asList(SysUtil.extractAndDecodeHeader(request)))) {
                return false;
            }
        } catch (IOException e) {
            logger.error("解析client信息失败", e);
        }
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        try {
            // 校验验证码
            checkCode(RequestContext.getCurrentContext().getRequest());
        } catch (ValidateCodeException e) {
            RequestContext ctx = RequestContext.getCurrentContext();
            ReturnT<String> result = new ReturnT<>(e);
            result.setCode(478);
            ctx.setResponseStatusCode(478);
            ctx.setSendZuulResponse(false);
            ctx.getResponse().setContentType("application/json;charset=UTF-8");
            ctx.setResponseBody(JSONObject.toJSONString(result));
        }
        return null;
    }

    /**
     * 校验验证码
     *
     * @param httpServletRequest httpServletRequest
     * @throws ValidateCodeException
     */
    private void checkCode(HttpServletRequest httpServletRequest) throws ValidateCodeException {
        String code = httpServletRequest.getParameter("code");
        if (StrUtil.isBlank(code))
            throw new ValidateCodeException("请输入验证码");
        String randomStr = httpServletRequest.getParameter("randomStr");
        if (StrUtil.isBlank(randomStr))
            randomStr = httpServletRequest.getParameter("mobile");
        String key = SecurityConstant.DEFAULT_CODE_KEY + randomStr;
        if (!redisTemplate.hasKey(key))
            throw new ValidateCodeException(EXPIRED_ERROR);
        Object codeObj = redisTemplate.opsForValue().get(key);
        if (codeObj == null)
            throw new ValidateCodeException(EXPIRED_ERROR);
        String saveCode = codeObj.toString();
        if (StrUtil.isBlank(saveCode)) {
            redisTemplate.delete(key);
            throw new ValidateCodeException(EXPIRED_ERROR);
        }
        if (!StrUtil.equals(saveCode, code)) {
            redisTemplate.delete(key);
            throw new ValidateCodeException("验证码错误，请重新输入");
        }
        redisTemplate.delete(key);
    }
}

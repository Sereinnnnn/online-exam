package com.github.tangyi.gateway.filter;

import com.github.tangyi.common.constants.SecurityConstant;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.xiaoleilu.hutool.codec.Base64;
import com.xiaoleilu.hutool.collection.CollUtil;
import com.xiaoleilu.hutool.util.CharsetUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.context.annotation.Configuration;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 解码前端传过来的密码
 *
 * @author tangyi
 * @date 2018-09-12-20:22
 */
@Configuration
@ConditionalOnProperty(value = "security.encode.key")
public class DecodePasswordFilter extends ZuulFilter {

    private static final Logger logger = LoggerFactory.getLogger(DecodePasswordFilter.class);

    private static final String PASSWORD = "password";

    private static final String KEY_ALGORITHM = "AES";

    private static final String DEFAULT_CIPHER_ALGORITHM = "AES/CBC/NOPadding";

    /**
     * 约定的key
     */
    @Value("${security.encode.key}")
    private String key;

    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return FilterConstants.SEND_ERROR_FILTER_ORDER + 2;
    }

    @Override
    public boolean shouldFilter() {
        HttpServletRequest request = RequestContext.getCurrentContext().getRequest();
        return StrUtil.containsAnyIgnoreCase(request.getRequestURI(),
                SecurityConstant.OAUTH_TOKEN_URL, SecurityConstant.MOBILE_TOKEN_URL);
    }

    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        Map<String, List<String>> params = ctx.getRequestQueryParams();
        if (params == null)
            return null;
        List<String> passList = params.get(PASSWORD);
        if (CollUtil.isEmpty(passList))
            return null;
        String password = passList.get(0);
        if (StrUtil.isNotBlank(password)) {
            try {
                password = decryptAES(password, key);
            } catch (Exception e) {
                logger.error("密码解密失败:{}", password);
            }
            params.put(PASSWORD, CollUtil.newArrayList(password.trim()));
        }
        ctx.setRequestQueryParams(params);
        return null;
    }

    private static String decryptAES(String data, String pass) throws Exception {
        Cipher cipher = Cipher.getInstance(DEFAULT_CIPHER_ALGORITHM);
        SecretKeySpec keyspec = new SecretKeySpec(pass.getBytes(), KEY_ALGORITHM);
        IvParameterSpec ivspec = new IvParameterSpec(pass.getBytes());
        cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
        byte[] result = cipher.doFinal(Base64.decode(data.getBytes(CharsetUtil.UTF_8)));
        return new String(result, CharsetUtil.UTF_8);
    }
}

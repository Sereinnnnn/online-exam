package com.github.tangyi.common.resolver;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.vo.Role;
import com.github.tangyi.common.vo.UserVo;
import com.xiaoleilu.hutool.util.StrUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 解析token
 *
 * @author tangyi
 * @date 2018-09-12-22:05
 */
@Configuration
public class TokenArgumentResolver implements HandlerMethodArgumentResolver {

    private static final Logger logger = LoggerFactory.getLogger(TokenArgumentResolver.class);

    /**
     * 传入的参数是UserVo类型时才做解析
     *
     * @param methodParameter methodParameter
     * @return boolean
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.getParameterType().equals(UserVo.class);
    }

    /**
     * 解析token
     *
     * @param methodParameter       methodParameter
     * @param modelAndViewContainer modelAndViewContainer
     * @param nativeWebRequest      nativeWebRequest
     * @param webDataBinderFactory  webDataBinderFactory
     * @return Object
     * @throws Exception
     */
    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
        String username = request.getHeader(SecurityConstant.USER_HEADER),
                roles = request.getHeader(SecurityConstant.ROLE_HEADER);
        if (StrUtil.isBlank(username) || StrUtil.isBlank(roles)) {
            logger.warn("username or role is empty");
            return null;
        }
        logger.info("username :{} roles:{}", username, roles);
        UserVo userVo = new UserVo();
        userVo.setUsername(username);
        List<Role> roleList = new ArrayList<>();
        Arrays.stream(roles.split(",")).forEach(roleString -> {
            Role role = new Role();
            role.setRoleName(roleString);
            roleList.add(role);
        });
        userVo.setRoleList(roleList);
        return userVo;
    }
}

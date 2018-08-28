package com.github.tangyi.gateway.service.impl;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.vo.MenuVo;
import com.github.tangyi.gateway.feign.MenuService;
import com.github.tangyi.gateway.service.PermissionService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 权限服务实现
 *
 * @author tangyi
 * @date 2018-08-28-20:36
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    private static final Logger logger = LoggerFactory.getLogger(PermissionServiceImpl.class);

    @Autowired
    private MenuService menuService;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    /**
     * 检查是否有权限
     *
     * @param request        request
     * @param authentication authentication
     * @return boolean
     * @author tangyi
     * @date 2018/8/28 20:47
     */
    @Override
    @SuppressWarnings("unchecked")
    public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
        List<SimpleGrantedAuthority> grantedAuthorities = (List<SimpleGrantedAuthority>) authentication.getAuthorities();
        if (authentication.getPrincipal() != null) {
            if (CollectionUtils.isEmpty(grantedAuthorities)) {
                logger.warn("{}的角色为空！", authentication.getPrincipal());
                return false;
            }
            // 获取权限
            Set<MenuVo> urls = new HashSet<>();
            for (SimpleGrantedAuthority grantedAuthority : grantedAuthorities) {
                if (!SecurityConstant.BASE_ROLE.equals(grantedAuthority.getAuthority())) {
                    Set<MenuVo> menuVoSet = menuService.findMenuByRole(grantedAuthority.getAuthority());
                    if (CollectionUtils.isNotEmpty(menuVoSet))
                        urls.addAll(menuVoSet);
                }
            }
            // 检查是否有权限
            for (MenuVo menuVo : urls) {
                if (StringUtils.isNotBlank(menuVo.getUrl())
                        && antPathMatcher.match(menuVo.getUrl(), request.getRequestURI())) {
                    return true;
                }
            }
        }
        return false;
    }
}

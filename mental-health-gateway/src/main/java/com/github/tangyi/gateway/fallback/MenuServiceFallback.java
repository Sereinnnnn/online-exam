package com.github.tangyi.gateway.fallback;

import com.github.tangyi.common.vo.MenuVo;
import com.github.tangyi.gateway.feign.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * 菜单服务熔断
 *
 * @author tangyi
 * @date 2018-08-28-20:38
 */
@Service
public class MenuServiceFallback implements MenuService {

    private static final Logger logger = LoggerFactory.getLogger(MenuServiceFallback.class);

    @Override
    public Set<MenuVo> findMenuByRole(String role) {
        logger.error("调用{}异常{}", "findMenuByRole", role);
        return new HashSet<>();
    }
}

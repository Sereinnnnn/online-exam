package com.github.tangyi.gateway.feign;

import com.github.tangyi.common.vo.MenuVo;
import com.github.tangyi.gateway.fallback.MenuServiceFallback;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Set;

/**
 * @author tangyi
 * @date 2018-08-28-20:37
 */
@FeignClient(name = "online-exam-user", fallback = MenuServiceFallback.class)
public interface MenuService {

    /**
     * 根据角色查询菜单
     *
     * @param role
     * @return Set
     * @author tangyi
     * @date 2018/8/28 20:39
     */
    @GetMapping(value = "/menu/findMenuByRole/{role}")
    Set<MenuVo> findMenuByRole(@PathVariable("role") String role);
}

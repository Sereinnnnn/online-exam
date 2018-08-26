package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.MenuMapper;
import com.github.tangyi.user.module.SysMenu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 菜单service
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:45
 */
@Service
@Transactional(readOnly = true)
public class SysMenuService extends CrudService<MenuMapper, SysMenu> {
}

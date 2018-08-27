package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.RoleMenuMapper;
import com.github.tangyi.user.module.RoleMenu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author tangyi
 * @date 2018/8/26 0026 22:47
 */
@Service
@Transactional(readOnly = true)
public class RoleMenuService extends CrudService<RoleMenuMapper, RoleMenu> {
}

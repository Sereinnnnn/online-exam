package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.RoleMapper;
import com.github.tangyi.user.module.Role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 角色service
 *
 * @author tangyi
 * @date 2018/8/26 0026 14:16
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends CrudService<RoleMapper, Role> {

}

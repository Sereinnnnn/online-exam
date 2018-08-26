package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.user.module.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色菜单mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:34
 */
@Mapper
public interface RoleMenuMapper extends CrudDao<SysRoleMenu> {
}

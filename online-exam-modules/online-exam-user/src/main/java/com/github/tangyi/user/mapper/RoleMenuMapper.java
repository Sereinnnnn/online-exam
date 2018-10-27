package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.RoleMenu;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色菜单mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:34
 */
@Mapper
public interface RoleMenuMapper extends CrudMapper<RoleMenu> {

    /**
     * 根据角色ID删除
     * @param roleId 角色ID
     * @return int
     */
    int deleteByRoleId(String roleId);

    /**
     * 根据菜单ID删除
     * @param menuId 菜单ID
     * @return int
     */
    int deleteByMenuId(String menuId);
}

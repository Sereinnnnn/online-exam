package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.user.mapper.RoleMenuMapper;
import com.github.tangyi.user.module.Role;
import com.github.tangyi.user.module.RoleMenu;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author tangyi
 * @date 2018/8/26 0026 22:47
 */
@Service
@Transactional(readOnly = true)
public class RoleMenuService extends CrudService<RoleMenuMapper, RoleMenu> {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    /**
     * @param role  role
     * @param menus 菜单ID集合
     * @return int
     * @author tangyi
     * @date 2018/10/28 0028 下午 2:29
     */
    @Transactional
    public int saveRoleMenus(Role role, List<String> menus) {
        int update = -1;
        if (CollectionUtils.isNotEmpty(menus)) {
            // 删除旧的管理数据
            roleMenuMapper.deleteByRoleId(role.getId());
            for (String menuId : menus) {
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setId(IdGen.uuid());
                roleMenu.setRoleId(role.getId());
                roleMenu.setMenuId(menuId);
                // 重新插入
                update += roleMenuMapper.insert(roleMenu);
            }
        }
        return update;
    }
}

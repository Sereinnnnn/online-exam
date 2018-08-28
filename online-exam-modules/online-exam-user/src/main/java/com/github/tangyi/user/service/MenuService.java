package com.github.tangyi.user.service;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.MenuMapper;
import com.github.tangyi.user.module.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 菜单service
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:45
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends CrudService<MenuMapper, Menu> {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 根据角色查找菜单
     *
     * @param role 角色
     * @return List
     * @author tangyi
     * @date 2018/8/27 16:00
     */
    public List<Menu> findMenuByRole(String role) {
        return menuMapper.findByRole(role);
    }

    /**
     * 删除菜单
     *
     * @param menu menu
     * @return int
     * @author tangyi
     * @date 2018/8/27 16:22
     */
    @Override
    @Transactional
    public int delete(Menu menu) {
        // 删除当前菜单
        super.delete(menu);
        // 删除父节点为当前节点的菜单
        Menu parentMenu = new Menu();
        parentMenu.setParentId(menu.getId());
        parentMenu.setNewRecord(false);
        parentMenu.setCommonValue("", "");
        parentMenu.setDelFlag(CommonConstant.DEL_FLAG_DEL);
        return super.update(parentMenu);
    }
}

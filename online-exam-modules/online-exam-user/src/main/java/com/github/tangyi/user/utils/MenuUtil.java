package com.github.tangyi.user.utils;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.user.constants.MenuConstant;
import com.github.tangyi.user.module.Menu;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单工具类
 *
 * @author tangyi
 * @date 2018/10/28 0028 15:57
 */
public class MenuUtil {

    /**
     * 增删改查权限
     *
     * @param menu menu
     * @return List
     * @author tangyi
     * @date 2018/10/28 0028 下午 3:59
     */
    public static List<Menu> initMenuPermission(Menu menu) {
        List<Menu> menus = new ArrayList<>();
        // 新增权限
        Menu add = new Menu();
        add.setCommonValue(menu.getCreator(), menu.getApplicationCode());
        add.setParentId(menu.getId());
        add.setName(MenuConstant.PERMISSION_ADD);
        add.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_ADD);
        add.setSort(CommonConstant.DEFAULT_SORT);
        add.setType(MenuConstant.MENU_TYPE_PERMISSION);

        // 删除权限
        Menu del = new Menu();
        del.setCommonValue(menu.getCreator(), menu.getApplicationCode());
        del.setParentId(menu.getId());
        del.setName(MenuConstant.PERMISSION_DELETE);
        del.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_DELETE);
        del.setSort(CommonConstant.DEFAULT_SORT);
        del.setType(MenuConstant.MENU_TYPE_PERMISSION);

        // 修改权限
        Menu modify = new Menu();
        modify.setCommonValue(menu.getCreator(), menu.getApplicationCode());
        modify.setParentId(menu.getId());
        modify.setName(MenuConstant.PERMISSION_MODIFY);
        modify.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_MODIFY);
        modify.setSort(CommonConstant.DEFAULT_SORT);
        modify.setType(MenuConstant.MENU_TYPE_PERMISSION);

        // 查询权限
        Menu query = new Menu();
        query.setCommonValue(menu.getCreator(), menu.getApplicationCode());
        query.setParentId(menu.getId());
        query.setName(MenuConstant.PERMISSION_QUERY);
        query.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_QUERY);
        query.setSort(CommonConstant.DEFAULT_SORT);
        query.setType(MenuConstant.MENU_TYPE_PERMISSION);

        menus.add(add);
        menus.add(del);
        menus.add(modify);
        menus.add(query);
        return menus;
    }
}

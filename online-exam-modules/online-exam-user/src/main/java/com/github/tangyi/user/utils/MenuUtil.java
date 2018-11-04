package com.github.tangyi.user.utils;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.utils.SysUtil;
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
        add.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        add.setParentId(menu.getId());
        add.setName(MenuConstant.PERMISSION_ADD);
        add.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_ADD);
        add.setSort(CommonConstant.DEFAULT_SORT);
        add.setType(MenuConstant.MENU_TYPE_PERMISSION);

        // 删除权限
        Menu del = new Menu();
        del.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        del.setParentId(menu.getId());
        del.setName(MenuConstant.PERMISSION_DELETE);
        del.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_DELETE);
        del.setSort(CommonConstant.DEFAULT_SORT);
        del.setType(MenuConstant.MENU_TYPE_PERMISSION);

        // 修改权限
        Menu edit = new Menu();
        edit.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        edit.setParentId(menu.getId());
        edit.setName(MenuConstant.PERMISSION_MODIFY);
        edit.setPermission(menu.getPermission() + MenuConstant.PERMISSION_SUFFIX_MODIFY);
        edit.setSort(CommonConstant.DEFAULT_SORT);
        edit.setType(MenuConstant.MENU_TYPE_PERMISSION);

        menus.add(add);
        menus.add(del);
        menus.add(edit);
        return menus;
    }
}

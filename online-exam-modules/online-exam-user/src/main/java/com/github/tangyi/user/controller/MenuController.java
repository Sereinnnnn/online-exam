package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.MenuUtil;
import com.github.tangyi.user.dto.MenuDto;
import com.github.tangyi.user.module.Menu;
import com.github.tangyi.user.service.MenuService;
import com.xiaoleilu.hutool.collection.CollUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 菜单controller
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:48
 */
@RestController
@RequestMapping("/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;

    /**
     * 返回当前用户的树形菜单集合
     *
     * @return 当前用户的树形菜单
     */
    @GetMapping(value = "/userMenu")
    public List<MenuDto> userMenu() {
        // 查询菜单
        Set<Menu> menuSet = new HashSet<Menu>();
        getRole().forEach(roleName -> menuSet.addAll(menuService.findMenuByRole(roleName)));
        List<MenuDto> menuTreeList = new ArrayList<MenuDto>();
        menuSet.forEach(menuVo -> {
            if (CommonConstant.MENU.equals(menuVo.getType())) {
                menuTreeList.add(new MenuDto(menuVo));
            }
        });
        CollUtil.sort(menuTreeList, Comparator.comparingInt(MenuDto::getSort));
        return MenuUtil.build(menuTreeList, "-1");
    }

    /**
     * 返回树形菜单集合
     *
     * @return 树形菜单集合
     */
    @GetMapping(value = "/menus")
    public List<MenuDto> menus() {
        // 查询所有菜单
        Set<Menu> menuSet = new HashSet<Menu>(menuService.findList(new Menu()));
        List<MenuDto> menuTreeList = new ArrayList<MenuDto>();
        menuSet.forEach(menuVo -> {
            menuTreeList.add(new MenuDto(menuVo));
        });
        // 排序
        CollUtil.sort(menuTreeList, Comparator.comparingInt(MenuDto::getSort));
        return MenuUtil.build(menuTreeList, "-1");
    }

    /**
     * 新增菜单
     *
     * @param menu menu
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/27 16:12
     */
    @PostMapping
    public ReturnT<Boolean> addMenu(@RequestBody Menu menu) {
        menu.setCommonValue("", "");
        return new ReturnT<>(menuService.insert(menu) > 0);
    }

    /**
     * 更新菜单
     *
     * @param menu menu
     * @return ReturnT
     * @author tangyi
     * @date 2018/10/24 16:34
     */
    @PutMapping
    public ReturnT<Boolean> updateMenu(@RequestBody Menu menu) {
        menu.setCommonValue("", "");
        return new ReturnT<>(menuService.update(menu) > 0);
    }

    /**
     * 根据id删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/27 16:19
     */
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteMenu(@PathVariable String id) {
        Menu menu = new Menu();
        menu.setId(id);
        return new ReturnT<>(menuService.delete(menu) > 0);
    }

    /**
     * 根据id查询菜单
     *
     * @param id
     * @return Menu
     * @author tangyi
     * @date 2018/8/27 16:11
     */
    @GetMapping("/{id}")
    public Menu menu(@PathVariable String id) {
        Menu menu = new Menu();
        menu.setId(id);
        return menuService.get(menu);
    }

    /**
     * 获取菜单分页列表
     *
     * @param params params
     * @param Menu   Menu
     * @return PageInfo
     * @author tangyi
     * @date 2018/8/26 0026 下午 11:17
     */
    @RequestMapping("/menuList")
    public PageInfo<Menu> menuList(@RequestParam Map<String, String> params, Menu Menu) {
        PageInfo<Menu> page = new PageInfo<Menu>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return menuService.findPage(page, Menu);
    }

    /**
     * 根据角色查找菜单
     *
     * @param role 角色
     * @return List
     * @author tangyi
     * @date 2018/8/27 15:58
     */
    @GetMapping("findMenuByRole/{role}")
    public List<Menu> findMenuByRole(@PathVariable String role) {
        return menuService.findMenuByRole(role);
    }
}

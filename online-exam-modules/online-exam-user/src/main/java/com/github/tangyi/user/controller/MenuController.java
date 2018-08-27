package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.Menu;
import com.github.tangyi.user.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
     * 新增菜单
     *
     * @param menu menu
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/27 16:12
     */
    @PostMapping
    public ReturnT<Boolean> menu(@RequestBody Menu menu) {
        return new ReturnT<>(menuService.insert(menu) > 0);
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

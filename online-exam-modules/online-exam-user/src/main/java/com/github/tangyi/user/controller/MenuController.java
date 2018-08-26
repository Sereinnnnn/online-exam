package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.SysMenu;
import com.github.tangyi.user.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
    private SysMenuService menuService;

    /**
     * 获取菜单分页列表
     *
     * @param params  params
     * @param sysMenu SysMenu
     * @return PageInfo
     * @author tangyi
     * @date 2018/8/26 0026 下午 11:17
     */
    @RequestMapping("/menuList")
    public PageInfo<SysMenu> menuList(@RequestParam Map<String, String> params, SysMenu sysMenu) {
        PageInfo<SysMenu> page = new PageInfo<SysMenu>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return menuService.findPage(page, sysMenu);
    }
}

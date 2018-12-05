package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.dto.MenuDto;
import com.github.tangyi.user.module.Menu;
import com.github.tangyi.user.service.LogService;
import com.github.tangyi.user.service.MenuService;
import com.github.tangyi.user.utils.MenuUtil;
import com.google.common.net.HttpHeaders;
import com.xiaoleilu.hutool.collection.CollUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 菜单controller
 *
 * @author tangyi
 * @date 2018/8/26 22:48
 */
@RestController
@RequestMapping("/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private LogService logService;

    /**
     * 返回当前用户的树形菜单集合
     *
     * @return 当前用户的树形菜单
     */
    @GetMapping(value = "/userMenu")
    public List<MenuDto> userMenu() {
        // 查询菜单
        Set<Menu> menuSet = new HashSet<Menu>();
        getRole().forEach(roleName -> {
            // 获取角色的菜单
            List<Menu> menus = menuService.findMenuByRole(roleName);
            if (CollectionUtils.isNotEmpty(menus)) {
                menus.forEach(menu -> {
                    // 检查是否已经存在
                    boolean exist = false;
                    for (Menu existMenu : menuSet) {
                        if (existMenu.getId().equals(menu.getId()) && !exist)
                            exist = true;
                    }
                    // 不存在
                    if (!exist)
                        menuSet.add(menu);

                });
            }
        });
        List<MenuDto> menuTreeList = new ArrayList<MenuDto>();
        menuSet.forEach(menuVo -> {
            if (CommonConstant.MENU.equals(menuVo.getType())) {
                menuTreeList.add(new MenuDto(menuVo));
            }
        });
        CollUtil.sort(menuTreeList, Comparator.comparingInt(MenuDto::getSort));
        return TreeUtil.buildTree(menuTreeList, "-1");
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
        menuSet.forEach(menuVo -> menuTreeList.add(new MenuDto(menuVo)));
        // 排序
        CollUtil.sort(menuTreeList, Comparator.comparingInt(MenuDto::getSort));
        return TreeUtil.buildTree(menuTreeList, "-1");
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
        menu.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
        menu.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
     * @date 2018/8/26 23:17
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

    /**
     * 根据角色查找菜单
     *
     * @param roleCode 角色code
     * @return 属性集合
     */
    @GetMapping("/roleTree/{roleCode}")
    public List<String> roleTree(@PathVariable String roleCode) {
        List<Menu> menus = menuService.findMenuByRole(roleCode);
        List<String> menuList = new ArrayList<>();
        menus.forEach(menu -> menuList.add(menu.getId()));
        return menuList;
    }

    /**
     * 导出菜单
     *
     * @param ids 用户id，多个用逗号分隔
     * @author tangyi
     * @date 2018/11/28 12:46
     */
    @GetMapping("/export")
    public void exportMenu(String ids, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "菜单信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<Menu> menus = new ArrayList<>();
            // 导出所有
            if (StringUtils.isEmpty(ids)) {
                Menu menu = new Menu();
                menus = menuService.findList(menu);
            } else {    // 导出选中
                for (String id : ids.split(",")) {
                    Menu menu = new Menu();
                    menu.setId(id);
                    menu = menuService.get(menu);
                    if (menu != null)
                        menus.add(menu);
                }
            }
            ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(menus), MenuUtil.getMenuMap());
        } catch (Exception e) {
            logger.error("导出菜单数据失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "导出菜单"));
        }
    }

    /**
     * 导入数据
     *
     * @param file file
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/28 12:51
     */
    @RequestMapping("import")
    public ReturnT<Boolean> importMenu(MultipartFile file, HttpServletRequest request) {
        try {
            logger.debug("开始导入菜单数据");
            List<Menu> menus = MapUtil.map2Java(Menu.class,
                    ExcelToolUtil.importExcel(file.getInputStream(), MenuUtil.getMenuMap()));
            if (CollectionUtils.isNotEmpty(menus)) {
                for (Menu menu : menus) {
                    if (menuService.update(menu) < 1)
                        menuService.insert(menu);
                }
            }
            return new ReturnT<>(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入菜单数据失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "导入菜单"));
        }
        return new ReturnT<>(Boolean.FALSE);
    }
}

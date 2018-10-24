package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.Role;
import com.github.tangyi.user.service.RoleMenuService;
import com.github.tangyi.user.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 角色controller
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:50
 */
@RestController
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private RoleMenuService roleMenuService;

    /**
     * 根据id获取角色
     *
     * @param id id
     * @return Role
     * @author tangyi
     * @date 2018/9/14 18:20
     */
    @GetMapping("/{id}")
    public Role role(@PathVariable String id) {
        try {
            return roleService.get(id);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return new Role();
    }

    /**
     * 角色分页查询
     *
     * @param params params
     * @param role   role
     * @return PageInfo
     * @author tangyi
     * @date 2018/10/24 0024 下午 10:13
     */
    @RequestMapping("roleList")
    public PageInfo<Role> userList(@RequestParam Map<String, String> params, Role role) {
        PageInfo<Role> page = new PageInfo<Role>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return roleService.findPage(page, role);
    }

    /**
     * 修改角色
     *
     * @param role role
     * @return ReturnT
     * @author tangyi
     * @date 2018/9/14 18:22
     */
    @PutMapping
    public ReturnT<Boolean> role(@RequestBody Role role) {
        return new ReturnT<>(roleService.update(role) > 0);
    }

    /**
     * 创建角色
     *
     * @param role role
     * @return ReturnT
     * @author tangyi
     * @date 2018/9/14 18:23
     */
    @PostMapping
    public ReturnT<Boolean> updateRole(@RequestBody Role role) {
        role.setCommonValue(getUser(), "");
        return new ReturnT<>(roleService.insert(role) > 0);
    }

    /**
     * 根据id删除角色
     *
     * @param id id
     * @return Role
     * @author tangyi
     * @date 2018/9/14 18:24
     */
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteRole(@PathVariable String id) {
        Role role = new Role();
        role.setId(id);
        return new ReturnT<>(roleService.delete(role) > 0);
    }
}

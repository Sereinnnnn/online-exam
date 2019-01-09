package com.github.tangyi.user.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.Dept;
import com.github.tangyi.user.module.Role;
import com.github.tangyi.user.module.RoleDept;
import com.github.tangyi.user.service.DeptService;
import com.github.tangyi.user.service.RoleDeptService;
import com.github.tangyi.user.service.RoleMenuService;
import com.github.tangyi.user.service.RoleService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

    @Autowired
    private RoleDeptService roleDeptService;

    @Autowired
    private DeptService deptService;

    /**
     * 根据id获取角色
     *
     * @param id id
     * @return Role
     * @author tangyi
     * @date 2018/9/14 18:20
     */
    @ApiOperation(value = "获取角色信息", notes = "根据角色id获取角色详细信息")
    @ApiImplicitParam(name = "id", value = "角色ID", required = true, dataType = "String", paramType = "path")
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
    @ApiOperation(value = "获取角色列表")
    @RequestMapping("roleList")
    public PageInfo<Role> userList(@RequestParam Map<String, String> params, Role role) {
        PageInfo<Role> page = new PageInfo<Role>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
        // 查询所属部门
        PageInfo<Role> pageInfo = roleService.findPage(page, role);
        if (CollectionUtils.isNotEmpty(pageInfo.getList())) {
            pageInfo.getList().forEach(tempRole -> {
                RoleDept roleDept = new RoleDept();
                roleDept.setRoleId(tempRole.getId());
                // 查询角色部门关系
                roleDept = roleDeptService.get(roleDept);
                if (roleDept != null) {
                    // 查询部门信息
                    Dept dept = new Dept();
                    dept.setId(roleDept.getDeptId());
                    dept = deptService.get(dept);
                    // 设置角色所属部门ID和名称
                    if (dept != null) {
                        tempRole.setDeptId(roleDept.getDeptId());
                        tempRole.setDeptName(dept.getDeptName());
                    }
                }
            });
        }
        return pageInfo;
    }

    /**
     * 根据部门ID获取角色
     *
     * @param deptId 部门ID
     * @return List
     */
    @ApiOperation(value = "获取角色信息", notes = "根据部门id获取角色详细信息")
    @ApiImplicitParam(name = "deptId", value = "部门ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/roleList/{deptId}")
    public List<Role> roleList(@PathVariable String deptId) {
        List<Role> roles = new ArrayList<>();
        if (StringUtils.isNotBlank(deptId)) {
            // 获取角色部门关系
            List<RoleDept> roleDepts = roleDeptService.getRoleByDeptId(deptId);
            // 遍历
            if (CollectionUtils.isNotEmpty(roleDepts)) {
                roleDepts.forEach(roleDept -> {
                    Role role = new Role();
                    role.setId(roleDept.getRoleId());
                    // 查询部门信息
                    role = roleService.get(role);
                    if (role != null)
                        roles.add(role);
                });
            }
        }
        return roles;

    }

    /**
     * 修改角色
     *
     * @param role role
     * @return ReturnT
     * @author tangyi
     * @date 2018/9/14 18:22
     */
    @ApiOperation(value = "更新角色信息", notes = "根据角色id更新角色的基本信息")
    @ApiImplicitParam(name = "role", value = "角色实体role", required = true, dataType = "Role")
    @PutMapping
    public ReturnT<Boolean> updateRole(@RequestBody Role role) {
        role.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(roleService.update(role) > 0);
    }

    /**
     * 更新角色菜单
     *
     * @param role role
     * @return ReturnT
     * @author tangyi
     * @date 2018/10/28 下午 2:20
     */
    @PutMapping("roleMenuUpdate")
    public ReturnT<Boolean> updateRoleMenu(@RequestBody Role role) {
        boolean success = false;
        String deptId = role.getDeptId();
        if (StringUtils.isNotBlank(role.getId())) {
            role = roleService.get(role);
            // 保存角色菜单关系
            if (role != null && StringUtils.isNotBlank(deptId))
                success = roleMenuService.saveRoleMenus(role.getId(), Arrays.asList(deptId.split(","))) > 0;
        }
        return new ReturnT<>(success);
    }

    /**
     * 创建角色
     *
     * @param role role
     * @return ReturnT
     * @author tangyi
     * @date 2018/9/14 18:23
     */
    @ApiOperation(value = "创建角色", notes = "创建角色")
    @ApiImplicitParam(name = "role", value = "角色实体role", required = true, dataType = "Role")
    @PostMapping
    public ReturnT<Boolean> role(@RequestBody Role role) {
        role.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
    @ApiOperation(value = "删除角色", notes = "根据ID删除角色")
    @ApiImplicitParam(name = "id", value = "角色ID", required = true, paramType = "path")
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteRole(@PathVariable String id) {
        Role role = new Role();
        role.setId(id);
        role.setNewRecord(false);
        role.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(roleService.delete(role) > 0);
    }

    /**
     * 批量删除
     *
     * @param idMap idMap
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 10:00
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllRoles(@RequestBody Map<String, String> idMap) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(idMap.get("ids")))
                success = roleService.deleteAll(idMap.get("ids").split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除角色失败！", e);
        }
        return new ReturnT<>(success);
    }
}

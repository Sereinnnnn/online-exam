package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.dto.UserInfoDto;
import com.github.tangyi.user.module.*;
import com.github.tangyi.user.service.*;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author tangyi
 * @date 2018-08-25-16:20
 */
@RestController
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private static final PasswordEncoder encoder = new BCryptPasswordEncoder();

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private UserDeptService userDeptService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private RoleService roleService;

    /**
     * 根据id获取
     *
     * @param id id
     * @return ReturnT
     */
    @GetMapping("/{id}")
    public ReturnT<User> user(@PathVariable String id) {
        User user = new User();
        if (StringUtils.isNotEmpty(id)) {
            user.setId(id);
            user = userService.get(user);
        }
        return new ReturnT<>(user);
    }

    /**
     * 获取当前用户信息（角色、权限）
     *
     * @param userVo 当前用户信息
     * @return 用户名
     */
    @GetMapping("/info")
    public ReturnT<UserInfoDto> user(UserVo userVo) {
        return new ReturnT<>(userService.findUserInfo(userVo));
    }

    /**
     * 根据用户名获取用户
     *
     * @param username
     * @return
     */
    @GetMapping("/findUserByUsername/{username}")
    public UserVo findUserByUsername(@PathVariable String username) {
        return userService.selectUserVoByUsername(username);
    }

    /**
     * 获取分页数据
     *
     * @param params params
     * @param userVo userVo
     * @return PageInfo
     * @author tangyi
     * @date 2018/8/26 0026 下午 10:56
     */
    @RequestMapping("userList")
    public PageInfo<User> userList(@RequestParam Map<String, String> params, UserVo userVo) {
        PageInfo<User> page = new PageInfo<User>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        User user = new User();
        BeanUtils.copyProperties(userVo, user);
        // 用户名查询条件
        user.setUsername(params.getOrDefault("username", ""));
        page = userService.findPage(page, user);
        if (CollectionUtils.isNotEmpty(page.getList())) {
            page.getList().forEach(tempUser -> {
                // 查询用户部门关系
                UserDept userDept = userDeptService.getDeptByUserId(tempUser.getId());
                if (userDept != null) {
                    Dept dept = new Dept();
                    dept.setId(userDept.getDeptId());
                    // 查询部门信息
                    dept = deptService.get(dept);
                    if (dept != null) {
                        tempUser.setDeptName(dept.getDeptName());
                        tempUser.setDeptId(dept.getId());
                    }
                }

                // 查询用户角色关系
                List<UserRole> userRoles = userRoleService.getByUserId(tempUser.getId());
                if (CollectionUtils.isNotEmpty(userRoles)) {
                    userRoles.forEach(userRole -> {
                        Role role = new Role();
                        role.setId(userRole.getRoleId());
                        // 查询角色信息
                        role = roleService.get(role);
                        if (role != null) {
                            if (tempUser.getRoleList() == null)
                                tempUser.setRoleList(new ArrayList<>());
                            tempUser.getRoleList().add(role);
                        }
                    });
                }
            });
        }
        return page;
    }

    /**
     * 创建用户
     *
     * @param userDto userDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/26 0026 下午 2:34
     */
    @PostMapping
    public ReturnT<Boolean> addUser(@RequestBody UserDto userDto) {
        User user = new User();
        BeanUtils.copyProperties(userDto, user);
        user.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        // 设置默认密码
        if (StringUtils.isEmpty(userDto.getPassword()))
            userDto.setPassword(CommonConstant.DEFAULT_PASSWORD);
        user.setPassword(encoder.encode(userDto.getPassword()));
        // 保存用户
        return new ReturnT<>(userService.insert(user) > 0);
    }

    /**
     * 更新用户
     *
     * @param userDto userDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/26 0026 下午 3:06
     */
    @PutMapping
    public ReturnT<Boolean> updateUser(@RequestBody UserDto userDto) {
        try {
            return new ReturnT<>(userService.updateUser(userDto));
        } catch (Exception e) {
            logger.error("更新用户信息失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
    }

    /**
     * 更新用户的基本信息
     *
     * @param userDto userDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/10/30 10:06
     */
    @PutMapping("/updateInfo")
    public ReturnT<Boolean> updateInfo(@RequestBody UserDto userDto) {
        // 新密码不为空
        if (StringUtils.isNotEmpty(userDto.getNewPassword())) {
            if (!encoder.matches(userDto.getOldPassword(), userDto.getPassword())) {
                ReturnT<Boolean> returnT = new ReturnT<>(Boolean.FALSE);
                returnT.setMsg("新旧密码不匹配");
                return returnT;
            } else {
                // 新旧密码一致，修改密码
                userDto.setPassword(encoder.encode(userDto.getNewPassword()));
            }
        }
        return new ReturnT<>(userService.update(userDto) > 0);
    }

    /**
     * 删除用户
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/26 0026 下午 3:28
     */
    @ApiOperation(value = "删除用户", notes = "根据ID删除用户")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, paramType = "path")
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteUser(@PathVariable String id) {
        try {
            User user = userService.get(id);
            user.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
            userService.delete(user);
        } catch (Exception e) {
            logger.error("删除用户信息失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
    }
}


package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.module.SysUser;
import com.github.tangyi.user.module.UserRole;
import com.github.tangyi.user.service.UserRoleService;
import com.github.tangyi.user.service.SysUserService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

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
    private SysUserService userService;

    @Autowired
    private UserRoleService userRoleService;


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
    public PageInfo<SysUser> userList(@RequestParam Map<String, String> params, UserVo userVo) {
        PageInfo<SysUser> page = new PageInfo<SysUser>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(userVo, sysUser);
        return userService.findPage(page, sysUser);
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
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(userDto, sysUser);
        sysUser.setCommonValue(userDto.getUsername(), "");
        sysUser.setPassword(encoder.encode(userDto.getPassword()));
        // 保存用户
        userService.insert(sysUser);
        // 保存角色
        if (CollectionUtils.isNotEmpty(userDto.getRole())) {
            for (String roleId : userDto.getRole()) {
                UserRole sysUserRole = new UserRole();
                sysUserRole.setUserId(sysUser.getId());
                sysUserRole.setRoleId(roleId);
                // 保存角色
                userRoleService.insert(sysUserRole);
            }
        }
        return new ReturnT<>(Boolean.TRUE);
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
            SysUser sysUser = new SysUser();
            BeanUtils.copyProperties(userDto, sysUser);
            sysUser = userService.get(sysUser);
            return new ReturnT<>(userService.update(userDto));
        } catch (Exception e) {
            logger.error("更新用户信息失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
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
            SysUser sysUser = userService.get(id);
            userService.delete(sysUser);
        } catch (Exception e) {
            logger.error("删除用户信息失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
    }
}


package com.github.tangyi.user.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.constants.RoleConstant;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.dto.UserInfoDto;
import com.github.tangyi.user.module.Dept;
import com.github.tangyi.user.module.Role;
import com.github.tangyi.user.module.User;
import com.github.tangyi.user.module.UserRole;
import com.github.tangyi.user.service.*;
import com.github.tangyi.user.utils.UserUtils;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.*;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author tangyi
 * @date 2018-08-25-16:20
 */
@Api("用户信息管理")
@RestController
@RequestMapping(value = "/api/v1/user")
public class UserController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private static final PasswordEncoder encoder = new BCryptPasswordEncoder();

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private LogService logService;

    /**
     * 根据id获取
     *
     * @param id id
     * @return ReturnT
     */
    @ApiOperation(value = "获取用户信息", notes = "根据用户id获取用户详细信息")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "String", paramType = "path")
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
    @ApiOperation(value = "获取用户信息", notes = "获取当前登录用户详细信息")
    @ApiImplicitParam(name = "userVo", value = "用户实体userVo", required = true, dataType = "UserVo")
    @GetMapping("/info")
    public ReturnT<UserInfoDto> user(UserVo userVo) {
        return new ReturnT<>(userService.findUserInfo(userVo));
    }

    /**
     * 根据用户名获取用户
     *
     * @param username username
     * @return UserVo
     */
    @ApiOperation(value = "获取用户信息", notes = "根据用户name获取用户详细信息")
    @ApiImplicitParam(name = "username", value = "用户name", required = true, dataType = "String", paramType = "path")
    @GetMapping("/findUserByUsername/{username}")
    public UserVo findUserByUsername(@PathVariable String username) {
        return userService.selectUserVoByUsername(username);
    }

    /**
     * 获取分页数据
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param userVo   userVo
     * @return PageInfo
     * @author tangyi
     * @date 2018/8/26 22:56
     */
    @ApiOperation(value = "获取用户列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "userVo", value = "用户信息", dataType = "UserVo")
    })
    @RequestMapping("userList")
    public PageInfo<User> userList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                   @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                   @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                   @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                   @RequestParam(value = "username", required = false, defaultValue = "") String username,
                                   UserVo userVo) {
        PageInfo<User> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        User user = new User();
        BeanUtils.copyProperties(userVo, user);
        // 用户名查询条件
        user.setUsername(username);
        PageHelper.orderBy(PageUtil.orderBy(sort, order));
        page = userService.findPage(page, user);
        List<User> users = page.getList();
        if (CollectionUtils.isNotEmpty(users)) {
            // 收集用户、部门id
            Set<String> deptIdSet = new HashSet<>(), userIdSet = new HashSet<>();
            users.forEach(tempUser -> {
                if (tempUser.getDeptId() != null)
                    deptIdSet.add(tempUser.getDeptId());
                userIdSet.add(tempUser.getId());
            });
            // 批量查找部门
            Dept dept = new Dept();
            dept.setIds(deptIdSet.toArray(new String[deptIdSet.size()]));
            List<Dept> deptList = deptService.findListById(dept);
            // 批量查找角色
            List<UserRole> userRoles = userRoleService.getByUserIds(new ArrayList<>(userIdSet));
            List<Role> roleList = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(userRoles)) {
                Set<String> roleIdSet = new HashSet<>();
                userRoles.forEach(tempUserRole -> {
                    roleIdSet.add(tempUserRole.getRoleId());
                });
                Role role = new Role();
                role.setIds(roleIdSet.toArray(new String[roleIdSet.size()]));
                // 查询所有角色
                roleList = roleService.findListById(role);
            }
            // 设置部门、角色信息
            for (User tempUser : users) {
                List<Role> userRoleList = new ArrayList<>();
                // 设置部门信息
                for (Dept tempDept : deptList) {
                    if (tempDept.getId().equals(tempUser.getDeptId())) {
                        tempUser.setDeptName(tempDept.getDeptName());
                        tempUser.setDeptId(tempDept.getId());
                        break;
                    }
                }
                for (UserRole tempUserRole : userRoles) {
                    if (tempUser.getId().equals(tempUserRole.getUserId())) {
                        for (Role role : roleList) {
                            if (role.getId().equals(tempUserRole.getRoleId())) {
                                userRoleList.add(role);
                            }
                        }
                    }
                }
                tempUser.setRoleList(userRoleList);
            }
        }
        return page;
    }

    /**
     * 创建用户
     *
     * @param userDto userDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/26 14:34
     */
    @ApiOperation(value = "创建用户", notes = "创建用户")
    @ApiImplicitParam(name = "userDto", value = "用户实体user", required = true, dataType = "UserDto")
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
     * @date 2018/8/26 15:06
     */
    @ApiOperation(value = "更新用户信息", notes = "根据用户id更新用户的基本信息、角色信息")
    @ApiImplicitParam(name = "userDto", value = "用户实体user", required = true, dataType = "UserDto")
    @PutMapping
    public ReturnT<Boolean> updateUser(@RequestBody UserDto userDto, HttpServletRequest request) {
        try {
            return new ReturnT<>(userService.updateUser(userDto));
        } catch (Exception e) {
            logger.error("更新用户信息失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "更新用户"));
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
    @ApiOperation(value = "更新用户基本信息", notes = "根据用户id更新用户的基本信息")
    @ApiImplicitParam(name = "userDto", value = "用户实体user", required = true, dataType = "UserDto")
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
     * @date 2018/8/26 15:28
     */
    @ApiOperation(value = "删除用户", notes = "根据ID删除用户")
    @ApiImplicitParam(name = "id", value = "用户ID", required = true, paramType = "path")
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteUser(@PathVariable String id, HttpServletRequest request) {
        try {
            User user = userService.get(id);
            user.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
            userService.delete(user);
        } catch (Exception e) {
            logger.error("删除用户信息失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "删除用户"));
        }
        return new ReturnT<>(Boolean.FALSE);
    }

    /**
     * 导出
     *
     * @param userVo userVo
     * @author tangyi
     * @date 2018/11/26 22:11
     */
    @ApiOperation(value = "导出用户", notes = "根据用户id导出用户")
    @ApiImplicitParam(name = "userVo", value = "用户信息", required = true, dataType = "UserVo")
    @PostMapping("/export")
    public void exportUser(@RequestBody UserVo userVo, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "用户信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<User> users;
            if (StringUtils.isNotEmpty(userVo.getIdString())) {
                List<String> userIdList = new ArrayList<>();
                for (String id : userVo.getIdString().split(",")) {
                    if (StringUtils.isNotEmpty(id))
                        userIdList.add(id);
                }
                User user = new User();
                user.setIds(userIdList.toArray(new String[userIdList.size()]));
                users = userService.findListById(user);
            } else {    // 导出全部用户
                users = userService.findList(new User());
            }
            ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(users), UserUtils.getUserMap());
        } catch (Exception e) {
            logger.error("导出用户数据失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "导出用户"));
        }
    }

    /**
     * 导入数据
     *
     * @param file file
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/28 12:44
     */
    @ApiOperation(value = "导入数据", notes = "导入数据")
    @RequestMapping("import")
    public ReturnT<Boolean> importUser(@ApiParam(value = "要上传的文件", required = true) MultipartFile file, HttpServletRequest request) {
        try {
            logger.debug("开始导入用户数据");
            List<User> users = MapUtil.map2Java(User.class,
                    ExcelToolUtil.importExcel(file.getInputStream(), UserUtils.getUserMap()));
            if (CollectionUtils.isNotEmpty(users)) {
                for (User user : users) {
                    if (userService.update(user) < 1)
                        userService.insert(user);
                }
            }
            return new ReturnT<>(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入用户数据失败！", e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "导入用户"));
        }
        return new ReturnT<>(Boolean.FALSE);
    }

    /**
     * 批量删除
     *
     * @param user user
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 9:58
     */
    @ApiOperation(value = "批量删除用户", notes = "根据用户id批量删除用户")
    @ApiImplicitParam(name = "user", value = "用户信息", dataType = "User")
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllUsers(@RequestBody User user) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(user.getIdString()))
                success = userService.deleteAll(user.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除用户失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 根据ID查询
     *
     * @param userVo userVo
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/31 21:16
     */
    @ApiOperation(value = "根据ID查询用户", notes = "根据ID查询用户")
    @ApiImplicitParam(name = "userVo", value = "用户信息", required = true, paramType = "UserVo")
    @RequestMapping(value = "/findById", method = RequestMethod.POST)
    public ReturnT<List<UserVo>> findById(@RequestBody UserVo userVo) {
        ReturnT<List<UserVo>> returnT = null;
        User user = new User();
        user.setIds(userVo.getIds());
        List<User> users = userService.findListById(user);
        if (CollectionUtils.isNotEmpty(users)) {
            List<UserVo> userVoList = new ArrayList<>();
            users.forEach(tempUser -> {
                UserVo tempUserVo = new UserVo();
                BeanUtils.copyProperties(tempUser, tempUserVo);
                userVoList.add(tempUserVo);
            });
            returnT = new ReturnT<>(userVoList);
        }
        return returnT;
    }

    /**
     * 注册
     *
     * @param userDto userDto
     * @return ReturnT
     * @author tangyi
     * @date 2019/01/10 22:35
     */
    @ApiOperation(value = "注册", notes = "注册")
    @ApiImplicitParam(name = "userDto", value = "用户实体user", required = true, dataType = "UserDto")
    @PostMapping("register")
    public ReturnT<Boolean> register(@RequestBody UserDto userDto) {
        boolean success = false;
        User user = new User();
        BeanUtils.copyProperties(userDto, user);
        user.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        // 设置默认密码
        if (StringUtils.isEmpty(userDto.getPassword()))
            userDto.setPassword(CommonConstant.DEFAULT_PASSWORD);
        user.setPassword(encoder.encode(userDto.getPassword()));
        // 保存用户
        if (userService.insert(user) > 0) {
            // 分配默认角色
            Role role = new Role();
            role.setIsDefault(RoleConstant.IS_DEFAULT_ROLE);
            // 查询默认角色
            List<Role> roleList = roleService.findList(role);
            if (CollectionUtils.isNotEmpty(roleList)) {
                Role defaultRole = roleList.get(0);
                UserRole userRole = new UserRole();
                userRole.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                userRole.setUserId(user.getId());
                userRole.setRoleId(defaultRole.getId());
                // 保存用户角色关系
                success = userRoleService.insert(userRole) > 0;
            }
        }
        return new ReturnT<>(success);
    }
}


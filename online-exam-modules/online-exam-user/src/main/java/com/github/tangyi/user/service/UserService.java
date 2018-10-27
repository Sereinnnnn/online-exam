package com.github.tangyi.user.service;

import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.common.vo.Role;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.dto.UserInfoDto;
import com.github.tangyi.user.mapper.MenuMapper;
import com.github.tangyi.user.mapper.UserDeptMapper;
import com.github.tangyi.user.mapper.UserMapper;
import com.github.tangyi.user.mapper.UserRoleMapper;
import com.github.tangyi.user.module.Menu;
import com.github.tangyi.user.module.User;
import com.github.tangyi.user.module.UserDept;
import com.github.tangyi.user.module.UserRole;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * 用户service实现
 *
 * @author tangyi
 * @date 2018-08-25-16:17
 */
@Service
@Transactional(readOnly = true)
public class UserService extends CrudService<UserMapper, User> {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private UserDeptMapper userDeptMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 获取用户信息
     *
     * @param userVo userVo
     * @return User
     * @author tangyi
     * @date 2018/9/11 下午 11:44
     */
    public UserInfoDto findUserInfo(UserVo userVo) {
        // 根据用户名查询用户信息
        userVo = userMapper.selectUserVoByUsername(userVo.getUsername());
        UserInfoDto user = new UserInfoDto();
        if (userVo != null) {
            user.setUser(userVo);
            // 用户角色列表
            List<Role> roleList = userVo.getRoleList();
            List<String> roleNames = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(roleList)) {
                for (Role role : roleList) {
                    if (!SecurityConstant.BASE_ROLE.equals(role.getRoleName()))
                        roleNames.add(role.getRoleName());
                }
            }
            String[] roleNameArray = roleNames.toArray(new String[roleNames.size()]);
            user.setRoles(roleNameArray);
            // 菜单列表
            Set<Menu> menuSet = new HashSet<>();
            for (String role : roleNameArray)
                menuSet.addAll(menuMapper.findByRole(role));
            // 权限列表
            Set<String> permissions = new HashSet<>();
            for (Menu menu : menuSet) {
                if (StringUtils.isNotEmpty(menu.getPermission()))
                    permissions.add(menu.getPermission());
            }
            user.setPermissions(permissions.toArray(new String[permissions.size()]));
        }
        return user;
    }

    /**
     * 更新用户
     *
     * @param userDto userDto
     * @return int
     * @author tangyi
     * @date 2018/8/26 下午 3:15
     */
    @Transactional
    public boolean update(UserDto userDto) {
        User user = new User();
        BeanUtils.copyProperties(userDto, user);
        user.setCommonValue(user.getUsername(), user.getApplicationCode());
        // 更新用户信息
        super.update(user);
        // 更新用户角色关系
        if (CollectionUtils.isNotEmpty(userDto.getRole())) {
            UserRole sysUserRole = new UserRole();
            sysUserRole.setUserId(user.getId());
            // 删除原有的角色信息
            userRoleMapper.delete(sysUserRole);
            for (String roleId : userDto.getRole()) {
                UserRole role = new UserRole();
                role.setId(IdGen.uuid());
                role.setUserId(user.getId());
                role.setRoleId(roleId);
                // 保存角色信息
                userRoleMapper.insert(role);
            }
        }
        // 更新用户部门关系
        if (StringUtils.isNotBlank(userDto.getDeptId())) {
            UserDept userDept = new UserDept();
            userDept.setUserId(user.getId());
            userDeptMapper.delete(userDept);
            userDept.setCommonValue(user.getUsername(), "");
            userDept.setDeptId(userDto.getDeptId());
            userDeptMapper.insert(userDept);
        }
        return Boolean.TRUE;
    }

    public UserVo selectUserVoByUsername(String username) {
        return userMapper.selectUserVoByUsername(username);
    }

    /**
     * 保存验证码
     *
     * @param random    random
     * @param imageCode imageCode
     * @author tangyi
     * @date 2018/9/14 20:12
     */
    public void saveImageCode(String random, String imageCode) {
        redisTemplate.opsForValue().set(SecurityConstant.DEFAULT_CODE_KEY + random, imageCode, SecurityConstant.DEFAULT_IMAGE_EXPIRE, TimeUnit.SECONDS);
    }

    /**
     * 删除用户
     *
     * @param user user
     * @return int
     */
    @Transactional
    @Override
    public int delete(User user) {
        // 删除用户角色关系
        userRoleMapper.deleteByUserId(user.getId());
        // 删除用户部门关系
        userDeptMapper.deleteByUserId(user.getId());
        return super.delete(user);
    }
}

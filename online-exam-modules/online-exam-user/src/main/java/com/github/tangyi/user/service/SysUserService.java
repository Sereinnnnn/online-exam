package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.mapper.UserMapper;
import com.github.tangyi.user.mapper.UserRoleMapper;
import com.github.tangyi.user.module.User;
import com.github.tangyi.user.module.UserRole;
import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户service实现
 *
 * @author tangyi
 * @date 2018-08-25-16:17
 */
@Service
@Transactional(readOnly = true)
public class SysUserService extends CrudService<UserMapper, User> {

    private static final Logger logger = LoggerFactory.getLogger(SysUserService.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
     * 获取用户信息
     *
     * @param userVo userVo
     * @return User
     * @author tangyi
     * @date 2018/9/11 下午 11:44
     */
    public User findUserInfo(UserVo userVo) {
        User user = new User();
        BeanUtils.copyProperties(userVo, user);
        user = userMapper.get(user);
        if (user != null) {

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
        // 更新角色信息
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
        return Boolean.TRUE;
    }

    public UserVo selectUserVoByUsername(String username) {
        return userMapper.selectUserVoByUsername(username);
    }
}

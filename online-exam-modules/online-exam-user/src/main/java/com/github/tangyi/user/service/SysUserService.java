package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.user.dto.UserDto;
import com.github.tangyi.user.mapper.UserMapper;
import com.github.tangyi.user.mapper.UserRoleMapper;
import com.github.tangyi.user.module.SysUser;
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
public class SysUserService extends CrudService<UserMapper, SysUser> {

    private static final Logger logger = LoggerFactory.getLogger(SysUserService.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;


    /**
     * 更新用户
     *
     * @param userDto userDto
     * @return int
     * @author tangyi
     * @date 2018/8/26 0026 下午 3:15
     */
    @Transactional
    public boolean update(UserDto userDto) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(userDto, sysUser);
        sysUser.setCommonValue(sysUser.getUsername(), sysUser.getApplicationCode());
        // 更新用户信息
        super.update(sysUser);
        // 更新角色信息
        if (CollectionUtils.isNotEmpty(userDto.getRole())) {
            UserRole sysUserRole = new UserRole();
            sysUserRole.setUserId(sysUser.getId());
            // 删除原有的角色信息
            userRoleMapper.delete(sysUserRole);
            for (String roleId : userDto.getRole()) {
                UserRole role = new UserRole();
                role.setId(IdGen.uuid());
                role.setUserId(sysUser.getId());
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

package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.UserRoleMapper;
import com.github.tangyi.user.module.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tangyi
 * @date 2018/8/26 0026 14:55
 */
@Service
public class UserRoleService extends CrudService<UserRoleMapper, UserRole> {

    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
     * 根据用户ID查询
     *
     * @param userId 用户ID
     * @return List
     */
    public List<UserRole> getByUserId(String userId) {
        return userRoleMapper.getByUserId(userId);
    }

}

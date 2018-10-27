package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.UserDeptMapper;
import com.github.tangyi.user.module.UserDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author tangyi
 * @date 2018/10/27 10:29
 */
@Service
@Transactional(readOnly = true)
public class UserDeptService extends CrudService<UserDeptMapper, UserDept> {

    @Autowired
    private UserDeptMapper userDeptMapper;

    /**
     * 根据用户ID查询
     * @param userId 用户ID
     * @return UserDept
     */
    public UserDept getDeptByUserId(String userId) {
        return userDeptMapper.getByUserId(userId);
    }

    /**
     * 根据部门ID查询
     *
     * @param deptId 部门ID
     * @return List
     */
    public List<UserDept> getUserByDeptId(String deptId) {
        return userDeptMapper.getByDeptId(deptId);
    }
}

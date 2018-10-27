package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.UserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author tangyi
 * @date 2018/8/26 0026 14:53
 */
@Mapper
public interface UserRoleMapper extends CrudMapper<UserRole> {

    /**
     * 根据用户ID查询
     *
     * @param userId 用户ID
     * @return List
     */
    List<UserRole> getByUserId(String userId);

    /**
     * 根据用户ID删除
     *
     * @param userId 用户ID
     * @return int
     */
    int deleteByUserId(String userId);

    /**
     * 根据角色ID删除
     *
     * @param roleId 角色ID
     * @return int
     */
    int deleteByRoleId(String roleId);
}

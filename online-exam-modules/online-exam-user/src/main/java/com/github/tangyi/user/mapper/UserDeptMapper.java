package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.UserDept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单mapper
 *
 * @author tangyi
 * @date 2018/10/27 10:20
 */
@Mapper
public interface UserDeptMapper extends CrudMapper<UserDept> {

    /**
     * 根据用户ID查询
     * @param userId 用户ID
     * @return UserDept
     */
    UserDept getByUserId(String userId);

    /**
     * 根据部门ID查询
     *
     * @param deptId 部门ID
     * @return List
     */
    List<UserDept> getByDeptId(String deptId);

    /**
     * 根据用户ID删除
     *
     * @param userId 用户ID
     * @return int
     */
    int deleteByUserId(String userId);

    /**
     * 根据部门ID删除
     *
     * @param deptId 部门ID
     * @return int
     */
    int deleteByDeptId(String deptId);

}

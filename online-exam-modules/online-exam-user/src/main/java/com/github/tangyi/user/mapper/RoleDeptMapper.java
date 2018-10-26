package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.RoleDept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单mapper
 *
 * @author tangyi
 * @date 2018/8/26 22:34
 */
@Mapper
public interface RoleDeptMapper extends CrudMapper<RoleDept> {

    /**
     * 根据部门ID查询
     *
     * @param deptId 部门ID
     * @return List
     */
    List<RoleDept> getByDeptId(String deptId);

}

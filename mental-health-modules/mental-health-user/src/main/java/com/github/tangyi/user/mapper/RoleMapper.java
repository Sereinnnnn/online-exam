package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 09:33
 */
@Mapper
public interface RoleMapper extends CrudMapper<Role> {
    List<Role> findAll();
}

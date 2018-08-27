package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.user.module.Role;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 09:33
 */
@Mapper
public interface RoleMapper extends CrudDao<Role> {
}

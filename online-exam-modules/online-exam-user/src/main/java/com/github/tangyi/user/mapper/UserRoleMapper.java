package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.user.module.UserRole;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author tangyi
 * @date 2018/8/26 0026 14:53
 */
@Mapper
public interface UserRoleMapper extends CrudDao<UserRole> {
}

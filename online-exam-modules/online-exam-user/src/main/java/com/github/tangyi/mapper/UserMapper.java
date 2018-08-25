package com.github.tangyi.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.module.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户mapper接口
 *
 * @author tangyi
 * @date 2018-08-25-15:27
 */
@Mapper
public interface UserMapper extends CrudDao<SysUser> {

    UserVo selectUserVo();

    /**
     * 通过用户名查询用户信息（含有角色信息）
     *
     * @param username 用户名
     * @return userVo
     */
    UserVo selectUserVoByUsername(String username);
}

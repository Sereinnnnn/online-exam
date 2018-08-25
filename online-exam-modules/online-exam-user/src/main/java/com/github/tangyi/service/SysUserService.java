package com.github.tangyi.service;

import com.github.tangyi.common.vo.UserVo;

/**
 * 用户service
 *
 * @author tangyi
 * @date 2018-08-25-16:15
 */
public interface SysUserService {

    UserVo selectUserVoByUsername(String username);
}

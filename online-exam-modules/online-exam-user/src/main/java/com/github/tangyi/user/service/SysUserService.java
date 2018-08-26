package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.user.mapper.UserMapper;
import com.github.tangyi.user.module.SysUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户service实现
 *
 * @author tangyi
 * @date 2018-08-25-16:17
 */
@Service
@Transactional(readOnly = true)
public class SysUserService extends CrudService<UserMapper, SysUser> {

    private static final Logger logger = LoggerFactory.getLogger(SysUserService.class);

    @Autowired
    private UserMapper userMapper;

    public UserVo selectUserVoByUsername(String username) {
        return userMapper.selectUserVoByUsername(username);
    }
}

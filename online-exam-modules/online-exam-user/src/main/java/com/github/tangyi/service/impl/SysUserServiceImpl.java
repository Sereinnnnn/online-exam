package com.github.tangyi.service.impl;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.mapper.UserMapper;
import com.github.tangyi.service.SysUserService;
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
public class SysUserServiceImpl implements SysUserService {

    private static final Logger logger = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserVo selectUserVoByUsername(String username) {
        return userMapper.selectUserVoByUsername(username);
    }
}

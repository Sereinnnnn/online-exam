package com.github.tangyi.auth.service.impl;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.auth.feign.UserService;
import com.github.tangyi.auth.utils.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author tangyi
 * @date 2018-08-25-14:48
 */
@Service("userDetailService")
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetailsImpl loadUserByUsername(String username) throws UsernameNotFoundException {
        UserVo userVo = userService.findByUsername(username);
        return new UserDetailsImpl(userVo);
    }
}

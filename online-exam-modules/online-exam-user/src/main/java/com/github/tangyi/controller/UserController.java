package com.github.tangyi.controller;

import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tangyi
 * @date 2018-08-25-16:20
 */
@RestController
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private SysUserService userService;

    /**
     * 根据用户名获取用户
     *
     * @param username
     * @return
     */
    @GetMapping("/findUserByUsername/{username}")
    public UserVo findUserByUsername(@PathVariable String username) {
        return userService.selectUserVoByUsername(username);
    }
}

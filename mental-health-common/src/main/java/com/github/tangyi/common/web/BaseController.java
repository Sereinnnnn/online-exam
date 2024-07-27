package com.github.tangyi.common.web;

import com.github.tangyi.common.utils.SysUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 基础Controller
 *
 * @author tangyi
 * @date 2018-08-23-12:01
 */
public abstract class BaseController {

    /**
     * 日志
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private HttpServletRequest request;

    /**
     * 根据token获取用户角色
     *
     * @return 角色名
     */
    public List<String> getRole() {
        return SysUtil.getRole(request);
    }

    /**
     * 获取用户id
     *
     * @return Integer
     */
    public Integer getUserId() {
        return SysUtil.getUserId(request);
    }

    /**
     * 获取当前用户
     *
     * @return String
     */
    public String getUser() {
        return SysUtil.getUser();
    }
}

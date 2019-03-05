package com.github.tangyi.user.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.config.SysConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统配置controller
 *
 * @author tangyi
 * @date 2019-02-28 17:29
 */
@RestController
@RequestMapping("/api/v1/sysConfig")
public class SysConfigController extends BaseController {

    @Autowired
    private SysConfig sysConfig;

    /**
     * 获取系统配置
     *
     * @return ReturnT
     * @author tangyi
     * @date 2019/2/28 17:31
     */
    @GetMapping
    public ReturnT<SysConfig> getSysConfig() {
        return new ReturnT<>(sysConfig);
    }
}

package com.github.tangyi.common.vo;

import com.github.tangyi.common.model.Log;
import com.github.tangyi.common.persistence.BaseEntity;

/**
 * logVo
 *
 * @author tangyi
 * @date 2019-01-05 17:07
 */
public class LogVo extends BaseEntity<LogVo> {

    private Log log;

    private String username;

    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}

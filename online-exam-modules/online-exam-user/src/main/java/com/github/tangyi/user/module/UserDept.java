package com.github.tangyi.user.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 用户部门关系
 *
 * @author tangyi
 * @date 2018/10/27 0027 10:23
 */
public class UserDept extends BaseEntity<UserDept> {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 部门ID
     */
    private String deptId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}

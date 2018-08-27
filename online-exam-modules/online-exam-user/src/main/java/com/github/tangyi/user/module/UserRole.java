package com.github.tangyi.user.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 用户角色关系
 *
 * @author tangyi
 * @date 2018/8/26 0026 09:29
 */
public class UserRole extends BaseEntity<UserRole> {

    private String userId;

    private String roleId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}

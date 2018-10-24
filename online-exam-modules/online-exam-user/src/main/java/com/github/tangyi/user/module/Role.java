package com.github.tangyi.user.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 角色
 *
 * @author tangyi
 * @date 2018-08-25-13:58
 */
public class Role extends BaseEntity<Role> {

    private String roleName;

    private String roleCode;

    private String roleDesc;

    private String status;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

package com.github.tangyi.common.vo;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 角色
 *
 * @author tangyi
 * @date 2018-08-25-13:58
 */
public class SysRole extends BaseEntity<SysRole> {

    private Integer roleId;

    private String roleName;

    private String roleCode;

    private String roleDesc;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

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
}

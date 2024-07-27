package com.github.tangyi.user.module;

import com.github.tangyi.common.persistence.BaseEntity;
import lombok.Data;

/**
 * 部门角色关系
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:27
 */
@Data
public class RoleDept extends BaseEntity<RoleDept> {

    /**
     * 角色ID
     */
    private String roleId;

    /**
     * 部门ID
     */
    private String deptId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}

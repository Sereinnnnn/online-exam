package com.github.tangyi.user.dto;

import com.github.tangyi.user.module.User;

import java.util.List;

/**
 * userDto
 *
 * @author tangyi
 * @date 2018/8/26 0026 14:36
 */
public class UserDto extends User {

    /**
     * 角色
     */
    private List<String> role;

    /**
     * 部门ID
     */
    private String deptId;

    /**
     * 新密码
     */
    private String newPassword;

    public List<String> getRole() {
        return role;
    }

    public void setRole(List<String> role) {
        this.role = role;
    }

    @Override
    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}

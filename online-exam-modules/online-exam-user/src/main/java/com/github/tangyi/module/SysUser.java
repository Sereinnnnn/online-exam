package com.github.tangyi.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 用户实体
 *
 * @author tangyi
 * @date 2018-08-25-15:30
 */
public class SysUser extends BaseEntity<SysUser> {

    private String username;

    private String password;

    private String salt;

    private String phone;

    private String avatar;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}

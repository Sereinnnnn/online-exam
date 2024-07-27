package com.github.tangyi.auth.utils;

import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.constants.SecurityConstant;
import com.github.tangyi.common.service.BaseService;
import com.github.tangyi.common.vo.Role;
import com.github.tangyi.common.vo.UserVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 用户Service
 *
 * @author tangyi
 * @date 2018-08-25-14:02
 */
public class UserDetailsImpl extends BaseService implements UserDetails {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 状态
     */
    private String status;

    /**
     * 权限列表
     */
    private List<Role> roleList = new ArrayList<>();

    public UserDetailsImpl(UserVo userVo) {
        this.userId = userVo.getId();
        this.username = userVo.getUsername();
        this.password = userVo.getPassword();
        this.status = userVo.getDelFlag().toString();
        roleList = userVo.getRoleList();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorityList = new ArrayList<>();
        for (Role role : roleList) {
            authorityList.add(new SimpleGrantedAuthority(role.getRoleCode()));
        }
        authorityList.add(new SimpleGrantedAuthority(SecurityConstant.BASE_ROLE));
        return authorityList;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return !StringUtils.equals(CommonConstant.STATUS_LOCK, status);
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return StringUtils.equals(CommonConstant.STATUS_NORMAL, status);
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }
}

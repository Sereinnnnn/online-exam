package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.IdGen;
import com.github.tangyi.user.mapper.RoleDeptMapper;
import com.github.tangyi.user.mapper.RoleMapper;
import com.github.tangyi.user.module.Role;
import com.github.tangyi.user.module.RoleDept;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 角色service
 *
 * @author tangyi
 * @date 2018/8/26 0026 14:16
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends CrudService<RoleMapper, Role> {

    @Autowired
    private RoleDeptMapper roleDeptMapper;

    /**
     * 新增
     *
     * @param role
     * @return int
     */
    @Override
    @Transactional
    public int insert(Role role) {
        // 保存所属部门
        if (StringUtils.isNotBlank(role.getDeptId())) {
            RoleDept roleDept = new RoleDept();
            roleDept.setRoleId(role.getId());
            roleDept.setId(IdGen.uuid());
            roleDept.setDeptId(role.getDeptId());
            roleDeptMapper.insert(roleDept);
        }
        return super.insert(role);
    }

    /**
     * 更新
     *
     * @param role role
     * @return int
     */
    @Override
    @Transactional
    public int update(Role role) {
        // 更新所属部门
        if (StringUtils.isNotBlank(role.getDeptId())) {
            RoleDept roleDept = new RoleDept();
            roleDept.setRoleId(role.getId());
            roleDeptMapper.delete(roleDept);
            roleDept.setId(IdGen.uuid());
            roleDept.setDeptId(role.getDeptId());
            roleDeptMapper.insert(roleDept);
        }
        return super.update(role);
    }

    /**
     * 删除
     *
     * @param role role
     * @return int
     */
    @Override
    @Transactional
    public int delete(Role role) {
        // 删除所属部门
        RoleDept roleDept = new RoleDept();
        roleDept.setRoleId(role.getId());
        roleDeptMapper.delete(roleDept);
        return super.delete(role);
    }
}

package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.RoleDeptMapper;
import com.github.tangyi.user.module.RoleDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tangyi
 * @date 2018/8/26 22:47
 */
@Service
@Transactional(readOnly = true)
public class RoleDeptService extends CrudService<RoleDeptMapper, RoleDept> {

    @Autowired
    private RoleDeptMapper roleDeptMapper;

    /**
     * 根据部门ID查询
     *
     * @param deptId 部门ID
     * @return List
     */
    public List<RoleDept> getRoleByDeptId(String deptId) {
        return roleDeptMapper.getByDeptId(deptId);
    }
}

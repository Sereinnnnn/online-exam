package com.github.tangyi.user.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 部门
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:25
 */
public class SysDept extends BaseEntity<SysDept> {

    /**
     * 部门名称
     */
    private String name;

    /**
     * 父部门ID
     */
    private String parentId;

    /**
     * 排序
     */
    private String sort;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}

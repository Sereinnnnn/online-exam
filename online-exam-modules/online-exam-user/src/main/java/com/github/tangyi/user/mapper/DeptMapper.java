package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.user.module.SysDept;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜单mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:34
 */
@Mapper
public interface DeptMapper extends CrudDao<SysDept> {
}

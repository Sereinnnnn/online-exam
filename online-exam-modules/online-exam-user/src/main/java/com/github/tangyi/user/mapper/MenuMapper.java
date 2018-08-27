package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudDao;
import com.github.tangyi.user.module.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单mapper
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:34
 */
@Mapper
public interface MenuMapper extends CrudDao<Menu> {

    /**
     * 根据角色查找菜单
     *
     * @param role 角色
     * @return List
     */
    List<Menu> findByRole(String role);
}

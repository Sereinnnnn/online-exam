package com.github.tangyi.user.mapper;

import com.github.tangyi.common.model.SysZuulRoute;
import com.github.tangyi.common.persistence.CrudMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 动态路由
 *
 * @author tangyi
 * @date 2018/9/1 0001 15:34
 */
@Mapper
public interface ZuulRouteMapper extends CrudMapper<SysZuulRoute> {
}

package com.github.tangyi.user.service;

import com.github.tangyi.common.model.SysZuulRoute;
import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.ZuulRouteMapper;
import org.springframework.stereotype.Service;

/**
 * 动态路由service
 *
 * @author tangyi
 * @date 2018/9/1 0001 15:42
 */
@Service
public class ZuulRouteService extends CrudService<ZuulRouteMapper, SysZuulRoute> {
}

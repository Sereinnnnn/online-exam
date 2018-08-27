package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.DeptMapper;
import com.github.tangyi.user.module.Dept;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author tangyi
 * @date 2018/8/26 0026 22:46
 */
@Service
@Transactional(readOnly = true)
public class DeptService extends CrudService<DeptMapper, Dept> {
}

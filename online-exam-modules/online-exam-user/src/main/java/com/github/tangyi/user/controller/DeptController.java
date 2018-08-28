package com.github.tangyi.user.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.Dept;
import com.github.tangyi.user.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 部门controller
 *
 * @author tangyi
 * @date 2018/8/26 0026 22:49
 */
@RestController
@RequestMapping("/dept")
public class DeptController extends BaseController {

    @Autowired
    private DeptService deptService;

    /**
     * 根据id获取部门
     *
     * @param id id
     * @return Dept
     * @author tangyi
     * @date 2018/8/28 10:11
     */
    @GetMapping("/{id}")
    public Dept get(@PathVariable String id) {
        Dept dept = new Dept();
        dept.setId(id);
        return deptService.get(dept);
    }

    /**
     * 新增
     *
     * @param dept dept
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/28 10:15
     */
    @PostMapping
    public ReturnT<Boolean> add(@RequestBody Dept dept) {
        dept.setCommonValue("", "");
        return new ReturnT<>(deptService.insert(dept) > 0);
    }

    /**
     * 删除部门
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/28 10:16
     */
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> delete(@PathVariable String id) {
        Dept dept = new Dept();
        dept.setId(id);
        dept.setCommonValue("", "");
        return new ReturnT<>(deptService.delete(dept) > 0);
    }

    /**
     * 更新部门
     *
     * @param dept dept
     * @return ReturnT
     * @author tangyi
     * @date 2018/8/28 10:22
     */
    @PutMapping
    public ReturnT<Boolean> update(@RequestBody Dept dept) {
        dept.setCommonValue("", "");
        return new ReturnT<Boolean>(deptService.update(dept) > 0);
    }
}

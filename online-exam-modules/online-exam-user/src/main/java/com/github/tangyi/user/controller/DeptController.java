package com.github.tangyi.user.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.utils.TreeUtil;
import com.github.tangyi.common.vo.DeptVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.dto.DeptDto;
import com.github.tangyi.user.module.Dept;
import com.github.tangyi.user.service.DeptService;
import com.xiaoleilu.hutool.collection.CollUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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
     * 查询树形部门集合
     *
     * @return List
     * @author tangyi
     * @date 2018/10/25 12:57
     */
    @GetMapping(value = "/depts")
    public List<DeptDto> depts() {
        // 查询所有部门
        Set<Dept> deptSet = new HashSet<Dept>(deptService.findList(new Dept()));
        List<DeptDto> deptTreeList = new ArrayList<DeptDto>();
        deptSet.forEach(dept -> deptTreeList.add(new DeptDto(dept)));
        // 排序
        CollUtil.sort(deptTreeList, Comparator.comparingInt(DeptDto::getSort));
        return TreeUtil.buildTree(deptTreeList, "-1");
    }

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
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(deptService.update(dept) > 0);
    }

    /**
     * 根据ID查询
     *
     * @param deptVo deptVo
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/31 22:13
     */
    @RequestMapping(value = "/findById", method = RequestMethod.POST)
    public ReturnT<List<DeptVo>> findById(@RequestBody DeptVo deptVo) {
        ReturnT<List<DeptVo>> returnT = null;
        Dept dept = new Dept();
        dept.setIds(deptVo.getIds());
        List<Dept> depts = deptService.findListById(dept);
        if (CollectionUtils.isNotEmpty(depts)) {
            List<DeptVo> deptVoList = new ArrayList<>();
            depts.forEach(tempDept -> {
                DeptVo tempDeptVo = new DeptVo();
                BeanUtils.copyProperties(tempDept, tempDeptVo);
                deptVoList.add(tempDeptVo);
            });
            returnT = new ReturnT<>(deptVoList);
        }
        return returnT;
    }
}

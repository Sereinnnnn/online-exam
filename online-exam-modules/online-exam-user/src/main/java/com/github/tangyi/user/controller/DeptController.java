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
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
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
@Api("部门信息管理")
@RestController
@RequestMapping("/api/v1/dept")
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
    @ApiOperation(value = "获取部门列表")
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
    @ApiOperation(value = "获取部门信息", notes = "根据部门id获取部门详细信息")
    @ApiImplicitParam(name = "id", value = "部门ID", required = true, dataType = "String", paramType = "path")
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
    @ApiOperation(value = "创建部门", notes = "创建部门")
    @ApiImplicitParam(name = "dept", value = "部门实体", required = true, dataType = "Dept")
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
    @ApiOperation(value = "删除部门", notes = "根据ID删除部门")
    @ApiImplicitParam(name = "id", value = "部门ID", required = true, paramType = "path")
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
    @ApiOperation(value = "更新部门信息", notes = "根据部门id更新部门的基本信息")
    @ApiImplicitParam(name = "dept", value = "部门实体", required = true, dataType = "Dept")
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
    @ApiOperation(value = "批量查询部门信息", notes = "根据Ids批量查询信息")
    @ApiImplicitParam(name = "deptVo", value = "部门实体", required = true, dataType = "DeptVo")
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

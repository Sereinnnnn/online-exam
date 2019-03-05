package com.github.tangyi.exam.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.utils.TreeUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.SubjectCategoryDto;
import com.github.tangyi.exam.module.SubjectCategory;
import com.github.tangyi.exam.service.SubjectCategoryService;
import com.xiaoleilu.hutool.collection.CollUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 题目分类controller
 *
 * @author tangyi
 * @date 2018/12/4 21:57
 */
@RestController
@RequestMapping("/api/v1/subjectCategory")
public class SubjectCategoryController extends BaseController {

    @Autowired
    private SubjectCategoryService categoryService;

    /**
     * 返回树形分类集合
     *
     * @return List
     * @author tangyi
     * @date 2018/12/04 22:03
     */
    @ApiOperation(value = "获取分类列表")
    @GetMapping(value = "/categories")
    public List<SubjectCategoryDto> menus() {
        // 查询所有菜单
        Set<SubjectCategory> subjectCategorySet = new HashSet<SubjectCategory>(categoryService.findList(new SubjectCategory()));
        List<SubjectCategoryDto> subjectCategorySetTreeList = new ArrayList<SubjectCategoryDto>();
        subjectCategorySet.forEach(subjectCategory -> subjectCategorySetTreeList.add(new SubjectCategoryDto(subjectCategory)));
        // 排序
        CollUtil.sort(subjectCategorySetTreeList, Comparator.comparingInt(SubjectCategoryDto::getSort));
        return TreeUtil.buildTree(subjectCategorySetTreeList, "-1");
    }

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 21:59
     */
    @ApiOperation(value = "获取分类信息", notes = "根据分类id获取分类详细信息")
    @ApiImplicitParam(name = "id", value = "分类ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<SubjectCategory> subjectCategory(@PathVariable String id) {
        SubjectCategory subjectCategory = new SubjectCategory();
        if (StringUtils.isNotBlank(id)) {
            subjectCategory.setId(id);
            subjectCategory = categoryService.get(subjectCategory);
        }
        return new ReturnT<>(subjectCategory);
    }

    /**
     * 新增分类
     *
     * @param subjectCategory subjectCategory
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 22:00
     */
    @ApiOperation(value = "创建分类", notes = "创建分类")
    @ApiImplicitParam(name = "subjectCategory", value = "分类实体subjectCategory", required = true, dataType = "SubjectCategory")
    @PostMapping
    public ReturnT<Boolean> addSubjectCategory(@RequestBody SubjectCategory subjectCategory) {
        subjectCategory.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(categoryService.insert(subjectCategory) > 0);
    }

    /**
     * 更新分类
     *
     * @param subjectCategory subjectCategory
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 22:01
     */
    @ApiOperation(value = "更新分类信息", notes = "根据分类id更新分类的基本信息")
    @ApiImplicitParam(name = "subjectCategory", value = "分类实体subjectCategory", required = true, dataType = "SubjectCategory")
    @PutMapping
    public ReturnT<Boolean> updateSubjectCategory(@RequestBody SubjectCategory subjectCategory) {
        subjectCategory.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(categoryService.update(subjectCategory) > 0);
    }

    /**
     * 根据ID删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 22:02
     */
    @ApiOperation(value = "删除分类", notes = "根据ID删除分类")
    @ApiImplicitParam(name = "id", value = "分类ID", required = true, paramType = "path")
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteSubjectCategory(@PathVariable String id) {
        SubjectCategory subjectCategory = new SubjectCategory();
        subjectCategory.setId(id);
        return new ReturnT<>(categoryService.delete(subjectCategory) > 0);
    }
}

package com.github.tangyi.exam.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.utils.TreeUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.SubjectCategoryDto;
import com.github.tangyi.exam.module.SubjectCategory;
import com.github.tangyi.exam.service.SubjectCategoryService;
import com.xiaoleilu.hutool.collection.CollUtil;
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
@RequestMapping("/subjectCategory")
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
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> deleteSubjectCategory(@PathVariable String id) {
        SubjectCategory subjectCategory = new SubjectCategory();
        subjectCategory.setId(id);
        return new ReturnT<>(categoryService.delete(subjectCategory) > 0);
    }
}

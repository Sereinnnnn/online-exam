package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Subject;
import com.github.tangyi.exam.service.SubjectService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 题目controller
 *
 * @author tangyi
 * @date 2018/11/8 21:29
 */
@RestController
@RequestMapping("/subject")
public class SubjectController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);

    @Autowired
    private SubjectService subjectService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @GetMapping("/{id}")
    public ReturnT<Subject> subject(@PathVariable String id) {
        Subject subject = new Subject();
        if (StringUtils.isNotBlank(id)) {
            subject.setId(id);
            subject = subjectService.get(subject);
        }
        return new ReturnT<>(subject);
    }

    /**
     * 获取分页数据
     *
     * @param params  params
     * @param subject subject
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @RequestMapping("subjectList")
    public PageInfo<Subject> subjectList(@RequestParam Map<String, String> params, Subject subject) {
        PageInfo<Subject> page = new PageInfo<Subject>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return subjectService.findPage(page, subject);
    }

    /**
     * 创建
     *
     * @param subject subject
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @PostMapping
    public ReturnT<Boolean> addSubject(@RequestBody Subject subject) {
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(subjectService.insert(subject) > 0);
    }

    /**
     * 更新
     *
     * @param subject subject
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @PutMapping
    public ReturnT<Boolean> updateSubject(@RequestBody Subject subject) {
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(subjectService.update(subject) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteSubject(@PathVariable String id) {
        try {
            Subject subject = new Subject();
            subject.setId(id);
            subject = subjectService.get(subject);
            if (subject != null) {
                subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                subjectService.delete(subject);
            }
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

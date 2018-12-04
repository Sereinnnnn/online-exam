package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Subject;
import com.github.tangyi.exam.service.SubjectService;
import com.github.tangyi.exam.utils.SubjectUtil;
import com.google.common.net.HttpHeaders;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
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

    /**
     * 导出题目
     *
     * @param ids           用户id，多个用逗号分隔
     * @param examinationId 考试id
     * @author tangyi
     * @date 2018/11/28 12:53
     */
    @GetMapping("/export")
    public void exportSubject(String ids, String examinationId, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "题目信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<Subject> subjects = new ArrayList<>();
            // 根据题目id导出
            if (StringUtils.isNotEmpty(ids)) {
                for (String id : ids.split(",")) {
                    Subject subject = new Subject();
                    subject.setId(id);
                    subject = subjectService.get(subject);
                    if (subject != null)
                        subjects.add(subject);
                }
            } else if (StringUtils.isNotEmpty(examinationId)) {  // 根据考试id导出
                Subject subject = new Subject();
                subject.setExaminationId(examinationId);
                subjects = subjectService.findList(subject);
            }
            ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(subjects), SubjectUtil.getSubjectMap());
        } catch (Exception e) {
            logger.error("导出题目数据失败！", e);
        }
    }

    /**
     * 导入数据
     *
     * @param examinationId examinationId
     * @param file          file
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/28 12:59
     */
    @RequestMapping("import")
    public ReturnT<Boolean> importSubject(String examinationId, MultipartFile file) {
        try {
            logger.debug("开始导入题目数据");
            List<Subject> subjects = MapUtil.map2Java(Subject.class,
                    ExcelToolUtil.importExcel(file.getInputStream(), SubjectUtil.getSubjectMap()));
            if (CollectionUtils.isNotEmpty(subjects)) {
                for (Subject subject : subjects) {
                    // 初始化考试ID
                    if (StringUtils.isBlank(subject.getId()) && StringUtils.isNotBlank(examinationId)) {
                        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                        subject.setExaminationId(examinationId);
                        subjectService.insert(subject);
                    } else {
                        subjectService.update(subject);
                    }
                }
            }
            return new ReturnT<>(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入题目数据失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
    }

    /**
     * 批量删除
     *
     * @param subject subject
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 9:55
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteSubjects(@RequestBody Subject subject) {
        try {
            if (StringUtils.isNotEmpty(subject.getIds()))
                subjectService.deleteAll(subject.getIds().split(","));
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

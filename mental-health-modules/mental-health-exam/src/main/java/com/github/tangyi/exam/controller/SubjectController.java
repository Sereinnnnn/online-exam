package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.SubjectDto;
import com.github.tangyi.exam.module.Answer;
import com.github.tangyi.exam.module.ExamRecord;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.module.Subject;
import com.github.tangyi.exam.service.AnswerService;
import com.github.tangyi.exam.service.ExamRecordService;
import com.github.tangyi.exam.service.ExaminationService;
import com.github.tangyi.exam.service.SubjectService;
import com.github.tangyi.exam.utils.SubjectUtil;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.*;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 题目controller
 *
 * @author tangyi
 * @date 2018/11/8 21:29
 */
@Api("题目信息管理")
@RestController
@RequestMapping("/api/v1/subject")
public class SubjectController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private ExamRecordService examRecordService;

    @Autowired
    private ExaminationService examinationService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @ApiOperation(value = "获取题目信息", notes = "根据题目id获取题目详细信息")
    @ApiImplicitParam(name = "id", value = "题目ID", required = true, dataType = "String", paramType = "path")
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
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param subject  subject
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @ApiOperation(value = "获取题目列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "subject", value = "题目信息", dataType = "Subject")
    })
    @RequestMapping("subjectList")
    public PageInfo<Subject> subjectList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                         @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                         @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                         Subject subject) {
        PageInfo<Subject> page = new PageInfo<Subject>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        PageHelper.orderBy(PageUtil.orderBy(sort, order));
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
    @ApiOperation(value = "创建题目", notes = "创建题目")
    @ApiImplicitParam(name = "subject", value = "题目实体subject", required = true, dataType = "Subject")
    @PostMapping
    public ReturnT<Boolean> addSubject(@RequestBody Subject subject) {
        Assert.notNull(subject.getExaminationId(), CommonConstant.IllEGAL_ARGUMENT);
        boolean success = false;
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        if (subjectService.insert(subject) > 0) {
            // 更新考试的题目数
            Examination examination = new Examination();
            examination.setId(subject.getExaminationId());
            examination = examinationService.get(examination);
            if (examination != null)
                success = examinationService.update(examination) > 0;
        }
        return new ReturnT<>(success);
    }

    /**
     * 更新
     *
     * @param subject subject
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @ApiOperation(value = "更新题目信息", notes = "根据题目id更新题目的基本信息")
    @ApiImplicitParam(name = "subject", value = "角色实体subject", required = true, dataType = "Subject")
    @PutMapping
    public ReturnT<Boolean> updateSubject(@RequestBody Subject subject) {
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(subjectService.update(subject) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @ApiOperation(value = "删除题目", notes = "根据ID删除题目")
    @ApiImplicitParam(name = "id", value = "题目ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteSubject(@PathVariable String id) {
        boolean success = false;
        try {
            Subject subject = new Subject();
            subject.setId(id);
            subject = subjectService.get(subject);
            if (subject != null) {
                subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                if (subjectService.delete(subject) > 0) {
                    // 更新考试的题目数
                    Examination examination = new Examination();
                    examination.setId(subject.getExaminationId());
                    examination = examinationService.get(examination);
                    if (examination != null)
                        success = examinationService.update(examination) > 0;
                }
            }
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 导出题目
     *
     * @param subjectDto subjectDto
     * @author tangyi
     * @date 2018/11/28 12:53
     */
    @ApiOperation(value = "导出题目", notes = "根据分类id导出题目")
    @ApiImplicitParam(name = "subjectDto", value = "题目信息", required = true, dataType = "SubjectDto")
    @PostMapping("/export")
    public void exportSubject(@RequestBody SubjectDto subjectDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "题目信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<Subject> subjects = new ArrayList<>();
            // 根据题目id导出
            if (StringUtils.isNotEmpty(subjectDto.getIdString())) {
                for (String id : subjectDto.getIdString().split(",")) {
                    Subject subject = new Subject();
                    subject.setId(id);
                    subject = subjectService.get(subject);
                    if (subject != null)
                        subjects.add(subject);
                }
            } else if (StringUtils.isNotEmpty(subjectDto.getExaminationId())) {  // 根据考试id导出
                Subject subject = new Subject();
                subject.setExaminationId(subjectDto.getExaminationId());
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
    @ApiOperation(value = "导入题目", notes = "导入题目")
    @ApiImplicitParam(name = "examinationId", value = "考试ID", required = true, dataType = "String")
    @RequestMapping("import")
    public ReturnT<Boolean> importSubject(String examinationId, @ApiParam(value = "要上传的文件", required = true) MultipartFile file) {
        boolean success = false;
        Assert.notNull(examinationId, CommonConstant.IllEGAL_ARGUMENT);
        try {
            logger.debug("开始导入题目数据，分类ID：{}", examinationId);
            List<Subject> subjects = MapUtil.map2Java(Subject.class,
                    ExcelToolUtil.importExcel(file.getInputStream(), SubjectUtil.getSubjectMap()));
            if (CollectionUtils.isNotEmpty(subjects)) {
                for (Subject subject : subjects) {
                    // 初始化考试ID
                    if (StringUtils.isBlank(subject.getId())) {
                        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                        subject.setExaminationId(examinationId);
                        subjectService.insert(subject);
                    }
                }
                // 更新考试的题目数
                Examination examination = new Examination();
                examination.setId(examinationId);
                examination = examinationService.get(examination);
                if (examination != null)
                    success = examinationService.update(examination) > 0;
            }
            return new ReturnT<>(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入题目数据失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 批量删除
     *
     * @param subjectDto subjectDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 9:55
     */
    @ApiOperation(value = "批量删除题目", notes = "根据题目id批量删除题目")
    @ApiImplicitParam(name = "subjectDto", value = "题目信息", dataType = "SubjectDto")
    @PostMapping("deleteAll")
    public ReturnT<Boolean> deleteSubjects(@RequestBody SubjectDto subjectDto) {
        boolean success = false;
        Assert.notNull(subjectDto.getIdString(), CommonConstant.IllEGAL_ARGUMENT);
        try {
            String[] subjectIds = subjectDto.getIdString().split(",");
            success = subjectService.deleteAll(subjectIds) > 0;
            Subject subject = new Subject();
            subject.setIds(subjectIds);
            List<Subject> subjectList = subjectService.findListById(subject);
            if (CollectionUtils.isNotEmpty(subjectList)) {
                subjectList.forEach(tempSubject -> {
                    // 更新考试的题目数
                    Examination examination = new Examination();
                    examination.setId(tempSubject.getExaminationId());
                    examination = examinationService.get(examination);
                    if (examination != null)
                        examinationService.update(examination);
                });
            }
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 查询题目和答题
     *
     * @param serialNumber serialNumber
     * @param examRecordId examRecordId
     * @param userId       userId
     * @return ReturnT
     * @author tangyi
     * @date 2019/01/16 22:25
     */
    @ApiOperation(value = "查询题目和答题", notes = "根据题目id查询题目和答题")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "serialNumber", value = "题目序号", required = true, dataType = "String"),
            @ApiImplicitParam(name = "examRecordId", value = "考试记录ID", required = true, dataType = "String"),
            @ApiImplicitParam(name = "userId", value = "用户ID", dataType = "String")
    })
    @GetMapping("subjectAnswer")
    public ReturnT<SubjectDto> subjectAnswer(@RequestParam("serialNumber") String serialNumber,
                                             @RequestParam("examRecordId") String examRecordId,
                                             @RequestParam(value = "userId", required = false) String userId) {
        SubjectDto subjectDto = null;
        ExamRecord examRecord = new ExamRecord();
        examRecord.setId(examRecordId);
        // 查找考试记录
        examRecord = examRecordService.get(examRecord);
        if (examRecord != null) {
            // 查找题目
            Subject subject = new Subject();
            subject.setExaminationId(examRecord.getExaminationId());
            subject.setSerialNumber(serialNumber);
            subject = subjectService.getByExaminationIdAndSerialNumber(subject);
            if (subject != null) {
                subjectDto = new SubjectDto();
                // 查找答题
                Answer answer = new Answer();
                answer.setSubjectId(subject.getId());
                answer.setExaminationId(examRecord.getExaminationId());
                answer.setExamRecordId(examRecordId);
                answer.setUserId(userId);
                List<Answer> answerList = answerService.findList(answer);
                if (answerList != null && answerList.size() == 1) {
                    answer = answerList.get(0);
                }
                BeanUtils.copyProperties(subject, subjectDto);
                // 设置答题
                subjectDto.setAnswer(answer);
                subjectDto.setExaminationRecordId(examRecordId);
            }
        }
        return new ReturnT<>(subjectDto);
    }
}

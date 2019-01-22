package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.exception.CommonException;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.ExcelToolUtil;
import com.github.tangyi.common.utils.MapUtil;
import com.github.tangyi.common.utils.Servlets;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.vo.DeptVo;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ExamRecordDto;
import com.github.tangyi.exam.feign.DeptService;
import com.github.tangyi.exam.feign.UserService;
import com.github.tangyi.exam.module.ExamRecord;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.ExamRecordService;
import com.github.tangyi.exam.service.ExaminationService;
import com.github.tangyi.exam.utils.ExamRecordUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 考试记录controller
 *
 * @author tangyi
 * @date 2018/11/8 21:27
 */
@RestController
@RequestMapping("/examRecord")
public class ExamRecordController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ExamRecordController.class);

    @Autowired
    private ExamRecordService examRecordService;

    @Autowired
    private ExaminationService examinationService;

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:33
     */
    @ApiOperation(value = "获取考试记录信息", notes = "根据考试记录id获取考试记录详细信息")
    @ApiImplicitParam(name = "id", value = "考试记录ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<ExamRecord> examRecode(@PathVariable String id) {
        ExamRecord examRecord = new ExamRecord();
        if (StringUtils.isNotBlank(id)) {
            examRecord.setId(id);
            examRecord = examRecordService.get(examRecord);
        }
        return new ReturnT<>(examRecord);
    }

    /**
     * 获取分页数据
     *
     * @param params     params
     * @param examRecord examRecord
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:33
     */
    @ApiOperation(value = "获取考试记录列表")
    @RequestMapping("examRecordList")
    public PageInfo<ExamRecordDto> examRecodeList(@RequestParam Map<String, String> params, ExamRecord examRecord) {
        PageInfo<ExamRecord> page = new PageInfo<ExamRecord>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageInfo<ExamRecordDto> examRecordDtoPageInfo = new PageInfo<>();
        List<ExamRecordDto> examRecordDtoList = new ArrayList<>();
        // 查询考试记录
        PageInfo<ExamRecord> examRecordPageInfo = examRecordService.findPage(page, examRecord);
        if (CollectionUtils.isNotEmpty(examRecordPageInfo.getList())) {
            // 考试id、用户id
            Set<String> examIdSet = new HashSet<>(), userIdSet = new HashSet<>();
            examRecordPageInfo.getList().forEach(tempExamRecord -> {
                examIdSet.add(tempExamRecord.getExaminationId());
                userIdSet.add(tempExamRecord.getUserId());
            });
            Examination examination = new Examination();
            examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
            // 查询考试信息
            List<Examination> examinations = examinationService.findListById(examination);
            // 查询用户信息
            UserVo userVo = new UserVo();
            userVo.setIds(userIdSet.toArray(new String[userIdSet.size()]));
            ReturnT<List<UserVo>> returnT = userService.findById(userVo);
            if (returnT != null && CollectionUtils.isNotEmpty(returnT.getData())) {
                examRecordPageInfo.getList().forEach(tempExamRecord -> {
                    examinations.forEach(tempExamination -> {
                        if (tempExamRecord.getExaminationId().equals(tempExamination.getId())) {
                            ExamRecordDto examRecordDto = new ExamRecordDto();
                            BeanUtils.copyProperties(tempExamination, examRecordDto);
                            examRecordDto.setStartTime(tempExamRecord.getStartTime());
                            examRecordDto.setEndTime(tempExamRecord.getEndTime());
                            examRecordDto.setScore(tempExamRecord.getScore());
                            examRecordDtoList.add(examRecordDto);
                        }
                    });
                });
                // 查询部门信息
                Set<String> deptIdSet = new HashSet<>();
                returnT.getData().forEach(tempUserVo -> {
                    deptIdSet.add(tempUserVo.getDeptId());
                });
                DeptVo deptVo = new DeptVo();
                deptVo.setIds(deptIdSet.toArray(new String[deptIdSet.size()]));
                ReturnT<List<DeptVo>> deptReturnT = deptService.findById(deptVo);
                for (ExamRecordDto tempExamRecordDto : examRecordDtoList) {
                    for (UserVo tempUserVo : returnT.getData()) {
                        if (tempExamRecordDto.getUserId().equals(tempUserVo.getId())) {
                            tempExamRecordDto.setUserName(tempUserVo.getName());
                            // 查询部门信息
                            if (deptReturnT != null && CollectionUtils.isNotEmpty(deptReturnT.getData())) {
                                for (DeptVo tempDept : deptReturnT.getData()) {
                                    // 设置所属部门名称
                                    if (tempDept.getId().equals(tempUserVo.getDeptId())) {
                                        tempExamRecordDto.setDeptName(tempDept.getDeptName());
                                        break;
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
            }
        }
        examRecordDtoPageInfo.setTotal(examRecordPageInfo.getTotal());
        examRecordDtoPageInfo.setPages(examRecordPageInfo.getPages());
        examRecordDtoPageInfo.setPageSize(examRecordPageInfo.getPageSize());
        examRecordDtoPageInfo.setPageNum(examRecordPageInfo.getPageNum());
        examRecordDtoPageInfo.setList(examRecordDtoList);
        return examRecordDtoPageInfo;
    }

    /**
     * 创建
     *
     * @param examRecord examRecord
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:33
     */
    @ApiOperation(value = "创建考试记录", notes = "创建考试记录")
    @ApiImplicitParam(name = "examRecord", value = "考试记录实体examRecord", required = true, dataType = "ExamRecord")
    @PostMapping
    public ReturnT<ExamRecord> addExamRecode(@RequestBody ExamRecord examRecord) {
        if (StringUtils.isEmpty(examRecord.getExaminationId()))
            throw new CommonException("参数校验失败，考试id为空！");
        if (StringUtils.isEmpty(examRecord.getUserId()))
            throw new CommonException("参数校验失败，用户id为空！");
        Examination examination = new Examination();
        examination.setId(examRecord.getExaminationId());
        // 查找考试信息
        examination = examinationService.get(examination);
        if (examination != null) {
            examRecord.setExaminationName(examination.getExaminationName());
            examRecord.setCourseId(examination.getCourseId());
        }
        examRecord.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        examRecord.setStartTime(examRecord.getCreateDate());
        examRecordService.insert(examRecord);
        return new ReturnT<>(examRecord);
    }

    /**
     * 更新
     *
     * @param examRecord examRecord
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:34
     */
    @ApiOperation(value = "更新考试记录信息", notes = "根据考试记录id更新考试记录的基本信息")
    @ApiImplicitParam(name = "examRecord", value = "考试记录实体examRecord", required = true, dataType = "ExamRecord")
    @PutMapping
    public ReturnT<Boolean> updateExamRecode(@RequestBody ExamRecord examRecord) {
        examRecord.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examRecordService.update(examRecord) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:34
     */
    @ApiOperation(value = "删除考试记录", notes = "根据ID删除考试记录")
    @ApiImplicitParam(name = "id", value = "考试记录ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteExamRecode(@PathVariable String id) {
        boolean success = false;
        try {
            ExamRecord examRecord = examRecordService.get(id);
            if (examRecord != null) {
                examRecord.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = examRecordService.delete(examRecord) > 0;
            }
        } catch (Exception e) {
            logger.error("删除考试记录失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 导出
     *
     * @param examRecordDto examRecordDto
     * @author tangyi
     * @date 2018/12/31 22:28
     */
    @PostMapping("/export")
    public void exportExamRecord(@RequestBody ExamRecordDto examRecordDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "考试成绩" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<ExamRecord> examRecordList;
            if (StringUtils.isNotEmpty(examRecordDto.getIdString())) {
                Set<String> examRecordIdSet = new HashSet<>();
                for (String id : examRecordDto.getIdString().split(",")) {
                    if (StringUtils.isNotEmpty(id))
                        examRecordIdSet.add(id);
                }
                ExamRecord examRecord = new ExamRecord();
                examRecord.setIds(examRecordIdSet.toArray(new String[examRecordIdSet.size()]));
                examRecordList = examRecordService.findListById(examRecord);
            } else {
                // 导出全部
                examRecordList = examRecordService.findList(new ExamRecord());
            }
            // 查询考试、用户、部门数据
            if (CollectionUtils.isNotEmpty(examRecordList)) {
                List<ExamRecordDto> examRecordDtoList = new ArrayList<>();
                // 查询考试信息
                Set<String> examIdSet = new HashSet<>();
                examRecordList.forEach(tempExamRecord -> {
                    examIdSet.add(tempExamRecord.getExaminationId());
                });
                Examination examination = new Examination();
                examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
                List<Examination> examinations = examinationService.findListById(examination);
                // 用户id
                Set<String> userIdSet = new HashSet<>();
                examRecordList.forEach(tempExamRecord -> {
                    examinations.forEach(tempExamination -> {
                        if (tempExamRecord.getExaminationId().equals(tempExamination.getId())) {
                            ExamRecordDto recordDto = new ExamRecordDto();
                            recordDto.setId(tempExamRecord.getId());
                            recordDto.setExaminationName(tempExamination.getExaminationName());
                            recordDto.setExamTime(tempExamRecord.getCreateDate());
                            recordDto.setScore(tempExamRecord.getScore());
                            recordDto.setUserId(tempExamRecord.getUserId());
                            userIdSet.add(tempExamRecord.getUserId());
                            examRecordDtoList.add(recordDto);
                        }
                    });
                });
                // 查询用户信息
                UserVo userVo = new UserVo();
                userVo.setIds(userIdSet.toArray(new String[userIdSet.size()]));
                ReturnT<List<UserVo>> returnT = userService.findById(userVo);
                if (returnT != null && CollectionUtils.isNotEmpty(returnT.getData())) {
                    // 查询部门信息
                    Set<String> deptIdSet = new HashSet<>();
                    returnT.getData().forEach(tempUserVo -> {
                        deptIdSet.add(tempUserVo.getDeptId());
                    });
                    DeptVo deptVo = new DeptVo();
                    deptVo.setIds(deptIdSet.toArray(new String[deptIdSet.size()]));
                    ReturnT<List<DeptVo>> deptReturnT = deptService.findById(deptVo);
                    examRecordDtoList.forEach(tempExamRecordDto -> {
                        returnT.getData().forEach(tempUserVo -> {
                            if (tempExamRecordDto.getUserId().equals(tempUserVo.getId())) {
                                tempExamRecordDto.setUserName(tempUserVo.getName());
                                // 查询部门信息
                                if (deptReturnT != null && CollectionUtils.isNotEmpty(deptReturnT.getData())) {
                                    deptReturnT.getData().forEach(tempDept -> {
                                        // 设置所属部门名称
                                        if (tempDept.getId().equals(tempUserVo.getDeptId()))
                                            tempExamRecordDto.setDeptName(tempDept.getDeptName());
                                    });
                                }
                            }
                        });
                    });
                }
                // 导出
                ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(examRecordList), ExamRecordUtil.getExamRecordDtoMap());
            }
        } catch (Exception e) {
            logger.error("导出成绩数据失败！", e);
        }
    }
}

package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ExamRecordDto;
import com.github.tangyi.exam.module.ExamRecord;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.ExamRecordService;
import com.github.tangyi.exam.service.ExaminationService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:33
     */
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
    @RequestMapping("examRecordList")
    public PageInfo<ExamRecordDto> examRecodeList(@RequestParam Map<String, String> params, ExamRecord examRecord) {
        PageInfo<ExamRecord> page = new PageInfo<ExamRecord>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageInfo<ExamRecordDto> examRecordDtoPageInfo = new PageInfo<>();
        List<ExamRecordDto> examRecodeDtoList = new ArrayList<>();
        // 查询考试记录
        PageInfo<ExamRecord> examRecordPageInfo = examRecordService.findPage(page, examRecord);
        if (CollectionUtils.isNotEmpty(examRecordPageInfo.getList())) {
            Set<String> examIdSet = new HashSet<>();
            examRecordPageInfo.getList().forEach(tempExamRecode -> {
                examIdSet.add(tempExamRecode.getExaminationId());
            });
            Examination examination = new Examination();
            examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
            // 查询考试信息
            List<Examination> examinations = examinationService.findListById(examination);
            examRecordPageInfo.getList().forEach(tempExamRecode -> {
                examinations.forEach(tempExamination -> {
                    if (tempExamRecode.getExaminationId().equals(tempExamination.getId())) {
                        ExamRecordDto examRecodeDto = new ExamRecordDto();
                        BeanUtils.copyProperties(tempExamination, examRecodeDto);
                        examRecodeDto.setExamTime(tempExamRecode.getExamTime());
                        examRecodeDto.setScore(tempExamRecode.getScore());
                        examRecodeDtoList.add(examRecodeDto);
                    }
                });
            });
        }
        examRecordDtoPageInfo.setTotal(examRecordPageInfo.getTotal());
        examRecordDtoPageInfo.setPages(examRecordPageInfo.getPages());
        examRecordDtoPageInfo.setPageSize(examRecordPageInfo.getPageSize());
        examRecordDtoPageInfo.setPageNum(examRecordPageInfo.getPageNum());
        examRecordDtoPageInfo.setList(examRecodeDtoList);
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
    @PostMapping
    public ReturnT<ExamRecord> addExamRecode(@RequestBody ExamRecord examRecord) {
        examRecord.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
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
}

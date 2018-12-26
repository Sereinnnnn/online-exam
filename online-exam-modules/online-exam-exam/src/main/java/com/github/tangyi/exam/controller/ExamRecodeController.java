package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ExamRecodeDto;
import com.github.tangyi.exam.module.ExamRecode;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.ExamRecodeService;
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
@RequestMapping("/examRecode")
public class ExamRecodeController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ExamRecodeController.class);

    @Autowired
    private ExamRecodeService examRecodeService;

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
    public ReturnT<ExamRecode> examRecode(@PathVariable String id) {
        ExamRecode examRecode = new ExamRecode();
        if (StringUtils.isNotBlank(id)) {
            examRecode.setId(id);
            examRecode = examRecodeService.get(examRecode);
        }
        return new ReturnT<>(examRecode);
    }

    /**
     * 获取分页数据
     *
     * @param params     params
     * @param examRecode examRecode
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:33
     */
    @RequestMapping("examRecodeList")
    public PageInfo<ExamRecodeDto> examRecodeList(@RequestParam Map<String, String> params, ExamRecode examRecode) {
        PageInfo<ExamRecode> page = new PageInfo<ExamRecode>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageInfo<ExamRecodeDto> examRecodeDtoPageInfo = new PageInfo<>();
        List<ExamRecodeDto> examRecodeDtoList = new ArrayList<>();
        // 查询考试记录
        PageInfo<ExamRecode> examRecodePageInfo = examRecodeService.findPage(page, examRecode);
        if (CollectionUtils.isNotEmpty(examRecodePageInfo.getList())) {
            Set<String> examIdSet = new HashSet<>();
            examRecodePageInfo.getList().forEach(tempExamRecode -> {
                examIdSet.add(tempExamRecode.getExaminationId());
            });
            Examination examination = new Examination();
            examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
            // 查询考试信息
            List<Examination> examinations = examinationService.findListById(examination);
            examRecodePageInfo.getList().forEach(tempExamRecode -> {
                examinations.forEach(tempExamination -> {
                    if (tempExamRecode.getExaminationId().equals(tempExamination.getId())) {
                        ExamRecodeDto examRecodeDto = new ExamRecodeDto();
                        BeanUtils.copyProperties(tempExamination, examRecodeDto);
                        examRecodeDto.setExamTime(tempExamRecode.getExamTime());
                        examRecodeDto.setScore(tempExamRecode.getScore());
                        examRecodeDtoList.add(examRecodeDto);
                    }
                });
            });
        }
        examRecodeDtoPageInfo.setList(examRecodeDtoList);
        return examRecodeDtoPageInfo;
    }

    /**
     * 创建
     *
     * @param examRecode examRecode
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:33
     */
    @PostMapping
    public ReturnT<Boolean> addExamRecode(@RequestBody ExamRecode examRecode) {
        examRecode.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examRecodeService.insert(examRecode) > 0);
    }

    /**
     * 更新
     *
     * @param examRecode examRecode
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:34
     */
    @PutMapping
    public ReturnT<Boolean> updateExamRecode(@RequestBody ExamRecode examRecode) {
        examRecode.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examRecodeService.update(examRecode) > 0);
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
            ExamRecode examRecode = examRecodeService.get(id);
            if (examRecode != null) {
                examRecode.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = examRecodeService.delete(examRecode) > 0;
            }
        } catch (Exception e) {
            logger.error("删除考试记录失败！", e);
        }
        return new ReturnT<>(success);
    }
}

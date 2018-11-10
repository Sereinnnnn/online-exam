package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.ExamRecode;
import com.github.tangyi.exam.service.ExamRecodeService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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
    public PageInfo<ExamRecode> examRecodeList(@RequestParam Map<String, String> params, ExamRecode examRecode) {
        PageInfo<ExamRecode> page = new PageInfo<ExamRecode>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return examRecodeService.findPage(page, examRecode);
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
        return new ReturnT<Boolean>(examRecodeService.insert(examRecode) > 0);
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
        return new ReturnT<Boolean>(examRecodeService.update(examRecode) > 0);
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
        try {
            ExamRecode examRecode = examRecodeService.get(id);
            if (examRecode != null) {
                examRecode.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                examRecodeService.delete(examRecode);
            }
        } catch (Exception e) {
            logger.error("删除考试记录失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.ExaminationService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 考试controller
 *
 * @author tangyi
 * @date 2018/11/8 21:26
 */
@RestController
@RequestMapping("/examination")
public class ExaminationController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ExaminationController.class);

    @Autowired
    private ExaminationService examinationService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:08
     */
    @GetMapping("/{id}")
    public ReturnT<Examination> examination(@PathVariable String id) {
        Examination examination = new Examination();
        if (StringUtils.isNotBlank(id)) {
            examination.setId(id);
            examination = examinationService.get(examination);
        }
        return new ReturnT<>(examination);
    }

    /**
     * 获取分页数据
     *
     * @param params      params
     * @param examination examination
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:10
     */
    @RequestMapping("examinationList")
    public PageInfo<Examination> examinationList(@RequestParam Map<String, String> params, Examination examination) {
        PageInfo<Examination> page = new PageInfo<Examination>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return examinationService.findPage(page, examination);
    }

    /**
     * 创建
     *
     * @param examination examination
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:14
     */
    @PostMapping
    public ReturnT<Boolean> addExamination(@RequestBody Examination examination) {
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(examinationService.insert(examination) > 0);
    }

    /**
     * 更新
     *
     * @param examination examination
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:15
     */
    @PutMapping
    public ReturnT<Boolean> updateExamination(@RequestBody Examination examination) {
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(examinationService.update(examination) > 0);
    }

    /**
     * 删除考试
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:20
     */
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteExamination(@PathVariable String id) {
        try {
            Examination examination = examinationService.get(id);
            if (examination != null) {
                examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                examinationService.delete(examination);
            }
        } catch (Exception e) {
            logger.error("删除考试失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

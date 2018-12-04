package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ExaminationDto;
import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.CourseService;
import com.github.tangyi.exam.service.ExaminationService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
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

    @Autowired
    private CourseService courseService;

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
    public PageInfo<ExaminationDto> examinationList(@RequestParam Map<String, String> params, Examination examination) {
        PageInfo<Examination> page = new PageInfo<Examination>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        page = examinationService.findPage(page, examination);
        PageInfo<ExaminationDto> examinationDtoPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(page, examinationDtoPageInfo);
        List<ExaminationDto> examinationDtos = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(page.getList())) {
            for (Examination exam : page.getList()) {
                Course course = new Course();
                course.setId(exam.getCourseId());
                course = courseService.get(course);
                ExaminationDto examinationDto = new ExaminationDto(course);
                BeanUtils.copyProperties(exam, examinationDto);
                examinationDtos.add(examinationDto);
            }
        }
        examinationDtoPageInfo.setList(examinationDtos);
        return examinationDtoPageInfo;
    }

    /**
     * 创建
     *
     * @param examinationDto examinationDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:14
     */
    @PostMapping
    public ReturnT<Boolean> addExamination(@RequestBody ExaminationDto examinationDto) {
        Examination examination = new Examination();
        BeanUtils.copyProperties(examinationDto, examination);
        examination.setCourseId(examinationDto.getCourse().getId());
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(examinationService.insert(examination) > 0);
    }

    /**
     * 更新
     *
     * @param examinationDto examinationDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:15
     */
    @PutMapping
    public ReturnT<Boolean> updateExamination(@RequestBody ExaminationDto examinationDto) {
        Examination examination = new Examination();
        BeanUtils.copyProperties(examinationDto, examination);
        examination.setCourseId(examinationDto.getCourse().getId());
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
            Examination examination = new Examination();
            examination.setId(id);
            examination = examinationService.get(examination);
            if (examination != null) {
                examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                examinationService.delete(examination);
            }
        } catch (Exception e) {
            logger.error("删除考试失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }

    /**
     * 批量删除
     *
     * @param examination examination
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/03 22:03
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllExaminations(@RequestBody Examination examination) {
        try {
            if (StringUtils.isNotEmpty(examination.getIds()))
                examinationService.deleteAll(examination.getIds().split(","));
        } catch (Exception e) {
            logger.error("删除考试失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

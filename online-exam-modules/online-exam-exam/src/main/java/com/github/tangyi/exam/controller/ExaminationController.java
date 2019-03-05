package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ExaminationDto;
import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.service.CourseService;
import com.github.tangyi.exam.service.ExaminationService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 考试controller
 *
 * @author tangyi
 * @date 2018/11/8 21:26
 */
@RestController
@RequestMapping("/api/v1/examination")
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
    @ApiOperation(value = "获取考试信息", notes = "根据考试id获取考试详细信息")
    @ApiImplicitParam(name = "id", value = "考试ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<Examination> examination(@PathVariable String id) {
        Examination examination = new Examination();
        if (StringUtils.isNotBlank(id)) {
            examination.setId(id);
            examination = examinationService.get(examination);
            // 获取当前时间
            if (examination != null)
                examination.setCurrentTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
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
    @ApiOperation(value = "获取考试列表")
    @RequestMapping("examinationList")
    public PageInfo<ExaminationDto> examinationList(@RequestParam Map<String, String> params, Examination examination) {
        PageInfo<Examination> page = new PageInfo<Examination>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
        page = examinationService.findPage(page, examination);
        PageInfo<ExaminationDto> examinationDtoPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(page, examinationDtoPageInfo);
        List<ExaminationDto> examinationDtos = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(page.getList())) {
            Set<String> courseIdSet = new HashSet<>();
            page.getList().forEach(exam -> {
                courseIdSet.add(exam.getCourseId());
            });
            Course course = new Course();
            course.setIds(courseIdSet.toArray(new String[courseIdSet.size()]));
            List<Course> courses = courseService.findListById(course);
            String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            page.getList().forEach(exam -> {
                ExaminationDto examinationDto = new ExaminationDto();
                BeanUtils.copyProperties(exam, examinationDto);
                examinationDto.setCurrentTime(currentTime);
                courses.forEach(tempCourse -> {
                    if (tempCourse.getId().equals(exam.getCourseId())) {
                        examinationDto.setCourse(tempCourse);
                    }
                });
                examinationDtos.add(examinationDto);
            });
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
    @ApiOperation(value = "创建考试", notes = "创建考试")
    @ApiImplicitParam(name = "examinationDto", value = "考试实体examinationDto", required = true, dataType = "ExaminationDto")
    @PostMapping
    public ReturnT<Boolean> addExamination(@RequestBody ExaminationDto examinationDto) {
        Examination examination = new Examination();
        BeanUtils.copyProperties(examinationDto, examination);
        examination.setCourseId(examinationDto.getCourse().getId());
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examinationService.insert(examination) > 0);
    }

    /**
     * 更新
     *
     * @param examinationDto examinationDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:15
     */
    @ApiOperation(value = "更新考试信息", notes = "根据考试id更新考试的基本信息")
    @ApiImplicitParam(name = "examinationDto", value = "考试实体answer", required = true, dataType = "ExaminationDto")
    @PutMapping
    public ReturnT<Boolean> updateExamination(@RequestBody ExaminationDto examinationDto) {
        Examination examination = new Examination();
        BeanUtils.copyProperties(examinationDto, examination);
        examination.setCourseId(examinationDto.getCourse().getId());
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examinationService.update(examination) > 0);
    }

    /**
     * 删除考试
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:20
     */
    @ApiOperation(value = "删除考试", notes = "根据ID删除考试")
    @ApiImplicitParam(name = "id", value = "考试ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteExamination(@PathVariable String id) {
        boolean success = false;
        try {
            Examination examination = new Examination();
            examination.setId(id);
            examination = examinationService.get(examination);
            if (examination != null) {
                examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = examinationService.delete(examination) > 0;
            }
        } catch (Exception e) {
            logger.error("删除考试失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 批量删除
     *
     * @param examinationDto examinationDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/03 22:03
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllExaminations(@RequestBody ExaminationDto examinationDto) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(examinationDto.getIdString()))
                success = examinationService.deleteAll(examinationDto.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除考试失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 查询考试数量
     *
     * @return ReturnT
     * @author tangyi
     * @date 2019/3/1 15:30
     */
    @GetMapping("/examinationCount")
    public ReturnT<Integer> examinationCount() {
        Examination examination = new Examination();
        examination.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(examinationService.findExaminationCount(examination));
    }
}

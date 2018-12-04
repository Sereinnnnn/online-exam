package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.service.CourseService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 课程controller
 *
 * @author tangyi
 * @date 2018/11/8 21:25
 */
@RestController
@RequestMapping("/course")
public class CourseController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

    @Autowired
    private CourseService courseService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:28
     */
    @GetMapping("/{id}")
    public ReturnT<Course> course(@PathVariable String id) {
        Course course = new Course();
        if (StringUtils.isNotBlank(id)) {
            course.setId(id);
            course = courseService.get(course);
        }
        return new ReturnT<>(course);
    }

    /**
     * 获取分页数据
     *
     * @param params params
     * @param course course
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:30
     */
    @RequestMapping("courseList")
    public PageInfo<Course> courseList(@RequestParam Map<String, String> params, Course course) {
        PageInfo<Course> page = new PageInfo<Course>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return courseService.findPage(page, course);
    }

    /**
     * 创建
     *
     * @param course course
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:31
     */
    @PostMapping
    public ReturnT<Boolean> addCourse(@RequestBody Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(courseService.insert(course) > 0);
    }

    /**
     * 更新
     *
     * @param course course
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:31
     */
    @PutMapping
    public ReturnT<Boolean> updateCourse(@RequestBody Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(courseService.update(course) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:32
     */
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteCourse(@PathVariable String id) {
        try {
            Course course = new Course();
            course.setId(id);
            course = courseService.get(course);
            if (course != null) {
                course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                courseService.delete(course);
            }
        } catch (Exception e) {
            logger.error("删除课程失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }

    /**
     * 批量删除
     *
     * @param course course
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 11:26
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllCourses(@RequestBody Course course) {
        try {
            if (StringUtils.isNotEmpty(course.getIds()))
                courseService.deleteAll(course.getIds().split(","));
        } catch (Exception e) {
            logger.error("删除课程失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

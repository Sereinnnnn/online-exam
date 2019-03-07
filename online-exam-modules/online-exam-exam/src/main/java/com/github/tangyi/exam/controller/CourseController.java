package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.service.CourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 课程controller
 *
 * @author tangyi
 * @date 2018/11/8 21:25
 */
@Api("课程信息管理")
@RestController
@RequestMapping("/api/v1/course")
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
    @ApiOperation(value = "获取课程信息", notes = "根据课程id获取课程详细信息")
    @ApiImplicitParam(name = "id", value = "课程ID", required = true, dataType = "String", paramType = "path")
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
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param course   course
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:30
     */
    @ApiOperation(value = "获取课程列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "course", value = "课程信息", dataType = "Course")
    })
    @RequestMapping("courseList")
    public PageInfo<Course> courseList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                       @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                       @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                       @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                       Course course) {
        PageInfo<Course> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        PageHelper.orderBy(PageUtil.orderBy(sort, order));
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
    @ApiOperation(value = "创建课程", notes = "创建课程")
    @ApiImplicitParam(name = "course", value = "课程实体course", required = true, dataType = "Course")
    @PostMapping
    public ReturnT<Boolean> addCourse(@RequestBody Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(courseService.insert(course) > 0);
    }

    /**
     * 更新
     *
     * @param course course
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:31
     */
    @ApiOperation(value = "更新课程信息", notes = "根据课程id更新课程的基本信息")
    @ApiImplicitParam(name = "course", value = "课程实体course", required = true, dataType = "Course")
    @PutMapping
    public ReturnT<Boolean> updateCourse(@RequestBody Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(courseService.update(course) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:32
     */
    @ApiOperation(value = "删除课程", notes = "根据ID删除课程")
    @ApiImplicitParam(name = "id", value = "课程ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteCourse(@PathVariable String id) {
        boolean success = false;
        try {
            Course course = new Course();
            course.setId(id);
            course = courseService.get(course);
            if (course != null) {
                course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = courseService.delete(course) > 0;
            }
        } catch (Exception e) {
            logger.error("删除课程失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 批量删除
     *
     * @param course course
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 11:26
     */
    @ApiOperation(value = "批量删除课程", notes = "根据课程id批量删除课程")
    @ApiImplicitParam(name = "course", value = "课程信息", dataType = "Course")
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllCourses(@RequestBody Course course) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(course.getIdString()))
                success = courseService.deleteAll(course.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除课程失败！", e);
        }
        return new ReturnT<>(success);
    }
}

package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.exam.mapper.CourseMapper;
import com.github.tangyi.exam.module.Course;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 课程service
 *
 * @author tangyi
 * @date 2018/11/8 21:18
 */
@Service
@Transactional(readOnly = true)
public class CourseService extends CrudService<CourseMapper, Course> {
}

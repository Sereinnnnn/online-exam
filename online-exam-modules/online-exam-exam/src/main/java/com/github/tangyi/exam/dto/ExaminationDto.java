package com.github.tangyi.exam.dto;

import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.module.Examination;

/**
 * @author tangyi
 * @date 2018/11/2022:02
 */
public class ExaminationDto extends Examination {

    private Course course;

    public ExaminationDto() {

    }

    public ExaminationDto(Course course) {
        this.course = course;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
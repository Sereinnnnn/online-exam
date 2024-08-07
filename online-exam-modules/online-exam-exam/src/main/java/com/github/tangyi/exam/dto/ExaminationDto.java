package com.github.tangyi.exam.dto;

import com.github.tangyi.exam.module.Course;
import com.github.tangyi.exam.module.Examination;
import lombok.Data;

/**
 * @author tangyi
 * @date 2018/11/20 22:02
 */
@Data
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

package com.github.tangyi.exam.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 成绩
 *
 * @author tangyi
 * @date 2018/11/8 21:02
 */
public class Score extends BaseEntity<Score> {

    /**
     * 考生ID
     */
    private String userId;

    /**
     * 考试ID
     */
    private String examinationId;

    /**
     * 课程ID
     */
    private String courseId;

    /**
     * 成绩
     */
    private String score;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(String examinationId) {
        this.examinationId = examinationId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}

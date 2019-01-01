package com.github.tangyi.exam.dto;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 成绩DTO
 *
 * @author tangyi
 * @date 2018/12/30 23:08
 */
public class ScoreDto extends BaseEntity<ScoreDto> {


    /**
     * 考生ID
     */
    private String userId;

    /**
     * 考试名称
     */
    private String examinationName;

    /**
     * 成绩
     */
    private String score;

    /**
     * 考生名称
     */
    private String userName;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 考试时间
     */
    private String examTime;

    public String getExaminationName() {
        return examinationName;
    }

    public void setExaminationName(String examinationName) {
        this.examinationName = examinationName;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}

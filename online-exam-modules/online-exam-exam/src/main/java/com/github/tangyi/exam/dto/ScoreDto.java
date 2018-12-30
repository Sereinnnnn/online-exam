package com.github.tangyi.exam.dto;

import com.github.tangyi.exam.module.Score;

/**
 * 成绩DTO
 *
 * @author tangyi
 * @date 2018/12/30 23:08
 */
public class ScoreDto extends Score {

    /**
     * 考试名称
     */
    private String examinationName;

    /**
     * 考试名称
     */
    private String userName;

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
}

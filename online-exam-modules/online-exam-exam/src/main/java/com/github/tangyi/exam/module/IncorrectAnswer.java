package com.github.tangyi.exam.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 错题
 *
 * @author tangyi
 * @date 2018/11/8 21:06
 */
public class IncorrectAnswer extends BaseEntity<IncorrectAnswer> {

    /**
     * 考生ID
     */
    private String userId;

    /**
     * 考试ID
     */
    private String examinationId;

    /**
     * 题目ID
     */
    private String subjectId;

    /**
     * 错误答案
     */
    private String incorrectAnswer;

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

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getIncorrectAnswer() {
        return incorrectAnswer;
    }

    public void setIncorrectAnswer(String incorrectAnswer) {
        this.incorrectAnswer = incorrectAnswer;
    }
}

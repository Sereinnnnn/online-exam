package com.github.tangyi.exam.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 考试题目关联
 *
 * @author tangyi
 * @date 2018-11-14 9:35
 */
public class ExaminationSubject extends BaseEntity<ExaminationSubject> {

    private String examinationId;

    private String subjectId;

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
}

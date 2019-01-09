package com.github.tangyi.exam.dto;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * @author tangyi
 * @date 2019/1/9 20:58
 */
public class SubjectDto extends BaseEntity<SubjectDto> {

    /**
     * 考试ID
     */
    private String examinationId;

    public String getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(String examinationId) {
        this.examinationId = examinationId;
    }
}

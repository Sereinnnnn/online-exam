package com.github.tangyi.exam.dto;

import com.github.tangyi.common.persistence.BaseEntity;
import lombok.Data;

/**
 * @author tangyi
 * @date 2019/1/9 21:09
 */
@Data
public class SubjectBankDto extends BaseEntity<SubjectBankDto> {

    /**
     * 分类ID
     */
    private String categoryId;

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}

package com.github.tangyi.common.persistence;

import java.io.Serializable;

/**
 * 实体基类
 *
 * @author tangyi
 * @date 2018-08-24-18:56
 */
public class CommonEntity<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    protected String id;

    protected String creatorCode;	// 创建者

    protected String createDate;	// 创建日期

    protected String modifierCode;	// 更新者

    protected String modifyDate;	// 更新日期

    protected Integer delFlag;

    protected String applicationCode;
}

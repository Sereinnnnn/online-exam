package com.github.tangyi.exam.utils;

import java.util.LinkedHashMap;

/**
 * 题目工具类
 *
 * @author tangyi
 * @version V1.0
 * @date 2018-11-28 12:56
 */
public class SubjectUtil {

    /**
     * 获取Subject属性的map
     *
     * @return LinkedHashMap
     * @author tangyi
     * @date 2018/11/28 12:57
     */
    public static LinkedHashMap<String, String> getSubjectMap() {
        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
        map.put("id", "用户id");
        map.put("examinationId", "菜单名称");
        map.put("subjectName", "菜单权限标识");
        map.put("type", "url");
        map.put("content", "重定向url");
        map.put("optionA", "父菜单ID");
        map.put("optionB", "图标");
        map.put("optionC", "排序号");
        map.put("optionD", "类型");
        map.put("optionE", "模块");
        map.put("optionF", "路径");
        map.put("answer", "备注");
        map.put("score", "备注");
        map.put("analysis", "备注");
        map.put("level", "备注");
        map.put("creator", "创建人");
        map.put("createDate", "创建时间");
        map.put("modifier", "修改人");
        map.put("modifyDate", "修改时间");
        map.put("delFlag", "删除标记");
        map.put("applicationCode", "系统编码");
        return map;
    }
}

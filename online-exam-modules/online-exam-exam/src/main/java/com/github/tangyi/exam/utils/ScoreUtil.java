package com.github.tangyi.exam.utils;

import java.util.LinkedHashMap;

/**
 * 成绩工具类
 *
 * @author tangyi
 * @date 2018/12/31 22:35
 */
public class ScoreUtil {

    /**
     * 获取ScoreDto属性的map
     *
     * @return LinkedHashMap
     * @author tangyi
     * @date 2018/12/31 22:35
     */
    public static LinkedHashMap<String, String> getScoreDtoMap() {
        LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
        map.put("id", "成绩id");
        map.put("examinationName", "考试名称");
        map.put("userName", "考生名称");
        map.put("deptName", "部门名称");
        map.put("score", "成绩");
        map.put("examTime", "考试时间");
        return map;
    }
}

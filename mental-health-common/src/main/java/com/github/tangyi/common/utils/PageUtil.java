package com.github.tangyi.common.utils;

/**
 * 分页查询工具类
 *
 * @author tangyi
 * @date 2018/12/4 0004 20:16
 */
public class PageUtil {

    /**
     * 降序
     */
    private static final String DESC = "descending";

    /**
     * 升序
     */
    private static final String ASC = "ascending";

    /**
     * 排序SQL
     *
     * @param sort  排序字段
     * @param order 顺序
     * @return String
     * @author tangyi
     * @date 2018/12/04 20:18
     */
    public static String orderBy(String sort, String order) {
        if (DESC.equals(order)) {
            order = " desc";
        } else if (ASC.equals(order)) {
            order = " asc";
        }
        return sort + order;
    }
}

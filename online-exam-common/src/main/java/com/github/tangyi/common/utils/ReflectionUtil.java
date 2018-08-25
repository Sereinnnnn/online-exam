package com.github.tangyi.common.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * 反射工具类
 *
 * @author tangyi
 * @date 2018-08-25-17:28
 */
public class ReflectionUtil {

    /**
     * 获取泛型
     *
     * @param clazz
     * @param index
     * @return
     */
    public static Class getClassGenricType(final Class clazz, int index) {
        Type genType = clazz.getGenericSuperclass();
        if (!(genType instanceof ParameterizedType)) {
            return Object.class;
        }
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        if (index >= params.length || index < 0) {
            return Object.class;
        }
        if (!(params[index] instanceof Class)) {
            return Object.class;
        }
        return (Class) params[index];
    }
}

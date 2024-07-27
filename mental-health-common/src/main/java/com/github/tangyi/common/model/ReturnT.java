package com.github.tangyi.common.model;

import java.io.Serializable;

/**
 * 封装返回数据
 *
 * @author tangyi
 * @date 2018/8/26 0026 14:30
 */
public class ReturnT <T> implements Serializable {

    public static final long serialVersionUID = 42L;

    public static final int NO_LOGIN = -1;

    public static final int SUCCESS = 0;

    public static final int FAIL = 1;

    public static final int NO_PERMISSION = 2;

    private String msg = "success";

    private int code = SUCCESS;

    private T data;

    public ReturnT() {
        super();
    }

    public ReturnT(T data) {
        super();
        this.data = data;
    }

    public ReturnT(T data, String msg) {
        super();
        this.data = data;
        this.msg = msg;
    }

    public ReturnT(Throwable e) {
        super();
        this.msg = e.getMessage();
        this.code = FAIL;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}

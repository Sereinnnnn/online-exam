package com.github.tangyi.common.vo;

import java.io.Serializable;

/**
 * 导出vo
 *
 * @author tangyi
 * @date 2019-01-09 14:23
 */
public class ExportVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String ids;

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }
}

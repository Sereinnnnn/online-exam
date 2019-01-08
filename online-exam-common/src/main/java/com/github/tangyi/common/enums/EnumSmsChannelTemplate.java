package com.github.tangyi.common.enums;

/**
 * 短信通道模板
 *
 * @author tangyi
 * @date 2019-01-08 16:13
 */
public enum EnumSmsChannelTemplate {

    /**
     * 登录验证
     */
    LOGIN_NAME_LOGIN("loginCodeChannel", "登录验证"),

    /**
     * 服务异常提醒
     */
    SERVICE_STATUS_CHANGE("serviceStatusChange", "online-exam");

    /**
     * 模板名称
     */
    private String template;

    /**
     * 模板签名
     */
    private String signName;

    EnumSmsChannelTemplate(String template, String signName) {
        this.template = template;
        this.signName = signName;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getSignName() {
        return signName;
    }

    public void setSignName(String signName) {
        this.signName = signName;
    }
}

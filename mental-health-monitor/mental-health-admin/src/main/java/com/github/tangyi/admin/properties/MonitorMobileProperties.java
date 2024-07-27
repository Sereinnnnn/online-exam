package com.github.tangyi.admin.properties;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;

import java.util.ArrayList;
import java.util.List;

/**
 * 移动端配置
 *
 * @author tangyi
 * @date 2019-01-08 16:01
 */
@ConditionalOnExpression("!'${mobiles}'.isEmpty()")
public class MonitorMobileProperties {

    /**
     * 是否开启
     */
    private Boolean enabled;

    /**
     * 通知列表
     */
    private List<String> mobiles = new ArrayList<>();

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<String> getMobiles() {
        return mobiles;
    }

    public void setMobiles(List<String> mobiles) {
        this.mobiles = mobiles;
    }
}

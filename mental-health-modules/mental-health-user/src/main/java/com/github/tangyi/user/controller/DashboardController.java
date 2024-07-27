package com.github.tangyi.user.controller;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.dto.DashboardDto;
import com.github.tangyi.user.feign.ExaminationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 后台首页数据展示
 *
 * @author tangyi
 * @date 2019-03-01 13:54
 */
@Api("后台首页数据展示")
@RestController
@RequestMapping("/api/v1/dashboard")
public class DashboardController extends BaseController {

    @Autowired
    private ExaminationService examinationService;

    /**
     * 获取管控台首页数据
     *
     * @param
     * @return ReturnT
     * @author tangyi
     * @date 2019/3/1 13:55
     */
    @ApiOperation(value = "后台首页数据展示", notes = "后台首页数据展示")
    @GetMapping
    @SuppressWarnings("unchecked")
    public ReturnT<DashboardDto> dashboard() {
        DashboardDto dashboardDto = new DashboardDto();
        // TODO 从redis里获取在线用户数
        dashboardDto.setOnlineUserNumber("790");
        // 查询考试数量
        dashboardDto.setExaminationNumber(examinationService.findExaminationCount().getData() + "");
        return new ReturnT<>(dashboardDto);
    }
}

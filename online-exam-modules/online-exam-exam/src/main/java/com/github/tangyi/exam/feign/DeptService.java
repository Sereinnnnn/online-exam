package com.github.tangyi.exam.feign;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.DeptVo;
import com.github.tangyi.exam.feign.fallback.DeptServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.context.annotation.Primary;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 部门服务接口
 *
 * @author tangyi
 * @date 2018/12/31 22:04
 */
@FeignClient(name = "online-exam-user", fallback = DeptServiceFallBackImpl.class)
@Primary
public interface DeptService {

    /**
     * 根据部门id获取部门
     *
     * @param deptVo deptVo
     * @return ReturnT
     */
    @RequestMapping(value = "/api/v1/dept/findById", method = RequestMethod.POST)
    ReturnT<List<DeptVo>> findById(@RequestBody DeptVo deptVo);
}

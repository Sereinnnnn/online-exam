package com.github.tangyi.exam.feign;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.AttachmentVo;
import com.github.tangyi.exam.feign.fallback.AttachmentServiceFallBackImpl;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 附件服务接口
 *
 * @author tangyi
 * @date 2019/1/1 20:41
 */
@FeignClient(name = "online-exam-user", fallback = AttachmentServiceFallBackImpl.class)
public interface AttachmentService {

    /**
     * 根据ID删除附件
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2019/01/01 20:44
     */
    @DeleteMapping("/attachment/{id}")
    ReturnT<Boolean> delete(@PathVariable(value = "id") String id);

    /**
     * 根据附件id获取附件
     *
     * @param attachmentVo attachmentVo
     * @return ReturnT
     */
    @RequestMapping(value = "/attachment/findById", method = RequestMethod.POST)
    ReturnT<List<AttachmentVo>> findById(@RequestBody AttachmentVo attachmentVo);
}

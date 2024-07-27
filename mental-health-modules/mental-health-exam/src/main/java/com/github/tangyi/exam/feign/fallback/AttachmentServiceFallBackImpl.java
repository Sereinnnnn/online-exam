package com.github.tangyi.exam.feign.fallback;

import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.vo.AttachmentVo;
import com.github.tangyi.exam.feign.AttachmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 附件服务熔断
 *
 * @author tangyi
 * @date 2019/1/1 20:42
 */
@Service
public class AttachmentServiceFallBackImpl implements AttachmentService {

    private static final Logger logger = LoggerFactory.getLogger(AttachmentServiceFallBackImpl.class);

    @Override
    public ReturnT<Boolean> delete(String id) {
        logger.error("调用{}异常:{}", "delete", id);
        return new ReturnT<>(Boolean.FALSE);
    }

    @Override
    public ReturnT<List<AttachmentVo>> findById(AttachmentVo attachmentVo) {
        logger.error("调用{}异常:{}", "findById", attachmentVo);
        return new ReturnT<>(new ArrayList<>());
    }
}

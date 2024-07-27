package com.github.tangyi.user.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.user.mapper.AttachmentMapper;
import com.github.tangyi.user.module.Attachment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author tangyi
 * @date 2018/10/30 20:55
 */
@Service
@Transactional(readOnly = true)
public class AttachmentService extends CrudService<AttachmentMapper, Attachment> {


}

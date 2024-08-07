package com.github.tangyi.user.mapper;

import com.github.tangyi.common.persistence.CrudMapper;
import com.github.tangyi.user.module.Attachment;
import com.github.tangyi.user.module.Dept;
import org.apache.ibatis.annotations.Mapper;

/**
 * 附件mapper
 *
 * @author tangyi
 * @date 2018/10/30 20:55
 */
@Mapper
public interface AttachmentMapper extends CrudMapper<Attachment> {
}

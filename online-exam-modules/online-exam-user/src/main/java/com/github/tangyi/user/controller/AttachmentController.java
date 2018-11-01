package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.exception.CommonException;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.FileUtil;
import com.github.tangyi.common.utils.LogUtil;
import com.github.tangyi.common.utils.Servlets;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.module.Attachment;
import com.github.tangyi.user.service.AttachmentService;
import com.github.tangyi.user.service.FastDfsService;
import com.github.tangyi.user.service.LogService;
import com.google.common.net.HttpHeaders;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

/**
 * 附件管理
 *
 * @author tangyi
 * @date 2018/10/30 0030 20:45
 */
@RestController
@RequestMapping("/attachment")
public class AttachmentController extends BaseController {

    @Autowired
    private LogService logService;

    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private FastDfsService fastDfsService;

    /**
     * 分页查询
     *
     * @param params     params
     * @param attachment attachment
     * @return PageInfo
     * @author tangyi
     * @date 2018/10/30 21:05
     */
    @RequestMapping("attachmentList")
    public PageInfo<Attachment> userList(@RequestParam Map<String, String> params, Attachment attachment) {
        PageInfo<Attachment> page = new PageInfo<Attachment>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        return attachmentService.findPage(page, attachment);
    }

    /**
     * 上传文件
     *
     * @param file       file
     * @param attachment attachment
     * @author tangyi
     * @date 2018/10/30 21:54
     */
    @RequestMapping("upload")
    public ReturnT<Attachment> upload(@RequestParam("file") MultipartFile file, Attachment attachment, HttpServletRequest request) {
        long start = System.currentTimeMillis();
        logger.debug("{}", file.getName());
        if (file.isEmpty())
            return new ReturnT<Attachment>(new Attachment());
        InputStream inputStream = null;
        Attachment newAttachment = null;
        try {
            inputStream = file.getInputStream();
            long attachSize = file.getSize();
            String fastFileId = fastDfsService.uploadFile(inputStream, attachSize, FileUtil.getFileNameEx(file.getOriginalFilename()));
            logger.debug("fastFileId:{}", fastFileId);
            if (StringUtils.isBlank(fastFileId))
                throw new CommonException("上传失败！");
            newAttachment = new Attachment();
            newAttachment.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
            newAttachment.setGroupName(fastFileId.substring(0, fastFileId.indexOf("/")));
            newAttachment.setFastFileId(fastFileId);
            newAttachment.setAttachName(new String(file.getOriginalFilename().getBytes(), "utf-8"));
            newAttachment.setAttachSize(Long.toString(attachSize));
            newAttachment.setBusiId(attachment.getBusiId());
            newAttachment.setBusiModule(attachment.getBusiModule());
            newAttachment.setBusiType(attachment.getBusiType());
            attachmentService.insert(newAttachment);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "上传附件"));
        } finally {
            IOUtils.closeQuietly(inputStream);
        }
        logger.info("上传文件{}成功，耗时：{}ms", file.getName(), System.currentTimeMillis() - start);
        return new ReturnT<Attachment>(newAttachment);
    }

    /**
     * 下载文件
     *
     * @param id id
     * @author tangyi
     * @date 2018/10/30 22:26
     */
    @RequestMapping("download")
    public void download(String id, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtils.isBlank(id))
            throw new IllegalArgumentException("附件ID不能为空！");
        Attachment attachment = new Attachment();
        attachment.setId(id);
        attachment = attachmentService.get(attachment);
        if (attachment == null)
            throw new CommonException("附件不存在！");
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            // 下载附件
            inputStream = fastDfsService.downloadStream(attachment.getGroupName(), attachment.getFastFileId());
            outputStream = response.getOutputStream();  // 输出流
            response.setContentType("application/zip");
            response.setHeader(HttpHeaders.CACHE_CONTROL, "max-age=10");
            // IE之外的浏览器使用编码输出名称
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, attachment.getAttachName()));
            response.setContentLength(inputStream.available());
            FileCopyUtils.copy(inputStream, outputStream);  // 下载文件
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            logService.insert(LogUtil.getLog(request, SysUtil.getUser(), e, "下载附件"));
        } finally {
            IOUtils.closeQuietly(outputStream);
            IOUtils.closeQuietly(inputStream);
        }
    }

    /**
     * 删除附件
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/10/30 22:44
     */
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> delete(@PathVariable String id) {
        if (StringUtils.isBlank(id))
            throw new IllegalArgumentException("附件ID不能为空！");
        Attachment attachment = new Attachment();
        attachment.setId(id);
        attachment = attachmentService.get(attachment);
        boolean success = false;
        if (attachment != null) {
            fastDfsService.deleteFile(attachment.getGroupName(), attachment.getFastFileId());
            success = attachmentService.delete(attachment) > 0;
        }
        return new ReturnT<>(success);
    }
}

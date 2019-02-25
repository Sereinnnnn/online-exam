package com.github.tangyi.user.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.exception.CommonException;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.vo.AttachmentVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.config.AttachmentConfig;
import com.github.tangyi.user.module.Attachment;
import com.github.tangyi.user.service.AttachmentService;
import com.github.tangyi.user.service.FastDfsService;
import com.github.tangyi.user.service.LogService;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 附件管理
 *
 * @author tangyi
 * @date 2018/10/30 20:45
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

    @Autowired
    private AttachmentConfig attachmentConfig;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2019/01/01 19:56
     */
    @ApiOperation(value = "获取附件信息", notes = "根据附件id获取附件详细信息")
    @ApiImplicitParam(name = "id", value = "附件ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<Attachment> attachment(@PathVariable String id) {
        Attachment attachment = new Attachment();
        if (StringUtils.isNotBlank(id)) {
            attachment.setId(id);
            attachment = attachmentService.get(attachment);
        }
        return new ReturnT<>(attachment);
    }

    /**
     * 分页查询
     *
     * @param params     params
     * @param attachment attachment
     * @return PageInfo
     * @author tangyi
     * @date 2018/10/30 21:05
     */
    @ApiOperation(value = "获取附件集合")
    @RequestMapping("attachmentList")
    public PageInfo<Attachment> userList(@RequestParam Map<String, String> params, Attachment attachment) {
        PageInfo<Attachment> page = new PageInfo<Attachment>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
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
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            if (attachment == null)
                throw new CommonException("附件不存在！");
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
    @ApiOperation(value = "删除附件", notes = "根据ID删除附件")
    @ApiImplicitParam(name = "id", value = "附件ID", required = true, paramType = "path")
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

    /**
     * 批量删除
     *
     * @param attachment attachment
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 10:01
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllAttachments(@RequestBody Attachment attachment) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(attachment.getIdString()))
                success = attachmentService.deleteAll(attachment.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除附件失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 根据附件ID批量查询
     *
     * @param attachmentVo attachmentVo
     * @return ReturnT
     * @author tangyi
     * @date 2019/01/01 22:16
     */
    @RequestMapping(value = "/findById", method = RequestMethod.POST)
    public ReturnT<List<AttachmentVo>> findById(@RequestBody AttachmentVo attachmentVo) {
        ReturnT<List<AttachmentVo>> returnT = null;
        Attachment attachment = new Attachment();
        attachment.setIds(attachmentVo.getIds());
        List<Attachment> attachmentList = attachmentService.findListById(attachment);
        if (CollectionUtils.isNotEmpty(attachmentList)) {
            List<AttachmentVo> attachmentVoList = new ArrayList<>();
            attachmentList.forEach(tempAttachment -> {
                AttachmentVo tempAttachmentVo = new AttachmentVo();
                BeanUtils.copyProperties(tempAttachment, tempAttachmentVo);
                attachmentVoList.add(tempAttachmentVo);
            });
            returnT = new ReturnT<>(attachmentVoList);
        }
        return returnT;
    }

    /**
     * 获取附件配置
     *
     * @return ReturnT
     * @author tangyi
     * @date 2019/2/24 20:17
     */
    @GetMapping("attachmentConfig")
    public ReturnT<AttachmentConfig> attachmentConfig() {
        return new ReturnT<>(attachmentConfig);
    }
}

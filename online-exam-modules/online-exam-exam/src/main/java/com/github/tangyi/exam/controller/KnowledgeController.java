package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.vo.AttachmentVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.KnowledgeDto;
import com.github.tangyi.exam.feign.AttachmentService;
import com.github.tangyi.exam.module.Knowledge;
import com.github.tangyi.exam.service.KnowledgeService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 知识库controller
 *
 * @author tangyi
 * @date 2019/1/1 15:11
 */
@RestController
@RequestMapping("/knowledge")
public class KnowledgeController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(KnowledgeController.class);

    @Autowired
    private KnowledgeService knowledgeService;

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @GetMapping("/{id}")
    public ReturnT<Knowledge> knowledge(@PathVariable String id) {
        Knowledge knowledge = new Knowledge();
        if (StringUtils.isNotBlank(id)) {
            knowledge.setId(id);
            knowledge = knowledgeService.get(knowledge);
        }
        return new ReturnT<>(knowledge);
    }

    /**
     * 获取分页数据
     *
     * @param params    params
     * @param knowledge knowledge
     * @return PageInfo
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @RequestMapping("knowledgeList")
    public PageInfo<KnowledgeDto> knowledgeList(@RequestParam Map<String, String> params, Knowledge knowledge) {
        PageInfo<Knowledge> page = new PageInfo<Knowledge>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
        // 查询知识
        PageInfo<Knowledge> knowledgePageInfo = knowledgeService.findPage(page, knowledge);
        PageInfo<KnowledgeDto> knowledgeDtoPageInfo = new PageInfo<>();
        List<KnowledgeDto> knowledgeDtoList = new ArrayList<>();

        // 查询附件
        Set<String> attachmentIdSet = new HashSet<>();
        knowledgePageInfo.getList().forEach(tempKnowledge -> {
            attachmentIdSet.add(tempKnowledge.getAttachmentId());
        });
        AttachmentVo attachmentVo = new AttachmentVo();
        attachmentVo.setIds(attachmentIdSet.toArray(new String[attachmentIdSet.size()]));
        // 根据附件ID查询附件
        ReturnT<List<AttachmentVo>> returnT = attachmentService.findById(attachmentVo);
        for (Knowledge tempKnowledge : knowledgePageInfo.getList()) {
            KnowledgeDto knowledgeDto = new KnowledgeDto();
            BeanUtils.copyProperties(tempKnowledge, knowledgeDto);
            if (returnT != null && CollectionUtils.isNotEmpty(returnT.getData())) {
                for (AttachmentVo tempAttachmentVo : returnT.getData()) {
                    // 设置附件名称和大小
                    if (tempAttachmentVo.getId().equals(tempKnowledge.getAttachmentId())) {
                        knowledgeDto.setAttachName(tempAttachmentVo.getAttachName());
                        knowledgeDto.setAttachSize(tempAttachmentVo.getAttachSize());
                        break;
                    }
                }
            }
            knowledgeDtoList.add(knowledgeDto);
        }
        knowledgeDtoPageInfo.setList(knowledgeDtoList);
        knowledgeDtoPageInfo.setTotal(knowledgePageInfo.getTotal());
        knowledgeDtoPageInfo.setPageNum(knowledgePageInfo.getPageNum());
        knowledgeDtoPageInfo.setPageSize(knowledgePageInfo.getPageSize());
        return knowledgeDtoPageInfo;
    }

    /**
     * 创建
     *
     * @param knowledge knowledge
     * @return ReturnT
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @PostMapping
    public ReturnT<Boolean> addKnowledge(@RequestBody Knowledge knowledge) {
        knowledge.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(knowledgeService.insert(knowledge) > 0);
    }

    /**
     * 更新
     *
     * @param knowledge knowledge
     * @return ReturnT
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @PutMapping
    public ReturnT<Boolean> updateKnowledge(@RequestBody Knowledge knowledge) {
        knowledge.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(knowledgeService.update(knowledge) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteKnowledge(@PathVariable String id) {
        boolean success = false;
        try {
            Knowledge knowledge = new Knowledge();
            knowledge.setId(id);
            knowledge = knowledgeService.get(knowledge);
            if (knowledge != null) {
                knowledge.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = knowledgeService.delete(knowledge) > 0;
            }
            // 删除附件
            if (StringUtils.isNotBlank(knowledge.getAttachmentId()))
                success = attachmentService.delete(knowledge.getAttachmentId()).getData();
        } catch (Exception e) {
            logger.error("删除知识失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 批量删除
     *
     * @param idMap idMap
     * @return ReturnT
     * @author tangyi
     * @date 2019/1/1 15:15
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllKnowledge(@RequestBody Map<String, String> idMap) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(idMap.get("ids")))
                success = knowledgeService.deleteAll(idMap.get("ids").split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除知识失败！", e);
        }
        return new ReturnT<>(success);
    }
}

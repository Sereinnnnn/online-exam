package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.SubjectBank;
import com.github.tangyi.exam.service.SubjectBankService;
import com.github.tangyi.exam.utils.SubjectBankUtil;
import com.google.common.net.HttpHeaders;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 题库controller
 *
 * @author tangyi
 * @date 2018/12/9 14:12
 */
@RestController
@RequestMapping("/subjectBank")
public class SubjectBankController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(SubjectBankController.class);

    @Autowired
    private SubjectBankService subjectBankService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:12
     */
    @GetMapping("/{id}")
    public ReturnT<SubjectBank> subjectBank(@PathVariable String id) {
        SubjectBank subjectBank = new SubjectBank();
        if (StringUtils.isNotBlank(id)) {
            subjectBank.setId(id);
            subjectBank = subjectBankService.get(subjectBank);
        }
        return new ReturnT<>(subjectBank);
    }

    /**
     * 获取分页数据
     *
     * @param params      params
     * @param subjectBank subjectBank
     * @return PageInfo
     * @author tangyi
     * @date 2018/12/9 14:13
     */
    @RequestMapping("subjectBankList")
    public PageInfo<SubjectBank> subjectBankList(@RequestParam Map<String, String> params, SubjectBank subjectBank) {
        PageInfo<SubjectBank> page = new PageInfo<SubjectBank>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
        return subjectBankService.findPage(page, subjectBank);
    }

    /**
     * 创建
     *
     * @param subjectBank subjectBank
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:14
     */
    @PostMapping
    public ReturnT<Boolean> addSubjectBank(@RequestBody SubjectBank subjectBank) {
        subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(subjectBankService.insert(subjectBank) > 0);
    }

    /**
     * 更新
     *
     * @param subjectBank subjectBank
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:15
     */
    @PutMapping
    public ReturnT<Boolean> updateSubjectBank(@RequestBody SubjectBank subjectBank) {
        subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<Boolean>(subjectBankService.update(subjectBank) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:15
     */
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteSubjectBank(@PathVariable String id) {
        try {
            SubjectBank subjectBank = new SubjectBank();
            subjectBank.setId(id);
            subjectBank = subjectBankService.get(subjectBank);
            if (subjectBank != null) {
                subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                subjectBankService.delete(subjectBank);
            }
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }

    /**
     * 导出题目
     *
     * @param ids        用户id，多个用逗号分隔
     * @param categoryId 分类id
     * @author tangyi
     * @date 2018/12/9 14:16
     */
    @GetMapping("/export")
    public void exportSubjectBank(String ids, String categoryId, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "题目信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<SubjectBank> subjectBanks = new ArrayList<>();
            // 根据题目id导出
            if (StringUtils.isNotEmpty(ids)) {
                for (String id : ids.split(",")) {
                    SubjectBank subjectBank = new SubjectBank();
                    subjectBank.setId(id);
                    subjectBank = subjectBankService.get(subjectBank);
                    if (subjectBank != null)
                        subjectBanks.add(subjectBank);
                }
            } else if (StringUtils.isNotBlank(categoryId)) {    // 根据分类ID导出
                SubjectBank subjectBank = new SubjectBank();
                subjectBank.setCategoryId(categoryId);
                subjectBanks = subjectBankService.findList(subjectBank);
            }
            ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(subjectBanks), SubjectBankUtil.getSubjectBankMap());
        } catch (Exception e) {
            logger.error("导出题目数据失败！", e);
        }
    }

    /**
     * 导入数据
     *
     * @param categoryId categoryId
     * @param file       file
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:19
     */
    @RequestMapping("/import")
    public ReturnT<Boolean> importSubjectBank(String categoryId, MultipartFile file) {
        try {
            logger.debug("开始导入题目数据，分类ID：{}", categoryId);
            List<SubjectBank> subjectBanks = MapUtil.map2Java(SubjectBank.class,
                    ExcelToolUtil.importExcel(file.getInputStream(), SubjectBankUtil.getSubjectBankMap()));
            if (CollectionUtils.isNotEmpty(subjectBanks)) {
                for (SubjectBank subjectBank : subjectBanks) {
                    // 初始化考试ID
                    if (StringUtils.isBlank(subjectBank.getId())) {
                        subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                        subjectBank.setCategoryId(categoryId);
                        subjectBankService.insert(subjectBank);
                    } else {
                        // 绑定分类ID
                        if (StringUtils.isNotBlank(categoryId))
                            subjectBank.setCategoryId(categoryId);
                        subjectBankService.update(subjectBank);
                    }
                }
            }
            return new ReturnT<>(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入题目数据失败！", e);
        }
        return new ReturnT<>(Boolean.FALSE);
    }

    /**
     * 批量删除
     *
     * @param subjectBank subjectBank
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 9:55
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteSubjectBanks(@RequestBody SubjectBank subjectBank) {
        try {
            if (StringUtils.isNotEmpty(subjectBank.getIds()))
                subjectBankService.deleteAll(subjectBank.getIds().split(","));
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<Boolean>(Boolean.TRUE);
    }
}

package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.SubjectBankDto;
import com.github.tangyi.exam.module.SubjectBank;
import com.github.tangyi.exam.module.SubjectCategory;
import com.github.tangyi.exam.service.SubjectBankService;
import com.github.tangyi.exam.service.SubjectCategoryService;
import com.github.tangyi.exam.utils.SubjectBankUtil;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
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
import java.util.*;

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

    @Autowired
    private SubjectCategoryService subjectCategoryService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:12
     */
    @ApiOperation(value = "获取题库信息", notes = "根据题库id获取题库详细信息")
    @ApiImplicitParam(name = "id", value = "题库ID", required = true, dataType = "String", paramType = "path")
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
    @ApiOperation(value = "获取题库列表")
    @RequestMapping("subjectBankList")
    public PageInfo<SubjectBank> subjectBankList(@RequestParam Map<String, String> params, SubjectBank subjectBank) {
        PageInfo<SubjectBank> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageHelper.orderBy(PageUtil.orderBy(params.getOrDefault("sort", CommonConstant.PAGE_SORT_DEFAULT), params.getOrDefault("order", CommonConstant.PAGE_ORDER_DEFAULT)));
        page = subjectBankService.findPage(page, subjectBank);
        if (CollectionUtils.isNotEmpty(page.getList())) {
            // 查询分类信息
            Set<String> categoryIdSet = new HashSet<>();
            page.getList().forEach(tempSubjectBank -> {
                categoryIdSet.add(tempSubjectBank.getCategoryId());
            });
            SubjectCategory subjectCategory = new SubjectCategory();
            subjectCategory.setIds(categoryIdSet.toArray(new String[categoryIdSet.size()]));
            List<SubjectCategory> subjectCategoryList = subjectCategoryService.findListById(subjectCategory);
            page.getList().forEach(tempSubjectBank -> {
                for (SubjectCategory tempSubjectCategory : subjectCategoryList) {
                    if (tempSubjectCategory.getId().equals(tempSubjectBank.getCategoryId())) {
                        // 设置分类名称
                        tempSubjectBank.setCategoryName(tempSubjectCategory.getCategoryName());
                        break;
                    }
                }
            });
        }
        return page;
    }

    /**
     * 创建
     *
     * @param subjectBank subjectBank
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:14
     */
    @ApiOperation(value = "创建题库", notes = "创建题库")
    @ApiImplicitParam(name = "subjectBank", value = "题库实体subjectBank", required = true, dataType = "SubjectBank")
    @PostMapping
    public ReturnT<Boolean> addSubjectBank(@RequestBody SubjectBank subjectBank) {
        subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(subjectBankService.insert(subjectBank) > 0);
    }

    /**
     * 更新
     *
     * @param subjectBank subjectBank
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:15
     */
    @ApiOperation(value = "更新题库信息", notes = "根据题库id更新题库的基本信息")
    @ApiImplicitParam(name = "subjectBank", value = "题库实体subjectBank", required = true, dataType = "SubjectBank")
    @PutMapping
    public ReturnT<Boolean> updateSubjectBank(@RequestBody SubjectBank subjectBank) {
        subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(subjectBankService.update(subjectBank) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/9 14:15
     */
    @ApiOperation(value = "删除题库", notes = "根据ID删除题库")
    @ApiImplicitParam(name = "id", value = "题库ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteSubjectBank(@PathVariable String id) {
        boolean success = false;
        try {
            SubjectBank subjectBank = new SubjectBank();
            subjectBank.setId(id);
            subjectBank = subjectBankService.get(subjectBank);
            if (subjectBank != null) {
                subjectBank.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = subjectBankService.delete(subjectBank) > 0;
            }
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 导出题目
     *
     * @param subjectBankDto subjectBankDto
     * @author tangyi
     * @date 2018/12/9 14:16
     */
    @PostMapping("/export")
    public void exportSubjectBank(@RequestBody SubjectBankDto subjectBankDto, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "题目信息" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<SubjectBank> subjectBanks = new ArrayList<>();
            // 根据题目id导出
            if (StringUtils.isNotEmpty(subjectBankDto.getIdString())) {
                for (String id : subjectBankDto.getIdString().split(",")) {
                    SubjectBank subjectBank = new SubjectBank();
                    subjectBank.setId(id);
                    subjectBank = subjectBankService.get(subjectBank);
                    if (subjectBank != null)
                        subjectBanks.add(subjectBank);
                }
            } else if (StringUtils.isNotBlank(subjectBankDto.getCategoryId())) {    // 根据分类ID导出
                SubjectBank subjectBank = new SubjectBank();
                subjectBank.setCategoryId(subjectBankDto.getCategoryId());
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
     * @param subjectBankDto subjectBankDto
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/04 9:55
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteSubjectBanks(@RequestBody SubjectBankDto subjectBankDto) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(subjectBankDto.getIdString()))
                success = subjectBankService.deleteAll(subjectBankDto.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除题目失败！", e);
        }
        return new ReturnT<>(success);
    }
}

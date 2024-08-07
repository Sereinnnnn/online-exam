package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.IncorrectAnswerDto;
import com.github.tangyi.exam.module.IncorrectAnswer;
import com.github.tangyi.exam.module.Subject;
import com.github.tangyi.exam.service.IncorrectAnswerService;
import com.github.tangyi.exam.service.SubjectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 错题controller
 *
 * @author tangyi
 * @date 2018/11/8 21:28
 */
@Api("错题信息管理")
@RestController
@RequestMapping("/api/v1/incorrectAnswer")
public class IncorrectAnswerController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(IncorrectAnswerController.class);

    @Autowired
    private IncorrectAnswerService incorrectAnswerService;

    @Autowired
    private SubjectService subjectService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:36
     */
    @ApiOperation(value = "获取错题信息", notes = "根据错题id获取错题详细信息")
    @ApiImplicitParam(name = "id", value = "错题ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<IncorrectAnswer> examRecode(@PathVariable String id) {
        IncorrectAnswer incorrectAnswer = new IncorrectAnswer();
        if (StringUtils.isNotBlank(id)) {
            incorrectAnswer.setId(id);
            incorrectAnswer = incorrectAnswerService.get(incorrectAnswer);
        }
        return new ReturnT<>(incorrectAnswer);
    }

    /**
     * 获取分页数据
     *
     * @param pageNum         pageNum
     * @param pageSize        pageSize
     * @param sort            sort
     * @param order           order
     * @param incorrectAnswer incorrectAnswer
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:37
     */
    @ApiOperation(value = "获取错题列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "incorrectAnswer", value = "错题信息", dataType = "IncorrectAnswer")
    })
    @RequestMapping("incorrectAnswerList")
    public PageInfo<IncorrectAnswerDto> incorrectAnswerList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                                            @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                                            @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                                            @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                                            IncorrectAnswer incorrectAnswer) {
        PageInfo<IncorrectAnswer> page = new PageInfo<IncorrectAnswer>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        PageHelper.orderBy(PageUtil.orderBy(sort, order));
        // 查找错题
        PageInfo<IncorrectAnswer> incorrectAnswerPageInfo = incorrectAnswerService.findPage(page, incorrectAnswer);
        PageInfo<IncorrectAnswerDto> pageInfo = new PageInfo<>();
        List<IncorrectAnswerDto> incorrectAnswerDtoList = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(incorrectAnswerPageInfo.getList())) {
            Set<String> subjectIds = new HashSet<>();
            incorrectAnswerPageInfo.getList().forEach(incorrect -> {
                subjectIds.add(incorrect.getSubjectId());
            });
            Subject subject = new Subject();
            subject.setIds(subjectIds.toArray(new String[subjectIds.size()]));
            // 查找题目
            List<Subject> subjects = subjectService.findListById(subject);
            if (CollectionUtils.isNotEmpty(subjects)) {
                subjects.forEach(tempSubject -> {
                    incorrectAnswerPageInfo.getList().forEach(tempIncorrectAnswer -> {
                        if (tempSubject.getId().equalsIgnoreCase(tempIncorrectAnswer.getSubjectId())) {
                            IncorrectAnswerDto incorrectAnswerDto = new IncorrectAnswerDto();
                            BeanUtils.copyProperties(tempSubject, incorrectAnswerDto);
                            incorrectAnswerDto.setIncorrectAnswer(tempIncorrectAnswer.getIncorrectAnswer());
                            incorrectAnswerDtoList.add(incorrectAnswerDto);
                        }
                    });
                });
            }
        }
        pageInfo.setList(incorrectAnswerDtoList);
        return pageInfo;
    }

    /**
     * 创建
     *
     * @param incorrectAnswer incorrectAnswer
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:38
     */
    @ApiOperation(value = "创建错题", notes = "创建错题")
    @ApiImplicitParam(name = "incorrectAnswer", value = "错题实体incorrectAnswer", required = true, dataType = "IncorrectAnswer")
    @PostMapping
    public ReturnT<Boolean> addIncorrectAnswer(@RequestBody IncorrectAnswer incorrectAnswer) {
        incorrectAnswer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(incorrectAnswerService.insert(incorrectAnswer) > 0);
    }

    /**
     * 更新
     *
     * @param incorrectAnswer incorrectAnswer
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:38
     */
    @ApiOperation(value = "更新错题信息", notes = "根据错题id更新错题的基本信息")
    @ApiImplicitParam(name = "incorrectAnswer", value = "错题实体incorrectAnswer", required = true, dataType = "IncorrectAnswer")
    @PutMapping
    public ReturnT<Boolean> updateIncorrectAnswer(@RequestBody IncorrectAnswer incorrectAnswer) {
        incorrectAnswer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(incorrectAnswerService.update(incorrectAnswer) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:39
     */
    @ApiOperation(value = "删除错题", notes = "根据ID删除错题")
    @ApiImplicitParam(name = "id", value = "错题ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteIncorrectAnswer(@PathVariable String id) {
        boolean success = false;
        try {
            IncorrectAnswer incorrectAnswer = incorrectAnswerService.get(id);
            if (incorrectAnswer != null) {
                incorrectAnswer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = incorrectAnswerService.delete(incorrectAnswer) > 0;
            }
        } catch (Exception e) {
            logger.error("删除错题失败！", e);
        }
        return new ReturnT<>(success);
    }
}

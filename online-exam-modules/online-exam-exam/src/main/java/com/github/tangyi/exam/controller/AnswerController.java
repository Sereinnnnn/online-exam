package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.module.Answer;
import com.github.tangyi.exam.service.AnswerService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 答题controller
 *
 * @author tangyi
 * @date 2018/11/8 21:24
 */
@Api("答题信息管理")
@RestController
@RequestMapping("/api/v1/answer")
public class AnswerController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AnswerController.class);

    @Autowired
    private AnswerService answerService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:23
     */
    @ApiOperation(value = "获取答题信息", notes = "根据答题id获取答题详细信息")
    @ApiImplicitParam(name = "id", value = "答题ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<Answer> answer(@PathVariable String id) {
        Answer answer = new Answer();
        if (StringUtils.isNotBlank(id)) {
            answer.setId(id);
            answer = answerService.get(answer);
        }
        return new ReturnT<>(answer);
    }

    /**
     * 获取分页数据
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param answer   answer
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:25
     */
    @ApiOperation(value = "获取答题列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "answer", value = "答题信息", dataType = "Answer")
    })
    @RequestMapping("answerList")
    public PageInfo<Answer> answerList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                       @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                       @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                       @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                       Answer answer) {
        PageInfo<Answer> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        return answerService.findPage(page, answer);
    }

    /**
     * 创建
     *
     * @param answer answer
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:26
     */
    @ApiOperation(value = "创建答题", notes = "创建答题")
    @ApiImplicitParam(name = "answer", value = "答题实体answer", required = true, dataType = "Answer")
    @PostMapping
    public ReturnT<Boolean> addAnswer(@RequestBody Answer answer) {
        answer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(answerService.insert(answer) > 0);
    }

    /**
     * 更新
     *
     * @param answer answer
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:27
     */
    @ApiOperation(value = "更新答题信息", notes = "根据答题id更新答题的基本信息")
    @ApiImplicitParam(name = "answer", value = "答题实体answer", required = true, dataType = "Answer")
    @PutMapping
    public ReturnT<Boolean> updateAnswer(@RequestBody Answer answer) {
        answer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(answerService.update(answer) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:28
     */
    @ApiOperation(value = "删除答题", notes = "根据ID删除答题")
    @ApiImplicitParam(name = "id", value = "答题ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteAnswer(@PathVariable String id) {
        boolean success = false;
        try {
            Answer answer = answerService.get(id);
            if (answer != null) {
                answer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = answerService.delete(answer) > 0;
            }
        } catch (Exception e) {
            logger.error("删除答题失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 保存
     *
     * @param answer answer
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/24 20:06
     */
    @ApiOperation(value = "保存答题", notes = "保存答题")
    @ApiImplicitParam(name = "answer", value = "答题信息", dataType = "Answer")
    @PostMapping("saveOrUpdate")
    public ReturnT<Boolean> saveOrUpdate(@RequestBody Answer answer) {
        boolean success;
        Answer search = new Answer();
        BeanUtils.copyProperties(answer, search);
        search = answerService.getAnswer(search);
        if (search == null) {
            answer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
            success = answerService.insert(answer) > 0;
        } else {
            search.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
            search.setAnswer(answer.getAnswer());
            success = answerService.update(search) > 0;
        }
        return new ReturnT<>(success);
    }

    /**
     * 提交答卷
     *
     * @param answer answer
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/24 20:44
     */
    @ApiOperation(value = "提交答卷", notes = "提交答卷")
    @ApiImplicitParam(name = "answer", value = "答卷信息", dataType = "Answer")
    @PostMapping("submit")
    public ReturnT<Boolean> submit(@RequestBody Answer answer) {
        return new ReturnT<>(answerService.submit(answer));
    }
}

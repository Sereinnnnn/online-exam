package com.github.tangyi.user.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.Log;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.PageUtil;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.service.LogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 日志controller
 *
 * @author tangyi
 * @date 2018/10/31 20:48
 */
@Api("日志信息管理")
@RestController
@RequestMapping("/api/v1/log")
public class LogController extends BaseController {

    @Autowired
    private LogService logService;


    /**
     * 根据id获取日志
     *
     * @param id id
     * @return Log
     * @author tangyi
     * @date 2018/9/14 18:20
     */
    @ApiOperation(value = "获取日志信息", notes = "根据日志id获取日志详细信息")
    @ApiImplicitParam(name = "id", value = "日志ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public Log log(@PathVariable String id) {
        try {
            return logService.get(id);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return new Log();
    }

    /**
     * 日志分页查询
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param log      log
     * @return PageInfo
     * @author tangyi
     * @date 2018/10/24 0024 下午 10:13
     */
    @ApiOperation(value = "获取日志列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "pageSize", value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "sort", value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "order", value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "log", value = "日志信息", dataType = "Log")
    })
    @RequestMapping("logList")
    public PageInfo<Log> userList(@RequestParam(value = "pageNum", required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                  @RequestParam(value = "pageSize", required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                  @RequestParam(value = "sort", required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                  @RequestParam(value = "order", required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                  Log log) {
        PageInfo<Log> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        PageHelper.orderBy(PageUtil.orderBy(sort, order));
        return logService.findPage(page, log);
    }

    /**
     * 删除日志
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/10/31 21:27
     */
    @ApiOperation(value = "删除日志", notes = "根据ID删除日志")
    @ApiImplicitParam(name = "id", value = "日志ID", required = true, paramType = "path")
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> delete(@PathVariable String id) {
        Log log = new Log();
        log.setId(id);
        return new ReturnT<>(logService.delete(log) > 0);
    }

    /**
     * 批量删除
     *
     * @param log log
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 10:12
     */
    @ApiOperation(value = "批量删除日志", notes = "根据日志ids批量删除日志")
    @ApiImplicitParam(name = "log", value = "日志信息", dataType = "Log")
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllAttachments(@RequestBody Log log) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(log.getIdString()))
                success = logService.deleteAll(log.getIdString().split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除附件失败！", e);
        }
        return new ReturnT<>(success);
    }
}

package com.github.tangyi.user.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.Log;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.user.service.LogService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 日志controller
 *
 * @author tangyi
 * @date 2018/10/31 20:48
 */
@RestController
@RequestMapping("/log")
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
     * @param params params
     * @param log    log
     * @return PageInfo
     * @author tangyi
     * @date 2018/10/24 0024 下午 10:13
     */
    @RequestMapping("logList")
    public PageInfo<Log> userList(@RequestParam Map<String, String> params, Log log) {
        PageInfo<Log> page = new PageInfo<Log>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
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
    @DeleteMapping("/{id}")
    public ReturnT<Boolean> delete(@PathVariable String id) {
        Log log = new Log();
        log.setId(id);
        return new ReturnT<>(logService.delete(log) > 0);
    }

    /**
     * 批量删除
     *
     * @param idMap idMap
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/4 10:12
     */
    @PostMapping("/deleteAll")
    public ReturnT<Boolean> deleteAllAttachments(@RequestBody Map<String, String> idMap) {
        boolean success = false;
        try {
            if (StringUtils.isNotEmpty(idMap.get("ids")))
                success = logService.deleteAll(idMap.get("ids").split(",")) > 0;
        } catch (Exception e) {
            logger.error("删除附件失败！", e);
        }
        return new ReturnT<>(success);
    }
}

package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.ExcelToolUtil;
import com.github.tangyi.common.utils.MapUtil;
import com.github.tangyi.common.utils.Servlets;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.vo.DeptVo;
import com.github.tangyi.common.vo.ExportVo;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ScoreDto;
import com.github.tangyi.exam.feign.DeptService;
import com.github.tangyi.exam.feign.UserService;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.module.Score;
import com.github.tangyi.exam.service.ExaminationService;
import com.github.tangyi.exam.service.ScoreService;
import com.github.tangyi.exam.utils.ScoreUtil;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 成绩controller
 *
 * @author tangyi
 * @date 2018/11/8 21:29
 */
@RestController
@RequestMapping("/score")
public class ScoreController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ScoreController.class);

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private ExaminationService examinationService;

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:40
     */
    @ApiOperation(value = "获取成绩信息", notes = "根据成绩id获取成绩详细信息")
    @ApiImplicitParam(name = "id", value = "成绩ID", required = true, dataType = "String", paramType = "path")
    @GetMapping("/{id}")
    public ReturnT<Score> score(@PathVariable String id) {
        Score score = new Score();
        if (StringUtils.isNotBlank(id)) {
            score.setId(id);
            score = scoreService.get(score);
        }
        return new ReturnT<>(score);
    }

    /**
     * 获取分页数据
     *
     * @param params params
     * @param score  score
     * @return PageInfo
     * @author tangyi
     * @date 2018/11/10 21:41
     */
    @ApiOperation(value = "获取成绩列表")
    @RequestMapping("scoreList")
    public PageInfo<ScoreDto> scoreList(@RequestParam Map<String, String> params, Score score) {
        PageInfo<ScoreDto> scoreDtoPageInfo = new PageInfo<>();
        PageInfo<Score> page = new PageInfo<Score>();
        page.setPageNum(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_NUM, CommonConstant.PAGE_NUM_DEFAULT)));
        page.setPageSize(Integer.parseInt(params.getOrDefault(CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE_DEFAULT)));
        PageInfo<Score> scorePageInfo = scoreService.findPage(page, score);
        if (CollectionUtils.isNotEmpty(scorePageInfo.getList())) {
            Set<String> examIdSet = new HashSet<>();
            scorePageInfo.getList().forEach(tempScore -> {
                examIdSet.add(tempScore.getExaminationId());
            });
            Examination examination = new Examination();
            examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
            // 查询考试信息
            List<Examination> examinations = examinationService.findListById(examination);
            List<ScoreDto> scoreDtoList = new ArrayList<>();
            // 用户id
            Set<String> userIdSet = new HashSet<>();
            for (Score tempScore : scorePageInfo.getList()) {
                for (Examination tempExamination : examinations) {
                    if (tempExamination.getId().equals(tempScore.getExaminationId())) {
                        ScoreDto scoreDto = new ScoreDto();
                        scoreDto.setId(tempScore.getId());
                        scoreDto.setExaminationName(tempExamination.getExaminationName());
                        scoreDto.setExamTime(tempScore.getCreateDate());
                        scoreDto.setScore(tempScore.getScore());
                        scoreDto.setUserId(tempScore.getUserId());
                        userIdSet.add(tempScore.getUserId());
                        scoreDtoList.add(scoreDto);
                        break;
                    }
                }
            }
            // 查询用户信息
            UserVo userVo = new UserVo();
            userVo.setIds(userIdSet.toArray(new String[userIdSet.size()]));
            ReturnT<List<UserVo>> returnT = userService.findById(userVo);
            if (returnT != null && CollectionUtils.isNotEmpty(returnT.getData())) {
                // 查询部门信息
                Set<String> deptIdSet = new HashSet<>();
                returnT.getData().forEach(tempUserVo -> {
                    deptIdSet.add(tempUserVo.getDeptId());
                });
                DeptVo deptVo = new DeptVo();
                deptVo.setIds(deptIdSet.toArray(new String[deptIdSet.size()]));
                ReturnT<List<DeptVo>> deptReturnT = deptService.findById(deptVo);
                for (ScoreDto tempScoreDto : scoreDtoList) {
                    for (UserVo tempUserVo : returnT.getData()) {
                        if (tempScoreDto.getUserId().equals(tempUserVo.getId())) {
                            tempScoreDto.setUserName(tempUserVo.getName());
                            // 查询部门信息
                            if (deptReturnT != null && CollectionUtils.isNotEmpty(deptReturnT.getData())) {
                                for (DeptVo tempDept : deptReturnT.getData()) {
//                                  // 设置所属部门名称
                                    if (tempDept.getId().equals(tempUserVo.getDeptId())) {
                                        tempScoreDto.setDeptName(tempDept.getDeptName());
                                        break;
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
            }
            // 分页信息
            scoreDtoPageInfo.setTotal(scorePageInfo.getTotal());
            scoreDtoPageInfo.setPageNum(scorePageInfo.getPageNum());
            scoreDtoPageInfo.setPageSize(scorePageInfo.getPageSize());
            scoreDtoPageInfo.setList(scoreDtoList);
        }
        return scoreDtoPageInfo;
    }

    /**
     * 查询考试成绩
     *
     * @param score score
     * @return ReturnT
     * @author tangyi
     * @date 2018/12/29 19:29
     */
    @RequestMapping("score")
    public ReturnT<Score> score(Score score) {
        List<Score> scoreList = scoreService.findList(score);
        score = new Score();
        if (CollectionUtils.isNotEmpty(scoreList)) {
            score = scoreList.get(0);
        }
        return new ReturnT<>(score);
    }

    /**
     * 创建
     *
     * @param score score
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:41
     */
    @ApiOperation(value = "创建成绩", notes = "创建成绩")
    @ApiImplicitParam(name = "score", value = "成绩实体score", required = true, dataType = "Score")
    @PostMapping
    public ReturnT<Boolean> addScore(@RequestBody Score score) {
        score.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(scoreService.insert(score) > 0);
    }

    /**
     * 更新
     *
     * @param score score
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:42
     */
    @ApiOperation(value = "更新成绩信息", notes = "根据成绩id更新成绩的基本信息")
    @ApiImplicitParam(name = "score", value = "成绩实体score", required = true, dataType = "Score")
    @PutMapping
    public ReturnT<Boolean> updateScore(@RequestBody Score score) {
        score.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
        return new ReturnT<>(scoreService.update(score) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:43
     */
    @ApiOperation(value = "删除成绩", notes = "根据ID删除成绩")
    @ApiImplicitParam(name = "id", value = "成绩ID", required = true, paramType = "path")
    @DeleteMapping("{id}")
    public ReturnT<Boolean> deleteScore(@PathVariable String id) {
        boolean success = false;
        try {
            Score score = scoreService.get(id);
            if (score != null) {
                score.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                success = scoreService.delete(score) > 0;
            }
        } catch (Exception e) {
            logger.error("删除成绩失败！", e);
        }
        return new ReturnT<>(success);
    }

    /**
     * 导出成绩
     *
     * @param exportVo exportVo
     * @author tangyi
     * @date 2018/12/31 22:28
     */
    @PostMapping("/export")
    public void exportScore(@RequestBody ExportVo exportVo, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 配置response
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, Servlets.getDownName(request, "考试成绩" + new SimpleDateFormat("yyyyMMddhhmmssSSS").format(new Date()) + ".xlsx"));
            List<Score> scoreList;
            if (StringUtils.isNotEmpty(exportVo.getIds())) {
                Set<String> scoreIdSet = new HashSet<>();
                for (String id : exportVo.getIds().split(",")) {
                    if (StringUtils.isNotEmpty(id))
                        scoreIdSet.add(id);
                }
                Score score = new Score();
                score.setIds(scoreIdSet.toArray(new String[scoreIdSet.size()]));
                scoreList = scoreService.findListById(score);
            } else {    // 导出全部成绩
                scoreList = scoreService.findList(new Score());
            }
            // 查询考试、用户、部门数据
            if (CollectionUtils.isNotEmpty(scoreList)) {
                List<ScoreDto> scoreDtoList = new ArrayList<>();
                // 查询考试信息
                Set<String> examIdSet = new HashSet<>();
                scoreList.forEach(tempScore -> {
                    examIdSet.add(tempScore.getExaminationId());
                });
                Examination examination = new Examination();
                examination.setIds(examIdSet.toArray(new String[examIdSet.size()]));
                List<Examination> examinations = examinationService.findListById(examination);
                // 用户id
                Set<String> userIdSet = new HashSet<>();
                scoreList.forEach(tempScore -> {
                    examinations.forEach(tempExamination -> {
                        if (tempScore.getExaminationId().equals(tempExamination.getId())) {
                            ScoreDto scoreDto = new ScoreDto();
                            scoreDto.setId(tempScore.getId());
                            scoreDto.setExaminationName(tempExamination.getExaminationName());
                            scoreDto.setExamTime(tempScore.getCreateDate());
                            scoreDto.setScore(tempScore.getScore());
                            scoreDto.setUserId(tempScore.getUserId());
                            userIdSet.add(tempScore.getUserId());
                            scoreDtoList.add(scoreDto);
                        }
                    });
                });
                // 查询用户信息
                UserVo userVo = new UserVo();
                userVo.setIds(userIdSet.toArray(new String[userIdSet.size()]));
                ReturnT<List<UserVo>> returnT = userService.findById(userVo);
                if (returnT != null && CollectionUtils.isNotEmpty(returnT.getData())) {
                    // 查询部门信息
                    Set<String> deptIdSet = new HashSet<>();
                    returnT.getData().forEach(tempUserVo -> {
                        deptIdSet.add(tempUserVo.getDeptId());
                    });
                    DeptVo deptVo = new DeptVo();
                    deptVo.setIds(deptIdSet.toArray(new String[deptIdSet.size()]));
                    ReturnT<List<DeptVo>> deptReturnT = deptService.findById(deptVo);
                    scoreDtoList.forEach(tempScoreDto -> {
                        returnT.getData().forEach(tempUserVo -> {
                            if (tempScoreDto.getUserId().equals(tempUserVo.getId())) {
                                tempScoreDto.setUserName(tempUserVo.getName());
                                // 查询部门信息
                                if (deptReturnT != null && CollectionUtils.isNotEmpty(deptReturnT.getData())) {
                                    deptReturnT.getData().forEach(tempDept -> {
                                        // 设置所属部门名称
                                        if (tempDept.getId().equals(tempUserVo.getDeptId()))
                                            tempScoreDto.setDeptName(tempDept.getDeptName());
                                    });
                                }
                            }
                        });
                    });
                }
                // 导出
                ExcelToolUtil.exportExcel(request.getInputStream(), response.getOutputStream(), MapUtil.java2Map(scoreDtoList), ScoreUtil.getScoreDtoMap());
            }
        } catch (Exception e) {
            logger.error("导出成绩数据失败！", e);
        }
    }
}

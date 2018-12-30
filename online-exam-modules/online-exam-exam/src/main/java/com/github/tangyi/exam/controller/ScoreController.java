package com.github.tangyi.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.tangyi.common.constants.CommonConstant;
import com.github.tangyi.common.model.ReturnT;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.common.web.BaseController;
import com.github.tangyi.exam.dto.ScoreDto;
import com.github.tangyi.exam.feign.UserService;
import com.github.tangyi.exam.module.Examination;
import com.github.tangyi.exam.module.Score;
import com.github.tangyi.exam.service.ExaminationService;
import com.github.tangyi.exam.service.ScoreService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ReturnT
     * @author tangyi
     * @date 2018/11/10 21:40
     */
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
            scorePageInfo.getList().forEach(tempScore -> {
                examinations.forEach(tempExamination -> {
                    if (tempScore.getExaminationId().equals(tempExamination.getId())) {
                        ScoreDto scoreDto = new ScoreDto();
                        scoreDto.setExaminationName(tempExamination.getExaminationName());
                        scoreDto.setExamTime(tempScore.getCreateDate());
                        scoreDto.setScore(tempScore.getScore());

                        // 查询用户信息
                        UserVo userVo = userService.findById(tempScore.getUserId());
                        if (userVo != null)
                            scoreDto.setUserName(userVo.getName());
                        scoreDtoList.add(scoreDto);
                    }
                });
            });
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
}

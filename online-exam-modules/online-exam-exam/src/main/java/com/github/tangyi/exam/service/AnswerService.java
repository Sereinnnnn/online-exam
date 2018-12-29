package com.github.tangyi.exam.service;

import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.common.utils.SysUtil;
import com.github.tangyi.exam.mapper.AnswerMapper;
import com.github.tangyi.exam.module.*;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 答题service
 *
 * @author tangyi
 * @date 2018/11/8 21:17
 */
@Service
@Transactional(readOnly = true)
public class AnswerService extends CrudService<AnswerMapper, Answer> {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private IncorrectAnswerService incorrectAnswerService;

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private ExamRecordService examRecodeService;

    /**
     * 提交答卷
     *
     * @param answer answer
     * @return boolean
     * @author tangyi
     * @date 2018/12/26 14:09
     */
    @Transactional
    public boolean submit(Answer answer) {
        boolean success = false;
        logger.debug("提交答卷：{}, {}", answer.getExaminationId(), answer.getUserId());
        // 总分
        Integer totalScore = 0, correctNumber = 0, incorrectNumber = 0;
        // 查找已提交的题目
        List<Answer> answerList = findList(answer);
        if (CollectionUtils.isNotEmpty(answerList)) {
            // 收集题目id
            Set<String> subjectIdSet = new HashSet<>();
            answerList.forEach(tempAnswer -> {
                subjectIdSet.add(tempAnswer.getSubjectId());
            });
            Subject subject = new Subject();
            subject.setIds(subjectIdSet.toArray(new String[subjectIdSet.size()]));
            // 查找题目列表
            List<Subject> subjects = subjectService.findListById(subject);
            if (CollectionUtils.isNotEmpty(subjects)) {
                // 错题列表
                List<IncorrectAnswer> incorrectAnswers = new ArrayList<>();
                for (Subject tempSubject : subjects) {
                    for (Answer tempAnswer : answerList) {
                        if (tempAnswer.getSubjectId().equals(tempSubject.getId())) {
                            // 答题正确
                            if (tempSubject.getAnswer().toUpperCase().equalsIgnoreCase(tempAnswer.getAnswer())) {
                                totalScore += Integer.parseInt(tempSubject.getScore());
                                correctNumber++;
                            } else {
                                incorrectNumber++;
                                // 记录错题
                                IncorrectAnswer incorrectAnswer = new IncorrectAnswer();
                                incorrectAnswer.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                                incorrectAnswer.setExaminationId(tempAnswer.getExaminationId());
                                incorrectAnswer.setExamRecordId(answer.getExamRecordId());
                                incorrectAnswer.setSubjectId(tempAnswer.getSubjectId());
                                incorrectAnswer.setSerialNumber(tempSubject.getSerialNumber());
                                incorrectAnswer.setUserId(tempAnswer.getUserId());
                                incorrectAnswer.setIncorrectAnswer(tempAnswer.getAnswer());
                                incorrectAnswers.add(incorrectAnswer);
                            }
                        }
                    }
                }
                // 保存成绩
                Score score = new Score();
                score.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                score.setExaminationId(answer.getExaminationId());
                score.setExamRecordId(answer.getExamRecordId());
                score.setUserId(answer.getUserId());
                score.setCourseId(answer.getCourseId());
                score.setScore(totalScore.toString());
                score.setCorrectNumber(correctNumber.toString());
                score.setInCorrectNumber(incorrectNumber.toString());
                scoreService.insert(score);
                // 保存错题
                if (CollectionUtils.isNotEmpty(incorrectAnswers))
                    incorrectAnswerService.insertBatch(incorrectAnswers);
                // 更新考试记录
                ExamRecord examRecord = new ExamRecord();
                examRecord.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode());
                examRecord.setId(answer.getExamRecordId());
                examRecord.setExamTime(score.getCreateDate());
                examRecord.setScore(score.getScore());
                success = examRecodeService.update(examRecord) > 0;
            }
        }
        return success;
    }
}

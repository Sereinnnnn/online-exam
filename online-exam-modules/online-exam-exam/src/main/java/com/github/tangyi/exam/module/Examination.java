package com.github.tangyi.exam.module;

import com.github.tangyi.common.persistence.BaseEntity;

/**
 * 考试
 *
 * @author tangyi
 * @date 2018/11/8 20:47
 */
public class Examination extends BaseEntity<Examination> {

    /**
     * 考试名称
     */
    private String examinationName;

    /**
     * 考试类型
     */
    private String type;

    /**
     * 考试注意事项
     */
    private String attention;

    /**
     * 考试开始时间
     */
    private String startTime;

    /**
     * 考试结束时间
     */
    private String endTime;

    /**
     * 考试持续时间
     */
    private String duration;

    /**
     * 总分
     */
    private String totalScore;

    /**
     * 考试状态
     */
    private String status;

    /**
     * 封面
     */
    private String avatar;

    /**
     * 学院
     */
    private String college;

    /**
     * 专业
     */
    private String major;

    /**
     * 课程
     */
    private String course;

    /**
     * 备注
     */
    private String remark;

    public String getExaminationName() {
        return examinationName;
    }

    public void setExaminationName(String examinationName) {
        this.examinationName = examinationName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

/*
 Navicat Premium Data Transfer

 Source Server         : 144
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : 192.168.0.144:3306
 Source Schema         : platform_test002

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 04/12/2018 22:36:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `examination_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试ID',
  `course_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程ID',
  `subject_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目ID',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师',
  `course_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0837cec93f7b4d19a5b0a880b9a7e66b', '1', '1', '1', '1', '1', 'admin', '2018-12-04 11:24:27', 'admin', '2018-12-04 11:24:27', '1', 'EXAM');
INSERT INTO `course` VALUES ('17fb318eea9043f1ac30437bb35a93e8', '1', '1', '1', '1', '1', 'admin', '2018-12-01 14:26:44', 'admin', '2018-12-01 14:26:44', '1', 'EXAM');
INSERT INTO `course` VALUES ('2a6187239d7f48749da321aa6fd56424', '高等数学', '金融学院', '金融工程', '黄*东', '高等数学', 'admin', '2018-11-12 19:39:24', 'admin', '2018-11-12 22:39:20', '0', 'EXAM');
INSERT INTO `course` VALUES ('697897669d6642d8bcdee236d91bc1d9', '1', '1', '1', '1', '1', 'admin', '2018-12-04 20:57:37', 'admin', '2018-12-04 20:57:37', '0', 'EXAM');
INSERT INTO `course` VALUES ('6a4ce4b624eb43a09eae4a824e5bd83c', '语文', '4', '4', '4', '44', 'admin', '2018-11-22 20:56:13', 'admin', '2018-12-04 21:26:18', '0', 'EXAM');
INSERT INTO `course` VALUES ('6dcccd4639bc49b88810be1d30a77f92', '离散数学', '信息学院', '软件工程', '袁大头', '离散数学', 'admin', '2018-11-12 22:31:28', 'admin', '2018-11-12 22:39:28', '0', 'EXAM');
INSERT INTO `course` VALUES ('ac4fd200b9cf48c8b176294e0c71d079', '2', '2', '2', '2', '', 'admin', '2018-12-04 11:24:34', 'admin', '2018-12-04 11:24:34', '1', 'EXAM');

-- ----------------------------
-- Table structure for exam_recode
-- ----------------------------
DROP TABLE IF EXISTS `exam_recode`;
CREATE TABLE `exam_recode`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `examination_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试id',
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程id',
  `exam_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试时间',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成绩',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examination_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试类型',
  `attention` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试注意事项',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试结束时间',
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试持续时间',
  `total_score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总分',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试状态',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `college_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院',
  `major_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES ('134bcf6c734b41e8b0b7e63088f8e49d', '2', '0', '11', '2018-12-01 14:21', '2018-12-10 00:00', '', '1', '0', '', '1', '1', '2a6187239d7f48749da321aa6fd56424', '11', 'admin', '2018-12-01 14:21:24', 'admin', '2018-12-01 14:21:24', '1', 'EXAM');
INSERT INTO `examination` VALUES ('2dadea859eb94dad96b7af71c4c423ab', '1', '0', '', '2018-12-01 15:14', '2018-12-01 15:14', '', '1', '0', '', '1', '1', '6a4ce4b624eb43a09eae4a824e5bd83c', '', 'admin', '2018-12-01 15:14:18', 'admin', '2018-12-01 15:14:18', '1', 'EXAM');
INSERT INTO `examination` VALUES ('b5990bc1c48d49fcb0023de51772c309', '数学期末考试', '0', '期末考试', '2018-11-14 00:00', '2018-11-20 00:00', '', '150', '0', '', '应用数学', '应用数学', '6dcccd4639bc49b88810be1d30a77f92', '期末考试', 'admin', '2018-11-20 22:48:40', 'admin', '2018-12-04 13:05:50', '0', 'EXAM');
INSERT INTO `examination` VALUES ('c98f0b0c260e472e84df9da9c0034af3', '2', '0', '2', '2019-02-27 00:00', '2018-12-17 00:00', '', '2', '0', '', '2', '2', '2a6187239d7f48749da321aa6fd56424', '2', 'admin', '2018-12-04 12:38:33', 'admin', '2018-12-04 12:38:33', '1', 'EXAM');
INSERT INTO `examination` VALUES ('e47ad46fd30745d6ac975b92ef6c1384', '2', '2', '', '2', '2', '', '2', '0', '', '2', '2', '6dcccd4639bc49b88810be1d30a77f92', '2', 'admin', '2018-11-12 20:10:24', 'admin', '2018-11-12 20:10:24', '1', 'EXAM');
INSERT INTO `examination` VALUES ('f051f54621fc4812b929a7777a701712', '语文考试', '0', '语文考试', '2018-11-07 00:00', '2018-11-20 22:50', '', '150', '1', '', '中文', '中文', '6a4ce4b624eb43a09eae4a824e5bd83c', '语文考试', 'admin', '2018-11-20 22:50:55', 'admin', '2018-12-04 21:26:43', '0', 'EXAM');
INSERT INTO `examination` VALUES ('fad663ea371f4250a81332bd3a346739', '测试对对对', '0', '测试对对对', '2018-11-12 21:06', '2018-11-12 20:43', '', '100', '0', '', '测试等等', '测试对对对', '6dcccd4639bc49b88810be1d30a77f92', '测试对对对', 'admin', '2018-11-12 20:25:38', 'admin', '2018-12-01 14:51:12', '0', 'EXAM');

-- ----------------------------
-- Table structure for incorrect_answer
-- ----------------------------
DROP TABLE IF EXISTS `incorrect_answer`;
CREATE TABLE `incorrect_answer`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生ID',
  `examination_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试ID',
  `subject_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目ID',
  `incorrect_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误答案',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生ID',
  `examination_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试ID',
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程ID',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成绩',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examination_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试ID',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目类型',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目内容',
  `option_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项d',
  `option_e` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项e',
  `option_f` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项f',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考答案',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分值',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '难度等级',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('03b7f45ac73a462aaef41b0660124e5d', 'fad663ea371f4250a81332bd3a346739', '5', '3', '5', NULL, NULL, NULL, NULL, NULL, NULL, '5', '5', '5', '4', 'admin', '2018-11-20 21:34:08', 'admin', '2018-11-20 22:47:16', '0', 'EXAM');
INSERT INTO `subject` VALUES ('107f185bd837475caa13c1fbae45447a', 'f051f54621fc4812b929a7777a701712', '7', '0', '7', '7', '7', '7', '7', '', '', '7', '7', '7', '2', 'admin', '2018-11-22 21:25:08', 'admin', '2018-11-22 21:25:08', '0', 'EXAM');
INSERT INTO `subject` VALUES ('1cede15b100e470692269754fc44079e', 'fad663ea371f4250a81332bd3a346739', '44', '0', '4', NULL, NULL, NULL, NULL, NULL, NULL, '44', '44', '4', '2', 'admin', '2018-11-20 21:28:25', 'admin', '2018-11-20 21:28:25', '0', 'EXAM');
INSERT INTO `subject` VALUES ('315f5e085e6f432f980c03c2a88309b6', 'f051f54621fc4812b929a7777a701712', '11', '0', '11', '11', '11', '11', '11', '', '', '11', '11', '11', '2', 'admin', '2018-11-22 21:25:47', 'admin', '2018-11-22 21:25:47', '0', 'EXAM');
INSERT INTO `subject` VALUES ('3a924b55540f4e479d217747654d2a80', 'f051f54621fc4812b929a7777a701712', '6', '0', '6', '6', '6', '6', '6', '', '', '6', '6', '6', '2', 'admin', '2018-11-22 21:25:01', 'admin', '2018-11-22 21:25:01', '0', 'EXAM');
INSERT INTO `subject` VALUES ('48af5397129746ba907cc964c39da5a7', 'f051f54621fc4812b929a7777a701712', '9', '0', '9', '9', '9', '9', '9', '', '', '9', '9', '9', '2', 'admin', '2018-11-22 21:25:25', 'admin', '2018-11-22 21:25:25', '0', 'EXAM');
INSERT INTO `subject` VALUES ('61022d8fce2b49da8f7de587335e61bc', 'b5990bc1c48d49fcb0023de51772c309', '3434', '0', '', '434', '43', '434', '434', '', '', '1', '434', '434', '2', 'admin', '2018-12-04 12:58:02', 'admin', '2018-12-04 12:58:02', '0', 'EXAM');
INSERT INTO `subject` VALUES ('6bdde374aecd44d9a854dec22eabfabd', 'fad663ea371f4250a81332bd3a346739', '7', '1', '7', NULL, NULL, NULL, NULL, NULL, NULL, '7', '7', '7', '4', 'admin', '2018-11-20 21:41:28', 'admin', '2018-12-01 14:18:10', '0', 'EXAM');
INSERT INTO `subject` VALUES ('77dcc559339b4bacaf6a95e42748a8bb', 'f051f54621fc4812b929a7777a701712', '5', '0', '5', '5', '5', '5', '5', '', '', '5', '5', '5', '2', 'admin', '2018-11-22 21:24:54', 'admin', '2018-11-22 21:24:54', '0', 'EXAM');
INSERT INTO `subject` VALUES ('7b840f151506498f9c4dddc6b36187ed', 'f051f54621fc4812b929a7777a701712', '2', '0', '2', '2', '2', '2', '2', '', '', '2', '2', '2', '2', 'admin', '2018-11-22 21:24:39', 'admin', '2018-11-22 21:24:39', '0', 'EXAM');
INSERT INTO `subject` VALUES ('7f78172c09d3408dab1534d26b608b31', '首页', 'dashboard', '/dashboard', '', '-1', 'dashboard', '0', '0', 'Layout', '/dashboard', NULL, 'admin', '2018-11-06 23:26:57', 'admin', '2018-11-06 23:28:50', '0', 'EXAM', NULL, '0', NULL);
INSERT INTO `subject` VALUES ('815ccd1252844f2596e1230781e3884c', 'fad663ea371f4250a81332bd3a346739', '6', '0', '6', NULL, NULL, NULL, NULL, NULL, NULL, '6', '6', '6', '1', 'admin', '2018-11-20 21:41:04', 'admin', '2018-11-20 21:42:25', '0', 'EXAM');
INSERT INTO `subject` VALUES ('84ecd40ac3a74f809cbd07e18658618a', 'f051f54621fc4812b929a7777a701712', '中文简答题', '0', '3', NULL, NULL, NULL, NULL, NULL, NULL, '3', '2', '3', '2', 'admin', '2018-11-20 22:52:35', 'admin', '2018-11-20 22:52:35', '0', 'EXAM');
INSERT INTO `subject` VALUES ('963c83c5bf05426faef47ed0090d8aa3', 'f051f54621fc4812b929a7777a701712', '3', '0', '3', '3', '3', '3', '3', '', '', '3', '3', '3', '2', 'admin', '2018-11-22 21:24:46', 'admin', '2018-11-22 21:24:46', '0', 'EXAM');
INSERT INTO `subject` VALUES ('a4624da5b5a24e3085e640be121172ba', 'b5990bc1c48d49fcb0023de51772c309', '最小公约数1', '0', '', '3', '3', '3', '3', '', '', '1', '3', '3', '2', 'admin', '2018-12-03 21:21:43', 'admin', '2018-12-04 12:57:51', '0', 'EXAM');
INSERT INTO `subject` VALUES ('adddb223301d4e8da97c3111b92d07dd', 'b5990bc1c48d49fcb0023de51772c309', '测试测试ddd', '0', '', '32', '32', '323', '323', '', '', '1', '23', '2323', '4', 'admin', '2018-12-03 21:41:40', 'admin', '2018-12-03 21:41:58', '0', 'EXAM');
INSERT INTO `subject` VALUES ('b264752643cb4765a07aca163a40f5e4', 'b5990bc1c48d49fcb0023de51772c309', '1', '0', '', '1', '1', '1', '1', '', '', '1', '1', '1', '2', 'admin', '2018-12-01 14:20:57', 'admin', '2018-12-01 14:20:57', '0', 'EXAM');
INSERT INTO `subject` VALUES ('bf6be4d363a44deb98f8517fc78b8a9d', 'b5990bc1c48d49fcb0023de51772c309', '最小公约数', '0', '', '3', '3', '3', '3', '', '', '1', '3', '3', '2', 'admin', '2018-11-22 21:37:19', 'admin', '2018-12-01 14:17:24', '0', 'EXAM');
INSERT INTO `subject` VALUES ('c2fddedc3b384a4998759b30173702d2', 'b5990bc1c48d49fcb0023de51772c309', '数学选择题', '0', '23', '23', '323', '323', '323', NULL, NULL, '2', '32', '323', '2', 'admin', '2018-11-20 22:53:04', 'admin', '2018-11-22 21:36:56', '0', 'EXAM');
INSERT INTO `subject` VALUES ('c77702b62cf2493195c68b4a45ec4e82', 'f051f54621fc4812b929a7777a701712', '1', '0', '下列在文中括号内补写的语句，最恰当的一项是', '“大洋一号”的实验室很多，就像迷宫一样', '“大洋一号”有十几个像迷宫一样的实验室', '走进“大洋一号”，犹如进入了一座迷宫', '进入迷宫一样的“大洋一号”，会分辨不出方向', NULL, NULL, 'A', '5', '“大洋一号”的实验室很多，就像迷宫一样', '2', 'admin', '2018-11-20 22:52:00', 'admin', '2018-11-22 21:02:02', '0', 'EXAM');
INSERT INTO `subject` VALUES ('c90047be958342dfb33e92406ee3aadf', '2dadea859eb94dad96b7af71c4c423ab', '测试语文题目', '0', '', '3', '3', '3', '3', '', '', '1', '3', '3', '2', 'admin', '2018-12-03 21:35:31', 'admin', '2018-12-03 21:35:52', '0', 'EXAM');
INSERT INTO `subject` VALUES ('cf2d7ac133e740278774eb0dd239609f', 'f051f54621fc4812b929a7777a701712', '1', '0', '', '1', '1', '1', '1', '', '', '1', '1', '1', '2', 'admin', '2018-12-01 11:57:07', 'admin', '2018-12-01 11:57:07', '0', 'EXAM');
INSERT INTO `subject` VALUES ('d1b45ff6133f4275a66c409d50fe51ac', 'f051f54621fc4812b929a7777a701712', '8', '0', '8', '8', '8', '8', '8', '', '', '8', '8', '8', '2', 'admin', '2018-11-22 21:25:16', 'admin', '2018-11-22 21:25:16', '0', 'EXAM');
INSERT INTO `subject` VALUES ('d576d4c81bf84e6e9a10fc36eda3b1a5', '2dadea859eb94dad96b7af71c4c423ab', '语文选择题', '0', '23', '23', '323', '323', '323', NULL, NULL, '2', '32', '323', '2', 'admin', '2018-12-03 21:35:32', 'admin', '2018-12-03 21:36:04', '0', 'EXAM');
INSERT INTO `subject` VALUES ('f36bafe7c98446d7b7a48a562fa9b725', 'f051f54621fc4812b929a7777a701712', '10', '0', '10', '10', '10', '10', '10', '', '', '10', '10', '10', '2', 'admin', '2018-11-22 21:25:38', 'admin', '2018-11-22 21:25:38', '0', 'EXAM');
INSERT INTO `subject` VALUES ('f8dc5a3f0aba4566a6e81ea182e393cb', 'b5990bc1c48d49fcb0023de51772c309', '数学选择题', '0', '23', '23', '323', '323', '323', NULL, NULL, '3', '32', '323', '2', 'admin', '2018-12-03 21:21:47', 'admin', '2018-12-03 21:42:23', '0', 'EXAM');

-- ----------------------------
-- Table structure for subject_category
-- ----------------------------
DROP TABLE IF EXISTS `subject_category`;
CREATE TABLE `subject_category`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类ID',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject_category
-- ----------------------------
INSERT INTO `subject_category` VALUES ('1', '测试分类', '1', '-1', '1', '1', '1', '1', '1', '0', '1');
INSERT INTO `subject_category` VALUES ('2', '测试分类2', '2', '-1', '2', '2', '2', '2', '2', '0', '2');
INSERT INTO `subject_category` VALUES ('3', '测试分类3', '3', '1', '3', '3', '3', '3', '3', '0', '3');

SET FOREIGN_KEY_CHECKS = 1;

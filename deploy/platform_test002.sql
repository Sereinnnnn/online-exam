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

 Date: 09/12/2018 22:08:54
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
INSERT INTO `examination` VALUES ('f051f54621fc4812b929a7777a701712', '语文考试', '0', '语文考试', '2018-11-07 00:00', '2018-11-20 22:50', '', '150', '0', '', '中文', '中文', '6a4ce4b624eb43a09eae4a824e5bd83c', '语文考试', 'admin', '2018-11-20 22:50:55', 'admin', '2018-12-09 21:08:32', '0', 'EXAM');
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
INSERT INTO `subject` VALUES ('185b6875ef694febadba8797fbd0ad29', 'b5990bc1c48d49fcb0023de51772c309', '232222', '0', '', '323fffff', '32', '32', '323', '', '', '2', '323', '323', '2', 'admin', '2018-12-09 20:55:31', 'admin', '2018-12-09 20:55:31', '0', 'EXAM');
INSERT INTO `subject` VALUES ('1a934e62942640459b3a66c05f6c09b2', 'fad663ea371f4250a81332bd3a346739', '33', '0', '', '33dddd', '33dafda', '33afd', '33dfad', '', '', '3', '33', '333', '2', 'admin', '2018-12-09 21:07:20', 'admin', '2018-12-09 21:07:20', '0', 'EXAM');
INSERT INTO `subject` VALUES ('2954ff84207542b395d2471e166cb414', 'fad663ea371f4250a81332bd3a346739', '1', '0', '', '1', '1', '1', '1', '', '', '2', '1', '1', '2', 'admin', '2018-12-09 20:27:59', 'admin', '2018-12-09 20:27:59', '1', 'EXAM');
INSERT INTO `subject` VALUES ('4d654c576f534f349278806b046608d6', 'fad663ea371f4250a81332bd3a346739', '33', '0', '', '33dddd', '33dddd', '33ddasd', '33adadsasd', '', '', '2', '33', '333adasdasd', '2', 'admin', '2018-12-09 21:07:07', 'admin', '2018-12-09 21:08:13', '0', 'EXAM');
INSERT INTO `subject` VALUES ('ac2787a9c86e4ca39d17e53348d6fccb', 'f051f54621fc4812b929a7777a701712', '33', '0', '', '33', '33', '33', '33', '', '', '3', '33', '333', '2', 'admin', '2018-12-09 20:55:52', 'admin', '2018-12-09 20:55:52', '0', 'EXAM');
INSERT INTO `subject` VALUES ('e34926a94a4a4895817d7ea78aa63012', 'fad663ea371f4250a81332bd3a346739', '232222', '0', '', '323fffff', '32', '32', '323', '', '', '2', '323', '323', '2', 'admin', '2018-12-09 20:30:07', 'admin', '2018-12-09 20:30:07', '0', 'EXAM');
INSERT INTO `subject` VALUES ('e73e1cf4feaf47449ce982376afcdb03', 'fad663ea371f4250a81332bd3a346739', '232222', '0', '', '323fffff', '32', '32', '323', '', '', '2', '323', '323', '2', 'admin', '2018-12-09 20:28:15', 'admin', '2018-12-09 20:28:15', '1', 'EXAM');

-- ----------------------------
-- Table structure for subject_bank
-- ----------------------------
DROP TABLE IF EXISTS `subject_bank`;
CREATE TABLE `subject_bank`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '题库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject_bank
-- ----------------------------
INSERT INTO `subject_bank` VALUES ('2612f127f8e74736a086e9ec18850852', '700556b5becd4091821644a5288d489c', '232222', '0', '', '323fffff', '32', '32', '323', '', '', '2', '323', '323', '2', 'admin', '2018-12-09 14:38:47', 'admin', '2018-12-09 14:49:43', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('aeff7c505e374cbdbcecf79e7a587ddd', '700556b5becd4091821644a5288d489c', '33', '0', '', '33', '33', '33', '33', '', '', '3', '33', '333', '2', 'admin', '2018-12-09 14:47:02', 'admin', '2018-12-09 14:47:02', '0', 'EXAM');
INSERT INTO `subject_bank` VALUES ('b1058acf24184bfd8c85c61d59dfdfd0', 'c664646337c345ac8a91e3b024ded8bb', '操作系统', '0', '', '操作系统', '操作系统', '操作系统', '操作系统', '', '', '1', '操作系统', '操作系统', '2', 'admin', '2018-12-09 20:26:59', 'admin', '2018-12-09 20:27:05', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('f8cf3298c59045929c4c108251c66eb7', 'c664646337c345ac8a91e3b024ded8bb', '434', '0', '', '434', '434', '343', '4434', '', '', '2', '434', '434', '2', 'admin', '2018-12-09 20:27:32', 'admin', '2018-12-09 20:27:32', '1', 'EXAM');

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
INSERT INTO `subject_category` VALUES ('047a8dd7d0614314a72750af9915ada0', '大学语文', NULL, '-1', '6', 'admin', '2018-12-06 20:37:38', 'admin', '2018-12-06 20:44:44', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('103cf01d23574c93b88a4aff2a350471', '四级', NULL, '412a93a6e1ac49a59e66da0721c183cd', '1', 'admin', '2018-12-09 20:32:08', 'admin', '2018-12-09 20:32:08', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('412a93a6e1ac49a59e66da0721c183cd', '大学英语', '大学英语', '-1', '2', 'admin', '2018-12-06 20:37:29', 'admin', '2018-12-06 20:44:25', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('577ff5e3a9b345e18d40e505cc631110', '国际金融', NULL, '-1', '5', 'admin', '2018-12-06 20:38:30', 'admin', '2018-12-06 20:44:40', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('700556b5becd4091821644a5288d489c', '架构基础', '4343434', 'aceeeb30b57f4d6982cd37682b5b7522', '1', 'admin', '2018-12-06 20:45:06', 'admin', '2018-12-09 20:47:28', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('9fdbb0add5354249a8a2d530bdd48d08', '高等数学', NULL, '-1', '3', 'admin', '2018-12-06 20:37:45', 'admin', '2018-12-06 20:44:31', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('aceeeb30b57f4d6982cd37682b5b7522', '计算机', NULL, '-1', '1', 'admin', '2018-12-06 20:41:44', 'admin', '2018-12-06 20:44:09', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('c664646337c345ac8a91e3b024ded8bb', '操作系统', NULL, 'aceeeb30b57f4d6982cd37682b5b7522', '2', 'admin', '2018-12-06 20:45:21', 'admin', '2018-12-06 20:45:21', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('caf8805fc7dc481b98d08ab13e5c5234', '数据库', NULL, 'aceeeb30b57f4d6982cd37682b5b7522', '3', 'admin', '2018-12-06 20:45:34', 'admin', '2018-12-06 20:45:34', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('dbc710d2af704f8b88488ae2b7e63d9e', '5555', NULL, '-1', '30', 'admin', '2018-12-09 21:04:56', 'admin', '2018-12-09 21:04:56', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('e11504263fef456997b24d7db0a86c4c', '六级', NULL, '412a93a6e1ac49a59e66da0721c183cd', '2', 'admin', '2018-12-09 20:32:16', 'admin', '2018-12-09 20:32:16', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('ffe1d4053ae4475bb39aacd6699d37c4', '应用数学', NULL, '-1', '4', 'admin', '2018-12-06 20:38:20', 'admin', '2018-12-06 20:44:36', '0', 'EXAM');

SET FOREIGN_KEY_CHECKS = 1;

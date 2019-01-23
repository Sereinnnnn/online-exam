/*
Navicat MySQL Data Transfer

Source Server         : mysql_144
Source Server Version : 50710
Source Host           : 192.168.0.144:3306
Source Database       : platform_test002

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-01-23 10:06:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `exam_record_id` varchar(64) DEFAULT NULL COMMENT '考试记录id',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程ID',
  `subject_id` varchar(64) DEFAULT NULL COMMENT '题目ID',
  `answer` varchar(255) DEFAULT NULL COMMENT '答案',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`),
  KEY `index_answer` (`user_id`,`examination_id`,`subject_id`) COMMENT '答题索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('3f0d4789b373404b98b78c60e83baaf2', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', null, 'e34926a94a4a4895817d7ea78aa63012', 'C', 'tangyi7', '2019-01-22 17:27:27', 'tangyi7', '2019-01-22 17:37:18', '0', 'EXAM');
INSERT INTO `answer` VALUES ('44fdf520d4f44ab0ad75bee7e2a16c0f', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', null, '1a934e62942640459b3a66c05f6c09b2', 'C', 'tangyi7', '2019-01-22 17:29:17', 'tangyi7', '2019-01-22 17:29:17', '0', 'EXAM');
INSERT INTO `answer` VALUES ('fe49216810e846c8aeb70d08cdd564b6', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', null, '4d654c576f534f349278806b046608d6', 'C', 'tangyi7', '2019-01-22 17:29:07', 'tangyi7', '2019-01-22 17:37:21', '0', 'EXAM');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `college` varchar(255) DEFAULT NULL COMMENT '学院',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `teacher` varchar(255) DEFAULT NULL COMMENT '老师',
  `course_description` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('2a6187239d7f48749da321aa6fd56424', '高等数学', '金融学院', '金融工程', '黄*东', '研究离散量的结构及其相互关系的数学学科', 'admin', '2018-11-12 19:39:24', 'admin', '2018-11-12 22:39:20', '1', 'EXAM');
INSERT INTO `course` VALUES ('6a4ce4b624eb43a09eae4a824e5bd83c', '语文', '4', '4', '4', '语言和文化的综合科', 'admin', '2018-11-22 20:56:13', 'admin', '2018-12-04 21:26:18', '1', 'EXAM');
INSERT INTO `course` VALUES ('6dcccd4639bc49b88810be1d30a77f92', '离散数学', '信息学院', '软件工程', '袁大头', '研究离散量的结构及其相互关系的数学学科', 'admin', '2018-11-12 22:31:28', 'admin', '2019-01-07 20:37:14', '0', 'EXAM');

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `id` varchar(64) NOT NULL,
  `examination_name` varchar(255) DEFAULT NULL COMMENT '考试名称',
  `type` varchar(64) DEFAULT NULL COMMENT '考试类型',
  `attention` varchar(255) DEFAULT NULL COMMENT '考试注意事项',
  `start_time` varchar(64) DEFAULT NULL COMMENT '考试开始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '考试结束时间',
  `duration` varchar(64) DEFAULT NULL COMMENT '考试持续时间',
  `total_score` varchar(64) DEFAULT NULL COMMENT '总分',
  `total_subject` varchar(64) DEFAULT NULL COMMENT '题目数',
  `status` varchar(64) DEFAULT NULL COMMENT '考试状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '封面',
  `college_id` varchar(64) DEFAULT NULL COMMENT '学院',
  `major_id` varchar(64) DEFAULT NULL COMMENT '专业',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES ('4f9ced28ffe64fcea57a7367e9fd4c0c', '离散数学', '2', '离散数学', '2019-01-03 00:00', '2019-01-11 00:00', '', '100', '3', '0', '1dadd14d55ed48f99eba3d0021ffb600', '信息学院', '软件工程', '6dcccd4639bc49b88810be1d30a77f92', '离散数学练习', 'admin', '2019-01-13 20:16:36', 'admin', '2019-01-13 21:26:16', '0', 'EXAM');
INSERT INTO `examination` VALUES ('b5990bc1c48d49fcb0023de51772c309', '数学期末考试', '0', '期末考试', '2019-01-22 17:00', '2019-01-22 23:00', '', '150', null, '0', 'c27ce9e094404eba8fd304c66a0fce41', '应用数学', '应用数学', '6dcccd4639bc49b88810be1d30a77f92', '期末考试', 'admin', '2018-11-20 22:48:40', 'admin', '2019-01-13 21:29:00', '0', 'EXAM');
INSERT INTO `examination` VALUES ('f051f54621fc4812b929a7777a701712', '语文考试', '0', '语文考试', '2019-01-22 17:00', '2019-01-22 23:00', '', '150', null, '0', '', '中文', '中文', '6a4ce4b624eb43a09eae4a824e5bd83c', '语文考试', 'admin', '2018-11-20 22:50:55', 'admin', '2019-01-01 14:41:19', '0', 'EXAM');
INSERT INTO `examination` VALUES ('fad663ea371f4250a81332bd3a346739', '四川省2016年普通高考适应性测试文综历史试题', '0', '文综历史试题', '2019-01-22 17:00', '2019-01-22 23:00', '', '100', '3', '0', '502ebfa8626f42bbb034f78596a47359', '文综历史试题', '文综历史试题', '6a4ce4b624eb43a09eae4a824e5bd83c', '文综历史试题', 'admin', '2018-11-12 20:25:38', 'admin', '2019-01-13 21:14:56', '0', 'EXAM');

-- ----------------------------
-- Table structure for exam_recode
-- ----------------------------
DROP TABLE IF EXISTS `exam_recode`;
CREATE TABLE `exam_recode` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户id',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试id',
  `examination_name` varchar(255) DEFAULT NULL COMMENT '考试名称',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程id',
  `start_time` varchar(64) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '结束时间',
  `score` varchar(64) DEFAULT NULL COMMENT '成绩',
  `correct_number` varchar(64) DEFAULT NULL COMMENT '正确题目数量',
  `incorrect_number` varchar(64) DEFAULT NULL COMMENT '错误题目数量',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_recode
-- ----------------------------
INSERT INTO `exam_recode` VALUES ('f3eb89b5c12941399466676a7341bf3a', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', '四川省2016年普通高考适应性测试文综历史试题', null, '2019-01-22 17:23:57', '2019-01-22 17:37:24', '0', '0', '3', 'tangyi7', '2019-01-22 17:23:57', 'tangyi7', '2019-01-22 17:37:24', '0', 'EXAM');

-- ----------------------------
-- Table structure for incorrect_answer
-- ----------------------------
DROP TABLE IF EXISTS `incorrect_answer`;
CREATE TABLE `incorrect_answer` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL COMMENT '考生ID',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `exam_record_id` varchar(64) DEFAULT NULL COMMENT '考试记录ID',
  `subject_id` varchar(64) DEFAULT NULL COMMENT '题目ID',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '题目序号',
  `incorrect_answer` varchar(255) DEFAULT NULL COMMENT '错误答案',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of incorrect_answer
-- ----------------------------
INSERT INTO `incorrect_answer` VALUES ('474736033b184374ad9c6046b2352f37', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', '4d654c576f534f349278806b046608d6', '2', 'C', 'tangyi7', '2019-01-22 17:37:24', 'tangyi7', '2019-01-22 17:37:24', '0', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('49f2f2313b5542379bb81cdc3c1e4cc8', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', '1a934e62942640459b3a66c05f6c09b2', '3', 'C', 'tangyi7', '2019-01-22 17:36:02', 'tangyi7', '2019-01-22 17:36:02', '1', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('62ddd8c4d5134c2aa69a16483810f81e', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', 'e34926a94a4a4895817d7ea78aa63012', '1', 'C', 'tangyi7', '2019-01-22 17:36:13', 'tangyi7', '2019-01-22 17:36:13', '1', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('94e330c215d6497fabab39d0a1520a4f', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', '1a934e62942640459b3a66c05f6c09b2', '3', 'C', 'tangyi7', '2019-01-22 17:37:24', 'tangyi7', '2019-01-22 17:37:24', '0', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('9cfc3052ae3c41028120c45f935664db', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', 'e34926a94a4a4895817d7ea78aa63012', '1', 'C', 'tangyi7', '2019-01-22 17:37:24', 'tangyi7', '2019-01-22 17:37:24', '0', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('a7b1b40205b24abc9d56d9ab96de7acc', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', '1a934e62942640459b3a66c05f6c09b2', '3', 'C', 'tangyi7', '2019-01-22 17:36:13', 'tangyi7', '2019-01-22 17:36:13', '1', 'EXAM');
INSERT INTO `incorrect_answer` VALUES ('cf686f2a9eba4a02a01c222bb31a5767', '4f3ffc2924f740df93641063559842a6', 'fad663ea371f4250a81332bd3a346739', 'f3eb89b5c12941399466676a7341bf3a', '1a934e62942640459b3a66c05f6c09b2', '3', 'C', 'tangyi7', '2019-01-22 17:29:57', 'tangyi7', '2019-01-22 17:29:57', '1', 'EXAM');

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
  `id` varchar(64) NOT NULL,
  `knowledge_name` varchar(255) DEFAULT NULL COMMENT '知识名称',
  `knowledge_desc` varchar(255) DEFAULT NULL COMMENT '知识描述',
  `attachment_id` varchar(255) DEFAULT NULL COMMENT '附件ID',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES ('d81ef4c730b6460f98a7898cdba8902b', '历史学习资料', '历史学习资料', '52f17901c5504c608ebb76c8202ca2eb', '0', 'admin', '2019-01-01 21:02:00', 'admin', '2019-01-09 22:08:32', '0', 'EXAM');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` varchar(64) NOT NULL,
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '序号',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '题目名称',
  `type` varchar(64) DEFAULT NULL COMMENT '题目类型',
  `content` varchar(255) DEFAULT NULL COMMENT '题目内容',
  `option_a` varchar(255) DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) DEFAULT NULL COMMENT '选项d',
  `option_e` varchar(255) DEFAULT NULL COMMENT '选项e',
  `option_f` varchar(255) DEFAULT NULL COMMENT '选项f',
  `answer` varchar(255) DEFAULT NULL COMMENT '参考答案',
  `score` varchar(64) DEFAULT NULL COMMENT '分值',
  `analysis` varchar(255) DEFAULT NULL COMMENT '解析',
  `level` varchar(64) DEFAULT NULL COMMENT '难度等级',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('185b6875ef694febadba8797fbd0ad29', 'b5990bc1c48d49fcb0023de51772c309', null, '232222', '0', '', '323fffff', '32', '32', '323', '', '', 'D', '5', '323', '2', 'admin', '2018-12-09 20:55:31', 'admin', '2018-12-09 20:55:31', '0', 'EXAM');
INSERT INTO `subject` VALUES ('1a934e62942640459b3a66c05f6c09b2', 'fad663ea371f4250a81332bd3a346739', '3', '唐前期的政治人物多为北方人，北宋时政治人物多出生于江西、福建、苏南等地。这一变化主要反映了', '0', '', '官僚集团重视本地域人才', '南北方士人志向差异', '科举制改变人才地域分布', '政治中心转移到南方', '', '', 'B', '4', '政治中心转移到南方', '2', 'admin', '2018-12-09 21:07:20', 'admin', '2018-12-29 20:32:20', '0', 'EXAM');
INSERT INTO `subject` VALUES ('2954ff84207542b395d2471e166cb414', 'fad663ea371f4250a81332bd3a346739', null, '1', '0', '', '1', '1', '1', '1', '', '', 'D', '5', '1', '2', 'admin', '2018-12-09 20:27:59', 'admin', '2018-12-09 20:27:59', '1', 'EXAM');
INSERT INTO `subject` VALUES ('4d654c576f534f349278806b046608d6', 'fad663ea371f4250a81332bd3a346739', '2', '公元前212年，秦始皇坑杀“术士”，长子扶苏劝谏说：“远方黔首未集，诸生皆诵     法孔子，今上皆重法绳之，臣恐天下不安，唯上察之”。这反映当时', '0', '', '统一进程曲折', '地方治理不畅', '始皇灭儒崇法', '儒学影响较大', '', '', 'B', '4', '公元前212年，秦始皇坑杀“术士”，长子扶苏劝谏说：“远方黔首未集，诸生皆诵     法孔子，今上皆重法绳之，臣恐天下不安，唯上察之”。这反映当时', '4', 'admin', '2018-12-09 21:07:07', 'admin', '2019-01-01 14:42:12', '0', 'EXAM');
INSERT INTO `subject` VALUES ('ac2787a9c86e4ca39d17e53348d6fccb', 'f051f54621fc4812b929a7777a701712', null, '33', '0', '', '33', '33', '33', '33', '', '', 'D', '5', '333', '2', 'admin', '2018-12-09 20:55:52', 'admin', '2019-01-07 22:11:19', '0', 'EXAM');
INSERT INTO `subject` VALUES ('e34926a94a4a4895817d7ea78aa63012', 'fad663ea371f4250a81332bd3a346739', '1', '《小雅·鹿鸣》本是西周贵族宣扬宴飨之仪的乐歌，后扩散到民间，在乡人宴会上也可传唱。这表明西周时期', '0', '', '周人生活较为富足', '礼乐文明得到广泛认同', '乡人社会地位提高', '贵族奢靡之风波及民间', '', '', 'B', '4', '材料涉及西周贵族宣扬宴飨之仪的乐歌扩散到民间，并不能由此说明周人生活较为富足，故A项错误；据材料“西周贵族宣扬宴飨之仪的乐歌，后扩散到民间，在乡人宴会上也可传唱”可知礼乐文明得到广泛认同，故B项正确；仅凭材料宴飨之仪的乐歌的扩散不足以说明乡人社会地位提高，故C项错误；材料涉及贵族宴飨之仪的乐歌的扩散，并未涉及贵族奢靡之风，故D项错误。', '2', 'admin', '2018-12-09 20:30:07', 'admin', '2018-12-29 20:50:12', '0', 'EXAM');
INSERT INTO `subject` VALUES ('e73e1cf4feaf47449ce982376afcdb03', 'fad663ea371f4250a81332bd3a346739', null, '232222', '0', '', '323fffff', '32', '32', '323', '', '', 'D', '5', '323', '2', 'admin', '2018-12-09 20:28:15', 'admin', '2018-12-09 20:28:15', '1', 'EXAM');
INSERT INTO `subject` VALUES ('ea1a81331e0b4ecfa39cb59813d11fa5', '4f9ced28ffe64fcea57a7367e9fd4c0c', '1', '测试', '0', '', '测试', '测试', '测试', '测试', '', '', 'A', '2', '测试', '2', 'admin', '2019-01-14 20:32:54', 'admin', '2019-01-14 20:32:54', '0', 'EXAM');

-- ----------------------------
-- Table structure for subject_bank
-- ----------------------------
DROP TABLE IF EXISTS `subject_bank`;
CREATE TABLE `subject_bank` (
  `id` varchar(64) NOT NULL,
  `category_id` varchar(64) DEFAULT NULL COMMENT '分类ID',
  `serial_number` varchar(62) DEFAULT NULL COMMENT '题目序号',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '题目名称',
  `type` varchar(64) DEFAULT NULL COMMENT '题目类型',
  `content` varchar(255) DEFAULT NULL COMMENT '题目内容',
  `option_a` varchar(255) DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) DEFAULT NULL COMMENT '选项d',
  `option_e` varchar(255) DEFAULT NULL COMMENT '选项e',
  `option_f` varchar(255) DEFAULT NULL COMMENT '选项f',
  `answer` varchar(255) DEFAULT NULL COMMENT '参考答案',
  `score` varchar(64) DEFAULT NULL COMMENT '分值',
  `analysis` varchar(255) DEFAULT NULL COMMENT '解析',
  `level` varchar(64) DEFAULT NULL COMMENT '难度等级',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库表';

-- ----------------------------
-- Records of subject_bank
-- ----------------------------
INSERT INTO `subject_bank` VALUES ('2612f127f8e74736a086e9ec18850852', '700556b5becd4091821644a5288d489c', null, '232222', '0', '', '323fffff', '32', '32', '323', '', '', '2', '323', '323', '2', 'admin', '2018-12-09 14:38:47', 'admin', '2018-12-09 14:49:43', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('3600225f10114e40a07e4312d3f7f8ad', '700556b5becd4091821644a5288d489c', '1', '1', '0', '', '1', '1', '1', '1', '', '', 'B', '1', '1', '2', 'admin', '2019-01-09 21:11:34', 'admin', '2019-01-09 21:11:34', '0', 'EXAM');
INSERT INTO `subject_bank` VALUES ('494fb828f270450690a82f23450f138f', '700556b5becd4091821644a5288d489c', '323', '23', '0', '', '323', '323', '323', '233', '', '', 'B', '323', '323', '2', 'admin', '2019-01-09 18:03:22', 'admin', '2019-01-09 18:03:22', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('aeff7c505e374cbdbcecf79e7a587ddd', '', '1', '33', '0', '', '33', '33', '33', '33', '', '', '3', '4', '333', '4', 'admin', '2018-12-09 14:47:02', 'admin', '2019-01-09 17:45:30', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('b1058acf24184bfd8c85c61d59dfdfd0', 'c664646337c345ac8a91e3b024ded8bb', null, '操作系统', '0', '', '操作系统', '操作系统', '操作系统', '操作系统', '', '', '1', '操作系统', '操作系统', '2', 'admin', '2018-12-09 20:26:59', 'admin', '2018-12-09 20:27:05', '1', 'EXAM');
INSERT INTO `subject_bank` VALUES ('f8cf3298c59045929c4c108251c66eb7', 'c664646337c345ac8a91e3b024ded8bb', null, '434', '0', '', '434', '434', '343', '4434', '', '', '2', '434', '434', '2', 'admin', '2018-12-09 20:27:32', 'admin', '2018-12-09 20:27:32', '1', 'EXAM');

-- ----------------------------
-- Table structure for subject_category
-- ----------------------------
DROP TABLE IF EXISTS `subject_category`;
CREATE TABLE `subject_category` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `category_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父分类ID',
  `sort` varchar(64) DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject_category
-- ----------------------------
INSERT INTO `subject_category` VALUES ('047a8dd7d0614314a72750af9915ada0', '大学语文', null, '-1', '6', 'admin', '2018-12-06 20:37:38', 'admin', '2018-12-06 20:44:44', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('103cf01d23574c93b88a4aff2a350471', '四级', null, '412a93a6e1ac49a59e66da0721c183cd', '1', 'admin', '2018-12-09 20:32:08', 'admin', '2018-12-09 20:32:08', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('412a93a6e1ac49a59e66da0721c183cd', '大学英语', '大学英语', '-1', '2', 'admin', '2018-12-06 20:37:29', 'admin', '2018-12-06 20:44:25', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('577ff5e3a9b345e18d40e505cc631110', '国际金融', null, '-1', '5', 'admin', '2018-12-06 20:38:30', 'admin', '2018-12-06 20:44:40', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('700556b5becd4091821644a5288d489c', '架构基础', '4343434', 'aceeeb30b57f4d6982cd37682b5b7522', '1', 'admin', '2018-12-06 20:45:06', 'admin', '2018-12-09 20:47:28', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('9fdbb0add5354249a8a2d530bdd48d08', '高等数学', null, '-1', '3', 'admin', '2018-12-06 20:37:45', 'admin', '2018-12-06 20:44:31', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('aceeeb30b57f4d6982cd37682b5b7522', '计算机', null, '-1', '1', 'admin', '2018-12-06 20:41:44', 'admin', '2018-12-06 20:44:09', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('c664646337c345ac8a91e3b024ded8bb', '操作系统', null, 'aceeeb30b57f4d6982cd37682b5b7522', '2', 'admin', '2018-12-06 20:45:21', 'admin', '2018-12-06 20:45:21', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('caf8805fc7dc481b98d08ab13e5c5234', '数据库', null, 'aceeeb30b57f4d6982cd37682b5b7522', '3', 'admin', '2018-12-06 20:45:34', 'admin', '2018-12-06 20:45:34', '0', 'EXAM');
INSERT INTO `subject_category` VALUES ('dbc710d2af704f8b88488ae2b7e63d9e', '5555', null, '-1', '30', 'admin', '2018-12-09 21:04:56', 'admin', '2018-12-09 21:04:56', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('e11504263fef456997b24d7db0a86c4c', '六级', null, '412a93a6e1ac49a59e66da0721c183cd', '2', 'admin', '2018-12-09 20:32:16', 'admin', '2018-12-09 20:32:16', '1', 'EXAM');
INSERT INTO `subject_category` VALUES ('ffe1d4053ae4475bb39aacd6699d37c4', '应用数学', null, '-1', '4', 'admin', '2018-12-06 20:38:20', 'admin', '2018-12-06 20:44:36', '0', 'EXAM');
SET FOREIGN_KEY_CHECKS=1;

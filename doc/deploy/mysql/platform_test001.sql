/*
Navicat MySQL Data Transfer

Source Server         : mysql_144
Source Server Version : 50710
Source Host           : 192.168.0.144:3306
Source Database       : platform_test001

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-02-15 11:15:37
*/

DROP DATABASE IF EXISTS `platform_test001`;

CREATE DATABASE  `platform_test001` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

SET NAMES utf8;

SET FOREIGN_KEY_CHECKS=0;

USE `platform_test001`;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `id` varchar(64) NOT NULL,
  `attach_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `attach_size` varchar(255) DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `parent_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '父部门id',
  `sort` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT '状态 0-启用，1-禁用',
  `dept_desc` varchar(255) DEFAULT NULL COMMENT '部门描述',
  `dept_leader` varchar(255) DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('140b2ba6508240f2a39b6729e6cc5f3e', '11', '2d0b1e08677d45bc8cee3db44774abf6', '30', 'admin', '2018-12-01 14:21:51', 'admin', '2018-12-01 14:21:51', '1', 'EXAM', '0', '11', '11');
INSERT INTO `sys_dept` VALUES ('1e31659224884cbc89022ab4e6ecf70c', '移动研发部', '551aafb3281b44b1bfbd19bac9e54b94', '27', '', '2018-10-26 17:21:47', 'admin', '2019-01-09 14:13:29', '0', '', '0', '移动研发部', '叶瑞龙');
INSERT INTO `sys_dept` VALUES ('2d0b1e08677d45bc8cee3db44774abf6', '测试部门', '-1', '30', '', '2018-10-27 22:22:22', '', '2018-10-27 22:22:22', '0', '', '0', '测试', '测试');
INSERT INTO `sys_dept` VALUES ('34f01bfe915647f2859400fadba431b0', '', '-1', '30', '', '2018-10-29 13:01:46', '', '2018-10-29 13:01:46', '1', '', '0', null, null);
INSERT INTO `sys_dept` VALUES ('3b40c8dcf95f4fc78b748d550aa9df6a', '研发一部', 'bae0cdcda1ab42559de45bd0420f3c34', '28', '', '2018-10-25 20:57:25', '', '2018-10-25 20:57:25', '0', '', '0', '研发一部', '沉香');
INSERT INTO `sys_dept` VALUES ('4f1ed1353d904ad3837458266de8a080', '平台研发部', '551aafb3281b44b1bfbd19bac9e54b94', '26', '', '2018-10-26 17:22:14', '', '2018-10-26 17:22:14', '0', '', '0', '平台研发部', '马志鹏');
INSERT INTO `sys_dept` VALUES ('551aafb3281b44b1bfbd19bac9e54b94', '行业发展研究中心', '-1', '3', '', '2018-10-26 17:21:11', '', '2018-10-26 17:21:11', '0', '', '0', '行业发展研究中心', '黄华伟');
INSERT INTO `sys_dept` VALUES ('674b823335114dd1b9de642e689a8e19', '政务服务事业部', '-1', '2', '', '2018-10-25 20:58:41', '', '2018-10-25 20:58:41', '0', '', '0', '政务服务事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('839a2524aea445bb83a46a0ea03f87ac', '智慧政务事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:22:43', '', '2018-10-26 17:22:43', '0', '', '0', '智慧政务事业部', '周武杰');
INSERT INTO `sys_dept` VALUES ('bae0cdcda1ab42559de45bd0420f3c34', '研发部', '-1', '1', '', '2018-10-25 20:38:04', '', '2018-10-25 20:42:58', '0', '', '1', '产品研发', '杨锐');
INSERT INTO `sys_dept` VALUES ('c29e267021b242139e95d34a1b1488a4', '广东财经大学', '-1', '50', 'admin', '2018-11-12 19:50:28', 'admin', '2018-11-12 19:50:28', '0', 'EXAM', '0', '广东财经大学', null);
INSERT INTO `sys_dept` VALUES ('cb38942fba4c438995dee5622d3dfdfa', '智慧政府事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:23:05', '', '2018-10-26 17:23:05', '0', '', '0', '智慧政府事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('ef7a812bc75743b3929a8c0dde9d5467', '研发二部', 'bae0cdcda1ab42559de45bd0420f3c34', '29', '', '2018-10-25 20:58:06', 'admin', '2018-10-30 15:40:35', '0', '', '0', '研发二部', '庞锦坤');
INSERT INTO `sys_dept` VALUES ('f4e3ff4b0fea4856ab71f7c9a31449d8', 'iiii', '-1', '30', '', '2018-10-29 13:04:43', '', '2018-10-29 13:04:53', '1', '', '0', 'tt', 'tt');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `type` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `title` varchar(2000) DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(255) DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(255) DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(255) DEFAULT NULL COMMENT '服务ID',
  `time` varchar(255) DEFAULT NULL COMMENT '耗时',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` varchar(20) DEFAULT NULL COMMENT '排序',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `creator` varchar(255) DEFAULT NULL,
  `create_date` varchar(64) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `modify_date` varchar(64) DEFAULT NULL,
  `del_flag` varchar(20) DEFAULT NULL,
  `application_code` varchar(64) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL COMMENT '模块',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('095bb0644ab14d97b31418f87e1cf823', '导出菜单', 'sys:menu:export', null, '3', '', '34', '1', 'admin', '2018-11-28 19:07:02', 'admin', '2018-11-28 19:07:02', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('0dc80492cf414db984d825fdd842e022', '新增用户', 'sys:user:add', null, '4', 'example', '1', '1', '', '2018-10-28 16:38:57', 'admin', '2018-11-04 10:20:38', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('0ee02b8dc3064fcd972f527c31aad5a7', '修改菜单', 'sys:menu:edit', null, '3', 'example', '4', '1', '', '2018-10-28 16:46:38', 'admin', '2018-11-04 10:21:23', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('0fe1156ec9e24dd4bc2c663c665a5048', '导出用户', 'sys:user:export', null, '4', '', '33', '1', 'admin', '2018-11-27 12:05:03', 'admin', '2018-11-27 12:05:03', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'sys', '/admin/sys/**', '-1', 'component', '1', '0', '1', '1', 'admin', '2018-11-06 23:23:35', '0', '1', 'Layout', '/sys', null, null);
INSERT INTO `sys_menu` VALUES ('13f925e8559c43aa8ef33a8e1e3f9b4d', '知识库', 'exam:knowledge', '/exam/knowledge/**', 'b93eba1199b6420a82d285a8919bcd23', '', '5', '0', 'admin', '2019-01-01 14:55:31', 'admin', '2019-01-01 14:55:31', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', null, null);
INSERT INTO `sys_menu` VALUES ('14', '个人管理', 'personal', '/admin/personal/**', '-1', 'form', '30', '0', '', '2018-10-28 16:12:34', 'admin', '2018-10-30 14:42:17', '0', '', 'Layout', '/personal', null, '个人管理');
INSERT INTO `sys_menu` VALUES ('15', '附件管理', 'attachment', '/admin/attachment/**', '-1', 'excel', '10', '0', 'admin', '2018-10-30 19:48:36', 'admin', '2018-10-30 20:31:21', '0', 'EXAM', 'Layout', '/attachment', null, '附件管理');
INSERT INTO `sys_menu` VALUES ('1717eabc03174c2e9bdaf27c5a5697dd', '题库管理', 'exam:subject', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '3', '0', 'admin', '2018-12-04 21:33:40', 'admin', '2018-12-04 21:33:40', '0', 'EXAM', 'views/exam/subject', 'subject', null, '题库管理');
INSERT INTO `sys_menu` VALUES ('1b68d41bfcc3441f839188a9d7b6ead0', '接口文档', 'monitor:document', '/monitor/document/**', '7', '', '34', '0', 'admin', '2018-10-30 15:06:08', 'admin', '2019-01-08 20:38:23', '0', 'EXAM', '', 'http://localhost:9999/swagger-ui.html', null, null);
INSERT INTO `sys_menu` VALUES ('1e6a90e57df541e0973691c17d44564c', '日志监控', 'monitor:log', '/admin/log/**', '7', '', '30', '0', 'admin', '2018-10-30 15:00:25', 'admin', '2018-11-06 23:34:19', '0', 'EXAM', 'views/monitor/log', 'log', null, '日志监控');
INSERT INTO `sys_menu` VALUES ('23df3c2475504ca781e25c3443d7ad25', '修改课程', 'exam:course:edit', null, 'b8969a3731b0405e82d0bb896e13841e', '', '2', '1', 'admin', '2018-11-10 22:44:28', 'admin', '2018-11-10 22:44:28', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2a232ac9f43146a49ab5a19226e76742', '删除部门', 'sys:dept:del', null, '6', 'example', '3', '1', '', '2018-10-28 16:43:19', 'admin', '2018-11-04 10:20:22', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', 'sys:menu', '/admin/menu/**', '1', '', '10', '0', '1', '1', 'admin', '2018-11-06 23:34:12', '0', '1', 'views/sys/menu', 'menu', null, null);
INSERT INTO `sys_menu` VALUES ('34371d1e990549f0b633389bdf64ce0f', '修改题目分类', 'exam:subject:category:edit', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '5', '1', 'admin', '2018-12-04 21:36:34', 'admin', '2018-12-04 21:36:34', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('347d24c6e1cf42eaa976c91f5607007a', '新增部门', 'sys:dept:add', null, '6', 'example', '1', '1', '', '2018-10-28 16:42:40', 'admin', '2018-11-04 10:20:15', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('34ffa24d3c124902893e601fe8e22b08', 'eureka监控', 'monitor:service', '/admin/monitor/service/**', '7', '', '31', '0', 'admin', '2018-10-30 15:01:17', 'admin', '2019-01-08 20:37:00', '0', 'EXAM', '', 'http://localhost:8765/', null, null);
INSERT INTO `sys_menu` VALUES ('36cca77232f3487cbee02bb68ae12652', '新增菜单', 'sys:menu:add', null, '3', 'example', '1', '1', '', '2018-10-28 16:45:45', 'admin', '2018-11-04 10:21:06', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3a64f8a80dce4f6c8bc4483f0230f49f', '导入用户', 'sys:user:import', null, '4', '', '34', '1', 'admin', '2018-11-27 12:05:29', 'admin', '2018-11-27 12:05:29', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3bb2fec1ba094584aa1a984ec1f05dc7', '删除课程', 'exam:course:del', null, 'b8969a3731b0405e82d0bb896e13841e', '', '3', '1', 'admin', '2018-11-10 22:44:53', 'admin', '2018-11-10 22:44:53', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'sys:user', '/admin/user/**', '1', '', '2', '0', '1', '1', 'admin', '2018-11-06 23:33:55', '0', '1', 'views/sys/user', 'user', '', '用户管理');
INSERT INTO `sys_menu` VALUES ('42c69128d30a4242b08ef0003da68528', '修改角色', 'sys:role:edit', null, '5', 'example', '4', '1', '', '2018-10-28 16:45:11', 'admin', '2018-11-04 10:19:45', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('451605025d9a4715b4ae78f5a5d01fea', '删除题目分类', 'exam:subject:category:del', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '6', '1', 'admin', '2018-12-04 21:36:55', 'admin', '2018-12-04 21:36:55', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4f3e874dc310463a82e3b650fd851fdb', '修改密码', 'personal:password', '/admin/user/updateInfo', '14', '', '30', '0', 'admin', '2018-10-29 21:59:03', 'admin', '2018-11-06 23:34:47', '0', 'EXAM', 'views/personal/password', 'password', null, '密码修改');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', 'sys:role', '/admin/role/**', '1', '', '9', '0', '1', '1', 'admin', '2018-11-06 23:34:06', '0', '1', 'views/sys/role', 'role', '', null);
INSERT INTO `sys_menu` VALUES ('530f933da3824e1f9bf3182794141e9e', '删除题目', 'exam:subject:bank:del', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '3', '1', 'admin', '2018-12-04 21:35:13', 'admin', '2018-12-09 20:36:05', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('594e7afda95c42e6af2046f1bfe81c53', '删除日志', 'monitor:log:del', null, '1e6a90e57df541e0973691c17d44564c', '', '30', '1', 'admin', '2019-01-07 22:15:02', 'admin', '2019-01-07 22:15:02', '0', 'EXAM', null, null, null, '删除日志');
INSERT INTO `sys_menu` VALUES ('5ba624643cd34ec3b78ca622964c0f8a', '修改题目', 'exam:subject:bank:edit', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '2', '1', 'admin', '2018-12-04 21:34:50', 'admin', '2018-12-09 20:35:58', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('6', '部门管理', 'sys:dept', '/admin/dept/**', '1', '', '8', '0', '1', '1', 'admin', '2018-11-06 23:34:00', '0', '1', 'views/sys/dept', 'dept', '', null);
INSERT INTO `sys_menu` VALUES ('63f039ea5bcf4208978150b59484a429', '考试管理', 'exam:exam', '/exam/examination/**', 'b93eba1199b6420a82d285a8919bcd23', '', '2', '0', 'admin', '2018-11-10 22:22:42', 'admin', '2019-01-11 14:23:58', '0', 'EXAM', 'views/exam/exam', 'exam', null, '考试管理');
INSERT INTO `sys_menu` VALUES ('657026922f494801a41b64f40e63fca6', '删除考试', 'exam:exam:del', null, '63f039ea5bcf4208978150b59484a429', '', '3', '1', 'admin', '2018-11-10 22:46:12', 'admin', '2018-11-10 22:46:12', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('69a2a85608064762a3d76fc0c92072cc', '新增题目分类', 'exam:subject:category:add', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '4', '1', 'admin', '2018-12-04 21:35:59', 'admin', '2018-12-04 21:35:59', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('6f605148282b4949b5c96e2877dc9052', '题目管理', 'exam:exam:subject', null, '63f039ea5bcf4208978150b59484a429', '', '4', '1', 'admin', '2018-11-13 20:50:07', 'admin', '2018-11-13 20:50:41', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'sys', '/admin/monitor/**', '-1', 'chart', '7', '0', '1', '1', 'admin', '2019-01-05 16:19:56', '0', '1', 'Layout', '/monitor', '', null);
INSERT INTO `sys_menu` VALUES ('71e5179363bc4e119a87daaa631a2712', '导入题目', 'exam:exam:subject:import', null, '63f039ea5bcf4208978150b59484a429', '', '36', '1', 'admin', '2018-11-27 12:06:45', 'admin', '2018-11-27 12:06:45', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('72de30896d3a401eb62edc0aa6fbf190', '导出成绩', 'exam:examRecord:export', null, 'c3adad9112de41a6a2d4cc9fe4a4d94b', '', '30', '1', 'admin', '2018-12-30 22:12:20', 'admin', '2019-01-22 19:43:52', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7780e3fd6cea4ba78d780f33c111d95a', '导入菜单', 'sys:menu:import', null, '3', '', '35', '1', 'admin', '2018-11-28 19:07:20', 'admin', '2018-11-28 19:07:20', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7f78172c09d3408dab1534d26b608b31', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 'admin', '2018-11-06 23:26:57', 'admin', '2019-01-09 22:04:59', '0', 'EXAM', '', '/dashboard', '', '首页');
INSERT INTO `sys_menu` VALUES ('8aefee22294d47d7a3e4a29ae5ced4b4', '个人资料', 'personal:message', '/admin/user/updateInfo', '14', '', '29', '0', 'admin', '2018-10-29 21:58:32', 'admin', '2018-11-06 23:34:41', '0', 'EXAM', 'views/personal/message', 'message', null, '个人资料');
INSERT INTO `sys_menu` VALUES ('8b67ccbe89f74b728e58c2e4a4795027', '删除菜单', 'sys:menu:del', null, '3', 'example', '3', '1', '', '2018-10-28 16:46:23', 'admin', '2018-11-04 10:21:14', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('8bcf03f73377412b981572517b9055e0', '删除题目', 'exam:exam:subject:del', null, '63f039ea5bcf4208978150b59484a429', '', '38', '1', 'admin', '2018-11-29 14:11:24', 'admin', '2018-11-29 14:11:24', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('901959fd37df4f7d90adaa4ab6c4b331', '分配权限', 'sys:role:auth', null, '5', '', '30', '1', 'admin', '2018-11-04 10:19:32', 'admin', '2018-11-04 10:19:32', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('91861ef795ab4fc4a207567606fa62cc', '修改用户', 'sys:user:edit', null, '4', 'example', '4', '1', '', '2018-10-28 16:40:19', 'admin', '2018-11-04 10:20:54', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('9c0846685bb24aafae731bdacf879ba2', '删除角色', 'sys:role:del', null, '5', 'example', '3', '1', '', '2018-10-28 16:44:56', 'admin', '2018-11-04 10:20:01', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('9c2e04eab32c467f87d89ad0a2b4892c', '导出题目', 'exam:subject:bank:export', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '32', '1', 'admin', '2018-12-09 20:38:06', 'admin', '2018-12-09 20:38:06', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('a398216ac2f14c16928452483786329e', '新增题目', 'exam:subject:bank:add', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '1', '1', 'admin', '2018-12-04 21:34:29', 'admin', '2018-12-09 20:35:18', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('a663e71f7b8441b0b8363ae5eb20bbb3', '修改部门', 'sys:dept:edit', null, '6', 'example', '4', '1', '', '2018-10-28 16:43:38', 'admin', '2018-11-04 10:20:30', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('ac6768a097184c99ada64810a897f727', '新增考试', 'exam:exam:add', null, '63f039ea5bcf4208978150b59484a429', '', '1', '1', 'admin', '2018-11-10 22:45:29', 'admin', '2018-11-10 22:45:29', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('b85dda1e623e48e4ae82dc228df3edfe', '新增课程', 'exam:course:add', null, 'b8969a3731b0405e82d0bb896e13841e', '', '1', '1', 'admin', '2018-11-10 22:44:05', 'admin', '2018-11-10 22:44:05', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('b8969a3731b0405e82d0bb896e13841e', '课程管理', 'exam:course', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '1', '0', 'admin', '2018-11-10 22:21:58', 'admin', '2018-11-10 22:27:03', '0', 'EXAM', 'views/exam/course', 'course', null, '课程管理');
INSERT INTO `sys_menu` VALUES ('b93eba1199b6420a82d285a8919bcd23', '考务管理', 'exam', '/exam/**', '-1', 'nested', '8', '0', 'admin', '2018-11-10 22:20:10', 'admin', '2018-11-10 22:20:10', '0', 'EXAM', 'Layout', '/exam', null, '考务管理');
INSERT INTO `sys_menu` VALUES ('c2bc24819bcc4e8790f0dba586914efe', '服务监控', 'monitor:admin', '/admin/monitor/admin/**', '7', '', '33', '0', 'admin', '2019-01-08 20:38:05', 'admin', '2019-01-08 20:43:25', '0', 'EXAM', null, 'http://localhost:5001', null, null);
INSERT INTO `sys_menu` VALUES ('c3adad9112de41a6a2d4cc9fe4a4d94b', '成绩管理', 'exam:examRecord', '/exam/examRecord/**', 'b93eba1199b6420a82d285a8919bcd23', '', '4', '0', 'admin', '2018-12-30 22:10:53', 'admin', '2019-01-22 19:43:35', '0', 'EXAM', 'views/exam/examRecord', 'score', null, '成绩管理');
INSERT INTO `sys_menu` VALUES ('c435ac944cd6430ba9a1039d8adb80a7', '新增角色', 'sys:role:add', null, '5', 'example', '1', '1', '', '2018-10-28 16:44:29', 'admin', '2018-11-04 10:19:53', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('ca7e69aae4994099a6424aa9727b6a28', '删除用户', 'sys:user:del', null, '4', 'example', '3', '1', '', '2018-10-28 16:40:01', 'admin', '2018-11-04 10:20:46', '0', '', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('cfc631763d3e4f1ab973141ddbeee449', '修改考试', 'exam:exam:edit', null, '63f039ea5bcf4208978150b59484a429', '', '2', '1', 'admin', '2018-11-10 22:45:51', 'admin', '2018-11-10 22:45:51', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('cffa2058b7c746efa2fca7ceb6052bdc', '新增题目', 'exam:exam:subject:add', null, '63f039ea5bcf4208978150b59484a429', '', '37', '1', 'admin', '2018-11-29 14:11:06', 'admin', '2018-11-29 14:11:06', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('d1967064f3584672af29c184818e38a9', '导入题目', 'exam:subject:bank:import', null, '1717eabc03174c2e9bdaf27c5a5697dd', '', '31', '1', 'admin', '2018-12-09 20:37:22', 'admin', '2018-12-09 20:37:22', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('ee35a2abc0b04f3bb70527a7f79806e8', 'zipkin监控', 'monitor:link', '/admin/monitor/link/**', '7', '', '32', '0', 'admin', '2018-11-07 20:30:43', 'admin', '2019-01-08 20:36:38', '0', 'EXAM', null, 'http://localhost:9411/zipkin/', null, null);
INSERT INTO `sys_menu` VALUES ('fa483765360243d0a631a2b9793aaf41', '导出题目', 'exam:exam:subject:export', null, '63f039ea5bcf4208978150b59484a429', '', '35', '1', 'admin', '2018-11-27 12:06:17', 'admin', '2018-11-27 12:06:17', '0', 'EXAM', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('fe73699236be4b148cd35628929cc876', '附件列表', 'attachment:list', '/admin/attachment/list', '15', '', '30', '0', 'admin', '2018-10-30 19:49:50', 'admin', '2018-11-06 23:34:35', '0', 'EXAM', 'views/attachment/list', 'list', null, '附件列表');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(64) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('online-exam', null, 'online-exam', 'server', 'password,refresh_token,authorization_code', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `is_default` varchar(20) DEFAULT NULL COMMENT '是否默认',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  `status` varchar(20) NOT NULL COMMENT '状态 0-启用，1-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '管理员', '0', 'admin', 'admin', 'test9', '2018-10-30 12:00:03', '0', 'admin', '0');
INSERT INTO `sys_role` VALUES ('2', '测试角色', 'test', '测试角色', '0', null, null, null, '2018-10-27 23:03:41', '1', null, '1');
INSERT INTO `sys_role` VALUES ('33589c91a8f64c5aa53b94add015e8aa', '测试', 'test1', '测试', '0', null, '2018-10-27 22:22:44', null, '2018-10-27 22:22:44', '1', '', '0');
INSERT INTO `sys_role` VALUES ('87ca2801018948cf932b49be07d59b05', '1', '1', '1', '0', 'admin', '2018-12-01 14:45:53', 'admin', '2018-12-01 14:45:53', '1', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('88cdd68a79634437a606a5a3fd12127a', 'java开发', 'java', 'java开发', '0', 'test9', '2018-10-30 12:01:33', 'test9', '2018-10-30 12:01:33', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('8ff8a3d10f2a4735bc76fc4485732b05', '测试角色', 'test1', '测试角色', '0', null, '2018-10-28 10:31:43', 'admin', '2018-12-09 22:13:25', '1', '', '0');
INSERT INTO `sys_role` VALUES ('90abd3e9d4b5424eacb0397dc0fc4e27', '老师', 'teacher', '老师', '0', 'admin', '2018-11-12 19:49:31', 'admin', '2019-01-11 14:18:14', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('e5ab0d61763e4eb7bf1c4122223e1872', '测试角色2', 'test2', '测试角色2', '0', null, '2018-10-26 17:17:35', null, '2018-10-26 17:18:01', '1', '', '0');
INSERT INTO `sys_role` VALUES ('ee1a0a7fe7c64ae28922432460d8ae61', '学生', 'student', '学生', '1', 'admin', '2018-11-12 19:49:49', 'admin', '2019-01-11 14:17:05', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('f623fcad11474a54bc1dcf0947bef487', '测试角色2', 'test2', '测试角色2', '0', null, '2018-10-28 11:51:49', null, '2018-10-28 13:22:50', '1', '', '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` varchar(64) NOT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `dept_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('07679c34e5094488b80ba496e70c7ac3', '90abd3e9d4b5424eacb0397dc0fc4e27', 'c29e267021b242139e95d34a1b1488a4');
INSERT INTO `sys_role_dept` VALUES ('4fe632d6b36b439d8c198dbccc5caf3f', '1', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('535eac35bfba409285358b478d8a941f', 'ee1a0a7fe7c64ae28922432460d8ae61', 'c29e267021b242139e95d34a1b1488a4');
INSERT INTO `sys_role_dept` VALUES ('701ed6dacffd4e8ea4bae43f28fbceea', '88cdd68a79634437a606a5a3fd12127a', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('b5e5b0d127a940ecba965519628d9f9f', '8ff8a3d10f2a4735bc76fc4485732b05', '2d0b1e08677d45bc8cee3db44774abf6');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(64) NOT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `menu_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('00d46d1c291f43e1bb2fe3c33f2a0b89', '90abd3e9d4b5424eacb0397dc0fc4e27', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('040f73306a92469b99ebd998c02f9b11', '1', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('0695cbd5a0274bb2b34f5a56195e7182', '90abd3e9d4b5424eacb0397dc0fc4e27', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('06b0196fa48b4ae29b350643040d80a6', '1', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('06c694c8ad954c07a49482c344aab0cf', '1', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('0852ffff42754c3482714cbf20c01bb5', '1', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('098a4bcbb73842cfb83911cde924a6cb', '1', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('09cdeb547e8e48c6a947688cf44f3d4a', 'ee1a0a7fe7c64ae28922432460d8ae61', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('0c89e56a22184b8c9f6bd70939f95802', '1', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('0dd3b94c228f4705b8c2ba3dbc83bdaa', '90abd3e9d4b5424eacb0397dc0fc4e27', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('0e4baff63eca46ea9afa481456250e37', '1', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('11ecfaf5f08e417ebfb7530c9ac3206d', '88cdd68a79634437a606a5a3fd12127a', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('12c77ed6a2ab40f0b3a814796e27ce9b', '1', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('141cd3924250446e8fddcf6d70f40319', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('1942fbb1dfa149449626591461a0eae5', '90abd3e9d4b5424eacb0397dc0fc4e27', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('1be3cd5880664ddba38e806807f1ecd0', '1', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('1c0bd68ef1b449e6b5b84524e809535f', '1', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('1ddbbde0dea14fcb91dbfbc7a720941d', '90abd3e9d4b5424eacb0397dc0fc4e27', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('1e836bb3321e4acf82c0496711972ca1', '1', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('1f0e0f06618c47e2bbaee489a3c817bc', '88cdd68a79634437a606a5a3fd12127a', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('200c45d905344ac6b5f890ee96e18b5f', '1', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('304b8232a32b49fd8e6584c20e807799', '90abd3e9d4b5424eacb0397dc0fc4e27', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('3251fbea4ee0489cb961939032d9e334', '1', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('34ef7c688c0b4ac587d0706076e32207', '1', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('3684221141544ab8bfe5368642fac6c3', '1', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('382f71b599c24360a0e34211323c567c', '90abd3e9d4b5424eacb0397dc0fc4e27', '1');
INSERT INTO `sys_role_menu` VALUES ('391e73d846434d9190483b3a7282469b', '1', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('3b48b3aab3124457b0d1517692f2273c', '1', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('3e2ecb5b77a9482d8145c15ad0fbb7f0', '8ff8a3d10f2a4735bc76fc4485732b05', '14');
INSERT INTO `sys_role_menu` VALUES ('42964f4590474aa392b765e73f8fa81b', '1', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('45a6c0cb6eb942d782d1389779baa400', '1', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('47e16ac65d2e4dd0ae5090c606b17d7f', '90abd3e9d4b5424eacb0397dc0fc4e27', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('4a248a8182b54751b2a312ffa87cde49', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('4e6bf31c5d9548369fa3f265bbf176b2', '1', '594e7afda95c42e6af2046f1bfe81c53');
INSERT INTO `sys_role_menu` VALUES ('4fec34a6a5fb4fca884a70ada23d32b2', '1', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('54095b08b375474ba1b076451b02c6a0', 'ee1a0a7fe7c64ae28922432460d8ae61', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('5bad46a0d9d7478f8972e3b09c419e89', '90abd3e9d4b5424eacb0397dc0fc4e27', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('5f8b12a53471448a96e66a663f2e60e4', '1', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('6400a4348f6d42ea94699852337f4d65', '88cdd68a79634437a606a5a3fd12127a', '7');
INSERT INTO `sys_role_menu` VALUES ('68f410ce6a7d4f97930770fbab7e8932', '90abd3e9d4b5424eacb0397dc0fc4e27', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('6b3506e6d4d04178aff6eb5701eb843f', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('6c6dbbe01b10462e9bd8bcde50862434', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('6ddc5c42cd434c87a29836e68fde0aa4', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('717c037a595648f7a4a903aef037e660', '1', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('7360ce9a9bda40b6be4ec66c6a66de34', '1', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('76d08fdf46d74015b64f4aeaf1bad491', '1', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('7700a10470e34ea2a51fa9770b21352a', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('7e5104a972314e528d161a2e40940d9b', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('7f8c6ec41108426c9daf1b92768a873e', '1', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('83a01f874a7b46bb816f985db2b3b4b4', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('867ee8426e024c5e95a9953b220d5344', '1', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('882319284ac749bcade5af5dc7531cca', '1', '2a232ac9f43146a49ab5a19226e76742');
INSERT INTO `sys_role_menu` VALUES ('94c82a575faa47b1ab23f5c148c87a49', '1', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('9558ad23b72340f1a8bc8ccc77878ca2', '1', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('961d96502bd54229a068571d789c8eb9', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('98e72d189a684751b8b988911bef9094', 'ee1a0a7fe7c64ae28922432460d8ae61', '14');
INSERT INTO `sys_role_menu` VALUES ('9bb41d8e0fdf4b10a26b43a42ac66d18', '1', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('9c1af421c3a846b8933308b9700c72a2', '1', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('9c36cc7acbc34af988f1aba86048006f', 'ee1a0a7fe7c64ae28922432460d8ae61', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('9dfde73594f7420f83d9468dab6449e1', '1', '095bb0644ab14d97b31418f87e1cf823');
INSERT INTO `sys_role_menu` VALUES ('9f1d3d116ba448569c8eaf06e59fa49d', '90abd3e9d4b5424eacb0397dc0fc4e27', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('a35f12b05b9944178b4ca40582bd8656', '88cdd68a79634437a606a5a3fd12127a', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('ac47c8de88a844afb056b48331f13f32', '1', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('adfa48f367b84f54a2516561c65f16e4', '1', 'c2bc24819bcc4e8790f0dba586914efe');
INSERT INTO `sys_role_menu` VALUES ('af6f6fd63dff4a16a65df5176f6f6146', '90abd3e9d4b5424eacb0397dc0fc4e27', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('b0b5b89f0992487ea1a0b7ccd9b61f11', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('b0e58df6931a4acd87cbe6c1fd6a2f8e', '90abd3e9d4b5424eacb0397dc0fc4e27', '14');
INSERT INTO `sys_role_menu` VALUES ('b63539cc88c44854941b881fef02c4a6', '1', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('b9c36f3f763d4b5dbe2287357d0cf751', '88cdd68a79634437a606a5a3fd12127a', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('b9e9606647c74a0da89da3ebf6b7430c', '1', '8b67ccbe89f74b728e58c2e4a4795027');
INSERT INTO `sys_role_menu` VALUES ('c264040bc332446d91883adbb408e7a1', '90abd3e9d4b5424eacb0397dc0fc4e27', '4');
INSERT INTO `sys_role_menu` VALUES ('c5181115ab4f4bf3b98cdc402a6efedb', '1', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('c526ba3a00454414b1f8bea039370895', '1', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('c8eaaf70a8584991bd08de44635cece2', '90abd3e9d4b5424eacb0397dc0fc4e27', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('c92d187ceea6459ca349e77399d58dae', '90abd3e9d4b5424eacb0397dc0fc4e27', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('cebeaebd667344e4b3e219ad8abac7d6', '1', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('cf78858d1f6548e9a91d8451b057c02d', '90abd3e9d4b5424eacb0397dc0fc4e27', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('d93c5bb7e79b4640b3764308f7304dcf', '1', '901959fd37df4f7d90adaa4ab6c4b331');
INSERT INTO `sys_role_menu` VALUES ('dc9c4f2043074e9a85c717a3808b99df', '1', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('ddc11d4823cc4d2ca127f67e7bd07ce4', 'ee1a0a7fe7c64ae28922432460d8ae61', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('dde64e0fa26e4d97bc68e565b3b9961d', '1', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('de3c770e10c24a189c5ceb9743172ff6', '1', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('dea04911210046d38c2fbecb8387a204', '1', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('df55f6613a1548a7a059ed9a12c1f08a', '1', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('e07ca326f5d84f159e9afa1525b4bf99', '1', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('e1f700611ce34a3aad786ff8d3b572f9', '1', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('e2a74bb4192a4501bf25bd6deea78f2f', '1', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('e76e45a5bd45414ebefeba0239910b5d', '88cdd68a79634437a606a5a3fd12127a', '14');
INSERT INTO `sys_role_menu` VALUES ('ebe7af1232614a14a32e1edf4dbbaffa', '1', 'ee35a2abc0b04f3bb70527a7f79806e8');
INSERT INTO `sys_role_menu` VALUES ('ec1dc4c735f44b5382a8ea028466e23d', '88cdd68a79634437a606a5a3fd12127a', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('ed3b5be11be24f019740d226a9bc860a', 'ee1a0a7fe7c64ae28922432460d8ae61', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('eda4e95da0684e79b0963d3ebce6dc71', '1', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('f0bd88a27af14eb3a3e10b8b5765b09c', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('f3a1bc86cb344e9a96fd0f426a516a09', '90abd3e9d4b5424eacb0397dc0fc4e27', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('fa3abdf40e4b4f7da113b4f53525faef', '1', '7780e3fd6cea4ba78d780f33c111d95a');
INSERT INTO `sys_role_menu` VALUES ('fd2e2a7aac3a499bb32f6be3ef348c68', '1', 'b85dda1e623e48e4ae82dc228df3edfe');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '性别',
  `born` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '生日',
  `status` varchar(20) DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0a6a8413d59e4a8da552e2b185b03306', null, 'tangyi5', '$2a$10$5h0hSqM6Ajk5DrSoHohfz.fXayWcOUSSuDnCiqiHPW1JAuUvWc1qW', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-11 14:19:52', 'anonymousUser', '2019-01-11 14:19:52', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('112f64a6ff2a4f019c5c8a0cae47e0a8', '瑶瑶', 'xieyy', '$2a$10$zoIKAKypCGOiuvcn/ZQBN.iLEq42JiF4M4IAV2hq9AZ6hr/Q5OmFO', null, '3333', 'http://localhost:4000/attachment/download?id=2d72751214c4412abea18b96d3266681', '888', '0', '2018-10-16', '0', 'admin', '2018-10-31 19:40:23', 'admin', '2018-12-04 20:42:22', '0', 'EXAM', '3333', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$eTOqrN3oKY76eQTIE5ieGOJvOr86V/GVmoEg2lJWUUk5SOWNaMZfi', null, '323232323', 'http://localhost:4000/attachment/download?id=d2b1189cc9914586b2ab4d04216a0efc', '1633736729@qq.com', '1', '2018-10-11', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2018-12-04 20:44:14', '0', 'EXAM', 'ccccc', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('4e665b8c3e114e8a881efc479ea6286a', null, 'tangyi6', '$2a$10$qa2jL12eQnD9DQBUtJKQi.xRzy7da9Kd8CLtU5MSIsSmA/fDslkCq', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-11 17:01:41', 'anonymousUser', '2019-01-11 17:01:41', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('4f3ffc2924f740df93641063559842a6', '谭广宜', 'tangyi7', '$2a$10$QrFdHvVtrL3CtWd8zJT2LegtDRkjdQSB4SFwTsLjB/ZsbfFUHYFeS', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-11 17:02:42', 'anonymousUser', '2019-01-11 17:02:42', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('54a8b5c9c0274f24b41136544f6ed564', null, 'tangyi6', '$2a$10$0mM7B2KY2lz3Ge7UueHRJe6z.NOIYyl3yjaZStguBf6p7FwCY5CRi', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-11 17:01:32', 'anonymousUser', '2019-01-11 17:01:32', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('5c0007b13d5e464c90a542e233ba9f70', null, 'tangyi1', '$2a$10$HhWOe4lqAaHmdDg1PHMTTOPsIM7CsqH/rrAPjqXj.ZaYnY6Ap3O6a', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-10 22:42:49', 'anonymousUser', '2019-01-10 22:42:49', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('8c1c4a7b12554ec09bdd7af6d4fb0625', null, 'tangyi', '$2a$10$PAfpDpnhBH8oz/APwDu9Ve0moJi9isTYNVpGVCiXxgXHCC.3/PjVq', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-10 22:46:47', 'anonymousUser', '2019-01-10 22:46:47', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('98e2b585b078445c8d2154ad61aa81e5', null, 'tangyi3', '$2a$10$20KBYr.2whvuvxc2azoD7unrXwuKPXrnnr4vFf7UV02LAdL9ISqG6', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-10 22:48:45', 'anonymousUser', '2019-01-10 22:48:45', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('aae49b1f7b5b4f1eb105b8c8d1749b64', null, 'tangyi2', '$2a$10$sSl/NVa5zFqXbcnKmEmIleOhtWa0qDJvA.QNkUcApdWFqHLErU5Xe', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-10 22:47:39', 'anonymousUser', '2019-01-10 22:47:39', '0', 'EXAM', null, null);
INSERT INTO `sys_user` VALUES ('c19c2458404a49daa94c43ccc63e4522', '谭广宜', 'tangyi', '$2a$10$4F3oitNhYqvxx6bwHpoFpu1HZ2HmLnDgHSRegLA4paNY3VDiY2V7O', null, '15521089185', 'http://localhost:4000/attachment/download?id=9b7f0e7264b84284a04f96e756d799de', '16333736729@qq.com', '0', '2018-10-16', '0', 'test9', '2018-10-30 12:53:25', 'admin', '2018-12-04 20:39:30', '0', 'EXAM', 'Java', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('c5c9ccfa6e30412b95590bc8799ce52f', null, 'tangyi6', '$2a$10$wNpzrCs2f8yxRN5r/IMxqeLUFYW14FTC6fugclTykKrnYYgj9APvm', null, null, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', null, null, null, null, 'anonymousUser', '2019-01-11 17:00:55', 'anonymousUser', '2019-01-11 17:00:55', '0', 'EXAM', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1376defd2c5841c784f1a52cd2711a43', '4f3ffc2924f740df93641063559842a6', 'ee1a0a7fe7c64ae28922432460d8ae61');
INSERT INTO `sys_user_role` VALUES ('22130ffd442d4f6eb548b0fed8ff5179', '0b48e67d856249fb979d63877e95e307', '88cdd68a79634437a606a5a3fd12127a');
INSERT INTO `sys_user_role` VALUES ('6274b0bf86b74ce9a39fe6a87f121939', '112f64a6ff2a4f019c5c8a0cae47e0a8', '88cdd68a79634437a606a5a3fd12127a');
INSERT INTO `sys_user_role` VALUES ('67cb5614c48c4afbb3b5b9b112349844', '0a6a8413d59e4a8da552e2b185b03306', 'ee1a0a7fe7c64ae28922432460d8ae61');
INSERT INTO `sys_user_role` VALUES ('6a9987684e2b4fc0ac5bde468bd02460', '3', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('84185f1bf0aa4d38b2f321d0eaacf933', '4e665b8c3e114e8a881efc479ea6286a', 'ee1a0a7fe7c64ae28922432460d8ae61');
INSERT INTO `sys_user_role` VALUES ('90f3edd57e9b45838d8a49e7e220b370', 'c5c9ccfa6e30412b95590bc8799ce52f', 'ee1a0a7fe7c64ae28922432460d8ae61');
INSERT INTO `sys_user_role` VALUES ('a96040ccd08c437c8ce857c84599815a', 'f2ce7dc61cd14b4f94e8cd7cdbd30729', 'string');
INSERT INTO `sys_user_role` VALUES ('abaf262c04d047a2aa1abbcb89e2fd6a', 'c19c2458404a49daa94c43ccc63e4522', '1');
INSERT INTO `sys_user_role` VALUES ('d0afa490896a4652a7a72c45452b1420', '54a8b5c9c0274f24b41136544f6ed564', 'ee1a0a7fe7c64ae28922432460d8ae61');
INSERT INTO `sys_user_role` VALUES ('e1eaed03296a4c518a780a50093826d7', '1076', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('eed6ce1fcdc845cd90889861099c91bf', '2', '1');

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `service_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `strip_prefix` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `retryable` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `enabled` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sensitive_headers_list` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES ('1', '/auth/**', 'online-exam-auth', null, null, '1', '1', null, 'admin', '2018年9月1日15:50:52', 'admin', '2018年9月1日15:50:58', '0', null);
INSERT INTO `sys_zuul_route` VALUES ('2', '/admin/**', 'online-exam-user', null, null, '1', '1', null, 'admin', '2018年9月1日15:51:56', 'admin', '2018年9月1日15:52:02', '0', null);
INSERT INTO `sys_zuul_route` VALUES ('3', '/exam/**', 'online-exam-exam', null, null, '1', '1', null, 'admin', '2018年11月10日21:52:33', 'admin', '2018年11月10日21:52:33', '0', null);
SET FOREIGN_KEY_CHECKS=1;

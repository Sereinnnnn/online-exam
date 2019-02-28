/*
Navicat MySQL Data Transfer

Source Server         : mysql_144
Source Server Version : 50710
Source Host           : 192.168.0.144:3306
Source Database       : platform_test001

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-02-28 22:00:42
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
INSERT INTO `sys_dept` VALUES ('83f8d25ddc93445fa91e8c9d3db750a0', '测试部门', '-1', '30', 'admin', '2019-02-25 13:40:40', 'admin', '2019-02-25 13:40:40', '0', 'EXAM', '0', '测试部门', '管理员');

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
INSERT INTO `sys_menu` VALUES ('1717eabc03174c2e9bdaf27c5a5697dd', '题库管理', 'exam:subject', '/exam/subject/**', 'b93eba1199b6420a82d285a8919bcd23', '', '3', '0', 'admin', '2018-12-04 21:33:40', 'admin', '2019-02-28 15:30:09', '0', 'EXAM', 'views/exam/subject', 'subject', null, '题库管理');
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
INSERT INTO `sys_role` VALUES ('23ab268d7e0247868dcf484ab63ff595', '学生', 'student', '学生', '1', 'admin', '2019-02-25 13:43:15', 'admin', '2019-02-25 13:43:15', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('59fcb8500eb24f20bf7263467d757212', '管理员', 'admin', '管理员', '0', 'admin', '2019-02-25 13:41:27', 'admin', '2019-02-25 13:41:27', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('fce0ad963d1f42be9178c4c5c493f55e', '教师', 'teacher', '教师', '0', 'admin', '2019-02-25 13:42:29', 'admin', '2019-02-25 13:42:29', '0', 'EXAM', '0');

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
INSERT INTO `sys_role_dept` VALUES ('73682d4e4d8c4f6ba6d286c53081666e', '59fcb8500eb24f20bf7263467d757212', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_role_dept` VALUES ('b9d76015d54e411393465395b8254c6b', 'fce0ad963d1f42be9178c4c5c493f55e', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_role_dept` VALUES ('bd6f5a3aaecd4f1b8430c3f11f3e3ee6', '23ab268d7e0247868dcf484ab63ff595', '83f8d25ddc93445fa91e8c9d3db750a0');

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
INSERT INTO `sys_role_menu` VALUES ('037ea7d36a294986a5896e1f9d8a83fb', '23ab268d7e0247868dcf484ab63ff595', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('050ecff08d3648e5870a6b871e8c647b', '59fcb8500eb24f20bf7263467d757212', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('05728b600e54432ca686826f703eec7e', '59fcb8500eb24f20bf7263467d757212', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('0871eba19ca84ec38e1067370860c8a5', '59fcb8500eb24f20bf7263467d757212', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('10ece053b90c4c51a6b6caa523329192', '59fcb8500eb24f20bf7263467d757212', '594e7afda95c42e6af2046f1bfe81c53');
INSERT INTO `sys_role_menu` VALUES ('12f1b54b5b0f41cf839e56db6f491ab9', '23ab268d7e0247868dcf484ab63ff595', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('13965898bd37405aa4e6455bb1618dac', '59fcb8500eb24f20bf7263467d757212', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('14416b210115428b844746c3464ed5fa', '59fcb8500eb24f20bf7263467d757212', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('1e9e89f1866c4316bafbf29ad9b81e8c', '59fcb8500eb24f20bf7263467d757212', '15');
INSERT INTO `sys_role_menu` VALUES ('1f4076820e9843a8a814b0d3cb7c6fc1', 'fce0ad963d1f42be9178c4c5c493f55e', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('20a133d40a3d4d62bb474721d5e95bc8', '59fcb8500eb24f20bf7263467d757212', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('22e53b92cc354025953041ee0d5fc2c7', '59fcb8500eb24f20bf7263467d757212', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('281d59486c284c359148f3c63af5fd92', '23ab268d7e0247868dcf484ab63ff595', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('2f22a01c32ca4b89a56a0dac6b4be115', '59fcb8500eb24f20bf7263467d757212', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('3008d949da1b4caeb277ee615c3a3ec9', '59fcb8500eb24f20bf7263467d757212', '8b67ccbe89f74b728e58c2e4a4795027');
INSERT INTO `sys_role_menu` VALUES ('316f2d39c5ef4c1587c8e7f02180539a', '59fcb8500eb24f20bf7263467d757212', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('33037b8b087846f9ae8b053b54738f1e', '59fcb8500eb24f20bf7263467d757212', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('3484855f344c4865843b38cb386ed96b', '59fcb8500eb24f20bf7263467d757212', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('35e38527b4934ddaa80b4c87649d8914', '23ab268d7e0247868dcf484ab63ff595', '14');
INSERT INTO `sys_role_menu` VALUES ('363605b8cb0e44e58e4a5f04db8e6ab1', 'fce0ad963d1f42be9178c4c5c493f55e', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('39a9488b90e5403fb7d31162e67299d9', '23ab268d7e0247868dcf484ab63ff595', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('3e5aea8a6dcb456bbf964826e0733886', '59fcb8500eb24f20bf7263467d757212', '901959fd37df4f7d90adaa4ab6c4b331');
INSERT INTO `sys_role_menu` VALUES ('460e24777cbe4731a2a840099d2b450c', '59fcb8500eb24f20bf7263467d757212', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('4e11d152978143d6a0aee6d0e2dff83c', 'fce0ad963d1f42be9178c4c5c493f55e', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('4f4eb31a74e046d7bad9c6b705350abc', '23ab268d7e0247868dcf484ab63ff595', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('4f6a7ea1643a4843a618a0e7576e878a', '59fcb8500eb24f20bf7263467d757212', '5');
INSERT INTO `sys_role_menu` VALUES ('522a30c1da7f458496347e8de15d3df2', 'fce0ad963d1f42be9178c4c5c493f55e', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('523d872a677f405eb0127183b85c030f', 'fce0ad963d1f42be9178c4c5c493f55e', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('551329d42fd04ea4ace749e488e3103b', '59fcb8500eb24f20bf7263467d757212', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('58800c5d393e4bd481f83b049b691e4e', '59fcb8500eb24f20bf7263467d757212', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('5d4dc769b1f44c3a812a57a0d4daf8ff', 'fce0ad963d1f42be9178c4c5c493f55e', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('5dc10a84ad7842f1bc9f9c931c50b13f', '59fcb8500eb24f20bf7263467d757212', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('5e254b4dd683430eb1b07443d3633c09', '23ab268d7e0247868dcf484ab63ff595', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('5ec7f25bb26548ffb169b847cdde778f', '59fcb8500eb24f20bf7263467d757212', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('5fef347ac75b4307bf6ca39715b6ef4f', 'fce0ad963d1f42be9178c4c5c493f55e', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('60b7df193a194c38a113b994f01c786d', '59fcb8500eb24f20bf7263467d757212', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('628f083dd3f3426d94f9cecf6a147145', 'fce0ad963d1f42be9178c4c5c493f55e', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('666f7f4a3c6e4beeb75484a4553f83a1', '59fcb8500eb24f20bf7263467d757212', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('66c95f9bdbff44c9bed689d617c06e9e', '23ab268d7e0247868dcf484ab63ff595', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('6c8852e0b966403783f3f9f71910eb89', '59fcb8500eb24f20bf7263467d757212', '3');
INSERT INTO `sys_role_menu` VALUES ('6d110de3d29240138f595e90ac8bffe6', '59fcb8500eb24f20bf7263467d757212', '4');
INSERT INTO `sys_role_menu` VALUES ('6e875b285df84ebbb343a70f8d509f0c', '59fcb8500eb24f20bf7263467d757212', '7');
INSERT INTO `sys_role_menu` VALUES ('6fb91a2223544857a315aa1a024d984e', 'fce0ad963d1f42be9178c4c5c493f55e', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('750dad7ab19c4b6493feac325798c64b', 'fce0ad963d1f42be9178c4c5c493f55e', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('790f7abe42c340cc8e4820f4fa14edba', 'fce0ad963d1f42be9178c4c5c493f55e', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('7c893f2b0b054f5aac267061563fdc22', 'fce0ad963d1f42be9178c4c5c493f55e', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('85b9f1c5d6b640ec8288dfc5b9cdff4c', 'fce0ad963d1f42be9178c4c5c493f55e', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('87a9854a963549a9a26fbc22377b20f7', '59fcb8500eb24f20bf7263467d757212', 'c2bc24819bcc4e8790f0dba586914efe');
INSERT INTO `sys_role_menu` VALUES ('8ad56f8ee366438582d70e5a6fffbdc1', '59fcb8500eb24f20bf7263467d757212', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('8ea77381521a48b7a28decd015c257bf', '59fcb8500eb24f20bf7263467d757212', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('94e142fab38547f6aff645514b17eba0', '59fcb8500eb24f20bf7263467d757212', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('98280f94cec54716852690b64126f661', '59fcb8500eb24f20bf7263467d757212', '14');
INSERT INTO `sys_role_menu` VALUES ('99aff3bf35fc47e0b8bdc72578990ea4', 'fce0ad963d1f42be9178c4c5c493f55e', '14');
INSERT INTO `sys_role_menu` VALUES ('9cbc85e61a5f474e8ef28fc3847b0e42', 'fce0ad963d1f42be9178c4c5c493f55e', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('9e738a069e854ec18e4e906b32ca3da7', 'fce0ad963d1f42be9178c4c5c493f55e', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('9e9b2a8714f44760a6f40c817a3a2bfe', 'fce0ad963d1f42be9178c4c5c493f55e', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('9ed3b462d70644b9a9fd216bec0cf8ca', 'fce0ad963d1f42be9178c4c5c493f55e', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('a07e8b26c1954a52bc67c88be44050b6', '59fcb8500eb24f20bf7263467d757212', 'ee35a2abc0b04f3bb70527a7f79806e8');
INSERT INTO `sys_role_menu` VALUES ('a1268875306c47d79f999add17331f61', '59fcb8500eb24f20bf7263467d757212', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('a1f96636ff854026a41f77ef879ee80a', '59fcb8500eb24f20bf7263467d757212', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('a2f8ef7c37b34f238d5d7780f9b114b1', '59fcb8500eb24f20bf7263467d757212', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('a4cc2de912174ede95b293055e51e633', 'fce0ad963d1f42be9178c4c5c493f55e', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('a596b804f67943c4b2075ede36d207df', '59fcb8500eb24f20bf7263467d757212', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('a94ed44b15a94992b9cc1327eef19633', '59fcb8500eb24f20bf7263467d757212', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('a98aae8e4f6546af8124bd32f6745aee', '59fcb8500eb24f20bf7263467d757212', '1');
INSERT INTO `sys_role_menu` VALUES ('adcf332383d046b3831f81a443999589', '59fcb8500eb24f20bf7263467d757212', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('afac2956ef0c40ccb833f36c79c7e652', '59fcb8500eb24f20bf7263467d757212', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('afc9b72851574607abb69686a8cafa34', '59fcb8500eb24f20bf7263467d757212', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('b0f268f040634066a9f0f702bef30a0a', 'fce0ad963d1f42be9178c4c5c493f55e', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('b5c89c4bb84b4ac593d410c0d993195f', '23ab268d7e0247868dcf484ab63ff595', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('b6703451150e421ab9f08b49390559ba', 'fce0ad963d1f42be9178c4c5c493f55e', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('bd6be24c803b47659d8a4122964c51a6', '59fcb8500eb24f20bf7263467d757212', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('c07639925a534d4da86813df7042d020', '59fcb8500eb24f20bf7263467d757212', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('c588216a251f4b07ace8490c29896055', '59fcb8500eb24f20bf7263467d757212', '095bb0644ab14d97b31418f87e1cf823');
INSERT INTO `sys_role_menu` VALUES ('c7817314fe484d91881ab230fb8aa461', '59fcb8500eb24f20bf7263467d757212', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('c9b7430447a94049b7429605a41297f5', 'fce0ad963d1f42be9178c4c5c493f55e', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('cabcefbd441648b1b6ee43cabef9508b', '23ab268d7e0247868dcf484ab63ff595', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('cb1006e426524723aa87971b22bdecb4', '59fcb8500eb24f20bf7263467d757212', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('cba2d41dceb84ec3beb8e6e5f84e67bd', '59fcb8500eb24f20bf7263467d757212', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('cd3a73c8c3e54e14b8f453f060846d2a', 'fce0ad963d1f42be9178c4c5c493f55e', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('cdcd23953064448dbcfe64594d7209b3', '59fcb8500eb24f20bf7263467d757212', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('d3884043c0584152bcaa670f1387238b', 'fce0ad963d1f42be9178c4c5c493f55e', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('d56ee9d33d4d4a0cb61916f5d7541fe8', 'fce0ad963d1f42be9178c4c5c493f55e', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('d667b23a28ec4e2b992f4d3aacd70c67', 'fce0ad963d1f42be9178c4c5c493f55e', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('d69967eb082f48f2a065f583a8e43ade', '59fcb8500eb24f20bf7263467d757212', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('d9bfc47169e84bd0a2820e2752520558', '59fcb8500eb24f20bf7263467d757212', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('dadd2e4ec717410190711074843ed65d', '59fcb8500eb24f20bf7263467d757212', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('dafae96f911746d88f84ddaa95d22262', 'fce0ad963d1f42be9178c4c5c493f55e', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('db569ac81ecc468a94c156bf286060c0', 'fce0ad963d1f42be9178c4c5c493f55e', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('e15d4a6caa264245b5c7c29c8a877609', '59fcb8500eb24f20bf7263467d757212', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('e8a58376bf714b9581e9edd2f71c7f90', '59fcb8500eb24f20bf7263467d757212', '7780e3fd6cea4ba78d780f33c111d95a');
INSERT INTO `sys_role_menu` VALUES ('e9474e56ca5a40dd9ae00ffc56b922ff', '59fcb8500eb24f20bf7263467d757212', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('ea811771eacd4cd482b80c35eddffe58', '59fcb8500eb24f20bf7263467d757212', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('eee639074ad143398c8918ec5a8a09aa', 'fce0ad963d1f42be9178c4c5c493f55e', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('f2230607ee0a449f907374547519f56e', '59fcb8500eb24f20bf7263467d757212', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('f324f85f60274495ae4fbfca452b1894', '59fcb8500eb24f20bf7263467d757212', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('f4a1f0582bc1480eb882bfa57bd58ffa', 'fce0ad963d1f42be9178c4c5c493f55e', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('f8063f63c1524ca2824620d72e493a56', '59fcb8500eb24f20bf7263467d757212', '6');
INSERT INTO `sys_role_menu` VALUES ('f9c56632c56340a1a768f6401c935370', '59fcb8500eb24f20bf7263467d757212', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('fd206344ce724298900d9e040896d9ca', '59fcb8500eb24f20bf7263467d757212', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('fed23fc003e741d5b63dfef3a095b7cb', '59fcb8500eb24f20bf7263467d757212', '2a232ac9f43146a49ab5a19226e76742');

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
  `avatar_id` varchar(255) DEFAULT NULL COMMENT '头像对应的附件id',
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
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$BG7MG617cSzbIC0dNbKRnuCEz78k1SlA.SiG01yqhagqYiW./JAO.', null, '15521089144', '', '', '1633736729@qq.com', '0', '2018-10-02', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2019-02-25 13:44:20', '0', 'EXAM', '管理员', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_user` VALUES ('3078afafab8346348cef667b3d56f813', '林老师', 'teacher', '$2a$10$53KTjxEBtn.RIJOMZ/tAcOpIRzwXaHWPeTZFqAYXXBLPMbDBBqbE6', null, '12345678901', '', null, null, '0', '2019-02-18', '0', 'admin', '2019-02-25 13:52:50', 'admin', '2019-02-27 16:21:39', '0', 'EXAM', '张老师', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_user` VALUES ('abd4dbe19faf4f7f8ff239b63acc5d34', '梁同学', 'student', '$2a$10$WKc4EjebJbLHLnCgc1Jn/OgeiCVOXSuxw/Flb45Ay9pcogLepr1p6', null, '32323232323', '', '', null, '0', '2019-02-04', '0', 'admin', '2019-02-25 13:53:47', 'admin', '2019-02-25 13:53:47', '0', 'EXAM', '梁同学', '83f8d25ddc93445fa91e8c9d3db750a0');

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
INSERT INTO `sys_user_role` VALUES ('61e55f7b8f3d4fc28387e6a7da199524', 'abd4dbe19faf4f7f8ff239b63acc5d34', '23ab268d7e0247868dcf484ab63ff595');
INSERT INTO `sys_user_role` VALUES ('a4e61bad7c45420782c20462f186cc03', '3078afafab8346348cef667b3d56f813', 'fce0ad963d1f42be9178c4c5c493f55e');
INSERT INTO `sys_user_role` VALUES ('c455ad90e38246c4a1471615b5b20790', '2', '59fcb8500eb24f20bf7263467d757212');

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

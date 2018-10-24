/*
Navicat MySQL Data Transfer

Source Server         : 182.254.233.125
Source Server Version : 50639
Source Host           : 182.254.233.125:3306
Source Database       : online_exam

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-10-24 14:51:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '重定向url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', 'system_management', 'system_management', 'sys', '/admin/sys/**', '-1', 'component', '1', '0', '1', '1', '1', '1', '0', '1', 'Layout', '/system_management', null);
INSERT INTO `sys_menu` VALUES ('2', 'permission_management', 'permission_management', 'sys', '/admin/permission/**', '1', '', '2', '0', '1', '1', '1', '1', '0', '1', 'views/sys/permission/permissionManagement', 'permisssion_management', null);
INSERT INTO `sys_menu` VALUES ('3', 'menu_management', 'menu_management', 'sys', '/admin/menu/**', '1', '', '3', '0', '1', '1', '1', '1', '0', '1', 'views/sys/menu/menuManagement', 'menu_management', null);
INSERT INTO `sys_menu` VALUES ('4', 'user_management', 'user_management', 'sys', '/admin/user/**', '1', '', '4', '0', '1', '1', '1', '1', '0', '1', 'views/sys/user/userManagement', 'user_management', '');
INSERT INTO `sys_menu` VALUES ('5', 'role_management', 'role_management', 'sys', '/admin/role/**', '1', '', '7', '0', '1', '1', '1', '1', '0', '1', 'views/sys/role/roleManagement', 'role_management', '');
INSERT INTO `sys_menu` VALUES ('6', 'dept_management', 'dept_management', 'sys', '/admin/dept/**', '1', '', '5', '0', '1', '1', '1', '1', '0', '1', 'views/sys/dept/deptManagement', 'dept_management', '');
INSERT INTO `sys_menu` VALUES ('7', 'system_monitor', 'system_monitor', 'sys', '/admin/sys/**', '-1', 'nested', '7', '0', '1', '1', '1', '1', '0', '1', 'views/permission/page', '/documentation', 'dashboard');
INSERT INTO `sys_menu` VALUES ('8', 'user_management', 'user_management', 'sys', '/admin/user/userList', '-1', null, '8', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(40) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
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
  `id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '角色描述',
  `creator` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '系统编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '0', 'admin');
INSERT INTO `sys_role` VALUES ('1', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '0', 'admin');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '头像',
  `email` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '性别',
  `born` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '生日',
  `dept_id` varchar(32) CHARACTER SET latin1 DEFAULT NULL COMMENT '部门id',
  `status` varchar(2) DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(11) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '测试', 'test9', '$2a$10$QOlLl5kLqUeKy9YXeKtcE.t3JFHpWUl2XctPzswE/qIE9.HX7J6Vu', null, '23323', null, '3233', '0', '2018-10-24T02:44:27.481Z', null, '0', 'test9', '2018-10-24 10:44:42', 'test9', '2018-10-24 10:44:42', '0', '', '3232323');
INSERT INTO `sys_user` VALUES ('1025', '测试账号', 'test2', '$2a$10$6SognCpa4n3XeopCSJfq..NmCPFla.Teem7Zu5gFAu8nUi/vCx0ly', null, '3232', null, '3232', '0', '1540601127000', null, '1', null, null, 'test2', '2018-10-24 14:10:36', '0', '', 'dddd');
INSERT INTO `sys_user` VALUES ('1041', '测试', 'test4', '$2a$10$SiiAXC5zlYzMlUMzYmzCf.JCQcrvRY87RCmaJJD2Ow2/.2HRzIgu2', null, '15521089185', null, '1633736729@qq.com', '1', '1540361517000', null, '0', null, null, 'test4', '2018-10-24 14:11:59', '0', '', '测试账号4');
INSERT INTO `sys_user` VALUES ('1042', '测试账号', 'test', '$2a$10$rAedN0Jn6aAOwlI2XaWEEOszgi5t.xrF..7Sl/At6zK8VN9CM38TO', null, '15521089185333', null, '1633736729@qq.com', '0', '1540341917000', null, '0', null, null, 'test', '2018-10-24 10:43:39', '0', '', 'test');
INSERT INTO `sys_user` VALUES ('1043', '测试', 'test6', '$2a$10$NKrQDcg.rd4YaJrg9MPuzemhSkqorQdsIMjGa8ytWmYAj8qtioar2', null, 'test6', null, '23', '0', '2018', null, '0', null, null, 'test6', '2018-10-24 10:43:34', '0', '', '323');
INSERT INTO `sys_user` VALUES ('1071', '测试账号', 'test3', '$2a$10$liY3vs6l4aOMDwvQaQ0r7eVC8KmwkfMoBIjYxpamoT/4hieIVsWmO', null, 'test3', null, '3eeeee', '0', '1540341833000', null, '0', null, null, 'test3', '2018-10-24 14:11:15', '0', '', '测试备注');
INSERT INTO `sys_user` VALUES ('1076', '测试账号', 'test5', '$2a$10$g8/Yx8Iy8.Py4X4BeTuO6.czmC32rDkRChxueSFk37yO8x7laQ/3q', null, '333', null, '333', '1', '1540344675000', null, '1', null, null, 'test5', '2018-10-24 10:43:15', '0', '', '333');
INSERT INTO `sys_user` VALUES ('1099', '测试账号', 'test7', '$2a$10$6t6cVnBMJzcRqCkuRDimau1DvawpZPhMrukaLUGpElSCH5eGbovNq', null, '232323', null, '32323', '1', '2018', null, '0', null, null, 'test7', '2018-10-24 10:27:42', '0', '', '3232332');
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$/sVy90N0MJ1pYAQe6DkUQOfBUQjjMEhX54kP/dgRKDAyNoxzPDJ.u', null, '12345678901', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '1633736729@qq.com', '0', '1540298708000', null, '0', 'admin', '2018-09-01 14:37:09', 'admin', '2018-10-24 10:39:46', '0', '', 'ccccc');
INSERT INTO `sys_user` VALUES ('3', '测试账号', 'test8', '$2a$10$f0Jgc.83m6L/yWYtDDFYAuAN1ZP1GIrZOiCmwWnCvWkbXVGmXI4lO', null, '323', null, '323', '0', '86402000', null, '0', 'test8', '2018-10-24 09:48:54', 'test8', '2018-10-24 09:50:04', '0', '', '323');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '9694a152562945b0af0e78440b8418fb', '1');
INSERT INTO `sys_user_role` VALUES ('1', '9694a152562945b0af0e78440b8418fb', '1');

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `service_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `strip_prefix` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `retryable` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `enabled` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sensitive_headers_list` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES ('1', '/auth/**', 'online-exam-auth', null, null, '1', '1', null, 'admin', '2018年9月1日15:50:52', 'admin', '2018年9月1日15:50:58', '0', null);
INSERT INTO `sys_zuul_route` VALUES ('2', '/admin/**', 'online-exam-user', null, null, '1', '1', null, 'admin', '2018年9月1日15:51:56', 'admin', '2018年9月1日15:52:02', '0', null);
SET FOREIGN_KEY_CHECKS=1;

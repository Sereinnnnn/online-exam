/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : online_exam

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-08-25 18:28:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `born` varchar(255) DEFAULT NULL COMMENT '生日',
  `dept_id` varchar(255) DEFAULT NULL COMMENT '部门id',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(11) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS=1;

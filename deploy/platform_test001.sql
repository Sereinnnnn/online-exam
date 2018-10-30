/*
 Navicat Premium Data Transfer

 Source Server         : 144
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : 192.168.0.144:3306
 Source Schema         : platform_test001

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 30/10/2018 22:48:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES ('19f4a0468515492eb1929a596b212fcf', 'dashboard.png', '65177', 'group1', 'group1/M00/07/AB/wKgA1VvYaTeAANM5AAD-mb4N5hg427.png', NULL, NULL, NULL, 'anonymousUser', '2018-10-30 22:20:04', 'anonymousUser', '2018-10-30 22:20:04', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('47a6154a63a24ce3b73a572f361d1776', '附件工具.xlsx', '10144', 'group1', 'group1/M00/07/AB/wKgA1VvYaciAevPfAAAnoGZzE8o12.xlsx', NULL, NULL, NULL, 'anonymousUser', '2018-10-30 22:22:23', 'anonymousUser', '2018-10-30 22:22:23', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4acc9e7f837043d8bf8a84bab7396285', '决赛.png', '34729', 'group1', 'group1/M00/07/AB/wKgA1VvYamWAHXAQAACHqXNbiPA829.png', NULL, NULL, NULL, 'anonymousUser', '2018-10-30 22:25:00', 'anonymousUser', '2018-10-30 22:25:00', '1', 'EXAM');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0-启用，1-禁用',
  `dept_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `dept_leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1e31659224884cbc89022ab4e6ecf70c', '移动研发部', '551aafb3281b44b1bfbd19bac9e54b94', '27', '', '2018-10-26 17:21:47', '', '2018-10-26 17:21:47', '0', '', '0', '移动研发部', '叶瑞龙');
INSERT INTO `sys_dept` VALUES ('2d0b1e08677d45bc8cee3db44774abf6', '测试部门', '-1', '30', '', '2018-10-27 22:22:22', '', '2018-10-27 22:22:22', '0', '', '0', '测试', '测试');
INSERT INTO `sys_dept` VALUES ('34f01bfe915647f2859400fadba431b0', '', '-1', '30', '', '2018-10-29 13:01:46', '', '2018-10-29 13:01:46', '1', '', '0', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('3b40c8dcf95f4fc78b748d550aa9df6a', '研发一部', 'bae0cdcda1ab42559de45bd0420f3c34', '28', '', '2018-10-25 20:57:25', '', '2018-10-25 20:57:25', '0', '', '0', '研发一部', '沉香');
INSERT INTO `sys_dept` VALUES ('4f1ed1353d904ad3837458266de8a080', '平台研发部', '551aafb3281b44b1bfbd19bac9e54b94', '26', '', '2018-10-26 17:22:14', '', '2018-10-26 17:22:14', '0', '', '0', '平台研发部', '马志鹏');
INSERT INTO `sys_dept` VALUES ('551aafb3281b44b1bfbd19bac9e54b94', '行业发展研究中心', '-1', '3', '', '2018-10-26 17:21:11', '', '2018-10-26 17:21:11', '0', '', '0', '行业发展研究中心', '黄华伟');
INSERT INTO `sys_dept` VALUES ('674b823335114dd1b9de642e689a8e19', '政务服务事业部', '-1', '2', '', '2018-10-25 20:58:41', '', '2018-10-25 20:58:41', '0', '', '0', '政务服务事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('839a2524aea445bb83a46a0ea03f87ac', '智慧政务事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:22:43', '', '2018-10-26 17:22:43', '0', '', '0', '智慧政务事业部', '周武杰');
INSERT INTO `sys_dept` VALUES ('bae0cdcda1ab42559de45bd0420f3c34', '研发部', '-1', '1', '', '2018-10-25 20:38:04', '', '2018-10-25 20:42:58', '0', '', '1', '产品研发', '杨锐');
INSERT INTO `sys_dept` VALUES ('cb38942fba4c438995dee5622d3dfdfa', '智慧政府事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:23:05', '', '2018-10-26 17:23:05', '0', '', '0', '智慧政府事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('ef7a812bc75743b3929a8c0dde9d5467', '研发二部', 'bae0cdcda1ab42559de45bd0420f3c34', '29', '', '2018-10-25 20:58:06', 'admin', '2018-10-30 15:40:35', '0', '', '0', '研发二部', '庞锦坤');
INSERT INTO `sys_dept` VALUES ('f4e3ff4b0fea4856ab71f7c9a31449d8', 'iiii', '-1', '30', '', '2018-10-29 13:04:43', '', '2018-10-29 13:04:53', '1', '', '0', 'tt', 'tt');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0390263ef05f45dfb5d7bcf7e2da90b6', '查询', 'sys_role_query', NULL, '5', 'example', '2', '1', '', '2018-10-28 16:44:44', '', '2018-10-28 16:44:44', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0dc80492cf414db984d825fdd842e022', '新增', 'sys_user_add', NULL, '4', 'example', '1', '1', '', '2018-10-28 16:38:57', '', '2018-10-28 16:41:20', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0ee02b8dc3064fcd972f527c31aad5a7', '修改', 'sys_menu_modify', NULL, '3', 'example', '4', '1', '', '2018-10-28 16:46:38', '', '2018-10-28 16:46:38', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'sys', '/admin/sys/**', '-1', 'component', '1', '0', '1', '1', '1', '1', '0', '1', 'Layout', '/sys', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('14', '个人管理', 'personal', '/admin/personal/**', '-1', 'form', '30', '0', '', '2018-10-28 16:12:34', 'admin', '2018-10-30 14:42:17', '0', '', 'Layout', '/personal', NULL, '个人管理');
INSERT INTO `sys_menu` VALUES ('15', '附件管理', 'attachment', '/admin/attachment/**', '-1', 'excel', '10', '0', 'admin', '2018-10-30 19:48:36', 'admin', '2018-10-30 20:31:21', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理');
INSERT INTO `sys_menu` VALUES ('19371307401c436096c040b935aea0fd', '查询', 'null_query', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1b68d41bfcc3441f839188a9d7b6ead0', '接口文档', 'monitor:document', '/monitor/document/**', '7', '', '32', '0', 'admin', '2018-10-30 15:06:08', 'admin', '2018-10-30 15:36:10', '0', 'EXAM', 'monitor/document', '/monitor/document', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1e6a90e57df541e0973691c17d44564c', '日志监控', 'monitor:log', '/admin/monitor/log', '7', '', '30', '0', 'admin', '2018-10-30 15:00:25', 'admin', '2018-10-30 15:02:42', '0', 'EXAM', 'monitor/log', '/monitor/log', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('20bf591156414b3eb39563ef45a6cf48', '百度', 'baidu', '/baidu', '-1', 'example', '30', '0', 'admin', '2018-10-30 17:08:43', 'admin', '2018-10-30 17:29:45', '1', 'EXAM', '', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('26322a60667b45b9a1cce2c70998f75c', '修改', 'null_modify', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('26cd5e31227843219d990ebfbaf35855', '删除', 'null_del', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('26f531763fe94b94bc30208a8bf46427', '测试菜单2', '测试菜单2', 'ddd', '48e4338aef2543e988d4105e153a3c92', 'example', '30', '0', 'admin', '2018-10-29 21:48:28', 'admin', '2018-10-29 21:48:28', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2a232ac9f43146a49ab5a19226e76742', '删除', 'sys_dept:del', NULL, '6', 'example', '3', '1', '', '2018-10-28 16:43:19', '', '2018-10-28 16:43:50', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', 'sys:menu', '/admin/menu/**', '1', '', '10', '0', '1', '1', 'admin', '2018-10-30 14:41:48', '0', '1', 'views/sys/menu', '/sys/menu', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('347d24c6e1cf42eaa976c91f5607007a', '新增', 'sys_dept:add', NULL, '6', 'example', '1', '1', '', '2018-10-28 16:42:40', '', '2018-10-28 16:42:40', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34ffa24d3c124902893e601fe8e22b08', '服务监控', 'monitor:service', '/admin/monitor/service/**', '7', '', '31', '0', 'admin', '2018-10-30 15:01:17', 'admin', '2018-10-30 15:02:58', '0', 'EXAM', 'monitor/service', '/monitor/service', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('36cca77232f3487cbee02bb68ae12652', '新增', 'sys_menu:add', NULL, '3', 'example', '1', '1', '', '2018-10-28 16:45:45', '', '2018-10-28 16:45:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3f4d1adeb76e49239768f362c6c774e0', '接口文档', 'monitor:document', '/monitor/document/**', '7', 'example', '32', '0', 'admin', '2018-10-30 15:05:36', 'admin', '2018-10-30 15:05:36', '1', 'EXAM', 'monitor/document', '/monitor/document', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'sys:user', '/admin/user/**', '1', '', '2', '0', '1', '1', 'admin', '2018-10-30 14:34:05', '0', '1', 'views/sys/user', '/sys/user', '', '用户管理');
INSERT INTO `sys_menu` VALUES ('42ac13ba9dd343eeb2343f2a3b7a549c', '服务监控', 'monitor:service', '/admin/monitor/service/**', '7', 'example', '30', '0', 'admin', '2018-10-30 15:01:12', 'admin', '2018-10-30 15:01:12', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('42c69128d30a4242b08ef0003da68528', '修改', 'sys_role_modify', NULL, '5', 'example', '4', '1', '', '2018-10-28 16:45:11', '', '2018-10-28 16:45:11', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('43d457935f3f47b7ae9cfbd385923257', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:42:50', 'admin', '2018-10-29 21:42:50', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4f3e874dc310463a82e3b650fd851fdb', '密码修改', 'personal:password', '/admin/user/updateInfo', '14', '', '30', '0', 'admin', '2018-10-29 21:59:03', 'admin', '2018-10-30 14:45:16', '0', 'EXAM', 'views/personal/password', '/personal/password', NULL, '密码修改');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', 'sys:role', '/admin/role/**', '1', '', '9', '0', '1', '1', 'admin', '2018-10-30 14:41:40', '0', '1', 'views/sys/role', '/sys/role', '', NULL);
INSERT INTO `sys_menu` VALUES ('5f809b08920e46cb9b4eb9c87199e6b3', '新增', 'null:add', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6', '部门管理', 'sys:dept', '/admin/dept/**', '1', '', '8', '0', '1', '1', 'admin', '2018-10-30 14:41:30', '0', '1', 'views/sys/dept', '/sys/dept', '', NULL);
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'sys', '/admin/sys/**', '-1', 'chart', '7', '0', '1', '1', 'admin', '2018-10-30 14:58:21', '0', '1', 'views/permission/page', '/documentation', '', NULL);
INSERT INTO `sys_menu` VALUES ('70aeccce43b34c7eaa648d52da578bc0', '查询', 'sys_dept:query', NULL, '6', 'example', '2', '1', '', '2018-10-28 16:43:09', '', '2018-10-28 16:43:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('780f1f5e4db54c7db0700119969382e3', '测试', '测试', '测试', '-1', 'example', '30', '0', 'admin', '2018-10-30 16:23:06', 'admin', '2018-10-30 16:23:06', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8aefee22294d47d7a3e4a29ae5ced4b4', '个人资料', 'personal:message', '/admin/user/updateInfo', '14', '', '29', '0', 'admin', '2018-10-29 21:58:32', 'admin', '2018-10-30 15:36:47', '0', 'EXAM', 'views/personal/message', '/personal/message', NULL, '个人资料');
INSERT INTO `sys_menu` VALUES ('8b67ccbe89f74b728e58c2e4a4795027', '删除', 'sys_menu:del', NULL, '3', 'example', '3', '1', '', '2018-10-28 16:46:23', '', '2018-10-28 16:46:23', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8dc7bb81a52f4196af3ba3f2704391c0', '测试2', '测试2', '测色2', '780f1f5e4db54c7db0700119969382e3', 'example', '30', '0', 'admin', '2018-10-30 16:23:22', 'admin', '2018-10-30 16:23:22', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9', '文档', 'sys', '/admin/sys/**', '7', NULL, '11', '0', '1', '1', '1', '1', '1', '1', 'views/documentation/index', '/documentation', '/documentation/index', NULL);
INSERT INTO `sys_menu` VALUES ('91861ef795ab4fc4a207567606fa62cc', '修改', 'sys_user:modify', NULL, '4', 'example', '4', '1', '', '2018-10-28 16:40:19', '', '2018-10-28 16:41:17', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9aeba7d6166941639876bf40673d59cb', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c0846685bb24aafae731bdacf879ba2', '删除', 'sys_role:del', NULL, '5', 'example', '3', '1', '', '2018-10-28 16:44:56', '', '2018-10-28 16:44:56', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a382803a28c341519c59342022cda737', '测试菜单2', 'dddddd', '测试菜单2', '-1', 'example', '30', '0', 'admin', '2018-10-29 21:48:57', 'admin', '2018-10-29 21:48:57', '1', 'EXAM', NULL, NULL, NULL, '测试菜单2');
INSERT INTO `sys_menu` VALUES ('a663e71f7b8441b0b8363ae5eb20bbb3', '修改', 'sys_dept:modify', NULL, '6', 'example', '4', '1', '', '2018-10-28 16:43:38', '', '2018-10-28 16:43:38', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b0c97ca36f0d4f24ae0ca5edc6055aa4', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:43:48', 'admin', '2018-10-29 21:43:48', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b624dbf393b24cf68b733fb652a38077', '查询', 'sys_menu:query', NULL, '3', 'example', '2', '1', '', '2018-10-28 16:46:02', '', '2018-10-28 16:46:02', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c3aa1b7231f44883b052cae7ad0bf0d4', '查询', 'sys_user:query', NULL, '4', 'example', '2', '1', '', '2018-10-28 16:40:37', '', '2018-10-28 16:41:10', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c435ac944cd6430ba9a1039d8adb80a7', '新增', 'sys_role:add', NULL, '5', 'example', '1', '1', '', '2018-10-28 16:44:29', '', '2018-10-28 16:44:29', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ca7e69aae4994099a6424aa9727b6a28', '删除', 'sys_user:del', NULL, '4', 'example', '3', '1', '', '2018-10-28 16:40:01', '', '2018-10-28 16:41:14', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fe73699236be4b148cd35628929cc876', '附件列表', 'attachment:list', '/admin/attachment/list', '15', '', '30', '0', 'admin', '2018-10-30 19:49:50', 'admin', '2018-10-30 20:27:18', '0', 'EXAM', 'views/attachment/list', '/attachment/list', NULL, '附件列表');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('online-exam', NULL, 'online-exam', 'server', 'password,refresh_token,authorization_code', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 0-启用，1-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '管理员', 'admin', 'admin', 'test9', '2018-10-30 12:00:03', '0', 'admin', '0');
INSERT INTO `sys_role` VALUES ('2', '测试角色', 'test', '测试角色', NULL, NULL, NULL, '2018-10-27 23:03:41', '1', NULL, '1');
INSERT INTO `sys_role` VALUES ('33589c91a8f64c5aa53b94add015e8aa', '测试', 'test1', '测试', NULL, '2018-10-27 22:22:44', NULL, '2018-10-27 22:22:44', '1', '', '0');
INSERT INTO `sys_role` VALUES ('88cdd68a79634437a606a5a3fd12127a', 'java开发', 'java', 'java开发', 'test9', '2018-10-30 12:01:33', 'test9', '2018-10-30 12:01:33', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('8ff8a3d10f2a4735bc76fc4485732b05', '测试角色', 'test1', '测试角色', NULL, '2018-10-28 10:31:43', 'admin', '2018-10-29 21:10:44', '0', '', '1');
INSERT INTO `sys_role` VALUES ('e5ab0d61763e4eb7bf1c4122223e1872', '测试角色2', 'test2', '测试角色2', NULL, '2018-10-26 17:17:35', NULL, '2018-10-26 17:18:01', '1', '', '0');
INSERT INTO `sys_role` VALUES ('f623fcad11474a54bc1dcf0947bef487', '测试角色2', 'test2', '测试角色2', NULL, '2018-10-28 11:51:49', NULL, '2018-10-28 13:22:50', '0', '', '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('4fe632d6b36b439d8c198dbccc5caf3f', '1', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('701ed6dacffd4e8ea4bae43f28fbceea', '88cdd68a79634437a606a5a3fd12127a', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('b238950dac6148b4aa5fe18da9d2b4a5', 'f623fcad11474a54bc1dcf0947bef487', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_role_dept` VALUES ('c77a1fe104924ed382da20bacdfc24d7', '8ff8a3d10f2a4735bc76fc4485732b05', '2d0b1e08677d45bc8cee3db44774abf6');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('013c36a3e79648528a22db7ee91016fd', '1', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('11cd9c9bc1264b47b7c2f537f78ee054', '1', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('11ecfaf5f08e417ebfb7530c9ac3206d', '88cdd68a79634437a606a5a3fd12127a', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('13dcc14c6a9b48f3ad3e8ab79994b092', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('1f0e0f06618c47e2bbaee489a3c817bc', '88cdd68a79634437a606a5a3fd12127a', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('2a5b44602f3f46a1a78889faef49fc92', '1', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('2b8777896d1d471e91dc6a082314201c', '1', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('2f855153b90e4c15b84a8e88bd8c3116', '1', '0390263ef05f45dfb5d7bcf7e2da90b6');
INSERT INTO `sys_role_menu` VALUES ('3291968b22b8425c857fbc24e2279340', '1', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('3761d629b1d244dfa726126d7eda7686', '1', '2a232ac9f43146a49ab5a19226e76742');
INSERT INTO `sys_role_menu` VALUES ('3a77cc308ac249c4b0218e5ddc49b4ea', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('3e2ecb5b77a9482d8145c15ad0fbb7f0', '8ff8a3d10f2a4735bc76fc4485732b05', '14');
INSERT INTO `sys_role_menu` VALUES ('3ff1f62309954c04b57dac37799fad14', '1', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('42cf5821e2714dddaf9a3dce9131d28b', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('4560fe6dc63a48dea8b94e20f376b526', '1', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('5cc9f69a1a4c4e89b97add7dd34a2cca', '1', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('6400a4348f6d42ea94699852337f4d65', '88cdd68a79634437a606a5a3fd12127a', '7');
INSERT INTO `sys_role_menu` VALUES ('6d7b64b1402c4b4ca0cb6a0729496aed', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('6f6caba7f0764b1cb8873974fd0d0859', '1', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('7ba051cf703849d39aae5b8f340ae5c0', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('7fdcb73025fb42079999cbea5cbe1244', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('804e1b7f8c1041c181ea8d4acefbe13f', '1', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('8133d713bf2a4187a6bcd2d364f3b767', '1', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('8afd7dfc40364254aff59493cccccd8d', '1', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('8c7fbde7077249b280b18cc948d74fa2', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('9d265095a8f64f8bb91651fe1943d5f8', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('a35f12b05b9944178b4ca40582bd8656', '88cdd68a79634437a606a5a3fd12127a', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('ad3b6dcc5f324392bcea26f3d6569862', '1', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('b7ffff57658b484082a397c00580d473', '1', '70aeccce43b34c7eaa648d52da578bc0');
INSERT INTO `sys_role_menu` VALUES ('b9c36f3f763d4b5dbe2287357d0cf751', '88cdd68a79634437a606a5a3fd12127a', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('bed445dd92f84724aef35ae084317756', '1', 'c3aa1b7231f44883b052cae7ad0bf0d4');
INSERT INTO `sys_role_menu` VALUES ('d9428123dfac4f688a5f576fe760c3f2', '1', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('da65ee9ba8de40eb9bf7c8e4101f30ca', '1', 'b624dbf393b24cf68b733fb652a38077');
INSERT INTO `sys_role_menu` VALUES ('e0bd4f4adb2d4a399f390acf439a8324', '1', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('e183d9100b21439caa79aed18fdecae4', '1', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('e76e45a5bd45414ebefeba0239910b5d', '88cdd68a79634437a606a5a3fd12127a', '14');
INSERT INTO `sys_role_menu` VALUES ('ec1dc4c735f44b5382a8ea028466e23d', '88cdd68a79634437a606a5a3fd12127a', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('f629500024de40368ac0347c4c7ab932', '1', '8b67ccbe89f74b728e58c2e4a4795027');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '性别',
  `born` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '生日',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(20) NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '测试', 'test9', '$2a$10$7inIxLXYX9I39wu9COLJj.KuJQKsOk5r89O8VRuTdeGN3hHer4Caq', NULL, '23323', NULL, '3233', '0', '2018-10-05', '0', 'test9', '2018-10-24 10:44:42', 'admin', '2018-10-30 15:56:54', 0, 'EXAM', '3232323');
INSERT INTO `sys_user` VALUES ('1025', '测试账号', 'test2', '$2a$10$6SognCpa4n3XeopCSJfq..NmCPFla.Teem7Zu5gFAu8nUi/vCx0ly', NULL, '3232', NULL, '3232', '0', '2018-10-30', '0', NULL, NULL, 'admin', '2018-10-29 20:17:13', 0, 'EXAM', 'dddd');
INSERT INTO `sys_user` VALUES ('1041', '测试', 'test4', '$2a$10$SiiAXC5zlYzMlUMzYmzCf.JCQcrvRY87RCmaJJD2Ow2/.2HRzIgu2', NULL, '15521089185', NULL, '1633736729@qq.com', '1', '2018-10-31', '0', NULL, NULL, 'admin', '2018-10-29 21:50:18', 0, 'EXAM', '测试账号4');
INSERT INTO `sys_user` VALUES ('1042', '测试账号', 'test', '$2a$10$rAedN0Jn6aAOwlI2XaWEEOszgi5t.xrF..7Sl/At6zK8VN9CM38TO', NULL, '15521089185333', NULL, '1633736729@qq.com', '0', '', '1', NULL, NULL, 'test', '2018-10-27 16:48:50', 0, '', 'test');
INSERT INTO `sys_user` VALUES ('1043', '测试', 'test6', '$2a$10$NKrQDcg.rd4YaJrg9MPuzemhSkqorQdsIMjGa8ytWmYAj8qtioar2', NULL, 'test6', NULL, '23', '0', '', '0', NULL, NULL, 'test6', '2018-10-27 16:48:56', 0, '', '323');
INSERT INTO `sys_user` VALUES ('1071', '测试账号', 'test3', '$2a$10$liY3vs6l4aOMDwvQaQ0r7eVC8KmwkfMoBIjYxpamoT/4hieIVsWmO', NULL, 'test3', NULL, '3eeeee', '0', '', '1', NULL, NULL, 'test3', '2018-10-27 22:46:50', 0, '', '测试备注');
INSERT INTO `sys_user` VALUES ('1076', '测试账号', 'test5', '$2a$10$g8/Yx8Iy8.Py4X4BeTuO6.czmC32rDkRChxueSFk37yO8x7laQ/3q', NULL, '333', NULL, '333', '1', '', '0', NULL, NULL, 'test5', '2018-10-28 15:05:08', 0, '', '333');
INSERT INTO `sys_user` VALUES ('1099', '测试账号', 'test7', '$2a$10$6t6cVnBMJzcRqCkuRDimau1DvawpZPhMrukaLUGpElSCH5eGbovNq', NULL, '232323', NULL, '32323', '1', '', '0', NULL, NULL, 'test7', '2018-10-28 13:24:12', 0, '', '3232332');
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$eTOqrN3oKY76eQTIE5ieGOJvOr86V/GVmoEg2lJWUUk5SOWNaMZfi', NULL, '323232323', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '1633736729@qq.com', '0', '2018-10-11', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2018-10-30 09:56:09', 0, 'EXAM', 'ccccc');
INSERT INTO `sys_user` VALUES ('3', '测试账号', 'test8', '$2a$10$f0Jgc.83m6L/yWYtDDFYAuAN1ZP1GIrZOiCmwWnCvWkbXVGmXI4lO', NULL, '323', NULL, '323', '0', '', '1', 'test8', '2018-10-24 09:48:54', 'test8', '2018-10-28 13:17:43', 0, '', '323');
INSERT INTO `sys_user` VALUES ('c19c2458404a49daa94c43ccc63e4522', '谭广宜', 'tangyi', '$2a$10$4F3oitNhYqvxx6bwHpoFpu1HZ2HmLnDgHSRegLA4paNY3VDiY2V7O', NULL, '15521089185', NULL, '16333736729@qq.com', '0', '2018-10-16', '0', 'test9', '2018-10-30 12:53:25', 'test9', '2018-10-30 12:53:25', 0, 'EXAM', 'Java');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO `sys_user_dept` VALUES ('044419cc516946338bbed749afd63429', '1076', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user_dept` VALUES ('1f612fcd11f74001b7c4a1e4285663b4', '1025', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user_dept` VALUES ('722031b52c404b979df22f6a9cf35abb', '1099', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user_dept` VALUES ('8ffe01d9b36b4c4f80a6d6001f4e5c32', '3', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user_dept` VALUES ('9000e2f320904d9cb8dde5e9de3b09b0', '1', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user_dept` VALUES ('9f48132ccffa4405940f36d0040c373e', '2', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user_dept` VALUES ('c4bc3313670e438185623cfd4d6f558b', '1041', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user_dept` VALUES ('f7716153da1145e59f11a451f6f35c91', 'c19c2458404a49daa94c43ccc63e4522', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user_dept` VALUES ('f9e0b572c14c4bb5b3d5fe1b26016466', '1043', 'ef7a812bc75743b3929a8c0dde9d5467');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('03e258e5059c4c8896ec3173101212af', '2', '1');
INSERT INTO `sys_user_role` VALUES ('2280645454d349e991bc2c12dc1bf85b', '1041', '1');
INSERT INTO `sys_user_role` VALUES ('32b58d7d1cdf4c9fb709d1f41a966a31', '1041', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('36bbfeec665248a5a91de9d86cae3ee9', '1041', 'f623fcad11474a54bc1dcf0947bef487');
INSERT INTO `sys_user_role` VALUES ('3badf1d7dd2e4d6cb2828af859df099e', '3', 'f623fcad11474a54bc1dcf0947bef487');
INSERT INTO `sys_user_role` VALUES ('3e224043fa234f57b0081c70929567a0', '1099', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('4a96ba847da34a24b873ec2d176d5e8c', '1', '1');
INSERT INTO `sys_user_role` VALUES ('61367e0e764648bea04ddedf65da8de8', '3', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('766759b93f5342ebb094371bb46ddb00', '1025', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('d0ec65a303b84023a565f9e5ae62e6bf', 'c19c2458404a49daa94c43ccc63e4522', '88cdd68a79634437a606a5a3fd12127a');
INSERT INTO `sys_user_role` VALUES ('e1eaed03296a4c518a780a50093826d7', '1076', '8ff8a3d10f2a4735bc76fc4485732b05');

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strip_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retryable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sensitive_headers_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES ('1', '/auth/**', 'online-exam-auth', NULL, NULL, '1', '1', NULL, 'admin', '2018年9月1日15:50:52', 'admin', '2018年9月1日15:50:58', '0', NULL);
INSERT INTO `sys_zuul_route` VALUES ('2', '/admin/**', 'online-exam-user', NULL, NULL, '1', '1', NULL, 'admin', '2018年9月1日15:51:56', 'admin', '2018年9月1日15:52:02', '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;

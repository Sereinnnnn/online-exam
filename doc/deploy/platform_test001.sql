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

 Date: 01/01/2019 15:29:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES ('00fb2edaadab42e1a7eb8d5aa0b403ac', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AB/wKgA1VvZnRuAO3RwAAD-GukB1B8991.jpg', NULL, NULL, '1', 'admin', '2018-10-31 20:13:37', 'admin', '2018-10-31 20:13:37', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('0d22e24d7f084af4be6f5079155ea65e', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1VvZqBuANBo2AABuc3AaBYU595.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:33', 'admin', '2018-10-31 21:00:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('1483ec9e29ca497388992592c0f23f07', 'dashboard.png', '65177', 'group1', 'group1/M00/07/AC/wKgA1VvbDUuAfg4dAAD-mb4N5hg338.png', NULL, NULL, '0', 'admin', '2018-11-01 22:24:33', 'admin', '2018-11-01 22:24:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('14ee6c489ab94cf8b41eb86ceda3a706', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbEOSAAHAPABbiiFU63Bs86.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:39:53', 'admin', '2018-11-01 22:39:53', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('16169bbaeeb94f558293cf2647f40686', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AB/wKgA1VvZqc2AWC1DAAD-GukB1B8786.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:07:47', 'admin', '2018-10-31 21:07:47', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('1e8dea7f5cad4d2fa01e880dba2187df', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AB/wKgA1Vva-_2AQ6BjAAHfNEwM92Q258.jpg', NULL, NULL, '0', 'admin', '2018-11-01 21:10:42', 'admin', '2018-11-01 21:10:42', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('228c3eaa40c74bc4a515b6a290101a4b', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AB/wKgA1VvZqCuAfKHNAAB2nqimI80603.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:50', 'admin', '2018-10-31 21:00:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('23610ba23dec4e108ba89a7b43a59c05', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_ECAX-nlAAD-GukB1B8067.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:11:50', 'admin', '2018-11-01 21:11:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2a0d0757124547f3be721d404adcb22d', '4.jpg', '11191', 'group1', 'group1/M00/07/AB/wKgA1VvaiyiACKMtAAArtyMGt8w168.jpg', NULL, NULL, NULL, 'admin', '2018-11-01 13:12:18', 'admin', '2018-11-01 13:12:18', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2a3517ec160c4e64ba9a8def29f11403', '??.jpg', '3155102', 'group1', 'group1/M00/07/AC/wKgA1VvbDQiAWHdlADAknmGgd48050.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:23:26', 'admin', '2018-11-01 22:23:26', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2c7a4fe15b8948ddbc6d8abfa0bdab93', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvbAFqAGpqAAABuc3AaBYU850.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:29:19', 'admin', '2018-11-01 21:29:19', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2d1061bc7e98464ba6a755a3f7a7f9b5', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva_7KAE0j9AABuc3AaBYU654.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:26:31', 'admin', '2018-11-01 21:26:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('35f17164439046edad2f89b558f2b963', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_6KAFHrCAAD-GukB1B8920.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:26:15', 'admin', '2018-11-01 21:26:15', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4327a986afe84a3b87378497ec748ecb', 'Sublime Text Build 3176 x64 Setup.exe', '9142656', 'group1', 'group1/M00/07/AC/wKgA1VvbDfCAUxXRAIuBgFrK3Eo313.exe', NULL, NULL, '0', 'admin', '2018-11-01 22:27:18', 'admin', '2018-11-01 22:27:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('46a494b4adc54b4e949343ff2bd0f2e2', 'dashboard.png', '65177', 'group1', 'group1/M00/07/AC/wKgA1VvbDTWACl0_AAD-mb4N5hg179.png', NULL, NULL, '0', 'admin', '2018-11-01 22:24:11', 'admin', '2018-11-01 22:24:11', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4fde0977a0bf4a7f95d783e121b89a85', 'mmexport1516892249742.jpg', '198610', 'group1', 'group1/M00/07/AC/wKgA1Vva_SGAMCUlAAMH0hg_LV8101.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:15:34', 'admin', '2018-11-01 21:15:34', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('51141850d3814986bd3674b6e7a9cb3b', 'mmexport1493135572994.jpg', '1647078', 'group1', 'group1/M00/07/AC/wKgA1VvbCyCAYT-7ABkh5rFIM5M694.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:15:18', 'admin', '2018-11-01 22:15:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5279595777dc4b37ae4e0b6901a76f89', 'mmexport1537768301334.jpg', '23366', 'group1', 'group1/M00/07/AC/wKgA1Vva_1-ASyJGAABbRqZlu1A357.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:25:08', 'admin', '2018-11-01 21:25:08', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('554248c16cf449a282561ac492566dbc', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VvbAI-APenNAAD-GukB1B8093.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:30:12', 'admin', '2018-11-01 21:30:12', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5b59ca4f6029412598a27cf8968afbac', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbDvSAPMrYABbiiFU63Bs69.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:31:38', 'admin', '2018-11-01 22:31:38', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5fb5fb123ece4f8091ebaf6ccc7746f8', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_4uAK_e5AAD-GukB1B8648.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:25:52', 'admin', '2018-11-01 21:25:52', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6f383b0e06414648b4dc8d29474fdf40', 'mmexport1493135572994.jpg', '1647078', 'group1', 'group1/M00/07/AC/wKgA1VvbDXuAQ471ABkh5rFIM5M844.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:25:20', 'admin', '2018-11-01 22:25:20', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6f62bf730a4244e69c55506cf57e16fd', '??????201805??.xlsx', '57415', 'group1', 'group1/M00/07/AB/wKgA1Vvak2GAflf3AADgR-4m26g77.xlsx', NULL, NULL, '0', 'admin', '2018-11-01 13:47:23', 'admin', '2018-11-01 13:47:23', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('70ed64db368647a696e4d791b962acaa', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva_92AOTEPAABuc3AaBYU363.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:27:15', 'admin', '2018-11-01 21:27:15', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7435a9340f584413a96b382c851e777d', '??.jpg', '30366', 'group1', 'group1/M00/07/AD/wKgA1Vwng2KAb43aAAB2nqimI80731.jpg', NULL, NULL, '1', 'admin', '2018-12-29 22:19:46', 'admin', '2018-12-29 22:19:46', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('76fe4e3c5c5942639c4b2343cf497955', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvgO9WADveBAABuc3AaBYU772.jpg', NULL, NULL, '1', 'test9', '2018-11-05 20:44:24', 'test9', '2018-11-05 20:44:24', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7aa76cd8b63749c89de4528288c0dbbb', 'Sublime Text Build 3176 x64 Setup.exe', '9142656', 'group1', 'group1/M00/07/AC/wKgA1VvbDrGAOnpDAIuBgFrK3Eo708.exe', NULL, NULL, '0', 'admin', '2018-11-01 22:30:30', 'admin', '2018-11-01 22:30:30', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7d8aa7588e124d2bab9c591a5cabe477', 'BingWallpaper-2018-08-07.jpg', '422459', 'group1', 'group1/M00/07/AB/wKgA1VvaitWAaQH-AAZyO6JWPnQ175.jpg', NULL, NULL, NULL, 'admin', '2018-11-01 13:10:55', 'admin', '2018-11-01 13:10:55', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7dc9b8fc78184908a8e3bfdf3eee710b', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VvqxPWARR2OAAD-GukB1B8724.jpg', NULL, NULL, '1', 'admin', '2018-11-13 20:31:59', 'admin', '2018-11-13 20:31:59', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7faabf7c11684779bdcbc4645b7459c7', 'mmexport1537416674194.jpg', '44592', 'group1', 'group1/M00/07/AC/wKgA1Vva_TCAUCn2AACuMBSjzzg215.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:15:49', 'admin', '2018-11-01 21:15:49', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('814bf12930c441ceb733fe198d4b7c56', '????_20181003142934.jpg', '24150', 'group1', 'group1/M00/07/AB/wKgA1Vvakj2AadqjAABeVr16Sxc373.jpg', NULL, NULL, '0', 'admin', '2018-11-01 13:42:31', 'admin', '2018-11-01 13:42:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('85d1b6cced0542998e347f7ca93954d5', 'ShtermClient-2.1.12.exe', '1852364', 'group1', 'group1/M00/07/AB/wKgA1Vvakr2Af6Y5ABxDzLZVMEM911.exe', NULL, NULL, '0', 'admin', '2018-11-01 13:44:40', 'admin', '2018-11-01 13:44:40', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('88df5ebcae554fcea51ad35ea3f81e07', 'mmexport1498206654197.jpg', '150375', 'group1', 'group1/M00/07/AC/wKgA1VvbDaiAO8pdAAJLZyi9s88765.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:26:05', 'admin', '2018-11-01 22:26:05', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('8fbfd861b58b4b15803005945bed21a9', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1Vva-_SAJKmKAABuc3AaBYU404.jpg', NULL, NULL, '0', 'admin', '2018-11-01 21:10:33', 'admin', '2018-11-01 21:10:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('90cbda2b934c4900b91820b8a248e03e', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AC/wKgA1VvbCwWAXUxJAAB2nqimI80604.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:14:51', 'admin', '2018-11-01 22:14:51', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9b589f544a174de690667fac05a444b8', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva__mAKW3GAABuc3AaBYU071.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:27:42', 'admin', '2018-11-01 21:27:42', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9e28bae3db7c43668f8d4372588d9e41', 'mmexport1537768301334.jpg', '23366', 'group1', 'group1/M00/07/AC/wKgA1VvbEWKAWA3JAABbRqZlu1A578.jpg', NULL, NULL, '1', 'admin', '2018-11-01 22:41:59', 'admin', '2018-11-01 22:41:59', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9f72b55e72714c2a9537dec0cbc41736', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_G-AK_2tAAD-GukB1B8914.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:12:36', 'admin', '2018-11-01 21:12:36', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9fb9983cddeb45ff81d41282c9c69ed3', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvbAIGAHWtNAABuc3AaBYU595.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:29:58', 'admin', '2018-11-01 21:29:58', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('aa5e78c9301d4230936674021caa4a88', '????????.pdf', '1049029', 'group1', 'group1/M00/07/AC/wKgA1VvbDyyAKK37ABABxd3i7-M414.pdf', NULL, NULL, '0', 'admin', '2018-11-01 22:32:33', 'admin', '2018-11-01 22:32:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b360d492a0d94e94ba67ea52f5f80438', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbDw-ASdm2ABbiiFU63Bs03.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:32:05', 'admin', '2018-11-01 22:32:05', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b3f657a1cd274bae8163624bf27ac813', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VveW06ADW3YAAD-GukB1B8372.jpg', NULL, NULL, '1', 'tangyi', '2018-11-04 10:34:10', 'tangyi', '2018-11-04 10:34:10', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b41860ae127f4994a4a961c39fa16125', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AC/wKgA1VvbDW-AMFtHAAHfNEwM92Q032.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:25:09', 'admin', '2018-11-01 22:25:09', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('bbd82babb8f44e1983c0f4a13e3d6111', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1VvZnQ-AVZCtAABuc3AaBYU378.jpg', NULL, NULL, '1', 'admin', '2018-10-31 20:13:26', 'admin', '2018-10-31 20:13:26', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('c3148765b9144c99b3b71c9b404c0150', 'header.jpg', '50859', 'group1', 'group1/M00/07/AC/wKgA1VwNE1uAKC9rAADGqyYhFOI648.jpg', NULL, NULL, '0', 'admin', '2018-12-09 21:03:08', 'admin', '2018-12-09 21:03:08', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('cb8c9f63d4ff4f0985f77457a819e5a5', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AB/wKgA1VvZqDSAOOxYAAHfNEwM92Q909.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:58', 'admin', '2018-10-31 21:00:58', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('dbac7a2c1371431d92c5e93b9b3a6b90', 'mmexport1518863985596.jpg', '182412', 'group1', 'group1/M00/07/AC/wKgA1VvbDbqANoSjAALIjNvFb24523.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:26:23', 'admin', '2018-11-01 22:26:23', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('dc9a9a8c5ed54c99b5bb470dc409b5ea', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbDraASBuLABbiiFU63Bs48.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:30:35', 'admin', '2018-11-01 22:30:35', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('e1476a1b242146ff8e2f8c1b4394ab75', 'mmexport1534072655992.jpg', '126132', 'group1', 'group1/M00/07/AC/wKgA1VvbC8uACaf9AAHstACoh4Y368.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:18:08', 'admin', '2018-11-01 22:18:08', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('eca839ea765d48dcb75b33532794a3ce', 'Sublime Text Build 3176 x64 Setup.exe', '9142656', 'group1', 'group1/M00/07/AC/wKgA1VvbDMCAWBCMAIuBgFrK3Eo697.exe', NULL, NULL, '0', 'admin', '2018-11-01 22:22:14', 'admin', '2018-11-01 22:22:14', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('f3ca74dae2f241ef87a77e0de84bbb53', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AB/wKgA1VvZm3GAZHqZAAD-GukB1B8278.jpg', NULL, NULL, '1', 'admin', '2018-10-31 20:06:31', 'admin', '2018-10-31 20:06:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('f5bccda1d25c449793c2d60c35251037', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AC/wKgA1VveW_-AIZ4pAAB2nqimI80068.jpg', NULL, NULL, '0', 'admin', '2018-11-04 10:37:07', 'admin', '2018-11-04 10:37:07', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('faaa676bc2274b39b857dc01d3f72c91', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AC/wKgA1VvbET-AL1X-AAB2nqimI80613.jpg', NULL, NULL, '1', 'admin', '2018-11-01 22:41:24', 'admin', '2018-11-01 22:41:24', '1', 'EXAM');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
INSERT INTO `sys_dept` VALUES ('140b2ba6508240f2a39b6729e6cc5f3e', '11', '2d0b1e08677d45bc8cee3db44774abf6', '30', 'admin', '2018-12-01 14:21:51', 'admin', '2018-12-01 14:21:51', '1', 'EXAM', '0', '11', '11');
INSERT INTO `sys_dept` VALUES ('1e31659224884cbc89022ab4e6ecf70c', '移动研发部', '551aafb3281b44b1bfbd19bac9e54b94', '27', '', '2018-10-26 17:21:47', '', '2018-10-26 17:21:47', '0', '', '0', '移动研发部', '叶瑞龙');
INSERT INTO `sys_dept` VALUES ('2d0b1e08677d45bc8cee3db44774abf6', '测试部门', '-1', '30', '', '2018-10-27 22:22:22', '', '2018-10-27 22:22:22', '0', '', '0', '测试', '测试');
INSERT INTO `sys_dept` VALUES ('34f01bfe915647f2859400fadba431b0', '', '-1', '30', '', '2018-10-29 13:01:46', '', '2018-10-29 13:01:46', '1', '', '0', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('3b40c8dcf95f4fc78b748d550aa9df6a', '研发一部', 'bae0cdcda1ab42559de45bd0420f3c34', '28', '', '2018-10-25 20:57:25', '', '2018-10-25 20:57:25', '0', '', '0', '研发一部', '沉香');
INSERT INTO `sys_dept` VALUES ('4f1ed1353d904ad3837458266de8a080', '平台研发部', '551aafb3281b44b1bfbd19bac9e54b94', '26', '', '2018-10-26 17:22:14', '', '2018-10-26 17:22:14', '0', '', '0', '平台研发部', '马志鹏');
INSERT INTO `sys_dept` VALUES ('551aafb3281b44b1bfbd19bac9e54b94', '行业发展研究中心', '-1', '3', '', '2018-10-26 17:21:11', '', '2018-10-26 17:21:11', '0', '', '0', '行业发展研究中心', '黄华伟');
INSERT INTO `sys_dept` VALUES ('674b823335114dd1b9de642e689a8e19', '政务服务事业部', '-1', '2', '', '2018-10-25 20:58:41', '', '2018-10-25 20:58:41', '0', '', '0', '政务服务事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('839a2524aea445bb83a46a0ea03f87ac', '智慧政务事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:22:43', '', '2018-10-26 17:22:43', '0', '', '0', '智慧政务事业部', '周武杰');
INSERT INTO `sys_dept` VALUES ('bae0cdcda1ab42559de45bd0420f3c34', '研发部', '-1', '1', '', '2018-10-25 20:38:04', '', '2018-10-25 20:42:58', '0', '', '1', '产品研发', '杨锐');
INSERT INTO `sys_dept` VALUES ('c29e267021b242139e95d34a1b1488a4', '广东财经大学', '-1', '50', 'admin', '2018-11-12 19:50:28', 'admin', '2018-11-12 19:50:28', '0', 'EXAM', '0', '广东财经大学', NULL);
INSERT INTO `sys_dept` VALUES ('cb38942fba4c438995dee5622d3dfdfa', '智慧政府事业部', '674b823335114dd1b9de642e689a8e19', '30', '', '2018-10-26 17:23:05', '', '2018-10-26 17:23:05', '0', '', '0', '智慧政府事业部', '陈宏');
INSERT INTO `sys_dept` VALUES ('ef7a812bc75743b3929a8c0dde9d5467', '研发二部', 'bae0cdcda1ab42559de45bd0420f3c34', '29', '', '2018-10-25 20:58:06', 'admin', '2018-10-30 15:40:35', '0', '', '0', '研发二部', '庞锦坤');
INSERT INTO `sys_dept` VALUES ('f4e3ff4b0fea4856ab71f7c9a31449d8', 'iiii', '-1', '30', '', '2018-10-29 13:04:43', '', '2018-10-29 13:04:53', '1', '', '0', 'tt', 'tt');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('077d10c9a3e94dd9b2287cd203526bb8', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@4c9df721', '附件不存在！', NULL, NULL, '2018-11-05 20:42:43', NULL, '2018-11-05 20:42:43', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('0eb7834aedd041968906374d5b87945b', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@4c9df721', 'java.io.IOException: 你的主机中的软件中止了一个已建立的连接。', NULL, NULL, '2018-11-05 20:59:17', NULL, '2018-11-05 20:59:17', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('150992f011a740b0876893951940da01', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@4c9df721', '附件不存在！', NULL, NULL, '2018-11-05 20:44:18', NULL, '2018-11-05 20:44:18', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('22ae0049f6de44b3bb6d9f432a690b88', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@21621609', '附件不存在！', NULL, NULL, '2018-11-13 20:53:59', NULL, '2018-11-13 20:53:59', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('3e5466c57e794256b9cf9f958c962a8e', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@536583d2', 'java.io.IOException: 你的主机中的软件中止了一个已建立的连接。', NULL, NULL, '2018-11-13 20:26:43', NULL, '2018-11-13 20:26:43', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('63c8d16c752a40dbb255bdb09df5cd19', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@f0f63ca', '附件不存在！', NULL, NULL, '2018-11-04 13:26:56', NULL, '2018-11-04 13:26:56', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('651b2be15b134d6e938a116907906242', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@1049e3c9', 'java.io.IOException: 你的主机中的软件中止了一个已建立的连接。', NULL, NULL, '2018-11-13 20:26:42', NULL, '2018-11-13 20:26:42', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('70451e36784447388d23b195a7d8b4c1', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@4c9df721', '附件不存在！', NULL, NULL, '2018-11-05 20:43:11', NULL, '2018-11-05 20:43:11', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('76e147a9bbb04e2b85a238c8f24a9e5d', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@f0f63ca', '附件不存在！', NULL, NULL, '2018-11-04 13:28:05', NULL, '2018-11-04 13:28:05', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('a76ea2335b1c44f29fc28b0d41ffd4b8', '2', '下载附件', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.17 Safari/537.36', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@455e6ab5', 'java.io.IOException: 你的主机中的软件中止了一个已建立的连接。', NULL, NULL, '2018-11-13 20:26:44', NULL, '2018-11-13 20:26:44', '1', 'EXAM');
INSERT INTO `sys_log` VALUES ('b76a6b57a7c344098a96eeadb6904607', '2', '下载附件', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '/attachment/download', 'GET', 'org.apache.catalina.util.ParameterMap@576bd1ea', '附件不存在！', NULL, NULL, '2018-12-31 21:53:53', NULL, '2018-12-31 21:53:53', '0', 'EXAM');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0390263ef05f45dfb5d7bcf7e2da90b6', '查询', 'sys_role_query', NULL, '5', 'example', '2', '1', '', '2018-10-28 16:44:44', '', '2018-10-28 16:44:44', '1', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('095bb0644ab14d97b31418f87e1cf823', '导出菜单', 'sys:menu:export', NULL, '3', '', '34', '1', 'admin', '2018-11-28 19:07:02', 'admin', '2018-11-28 19:07:02', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0dc80492cf414db984d825fdd842e022', '新增用户', 'sys:user:add', NULL, '4', 'example', '1', '1', '', '2018-10-28 16:38:57', 'admin', '2018-11-04 10:20:38', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0ee02b8dc3064fcd972f527c31aad5a7', '修改菜单', 'sys:menu:edit', NULL, '3', 'example', '4', '1', '', '2018-10-28 16:46:38', 'admin', '2018-11-04 10:21:23', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0fe1156ec9e24dd4bc2c663c665a5048', '导出用户', 'sys:user:export', NULL, '4', '', '33', '1', 'admin', '2018-11-27 12:05:03', 'admin', '2018-11-27 12:05:03', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'sys', '/admin/sys/**', '-1', 'component', '1', '0', '1', '1', 'admin', '2018-11-06 23:23:35', '0', '1', 'Layout', '/sys', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('13f925e8559c43aa8ef33a8e1e3f9b4d', '知识库', 'exam:knowledge', '/exam/knowledge/**', 'b93eba1199b6420a82d285a8919bcd23', '', '5', '0', 'admin', '2019-01-01 14:55:31', 'admin', '2019-01-01 14:55:31', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('14', '个人管理', 'personal', '/admin/personal/**', '-1', 'form', '30', '0', '', '2018-10-28 16:12:34', 'admin', '2018-10-30 14:42:17', '0', '', 'Layout', '/personal', NULL, '个人管理');
INSERT INTO `sys_menu` VALUES ('15', '附件管理', 'attachment', '/admin/attachment/**', '-1', 'excel', '10', '0', 'admin', '2018-10-30 19:48:36', 'admin', '2018-10-30 20:31:21', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理');
INSERT INTO `sys_menu` VALUES ('1717eabc03174c2e9bdaf27c5a5697dd', '题库管理', 'exam:subject', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '3', '0', 'admin', '2018-12-04 21:33:40', 'admin', '2018-12-04 21:33:40', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理');
INSERT INTO `sys_menu` VALUES ('19371307401c436096c040b935aea0fd', '查询', 'null_query', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1b68d41bfcc3441f839188a9d7b6ead0', '接口文档', 'monitor:document', '/monitor/document/**', '7', '', '32', '0', 'admin', '2018-10-30 15:06:08', 'admin', '2018-11-07 18:13:47', '0', 'EXAM', '', 'http://139.224.200.249:19999/swagger-ui.html', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1e6a90e57df541e0973691c17d44564c', '日志监控', 'monitor:log', '/admin/log/**', '7', '', '30', '0', 'admin', '2018-10-30 15:00:25', 'admin', '2018-11-06 23:34:19', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控');
INSERT INTO `sys_menu` VALUES ('20bf591156414b3eb39563ef45a6cf48', '百度', 'baidu', '/baidu', '-1', 'example', '30', '0', 'admin', '2018-10-30 17:08:43', 'admin', '2018-10-30 17:29:45', '1', 'EXAM', '', '', NULL, '');
INSERT INTO `sys_menu` VALUES ('23df3c2475504ca781e25c3443d7ad25', '修改课程', 'exam:course:edit', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '2', '1', 'admin', '2018-11-10 22:44:28', 'admin', '2018-11-10 22:44:28', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('26322a60667b45b9a1cce2c70998f75c', '修改', 'null_modify', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('26cd5e31227843219d990ebfbaf35855', '删除', 'null_del', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('26f531763fe94b94bc30208a8bf46427', '测试菜单2', '测试菜单2', 'ddd', '48e4338aef2543e988d4105e153a3c92', 'example', '30', '0', 'admin', '2018-10-29 21:48:28', 'admin', '2018-10-29 21:48:28', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2a232ac9f43146a49ab5a19226e76742', '删除部门', 'sys:dept:del', NULL, '6', 'example', '3', '1', '', '2018-10-28 16:43:19', 'admin', '2018-11-04 10:20:22', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', 'sys:menu', '/admin/menu/**', '1', '', '10', '0', '1', '1', 'admin', '2018-11-06 23:34:12', '0', '1', 'views/sys/menu', 'menu', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34371d1e990549f0b633389bdf64ce0f', '修改题目分类', 'exam:subject:category:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '5', '1', 'admin', '2018-12-04 21:36:34', 'admin', '2018-12-04 21:36:34', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('347d24c6e1cf42eaa976c91f5607007a', '新增部门', 'sys:dept:add', NULL, '6', 'example', '1', '1', '', '2018-10-28 16:42:40', 'admin', '2018-11-04 10:20:15', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34ffa24d3c124902893e601fe8e22b08', '服务监控', 'monitor:service', '/admin/monitor/service/**', '7', '', '31', '0', 'admin', '2018-10-30 15:01:17', 'admin', '2018-11-07 12:54:16', '0', 'EXAM', '', 'http://localhost:8765/', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('36cca77232f3487cbee02bb68ae12652', '新增菜单', 'sys:menu:add', NULL, '3', 'example', '1', '1', '', '2018-10-28 16:45:45', 'admin', '2018-11-04 10:21:06', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3a64f8a80dce4f6c8bc4483f0230f49f', '导入用户', 'sys:user:import', NULL, '4', '', '34', '1', 'admin', '2018-11-27 12:05:29', 'admin', '2018-11-27 12:05:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3bb2fec1ba094584aa1a984ec1f05dc7', '删除课程', 'exam:course:del', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '3', '1', 'admin', '2018-11-10 22:44:53', 'admin', '2018-11-10 22:44:53', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3f4d1adeb76e49239768f362c6c774e0', '接口文档', 'monitor:document', '/monitor/document/**', '7', 'example', '32', '0', 'admin', '2018-10-30 15:05:36', 'admin', '2018-10-30 15:05:36', '1', 'EXAM', 'monitor/document', '/monitor/document', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'sys:user', '/admin/user/**', '1', '', '2', '0', '1', '1', 'admin', '2018-11-06 23:33:55', '0', '1', 'views/sys/user', 'user', '', '用户管理');
INSERT INTO `sys_menu` VALUES ('42ac13ba9dd343eeb2343f2a3b7a549c', '服务监控', 'monitor:service', '/admin/monitor/service/**', '7', 'example', '30', '0', 'admin', '2018-10-30 15:01:12', 'admin', '2018-10-30 15:01:12', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('42c69128d30a4242b08ef0003da68528', '修改角色', 'sys:role:edit', NULL, '5', 'example', '4', '1', '', '2018-10-28 16:45:11', 'admin', '2018-11-04 10:19:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('43d457935f3f47b7ae9cfbd385923257', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:42:50', 'admin', '2018-10-29 21:42:50', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('451605025d9a4715b4ae78f5a5d01fea', '删除题目分类', 'exam:subject:category:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '6', '1', 'admin', '2018-12-04 21:36:55', 'admin', '2018-12-04 21:36:55', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4f3e874dc310463a82e3b650fd851fdb', '修改密码', 'personal:password', '/admin/user/updateInfo', '14', '', '30', '0', 'admin', '2018-10-29 21:59:03', 'admin', '2018-11-06 23:34:47', '0', 'EXAM', 'views/personal/password', 'password', NULL, '密码修改');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', 'sys:role', '/admin/role/**', '1', '', '9', '0', '1', '1', 'admin', '2018-11-06 23:34:06', '0', '1', 'views/sys/role', 'role', '', NULL);
INSERT INTO `sys_menu` VALUES ('530f933da3824e1f9bf3182794141e9e', '删除题目', 'exam:subject:bank:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '3', '1', 'admin', '2018-12-04 21:35:13', 'admin', '2018-12-09 20:36:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('59b62767c61247d2ae0f1d2775d87f86', '分配权限', 'sys:role:auth', NULL, '-1', '', '30', '1', 'admin', '2018-11-04 10:18:59', 'admin', '2018-11-04 10:18:59', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('5ba624643cd34ec3b78ca622964c0f8a', '修改题目', 'exam:subject:bank:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '2', '1', 'admin', '2018-12-04 21:34:50', 'admin', '2018-12-09 20:35:58', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('5f809b08920e46cb9b4eb9c87199e6b3', '新增', 'null:add', NULL, '9aeba7d6166941639876bf40673d59cb', NULL, '30', '1', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6', '部门管理', 'sys:dept', '/admin/dept/**', '1', '', '8', '0', '1', '1', 'admin', '2018-11-06 23:34:00', '0', '1', 'views/sys/dept', 'dept', '', NULL);
INSERT INTO `sys_menu` VALUES ('63f039ea5bcf4208978150b59484a429', '考试管理', 'exam:exam', '/exam/exam/**', 'b93eba1199b6420a82d285a8919bcd23', '', '2', '0', 'admin', '2018-11-10 22:22:42', 'admin', '2018-11-10 22:22:42', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理');
INSERT INTO `sys_menu` VALUES ('657026922f494801a41b64f40e63fca6', '删除考试', 'exam:exam:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '3', '1', 'admin', '2018-11-10 22:46:12', 'admin', '2018-11-10 22:46:12', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('69a2a85608064762a3d76fc0c92072cc', '新增题目分类', 'exam:subject:category:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '4', '1', 'admin', '2018-12-04 21:35:59', 'admin', '2018-12-04 21:35:59', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6f605148282b4949b5c96e2877dc9052', '题目管理', 'exam:exam:subject', NULL, '63f039ea5bcf4208978150b59484a429', '', '4', '1', 'admin', '2018-11-13 20:50:07', 'admin', '2018-11-13 20:50:41', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'sys', '/admin/monitor/**', '-1', 'chart', '7', '0', '1', '1', 'admin', '2018-10-31 21:21:49', '0', '1', 'Layout', '/monitor', '', NULL);
INSERT INTO `sys_menu` VALUES ('70aeccce43b34c7eaa648d52da578bc0', '查询', 'sys_dept:query', NULL, '6', 'example', '2', '1', '', '2018-10-28 16:43:09', '', '2018-10-28 16:43:45', '1', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('71e5179363bc4e119a87daaa631a2712', '导入题目', 'exam:exam:subject:import', NULL, '63f039ea5bcf4208978150b59484a429', '', '36', '1', 'admin', '2018-11-27 12:06:45', 'admin', '2018-11-27 12:06:45', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('72de30896d3a401eb62edc0aa6fbf190', '导出成绩', 'exam:score:export', NULL, 'c3adad9112de41a6a2d4cc9fe4a4d94b', '', '30', '1', 'admin', '2018-12-30 22:12:20', 'admin', '2018-12-30 22:12:20', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7780e3fd6cea4ba78d780f33c111d95a', '导入菜单', 'sys:menu:import', NULL, '3', '', '35', '1', 'admin', '2018-11-28 19:07:20', 'admin', '2018-11-28 19:07:20', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('780f1f5e4db54c7db0700119969382e3', '测试', '测试', '测试', '-1', 'example', '30', '0', 'admin', '2018-10-30 16:23:06', 'admin', '2018-10-30 16:23:06', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7f78172c09d3408dab1534d26b608b31', '首页', 'dashboard', '/dashboard', '-1', 'dashboard', '0', '0', 'admin', '2018-11-06 23:26:57', 'admin', '2018-11-06 23:28:50', '0', 'EXAM', 'Layout', '/dashboard', '', NULL);
INSERT INTO `sys_menu` VALUES ('8aefee22294d47d7a3e4a29ae5ced4b4', '个人资料', 'personal:message', '/admin/user/updateInfo', '14', '', '29', '0', 'admin', '2018-10-29 21:58:32', 'admin', '2018-11-06 23:34:41', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料');
INSERT INTO `sys_menu` VALUES ('8b67ccbe89f74b728e58c2e4a4795027', '删除菜单', 'sys:menu:del', NULL, '3', 'example', '3', '1', '', '2018-10-28 16:46:23', 'admin', '2018-11-04 10:21:14', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8bcf03f73377412b981572517b9055e0', '删除题目', 'exam:exam:subject:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '38', '1', 'admin', '2018-11-29 14:11:24', 'admin', '2018-11-29 14:11:24', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8dc7bb81a52f4196af3ba3f2704391c0', '测试2', '测试2', '测色2', '780f1f5e4db54c7db0700119969382e3', 'example', '30', '0', 'admin', '2018-10-30 16:23:22', 'admin', '2018-10-30 16:23:22', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9', '文档', 'sys', '/admin/sys/**', '7', NULL, '11', '0', '1', '1', '1', '1', '1', '1', 'views/documentation/index', '/documentation', '/documentation/index', NULL);
INSERT INTO `sys_menu` VALUES ('901959fd37df4f7d90adaa4ab6c4b331', '分配权限', 'sys:role:auth', NULL, '5', '', '30', '1', 'admin', '2018-11-04 10:19:32', 'admin', '2018-11-04 10:19:32', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('91861ef795ab4fc4a207567606fa62cc', '修改用户', 'sys:user:edit', NULL, '4', 'example', '4', '1', '', '2018-10-28 16:40:19', 'admin', '2018-11-04 10:20:54', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9aeba7d6166941639876bf40673d59cb', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:39:21', 'admin', '2018-10-29 21:39:21', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c0846685bb24aafae731bdacf879ba2', '删除角色', 'sys:role:del', NULL, '5', 'example', '3', '1', '', '2018-10-28 16:44:56', 'admin', '2018-11-04 10:20:01', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c2e04eab32c467f87d89ad0a2b4892c', '导出题目', 'exam:subject:bank:export', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '32', '1', 'admin', '2018-12-09 20:38:06', 'admin', '2018-12-09 20:38:06', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a382803a28c341519c59342022cda737', '测试菜单2', 'dddddd', '测试菜单2', '-1', 'example', '30', '0', 'admin', '2018-10-29 21:48:57', 'admin', '2018-10-29 21:48:57', '1', 'EXAM', NULL, NULL, NULL, '测试菜单2');
INSERT INTO `sys_menu` VALUES ('a398216ac2f14c16928452483786329e', '新增题目', 'exam:subject:bank:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '1', '1', 'admin', '2018-12-04 21:34:29', 'admin', '2018-12-09 20:35:18', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a663e71f7b8441b0b8363ae5eb20bbb3', '修改部门', 'sys:dept:edit', NULL, '6', 'example', '4', '1', '', '2018-10-28 16:43:38', 'admin', '2018-11-04 10:20:30', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ac6768a097184c99ada64810a897f727', '新增考试', 'exam:exam:add', NULL, '63f039ea5bcf4208978150b59484a429', '', '1', '1', 'admin', '2018-11-10 22:45:29', 'admin', '2018-11-10 22:45:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b0c97ca36f0d4f24ae0ca5edc6055aa4', NULL, NULL, NULL, '-1', 'example', '30', '0', 'admin', '2018-10-29 21:43:48', 'admin', '2018-10-29 21:43:48', '1', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b624dbf393b24cf68b733fb652a38077', '查询', 'sys_menu:query', NULL, '3', 'example', '2', '1', '', '2018-10-28 16:46:02', '', '2018-10-28 16:46:02', '1', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b85dda1e623e48e4ae82dc228df3edfe', '新增课程', 'exam:course:add', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '1', '1', 'admin', '2018-11-10 22:44:05', 'admin', '2018-11-10 22:44:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b8969a3731b0405e82d0bb896e13841e', '课程管理', 'exam:course', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '1', '0', 'admin', '2018-11-10 22:21:58', 'admin', '2018-11-10 22:27:03', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理');
INSERT INTO `sys_menu` VALUES ('b93eba1199b6420a82d285a8919bcd23', '考务管理', 'exam', '/exam/**', '-1', 'nested', '8', '0', 'admin', '2018-11-10 22:20:10', 'admin', '2018-11-10 22:20:10', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理');
INSERT INTO `sys_menu` VALUES ('c3aa1b7231f44883b052cae7ad0bf0d4', '查询', 'sys_user:query', NULL, '4', 'example', '2', '1', '', '2018-10-28 16:40:37', '', '2018-10-28 16:41:10', '1', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c3adad9112de41a6a2d4cc9fe4a4d94b', '成绩管理', 'exam:score', '/exam/score/**', 'b93eba1199b6420a82d285a8919bcd23', '', '4', '0', 'admin', '2018-12-30 22:10:53', 'admin', '2018-12-30 22:10:53', '0', 'EXAM', 'views/exam/score', 'score', NULL, '成绩管理');
INSERT INTO `sys_menu` VALUES ('c435ac944cd6430ba9a1039d8adb80a7', '新增角色', 'sys:role:add', NULL, '5', 'example', '1', '1', '', '2018-10-28 16:44:29', 'admin', '2018-11-04 10:19:53', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ca7e69aae4994099a6424aa9727b6a28', '删除用户', 'sys:user:del', NULL, '4', 'example', '3', '1', '', '2018-10-28 16:40:01', 'admin', '2018-11-04 10:20:46', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('cfc631763d3e4f1ab973141ddbeee449', '修改考试', 'exam:exam:edit', NULL, '63f039ea5bcf4208978150b59484a429', '', '2', '1', 'admin', '2018-11-10 22:45:51', 'admin', '2018-11-10 22:45:51', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('cffa2058b7c746efa2fca7ceb6052bdc', '新增题目', 'exam:exam:subject:add', NULL, '63f039ea5bcf4208978150b59484a429', '', '37', '1', 'admin', '2018-11-29 14:11:06', 'admin', '2018-11-29 14:11:06', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('d1967064f3584672af29c184818e38a9', '导入题目', 'exam:subject:bank:import', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '31', '1', 'admin', '2018-12-09 20:37:22', 'admin', '2018-12-09 20:37:22', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ee35a2abc0b04f3bb70527a7f79806e8', '链路监控', 'monitor:link', '/admin/monitor/link/**', '7', '', '32', '0', 'admin', '2018-11-07 20:30:43', 'admin', '2018-11-07 20:31:34', '0', 'EXAM', NULL, 'http://localhost:9411/zipkin/', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fa483765360243d0a631a2b9793aaf41', '导出题目', 'exam:exam:subject:export', NULL, '63f039ea5bcf4208978150b59484a429', '', '35', '1', 'admin', '2018-11-27 12:06:17', 'admin', '2018-11-27 12:06:17', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fe73699236be4b148cd35628929cc876', '附件列表', 'attachment:list', '/admin/attachment/list', '15', '', '30', '0', 'admin', '2018-10-30 19:49:50', 'admin', '2018-11-06 23:34:35', '0', 'EXAM', 'views/attachment/list', 'list', NULL, '附件列表');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 0-启用，1-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '管理员', 'admin', 'admin', 'test9', '2018-10-30 12:00:03', '0', 'admin', '0');
INSERT INTO `sys_role` VALUES ('2', '测试角色', 'test', '测试角色', NULL, NULL, NULL, '2018-10-27 23:03:41', '1', NULL, '1');
INSERT INTO `sys_role` VALUES ('33589c91a8f64c5aa53b94add015e8aa', '测试', 'test1', '测试', NULL, '2018-10-27 22:22:44', NULL, '2018-10-27 22:22:44', '1', '', '0');
INSERT INTO `sys_role` VALUES ('87ca2801018948cf932b49be07d59b05', '1', '1', '1', 'admin', '2018-12-01 14:45:53', 'admin', '2018-12-01 14:45:53', '1', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('88cdd68a79634437a606a5a3fd12127a', 'java开发', 'java', 'java开发', 'test9', '2018-10-30 12:01:33', 'test9', '2018-10-30 12:01:33', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('8ff8a3d10f2a4735bc76fc4485732b05', '测试角色', 'test1', '测试角色', NULL, '2018-10-28 10:31:43', 'admin', '2018-12-09 22:13:25', '0', '', '0');
INSERT INTO `sys_role` VALUES ('90abd3e9d4b5424eacb0397dc0fc4e27', '老师', 'teacher', '老师', 'admin', '2018-11-12 19:49:31', 'admin', '2018-11-12 19:50:45', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('e5ab0d61763e4eb7bf1c4122223e1872', '测试角色2', 'test2', '测试角色2', NULL, '2018-10-26 17:17:35', NULL, '2018-10-26 17:18:01', '1', '', '0');
INSERT INTO `sys_role` VALUES ('ee1a0a7fe7c64ae28922432460d8ae61', '学生', 'student', '学生', 'admin', '2018-11-12 19:49:49', 'admin', '2018-11-12 19:50:53', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('f623fcad11474a54bc1dcf0947bef487', '测试角色2', 'test2', '测试角色2', NULL, '2018-10-28 11:51:49', NULL, '2018-10-28 13:22:50', '1', '', '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('4a4ae69046c444b7b303cf8b69e8f749', 'ee1a0a7fe7c64ae28922432460d8ae61', 'c29e267021b242139e95d34a1b1488a4');
INSERT INTO `sys_role_dept` VALUES ('4fe632d6b36b439d8c198dbccc5caf3f', '1', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('701ed6dacffd4e8ea4bae43f28fbceea', '88cdd68a79634437a606a5a3fd12127a', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_role_dept` VALUES ('b5e5b0d127a940ecba965519628d9f9f', '8ff8a3d10f2a4735bc76fc4485732b05', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_role_dept` VALUES ('ede476d3f9a14bcea952dcb70d1e91d3', '90abd3e9d4b5424eacb0397dc0fc4e27', 'c29e267021b242139e95d34a1b1488a4');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('084c3f23040c4b1583ed78380c15f7aa', '90abd3e9d4b5424eacb0397dc0fc4e27', '14');
INSERT INTO `sys_role_menu` VALUES ('0b578f1d389c4c21a27ca7b88514ee16', '1', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('0cc38b750a2b4253acbc074e37f55a83', '1', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('10953012ca7a4a2c95ff7a2c30a0dd3d', '1', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('11ecfaf5f08e417ebfb7530c9ac3206d', '88cdd68a79634437a606a5a3fd12127a', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('126412ab9ab849238d555cc974719b0b', '1', 'ee35a2abc0b04f3bb70527a7f79806e8');
INSERT INTO `sys_role_menu` VALUES ('133840621aee4f53981278ea629b029e', '1', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('1343b0d47f2d48e88a5f46b9ba7902ad', '1', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('18736f6cb01e47b8b0327ae526c62a7d', '1', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('18ad93aeaa7a4b0fbaaded37bfcf94ad', '1', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('1a1e0410023c4a10abb06652f3815982', '1', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('1cc69ea0691843529cb07c0fe8779817', '1', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('1f0e0f06618c47e2bbaee489a3c817bc', '88cdd68a79634437a606a5a3fd12127a', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('1f487bb6be894ac795b1f81cff4623d6', '1', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('26010ed0c5344349a61f63f55a3d258f', '1', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('2b01b855d500411bba86f4b915047e92', '1', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('304d8c3e6a71411e9a6e3abbece781e2', 'ee1a0a7fe7c64ae28922432460d8ae61', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('30affa266ec74b708c3dd42bbedd3f21', '1', '2a232ac9f43146a49ab5a19226e76742');
INSERT INTO `sys_role_menu` VALUES ('32f3f8460a944a9f9ebca3cf2bf395f1', '90abd3e9d4b5424eacb0397dc0fc4e27', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('3478e35127514b44afba26836ea1033e', '1', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('34af28f1ad2b4ce5a9d48c0c553adad0', '1', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('37d43b61a5ce4aad8d090beb69a9c39a', '1', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('3b23d66468de40a693627116b3f8dfef', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('3cfcd844d99d4e76bc7eee00e87d8002', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('3e2ecb5b77a9482d8145c15ad0fbb7f0', '8ff8a3d10f2a4735bc76fc4485732b05', '14');
INSERT INTO `sys_role_menu` VALUES ('3f34f2f57d4c47a881ae8d910108fa8b', '1', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('432acc4cdb1d4faea04cf590ff570a1d', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('45e3576db4bb4d5a859a342c9409195b', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('4b7a36ad680a4cddb3e978b9fe0fcfd8', '1', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('50b7d6183c894e8ab47a8502257114a6', '1', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('54a2c66cd3c748a188d8de56b4c2dd9f', '1', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('55a8c7e1eaaf48b9b0794ee44270c080', '1', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('5756783c0a424d69941db609271df77c', '1', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('57f432343eb84201992120a84126914f', '1', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('5aff496b2a71422bb522bdffd32af2ec', '1', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('6253c51a055a40a794d418b08e0f4c5b', '1', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('62d1cc8c65cb40b094679c7e586a20a4', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('6400a4348f6d42ea94699852337f4d65', '88cdd68a79634437a606a5a3fd12127a', '7');
INSERT INTO `sys_role_menu` VALUES ('6af04d5edf6644e8bc85dcfaff1cd41c', '1', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('707c058ecc5a4ed6a77ca1cada11c6a4', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('71d7af2ef75d4f399bb8e67a3185b6bc', '1', '8b67ccbe89f74b728e58c2e4a4795027');
INSERT INTO `sys_role_menu` VALUES ('72dc6a8f522a46c29a649df42fdee5af', '1', '095bb0644ab14d97b31418f87e1cf823');
INSERT INTO `sys_role_menu` VALUES ('733ca3281126477db1bae5d25f2efe41', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('780ad3aa89404beaab871acce830d860', '1', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('783aad73c6cf47979ae0a0d6239eddaa', '1', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('7dc5565994de4e06ab78e762597cd7b8', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('81747137eb9d4504ac758c81bfdd55b0', '90abd3e9d4b5424eacb0397dc0fc4e27', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('8d7a895cb5164b3baf7249332caff1da', '1', '901959fd37df4f7d90adaa4ab6c4b331');
INSERT INTO `sys_role_menu` VALUES ('8e89d098096e41a69e233f6458057d43', '90abd3e9d4b5424eacb0397dc0fc4e27', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('8f3396083c8c4ce6982f097b923e8acf', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('a082751b1d9541fab8045db908050809', '1', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('a35f12b05b9944178b4ca40582bd8656', '88cdd68a79634437a606a5a3fd12127a', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('a3619c9f834c4fb9990caad94372d9a8', '90abd3e9d4b5424eacb0397dc0fc4e27', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('a769b3a6537e407fa9afc386b7a3ba21', 'ee1a0a7fe7c64ae28922432460d8ae61', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('ae309e97d18944d7858416ddd6146257', '1', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('afa6d2240b6049bdbbb7e5120afeecf7', '1', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('b70f625e2af8483bb6d809746e0e613d', '1', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('b9c36f3f763d4b5dbe2287357d0cf751', '88cdd68a79634437a606a5a3fd12127a', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('bde8097cdc974d34997ad4262bb2ff69', '1', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('be0d8c2be73f41fe9e1881cda8747cb7', 'ee1a0a7fe7c64ae28922432460d8ae61', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('c37586b6a7a14e8e951e60841348166f', '1', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('c569dfe1779b4bfe85519c2867e85cc8', '1', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('c794ee8a4f084befa0476d1d4ec544bd', '1', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('ca5ca55dec3d4c05afec7c2c79a2ba43', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('caa11851ec6d4dbc87ca3f3e68745666', '1', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('cee702315420406c90280f25383602a8', '1', '7780e3fd6cea4ba78d780f33c111d95a');
INSERT INTO `sys_role_menu` VALUES ('cff743617a3d47bbb53ca0481a6b8f6c', '90abd3e9d4b5424eacb0397dc0fc4e27', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('d2c1109d33b941ea8a040744aa2ca7f5', '1', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('d3e2c5a2bd944355911b5b347467f5cc', '1', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('d8036d53c4d54273abac0f06929fbda9', '1', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('df08125ae12247108ff6f68c750c9cb4', '1', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('df2f3fe1fb56411b8b2e81848a1ac1c2', '90abd3e9d4b5424eacb0397dc0fc4e27', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('e0c50ec1e2534f5487982079054c80e1', 'ee1a0a7fe7c64ae28922432460d8ae61', '14');
INSERT INTO `sys_role_menu` VALUES ('e22e2404c276427fa141e4b45bf62e13', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('e6630c61d523416ea3e2281d696981c9', '90abd3e9d4b5424eacb0397dc0fc4e27', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('e76e45a5bd45414ebefeba0239910b5d', '88cdd68a79634437a606a5a3fd12127a', '14');
INSERT INTO `sys_role_menu` VALUES ('e96d5a0daab44fecb6a3a5569ae3f6cc', '1', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('ec1dc4c735f44b5382a8ea028466e23d', '88cdd68a79634437a606a5a3fd12127a', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('f22a90d351104788b64209bde6ffccd8', '1', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('f2d20022adfd46b9983bccfb4256dcfd', '1', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('f36ad2435ec1499083e4d5331fd4319c', '90abd3e9d4b5424eacb0397dc0fc4e27', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('f918d80c915748e98400e6f38d9df990', '90abd3e9d4b5424eacb0397dc0fc4e27', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('fa07286787e34e7186f05e51097fedd2', '90abd3e9d4b5424eacb0397dc0fc4e27', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('fb12156a3c1748fb800d24c8d6fe8e8b', '1', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('fc5d660bb7b842149aba8242c9b81f6e', '1', 'c3adad9112de41a6a2d4cc9fe4a4d94b');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '性别',
  `born` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '生日',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(20) NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0b48e67d856249fb979d63877e95e307', 'test12', 'test12', '$2a$10$ajZ/kQge0/XKEn7.6TbhauwYQT4Vq6nUWj.UBbdten5o2onVhtx1q', NULL, '23', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', NULL, '0', '2018-12-19', '0', 'admin', '2018-12-04 20:47:16', 'admin', '2018-12-04 20:48:13', 0, 'EXAM', '32323', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('1', '测试', 'test9', '$2a$10$7inIxLXYX9I39wu9COLJj.KuJQKsOk5r89O8VRuTdeGN3hHer4Caq', NULL, '23323', 'http://localhost:4000/attachment/download?id=76fe4e3c5c5942639c4b2343cf497955', '3233', '0', '2018-10-05', '0', 'test9', '2018-10-24 10:44:42', 'admin', '2018-12-04 20:42:40', 0, 'EXAM', '3232323', '839a2524aea445bb83a46a0ea03f87ac');
INSERT INTO `sys_user` VALUES ('1025', '测试账号2222', 'test2', '$2a$10$6SognCpa4n3XeopCSJfq..NmCPFla.Teem7Zu5gFAu8nUi/vCx0ly', NULL, '3232', NULL, '3232', '0', '2018-10-30', '0', NULL, NULL, 'admin', '2018-12-04 20:43:35', 0, 'EXAM', 'dddd', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user` VALUES ('1041', '测试d', 'test4', '$2a$10$SiiAXC5zlYzMlUMzYmzCf.JCQcrvRY87RCmaJJD2Ow2/.2HRzIgu2', NULL, '15521089185', NULL, '1633736729@qq.com', '1', '2018-10-31', '0', NULL, NULL, 'admin', '2018-12-04 20:43:47', 0, 'EXAM', '测试账号4', '839a2524aea445bb83a46a0ea03f87ac');
INSERT INTO `sys_user` VALUES ('1042', '测试账号', 'test', '$2a$10$rAedN0Jn6aAOwlI2XaWEEOszgi5t.xrF..7Sl/At6zK8VN9CM38TO', NULL, '15521089185333', NULL, '1633736729@qq.com', '0', '', '1', NULL, NULL, 'admin', '2018-12-04 20:43:29', 0, 'EXAM', 'test', '1e31659224884cbc89022ab4e6ecf70c');
INSERT INTO `sys_user` VALUES ('1043', '测试', 'test6', '$2a$10$NKrQDcg.rd4YaJrg9MPuzemhSkqorQdsIMjGa8ytWmYAj8qtioar2', NULL, 'test6', NULL, '23', '0', '', '0', NULL, NULL, 'admin', '2018-12-04 20:43:23', 0, 'EXAM', '323', '839a2524aea445bb83a46a0ea03f87ac');
INSERT INTO `sys_user` VALUES ('1071', '测试账号', 'test3', '$2a$10$liY3vs6l4aOMDwvQaQ0r7eVC8KmwkfMoBIjYxpamoT/4hieIVsWmO', NULL, 'test3', NULL, '3eeeee', '0', '', '1', NULL, NULL, 'admin', '2018-12-04 20:43:41', 0, 'EXAM', '测试备注', '1e31659224884cbc89022ab4e6ecf70c');
INSERT INTO `sys_user` VALUES ('1076', '测试账号', 'test5', '$2a$10$g8/Yx8Iy8.Py4X4BeTuO6.czmC32rDkRChxueSFk37yO8x7laQ/3q', NULL, '333', NULL, '333', '1', '', '0', NULL, NULL, 'test5', '2018-10-28 15:05:08', 0, '', '333', NULL);
INSERT INTO `sys_user` VALUES ('1099', '测试账号', 'test7', '$2a$10$6t6cVnBMJzcRqCkuRDimau1DvawpZPhMrukaLUGpElSCH5eGbovNq', NULL, '232323', NULL, '32323', '1', '', '0', NULL, NULL, 'admin', '2018-12-04 20:42:53', 0, 'EXAM', '3232332', 'cb38942fba4c438995dee5622d3dfdfa');
INSERT INTO `sys_user` VALUES ('112f64a6ff2a4f019c5c8a0cae47e0a8', '瑶瑶', 'xieyy', '$2a$10$zoIKAKypCGOiuvcn/ZQBN.iLEq42JiF4M4IAV2hq9AZ6hr/Q5OmFO', NULL, '3333', 'http://localhost:4000/attachment/download?id=2d72751214c4412abea18b96d3266681', '888', '0', '2018-10-16', '0', 'admin', '2018-10-31 19:40:23', 'admin', '2018-12-04 20:42:22', 0, 'EXAM', '3333', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$eTOqrN3oKY76eQTIE5ieGOJvOr86V/GVmoEg2lJWUUk5SOWNaMZfi', NULL, '323232323', 'http://localhost:4000/attachment/download?id=7435a9340f584413a96b382c851e777d', '1633736729@qq.com', '1', '2018-10-11', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2018-12-04 20:44:14', 0, 'EXAM', 'ccccc', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('3', '测试账号', 'test8', '$2a$10$f0Jgc.83m6L/yWYtDDFYAuAN1ZP1GIrZOiCmwWnCvWkbXVGmXI4lO', NULL, '323', NULL, '323', '0', '', '0', 'test8', '2018-10-24 09:48:54', 'admin', '2018-12-26 17:57:13', 0, 'EXAM', '323', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user` VALUES ('c19c2458404a49daa94c43ccc63e4522', '谭广宜', 'tangyi', '$2a$10$4F3oitNhYqvxx6bwHpoFpu1HZ2HmLnDgHSRegLA4paNY3VDiY2V7O', NULL, '15521089185', NULL, '16333736729@qq.com', '0', '2018-10-16', '0', 'test9', '2018-10-30 12:53:25', 'admin', '2018-12-04 20:39:30', 0, 'EXAM', 'Java', '4f1ed1353d904ad3837458266de8a080');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('22130ffd442d4f6eb548b0fed8ff5179', '0b48e67d856249fb979d63877e95e307', '88cdd68a79634437a606a5a3fd12127a');
INSERT INTO `sys_user_role` VALUES ('6274b0bf86b74ce9a39fe6a87f121939', '112f64a6ff2a4f019c5c8a0cae47e0a8', '88cdd68a79634437a606a5a3fd12127a');
INSERT INTO `sys_user_role` VALUES ('6a9987684e2b4fc0ac5bde468bd02460', '3', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('abaf262c04d047a2aa1abbcb89e2fd6a', 'c19c2458404a49daa94c43ccc63e4522', '1');
INSERT INTO `sys_user_role` VALUES ('e1eaed03296a4c518a780a50093826d7', '1076', '8ff8a3d10f2a4735bc76fc4485732b05');
INSERT INTO `sys_user_role` VALUES ('eed6ce1fcdc845cd90889861099c91bf', '2', '1');

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strip_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retryable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sensitive_headers_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES ('1', '/auth/**', 'online-exam-auth', NULL, NULL, '1', '1', NULL, 'admin', '2018年9月1日15:50:52', 'admin', '2018年9月1日15:50:58', '0', NULL);
INSERT INTO `sys_zuul_route` VALUES ('2', '/admin/**', 'online-exam-user', NULL, NULL, '1', '1', NULL, 'admin', '2018年9月1日15:51:56', 'admin', '2018年9月1日15:52:02', '0', NULL);
INSERT INTO `sys_zuul_route` VALUES ('3', '/exam/**', 'online-exam-exam', NULL, NULL, '1', '1', NULL, 'admin', '2018年11月10日21:52:33', 'admin', '2018年11月10日21:52:33', '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 07/01/2019 22:51:44
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
INSERT INTO `sys_attachment` VALUES ('036c5732a9124a5db30ea4f4fa6bc483', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzTPaAGH7PAADGqyYhFOI065.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:54:36', 'tangyi', '2019-01-07 20:54:36', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('0c71e81d0f9846febed13be047855ea7', 'response.pdf', '55331', 'group1', 'group1/M00/07/AD/wKgA1VwtutuAJmZtAADYIxj3nOo361.pdf', NULL, NULL, '2', 'admin', '2019-01-03 15:33:52', 'admin', '2019-01-03 15:33:52', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('0d22e24d7f084af4be6f5079155ea65e', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1VvZqBuANBo2AABuc3AaBYU595.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:33', 'admin', '2018-10-31 21:00:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('1483ec9e29ca497388992592c0f23f07', 'dashboard.png', '65177', 'group1', 'group1/M00/07/AC/wKgA1VvbDUuAfg4dAAD-mb4N5hg338.png', NULL, NULL, '0', 'admin', '2018-11-01 22:24:33', 'admin', '2018-11-01 22:24:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('14ee6c489ab94cf8b41eb86ceda3a706', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbEOSAAHAPABbiiFU63Bs86.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:39:53', 'admin', '2018-11-01 22:39:53', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('16169bbaeeb94f558293cf2647f40686', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AB/wKgA1VvZqc2AWC1DAAD-GukB1B8786.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:07:47', 'admin', '2018-10-31 21:07:47', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('19ec4b596e6b4d7e9b7d76da9c1711de', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzTf6AYzooAADGqyYhFOI555.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:59:00', 'tangyi', '2019-01-07 20:59:00', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('1e8dea7f5cad4d2fa01e880dba2187df', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AB/wKgA1Vva-_2AQ6BjAAHfNEwM92Q258.jpg', NULL, NULL, '0', 'admin', '2018-11-01 21:10:42', 'admin', '2018-11-01 21:10:42', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('1f28c322a6d4462597e01fbadd3c657f', '222107.jpg', '755132', 'group1', 'group1/M00/07/AD/wKgA1Vwt2IGAaxI1AAuFvL1TPk0775.jpg', NULL, NULL, '1', 'admin', '2019-01-03 17:40:22', 'admin', '2019-01-03 17:40:22', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2075604edff34772911f4df717a1d807', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwscK-AEDu5AABrSMn9k6k01.docx', NULL, NULL, NULL, 'admin', '2019-01-02 16:05:07', 'admin', '2019-01-02 16:05:07', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('228c3eaa40c74bc4a515b6a290101a4b', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AB/wKgA1VvZqCuAfKHNAAB2nqimI80603.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:50', 'admin', '2018-10-31 21:00:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('23610ba23dec4e108ba89a7b43a59c05', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_ECAX-nlAAD-GukB1B8067.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:11:50', 'admin', '2018-11-01 21:11:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('23d6b732d02348f7b7eaa5d5c6996c4e', '????.xlsx', '10144', 'group1', 'group1/M00/07/AD/wKgA1VwrR3qAKgvoAAAnoGZzE8o73.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 18:53:09', 'admin', '2019-01-01 18:53:09', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('250d2f8d27b2419d9e5235068bfe8819', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwtvkuADrSbAABrSMn9k6k48.docx', NULL, NULL, '2', 'admin', '2019-01-03 15:48:32', 'admin', '2019-01-03 15:48:32', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('251039b94a99473fbec0330d9284685b', '????.xlsx', '10144', 'group1', 'group1/M00/07/AD/wKgA1VwrRvmAXrWjAAAnoGZzE8o82.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 18:51:01', 'admin', '2019-01-01 18:51:01', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2a0d0757124547f3be721d404adcb22d', '4.jpg', '11191', 'group1', 'group1/M00/07/AB/wKgA1VvaiyiACKMtAAArtyMGt8w168.jpg', NULL, NULL, NULL, 'admin', '2018-11-01 13:12:18', 'admin', '2018-11-01 13:12:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2a3517ec160c4e64ba9a8def29f11403', '??.jpg', '3155102', 'group1', 'group1/M00/07/AC/wKgA1VvbDQiAWHdlADAknmGgd48050.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:23:26', 'admin', '2018-11-01 22:23:26', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2bf5aed6c250487bb85178941c0d1247', 'Git版本管理说明.docx', '702846', 'group1', 'group1/M00/07/AD/wKgA1VwwZ1GAQHTlAAq5fhEhFAA03.docx', NULL, NULL, '0', 'admin', '2019-01-05 16:14:13', 'admin', '2019-01-05 16:14:13', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2c30f1f6c8164804a69210c65527ea3f', '??.jpg', '30366', 'group1', 'group1/M00/07/AD/wKgA1VwrXA2AFY-qAAB2nqimI80363.jpg', NULL, NULL, '2', 'admin', '2019-01-01 20:20:57', 'admin', '2019-01-01 20:20:57', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2c7a4fe15b8948ddbc6d8abfa0bdab93', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvbAFqAGpqAAABuc3AaBYU850.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:29:19', 'admin', '2018-11-01 21:29:19', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('2d1061bc7e98464ba6a755a3f7a7f9b5', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva_7KAE0j9AABuc3AaBYU654.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:26:31', 'admin', '2018-11-01 21:26:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('35571c4b0eaf426a9931064d09d986d5', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwtuvaAJ-8PAABrSMn9k6k39.docx', NULL, NULL, '2', 'admin', '2019-01-03 15:34:20', 'admin', '2019-01-03 15:34:20', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('35f17164439046edad2f89b558f2b963', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_6KAFHrCAAD-GukB1B8920.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:26:15', 'admin', '2018-11-01 21:26:15', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('3717fca14b6d42e8856678306771b551', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwrRlyAVHorAADGqyYhFOI853.jpg', NULL, NULL, '2', 'admin', '2019-01-01 18:48:24', 'admin', '2019-01-01 18:48:24', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('372195ec4ee84e7c9840e20b93b33e48', '微信图片_20180815120524.jpg', '9232', 'group1', 'group1/M00/07/AD/wKgA1Vwt2OaACB6ZAAAkEGJcHD4958.jpg', NULL, NULL, '1', 'admin', '2019-01-03 17:42:03', 'admin', '2019-01-03 17:42:03', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('37ac200e245641d3bffe94dc41dd814b', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsbtuAcIM2AABrSMn9k6k24.docx', NULL, NULL, NULL, 'admin', '2019-01-02 15:57:19', 'admin', '2019-01-02 15:57:19', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4012131a531e4aabb61c4e631bd000de', 'WPS云文档接口集成规范.docx', '117192', 'group1', 'group1/M00/07/AD/wKgA1VwwZ3iAGoIJAAHJyDUm6hM27.docx', NULL, NULL, '0', 'admin', '2019-01-05 16:14:52', 'admin', '2019-01-05 16:14:52', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('415978568791464cbd00676666068d78', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsU8uAT7J3AABrSMn9k6k17.docx', NULL, NULL, '0', 'admin', '2019-01-02 14:01:51', 'admin', '2019-01-02 14:01:51', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4327a986afe84a3b87378497ec748ecb', 'Sublime Text Build 3176 x64 Setup.exe', '9142656', 'group1', 'group1/M00/07/AC/wKgA1VvbDfCAUxXRAIuBgFrK3Eo313.exe', NULL, NULL, '0', 'admin', '2018-11-01 22:27:18', 'admin', '2018-11-01 22:27:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('46a494b4adc54b4e949343ff2bd0f2e2', 'dashboard.png', '65177', 'group1', 'group1/M00/07/AC/wKgA1VvbDTWACl0_AAD-mb4N5hg179.png', NULL, NULL, '0', 'admin', '2018-11-01 22:24:11', 'admin', '2018-11-01 22:24:11', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4d576bd024c345e695b5d70d8fe85ba5', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwrXyiASQF6AADGqyYhFOI410.jpg', NULL, NULL, '2', 'admin', '2019-01-01 20:34:12', 'admin', '2019-01-01 20:34:12', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('4fde0977a0bf4a7f95d783e121b89a85', 'mmexport1516892249742.jpg', '198610', 'group1', 'group1/M00/07/AC/wKgA1Vva_SGAMCUlAAMH0hg_LV8101.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:15:34', 'admin', '2018-11-01 21:15:34', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('51141850d3814986bd3674b6e7a9cb3b', 'mmexport1493135572994.jpg', '1647078', 'group1', 'group1/M00/07/AC/wKgA1VvbCyCAYT-7ABkh5rFIM5M694.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:15:18', 'admin', '2018-11-01 22:15:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5279595777dc4b37ae4e0b6901a76f89', 'mmexport1537768301334.jpg', '23366', 'group1', 'group1/M00/07/AC/wKgA1Vva_1-ASyJGAABbRqZlu1A357.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:25:08', 'admin', '2018-11-01 21:25:08', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('554248c16cf449a282561ac492566dbc', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VvbAI-APenNAAD-GukB1B8093.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:30:12', 'admin', '2018-11-01 21:30:12', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5b59ca4f6029412598a27cf8968afbac', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbDvSAPMrYABbiiFU63Bs69.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:31:38', 'admin', '2018-11-01 22:31:38', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('5fb5fb123ece4f8091ebaf6ccc7746f8', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_4uAK_e5AAD-GukB1B8648.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:25:52', 'admin', '2018-11-01 21:25:52', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('610cf8ca09c04584b04b079072d37448', '??.jpg', '3155102', 'group1', 'group1/M00/07/AD/wKgA1VwrXM-Ae6ugADAknmGgd48712.jpg', NULL, NULL, '2', 'admin', '2019-01-01 20:24:11', 'admin', '2019-01-01 20:24:11', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('67548ca46b834834aa965fec7777c250', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwrSReAY_P_AADGqyYhFOI908.jpg', NULL, NULL, '2', 'admin', '2019-01-01 19:00:03', 'admin', '2019-01-01 19:00:03', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6a06423a367949b685ce82f6b5c43023', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1Vwsbu-ARZIjAABrSMn9k6k60.docx', NULL, NULL, NULL, 'admin', '2019-01-02 15:57:39', 'admin', '2019-01-02 15:57:39', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6d240bc6dfe94fb8b05ab2b5dad845a2', '????.xlsx', '10144', 'group1', 'group1/M00/07/AD/wKgA1VwrXcaAU93OAAAnoGZzE8o99.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 20:28:18', 'admin', '2019-01-01 20:28:18', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6f383b0e06414648b4dc8d29474fdf40', 'mmexport1493135572994.jpg', '1647078', 'group1', 'group1/M00/07/AC/wKgA1VvbDXuAQ471ABkh5rFIM5M844.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:25:20', 'admin', '2018-11-01 22:25:20', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('6f62bf730a4244e69c55506cf57e16fd', '??????201805??.xlsx', '57415', 'group1', 'group1/M00/07/AB/wKgA1Vvak2GAflf3AADgR-4m26g77.xlsx', NULL, NULL, '0', 'admin', '2018-11-01 13:47:23', 'admin', '2018-11-01 13:47:23', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('70ed64db368647a696e4d791b962acaa', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva_92AOTEPAABuc3AaBYU363.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:27:15', 'admin', '2018-11-01 21:27:15', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7435a9340f584413a96b382c851e777d', '??.jpg', '30366', 'group1', 'group1/M00/07/AD/wKgA1Vwng2KAb43aAAB2nqimI80731.jpg', NULL, NULL, '1', 'admin', '2018-12-29 22:19:46', 'admin', '2018-12-29 22:19:46', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('75d2478e88ca41b5807b79c27a894c6f', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsWCCATA0HAABrSMn9k6k04.docx', NULL, NULL, NULL, 'admin', '2019-01-02 14:20:20', 'admin', '2019-01-02 14:20:20', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('76fe4e3c5c5942639c4b2343cf497955', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvgO9WADveBAABuc3AaBYU772.jpg', NULL, NULL, '1', 'test9', '2018-11-05 20:44:24', 'test9', '2018-11-05 20:44:24', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7aa76cd8b63749c89de4528288c0dbbb', 'Sublime Text Build 3176 x64 Setup.exe', '9142656', 'group1', 'group1/M00/07/AC/wKgA1VvbDrGAOnpDAIuBgFrK3Eo708.exe', NULL, NULL, '0', 'admin', '2018-11-01 22:30:30', 'admin', '2018-11-01 22:30:30', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7d8aa7588e124d2bab9c591a5cabe477', 'BingWallpaper-2018-08-07.jpg', '422459', 'group1', 'group1/M00/07/AB/wKgA1VvaitWAaQH-AAZyO6JWPnQ175.jpg', NULL, NULL, NULL, 'admin', '2018-11-01 13:10:55', 'admin', '2018-11-01 13:10:55', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7dc9b8fc78184908a8e3bfdf3eee710b', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VvqxPWARR2OAAD-GukB1B8724.jpg', NULL, NULL, '1', 'admin', '2018-11-13 20:31:59', 'admin', '2018-11-13 20:31:59', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7faabf7c11684779bdcbc4645b7459c7', 'mmexport1537416674194.jpg', '44592', 'group1', 'group1/M00/07/AC/wKgA1Vva_TCAUCn2AACuMBSjzzg215.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:15:49', 'admin', '2018-11-01 21:15:49', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('7fbb9a8ae0e94ac29acf3b5f6f0842b7', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1Vwsc-KABW-1AABrSMn9k6k20.docx', NULL, NULL, NULL, 'admin', '2019-01-02 16:18:47', 'admin', '2019-01-02 16:18:47', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('814bf12930c441ceb733fe198d4b7c56', '????_20181003142934.jpg', '24150', 'group1', 'group1/M00/07/AB/wKgA1Vvakj2AadqjAABeVr16Sxc373.jpg', NULL, NULL, '0', 'admin', '2018-11-01 13:42:31', 'admin', '2018-11-01 13:42:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('8408edd49c834b3499c8ec2133a73673', '????.xlsx', '10144', 'group1', 'group1/M00/07/AD/wKgA1VwrXC-AJfTlAAAnoGZzE8o61.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 20:21:31', 'admin', '2019-01-01 20:21:31', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('8543d3c8ffb848219d4e1231fb9636c1', '????20190101022351005.xlsx', '3881', 'group1', 'group1/M00/07/AD/wKgA1VwrXs-AEI3wAAAPKcLHesg10.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 20:32:43', 'admin', '2019-01-01 20:32:43', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('85d1b6cced0542998e347f7ca93954d5', 'ShtermClient-2.1.12.exe', '1852364', 'group1', 'group1/M00/07/AB/wKgA1Vvakr2Af6Y5ABxDzLZVMEM911.exe', NULL, NULL, '0', 'admin', '2018-11-01 13:44:40', 'admin', '2018-11-01 13:44:40', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('87796a6928474f029f2da2c63bb7cb25', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzS9qABlgIAADGqyYhFOI745.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:49:52', 'tangyi', '2019-01-07 20:49:52', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('87cc6ffb516d4921a301f89ba82e57b7', '??.jpg', '3155102', 'group1', 'group1/M00/07/AD/wKgA1VwrRtqAcQZZADAknmGgd48294.jpg', NULL, NULL, '2', 'admin', '2019-01-01 18:50:30', 'admin', '2019-01-01 18:50:30', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('88df5ebcae554fcea51ad35ea3f81e07', 'mmexport1498206654197.jpg', '150375', 'group1', 'group1/M00/07/AC/wKgA1VvbDaiAO8pdAAJLZyi9s88765.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:26:05', 'admin', '2018-11-01 22:26:05', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('88eb6804420e4850b8502ae4455c4e10', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwscKmAKpAZAABrSMn9k6k88.docx', NULL, NULL, NULL, 'admin', '2019-01-02 16:05:02', 'admin', '2019-01-02 16:05:02', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('8c35383b7b8a42de9b508a64c0031598', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwrRe6AKpIoAADGqyYhFOI880.jpg', NULL, NULL, '', 'admin', '2019-01-01 18:46:34', 'admin', '2019-01-01 18:46:34', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('8fbfd861b58b4b15803005945bed21a9', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1Vva-_SAJKmKAABuc3AaBYU404.jpg', NULL, NULL, '0', 'admin', '2018-11-01 21:10:33', 'admin', '2018-11-01 21:10:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('90cbda2b934c4900b91820b8a248e03e', 'mmexport1469017935973.jpg', '30366', 'group1', 'group1/M00/07/AC/wKgA1VvbCwWAXUxJAAB2nqimI80604.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:14:51', 'admin', '2018-11-01 22:14:51', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('90cbde0e5e634e2baeb5ecedddb4927b', '198529.jpg', '215588', 'group1', 'group1/M00/07/AD/wKgA1Vwt2HeAYtuVAANKJMJxVwc923.jpg', NULL, NULL, '1', 'admin', '2019-01-03 17:40:13', 'admin', '2019-01-03 17:40:13', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9237a099c42942e9bcb5bc3a5fffdb43', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsVJiAVLHiAABrSMn9k6k97.docx', NULL, NULL, '0', 'admin', '2019-01-02 14:05:17', 'admin', '2019-01-02 14:05:17', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('956f05d897584731bc61377cbbaff164', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwrYFGAb3gEAADGqyYhFOI265.jpg', NULL, NULL, '2', 'admin', '2019-01-01 20:39:09', 'admin', '2019-01-01 20:39:09', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('97c7127b91d94f16aa9d9081d9587153', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwtvimAJPHSAABrSMn9k6k26.docx', NULL, NULL, NULL, 'admin', '2019-01-03 15:47:58', 'admin', '2019-01-03 15:47:58', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('996bcf8084c248798c7e19c4b7697572', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsV4qAMqQ4AABrSMn9k6k98.docx', NULL, NULL, NULL, NULL, '2019-01-02 14:17:50', NULL, '2019-01-02 14:17:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9b589f544a174de690667fac05a444b8', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1Vva__mAKW3GAABuc3AaBYU071.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:27:42', 'admin', '2018-11-01 21:27:42', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9b7f0e7264b84284a04f96e756d799de', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzTiWAPbLNAADGqyYhFOI320.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:59:38', 'tangyi', '2019-01-07 20:59:38', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9c33df5d5925481990051acb6d9f4959', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwscLGAMeU1AABrSMn9k6k28.docx', NULL, NULL, NULL, 'admin', '2019-01-02 16:05:09', 'admin', '2019-01-02 16:05:09', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9e28bae3db7c43668f8d4372588d9e41', 'mmexport1537768301334.jpg', '23366', 'group1', 'group1/M00/07/AC/wKgA1VvbEWKAWA3JAABbRqZlu1A578.jpg', NULL, NULL, '1', 'admin', '2018-11-01 22:41:59', 'admin', '2018-11-01 22:41:59', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9f549f5afa34488a9fe330305b6e50e7', 'PageOfficeControl 中的文档.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsdEeAG1MsAABrSMn9k6k96.docx', NULL, NULL, '0', 'admin', '2019-01-02 16:20:28', 'admin', '2019-01-02 16:20:28', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9f72b55e72714c2a9537dec0cbc41736', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1Vva_G-AK_2tAAD-GukB1B8914.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:12:36', 'admin', '2018-11-01 21:12:36', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('9fb9983cddeb45ff81d41282c9c69ed3', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AC/wKgA1VvbAIGAHWtNAABuc3AaBYU595.jpg', NULL, NULL, '1', 'admin', '2018-11-01 21:29:58', 'admin', '2018-11-01 21:29:58', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('a183e34575f64cccb9a4ad77bda4efa5', '????20190101024223953.xlsx', '5332', 'group1', 'group1/M00/07/AD/wKgA1VwrZbeAPXbqAAAU1MM1q5E88.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 21:02:11', 'admin', '2019-01-01 21:02:11', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('a4eb91f7ffda44d399b17192d9763c18', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzTROAECP3AADGqyYhFOI383.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:55:04', 'tangyi', '2019-01-07 20:55:04', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('aa5e78c9301d4230936674021caa4a88', '????????.pdf', '1049029', 'group1', 'group1/M00/07/AC/wKgA1VvbDyyAKK37ABABxd3i7-M414.pdf', NULL, NULL, '0', 'admin', '2018-11-01 22:32:33', 'admin', '2018-11-01 22:32:33', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('ab032fae6a814f57be9910ebdd721f77', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsVWyAXe6oAABrSMn9k6k31.docx', NULL, NULL, '0', 'admin', '2019-01-02 14:08:49', 'admin', '2019-01-02 14:08:49', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('ae118355bd1141c9bb30a3ba2e667009', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwsVQSAa2ZiAABrSMn9k6k10.docx', NULL, NULL, '0', 'admin', '2019-01-02 14:07:04', 'admin', '2019-01-02 14:07:04', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b360d492a0d94e94ba67ea52f5f80438', '??????.mobi', '1499784', 'group1', 'group1/M00/07/AC/wKgA1VvbDw-ASdm2ABbiiFU63Bs03.mobi', NULL, NULL, '0', 'admin', '2018-11-01 22:32:05', 'admin', '2018-11-01 22:32:05', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b3f657a1cd274bae8163624bf27ac813', 'hdImg_624beb298a54895760501c95a368f2121539400955845.jpg', '65050', 'group1', 'group1/M00/07/AC/wKgA1VveW06ADW3YAAD-GukB1B8372.jpg', NULL, NULL, '1', 'tangyi', '2018-11-04 10:34:10', 'tangyi', '2018-11-04 10:34:10', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('b41860ae127f4994a4a961c39fa16125', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AC/wKgA1VvbDW-AMFtHAAHfNEwM92Q032.jpg', NULL, NULL, '0', 'admin', '2018-11-01 22:25:09', 'admin', '2018-11-01 22:25:09', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('bbd82babb8f44e1983c0f4a13e3d6111', 'hdImg_36277d656ccc8571efff6f4a88f82a1e1475567290714.jpg', '28275', 'group1', 'group1/M00/07/AB/wKgA1VvZnQ-AVZCtAABuc3AaBYU378.jpg', NULL, NULL, '1', 'admin', '2018-10-31 20:13:26', 'admin', '2018-10-31 20:13:26', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('be0bcd8c95654492937d1b374b6d2718', '????20190101024223953.xlsx', '5332', 'group1', 'group1/M00/07/AD/wKgA1VwrY8OAdYBPAAAU1MM1q5E01.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 20:53:52', 'admin', '2019-01-01 20:53:52', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('bf7b5e4b448d4200b1e8d557f15c92a6', '简易.jpg', '30366', 'group1', 'group1/M00/07/AD/wKgA1VwvZyyAJgFpAAB2nqimI80250.jpg', NULL, NULL, '1', 'admin', '2019-01-04 21:57:25', 'admin', '2019-01-04 21:57:25', '0', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('c3148765b9144c99b3b71c9b404c0150', 'header.jpg', '50859', 'group1', 'group1/M00/07/AC/wKgA1VwNE1uAKC9rAADGqyYhFOI648.jpg', NULL, NULL, '0', 'admin', '2018-12-09 21:03:08', 'admin', '2018-12-09 21:03:08', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('c893eac1064548b0922ec644e76a239c', 'PageOfficeControl ????.docx', '27464', 'group1', 'group1/M00/07/AD/wKgA1VwscJ2AbziqAABrSMn9k6k48.docx', NULL, NULL, NULL, 'admin', '2019-01-02 16:04:50', 'admin', '2019-01-02 16:04:50', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('cb8c9f63d4ff4f0985f77457a819e5a5', 'mmexport1464577959480.jpg', '122676', 'group1', 'group1/M00/07/AB/wKgA1VvZqDSAOOxYAAHfNEwM92Q909.jpg', NULL, NULL, '1', 'admin', '2018-10-31 21:00:58', 'admin', '2018-10-31 21:00:58', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('cd7eeb23c91e4eb4b42ff715c53c0561', '????_20180815120524.jpg', '9232', 'group1', 'group1/M00/07/AD/wKgA1Vwt2JuAJpa1AAAkEGJcHD4263.jpg', NULL, NULL, '1', 'admin', '2019-01-03 17:40:48', 'admin', '2019-01-03 17:40:48', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('d27f35e9bcf64ad1b240162112e8b1b0', '????20190101024223953.xlsx', '5332', 'group1', 'group1/M00/07/AD/wKgA1VwrSI2ARVFLAAAU1MM1q5E19.xlsx', NULL, NULL, '2', 'admin', '2019-01-01 18:57:45', 'admin', '2019-01-01 18:57:45', '1', 'EXAM');
INSERT INTO `sys_attachment` VALUES ('d7c1db6550bf4f64a988484c85257986', 'header.jpg', '50859', 'group1', 'group1/M00/07/AD/wKgA1VwzThSAfrTYAADGqyYhFOI353.jpg', NULL, NULL, '1', 'tangyi', '2019-01-07 20:59:22', 'tangyi', '2019-01-07 20:59:22', '0', 'EXAM');
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
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES ('095bb0644ab14d97b31418f87e1cf823', '导出菜单', 'sys:menu:export', NULL, '3', '', '34', '1', 'admin', '2018-11-28 19:07:02', 'admin', '2018-11-28 19:07:02', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0dc80492cf414db984d825fdd842e022', '新增用户', 'sys:user:add', NULL, '4', 'example', '1', '1', '', '2018-10-28 16:38:57', 'admin', '2018-11-04 10:20:38', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0ee02b8dc3064fcd972f527c31aad5a7', '修改菜单', 'sys:menu:edit', NULL, '3', 'example', '4', '1', '', '2018-10-28 16:46:38', 'admin', '2018-11-04 10:21:23', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0fe1156ec9e24dd4bc2c663c665a5048', '导出用户', 'sys:user:export', NULL, '4', '', '33', '1', 'admin', '2018-11-27 12:05:03', 'admin', '2018-11-27 12:05:03', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'sys', '/admin/sys/**', '-1', 'component', '1', '0', '1', '1', 'admin', '2018-11-06 23:23:35', '0', '1', 'Layout', '/sys', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('13f925e8559c43aa8ef33a8e1e3f9b4d', '知识库', 'exam:knowledge', '/exam/knowledge/**', 'b93eba1199b6420a82d285a8919bcd23', '', '5', '0', 'admin', '2019-01-01 14:55:31', 'admin', '2019-01-01 14:55:31', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('14', '个人管理', 'personal', '/admin/personal/**', '-1', 'form', '30', '0', '', '2018-10-28 16:12:34', 'admin', '2018-10-30 14:42:17', '0', '', 'Layout', '/personal', NULL, '个人管理');
INSERT INTO `sys_menu` VALUES ('15', '附件管理', 'attachment', '/admin/attachment/**', '-1', 'excel', '10', '0', 'admin', '2018-10-30 19:48:36', 'admin', '2018-10-30 20:31:21', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理');
INSERT INTO `sys_menu` VALUES ('1717eabc03174c2e9bdaf27c5a5697dd', '题库管理', 'exam:subject', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '3', '0', 'admin', '2018-12-04 21:33:40', 'admin', '2018-12-04 21:33:40', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理');
INSERT INTO `sys_menu` VALUES ('1b68d41bfcc3441f839188a9d7b6ead0', '接口文档', 'monitor:document', '/monitor/document/**', '7', '', '32', '0', 'admin', '2018-10-30 15:06:08', 'admin', '2019-01-04 22:05:24', '0', 'EXAM', '', 'http://localhost:9999/swagger-ui.html', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1e6a90e57df541e0973691c17d44564c', '日志监控', 'monitor:log', '/admin/log/**', '7', '', '30', '0', 'admin', '2018-10-30 15:00:25', 'admin', '2018-11-06 23:34:19', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控');
INSERT INTO `sys_menu` VALUES ('23df3c2475504ca781e25c3443d7ad25', '修改课程', 'exam:course:edit', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '2', '1', 'admin', '2018-11-10 22:44:28', 'admin', '2018-11-10 22:44:28', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2a232ac9f43146a49ab5a19226e76742', '删除部门', 'sys:dept:del', NULL, '6', 'example', '3', '1', '', '2018-10-28 16:43:19', 'admin', '2018-11-04 10:20:22', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', 'sys:menu', '/admin/menu/**', '1', '', '10', '0', '1', '1', 'admin', '2018-11-06 23:34:12', '0', '1', 'views/sys/menu', 'menu', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34371d1e990549f0b633389bdf64ce0f', '修改题目分类', 'exam:subject:category:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '5', '1', 'admin', '2018-12-04 21:36:34', 'admin', '2018-12-04 21:36:34', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('347d24c6e1cf42eaa976c91f5607007a', '新增部门', 'sys:dept:add', NULL, '6', 'example', '1', '1', '', '2018-10-28 16:42:40', 'admin', '2018-11-04 10:20:15', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34ffa24d3c124902893e601fe8e22b08', '服务监控', 'monitor:service', '/admin/monitor/service/**', '7', '', '31', '0', 'admin', '2018-10-30 15:01:17', 'admin', '2018-11-07 12:54:16', '0', 'EXAM', '', 'http://localhost:8765/', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('36cca77232f3487cbee02bb68ae12652', '新增菜单', 'sys:menu:add', NULL, '3', 'example', '1', '1', '', '2018-10-28 16:45:45', 'admin', '2018-11-04 10:21:06', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3a64f8a80dce4f6c8bc4483f0230f49f', '导入用户', 'sys:user:import', NULL, '4', '', '34', '1', 'admin', '2018-11-27 12:05:29', 'admin', '2018-11-27 12:05:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3bb2fec1ba094584aa1a984ec1f05dc7', '删除课程', 'exam:course:del', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '3', '1', 'admin', '2018-11-10 22:44:53', 'admin', '2018-11-10 22:44:53', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'sys:user', '/admin/user/**', '1', '', '2', '0', '1', '1', 'admin', '2018-11-06 23:33:55', '0', '1', 'views/sys/user', 'user', '', '用户管理');
INSERT INTO `sys_menu` VALUES ('42c69128d30a4242b08ef0003da68528', '修改角色', 'sys:role:edit', NULL, '5', 'example', '4', '1', '', '2018-10-28 16:45:11', 'admin', '2018-11-04 10:19:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('451605025d9a4715b4ae78f5a5d01fea', '删除题目分类', 'exam:subject:category:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '6', '1', 'admin', '2018-12-04 21:36:55', 'admin', '2018-12-04 21:36:55', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4f3e874dc310463a82e3b650fd851fdb', '修改密码', 'personal:password', '/admin/user/updateInfo', '14', '', '30', '0', 'admin', '2018-10-29 21:59:03', 'admin', '2018-11-06 23:34:47', '0', 'EXAM', 'views/personal/password', 'password', NULL, '密码修改');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', 'sys:role', '/admin/role/**', '1', '', '9', '0', '1', '1', 'admin', '2018-11-06 23:34:06', '0', '1', 'views/sys/role', 'role', '', NULL);
INSERT INTO `sys_menu` VALUES ('530f933da3824e1f9bf3182794141e9e', '删除题目', 'exam:subject:bank:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '3', '1', 'admin', '2018-12-04 21:35:13', 'admin', '2018-12-09 20:36:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('594e7afda95c42e6af2046f1bfe81c53', '删除日志', 'monitor:log:del', NULL, '1e6a90e57df541e0973691c17d44564c', '', '30', '1', 'admin', '2019-01-07 22:15:02', 'admin', '2019-01-07 22:15:02', '0', 'EXAM', NULL, NULL, NULL, '删除日志');
INSERT INTO `sys_menu` VALUES ('5ba624643cd34ec3b78ca622964c0f8a', '修改题目', 'exam:subject:bank:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '2', '1', 'admin', '2018-12-04 21:34:50', 'admin', '2018-12-09 20:35:58', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6', '部门管理', 'sys:dept', '/admin/dept/**', '1', '', '8', '0', '1', '1', 'admin', '2018-11-06 23:34:00', '0', '1', 'views/sys/dept', 'dept', '', NULL);
INSERT INTO `sys_menu` VALUES ('63f039ea5bcf4208978150b59484a429', '考试管理', 'exam:exam', '/exam/exam/**', 'b93eba1199b6420a82d285a8919bcd23', '', '2', '0', 'admin', '2018-11-10 22:22:42', 'admin', '2018-11-10 22:22:42', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理');
INSERT INTO `sys_menu` VALUES ('657026922f494801a41b64f40e63fca6', '删除考试', 'exam:exam:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '3', '1', 'admin', '2018-11-10 22:46:12', 'admin', '2018-11-10 22:46:12', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('69a2a85608064762a3d76fc0c92072cc', '新增题目分类', 'exam:subject:category:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '4', '1', 'admin', '2018-12-04 21:35:59', 'admin', '2018-12-04 21:35:59', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6f605148282b4949b5c96e2877dc9052', '题目管理', 'exam:exam:subject', NULL, '63f039ea5bcf4208978150b59484a429', '', '4', '1', 'admin', '2018-11-13 20:50:07', 'admin', '2018-11-13 20:50:41', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'sys', '/admin/monitor/**', '-1', 'chart', '7', '0', '1', '1', 'admin', '2019-01-05 16:19:56', '0', '1', 'Layout', '/monitor', '', NULL);
INSERT INTO `sys_menu` VALUES ('71e5179363bc4e119a87daaa631a2712', '导入题目', 'exam:exam:subject:import', NULL, '63f039ea5bcf4208978150b59484a429', '', '36', '1', 'admin', '2018-11-27 12:06:45', 'admin', '2018-11-27 12:06:45', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('72de30896d3a401eb62edc0aa6fbf190', '导出成绩', 'exam:score:export', NULL, 'c3adad9112de41a6a2d4cc9fe4a4d94b', '', '30', '1', 'admin', '2018-12-30 22:12:20', 'admin', '2018-12-30 22:12:20', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7780e3fd6cea4ba78d780f33c111d95a', '导入菜单', 'sys:menu:import', NULL, '3', '', '35', '1', 'admin', '2018-11-28 19:07:20', 'admin', '2018-11-28 19:07:20', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7f78172c09d3408dab1534d26b608b31', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 'admin', '2018-11-06 23:26:57', 'admin', '2019-01-03 17:59:53', '0', 'EXAM', 'views/dashboard/index', '/dashboard', '', '首页');
INSERT INTO `sys_menu` VALUES ('8aefee22294d47d7a3e4a29ae5ced4b4', '个人资料', 'personal:message', '/admin/user/updateInfo', '14', '', '29', '0', 'admin', '2018-10-29 21:58:32', 'admin', '2018-11-06 23:34:41', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料');
INSERT INTO `sys_menu` VALUES ('8b67ccbe89f74b728e58c2e4a4795027', '删除菜单', 'sys:menu:del', NULL, '3', 'example', '3', '1', '', '2018-10-28 16:46:23', 'admin', '2018-11-04 10:21:14', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8bcf03f73377412b981572517b9055e0', '删除题目', 'exam:exam:subject:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '38', '1', 'admin', '2018-11-29 14:11:24', 'admin', '2018-11-29 14:11:24', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('901959fd37df4f7d90adaa4ab6c4b331', '分配权限', 'sys:role:auth', NULL, '5', '', '30', '1', 'admin', '2018-11-04 10:19:32', 'admin', '2018-11-04 10:19:32', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('91861ef795ab4fc4a207567606fa62cc', '修改用户', 'sys:user:edit', NULL, '4', 'example', '4', '1', '', '2018-10-28 16:40:19', 'admin', '2018-11-04 10:20:54', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c0846685bb24aafae731bdacf879ba2', '删除角色', 'sys:role:del', NULL, '5', 'example', '3', '1', '', '2018-10-28 16:44:56', 'admin', '2018-11-04 10:20:01', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c2e04eab32c467f87d89ad0a2b4892c', '导出题目', 'exam:subject:bank:export', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '32', '1', 'admin', '2018-12-09 20:38:06', 'admin', '2018-12-09 20:38:06', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a398216ac2f14c16928452483786329e', '新增题目', 'exam:subject:bank:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '1', '1', 'admin', '2018-12-04 21:34:29', 'admin', '2018-12-09 20:35:18', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a663e71f7b8441b0b8363ae5eb20bbb3', '修改部门', 'sys:dept:edit', NULL, '6', 'example', '4', '1', '', '2018-10-28 16:43:38', 'admin', '2018-11-04 10:20:30', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ac6768a097184c99ada64810a897f727', '新增考试', 'exam:exam:add', NULL, '63f039ea5bcf4208978150b59484a429', '', '1', '1', 'admin', '2018-11-10 22:45:29', 'admin', '2018-11-10 22:45:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b85dda1e623e48e4ae82dc228df3edfe', '新增课程', 'exam:course:add', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '1', '1', 'admin', '2018-11-10 22:44:05', 'admin', '2018-11-10 22:44:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b8969a3731b0405e82d0bb896e13841e', '课程管理', 'exam:course', '/exam/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '1', '0', 'admin', '2018-11-10 22:21:58', 'admin', '2018-11-10 22:27:03', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理');
INSERT INTO `sys_menu` VALUES ('b93eba1199b6420a82d285a8919bcd23', '考务管理', 'exam', '/exam/**', '-1', 'nested', '8', '0', 'admin', '2018-11-10 22:20:10', 'admin', '2018-11-10 22:20:10', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理');
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
INSERT INTO `sys_role_menu` VALUES ('09907f17e5cd48f3bd45a8f86384d58f', '1', '8b67ccbe89f74b728e58c2e4a4795027');
INSERT INTO `sys_role_menu` VALUES ('0a4c233d1edc4264b5d8eca1c052885b', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('1014f3115a714298a9fcc45987d4760a', '1', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('11b4c98e8e3a404296fd9e4ee6115cb3', '1', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('11ecfaf5f08e417ebfb7530c9ac3206d', '88cdd68a79634437a606a5a3fd12127a', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('154a886c566c4f738d2fe269989f9d14', '1', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('1f0e0f06618c47e2bbaee489a3c817bc', '88cdd68a79634437a606a5a3fd12127a', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('205f752ce23e40ef8b698bcca9897831', '1', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('25701367d18a48839d73f75c914915a6', '1', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('2850296add824392aec0fcb67262933b', '1', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('2931a5d6872848f59d799892ddb51cd7', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2c251789c23f43ceac7e3c6616b75e0a', '1', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('2d59143f5dcf49d5b7a211723c1157bc', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('304d8c3e6a71411e9a6e3abbece781e2', 'ee1a0a7fe7c64ae28922432460d8ae61', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('314d5b11b46d479d971325b5baeb76d4', '1', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('31b21273af334b7cbaf2cdbe9c7597c5', '1', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('32f3f8460a944a9f9ebca3cf2bf395f1', '90abd3e9d4b5424eacb0397dc0fc4e27', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('37f38281e0684a39b4b0e34c8c2f0cbc', '1', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('387d1eadb16d40f7ac6908214846eb69', '1', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('39d7e9f69f45445c8a6175c68febf48a', '1', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('3b23d66468de40a693627116b3f8dfef', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('3cfcd844d99d4e76bc7eee00e87d8002', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('3e2ecb5b77a9482d8145c15ad0fbb7f0', '8ff8a3d10f2a4735bc76fc4485732b05', '14');
INSERT INTO `sys_role_menu` VALUES ('3ece9860006147eca9564d123c2801ed', '1', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('4706859a5b6643e7ae8fdb9470a8a068', '1', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('59bb0daf23374ac28c697a0ad57e484e', '1', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('6253b98f9d6942f99c1a5b1339f53d60', '1', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('6400a4348f6d42ea94699852337f4d65', '88cdd68a79634437a606a5a3fd12127a', '7');
INSERT INTO `sys_role_menu` VALUES ('6625e55f4c64468fb3c57314166c27ec', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('678dae0eb1ff47428391dc8047544122', '1', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('681ae4c29a01435881cc6d70e6f4b1fc', '1', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('698fff0a9ae542099b6fb0e0d312d894', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('6b45ba72d6e4438eacfd5028de4bb0a4', '1', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('6f36fdcc900a4e17b4642a7c80ab8517', '1', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('78b87421f8234fe2a686f78f1ea0a6b9', '1', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('78e08e378492477795321dadb429af06', '1', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('7a6c9880907c40a49f79c1c6d6ba6453', '1', '594e7afda95c42e6af2046f1bfe81c53');
INSERT INTO `sys_role_menu` VALUES ('7c8799fc814f4e7e9a038cd6857752db', '1', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('7de2c0f27db7463abc81e3fb8f9b5ec5', '1', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('7fb840b1513643de8ceaf296225fbe98', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('80b30d6a48cb40d2b07cf262032775f8', '1', '7780e3fd6cea4ba78d780f33c111d95a');
INSERT INTO `sys_role_menu` VALUES ('81747137eb9d4504ac758c81bfdd55b0', '90abd3e9d4b5424eacb0397dc0fc4e27', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('81df689a3e7e47b49b90370ea308fdfc', '1', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('89468cd19e904cd6b0c2537a40dd6b7a', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('89c9c98495cd4c58bfa5b5c986c46b42', '1', '095bb0644ab14d97b31418f87e1cf823');
INSERT INTO `sys_role_menu` VALUES ('8b7565b5f5c04af0a3c581f98b291971', '1', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('8df593d6d4b84cae9acf9f41cc84c2ba', '1', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('8e89d098096e41a69e233f6458057d43', '90abd3e9d4b5424eacb0397dc0fc4e27', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('8ef88bc7dc1e4690bef1105c010055d6', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('a1ba805b921d4f8ca9b9827df6298778', '1', 'ee35a2abc0b04f3bb70527a7f79806e8');
INSERT INTO `sys_role_menu` VALUES ('a35f12b05b9944178b4ca40582bd8656', '88cdd68a79634437a606a5a3fd12127a', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('a3619c9f834c4fb9990caad94372d9a8', '90abd3e9d4b5424eacb0397dc0fc4e27', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('a769b3a6537e407fa9afc386b7a3ba21', 'ee1a0a7fe7c64ae28922432460d8ae61', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('aa801840720a45538e52467d8847563f', '1', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('b9c36f3f763d4b5dbe2287357d0cf751', '88cdd68a79634437a606a5a3fd12127a', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('bd38682b8e074fd2810bd083254453b3', '1', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('bda350d465e84262852c54f41288362f', '1', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('be0d8c2be73f41fe9e1881cda8747cb7', 'ee1a0a7fe7c64ae28922432460d8ae61', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('c08acd75b4474872ad504569c0a9c0a6', '1', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('c08c271fc26845739bee2a6de8a0b207', '1', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('c282a016ebc441dfb403b8e8a06a59be', '1', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('c39f0aa183454213afbdc9c838bbac15', '1', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('c912fee809884ea88c8f3f42a63e5422', '1', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('cd0d6894ff1e4f8393df896d90ce98a9', '1', '901959fd37df4f7d90adaa4ab6c4b331');
INSERT INTO `sys_role_menu` VALUES ('cff743617a3d47bbb53ca0481a6b8f6c', '90abd3e9d4b5424eacb0397dc0fc4e27', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('d8315acce6844d42b1523f6ee47c2562', '1', '2a232ac9f43146a49ab5a19226e76742');
INSERT INTO `sys_role_menu` VALUES ('d90c664de54245959f1d6d4df8d26885', '1', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('d9a96fac5f844fa18165c868ede1aac3', '1', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('dd326125866b4c828f1dcdf6f887b56f', '1', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('dd5cdc1799164144b126e54bb890cec6', '1', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('df04390e6d3744dbb7556b1a55c190f4', '1', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('df2f3fe1fb56411b8b2e81848a1ac1c2', '90abd3e9d4b5424eacb0397dc0fc4e27', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('e01d8bab578d4c9b8b5c3944fdf778e0', '1', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('e0c50ec1e2534f5487982079054c80e1', 'ee1a0a7fe7c64ae28922432460d8ae61', '14');
INSERT INTO `sys_role_menu` VALUES ('e22e2404c276427fa141e4b45bf62e13', '90abd3e9d4b5424eacb0397dc0fc4e27', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('e26e0f4076264e22824aa461d457f242', '1', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('e2e83ba006984f3f9c14b9c18a3ddb71', '1', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('e6630c61d523416ea3e2281d696981c9', '90abd3e9d4b5424eacb0397dc0fc4e27', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('e76e45a5bd45414ebefeba0239910b5d', '88cdd68a79634437a606a5a3fd12127a', '14');
INSERT INTO `sys_role_menu` VALUES ('ec1dc4c735f44b5382a8ea028466e23d', '88cdd68a79634437a606a5a3fd12127a', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('f36ad2435ec1499083e4d5331fd4319c', '90abd3e9d4b5424eacb0397dc0fc4e27', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('f6eb0e227c0041cc995bcfedb7bce8ff', '1', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('f82db21da6a24f73bcf700526b113b62', '1', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('f918d80c915748e98400e6f38d9df990', '90abd3e9d4b5424eacb0397dc0fc4e27', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('fa07286787e34e7186f05e51097fedd2', '90abd3e9d4b5424eacb0397dc0fc4e27', '7f78172c09d3408dab1534d26b608b31');

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
INSERT INTO `sys_user` VALUES ('1043', '测试', 'test6', '$2a$10$NKrQDcg.rd4YaJrg9MPuzemhSkqorQdsIMjGa8ytWmYAj8qtioar2', NULL, 'test6', NULL, '23', '0', '', '0', NULL, NULL, 'admin', '2018-12-04 20:43:23', 1, 'EXAM', '323', '839a2524aea445bb83a46a0ea03f87ac');
INSERT INTO `sys_user` VALUES ('1071', '测试账号', 'test3', '$2a$10$liY3vs6l4aOMDwvQaQ0r7eVC8KmwkfMoBIjYxpamoT/4hieIVsWmO', NULL, 'test3', NULL, '3eeeee', '0', '', '1', NULL, NULL, 'admin', '2018-12-04 20:43:41', 0, 'EXAM', '测试备注', '1e31659224884cbc89022ab4e6ecf70c');
INSERT INTO `sys_user` VALUES ('1076', '测试账号', 'test5', '$2a$10$g8/Yx8Iy8.Py4X4BeTuO6.czmC32rDkRChxueSFk37yO8x7laQ/3q', NULL, '333', NULL, '333', '1', '', '0', NULL, NULL, 'test5', '2018-10-28 15:05:08', 0, '', '333', NULL);
INSERT INTO `sys_user` VALUES ('1099', '测试账号', 'test7', '$2a$10$6t6cVnBMJzcRqCkuRDimau1DvawpZPhMrukaLUGpElSCH5eGbovNq', NULL, '232323', NULL, '32323', '1', '', '0', NULL, NULL, 'admin', '2018-12-04 20:42:53', 1, 'EXAM', '3232332', 'cb38942fba4c438995dee5622d3dfdfa');
INSERT INTO `sys_user` VALUES ('112f64a6ff2a4f019c5c8a0cae47e0a8', '瑶瑶', 'xieyy', '$2a$10$zoIKAKypCGOiuvcn/ZQBN.iLEq42JiF4M4IAV2hq9AZ6hr/Q5OmFO', NULL, '3333', 'http://localhost:4000/attachment/download?id=2d72751214c4412abea18b96d3266681', '888', '0', '2018-10-16', '0', 'admin', '2018-10-31 19:40:23', 'admin', '2018-12-04 20:42:22', 0, 'EXAM', '3333', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$eTOqrN3oKY76eQTIE5ieGOJvOr86V/GVmoEg2lJWUUk5SOWNaMZfi', NULL, '323232323', 'http://localhost:4000/attachment/download?id=bf7b5e4b448d4200b1e8d557f15c92a6', '1633736729@qq.com', '1', '2018-10-11', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2018-12-04 20:44:14', 0, 'EXAM', 'ccccc', '4f1ed1353d904ad3837458266de8a080');
INSERT INTO `sys_user` VALUES ('3', '测试账号', 'test8', '$2a$10$f0Jgc.83m6L/yWYtDDFYAuAN1ZP1GIrZOiCmwWnCvWkbXVGmXI4lO', NULL, '323', NULL, '323', '0', '', '0', 'test8', '2018-10-24 09:48:54', 'admin', '2018-12-26 17:57:13', 1, 'EXAM', '323', '2d0b1e08677d45bc8cee3db44774abf6');
INSERT INTO `sys_user` VALUES ('c19c2458404a49daa94c43ccc63e4522', '谭广宜', 'tangyi', '$2a$10$4F3oitNhYqvxx6bwHpoFpu1HZ2HmLnDgHSRegLA4paNY3VDiY2V7O', NULL, '15521089185', 'http://localhost:4000/attachment/download?id=9b7f0e7264b84284a04f96e756d799de', '16333736729@qq.com', '0', '2018-10-16', '0', 'test9', '2018-10-30 12:53:25', 'admin', '2018-12-04 20:39:30', 0, 'EXAM', 'Java', '4f1ed1353d904ad3837458266de8a080');

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

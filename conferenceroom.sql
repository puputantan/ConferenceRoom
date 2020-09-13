/*
 Navicat Premium Data Transfer

 Source Server         : lx
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 175.24.109.15:3306
 Source Schema         : conferenceroom

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 08/09/2020 13:44:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dic_conference_room_type
-- ----------------------------
DROP TABLE IF EXISTS `dic_conference_room_type`;
CREATE TABLE `dic_conference_room_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(2) NULL DEFAULT NULL COMMENT '类型编码',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议室类型描述',
  `director_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系主任名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dic_conference_room_type
-- ----------------------------
INSERT INTO `dic_conference_room_type` VALUES (1, 1, '信息管理工程系', '老师1');
INSERT INTO `dic_conference_room_type` VALUES (2, 2, '财政学系', '老师2');
INSERT INTO `dic_conference_room_type` VALUES (3, 3, '会计系', '老师3');
INSERT INTO `dic_conference_room_type` VALUES (4, 4, '工商管理系', '老师4');
INSERT INTO `dic_conference_room_type` VALUES (5, 5, '旅游管理系', '老师5');
INSERT INTO `dic_conference_room_type` VALUES (6, 6, '图书馆学系', '老师6');
INSERT INTO `dic_conference_room_type` VALUES (7, 7, '档案学系', '老师7');

-- ----------------------------
-- Table structure for dic_time
-- ----------------------------
DROP TABLE IF EXISTS `dic_time`;
CREATE TABLE `dic_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(4) NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dic_time
-- ----------------------------
INSERT INTO `dic_time` VALUES (1, 8, '8:00');
INSERT INTO `dic_time` VALUES (2, 9, '9:00');
INSERT INTO `dic_time` VALUES (3, 10, '10:00');
INSERT INTO `dic_time` VALUES (4, 11, '11:00');
INSERT INTO `dic_time` VALUES (5, 12, '12:00');
INSERT INTO `dic_time` VALUES (6, 13, '13:00');
INSERT INTO `dic_time` VALUES (7, 14, '14:00');
INSERT INTO `dic_time` VALUES (8, 15, '15:00');
INSERT INTO `dic_time` VALUES (9, 16, '16:00');
INSERT INTO `dic_time` VALUES (10, 17, '17:00');
INSERT INTO `dic_time` VALUES (11, 18, '18:00');
INSERT INTO `dic_time` VALUES (12, 19, '19:00');
INSERT INTO `dic_time` VALUES (13, 20, '20:00');
INSERT INTO `dic_time` VALUES (14, 21, '21:00');
INSERT INTO `dic_time` VALUES (15, 22, '22:00');

-- ----------------------------
-- Table structure for ref_apply_participants
-- ----------------------------
DROP TABLE IF EXISTS `ref_apply_participants`;
CREATE TABLE `ref_apply_participants`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_room_appointment_id` int(11) NOT NULL COMMENT '预约id',
  `participant_number` int(11) NULL DEFAULT NULL COMMENT '参会人教职工号（唯一）',
  `participant_department` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参会人系别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ref_apply_participants
-- ----------------------------
INSERT INTO `ref_apply_participants` VALUES (1, 22, 11, '信息管理工程系');
INSERT INTO `ref_apply_participants` VALUES (2, 22, 2017051503, '信息管理工程系');
INSERT INTO `ref_apply_participants` VALUES (3, 22, 2017051505, '信息管理工程系');
INSERT INTO `ref_apply_participants` VALUES (4, 25, 2017051502, '财政系');
INSERT INTO `ref_apply_participants` VALUES (5, 27, 2017051502, '财政系');

-- ----------------------------
-- Table structure for ref_conference
-- ----------------------------
DROP TABLE IF EXISTS `ref_conference`;
CREATE TABLE `ref_conference`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_room_id` bigint(11) NOT NULL COMMENT '会议室id',
  `conference_room_appointment_id` int(11) NOT NULL COMMENT '预约id',
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日期',
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间段',
  `starttime_code` int(4) NULL DEFAULT NULL COMMENT '开始时间编码',
  `endtime_code` int(4) NULL DEFAULT NULL COMMENT '结束时间编码',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除1：未删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ref_conference
-- ----------------------------
INSERT INTO `ref_conference` VALUES (5, 18, 37, '2020-05-07', '9:00--10:00', 2, 3, b'0');
INSERT INTO `ref_conference` VALUES (6, 18, 35, '2020-05-02', '11:00--13:00', 4, 6, b'0');
INSERT INTO `ref_conference` VALUES (7, 18, 39, '2020-05-01', '12:00--14:00', 12, 14, b'0');
INSERT INTO `ref_conference` VALUES (8, 6, 42, '2020-05-01', '10:00--12:00', 10, 12, b'0');
INSERT INTO `ref_conference` VALUES (9, 6, 41, '2020-05-01', '15:00--16:00', 15, 16, b'0');
INSERT INTO `ref_conference` VALUES (10, 9, 44, '2020-05-24', '10:00--12:00', 3, 5, b'0');
INSERT INTO `ref_conference` VALUES (11, 9, 47, '2020-05-25', '10:00--12:00', 3, 5, b'0');
INSERT INTO `ref_conference` VALUES (36, 6, 79, '2020-07-12', '10:00--13:00', 10, 13, b'0');
INSERT INTO `ref_conference` VALUES (37, 6, 81, '2020-07-12', '15:00--16:00', 15, 16, b'0');
INSERT INTO `ref_conference` VALUES (38, 6, 82, '2020-07-12', '14:00--18:00', 14, 18, b'0');
INSERT INTO `ref_conference` VALUES (39, 6, 83, '2020-07-12', '14:00--18:00', 14, 18, b'0');
INSERT INTO `ref_conference` VALUES (40, 6, 84, '2020-07-12', '14:00--18:00', 14, 18, b'0');
INSERT INTO `ref_conference` VALUES (41, 6, 85, '2020-07-12', '17:00--18:00', 17, 18, b'0');
INSERT INTO `ref_conference` VALUES (42, 6, 86, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (43, 6, 87, '2020-07-12', '13:00--16:00', 13, 16, b'0');
INSERT INTO `ref_conference` VALUES (44, 6, 88, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (45, 6, 89, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (46, 6, 90, '2020-07-13', '13:00--16:00', 13, 16, b'0');
INSERT INTO `ref_conference` VALUES (47, 6, 91, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (48, 6, 92, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (49, 6, 93, '2020-07-12', '8:00--13:00', 8, 13, b'0');
INSERT INTO `ref_conference` VALUES (50, 6, 94, '2020-07-12', '13:00--14:00', 13, 14, b'0');
INSERT INTO `ref_conference` VALUES (51, 22, 95, '2020-05-13', '16:00--18:00', 16, 18, b'0');
INSERT INTO `ref_conference` VALUES (52, 6, 96, '2020-07-13', '16:00--17:00', 16, 17, b'0');
INSERT INTO `ref_conference` VALUES (53, 22, 97, '2020-07-13', '16:00--17:00', 16, 17, b'1');
INSERT INTO `ref_conference` VALUES (54, 6, 98, '2020-07-13', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (55, 6, 99, '2020-07-14', '10:00--11:00', 10, 11, b'1');
INSERT INTO `ref_conference` VALUES (56, 6, 102, '2020-07-13', '11:00--12:00', 11, 12, b'1');
INSERT INTO `ref_conference` VALUES (57, 18, 103, '2020-07-23', '11:00--16:00', 11, 16, b'1');
INSERT INTO `ref_conference` VALUES (58, 18, 105, '2020-07-24', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (59, 22, 106, '2020-07-24', '13:00--15:00', 13, 15, b'0');
INSERT INTO `ref_conference` VALUES (60, 6, 107, '2020-07-24', '16:00--18:00', 16, 18, b'0');
INSERT INTO `ref_conference` VALUES (61, 22, 108, '2020-07-26', '11:00--14:00', 11, 14, b'1');
INSERT INTO `ref_conference` VALUES (62, 9, 109, '2020-07-26', '8:00--9:00', 8, 9, b'0');
INSERT INTO `ref_conference` VALUES (63, 22, 110, '2020-07-30', '9:00--14:00', 9, 14, b'0');
INSERT INTO `ref_conference` VALUES (64, 9, 112, '2020-07-31', '11:00--14:00', 11, 14, b'0');
INSERT INTO `ref_conference` VALUES (65, 9, 113, '2020-07-31', '11:00--14:00', 11, 14, b'0');
INSERT INTO `ref_conference` VALUES (66, 9, 114, '2020-07-31', '11:00--14:00', 11, 14, b'0');
INSERT INTO `ref_conference` VALUES (67, 9, 115, '2020-07-29', '14:00--16:00', 14, 16, b'0');
INSERT INTO `ref_conference` VALUES (68, 9, 111, '2020-07-30', '9:00--15:00', 9, 15, b'1');
INSERT INTO `ref_conference` VALUES (69, 6, 116, '2020-07-30', '17:00--18:00', 17, 18, b'0');
INSERT INTO `ref_conference` VALUES (70, 18, 118, '2020-07-31', '11:00--12:00', 11, 12, b'1');
INSERT INTO `ref_conference` VALUES (71, 9, 119, '2020-07-28', '10:00--12:00', 10, 12, b'0');
INSERT INTO `ref_conference` VALUES (72, 9, 120, '2020-08-29', '11:00--14:00', 11, 14, b'0');
INSERT INTO `ref_conference` VALUES (73, 9, 121, '2020-08-01', '11:00--13:00', 11, 13, b'1');
INSERT INTO `ref_conference` VALUES (74, 9, 122, '2020-07-31', '11:00--14:00', 11, 14, b'1');
INSERT INTO `ref_conference` VALUES (75, 18, 123, '2020-07-25', '11:00--14:00', 11, 14, b'0');
INSERT INTO `ref_conference` VALUES (76, 6, 124, '2020-07-30', '11:00--12:00', 11, 12, b'0');
INSERT INTO `ref_conference` VALUES (77, 18, 125, '2020-07-28', '12:00--13:00', 12, 13, b'0');
INSERT INTO `ref_conference` VALUES (78, 22, 126, '2020-07-27', '11:00--13:00', 11, 13, b'0');
INSERT INTO `ref_conference` VALUES (79, 6, 127, '2020-07-29', '16:00--18:00', 16, 18, b'1');
INSERT INTO `ref_conference` VALUES (80, 27, 128, '2020-07-26', '10:00--11:00', 10, 11, b'0');
INSERT INTO `ref_conference` VALUES (81, 9, 129, '2020-07-27', '14:00--16:00', 14, 16, b'0');
INSERT INTO `ref_conference` VALUES (82, 6, 131, '2020-07-27', '14:00--16:00', 14, 16, b'0');
INSERT INTO `ref_conference` VALUES (83, 9, 133, '2020-07-27', '13:00--15:00', 13, 15, b'0');
INSERT INTO `ref_conference` VALUES (84, 6, 134, '2020-07-27', '16:00--18:00', 16, 18, b'0');
INSERT INTO `ref_conference` VALUES (85, 9, 132, '2020-07-27', '14:00--16:00', 14, 16, b'1');
INSERT INTO `ref_conference` VALUES (86, 6, 136, '2020-07-28', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (87, 31, 138, '2020-07-28', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (88, 18, 139, '2020-07-29', '10:00--12:00', 10, 12, b'1');
INSERT INTO `ref_conference` VALUES (89, 31, 142, '2020-08-08', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (90, 26, 141, '2020-07-28', '16:00--18:00', 16, 18, b'1');
INSERT INTO `ref_conference` VALUES (91, 31, 143, '2020-07-29', '13:00--14:00', 13, 14, b'0');
INSERT INTO `ref_conference` VALUES (92, 6, 145, '2020-07-29', '11:00--13:00', 11, 13, b'1');
INSERT INTO `ref_conference` VALUES (93, 22, 146, '2020-08-01', '10:00--12:00', 10, 12, b'1');
INSERT INTO `ref_conference` VALUES (94, 18, 148, '2020-08-01', '11:00--12:00', 11, 12, b'1');
INSERT INTO `ref_conference` VALUES (95, 6, 149, '2020-08-03', '8:00--9:00', 8, 9, b'1');
INSERT INTO `ref_conference` VALUES (96, 22, 152, '2020-08-01', '15:00--18:00', 15, 18, b'1');
INSERT INTO `ref_conference` VALUES (97, 22, 153, '2020-08-01', '8:00--10:00', 8, 10, b'1');
INSERT INTO `ref_conference` VALUES (98, 6, 154, '2020-08-01', '8:00--12:00', 8, 12, b'1');
INSERT INTO `ref_conference` VALUES (99, 22, 155, '2020-08-08', '8:00--10:00', 8, 10, b'1');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录使用的uuid',
  `number` bigint(20) NULL DEFAULT NULL COMMENT '教职工号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员名字',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员电话号',
  `mailbox` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员邮箱',
  `department` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门（系）',
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '创建管理员时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改管理员时间',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除1：未删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, NULL, 123456, 'lst', '123456', '1854387559', '1173080299@qq.com', '管理学院', '2020-05-01 10:10:43', '2020-07-11 19:03:13', b'1');

-- ----------------------------
-- Table structure for t_conference_room
-- ----------------------------
DROP TABLE IF EXISTS `t_conference_room`;
CREATE TABLE `t_conference_room`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议室名称',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议室地址',
  `capacity` int(11) NULL DEFAULT NULL COMMENT '会议室容量',
  `status` int(2) NULL DEFAULT NULL COMMENT '会议室状态\r\n（1：可使用、2：维修）',
  `equipment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备',
  `conference_room_type_code` int(2) NULL DEFAULT NULL COMMENT '会议室类型编码',
  `available_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议室可用时间段（8h）',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除1：未删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_conference_room
-- ----------------------------
INSERT INTO `t_conference_room` VALUES (6, '会议室6', '本部六教115', 30, 1, '无多媒体', 1, '8.00--18.00', b'1');
INSERT INTO `t_conference_room` VALUES (9, '会议室2', '新区A座309', 300, 1, '多媒体', 2, '8:00--18:00', b'1');
INSERT INTO `t_conference_room` VALUES (12, '会议室3', '本部主楼509', 100, 1, '多媒体', 4, '8:00--9:00', b'0');
INSERT INTO `t_conference_room` VALUES (18, '会议室4', '本部八教500', 67, 1, '多媒体', 1, '8:00--9:00', b'1');
INSERT INTO `t_conference_room` VALUES (20, '会议室5', '本部七教122', 60, 1, '无多媒体', 2, '8.00--18.00', b'0');
INSERT INTO `t_conference_room` VALUES (22, '会议室1', '本部九教215', 90, 1, '多媒体', 1, '8.00--22.00', b'1');
INSERT INTO `t_conference_room` VALUES (26, '会议室7', '本部六教123室', 90, 1, '多媒体', 4, '8.00--22.00', b'1');
INSERT INTO `t_conference_room` VALUES (27, '会议室8', '本部六教123', 100, 1, '多媒体', 3, '8:00--22:00', b'1');
INSERT INTO `t_conference_room` VALUES (28, '', '', 20, 1, '', 1, '', b'0');
INSERT INTO `t_conference_room` VALUES (29, '', '', 11, 1, '', 1, '', b'0');
INSERT INTO `t_conference_room` VALUES (30, '只是暂时', '时代', 11, 1, '收到v', 1, '是多少v在', b'0');
INSERT INTO `t_conference_room` VALUES (31, '会议室3', '本部七教202', 70, 1, '无多媒体', 1, '8：00-22：00', b'1');
INSERT INTO `t_conference_room` VALUES (32, '会议室9', '本部六教121', 40, 1, '多媒体', 1, '8:00-22:00', b'0');

-- ----------------------------
-- Table structure for t_conference_room_appointment
-- ----------------------------
DROP TABLE IF EXISTS `t_conference_room_appointment`;
CREATE TABLE `t_conference_room_appointment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约者姓名',
  `number` bigint(20) NULL DEFAULT NULL COMMENT '预约者工号（用户唯一标识）',
  `conference_room_id` bigint(11) NULL DEFAULT NULL COMMENT '会议室id',
  `max_num` int(11) NULL DEFAULT NULL COMMENT '最多参会人数',
  `theme` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议主题',
  `specialneeds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊需求',
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约日期',
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约时间段（一天分为八个段）',
  `starttime_code` int(4) NULL DEFAULT NULL COMMENT '会议开始时间',
  `endtime_code` int(4) NULL DEFAULT NULL COMMENT '会议结束时间',
  `examine_status` int(4) NULL DEFAULT 0 COMMENT '审核状态（0：未处理；1：管理员审核通过；2：系主任审核通过；3：管理员审核未通过 ;4:系主任审核未通过..，，,目前用0，1，3）',
  `examine_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核理由',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除 1：未删除true）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_conference_room_appointment
-- ----------------------------
INSERT INTO `t_conference_room_appointment` VALUES (25, '刘思彤', 2017051501, 9, 10, '测试', '需要超大屏幕', '2020-05-12', '9:00--10:00', 2, 3, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (26, '杨艳春', 2017051502, 9, 44, '测试', '', '2020-05-09', '8:00--9:00', 1, 2, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (27, '刘思彤', 2017051501, 12, 22, '测试', NULL, '2020-05-12', '9:00--10:00', 2, 3, 3, '不通过', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (28, 'lst', 2017051503, 9, 40, '测试', NULL, '2020-05-12', '11:00--12:00', 4, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (29, 'lst', 2017051501, 12, 20, '测试', NULL, '2020-05-12', '11:00--12:00', 4, 5, 3, 'hhhh不通', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (30, 'lst', 2017051501, 18, 22, '测试', NULL, '2020-05-13', '11:00--12:00', 4, 5, 3, '不通过', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (31, '刘思彤', 201701501, 12, 65, '测试', NULL, '2020-05-05', '9:00--10:00', 4, 5, 0, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (32, 'lst', 2017051501, 12, 40, '测试', NULL, '2020-05-07', NULL, 4, 5, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (33, '刘思彤', 2017051501, 6, 124, '测试', NULL, '2020-05-13', NULL, 4, 6, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (34, 'lst', 2017051501, 12, 20, '测试', NULL, '2020-05-13', NULL, 7, 11, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (35, 'fg', 2017051501, 18, 3, '测试', NULL, '2020-05-02', NULL, 4, 6, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (36, 'yyx', 2017051501, 18, 20, '测试', NULL, '2020-05-14', NULL, 3, 7, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (37, 'yys', 2017051501, 18, 20, '测试', NULL, '2020-05-07', NULL, 2, 3, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (38, 'yyyx', 2035, 9, 33, '测试', NULL, '2020-05-12', NULL, 2, 3, 0, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (39, '刘思彤', 2017051501, 18, 2, '测试', NULL, '2020-05-01', NULL, 3, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (40, 'lst', 2017051502, 12, 30, '测试', NULL, '2020-05-01', NULL, 3, 4, 3, '不通过', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (41, 'lst', 2017051501, 12, 20, '测试', NULL, '2020-05-07', NULL, 3, 7, 3, '不通', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (42, 'lst', 2017051502, 6, 12, '测试', NULL, '2020-05-01', NULL, 3, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (43, 'lst', 2017051502, 6, 12, '测试', NULL, '2020-05-01', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (44, 'lst', 2017051502, 9, 12, '测试', NULL, '2020-05-24', NULL, 3, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (45, 'lst', 2017051502, 12, 12, '测试', NULL, '2020-05-02', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (48, '杨艳春', 2017051502, 6, 12, '测试', NULL, '2020-05-25', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (49, '杨艳春', 2017051502, 6, 12, '测试', NULL, '2020-05-25', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (50, '杨艳春', 2017051502, 6, 12, '测试', NULL, '2020-05-25', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (51, '杨艳春', 2017051502, 6, 12, '测试', NULL, '2020-05-25', NULL, 3, 5, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (52, NULL, 2017051501, 18, 100, '无', NULL, '2020-05-13', '10:00--13:00', 3, 6, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (53, NULL, 2017051501, 20, 100, '无', NULL, '2020-05-01', '10:00--13:00', 3, 6, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (54, NULL, 2017051501, 22, 1, '无', NULL, '2020-07-12', '9:00--11:00', 9, 11, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (79, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '10:00--13:00', 10, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (80, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '15:00--17:00', 15, 17, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (81, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '15:00--16:00', 15, 16, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (82, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '14:00--18:00', 14, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (83, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '14:00--18:00', 14, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (84, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '14:00--18:00', 14, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (85, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '17:00--18:00', 17, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (86, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (87, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '13:00--16:00', 13, 16, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (88, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (89, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (90, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-13', '13:00--16:00', 13, 16, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (91, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (92, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (93, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '8:00--13:00', 8, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (94, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-12', '13:00--14:00', 13, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (95, '刘思彤', 2017051501, 22, 1, '无', NULL, '2020-05-13', '16:00--18:00', 16, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (96, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-13', '16:00--17:00', 16, 17, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (97, '刘思彤', 2017051501, 22, 1, '无', NULL, '2020-07-13', '16:00--17:00', 16, 17, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (98, '刘思彤', 2017051501, 6, 20, 'lst测试', 'lst测试', '2020-07-13', '8:00--10:00', 8, 10, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (99, '刘思彤', 2017051501, 6, 20, '无', 'lst测试', '2020-07-14', '10:00--11:00', 10, 11, 3, '该时间段已经被预约,请重新预约', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (100, '刘思彤', 2017051501, 6, 1, '无', '不需要多媒体，无附注', '2020-07-13', '8:00--11:00', 8, 11, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (101, '刘思彤', 2017051501, 6, 1, '无', '不需要多媒体，无附注', '2020-07-13', '11:00--13:00', 11, 13, 3, '该时间段已经被预约,请重新预约', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (102, '刘思彤', 2017051501, 6, 1, '无', '不需要多媒体，无附注', '2020-07-13', '11:00--12:00', 11, 12, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (103, '刘思彤', 2017051501, 18, 1, '无', NULL, '2020-07-23', '11:00--16:00', 11, 16, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (104, '刘思彤', 2017051501, 9, 1, '无', '不需要多媒体，无附注', '2020-08-06', '10:00--13:00', 10, 13, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (105, '李悦', 20180515019, 18, 15, '无', NULL, '2020-07-24', '8:00--10:00', 8, 10, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (106, '李悦', 20180515019, 22, 15, '开会', '需要多媒体，无附注', '2020-07-24', '13:00--15:00', 13, 15, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (107, '李悦', 20180515019, 6, 13, '1', NULL, '2020-07-24', '16:00--18:00', 16, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (108, 'txx', 20200724, 22, 60, '无', NULL, '2020-07-26', '11:00--14:00', 11, 14, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (109, '方小敏', 123456789, 9, 20, '无', NULL, '2020-07-26', '8:00--9:00', 8, 9, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (110, 'txx', 20200724, 22, 60, '无', NULL, '2020-07-30', '9:00--14:00', 9, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (111, 'txx', 20200724, 9, 80, '无', '不需要多媒体，无附注', '2020-07-30', '9:00--15:00', 9, 15, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (112, '李学', 20180514042, 9, 57, '无', NULL, '2020-07-31', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (113, '李学', 20180514042, 9, 57, '无', NULL, '2020-07-31', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (114, '李学', 20180514042, 9, 57, '无', NULL, '2020-07-31', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (115, '李学', 20180514042, 9, 57, '无', NULL, '2020-07-29', '14:00--16:00', 14, 16, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (116, '李学', 20180514042, 6, 57, '无', '需要多媒体，无附注', '2020-07-30', '17:00--18:00', 17, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (117, '常欢', 20180515002, 27, 20, '无', '不需要多媒体，无附注', '2020-07-25', '15:00--16:00', 15, 16, 3, '无', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (118, '刘思彤', 2017051501, 18, 1, '无', NULL, '2020-07-31', '11:00--12:00', 11, 12, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (119, '李学', 20180514042, 9, 1, '无', NULL, '2020-07-28', '10:00--12:00', 10, 12, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (120, '李学', 20180514042, 9, 1, '无', NULL, '2020-08-29', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (121, '李学', 20180514042, 9, 1, '无', NULL, '2020-08-01', '11:00--13:00', 11, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (122, '李学', 20180514042, 9, 1, '无', NULL, '2020-07-31', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (123, '刘思彤', 2017051501, 18, 1, '无', NULL, '2020-07-25', '11:00--14:00', 11, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (124, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-30', '11:00--12:00', 11, 12, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (125, '刘思彤', 2017051501, 18, 1, '无', NULL, '2020-07-28', '12:00--13:00', 12, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (126, '刘思彤', 2017051501, 22, 1, '无', NULL, '2020-07-27', '11:00--13:00', 11, 13, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (127, '盖子', 20180515001, 6, 60, '无', NULL, '2020-07-29', '16:00--18:00', 16, 18, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (128, '常欢', 20180515002, 27, 130, '1234', '111', '2020-07-26', '10:00--11:00', 10, 11, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (129, '常欢', 20180515002, 9, 70, '无', '需要多媒体，无附注', '2020-07-27', '14:00--16:00', 14, 16, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (130, '常欢', 20180515002, 9, 90, '无', '需要多媒体，无附注', '2020-07-27', '13:00--15:00', 13, 15, 3, '该时间段已经被预约,请重新预约', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (131, 'lst', 2017051501, 6, 30, '无', NULL, '2020-07-27', '14:00--16:00', 14, 16, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (132, 'lst', 2017051501, 9, 30, '无', '不需要多媒体，无附注', '2020-07-27', '14:00--16:00', 14, 16, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (133, '常欢', 20180515002, 9, 30, '无', '不需要多媒体，无附注', '2020-07-27', '13:00--15:00', 13, 15, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (134, '常欢', 20180515002, 6, 60, '无', NULL, '2020-07-27', '16:00--18:00', 16, 18, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (135, '刘思彤', 2017051501, 27, 1, '无', '不需要多媒体，无附注', '2020-07-31', '8:00--11:00', 8, 11, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (136, '李悦', 20180515019, 6, 12, '无', NULL, '2020-07-28', '8:00--10:00', 8, 10, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (137, '李悦', 20180515019, 6, 15, '无', '需要多媒体，无附注', '2020-07-28', '12:00--14:00', 12, 14, 3, '没有多媒体', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (138, '小张', 2018003003, 31, 111, '无', '不需要多媒体，无附注', '2020-07-28', '8:00--10:00', 8, 10, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (139, '小张', 2018003003, 18, 10, '无', '需要多媒体，无附注', '2020-07-29', '10:00--12:00', 10, 12, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (140, '小张', 2018003003, 9, 12, '无', '需要多媒体，无附注', '2020-07-31', '16:00--18:00', 16, 18, 0, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (141, '小张', 2018003003, 26, 36, '无', '需要多媒体，无附注', '2020-07-28', '16:00--18:00', 16, 18, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (142, '刘思彤', 2017051501, 31, 1, '无', NULL, '2020-08-08', '8:00--10:00', 8, 10, 3, '该时间段已经被预约,请重新预约', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (143, '1', 123, 31, 4, '无', NULL, '2020-07-29', '13:00--14:00', 13, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (144, '1', 123, 27, 6, '无', '需要多媒体，无附注', '2020-07-29', '13:00--14:00', 13, 14, 3, '不想通过！', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (145, '刘思彤', 2017051501, 6, 1, '无', NULL, '2020-07-29', '11:00--13:00', 11, 13, 3, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (146, '杨艳春', 20170515011, 22, 1, '无', NULL, '2020-08-01', '10:00--12:00', 10, 12, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (147, '杨艳春', 20170515011, 6, 1, '无', '不需要多媒体，无附注', '2020-08-01', '8:00--10:00', 8, 10, 3, 'wu', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (148, '杨艳春', 20170515011, 18, 1, '无', NULL, '2020-08-01', '11:00--12:00', 11, 12, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (149, '杨艳春', 20170515011, 6, 1, '无', NULL, '2020-08-03', '8:00--9:00', 8, 9, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (150, '张欣悦', 20180515013, 22, 20, '无', '不需要多媒体，无附注', '2020-08-08', '9:00--11:00', 9, 11, 0, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (151, '张欣悦', 20180515013, 6, 20, '无', '需要多媒体，无附注', '2020-08-01', '8:00--9:00', 8, 9, 3, '无', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (152, '张欣悦', 20180515013, 22, 1, '无', NULL, '2020-08-01', '15:00--18:00', 15, 18, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (153, '张欣悦', 20180515013, 22, 1, '无', NULL, '2020-08-01', '8:00--10:00', 8, 10, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (154, '张欣悦', 20180515013, 6, 1, '无', NULL, '2020-08-01', '8:00--12:00', 8, 12, 3, '该时间段已经被预约,请重新预约', b'1');
INSERT INTO `t_conference_room_appointment` VALUES (155, '刘思彤', 2017051501, 22, 1, '无', NULL, '2020-08-08', '8:00--10:00', 8, 10, 1, '', b'1');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公告内容',
  `authoruuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员登录的uuid',
  `author_number` bigint(20) NULL DEFAULT NULL COMMENT '教职工号',
  `author_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者名',
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除1：未删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (28, NULL, '<p style=\"text-align: center;\">asdfdawegg</p><p>xfbaerfrvef</p>', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `t_notice` VALUES (29, NULL, '乐享会议系统于9月1日正式上线使用。', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `t_notice` VALUES (30, '会议室预约系统最新公告', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本系统预计九月一号正式上线。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></p>', NULL, NULL, '刘思彤', '2020-08-11 03:07:17', NULL, b'1');
INSERT INTO `t_notice` VALUES (31, '公告', '<p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">1.本系统采用两种预约方式：本系预约和跨系预约。</span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">本系预约：用户所在系 有会议室，则用户可以直接预约成功，不需要后台人员进行审核。</span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">跨系预约：用户所在系 没有相关会议室或者本系会议室均无法预约，则可以进行跨系预约。跨系预约的申请需要后台人员进行审核，审核结果会通过邮件的形式发送。</span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">2.会议室预约时段为：8:00-18：00，超时段使用应在预约登记时做好备注说明。(提示：</span><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">预约时间必须落在系统划定时间段内，时间需按照系统原有时间格式输入）</span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">3.<span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">如会议室多媒体设备使用前发生故障、损坏或配件丢失，要及时上报综合办公室，未及</span><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">时上报发现后责任一律由最后使用人承担。</span></span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">4、其他特殊情况或特殊需要用户可联系综合办公室。</span></span></span></span></p>', NULL, NULL, '刘思彤', '2020-08-11 03:10:54', NULL, b'1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '由uuid生成，登录用',
  `number` bigint(20) NULL DEFAULT NULL COMMENT '教职工号（唯一标识）',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名（真实姓名）',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号',
  `mailbox` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `department` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门（系）',
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `sex` int(2) NULL DEFAULT NULL COMMENT '性别（0：男，1：女）',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT '是否删除（0：删除 1：未删除）',
  `status` smallint(4) NULL DEFAULT 0 COMMENT '审核状态（0：未处理，1：已通过，2：不通过）',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不通过原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (7, NULL, 2017051502, '2017051502', '杨艳春', '18543740009', 'HBU_yyc@163.com', '财政学系', NULL, '2020-08-09 22:23:48', NULL, b'1', 2, '不正确');
INSERT INTO `t_user` VALUES (8, NULL, 2017051503, '2017051503', '史亚庆', '18543740009', '1002913814@qq.com', '工商管理系', NULL, '2020-07-17 15:43:19', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (9, NULL, 2017051504, '2017051504', '张三', '18543740009', '1173080299@qq.com', '图书馆学系', NULL, '2020-07-17 18:51:11', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (10, NULL, 2017051501, '2017051501', '刘思彤', '17336322997', '1173080299@qq.com', '信息管理工程系', NULL, '2020-08-09 22:23:59', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (16, NULL, 24, '12', 'fdgh', 'null', '145654657@qq.com', '会计系', NULL, '2020-07-17 15:43:19', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (17, NULL, 20170515037, '20170515037', 'lst', '17336322997', '1173080299@qq.com', '档案系', NULL, '2020-07-17 17:20:18', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (18, NULL, 123456, '123456', 'lstceshi', NULL, '1173080299@qq.com', '信息管理工程系', NULL, '2020-07-21 17:01:08', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (19, NULL, 234, 'zdg', 'dffg', 'dfg', 'agr@qq.com', '信息管理工程系', NULL, '2020-07-21 18:31:11', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (20, NULL, 234, 'sdgd', 'dfhfher', 'drh', '11@qq.com', '信息管理工程系', NULL, '2020-07-21 18:31:11', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (21, NULL, 20170515078, '123456', 'lst', NULL, '1173080299@qq.com', '财政学系', NULL, '2020-07-22 09:45:01', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (22, NULL, 1111111, '000', '史亚庆', NULL, '1002913814@qq.com', '信息管理工程系', NULL, '2020-07-22 11:16:01', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (23, NULL, 111, '111', '111', NULL, '1002913814@qq.com', '信息管理工程系', NULL, '2020-07-22 11:16:03', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (24, NULL, 111, '111', '111', NULL, '1002913814@qq.com', '信息管理工程系', NULL, '2020-07-22 11:16:05', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (25, NULL, 20170515011, '2013dao2014', '杨艳春', NULL, '1802302924@qq.com', '信息管理工程系', NULL, '2020-07-23 15:29:12', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (26, NULL, 20180515002, '123456', '常欢', NULL, '444187283@qq.com', '信息管理工程系', NULL, '2020-07-23 18:52:47', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (27, NULL, 20180515019, '123456', '李悦', '无', '951789947@qq.com', '信息管理工程系', NULL, '2020-07-23 18:53:37', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (28, NULL, 20180515019, '123456', '李悦', NULL, '951789947@qq.com', '信息管理工程系', NULL, '2020-07-23 18:52:37', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (29, NULL, 20200724, '20200724', 'txx', NULL, '1664669578@qq.com', '信息管理工程系', NULL, '2020-07-24 09:49:01', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (30, NULL, 123456789, '123456', '方小敏', NULL, '3241512032@qq.com', '财政学系', NULL, '2020-07-24 09:52:04', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (31, NULL, 20180514042, '633484410X', '李学', NULL, '2571190618@qq.com', '财政学系', NULL, '2020-07-24 10:07:52', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (32, NULL, 20180516041, 'czx620721', '陈子轩', NULL, '1045044360@qq.com', '旅游管理系', NULL, '2020-07-25 17:21:36', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (33, NULL, 20180515001, 'qweasdzxc', '盖子', NULL, '1346264621@qq.com', '信息管理工程系', NULL, '2020-07-25 17:26:48', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (34, NULL, 20180517008, '123456', 'xyz', '无', '142835177@qq.com', '档案系', NULL, '2020-07-27 16:47:59', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (35, NULL, 20180512001, '123456', '飞', NULL, '123456789@qq.com', '工商管理系', NULL, '2020-07-27 15:54:51', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (36, NULL, 2018003003, '8888', '小张', '', '951789947@qq.com', '图书馆学系', NULL, '2020-07-27 16:49:41', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (37, NULL, 123, '1', '1', '无', '1379409273@qq.com', '信息管理工程系', NULL, '2020-07-28 16:32:21', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (38, NULL, 352, '12', 'lstdfsfg', '无', '1173080299@qq.com', '信息管理工程系', NULL, '2020-08-09 22:59:04', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (39, NULL, 20170515031, '12', 'sdf', NULL, '1173080299@qq.com', '旅游管理系', NULL, '2020-07-29 22:51:31', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (40, NULL, 20180515013, '1414612316qq', '张欣悦', NULL, '1414612316@qq.com', '档案学系', NULL, '2020-07-30 12:21:12', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (41, NULL, 1111111222, '1414612316qq', '啥啥啥', NULL, '1414612316@qq.com', '信息管理工程系', NULL, '2020-07-30 12:34:34', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (42, NULL, 1, '2', '3', '', '', '信息管理工程系', NULL, '2020-07-30 12:39:49', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (43, NULL, 20180515013, '1414612316qq', '张欣悦', NULL, '1414612316@qq.com', '信息管理工程系', NULL, '2020-07-30 14:33:07', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (44, NULL, 1040788, '041288', '康涩琪', NULL, '123456789@qq.com', '信息管理工程系', NULL, '2020-07-31 13:51:58', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (45, NULL, 20174229020, '123456', '张欣悦', '无', '1041611691@qq.com', '信息管理工程系', NULL, '2020-07-31 18:25:08', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (46, NULL, 201822480914, 'zxl.0808', '张旭龙', NULL, '770015272@qq.com', '旅游管理系', NULL, '2020-07-31 16:14:24', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (47, NULL, 20170515012, '2013dao2014', 'yyc', NULL, '1802302924@qq.com', '图书馆学系', NULL, '2020-07-31 18:28:04', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (48, NULL, 20170515013, '2013dao2014', 'yycc', NULL, '1802302924@qq.com', '工商管理系', NULL, '2020-07-31 17:25:52', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (49, NULL, 20170515014, '2013dao2014', 'yyccc', NULL, '1802302924@qq.com', '旅游管理系', NULL, '2020-07-31 17:27:34', NULL, b'1', 2, 'WU');
INSERT INTO `t_user` VALUES (50, NULL, 2222, '1', 'yyc', NULL, 'HBU_yyc@163.com', '信息管理工程系', NULL, '2020-08-02 21:45:05', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (51, NULL, 1, '1', 'lst', NULL, '1173080299@qq.com', '财政学系', NULL, '2020-08-09 23:05:17', NULL, b'1', 2, '无');
INSERT INTO `t_user` VALUES (52, NULL, 111, '1', '自营', NULL, '1173080299@qq.com', '信息管理工程系', NULL, '2020-08-11 16:01:35', NULL, b'1', 2, '无');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : conferenceroom

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 22/01/2023 03:29:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dic_conference_room_type
-- ----------------------------
DROP TABLE IF EXISTS `dic_conference_room_type`;
CREATE TABLE `dic_conference_room_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int NULL DEFAULT NULL COMMENT 'type code',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Description of meeting room type',
  `director_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Department chair name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dic_conference_room_type
-- ----------------------------
INSERT INTO `dic_conference_room_type` VALUES (1, 1, 'Department of Information Management Engineering', 'teacher1');
INSERT INTO `dic_conference_room_type` VALUES (2, 2, 'Department of Finance', 'teacher2');
INSERT INTO `dic_conference_room_type` VALUES (3, 3, 'Department of Accounting', 'teacher3');
INSERT INTO `dic_conference_room_type` VALUES (4, 4, 'Department of Business Administration', 'teacher4');
INSERT INTO `dic_conference_room_type` VALUES (5, 5, 'Department of Tourism Management', 'teacher5');
INSERT INTO `dic_conference_room_type` VALUES (6, 6, 'Department of Library Science', 'teacher6');
INSERT INTO `dic_conference_room_type` VALUES (7, 7, 'Department of Archives', 'teacher7');

-- ----------------------------
-- Table structure for dic_time
-- ----------------------------
DROP TABLE IF EXISTS `dic_time`;
CREATE TABLE `dic_time`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int NULL DEFAULT NULL COMMENT 'code',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'description',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for ref_conference
-- ----------------------------
DROP TABLE IF EXISTS `ref_conference`;
CREATE TABLE `ref_conference`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conference_room_id` bigint NOT NULL COMMENT 'meeting room id',
  `conference_room_appointment_id` int NOT NULL COMMENT 'reservation id',
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'reservation date',
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Appointment time slot',
  `starttime_code` int NULL DEFAULT NULL COMMENT 'start time code',
  `endtime_code` int NULL DEFAULT NULL COMMENT 'end time code',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'login uuid',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator login username',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator name',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator password',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator phone number',
  `mailbox` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator mail',
  `department` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'administrator department',
  `creat_time` datetime NULL DEFAULT NULL COMMENT 'administrator creat time',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'administrator update time',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, NULL, '123456', 'lst', '123456', '1854387559', '1173080299@qq.com', 'management College', '2020-05-01 10:10:43', '2023-01-22 03:10:56', b'1');

-- ----------------------------
-- Table structure for t_conference_room
-- ----------------------------
DROP TABLE IF EXISTS `t_conference_room`;
CREATE TABLE `t_conference_room`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'conference room name',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'conference room address',
  `capacity` int NULL DEFAULT NULL COMMENT 'conference room capacity',
  `status` int NULL DEFAULT NULL COMMENT 'conference room status\r\n（1：usable、2：repair）',
  `equipment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'equipment',
  `conference_room_type_code` int NULL DEFAULT NULL COMMENT 'conference room code',
  `available_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'conference room available time（8h）',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_conference_room
-- ----------------------------
INSERT INTO `t_conference_room` VALUES (6, 'conference room6', 'Headquarters six 115', 30, 1, 'no multimedia', 1, '8.00--18.00', b'1');
INSERT INTO `t_conference_room` VALUES (9, 'conference room2', 'Block A, New District 309', 300, 1, 'with multimedia', 2, '8:00--18:00', b'1');
INSERT INTO `t_conference_room` VALUES (12, 'conference room3', 'Headquarters main building 509', 100, 1, 'with multimedia', 4, '8:00--9:00', b'0');
INSERT INTO `t_conference_room` VALUES (18, 'conference room4', 'Headquarters eight 500', 67, 1, 'with multimedia', 1, '8:00--9:00', b'1');
INSERT INTO `t_conference_room` VALUES (20, 'conference room5', 'Headquarters seven 122', 60, 1, 'no multimedia', 2, '8.00--18.00', b'0');
INSERT INTO `t_conference_room` VALUES (22, 'conference room1', 'Headquarters nine 215', 90, 1, 'with multimedia', 1, '8.00--22.00', b'1');
INSERT INTO `t_conference_room` VALUES (26, 'conference room7', 'Headquarters six 123', 90, 1, 'with multimedia', 4, '8.00--22.00', b'1');
INSERT INTO `t_conference_room` VALUES (27, 'conference room8', 'Headquarters six 123', 100, 1, 'with multimedia', 3, '8:00--22:00', b'1');
INSERT INTO `t_conference_room` VALUES (28, '', '', 20, 1, '', 1, '', b'0');
INSERT INTO `t_conference_room` VALUES (29, '', '', 11, 1, '', 1, '', b'0');
INSERT INTO `t_conference_room` VALUES (30, 'conference room', 'Headquarters six 122', 11, 1, 'no multimedia', 1, '8:00-22:00', b'0');
INSERT INTO `t_conference_room` VALUES (31, 'conference room3', 'Headquarters seven 202', 70, 1, 'no multimedia', 1, '8:00-22:00', b'1');
INSERT INTO `t_conference_room` VALUES (32, 'conference room9', 'Headquarters six 121', 40, 1, 'with multimedia', 1, '8:00-22:00', b'0');

-- ----------------------------
-- Table structure for t_conference_room_appointment
-- ----------------------------
DROP TABLE IF EXISTS `t_conference_room_appointment`;
CREATE TABLE `t_conference_room_appointment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'person\'s name of the reservation',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'person\'s username of the reservation（unique user ID）',
  `conference_room_id` bigint NULL DEFAULT NULL COMMENT 'meeting room id',
  `max_num` int NULL DEFAULT NULL COMMENT 'maximum number of participants',
  `theme` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'conference theme',
  `specialneeds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'special needs',
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'reservation date',
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'time period（Divide the day into eight segments）',
  `starttime_code` int NULL DEFAULT NULL COMMENT 'meeting start time',
  `endtime_code` int NULL DEFAULT NULL COMMENT 'meeting end time',
  `examine_status` int NULL DEFAULT 0 COMMENT 'Review status (0: unprocessed; 1: approved by the administrator; 2: approved by the department head; 3: failed to pass the review by the administrator; 4: failed to pass the review by the department head..,,, currently use 0, 1, 3)',
  `examine_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Review reason',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_conference_room_appointment
-- ----------------------------
INSERT INTO `t_conference_room_appointment` VALUES (28, 'lst', '2017051503', 9, 40, 'test', NULL, '2020-05-12', '11:00--12:00', 4, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (29, 'lst', '2017051501', 12, 20, 'test', NULL, '2020-05-12', '11:00--12:00', 4, 5, 3, 'Fail', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (30, 'lst', '2017051501', 18, 22, 'test', NULL, '2020-05-13', '11:00--12:00', 4, 5, 3, 'Fail', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (32, 'lst', '2017051501', 12, 40, 'test', NULL, '2020-05-07', NULL, 4, 5, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (34, 'lst', '2017051501', 12, 20, 'test', NULL, '2020-05-13', NULL, 7, 11, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (35, 'fg', '2017051501', 18, 3, 'test', NULL, '2020-05-02', NULL, 4, 6, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (36, 'yyx', '2017051501', 18, 20, 'test', NULL, '2020-05-14', NULL, 3, 7, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (37, 'yys', '2017051501', 18, 20, 'test', NULL, '2020-05-07', NULL, 2, 3, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (38, 'yyyx', '2035', 9, 33, 'test', NULL, '2020-05-12', NULL, 2, 3, 0, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (40, 'lst', '2017051502', 12, 30, 'test', NULL, '2020-05-01', NULL, 3, 4, 3, 'Fail', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (41, 'lst', '2017051501', 12, 20, 'test', NULL, '2020-05-07', NULL, 3, 7, 3, 'Fail', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (42, 'lst', '2017051502', 6, 12, 'test', NULL, '2020-05-01', NULL, 3, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (43, 'lst', '2017051502', 6, 12, 'test', NULL, '2020-05-01', NULL, 3, 5, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (44, 'lst', '2017051502', 9, 12, 'test', NULL, '2020-05-24', NULL, 3, 5, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (45, 'lst', '2017051502', 12, 12, 'test', NULL, '2020-05-02', NULL, 3, 5, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (52, NULL, '2017051501', 18, 100, '', NULL, '2020-05-13', '10:00--13:00', 3, 6, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (53, NULL, '2017051501', 20, 100, '', NULL, '2020-05-01', '10:00--13:00', 3, 6, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (54, NULL, '2017051501', 22, 1, '', NULL, '2020-07-12', '9:00--11:00', 9, 11, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (108, 'txx', '20200724', 22, 60, '', NULL, '2020-07-26', '11:00--14:00', 11, 14, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (110, 'txx', '20200724', 22, 60, '', NULL, '2020-07-30', '9:00--14:00', 9, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (111, 'txx', '20200724', 9, 80, '', 'No multimedia required, no notes', '2020-07-30', '9:00--15:00', 9, 15, 1, NULL, b'1');
INSERT INTO `t_conference_room_appointment` VALUES (131, 'lst', '2017051501', 6, 30, '', NULL, '2020-07-27', '14:00--16:00', 14, 16, 3, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (132, 'lst', '2017051501', 9, 30, '', 'No multimedia required, no notes', '2020-07-27', '14:00--16:00', 14, 16, 3, '', b'0');
INSERT INTO `t_conference_room_appointment` VALUES (143, '1', '123', 31, 4, '', NULL, '2020-07-29', '13:00--14:00', 13, 14, 1, NULL, b'0');
INSERT INTO `t_conference_room_appointment` VALUES (144, '1', '123', 27, 6, '', 'Multimedia required, no notes', '2020-07-29', '13:00--14:00', 13, 14, 3, '', b'0');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'notice title',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'notice content',
  `authoruuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uuid for admin login',
  `author_number` bigint NULL DEFAULT NULL COMMENT 'author username',
  `author_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'author name',
  `creat_time` datetime NULL DEFAULT NULL COMMENT 'creat time',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (28, NULL, '<p style=\"text-align: center;\">asdfdawegg</p><p>xfbaerfrvef</p>', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `t_notice` VALUES (29, NULL, 'The Lexiang conference system was officially launched on September 1.', NULL, NULL, NULL, NULL, '2023-01-22 03:21:06', b'0');
INSERT INTO `t_notice` VALUES (30, 'Latest Announcement of Meeting Room Reservation System', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The system is expected to be officially launched on September 1st.<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></p>', NULL, NULL, 'lst', '2020-08-11 03:07:17', '2023-01-22 03:21:15', b'1');
INSERT INTO `t_notice` VALUES (31, 'announcement', '<p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">1. This system adopts two reservation methods: Department reservation and cross-department reservation.</span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">Reservation in this department: If there is a conference room in the department where the user belongs, the user can directly make an appointment successfully without review by background personnel.</span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">Cross-department reservation: If the user\'s department does not have relevant conference rooms or the department\'s conference rooms cannot be reserved, cross-department reservations can be made. The application for cross-department appointment needs to be reviewed by the background staff, and the review result will be sent by email.</span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">2. The meeting room reservation period is: 8:00-18:00, overtime use should make a note when registering. (hint:</span><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">The appointment time must fall within the time period specified by the system, and the time must be entered according to the original time format of the system)</span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">3.<span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">If the multimedia equipment in the conference room fails, is damaged or the accessories are lost before use, it must be reported to the general office in time, and</span><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">Responsibilities after reporting and discovering shall be borne by the end user.</span></span></span></p><p><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(122, 118, 118); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">4. Users with other special circumstances or special needs can contact the General Office.</span></span></span></span></p>', NULL, NULL, 'lst', '2020-08-11 03:10:54', '2023-01-22 03:23:57', b'1');

-- ----------------------------
-- Table structure for t_participants
-- ----------------------------
DROP TABLE IF EXISTS `t_participants`;
CREATE TABLE `t_participants`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conference_id` int NOT NULL COMMENT 'conference id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'conference name',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'phone',
  `mailbox` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'mail',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'department',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_participants
-- ----------------------------

-- ----------------------------
-- Table structure for t_rules
-- ----------------------------
DROP TABLE IF EXISTS `t_rules`;
CREATE TABLE `t_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'rules title',
  `authoruuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uuid for author login',
  `author_number` int NULL DEFAULT NULL COMMENT 'author username',
  `author_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'author name',
  `creat_time` datetime NULL DEFAULT NULL COMMENT 'creat time',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'rules content',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_rules
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'uuid for login',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'username（unique user ID）',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'password',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'name（real name）',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'phone',
  `mailbox` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'mail',
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'department of user',
  `creat_time` datetime NULL DEFAULT NULL COMMENT 'creat time',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `sex` int NULL DEFAULT NULL COMMENT 'gender（0：male，1：female）',
  `isdel` bit(1) NULL DEFAULT NULL COMMENT 'delete or not（0：delete1：not）',
  `status` smallint NULL DEFAULT 0 COMMENT 'Review status (0: unprocessed, 1: passed, 2: not passed)',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Reason for failure',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (7, NULL, '2017051502', '2017051502', 'yyc', '18543740009', 'HBU_yyc@163.com', 'Department of Finance', NULL, '2023-01-22 03:28:55', NULL, b'1', 2, 'Incorrect');
INSERT INTO `t_user` VALUES (8, NULL, '2017051503', '2017051503', 'syq', '18543740009', '1002913814@qq.com', 'Department of Business Administration', NULL, '2023-01-22 03:28:05', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (9, NULL, '2017051504', '2017051504', 'zs', '18543740009', '1173080299@qq.com', 'Department of Library Science', NULL, '2023-01-22 03:27:45', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (10, NULL, '2017051501', '2017051501', 'lst', '17336322997', '1173080299@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:19', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (16, NULL, '24', '12', 'fdgh', 'null', '145654657@qq.com', 'Department of Accounting', NULL, '2023-01-22 03:26:40', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (17, NULL, '20170515037', '20170515037', 'lst', '17336322997', '1173080299@qq.com', 'Department of Archives', NULL, '2023-01-22 03:28:26', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (18, NULL, '123456', '123456', 'lstceshi', NULL, '1173080299@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:23', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (19, NULL, '234', 'zdg', 'dffg', 'dfg', 'agr@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:23', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (20, NULL, '234', 'sdgd', 'dfhfher', 'drh', '11@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:24', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (21, NULL, '20170515078', '123456', 'lst', NULL, '1173080299@qq.com', 'Department of Finance', NULL, '2023-01-22 03:28:42', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (22, NULL, '1111111', '000', 'syq', NULL, '1002913814@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:18', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (23, NULL, '111', '111', '111', NULL, '1002913814@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:01', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (24, NULL, '111', '111', '111', NULL, '1002913814@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:03', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (25, NULL, '20170515011', '2013dao2014', 'yyc', NULL, '1802302924@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:26', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (26, NULL, '20180515002', '123456', 'ch', NULL, '444187283@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:27', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (27, NULL, '20180515019', '123456', 'ly', '', '951789947@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:27', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (28, NULL, '20180515019', '123456', 'ly', NULL, '951789947@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:04', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (29, NULL, '20200724', '20200724', 'txx', NULL, '1664669578@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:28', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (30, NULL, '123456789', '123456', 'fxm', NULL, '3241512032@qq.com', 'Department of Finance', NULL, '2023-01-22 03:28:44', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (31, NULL, '20180514042', '633484410X', 'lx', NULL, '2571190618@qq.com', 'Department of Finance', NULL, '2023-01-22 03:28:43', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (32, NULL, '20180516041', 'czx620721', 'czx', NULL, '1045044360@qq.com', 'Department of Tourism Management', NULL, '2023-01-22 03:28:14', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (33, NULL, '20180515001', 'qweasdzxc', 'gz', NULL, '1346264621@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:22', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (34, NULL, '20180517008', '123456', 'xyz', '', '142835177@qq.com', 'Department of Archives', NULL, '2023-01-22 03:28:24', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (35, NULL, '20180512001', '123456', 'f', NULL, '123456789@qq.com', 'Department of Business Administration', NULL, '2023-01-22 03:29:10', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (36, NULL, '2018003003', '8888', 'xz', '', '951789947@qq.com', 'Department of Library Science', NULL, '2023-01-22 03:27:44', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (37, NULL, '123', '1', '1', '', '1379409273@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:29', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (38, NULL, '352', '12', 'lstdfsfg', '', '1173080299@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:06', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (39, NULL, '20170515031', '12', 'sdf', NULL, '1173080299@qq.com', 'Department of Tourism Management', NULL, '2023-01-22 03:29:13', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (40, NULL, '20180515013', '1414612316qq', 'zxy', NULL, '1414612316@qq.com', 'Department of Archives', NULL, '2023-01-22 03:28:24', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (41, NULL, '1111111222', '1414612316qq', 'sss', NULL, '1414612316@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:00', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (42, NULL, '1', '2', '3', '', '', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:24', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (43, NULL, '20180515013', '1414612316qq', 'zxy', NULL, '1414612316@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:30', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (44, NULL, '1040788', '041288', 'klq', NULL, '123456789@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:30', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (45, NULL, '20174229020', '123456', 'zxy', '', '1041611691@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:31', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (46, NULL, '201822480914', 'zxl.0808', 'zxl', NULL, '770015272@qq.com', 'Department of Tourism Management', NULL, '2023-01-22 03:28:14', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (47, NULL, '20170515012', '2013dao2014', 'yyc', NULL, '1802302924@qq.com', 'Department of Library Science', NULL, '2023-01-22 03:27:58', NULL, b'0', 1, NULL);
INSERT INTO `t_user` VALUES (48, NULL, '20170515013', '2013dao2014', 'yycc', NULL, '1802302924@qq.com', 'Department of Business Administration', NULL, '2023-01-22 03:29:08', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (49, NULL, '20170515014', '2013dao2014', 'yyccc', NULL, '1802302924@qq.com', 'Department of Tourism Management', NULL, '2023-01-22 03:29:12', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (50, NULL, '2222', '1', 'yyc', NULL, 'HBU_yyc@163.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:27:31', NULL, b'1', 1, NULL);
INSERT INTO `t_user` VALUES (51, NULL, '1', '1', 'lst', NULL, '1173080299@qq.com', 'Department of Finance', NULL, '2023-01-22 03:29:16', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (52, NULL, '111', '1', 'zy', NULL, '1173080299@qq.com', 'Department of Information Management Engineering', NULL, '2023-01-22 03:29:07', NULL, b'1', 2, 'empty');
INSERT INTO `t_user` VALUES (53, NULL, '2023', '123', 'wjw', NULL, '710890083@qq.com', 'Department of Archives', NULL, '2023-01-22 03:28:36', NULL, b'1', 1, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid for login',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'name（real name）',
  `user_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'username（unique user ID）',
  `depart_id` int NOT NULL COMMENT 'depart id',
  `sex_id` smallint NULL DEFAULT NULL COMMENT 'gender（0：male，1：female）',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'birthday',
  `user_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'phone',
  `user_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'card',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'username',
  `user_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'password',
  `user_signature` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'signature',
  `register_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'register time',
  `user_headportrait` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'user headportrait',
  `activity_level` smallint NULL DEFAULT 0 COMMENT 'activity level',
  `isfollow` bit(1) NULL DEFAULT NULL COMMENT 'isfollow',
  `follownum` bigint NOT NULL COMMENT 'follownum',
  `fans` bigint NOT NULL COMMENT 'fans',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

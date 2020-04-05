/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : ms

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 05/04/2020 16:09:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '大一');
INSERT INTO `grade` VALUES (2, '大二');
INSERT INTO `grade` VALUES (3, '大三');
INSERT INTO `grade` VALUES (4, '大四');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `gid` int(11) NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE,
  INDEX `fk_student_gid`(`gid`) USING BTREE,
  CONSTRAINT `fk_student_gid` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '888', '潘潘', '男', 20, 1, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (2, '888', '李李', '女', 22, 1, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (3, '888', '小女', '女', 25, 2, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (4, '888', '玉玉', '女', 31, 2, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (5, '888', '小章', '男', 41, 3, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (6, '888', '燕燕', '女', 51, 3, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (7, '888', '小燕', '女', 28, 4, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (8, '888', '小美', '男', 26, 4, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (9, '888', '琴琴', '女', 20, 1, '1881315679', '北京海淀', 'qq.png');
INSERT INTO `student` VALUES (10, '888', '小文', '女', 38, 3, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (11, '888', '小草', '男', 27, 1, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (12, '888', '小平', '女', 28, 2, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (13, '888', '小浩', '女', 21, 1, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (14, '888', '小杨', '女', 21, 3, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (16, '888', '研燕', '女', 21, 4, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (17, '888', '花花', '女', 18, 1, '1881315679', '北京海淀', NULL);
INSERT INTO `student` VALUES (18, '888', '美美', '男', 48, 4, '1881315679', '北京海淀', NULL);

SET FOREIGN_KEY_CHECKS = 1;

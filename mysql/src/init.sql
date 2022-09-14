/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : localhost:22068
 Source Schema         : score
 Name                  : 201954A

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 12/06/2022 11:53:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE score;
use score;

-- ----------------------------
-- Table structure for challengesAll
-- ----------------------------
DROP TABLE IF EXISTS `challengesAll`;
CREATE TABLE `challengesAll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleImg` varchar(255) DEFAULT NULL,
  `OptionA` varchar(255) DEFAULT NULL,
  `OptionB` varchar(255) DEFAULT NULL,
  `OptionC` varchar(255) DEFAULT NULL,
  `OptionD` varchar(255) DEFAULT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of challengesAll
-- ----------------------------
BEGIN;
INSERT INTO `challengesAll` VALUES (1, '1', '按下空格键执行下面程序，结果不可能为？（ ）', 'img/1-titleImg.png', '48', '122', '114', '126', '2');
INSERT INTO `challengesAll` VALUES (2, '1', '运行下面程序，下面选项正确的是？（ ）', 'img/2-titleImg.png', '只有角色能收到消息，仅小猫角色能说：“你好！”', '只有克隆体能收到消息，仅克隆体能说：“你好！”', '小猫角色和克隆体都不能说“你好！”', '小猫角色和克隆体都能接收消息，都能说：“你好！”', '4');
INSERT INTO `challengesAll` VALUES (3, '1', '角色“方块”的程序如下图所示，点击绿旗，不断按下上移键，变量“次数”为6时，按下空格键，当停止全部脚本后，舞台中出现的正方形个数是？（ ）', 'img/3-titleImg.png', '4', '5', '6', '7', '4');
INSERT INTO `challengesAll` VALUES (4, '1', '关于下面积木，正确选项是？（ ）', 'img/4-titleImg.png', '最大值是20', '最大值是25', '最小值是0', '最小值是5', '2');
INSERT INTO `challengesAll` VALUES (5, '1', '默认小猫角色，执行以下程序，舞台上会出现？（ ）', 'img/5-titleImg.png', '黑色的三角形', '黑色的正方形', '黑色的长方形', '没有任何图形', '4');
INSERT INTO `challengesAll` VALUES (6, '2', '(判断题)班里有30名同学，学号分别为1至30。小罗同学帮老师编写了下图所示的随机点名程序，程序运行后可能会选出实际不存在的学号。（ ）', 'img/6-titleImg.png', '√', 'X', NULL, NULL, '1');
INSERT INTO `challengesAll` VALUES (7, '2', '(判断题)给角色1创建仅适用于角色1的变量“次数”，复制角色1，得到角色2，角色2也会有相同名字的变量，并且也是仅适用于角色2。（ ）', 'img/7-titleImg.png', '√', 'X', NULL, NULL, '1');
INSERT INTO `challengesAll` VALUES (8, '2', '(判断题)点击绿旗，角色和克隆体一起向舞台下方移动，直到y坐标小于-150时停止运动。（ ）', 'img/8-titleImg.png', '√', 'X', NULL, NULL, '2');
INSERT INTO `challengesAll` VALUES (9, '2', '(判断题)变量名可以设置成数字。（ ）', NULL, '√', 'X', NULL, NULL, '1');
INSERT INTO `challengesAll` VALUES (10, '2', '(判断题)角色接收消息时，只能接收一个角色发过来的消息。（ ）', NULL, '√', 'X', NULL, NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for ctf
-- ----------------------------
DROP TABLE IF EXISTS `ctf`;
CREATE TABLE `ctf` (
  `id` int(11) DEFAULT NULL,
  `name` mediumtext,
  `value` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ctf
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for randChallenges
-- ----------------------------
DROP TABLE IF EXISTS `randChallenges`;
CREATE TABLE `randChallenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(255) DEFAULT NULL,
  `challengeId1` varchar(255) DEFAULT NULL,
  `challengeId2` varchar(255) DEFAULT NULL,
  `challengeId3` varchar(255) DEFAULT NULL,
  `challengeId4` varchar(255) DEFAULT NULL,
  `challengeId5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of randChallenges
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` mediumtext,
  `score` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for userAnswer
-- ----------------------------
DROP TABLE IF EXISTS `userAnswer`;
CREATE TABLE `userAnswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ans1` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ans2` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ans3` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ans4` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ans5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userAnswer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` mediumtext,
  `studentid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentid` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', 'admingyy123..');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

CREATE USER 'ctf' IDENTIFIED BY '123456';
GRANT select,insert,update ON score.* TO 'ctf'@'%';
GRANT file,insert ON *.* TO 'ctf'@'%';
FLUSH PRIVILEGES;

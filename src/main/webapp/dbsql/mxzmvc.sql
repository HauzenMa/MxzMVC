/*
Navicat MySQL Data Transfer

Source Server         : mxz
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mxzmvc

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-10 19:56:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `computer`
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pinpaiid` int(11) DEFAULT NULL,
  `chuchangdate` date DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('1', 'I7', '8000', '1', '2018-11-12', '/fileUpload/images/2.png');
INSERT INTO `computer` VALUES ('2', 'I5', '5000', '1', '2018-11-12', '/fileUpload/images/1.png');
INSERT INTO `computer` VALUES ('3', 'I7', '7500', '2', '2018-11-12', '/fileUpload/images/3.png');
INSERT INTO `computer` VALUES ('4', 'I5', '4500', '3', '2018-12-29', '/fileUpload/images/4.png');
INSERT INTO `computer` VALUES ('5', 'I7', '7000', '4', '2018-12-29', '/fileUpload/images/6.png');
INSERT INTO `computer` VALUES ('6', 'I7', '9000', '5', '2018-11-09', '/fileUpload/images/7.png');
INSERT INTO `computer` VALUES ('7', 'I9', '9000', '4', '2018-12-25', '/fileUpload/images/5.png');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '信计1班');
INSERT INTO `grade` VALUES ('2', '信计2班');
INSERT INTO `grade` VALUES ('3', '数本1班');
INSERT INTO `grade` VALUES ('4', '数本2班');
INSERT INTO `grade` VALUES ('5', '数教1班');

-- ----------------------------
-- Table structure for `pinpai`
-- ----------------------------
DROP TABLE IF EXISTS `pinpai`;
CREATE TABLE `pinpai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinpai
-- ----------------------------
INSERT INTO `pinpai` VALUES ('1', '华为');
INSERT INTO `pinpai` VALUES ('2', '小米');
INSERT INTO `pinpai` VALUES ('3', '联想');
INSERT INTO `pinpai` VALUES ('4', '戴尔');
INSERT INTO `pinpai` VALUES ('5', '惠普');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `gradeid` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '王朝', '男', '1', '2018-11-12', '/fileUpload/images/imge2.png', '我为人友善、真诚、做事细致、专注，有很强的责任心，学习<br> 能力与适应能力强，喜欢与他人交流，热爱生活，有着沉着内敛，<br> 善于思考和研究的特质。');
INSERT INTO `student` VALUES ('2', '马汉', '男', '2', '2018-11-16', '/fileUpload/images/imge4.png', '我为人友善、真诚、做事细致、专注，有很强的责任心，学习<br> 能力与适应能力强，喜欢与他人交流，热爱生活，有着沉着内敛，<br> 善于思考和研究的特质。');
INSERT INTO `student` VALUES ('3', '张龙', '男', '3', '2018-11-15', '/fileUpload/images/imge3.png', '我为人友善、真诚、做事细致、专注，有很强的责任心，学习<br> 能力与适应能力强，喜欢与他人交流，热爱生活，有着沉着内敛，<br> 善于思考和研究的特质。');
INSERT INTO `student` VALUES ('4', '赵虎', '男', '4', '2018-11-14', '/fileUpload/images/imge1.png', '我为人友善、真诚、做事细致、专注，有很强的责任心，学习<br> 能力与适应能力强，喜欢与他人交流，热爱生活，有着沉着内敛，<br> 善于思考和研究的特质。');
INSERT INTO `student` VALUES ('9', '马祥哲', '男', '2', '1998-11-08', '/fileUpload/images/img_cache2.jpg', '我为人友善、真诚、做事细致、专注，有很强的责任心，学习<br> 能力与适应能力强，喜欢与他人交流，热爱生活，有着沉着内敛，<br> 善于思考和研究的特质。 ');

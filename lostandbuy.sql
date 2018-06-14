/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : lostandbuy

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2018-06-14 14:58:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aId` int(10) NOT NULL AUTO_INCREMENT,
  `aName` varchar(20) NOT NULL,
  `aPassword` varchar(20) DEFAULT NULL,
  `isSuper` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `admin` VALUES ('2', 'xie', '123', '1');

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `cId` int(15) NOT NULL AUTO_INCREMENT,
  `cName` varchar(10) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '手机/充电宝');
INSERT INTO `catelog` VALUES ('2', '书籍/眼镜');
INSERT INTO `catelog` VALUES ('3', '卡类');
INSERT INTO `catelog` VALUES ('4', '钥匙/U盘');
INSERT INTO `catelog` VALUES ('5', '学习用品');
INSERT INTO `catelog` VALUES ('6', '伞/衣服');
INSERT INTO `catelog` VALUES ('7', '其他');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `iId` int(5) NOT NULL AUTO_INCREMENT,
  `tId` int(5) DEFAULT NULL,
  `iUrl` varchar(80) NOT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', 'f07d00e9-27f7-4806-a44d-43dee7a9a736.jpg');
INSERT INTO `image` VALUES ('2', '2', 'c8858043-3546-430f-91ba-89b480ef16fa.jpg');
INSERT INTO `image` VALUES ('3', '3', 'c4003843-2646-498e-a99c-3df681519caf.jpg');
INSERT INTO `image` VALUES ('4', '4', 'acd3001b-059d-45e8-89ce-bafbed9446a5.jpg');
INSERT INTO `image` VALUES ('5', '5', '3bb60c5f-39ba-4949-802f-92fcc8f19f91.jpg');
INSERT INTO `image` VALUES ('6', '6', '0ba56127-d545-481b-944f-6f17a0f06d85.jpg');
INSERT INTO `image` VALUES ('7', '7', 'a75e1f1a-5eda-4d23-8e03-09388b8e913a.jpg');
INSERT INTO `image` VALUES ('8', '8', '89e7ccd9-a2ca-415e-bd06-9387225743b7.jpg');
INSERT INTO `image` VALUES ('9', '9', '1c4a6cd4-0e5e-4be8-9c7c-837071b491ec.jpg');

-- ----------------------------
-- Table structure for `place`
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place` (
  `pId` int(15) NOT NULL AUTO_INCREMENT,
  `pName` varchar(15) NOT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES ('1', '宿舍区');
INSERT INTO `place` VALUES ('2', '教学楼');
INSERT INTO `place` VALUES ('3', '餐厅');
INSERT INTO `place` VALUES ('4', '操场');
INSERT INTO `place` VALUES ('5', '校园道路');
INSERT INTO `place` VALUES ('6', '校园周围');

-- ----------------------------
-- Table structure for `thing`
-- ----------------------------
DROP TABLE IF EXISTS `thing`;
CREATE TABLE `thing` (
  `tId` int(10) NOT NULL AUTO_INCREMENT,
  `cId` int(10) NOT NULL,
  `uId` int(10) DEFAULT NULL,
  `tName` varchar(20) DEFAULT NULL,
  `tAddress` varchar(80) DEFAULT NULL,
  `tTime` varchar(20) DEFAULT NULL,
  `tDescription` varchar(80) DEFAULT NULL,
  `uTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tId`),
  KEY `uid` (`uId`),
  KEY `cid` (`cId`),
  CONSTRAINT `cid` FOREIGN KEY (`cId`) REFERENCES `catelog` (`cId`),
  CONSTRAINT `uid` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thing
-- ----------------------------
INSERT INTO `thing` VALUES ('1', '7', '1', '壁纸一张', '1', '1', '一张绿色壁纸，可以找我认领。', '13333333333');
INSERT INTO `thing` VALUES ('2', '7', '2', '丢了一把雨伞', '3', '1', '丢了一把如图所示的伞，希望有捡到的好心人还给我一下，谢谢你！', '13333333333');
INSERT INTO `thing` VALUES ('3', '2', '3', '人力资源管理书', '2', '1', '捡到一本资源管理的书，有丢书的朋友可以来认领一下', '13333333333');
INSERT INTO `thing` VALUES ('4', '5', '2', '一根棕色钢笔', '2', '1', '今天在三教楼捡到一根钢笔，失主可以找我联系。', '13333333333');
INSERT INTO `thing` VALUES ('5', '4', '4', '钥匙一串', '3', '1', '今天捡到一串钥匙，失主可以找我认领', '13333333333');
INSERT INTO `thing` VALUES ('6', '4', '5', '粉色U盘', '2', '1', '捡到一个粉色带盒U盘，很新，失主可以打电话联系我。', '13333333333');
INSERT INTO `thing` VALUES ('7', '3', '2', '证件', '2', '1', '今天在操场捡到一个学生卡，有认识的同学或本人联系我拿取。', '15333333333');
INSERT INTO `thing` VALUES ('8', '5', '2', '笔袋', '2', '1', '捡到一个浅绿色笔袋，里面有笔若干，有丢失的同学联系我认领。', '13333333333');
INSERT INTO `thing` VALUES ('9', '6', '2', '一把黑白相间的伞', '5', '1', '图书馆三楼捡到一把黑白相间的伞，伞的样式如图，失主请联系我。', '13333333333');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uId` int(30) NOT NULL AUTO_INCREMENT,
  `uName` varchar(30) NOT NULL,
  `uPassword` varchar(30) DEFAULT NULL,
  `uTelephone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '追梦紫蝴蝶', 'fff', '13312341234');
INSERT INTO `user` VALUES ('2', '夺目Zled', '123', '13333333333');
INSERT INTO `user` VALUES ('3', '子阳纯一流', '123', '13312341235');
INSERT INTO `user` VALUES ('4', '子阳', '111', '11111111111');
INSERT INTO `user` VALUES ('5', 'Neonyuyang@163.com', 'lwlzgtssb5', '18539270747');
INSERT INTO `user` VALUES ('6', '深蓝梦境22', '22', '15093253629');
INSERT INTO `user` VALUES ('7', '深蓝梦境11', '111', '15290229900');
INSERT INTO `user` VALUES ('8', 'Neon', '222', '13283079817');

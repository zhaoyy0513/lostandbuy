/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : squirrel

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2018-05-25 10:45:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '闲置数码', '7', '1');
INSERT INTO `catelog` VALUES ('2', '校园代步', '6', '1');
INSERT INTO `catelog` VALUES ('3', '电器日用', '6', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '10', '1');
INSERT INTO `catelog` VALUES ('5', '美妆衣物', '6', '1');
INSERT INTO `catelog` VALUES ('6', '运动棋牌', '2', '1');
INSERT INTO `catelog` VALUES ('7', '票券小物', '2', '1');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` text COMMENT '评论内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `commet_num` int(11) DEFAULT NULL COMMENT '评论回复数量',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '6', '1', '精美吉他', '130.00', '160.00', '2018-05-13', '2018-05-13', '2018-05-23', '自用二手吉他，9成新，低价出售，有意者联系。', null);
INSERT INTO `goods` VALUES ('2', '2', '1', '山地车', '520.00', '890.00', '2018-05-13', '2018-05-13', '2018-05-23', '8成新山地车，无损坏，喜欢Call我。', null);
INSERT INTO `goods` VALUES ('3', '3', '1', '无线鼠标', '23.00', '48.00', '2018-05-13', '2018-05-13', '2018-05-23', '罗技无线鼠标，自用一个月，9成新，手感好，反应灵敏。', null);
INSERT INTO `goods` VALUES ('5', '1', '2', '数码相机', '580.00', '1350.00', '2018-05-14', '2018-05-14', '2018-05-24', '自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。', null);
INSERT INTO `goods` VALUES ('6', '1', '2', '笔记本电脑', '690.00', '2300.00', '2018-05-14', '2018-05-14', '2018-05-24', '7成新14寸笔记本电脑，商务本，适合办公，2G内存。', null);
INSERT INTO `goods` VALUES ('7', '3', '2', '收纳盒', '15.00', '36.00', '2018-05-14', '2018-05-14', '2018-05-24', '3层塑料物品收纳盒，毕业了，低价出售。', null);
INSERT INTO `goods` VALUES ('8', '3', '1', '台灯', '32.00', '58.00', '2018-05-14', '2018-05-14', '2018-05-14', '考研时购买的台灯，可插USB接口。', null);
INSERT INTO `goods` VALUES ('9', '5', '2', '女鞋', '35.00', '86.00', '2018-05-14', '2018-05-14', '2018-05-24', '学生女鞋', null);
INSERT INTO `goods` VALUES ('11', '1', '3', '无线传呼机', '230.00', '370.00', '2018-05-14', '2018-05-14', '2018-05-24', '一对无线传呼机，带有充电器，可以传呼2公里。', null);
INSERT INTO `goods` VALUES ('12', '5', '3', '手提女包', '36.00', '89.00', '2018-05-14', '2018-05-14', '2018-05-24', '手提女包，自用一个月。', null);
INSERT INTO `goods` VALUES ('13', '5', '1', '手提包', '15.00', '23.00', '2018-05-14', '2018-05-14', '2018-05-24', '自用手提包，8成新，便宜出。', null);
INSERT INTO `goods` VALUES ('16', '6', '2', '耐克运动书包', '56.00', '198.00', '2018-05-14', '2018-05-14', '2018-05-14', '去年年底购买的耐克书包，8成新，无损坏，可以装电脑，很漂亮，有意者联系。', null);
INSERT INTO `goods` VALUES ('17', '4', '2', '二手小说', '10.00', '65.00', '2018-05-14', '2018-05-14', '2018-05-24', '毕业季，一书架小说，便宜出售。', null);
INSERT INTO `goods` VALUES ('18', '4', '2', '公务员考试资料', '35.00', '79.00', '2018-05-14', '2018-05-14', '2018-05-24', '刚刚考完公务员的复习资料。淘宝购买，低价出售。', null);
INSERT INTO `goods` VALUES ('20', '1', '4', 'Thinkpad笔记本', '1600.00', '2300.00', '2018-05-14', '2018-05-14', '2018-05-24', '京东购买的Thinkpad笔记本电脑，九成新。限鲁大学生。', null);
INSERT INTO `goods` VALUES ('21', '7', '4', '水晶挂件', '20.00', '60.00', '2018-05-14', '2018-05-14', '2018-05-24', '水晶挂件。一套，全部出。很精美很漂亮。', null);
INSERT INTO `goods` VALUES ('22', '4', '3', '《Python编程实践》', '32.00', '69.00', '2018-05-14', '2018-05-14', '2018-05-24', '亚马逊购买', null);
INSERT INTO `goods` VALUES ('23', '4', '3', '《未来简史》', '40.00', '69.00', '2018-05-14', '2018-05-14', '2018-05-24', '9.5成新书籍，《未来简史》，已读完，推荐。', null);
INSERT INTO `goods` VALUES ('24', '7', '3', '玉挂', '260.00', '450.00', '2018-05-14', '2018-05-14', '2018-05-24', '纯玉，购买于食品店，有发票。', null);
INSERT INTO `goods` VALUES ('26', '2', '3', '概念代步车', '1300.00', '3500.00', '2018-05-14', '2018-05-14', '2018-05-24', '9成新概念代步车，上市3个月。', null);
INSERT INTO `goods` VALUES ('27', '2', '3', '爱玛电动车', '800.00', '1500.00', '2018-05-14', '2018-05-14', '2018-05-24', '爱玛电动车，爱就马上行动吧。', null);
INSERT INTO `goods` VALUES ('28', '3', '3', '公牛插排', '15.00', '36.00', '2018-05-14', '2018-05-14', '2018-05-24', '京东购买的插排，9成新。', null);
INSERT INTO `goods` VALUES ('29', '5', '1', '李宁音速', '90.00', '100.00', '2018-05-14', '2018-05-14', '2018-05-24', '李宁旗舰店购买的李宁音速，9成新，41号，有意者联系。', null);
INSERT INTO `goods` VALUES ('31', '2', '1', '山地车', '860.00', '1300.00', '2018-05-15', '2018-05-15', '2018-05-25', 'GIANT山地车，9成新，骑行两个月，无任何损坏。', null);
INSERT INTO `goods` VALUES ('32', '4', '1', '《形势与政策》', '35.00', '65.00', '2018-05-15', '2018-05-15', '2018-05-25', '一个月前购买的书籍，现在已看完，还不错，收获很多。现转卖。', null);
INSERT INTO `goods` VALUES ('34', '4', '2', '《世界汉学》', '18.00', '36.00', '2018-05-15', '2018-05-15', '2018-05-25', '一本记载了汉代发展的书籍。', null);
INSERT INTO `goods` VALUES ('35', '1', '2', '欧达数码相机', '890.00', '1300.00', '2018-05-15', '2018-05-15', '2018-05-25', '9成新欧达数码相机，刚入手一个索尼，打算出掉，可议价。', null);
INSERT INTO `goods` VALUES ('36', '3', '2', '手机充电器', '15.00', '38.00', '2018-05-15', '2018-05-15', '2018-05-25', '华为手机充电器，手机已毁，现转让充电器。', null);
INSERT INTO `goods` VALUES ('37', '1', '2', '摄像头', '360.00', '480.00', '2018-05-15', '2018-05-15', '2018-05-25', '可旋转摄像头', null);
INSERT INTO `goods` VALUES ('38', '3', '2', '漫步者耳机', '380.00', '690.00', '2018-05-15', '2018-05-15', '2018-05-25', '漫步者耳机，音质好，9.5成新。', null);
INSERT INTO `goods` VALUES ('39', '1', '2', '小米笔记本', '3200.00', '5800.00', '2018-05-15', '2018-05-15', '2018-05-25', '去年年底京东购买的笔记本，未过保，无损坏。', null);
INSERT INTO `goods` VALUES ('40', '2', '2', '死飞自行车', '350.00', '680.00', '2018-05-15', '2018-05-15', '2018-05-25', '黄色死飞自行车，骑行一年。9成新。', null);
INSERT INTO `goods` VALUES ('41', '2', '2', '自行车', '360.00', '480.00', '2018-05-15', '2018-05-15', '2018-05-25', '银色自行车。', null);
INSERT INTO `goods` VALUES ('44', '5', '2', 't恤套装', '40.00', '90.00', '2018-05-15', '2018-05-15', '2018-05-25', '上身+下身，全套出。', null);
INSERT INTO `goods` VALUES ('45', '5', '2', 't恤', '13.00', '36.00', '2018-05-15', '2018-05-15', '2018-05-25', '淘宝购买，低价出。', null);
INSERT INTO `goods` VALUES ('46', '4', '1', 'Spring3.x--企业开发实战', '95.00', '112.00', '2018-05-15', '2018-05-15', '2018-05-25', '作为Spring3.x的升级版，书内容还是相当不错，讲解非常细致，分析非常到位，真正做到理论结合实际，对目前大环境下质量普遍不好的情况下，该书还真是值得购买和通读的。', null);
INSERT INTO `goods` VALUES ('47', '4', '1', 'spring实战', '60.00', '80.00', '2018-05-16', '2018-05-16', '2018-05-26', '非常畅销的Spring图书', null);
INSERT INTO `goods` VALUES ('48', '4', '1', '图书', '25.70', '36.50', '2018-05-16', '2018-05-16', '2018-05-26', '淘宝购买。', null);
INSERT INTO `goods` VALUES ('49', '4', '6', 'android进阶之光', '45.00', '69.00', '2018-05-18', '2018-05-18', '2018-05-28', '买来半年，看完之后出售的，有想要的同学记得私心我啊', null);

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', '5a5f24daN6981d6c9.jpg');
INSERT INTO `image` VALUES ('2', '2', 'f4ccf238-e458-4dda-9ed8-88bca2d42309.jpg');
INSERT INTO `image` VALUES ('3', '3', 'e57aa97e408a.jpg');
INSERT INTO `image` VALUES ('4', '4', 'f91335d4-784b-443a-bb68-34645ec164f8.jpg');
INSERT INTO `image` VALUES ('5', '5', 'rBEhUlNXX8IIAAAAAAH_AYT6NkgAAMWbwOgii0AAf8Z298.jpg');
INSERT INTO `image` VALUES ('6', '6', '59e847d0N46f89260.jpg');
INSERT INTO `image` VALUES ('7', '7', 'd65275a9a61a.jpg');
INSERT INTO `image` VALUES ('8', '8', 'cafe6e6af740.jpg');
INSERT INTO `image` VALUES ('9', '9', '5ae076ceN69b4acfd.jpg');
INSERT INTO `image` VALUES ('11', '11', '68bac661-f69f-4ec5-8f21-f92ec1970547.jpg');
INSERT INTO `image` VALUES ('12', '12', '5afd2d94Na17e9991.jpg');
INSERT INTO `image` VALUES ('13', '13', '583e69a6Naf1f48ab.jpg');
INSERT INTO `image` VALUES ('16', '16', '58352041N7b36f881.jpg');
INSERT INTO `image` VALUES ('17', '17', '598946baN4821811a.jpg');
INSERT INTO `image` VALUES ('18', '18', '5aaf9d64N29216bcc.jpg');
INSERT INTO `image` VALUES ('20', '20', '5aceed48-21f6-4aa8-9cfa-6bb831694c3a.jpg');
INSERT INTO `image` VALUES ('21', '21', '586f9591N18c73bc8.jpg');
INSERT INTO `image` VALUES ('22', '22', '5acb3627N8191c867.jpg');
INSERT INTO `image` VALUES ('23', '23', '5a40c2acN6c489c67.jpg');
INSERT INTO `image` VALUES ('24', '24', '59ddf280N4b2a9abd.jpg');
INSERT INTO `image` VALUES ('26', '26', '27c63995-9ff9-453d-b24f-d9aa95dcc138.jpg');
INSERT INTO `image` VALUES ('27', '27', 'e80e60a1-859c-4277-9a6a-c6bfe95dcf7a.jpg');
INSERT INTO `image` VALUES ('28', '28', '352aed2a9e6c.jpg');
INSERT INTO `image` VALUES ('29', '29', '5ad9de3aN536ab4c2.jpg');
INSERT INTO `image` VALUES ('31', '31', '2952fe1e-0633-4f9d-9249-f999603235f5.jpg');
INSERT INTO `image` VALUES ('32', '32', '5a13d434N640384c5.jpg');
INSERT INTO `image` VALUES ('34', '34', '5a9510ccN204e1c19.jpg');
INSERT INTO `image` VALUES ('35', '35', 'a90f891e-9b74-4f92-a800-03ef83c0a69c.jpg');
INSERT INTO `image` VALUES ('36', '36', '5a9ce729Nf9f9ae28.jpg');
INSERT INTO `image` VALUES ('37', '37', '85d132d0-bb61-4519-a08e-ec29937e4426.jpg');
INSERT INTO `image` VALUES ('38', '38', '5a08f23aNace49d50.jpg');
INSERT INTO `image` VALUES ('39', '39', '9d0782df-277f-45e6-b3b4-c424d688e312.jpg');
INSERT INTO `image` VALUES ('40', '40', 'edec64320f67.jpg');
INSERT INTO `image` VALUES ('41', '41', '26c2c89b-9312-4759-88a0-7f73f86c549d.jpg');
INSERT INTO `image` VALUES ('44', '44', '5ae2bf7eN6ebb597f.jpg');
INSERT INTO `image` VALUES ('45', '45', '5a48ab8eNa5424224.jpg');
INSERT INTO `image` VALUES ('46', '46', '5412ab6eN545ace61.jpg');
INSERT INTO `image` VALUES ('47', '47', '5a93c36fNa6a46a43.jpg');
INSERT INTO `image` VALUES ('48', '48', '5ab0c04fN44afd78e.jpg');
INSERT INTO `image` VALUES ('49', '49', '1fde0228-05d4-4396-b71c-2e4b2119241a.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` tinyint(10) DEFAULT '10' COMMENT '权限值，普通用户默认为10',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345678901', '张三', 'EBD28E84682B96B4C84B365C04A1D43B', '666666666', '2018-05-10', '11', '90', null, null);
INSERT INTO `user` VALUES ('2', '12345678901', '李四', '93A786C3CC016637B197CB9D495427BD', '777777777', '2018-05-14', '17', '10', null, null);
INSERT INTO `user` VALUES ('3', '12345678901', '王五', 'E10ADC3949BA59ABBE56E057F20F883E', '111111111', '2018-05-14', '8', '10', null, null);
INSERT INTO `user` VALUES ('4', '12345678901', '赵六', 'F9680877DCD79E03E3CE67151AEBD584', '222222222', '2018-05-15 12:29', '2', '10', null, null);
INSERT INTO `user` VALUES ('5', '12345678901', '周七', 'F9680877DCD79E03E3CE67151AEBD', '333333333', '2018-05-01', '0', '90', null, '0');
INSERT INTO `user` VALUES ('6', '18539270747', '深蓝梦境', 'E10ADC3949BA59ABBE56E057F20F883E', '888888888', '2018-05-18 14:24', '1', null, null, null);

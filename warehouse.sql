/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2020-03-06 15:35:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connectionpersion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张超市', '111', '武汉', '027-9123131', '张大明', '15279230588', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('2', '小明超市', '222', '深圳', '0755-9123131', '张小明', '13064154936', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('3', '快七超市', '430000', '武汉', '027-11011011', '雷生', '13617020687', '招商银行', '6543123341334133', '6666@66.com', '545341', '1');
INSERT INTO `bus_customer` VALUES ('4', '丽云超市', '332005', '十里大道1039号', '0792-13658745', '射可可', '13648524759', '建设银行', '36245684125509', '13648524759@163.com', '152632', '1');
INSERT INTO `bus_customer` VALUES ('8', '寻鲁超市', '332005', '十里大楼', '0792-56214528', '周三', '15236987455', '农业银行', '362458651236509', '15236987455@163.com', '320156', '1');
INSERT INTO `bus_customer` VALUES ('9', '姚懿', '331409', '花花', '15032506306', '姚懿', '15032506306', '工商银行', '621788889544', 'yaoyi@imoonfish.com', '33333', '1');

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `produceplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodspackage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promitcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bus_goods_ibfk_1` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`)';

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '488', '10', '2018-12-25/userface1.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1100', '10', '2018-12-25/userface2.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', '28', '1021', '100', '2018-12-25/userface3.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '1100', '10', '2018-12-25/userface4.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', '3', '1000', '100', '2018-12-25/userface5.jpg', '1', '3');

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bus_inport_ibfk_1` (`providerid`) USING BTREE,
  KEY `bus_inport_ibfk_2` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`); (`goo';

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 00:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 00:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 00:00:00', '张三', '1000', '无', '2', '3', '1');
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 00:00:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-05-07 00:00:00', '张三', '100', '', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '支付宝', '2018-09-17 16:12:25', '超级管理员', '21', '21', '21', '1', '3');
INSERT INTO `bus_inport` VALUES ('12', '微信', '2018-12-25 16:48:24', '超级管理员', '100', '123213213', '12321321', '3', '1');

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outportprice` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('1', '3', '微信', '2019-08-16 08:19:50', '超级管理员', '12321321', '1', '', '1');
INSERT INTO `bus_outport` VALUES ('2', '3', '微信', '2019-08-16 08:26:54', '超级管理员', '12321321', '11', '11', '1');

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connectionperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');
INSERT INTO `bus_provider` VALUES ('4', '蒙牛集团', '332005', '内蒙古', '0790-362514856', '姿态', '13617252689', '中国银行', '36214587962509', '13617252689@163.com', '364145', '1');
INSERT INTO `bus_provider` VALUES ('5', '伊利集团', '562115', '内蒙古', '0792-36548569', 'Rita', '13698560566', '建设银行', '3621458963596509', '13698560566@163.com', '362514', '1');
INSERT INTO `bus_provider` VALUES ('9', 'df6666', 'df', 'dfffff6666', 'fd666', 'df', '23e4', 'df', 'fd', 'fd', 'df', '1');

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL COMMENT '是否展开，0不展开，1展开',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总经办', '1', '大BOSS', '深圳', '1', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('2', '1', '销售部', '0', '程序员屌丝', '武汉', '1', '2', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('3', '1', '运营部', '0', '无', '武汉', '1', '3', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('4', '1', '生产部', '0', '无', '武汉', '1', '4', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售一部', '0', '销售一部', '武汉', '1', '5', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('6', '2', '销售二部', '0', '销售二部', '武汉', '1', '6', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('7', '3', '运营一部', '0', '运营一部', '武汉', '1', '7', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('8', '2', '销售三部', '0', '销售三部', '11', '1', '8', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('9', '2', '销售四部', '0', '销售四部', '222', '1', '9', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('10', '2', '销售五部', '0', '销售五部', '33', '1', '10', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('18', '4', '生产一部', '0', '生产食品', '武汉', '1', '11', '2019-04-13 09:49:38');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('11', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:23:26');
INSERT INTO `sys_loginfo` VALUES ('12', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:27:20');
INSERT INTO `sys_loginfo` VALUES ('13', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:38:38');
INSERT INTO `sys_loginfo` VALUES ('14', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:45:25');
INSERT INTO `sys_loginfo` VALUES ('15', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:21:52');
INSERT INTO `sys_loginfo` VALUES ('16', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:23:39');
INSERT INTO `sys_loginfo` VALUES ('17', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:26:10');
INSERT INTO `sys_loginfo` VALUES ('18', '落亦--luoyi', '127.0.0.1', '2019-11-25 15:53:00');
INSERT INTO `sys_loginfo` VALUES ('19', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 08:32:41');
INSERT INTO `sys_loginfo` VALUES ('20', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 09:18:06');
INSERT INTO `sys_loginfo` VALUES ('21', '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-26 09:59:19');
INSERT INTO `sys_loginfo` VALUES ('22', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 10:48:05');
INSERT INTO `sys_loginfo` VALUES ('23', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:15:03');
INSERT INTO `sys_loginfo` VALUES ('24', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:42:02');
INSERT INTO `sys_loginfo` VALUES ('25', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 16:56:54');
INSERT INTO `sys_loginfo` VALUES ('26', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:07:44');
INSERT INTO `sys_loginfo` VALUES ('27', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:08:08');
INSERT INTO `sys_loginfo` VALUES ('28', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 19:23:12');
INSERT INTO `sys_loginfo` VALUES ('29', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 20:46:57');
INSERT INTO `sys_loginfo` VALUES ('30', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:17:48');
INSERT INTO `sys_loginfo` VALUES ('31', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:21:16');
INSERT INTO `sys_loginfo` VALUES ('32', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:13:56');
INSERT INTO `sys_loginfo` VALUES ('33', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:29:17');
INSERT INTO `sys_loginfo` VALUES ('34', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:30:38');
INSERT INTO `sys_loginfo` VALUES ('35', '落亦--luoyi', '127.0.0.1', '2019-11-27 20:32:36');
INSERT INTO `sys_loginfo` VALUES ('36', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:33:47');
INSERT INTO `sys_loginfo` VALUES ('37', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 08:52:02');
INSERT INTO `sys_loginfo` VALUES ('38', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:14');
INSERT INTO `sys_loginfo` VALUES ('39', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:23');
INSERT INTO `sys_loginfo` VALUES ('40', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:10:00');
INSERT INTO `sys_loginfo` VALUES ('41', '落亦--luoyi', '127.0.0.1', '2019-11-28 09:10:53');
INSERT INTO `sys_loginfo` VALUES ('42', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:17:06');
INSERT INTO `sys_loginfo` VALUES ('43', '落亦--luoyi', '127.0.0.1', '2019-11-28 09:18:25');
INSERT INTO `sys_loginfo` VALUES ('44', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:19:19');
INSERT INTO `sys_loginfo` VALUES ('45', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:43:12');
INSERT INTO `sys_loginfo` VALUES ('46', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:55:00');
INSERT INTO `sys_loginfo` VALUES ('47', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:56:54');
INSERT INTO `sys_loginfo` VALUES ('48', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:59:18');
INSERT INTO `sys_loginfo` VALUES ('49', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:28:42');
INSERT INTO `sys_loginfo` VALUES ('50', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:35:39');
INSERT INTO `sys_loginfo` VALUES ('51', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:46:07');
INSERT INTO `sys_loginfo` VALUES ('52', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:56:34');
INSERT INTO `sys_loginfo` VALUES ('53', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:57:11');
INSERT INTO `sys_loginfo` VALUES ('54', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 20:37:00');
INSERT INTO `sys_loginfo` VALUES ('55', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:29:07');
INSERT INTO `sys_loginfo` VALUES ('56', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:35:40');
INSERT INTO `sys_loginfo` VALUES ('57', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:38:15');
INSERT INTO `sys_loginfo` VALUES ('58', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:39:56');
INSERT INTO `sys_loginfo` VALUES ('59', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 08:34:49');
INSERT INTO `sys_loginfo` VALUES ('60', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:15:39');
INSERT INTO `sys_loginfo` VALUES ('61', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:24:44');
INSERT INTO `sys_loginfo` VALUES ('62', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:29:50');
INSERT INTO `sys_loginfo` VALUES ('63', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:13:31');
INSERT INTO `sys_loginfo` VALUES ('64', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:45:24');
INSERT INTO `sys_loginfo` VALUES ('65', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:51:44');
INSERT INTO `sys_loginfo` VALUES ('66', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 11:07:38');
INSERT INTO `sys_loginfo` VALUES ('67', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 21:52:58');
INSERT INTO `sys_loginfo` VALUES ('68', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:00:53');
INSERT INTO `sys_loginfo` VALUES ('69', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:13:18');
INSERT INTO `sys_loginfo` VALUES ('70', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:23:34');
INSERT INTO `sys_loginfo` VALUES ('71', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:28:58');
INSERT INTO `sys_loginfo` VALUES ('72', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:30:01');
INSERT INTO `sys_loginfo` VALUES ('73', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:01');
INSERT INTO `sys_loginfo` VALUES ('74', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:47');
INSERT INTO `sys_loginfo` VALUES ('75', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:45:21');
INSERT INTO `sys_loginfo` VALUES ('76', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:05:59');
INSERT INTO `sys_loginfo` VALUES ('77', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:14:08');
INSERT INTO `sys_loginfo` VALUES ('78', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:19:56');
INSERT INTO `sys_loginfo` VALUES ('79', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:29:39');
INSERT INTO `sys_loginfo` VALUES ('80', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:24:06');
INSERT INTO `sys_loginfo` VALUES ('81', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:40:39');
INSERT INTO `sys_loginfo` VALUES ('82', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:42:36');
INSERT INTO `sys_loginfo` VALUES ('83', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:47:08');
INSERT INTO `sys_loginfo` VALUES ('84', '落亦--luoyi', '127.0.0.1', '2019-11-30 11:59:23');
INSERT INTO `sys_loginfo` VALUES ('85', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:03:46');
INSERT INTO `sys_loginfo` VALUES ('86', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:18:12');
INSERT INTO `sys_loginfo` VALUES ('87', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:58:59');
INSERT INTO `sys_loginfo` VALUES ('88', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 18:29:39');
INSERT INTO `sys_loginfo` VALUES ('89', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 09:37:38');
INSERT INTO `sys_loginfo` VALUES ('90', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 11:46:14');
INSERT INTO `sys_loginfo` VALUES ('91', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:39:07');
INSERT INTO `sys_loginfo` VALUES ('92', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:42:01');
INSERT INTO `sys_loginfo` VALUES ('93', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:44:22');
INSERT INTO `sys_loginfo` VALUES ('94', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:49:58');
INSERT INTO `sys_loginfo` VALUES ('95', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:40:27');
INSERT INTO `sys_loginfo` VALUES ('96', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:41:44');
INSERT INTO `sys_loginfo` VALUES ('97', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:51:51');
INSERT INTO `sys_loginfo` VALUES ('98', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 19:44:13');
INSERT INTO `sys_loginfo` VALUES ('99', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 08:40:06');
INSERT INTO `sys_loginfo` VALUES ('100', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:17:34');
INSERT INTO `sys_loginfo` VALUES ('101', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:33');
INSERT INTO `sys_loginfo` VALUES ('102', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:54');
INSERT INTO `sys_loginfo` VALUES ('103', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:46:23');
INSERT INTO `sys_loginfo` VALUES ('104', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:52:24');
INSERT INTO `sys_loginfo` VALUES ('105', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 11:12:01');
INSERT INTO `sys_loginfo` VALUES ('106', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 13:52:12');
INSERT INTO `sys_loginfo` VALUES ('107', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:33');
INSERT INTO `sys_loginfo` VALUES ('108', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:09:36');
INSERT INTO `sys_loginfo` VALUES ('109', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:12:28');
INSERT INTO `sys_loginfo` VALUES ('110', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:13:55');
INSERT INTO `sys_loginfo` VALUES ('111', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:20:36');
INSERT INTO `sys_loginfo` VALUES ('112', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:21:06');
INSERT INTO `sys_loginfo` VALUES ('113', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:37');
INSERT INTO `sys_loginfo` VALUES ('114', '旦素一-dansuyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:54');
INSERT INTO `sys_loginfo` VALUES ('115', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:04:21');
INSERT INTO `sys_loginfo` VALUES ('116', '李九-lijiu', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:02');
INSERT INTO `sys_loginfo` VALUES ('117', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:25');
INSERT INTO `sys_loginfo` VALUES ('118', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 08:36:54');
INSERT INTO `sys_loginfo` VALUES ('119', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:18:26');
INSERT INTO `sys_loginfo` VALUES ('120', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:40:35');
INSERT INTO `sys_loginfo` VALUES ('121', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:14:43');
INSERT INTO `sys_loginfo` VALUES ('122', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:27:12');
INSERT INTO `sys_loginfo` VALUES ('123', '李约素-liyuesu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:12');
INSERT INTO `sys_loginfo` VALUES ('124', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:20');
INSERT INTO `sys_loginfo` VALUES ('125', '赵六-zhaoliu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:28');
INSERT INTO `sys_loginfo` VALUES ('126', '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:40');
INSERT INTO `sys_loginfo` VALUES ('127', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:51');
INSERT INTO `sys_loginfo` VALUES ('128', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:00');
INSERT INTO `sys_loginfo` VALUES ('129', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:16');
INSERT INTO `sys_loginfo` VALUES ('130', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 11:13:42');
INSERT INTO `sys_loginfo` VALUES ('131', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:15:22');
INSERT INTO `sys_loginfo` VALUES ('132', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:16:03');
INSERT INTO `sys_loginfo` VALUES ('133', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:27:27');
INSERT INTO `sys_loginfo` VALUES ('134', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:32:11');
INSERT INTO `sys_loginfo` VALUES ('135', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:39:49');
INSERT INTO `sys_loginfo` VALUES ('136', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:43:26');
INSERT INTO `sys_loginfo` VALUES ('137', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:44:41');
INSERT INTO `sys_loginfo` VALUES ('138', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:35:56');
INSERT INTO `sys_loginfo` VALUES ('139', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:53:28');
INSERT INTO `sys_loginfo` VALUES ('140', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:02:42');
INSERT INTO `sys_loginfo` VALUES ('141', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:50:28');
INSERT INTO `sys_loginfo` VALUES ('142', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:20:01');
INSERT INTO `sys_loginfo` VALUES ('143', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:22:13');
INSERT INTO `sys_loginfo` VALUES ('144', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:19');
INSERT INTO `sys_loginfo` VALUES ('145', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:51');
INSERT INTO `sys_loginfo` VALUES ('146', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:38:39');
INSERT INTO `sys_loginfo` VALUES ('147', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 20:38:28');
INSERT INTO `sys_loginfo` VALUES ('148', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:05:55');
INSERT INTO `sys_loginfo` VALUES ('149', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:06:49');
INSERT INTO `sys_loginfo` VALUES ('150', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:07:39');
INSERT INTO `sys_loginfo` VALUES ('151', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:10:07');
INSERT INTO `sys_loginfo` VALUES ('152', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:47');
INSERT INTO `sys_loginfo` VALUES ('153', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:58');
INSERT INTO `sys_loginfo` VALUES ('154', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:54:31');
INSERT INTO `sys_loginfo` VALUES ('155', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 22:55:00');
INSERT INTO `sys_loginfo` VALUES ('156', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:57:38');
INSERT INTO `sys_loginfo` VALUES ('157', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:18');
INSERT INTO `sys_loginfo` VALUES ('158', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:38');
INSERT INTO `sys_loginfo` VALUES ('159', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:36:42');
INSERT INTO `sys_loginfo` VALUES ('160', '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:18');
INSERT INTO `sys_loginfo` VALUES ('161', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:46');
INSERT INTO `sys_loginfo` VALUES ('162', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:45:31');
INSERT INTO `sys_loginfo` VALUES ('163', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:03');
INSERT INTO `sys_loginfo` VALUES ('164', '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:41');
INSERT INTO `sys_loginfo` VALUES ('165', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:00');
INSERT INTO `sys_loginfo` VALUES ('166', '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:52');
INSERT INTO `sys_loginfo` VALUES ('167', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:49:12');
INSERT INTO `sys_loginfo` VALUES ('168', '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:36');
INSERT INTO `sys_loginfo` VALUES ('169', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:52');
INSERT INTO `sys_loginfo` VALUES ('170', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:53:36');
INSERT INTO `sys_loginfo` VALUES ('171', '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:55:07');
INSERT INTO `sys_loginfo` VALUES ('172', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 09:31:52');
INSERT INTO `sys_loginfo` VALUES ('173', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 22:30:06');
INSERT INTO `sys_loginfo` VALUES ('174', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:00:14');
INSERT INTO `sys_loginfo` VALUES ('175', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:19:13');
INSERT INTO `sys_loginfo` VALUES ('176', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:22:29');
INSERT INTO `sys_loginfo` VALUES ('177', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:24:33');
INSERT INTO `sys_loginfo` VALUES ('178', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:26:13');
INSERT INTO `sys_loginfo` VALUES ('179', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:32:24');
INSERT INTO `sys_loginfo` VALUES ('180', '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-12-09 16:14:07');
INSERT INTO `sys_loginfo` VALUES ('181', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 06:00:14');
INSERT INTO `sys_loginfo` VALUES ('182', '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 06:02:35');
INSERT INTO `sys_loginfo` VALUES ('183', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:05:29');
INSERT INTO `sys_loginfo` VALUES ('184', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:05:47');
INSERT INTO `sys_loginfo` VALUES ('185', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:24:57');
INSERT INTO `sys_loginfo` VALUES ('186', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 06:25:44');
INSERT INTO `sys_loginfo` VALUES ('187', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 06:26:38');
INSERT INTO `sys_loginfo` VALUES ('188', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 06:26:53');
INSERT INTO `sys_loginfo` VALUES ('189', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 06:27:22');
INSERT INTO `sys_loginfo` VALUES ('190', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:27:40');
INSERT INTO `sys_loginfo` VALUES ('191', '贺紫薇-1005', '0:0:0:0:0:0:0:1', '2020-03-06 06:28:05');
INSERT INTO `sys_loginfo` VALUES ('192', '贺紫薇-1005', '0:0:0:0:0:0:0:1', '2020-03-06 06:28:29');
INSERT INTO `sys_loginfo` VALUES ('193', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:32:00');
INSERT INTO `sys_loginfo` VALUES ('194', '贺紫微-hzw', '0:0:0:0:0:0:0:1', '2020-03-06 06:32:15');
INSERT INTO `sys_loginfo` VALUES ('195', '贺紫微-1001', '0:0:0:0:0:0:0:1', '2020-03-06 06:32:39');
INSERT INTO `sys_loginfo` VALUES ('196', '贺紫微-1001', '0:0:0:0:0:0:0:1', '2020-03-06 06:34:42');
INSERT INTO `sys_loginfo` VALUES ('197', '贺紫薇-1005', '0:0:0:0:0:0:0:1', '2020-03-06 06:43:05');
INSERT INTO `sys_loginfo` VALUES ('198', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:52:25');
INSERT INTO `sys_loginfo` VALUES ('199', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 06:56:48');
INSERT INTO `sys_loginfo` VALUES ('200', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:09:11');
INSERT INTO `sys_loginfo` VALUES ('201', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:13:31');
INSERT INTO `sys_loginfo` VALUES ('202', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:15:33');
INSERT INTO `sys_loginfo` VALUES ('203', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:17:05');
INSERT INTO `sys_loginfo` VALUES ('204', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:17:42');
INSERT INTO `sys_loginfo` VALUES ('205', '贺紫微-1001', '0:0:0:0:0:0:0:1', '2020-03-06 07:18:52');
INSERT INTO `sys_loginfo` VALUES ('206', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:23:21');
INSERT INTO `sys_loginfo` VALUES ('207', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:25:05');
INSERT INTO `sys_loginfo` VALUES ('208', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:27:50');
INSERT INTO `sys_loginfo` VALUES ('209', '贺紫薇-1006', '0:0:0:0:0:0:0:1', '2020-03-06 07:29:39');
INSERT INTO `sys_loginfo` VALUES ('210', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 07:30:46');
INSERT INTO `sys_loginfo` VALUES ('211', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-03-06 07:34:00');
INSERT INTO `sys_loginfo` VALUES ('212', '贺紫薇-1004', '0:0:0:0:0:0:0:1', '2020-03-06 07:35:23');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '关于系统V1.3更新公告', '2', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES ('15', '111111', null, '2019-11-25 15:30:06', '落亦-');
INSERT INTO `sys_notice` VALUES ('16', '试一下', null, '2019-11-25 15:32:44', '落亦-');
INSERT INTO `sys_notice` VALUES ('17', '忘记写name属性了', '这回应该可以了', '2019-11-25 15:34:51', '落亦-');
INSERT INTO `sys_notice` VALUES ('18', '数据表格的bug', '删除一页数据表格的所有数据，显示无数据', '2019-11-26 09:24:09', '落亦-');
INSERT INTO `sys_notice` VALUES ('19', '数据表格', '当返回的数据为0时，只需将当前页减一即可', '2019-11-26 09:24:59', '落亦-');
INSERT INTO `sys_notice` VALUES ('20', '还差一条', '在来一条', '2019-11-26 09:25:14', '落亦-');
INSERT INTO `sys_notice` VALUES ('21', '再来一条', '来一条', '2019-11-26 09:25:30', '落亦-');
INSERT INTO `sys_notice` VALUES ('22', '还有18天四级', '18天', '2019-11-26 09:25:51', '落亦-');
INSERT INTO `sys_notice` VALUES ('23', 'bug搞定', 'OK了', '2019-11-26 09:26:19', '落亦-');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限编码[只有type=permission才有 user:view]',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `href` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '是否可用[0不可用，1可用]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '仓库管理系统', null, '&#xe68e;', '', '', '1', '1', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', 'menu', '基础管理', null, '&#xe857;', '', '', '0', '2', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', 'menu', '进货管理', null, '&#xe645;', '', null, '0', '3', '1');
INSERT INTO `sys_permission` VALUES ('4', '1', 'menu', '销售管理', null, '&#xe611;', '', '', '0', '4', '1');
INSERT INTO `sys_permission` VALUES ('5', '1', 'menu', '系统管理', null, '&#xe614;', '', '', '1', '5', '1');
INSERT INTO `sys_permission` VALUES ('6', '1', 'menu', '其它管理', null, '&#xe628;', '', '', '0', '6', '1');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '客户管理', null, '&#xe651;', '/bus/toCustomerManager', '', '0', '7', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', 'menu', '供应商管理', null, '&#xe658;', '/bus/toProviderManager', '', '0', '8', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', 'menu', '商品管理', null, '&#xe657;', '/bus/toGoodsManager', '', '0', '9', '1');
INSERT INTO `sys_permission` VALUES ('10', '3', 'menu', '商品进货', null, '&#xe756;', '/bus/toInportManager', '', '0', '10', '1');
INSERT INTO `sys_permission` VALUES ('11', '3', 'menu', '商品退货查询', null, '&#xe65a;', '/bus/toOutportManager', '', '0', '11', '1');
INSERT INTO `sys_permission` VALUES ('12', '4', 'menu', '商品销售', null, '&#xe65b;', '', '', '0', '12', '1');
INSERT INTO `sys_permission` VALUES ('13', '4', 'menu', '销售退货查询', null, '&#xe770;', '', '', '0', '13', '1');
INSERT INTO `sys_permission` VALUES ('14', '5', 'menu', '部门管理', null, '&#xe770;', '/sys/toDeptManager', '', '0', '14', '1');
INSERT INTO `sys_permission` VALUES ('15', '5', 'menu', '菜单管理', null, '&#xe857;', '/sys/toMenuManager', '', '0', '15', '1');
INSERT INTO `sys_permission` VALUES ('16', '5', 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', '0', '16', '1');
INSERT INTO `sys_permission` VALUES ('17', '5', 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', '0', '17', '1');
INSERT INTO `sys_permission` VALUES ('18', '5', 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', '0', '18', '1');
INSERT INTO `sys_permission` VALUES ('21', '6', 'menu', '登陆日志', null, '&#xe675;', '/sys/toLoginfoManager', '', '0', '21', '1');
INSERT INTO `sys_permission` VALUES ('22', '6', 'menu', '系统公告', null, '&#xe756;', '/sys/toNoticeManager', null, '0', '22', '1');
INSERT INTO `sys_permission` VALUES ('23', '6', 'menu', '图标管理', null, '&#xe670;', '../resources/page/icon.html', null, '0', '23', '1');
INSERT INTO `sys_permission` VALUES ('30', '14', 'permission', '添加部门', 'dept:create', '', null, null, '0', '24', '1');
INSERT INTO `sys_permission` VALUES ('31', '14', 'permission', '修改部门', 'dept:update', '', null, null, '0', '26', '1');
INSERT INTO `sys_permission` VALUES ('32', '14', 'permission', '删除部门', 'dept:delete', '', null, null, '0', '27', '1');
INSERT INTO `sys_permission` VALUES ('34', '15', 'permission', '添加菜单', 'menu:create', '', '', '', '0', '29', '1');
INSERT INTO `sys_permission` VALUES ('35', '15', 'permission', '修改菜单', 'menu:update', '', null, null, '0', '30', '1');
INSERT INTO `sys_permission` VALUES ('36', '15', 'permission', '删除菜单', 'menu:delete', '', null, null, '0', '31', '1');
INSERT INTO `sys_permission` VALUES ('38', '16', 'permission', '添加权限', 'permission:create', '', null, null, '0', '33', '1');
INSERT INTO `sys_permission` VALUES ('39', '16', 'permission', '修改权限', 'permission:update', '', null, null, '0', '34', '1');
INSERT INTO `sys_permission` VALUES ('40', '16', 'permission', '删除权限', 'permission:delete', '', null, null, '0', '35', '1');
INSERT INTO `sys_permission` VALUES ('42', '17', 'permission', '添加角色', 'role:create', '', null, null, '0', '37', '1');
INSERT INTO `sys_permission` VALUES ('43', '17', 'permission', '修改角色', 'role:update', '', null, null, '0', '38', '1');
INSERT INTO `sys_permission` VALUES ('44', '17', 'permission', '删除角色', 'role:delete', '', null, null, '0', '39', '1');
INSERT INTO `sys_permission` VALUES ('46', '17', 'permission', '分配权限', 'role:selectPermission', '', null, null, '0', '41', '1');
INSERT INTO `sys_permission` VALUES ('47', '18', 'permission', '添加用户', 'user:create', '', null, null, '0', '42', '1');
INSERT INTO `sys_permission` VALUES ('48', '18', 'permission', '修改用户', 'user:update', '', null, null, '0', '43', '1');
INSERT INTO `sys_permission` VALUES ('49', '18', 'permission', '删除用户', 'user:delete', '', null, null, '0', '44', '1');
INSERT INTO `sys_permission` VALUES ('51', '18', 'permission', '用户分配角色', 'user:selectRole', '', null, null, '0', '46', '1');
INSERT INTO `sys_permission` VALUES ('52', '18', 'permission', '重置密码', 'user:resetPwd', null, null, null, '0', '47', '1');
INSERT INTO `sys_permission` VALUES ('53', '14', 'permission', '部门查询', 'dept:view', null, null, null, '0', '48', '1');
INSERT INTO `sys_permission` VALUES ('54', '15', 'permission', '菜单查询', 'menu:view', null, null, null, '0', '49', '1');
INSERT INTO `sys_permission` VALUES ('55', '16', 'permission', '权限查询', 'permission:view', null, null, null, '0', '50', '1');
INSERT INTO `sys_permission` VALUES ('56', '17', 'permission', '角色查询', 'role:view', null, null, null, '0', '51', '1');
INSERT INTO `sys_permission` VALUES ('57', '18', 'permission', '用户查询', 'user:view', null, null, null, '0', '52', '1');
INSERT INTO `sys_permission` VALUES ('68', '7', 'permission', '客户查询', 'customer:view', null, null, null, null, '60', '1');
INSERT INTO `sys_permission` VALUES ('69', '7', 'permission', '客户添加', 'customer:create', null, null, null, null, '61', '1');
INSERT INTO `sys_permission` VALUES ('70', '7', 'permission', '客户修改', 'customer:update', null, null, null, null, '62', '1');
INSERT INTO `sys_permission` VALUES ('71', '7', 'permission', '客户删除', 'customer:delete', null, null, null, null, '63', '1');
INSERT INTO `sys_permission` VALUES ('73', '21', 'permission', '日志查询', 'info:view', null, null, null, null, '65', '1');
INSERT INTO `sys_permission` VALUES ('74', '21', 'permission', '日志删除', 'info:delete', null, null, null, null, '66', '1');
INSERT INTO `sys_permission` VALUES ('75', '21', 'permission', '日志批量删除', 'info:batchdelete', null, null, null, null, '67', '1');
INSERT INTO `sys_permission` VALUES ('76', '22', 'permission', '公告查询', 'notice:view', null, null, null, null, '68', '1');
INSERT INTO `sys_permission` VALUES ('77', '22', 'permission', '公告添加', 'notice:create', null, null, null, null, '69', '1');
INSERT INTO `sys_permission` VALUES ('78', '22', 'permission', '公告修改', 'notice:update', null, null, null, null, '70', '1');
INSERT INTO `sys_permission` VALUES ('79', '22', 'permission', '公告删除', 'notice:delete', null, null, null, null, '71', '1');
INSERT INTO `sys_permission` VALUES ('81', '8', 'permission', '供应商查询', 'provider:view', null, null, null, null, '73', '1');
INSERT INTO `sys_permission` VALUES ('82', '8', 'permission', '供应商添加', 'provider:create', null, null, null, null, '74', '1');
INSERT INTO `sys_permission` VALUES ('83', '8', 'permission', '供应商修改', 'provider:update', null, null, null, null, '75', '1');
INSERT INTO `sys_permission` VALUES ('84', '8', 'permission', '供应商删除', 'provider:delete', null, null, null, null, '76', '1');
INSERT INTO `sys_permission` VALUES ('86', '22', 'permission', '公告查看', 'notice:viewnotice', null, null, null, null, '78', '1');
INSERT INTO `sys_permission` VALUES ('91', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '79', '1');
INSERT INTO `sys_permission` VALUES ('92', '9', 'permission', '商品添加', 'goods:create', null, null, null, '0', '80', '1');
INSERT INTO `sys_permission` VALUES ('116', '9', 'permission', '商品删除', 'goods:delete', null, null, null, '0', '84', '1');
INSERT INTO `sys_permission` VALUES ('117', '9', 'permission', '商品修改', 'goods:update', null, null, null, '0', '85', '1');
INSERT INTO `sys_permission` VALUES ('118', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '86', '1');
INSERT INTO `sys_permission` VALUES ('119', '22', 'permission', '公告批量删除', 'notice:batchdelete', null, null, null, '0', '87', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '0不可用，1可用',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('4', '基础数据管理员', '基础数据管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('5', '仓库管理员', '仓库管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('6', '销售管理员', '销售管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('7', '系统管理员', '系统管理员', '1', '2019-04-10 14:06:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`),
  KEY `sys_role_permission_ibfk_2` (`rid`),
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`),
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3');
INSERT INTO `sys_role_permission` VALUES ('1', '4');
INSERT INTO `sys_role_permission` VALUES ('1', '5');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '30');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '32');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '42');
INSERT INTO `sys_role_permission` VALUES ('1', '43');
INSERT INTO `sys_role_permission` VALUES ('1', '44');
INSERT INTO `sys_role_permission` VALUES ('1', '46');
INSERT INTO `sys_role_permission` VALUES ('1', '47');
INSERT INTO `sys_role_permission` VALUES ('1', '48');
INSERT INTO `sys_role_permission` VALUES ('1', '49');
INSERT INTO `sys_role_permission` VALUES ('1', '51');
INSERT INTO `sys_role_permission` VALUES ('1', '52');
INSERT INTO `sys_role_permission` VALUES ('1', '53');
INSERT INTO `sys_role_permission` VALUES ('1', '54');
INSERT INTO `sys_role_permission` VALUES ('1', '55');
INSERT INTO `sys_role_permission` VALUES ('1', '56');
INSERT INTO `sys_role_permission` VALUES ('1', '57');
INSERT INTO `sys_role_permission` VALUES ('1', '68');
INSERT INTO `sys_role_permission` VALUES ('1', '69');
INSERT INTO `sys_role_permission` VALUES ('1', '70');
INSERT INTO `sys_role_permission` VALUES ('1', '71');
INSERT INTO `sys_role_permission` VALUES ('1', '73');
INSERT INTO `sys_role_permission` VALUES ('1', '74');
INSERT INTO `sys_role_permission` VALUES ('1', '75');
INSERT INTO `sys_role_permission` VALUES ('1', '76');
INSERT INTO `sys_role_permission` VALUES ('1', '77');
INSERT INTO `sys_role_permission` VALUES ('1', '78');
INSERT INTO `sys_role_permission` VALUES ('1', '79');
INSERT INTO `sys_role_permission` VALUES ('1', '81');
INSERT INTO `sys_role_permission` VALUES ('1', '82');
INSERT INTO `sys_role_permission` VALUES ('1', '83');
INSERT INTO `sys_role_permission` VALUES ('1', '84');
INSERT INTO `sys_role_permission` VALUES ('1', '86');
INSERT INTO `sys_role_permission` VALUES ('1', '91');
INSERT INTO `sys_role_permission` VALUES ('1', '92');
INSERT INTO `sys_role_permission` VALUES ('1', '116');
INSERT INTO `sys_role_permission` VALUES ('1', '117');
INSERT INTO `sys_role_permission` VALUES ('1', '118');
INSERT INTO `sys_role_permission` VALUES ('4', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '2');
INSERT INTO `sys_role_permission` VALUES ('4', '7');
INSERT INTO `sys_role_permission` VALUES ('4', '8');
INSERT INTO `sys_role_permission` VALUES ('4', '9');
INSERT INTO `sys_role_permission` VALUES ('4', '68');
INSERT INTO `sys_role_permission` VALUES ('4', '81');
INSERT INTO `sys_role_permission` VALUES ('4', '91');
INSERT INTO `sys_role_permission` VALUES ('4', '92');
INSERT INTO `sys_role_permission` VALUES ('4', '116');
INSERT INTO `sys_role_permission` VALUES ('4', '117');
INSERT INTO `sys_role_permission` VALUES ('4', '118');
INSERT INTO `sys_role_permission` VALUES ('5', '1');
INSERT INTO `sys_role_permission` VALUES ('5', '2');
INSERT INTO `sys_role_permission` VALUES ('5', '3');
INSERT INTO `sys_role_permission` VALUES ('5', '4');
INSERT INTO `sys_role_permission` VALUES ('5', '7');
INSERT INTO `sys_role_permission` VALUES ('5', '8');
INSERT INTO `sys_role_permission` VALUES ('5', '9');
INSERT INTO `sys_role_permission` VALUES ('5', '10');
INSERT INTO `sys_role_permission` VALUES ('5', '11');
INSERT INTO `sys_role_permission` VALUES ('5', '12');
INSERT INTO `sys_role_permission` VALUES ('5', '13');
INSERT INTO `sys_role_permission` VALUES ('5', '68');
INSERT INTO `sys_role_permission` VALUES ('5', '81');
INSERT INTO `sys_role_permission` VALUES ('5', '91');
INSERT INTO `sys_role_permission` VALUES ('5', '92');
INSERT INTO `sys_role_permission` VALUES ('5', '116');
INSERT INTO `sys_role_permission` VALUES ('5', '117');
INSERT INTO `sys_role_permission` VALUES ('5', '118');
INSERT INTO `sys_role_permission` VALUES ('6', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '4');
INSERT INTO `sys_role_permission` VALUES ('6', '12');
INSERT INTO `sys_role_permission` VALUES ('6', '13');
INSERT INTO `sys_role_permission` VALUES ('7', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '5');
INSERT INTO `sys_role_permission` VALUES ('7', '14');
INSERT INTO `sys_role_permission` VALUES ('7', '15');
INSERT INTO `sys_role_permission` VALUES ('7', '16');
INSERT INTO `sys_role_permission` VALUES ('7', '17');
INSERT INTO `sys_role_permission` VALUES ('7', '18');
INSERT INTO `sys_role_permission` VALUES ('7', '30');
INSERT INTO `sys_role_permission` VALUES ('7', '31');
INSERT INTO `sys_role_permission` VALUES ('7', '32');
INSERT INTO `sys_role_permission` VALUES ('7', '34');
INSERT INTO `sys_role_permission` VALUES ('7', '35');
INSERT INTO `sys_role_permission` VALUES ('7', '36');
INSERT INTO `sys_role_permission` VALUES ('7', '38');
INSERT INTO `sys_role_permission` VALUES ('7', '39');
INSERT INTO `sys_role_permission` VALUES ('7', '40');
INSERT INTO `sys_role_permission` VALUES ('7', '42');
INSERT INTO `sys_role_permission` VALUES ('7', '43');
INSERT INTO `sys_role_permission` VALUES ('7', '44');
INSERT INTO `sys_role_permission` VALUES ('7', '46');
INSERT INTO `sys_role_permission` VALUES ('7', '47');
INSERT INTO `sys_role_permission` VALUES ('7', '48');
INSERT INTO `sys_role_permission` VALUES ('7', '49');
INSERT INTO `sys_role_permission` VALUES ('7', '51');
INSERT INTO `sys_role_permission` VALUES ('7', '52');
INSERT INTO `sys_role_permission` VALUES ('7', '53');
INSERT INTO `sys_role_permission` VALUES ('7', '54');
INSERT INTO `sys_role_permission` VALUES ('7', '55');
INSERT INTO `sys_role_permission` VALUES ('7', '56');
INSERT INTO `sys_role_permission` VALUES ('7', '57');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL COMMENT '上级领导id',
  `available` int(11) DEFAULT NULL COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `type` int(11) DEFAULT NULL COMMENT '用户类型[0超级管理员，1管理员，2普通用户]',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像地址',
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'admin', '532ac00e86893901af5f0be6b704dbc7', '系统深处的男人', '1', '超级管理员', '1', '2018-06-25 11:06:34', null, '1', '1', '0', '2020-03-06/2CD8B8E4F6724BC1807DC0C58F68C924.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('2', '贺紫微', 'hzw', '532ac00e86893901af5f0be6b704dbc7', '九江', '1', '超级管理员', '1', '2019-11-23 20:52:16', null, '1', '2', '0', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('3', '贺紫微', '1001', '532ac00e86893901af5f0be6b704dbc7', '猎户座旋臂', '1', '普通用户', '1', '2019-12-02 10:49:12', null, '1', '3', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('4', '贺紫薇', '1002', '532ac00e86893901af5f0be6b704dbc7', '九江', '1', '普通用户', '2', '2019-12-02 18:57:04', '3', '1', '4', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('5', '贺紫薇', '1004', '532ac00e86893901af5f0be6b704dbc7', '上海', '1', '普通用户', '5', '2019-12-02 18:57:42', '4', '1', '5', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('6', '贺紫薇', '1005', '532ac00e86893901af5f0be6b704dbc7', '广州', '1', '普通用户', '5', '2019-12-02 18:59:05', '5', '1', '6', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('7', '贺紫薇', '1006', '532ac00e86893901af5f0be6b704dbc7', '深圳', '1', '普遍用户', '4', '2019-12-03 09:52:18', '3', '1', '7', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES ('10', '贺紫薇', '1007', '532ac00e86893901af5f0be6b704dbc7', '猎户座旋臂', '0', '将军', '3', '2019-12-03 00:00:00', '3', '1', '9', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '950289EBDBA24C7789E392E1D0254635');
INSERT INTO `sys_user` VALUES ('11', '贺紫薇', '1008', '532ac00e86893901af5f0be6b704dbc7', '美国', '0', '演员', '7', '2019-12-03 14:23:35', '10', '1', '10', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '85DB5F84987146559A75B4B0DCB7DE4F');
INSERT INTO `sys_user` VALUES ('12', '贺紫薇', '1009', '532ac00e86893901af5f0be6b704dbc7', '美国', '1', '钢铁侠', '7', '2019-12-03 00:00:00', '11', '1', '11', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '571059AF59E64A7D92FECB93FA1B0AEF');
INSERT INTO `sys_user` VALUES ('13', '贺紫薇', '1010', '532ac00e86893901af5f0be6b704dbc7', '美国', '1', '人工智能', '3', '2019-12-03 00:00:00', '12', '1', '12', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', '7258E2D93A3F429085B34BBD8E345CE7');
INSERT INTO `sys_user` VALUES ('15', '贺紫薇', '1011', '532ac00e86893901af5f0be6b704dbc7', '上海', '1', '似懂非懂', '18', '2019-12-06 08:50:14', '7', '1', '13', '1', '2020-03-06/8FA43F374D7B4C1685D062AA0F6D01D0.jpg', 'C22D85AE05BD43F9A4B4D4FBDA3C7394');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`uid`),
  KEY `FK_sys_user_role_2` (`uid`),
  CONSTRAINT `FK_sys_user_role_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_sys_user_role_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('4', '4');
INSERT INTO `sys_user_role` VALUES ('5', '5');
INSERT INTO `sys_user_role` VALUES ('6', '6');
INSERT INTO `sys_user_role` VALUES ('7', '6');
INSERT INTO `sys_user_role` VALUES ('10', '7');
INSERT INTO `sys_user_role` VALUES ('15', '4');

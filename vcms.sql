/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : vcms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2013-06-27 19:03:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dir_article
-- ----------------------------
DROP TABLE IF EXISTS `dir_article`;
CREATE TABLE `dir_article` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dir_article
-- ----------------------------
INSERT INTO `dir_article` VALUES ('0', '总管', 'tree_root', '0', '1,2,4', '0');
INSERT INTO `dir_article` VALUES ('1', 'a_1', 'a_11', '0', '', '0');
INSERT INTO `dir_article` VALUES ('2', '最新消息', 'new_news', '0', '3', '0');
INSERT INTO `dir_article` VALUES ('3', 'sub11', 'sub11', '2', '', '0');
INSERT INTO `dir_article` VALUES ('4', 'sub2', 'sub2', '0', '', '0');

-- ----------------------------
-- Table structure for dir_info
-- ----------------------------
DROP TABLE IF EXISTS `dir_info`;
CREATE TABLE `dir_info` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dir_info
-- ----------------------------
INSERT INTO `dir_info` VALUES ('0', 'root', 'root', '0', '7,8,14', '0');
INSERT INTO `dir_info` VALUES ('7', 'sub2', 'sub_alias', '0', '9,10,11', '0');
INSERT INTO `dir_info` VALUES ('8', 'sub2', 'sub_alias', '0', '12,19', '1');
INSERT INTO `dir_info` VALUES ('9', '目录3', 'sub33_alias', '7', '21,28', '0');
INSERT INTO `dir_info` VALUES ('10', 'sub44', 'sub44_alias', '7', '13,16,26', '0');
INSERT INTO `dir_info` VALUES ('11', 'sub4', 'sub4_alias', '7', '22,23', '1');
INSERT INTO `dir_info` VALUES ('12', 'longzhou', 'lz', '8', '', '1');
INSERT INTO `dir_info` VALUES ('13', 'longzhou_haha', 'lz_haha_alias', '10', '17,18', '0');
INSERT INTO `dir_info` VALUES ('14', 'sub3', 'sb3', '0', '15', '1');
INSERT INTO `dir_info` VALUES ('15', 'longzhou3', 'lz3', '14', '', '1');
INSERT INTO `dir_info` VALUES ('16', 'longzhou4', 'lz4', '10', '20,24', '1');
INSERT INTO `dir_info` VALUES ('17', 'hi_little_longzhou', 'hi_l_lz', '13', '', '0');
INSERT INTO `dir_info` VALUES ('18', 'hi_little_zxw', 'hi_l_zxw', '13', '', '0');
INSERT INTO `dir_info` VALUES ('19', 'sub22', 'sub22_2', '8', '', '1');
INSERT INTO `dir_info` VALUES ('20', 'hi_hi_hi2', 'hi_hi_hi2_alias', '16', '', '1');
INSERT INTO `dir_info` VALUES ('21', 't1', 't1t1_alias', '9', '', '1');
INSERT INTO `dir_info` VALUES ('22', 'sub_zz', 'sub_zz', '11', '', '1');
INSERT INTO `dir_info` VALUES ('23', 'sub_zcz', 'sub_zcz', '11', '', '1');
INSERT INTO `dir_info` VALUES ('24', 'h1h1h1', 'hihihi', '16', '25', '1');
INSERT INTO `dir_info` VALUES ('25', 'h2h2h2', 'h2h2h2h2', '24', '', '1');
INSERT INTO `dir_info` VALUES ('26', 'longzhou5', 'longzhou5555', '10', '27', '1');
INSERT INTO `dir_info` VALUES ('27', 'h4h4h4', 'h4h4h4', '26', '', '1');
INSERT INTO `dir_info` VALUES ('28', '大婶的一家', 'test2', '9', '29', '0');
INSERT INTO `dir_info` VALUES ('29', '大婶的二家', 'ds2f', '28', '', '0');

-- ----------------------------
-- Table structure for v_article
-- ----------------------------
DROP TABLE IF EXISTS `v_article`;
CREATE TABLE `v_article` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `summary` text COLLATE utf8_unicode_ci,
  `createtime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatetime` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra1` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra3` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of v_article
-- ----------------------------
INSERT INTO `v_article` VALUES ('1', '2', '0', '文章测试', '正文正文正文正文', '摘要摘要', '2013-06-19 14:49:30', '2013-06-19 14:59:30', 'Longzhou', '', '', '', '', '');
INSERT INTO `v_article` VALUES ('2', '2', '0', '文章2', '文章2', '摘要摘要', '2013-06-19 14:49:30', '2013-06-19 14:49:30', 'lz', null, null, null, null, null);
INSERT INTO `v_article` VALUES ('3', '2', '0', '文章with editor', '', '', '2013-06-20 15:40:19', '2013-06-20 15:40:19', '', '', '', '', '', '');
INSERT INTO `v_article` VALUES ('4', '2', '0', '文章with editor23', '&lt;p&gt;啊啊啊啊啊啊啊哦哦哦哦哦&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;嗯嗯恩呢&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;单色发放&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;ar&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;', '摘要', '2013-06-20 15:41:05', '2013-06-20 15:41:05', 'lz', 'a', 'b', 'c', 'd', 'e');
INSERT INTO `v_article` VALUES ('5', '3', '0', '文章发布', '&lt;p&gt;文章发布好，试试&lt;/p&gt;', '文章发布ok了没', '2013-06-24 15:31:22', '2013-06-24 15:31:22', '龙舟', '2', '3', '4', '五', '六');

-- ----------------------------
-- Table structure for v_info
-- ----------------------------
DROP TABLE IF EXISTS `v_info`;
CREATE TABLE `v_info` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `field1` text COLLATE utf8_unicode_ci,
  `field2` text COLLATE utf8_unicode_ci,
  `field3` text COLLATE utf8_unicode_ci,
  `field4` text COLLATE utf8_unicode_ci,
  `field5` text COLLATE utf8_unicode_ci,
  `field6` text COLLATE utf8_unicode_ci,
  `field7` text COLLATE utf8_unicode_ci,
  `field8` text COLLATE utf8_unicode_ci,
  `field9` text COLLATE utf8_unicode_ci,
  `field10` text COLLATE utf8_unicode_ci,
  `field11` text COLLATE utf8_unicode_ci,
  `field12` text COLLATE utf8_unicode_ci,
  `field13` text COLLATE utf8_unicode_ci,
  `field14` text COLLATE utf8_unicode_ci,
  `field15` text COLLATE utf8_unicode_ci,
  `field16` text COLLATE utf8_unicode_ci,
  `field17` text COLLATE utf8_unicode_ci,
  `field18` text COLLATE utf8_unicode_ci,
  `field19` text COLLATE utf8_unicode_ci,
  `field20` text COLLATE utf8_unicode_ci,
  `field21` text COLLATE utf8_unicode_ci,
  `field22` text COLLATE utf8_unicode_ci,
  `field23` text COLLATE utf8_unicode_ci,
  `field24` text COLLATE utf8_unicode_ci,
  `field25` text COLLATE utf8_unicode_ci,
  `field26` text COLLATE utf8_unicode_ci,
  `field27` text COLLATE utf8_unicode_ci,
  `field28` text COLLATE utf8_unicode_ci,
  `field29` text COLLATE utf8_unicode_ci,
  `field30` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of v_info
-- ----------------------------
INSERT INTO `v_info` VALUES ('1', '7', '0', '剑舞', '啊啊', '哦哦', '宝宝', '在呢', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('2', '7', '1', 'test2', 'test1', 'test4', 'not null', 'gogo', 'coming', 'null', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('3', '7', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `v_info` VALUES ('4', '7', '1', 'fromaction', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `v_info` VALUES ('5', '7', '1', 'fromaction', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `v_info` VALUES ('6', '7', '1', 'fromaction', 'fromhelper', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `v_info` VALUES ('7', '28', '0', '擦', '啊', '哦', '厄', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('8', '7', '1', 'test1', 'test3', '测试', '测试2', '测试3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `v_info` VALUES ('9', '7', '0', '中午', '上午', '词啊无', '下午', '啊啊啊', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('10', '7', '0', '测试', '再来一条', '再来一罐', '再来一瓶', '加一个', '卡不卡', '还行把', '啊', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('11', '28', '0', '牛X', '傻X', '2b', '3b', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `v_info` VALUES ('12', '28', '0', 'yes', 'no', '2b', 'come on', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for v_info_alias
-- ----------------------------
DROP TABLE IF EXISTS `v_info_alias`;
CREATE TABLE `v_info_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `len` int(2) NOT NULL DEFAULT '30',
  `field1` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field1',
  `field2` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field2',
  `field3` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field3',
  `field4` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field4',
  `field5` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field5',
  `field6` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field6',
  `field7` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field7',
  `field8` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field8',
  `field9` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field9',
  `field10` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field10',
  `field11` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field11',
  `field12` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field12',
  `field13` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field13',
  `field14` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field14',
  `field15` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field15',
  `field16` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field16',
  `field17` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field17',
  `field18` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field18',
  `field19` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field19',
  `field20` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field20',
  `field21` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field21',
  `field22` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field22',
  `field23` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field23',
  `field24` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field24',
  `field25` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field25',
  `field26` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field26',
  `field27` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field27',
  `field28` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field28',
  `field29` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field29',
  `field30` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'field30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of v_info_alias
-- ----------------------------
INSERT INTO `v_info_alias` VALUES ('1', '7', '8', '文案', '链接', '图片', '埋点', '类别', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('2', '9', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('3', '13', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('4', '18', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('5', '26', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('6', '10', '4', '文案', '链接', '图片', 'hot', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('7', '0', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('8', '17', '30', 'field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('9', '28', '4', '大婶', '大婶的大叔', '小吉吉', '菊花', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');
INSERT INTO `v_info_alias` VALUES ('10', '29', '3', '海哥', 'sea brother', 'sea sister', 'field4', 'field5', 'field6', 'field7', 'field8', 'field9', 'field10', 'field11', 'field12', 'field13', 'field14', 'field15', 'field16', 'field17', 'field18', 'field19', 'field20', 'field21', 'field22', 'field23', 'field24', 'field25', 'field26', 'field27', 'field28', 'field29', 'field30');

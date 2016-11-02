/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : bookmanage

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2016-11-02 14:28:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL,
  `press` varchar(30) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO books VALUES ('1', '9787540458027', '从你的全世界路过', '张嘉佳', '湖南文艺出版社', '24.83');
INSERT INTO books VALUES ('2', '9787544258609', '白夜行', '东野圭吾', '南海出版公司', '39.5');
INSERT INTO books VALUES ('3', '9787506365437', '活着', '余华', '作家出版社', '20');
INSERT INTO books VALUES ('4', '9787544270878', '解忧杂货店', '东野圭吾', '南海出版公司', '39.5');
INSERT INTO books VALUES ('5', '9787108042453', '我们仨', '杨绛', '新知三联书店', '23');
INSERT INTO books VALUES ('6', '9787208061644', '追风筝的人', '卡勒德·胡赛尼', '上海人民出版社', '29');
INSERT INTO books VALUES ('7', '9787550263932', '天才在左疯子在右', '高铭', '北京联合出版公司', '39.8');
INSERT INTO books VALUES ('8', '9787540476892', '好吗好的', '大冰', '湖南文艺出版社', '26.8');
INSERT INTO books VALUES ('9', '9787550013247', '摆渡人', '克莱儿·麦克福尔', '百花洲文艺出版社', '36');
INSERT INTO books VALUES ('10', '9787539971810', '岛上书店', '加·泽文', '江苏文艺出版社', '35.1');
INSERT INTO books VALUES ('11', '9787544267618', '嫌疑人X的献身', '东野圭吾', '南海出版社公司', '35');
INSERT INTO books VALUES ('12', '9787535488473', '自在独行', '贾平凹', '长江文艺出版社', '39');
INSERT INTO books VALUES ('13', '9787535481108', '白岩松：白说', '白岩松', '长江文艺出版社', '39.8');
INSERT INTO books VALUES ('14', '9787530212004', '平凡的世界', '路遥', '北京十月文艺出版社', '79.8');
INSERT INTO books VALUES ('15', '9787550018716', '再见，萤火虫小巷', '克莉丝汀·汉娜', '百花洲文艺出版社', '36.1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'admin', '123456', '1');

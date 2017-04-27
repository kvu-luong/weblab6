/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weblab6

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-28 00:06:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Name` varchar(255) NOT NULL,
  `Visa` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Visa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('tin', '123', '1234');
INSERT INTO `account` VALUES ('fdfd', '23', '23');
INSERT INTO `account` VALUES ('sdsd', '2321', '32');
INSERT INTO `account` VALUES ('ttt', '234221', '2323');
INSERT INTO `account` VALUES ('kai', '321', '4321');
INSERT INTO `account` VALUES ('vu', '344', '2323');
INSERT INTO `account` VALUES ('rr', '4444', '333');
INSERT INTO `account` VALUES ('dfdsa', '4444000', '44');
INSERT INTO `account` VALUES ('yuy', '454545', '2323232');
INSERT INTO `account` VALUES ('yyyy', '4545451212', '11212');
INSERT INTO `account` VALUES ('bu', '565633434', '34');
INSERT INTO `account` VALUES ('ghghg', '565656565', '55');
INSERT INTO `account` VALUES ('yyyyyy', '566', '55');
INSERT INTO `account` VALUES ('yyyyyy', '5666', '55');
INSERT INTO `account` VALUES ('yyyy', '66', '555');
INSERT INTO `account` VALUES ('ttttt', '666666', '666');
INSERT INTO `account` VALUES ('tin', '678', '1234');
INSERT INTO `account` VALUES ('tin', '6789', '1234');
INSERT INTO `account` VALUES ('vu', '67894', '1234');
INSERT INTO `account` VALUES ('y', '68', '68');
INSERT INTO `account` VALUES ('y', '685', '68');
INSERT INTO `account` VALUES ('y', '6857', '68');
INSERT INTO `account` VALUES ('y', '68575', '68');
INSERT INTO `account` VALUES ('ytyt', '76', '76');
INSERT INTO `account` VALUES ('uu', '777', '6767');
INSERT INTO `account` VALUES ('Hung', '7890', 'Thu Duc');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `visa` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  PRIMARY KEY (`visa`,`productName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('123', 'Dell XPS', '8');
INSERT INTO `cart` VALUES ('123', 'iPhone', '25');
INSERT INTO `cart` VALUES ('123', 'Võng xếp', '20');
INSERT INTO `cart` VALUES ('7890', 'iPad', '5');
INSERT INTO `cart` VALUES ('7890', 'Kềm cắt móng tay', '44');
INSERT INTO `cart` VALUES ('7890', 'Sony Vaio', '1');

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `UserName` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Manufacturer` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('yyyy', 'Dell XPS', 'USA', 'Dell', '1500', '1');
INSERT INTO `orderproduct` VALUES ('yyyy', 'Dell XPS', 'USA', 'Dell', '1500', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Manufacturer` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Dell XPS', 'USA', 'Dell', '1500');
INSERT INTO `product` VALUES ('2', 'iPhone', 'USA', 'Apple', '999');
INSERT INTO `product` VALUES ('3', 'iPad', 'USA', 'Apple', '1400');
INSERT INTO `product` VALUES ('4', 'Sony Vaio', 'JPN', 'Sony', '2000');
INSERT INTO `product` VALUES ('5', 'Võng xếp', 'VN', 'Duy Lợi', '10');
INSERT INTO `product` VALUES ('6', 'Kềm cắt móng tay', 'VN', 'Kềm Nghĩa', '2');

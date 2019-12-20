/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 03/08/2019 16:58:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (2, 'admin', 'tuShOfiBrA8+br7ENrMS8A==');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `image1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '细节图片1',
  `image2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '细节图片2',
  `price` int(11) NULL DEFAULT NULL COMMENT '价格',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '自动雨伞', '/picture/1-1.jpg', '/picture/1-1.jpg', '/picture/1-1.jpg', 56, '不透光伞面，有效阻隔光线，有效阻隔紫外线', 5, 5);
INSERT INTO `goods` VALUES (2, '储物箱', '/picture/2-1.jpg', '/picture/2-1.jpg', '/picture/2-1.jpg', 8, '透明密封手提收纳箱，可存放零食，文具', 2, 5);
INSERT INTO `goods` VALUES (3, '佩奇玩偶', '/picture/3-1.jpg', '/picture/3-1.jpg', '/picture/3-1.jpg', 30, '柔软的面料，环保PP棉填充，无异味', 1, 5);
INSERT INTO `goods` VALUES (4, '塑料水杯', '/picture/4-1.jpg', '/picture/4-1.jpg', '/picture/4-1.jpg', 11, '大容量解决您的日常生活，还有简约的刻度显示，能够清楚知道水的容量', 0, 5);
INSERT INTO `goods` VALUES (5, '全棉床单', '/picture/5-1.jpg', '/picture/5-1.jpg', '/picture/5-1.jpg', 80, '本产品是纯棉三件套，包括一个被套一个床单一个枕套，适合学生宿舍床', 0, 5);
INSERT INTO `goods` VALUES (6, '保温盒', '/picture/6-1.jpg', '/picture/6-1.jpg', '/picture/6-1.jpg', 40, '对食品进行保温，让你的味蕾更具享受', 0, 5);
INSERT INTO `goods` VALUES (11, '充电宝', '/picture/11-1.jpg', '/picture/11-1.jpg', '/picture/11-1.jpg', 38, '更薄，续航更持久.', 1, 2);
INSERT INTO `goods` VALUES (12, '手机数据线', '/picture/12-1.jpg', '/picture/12-1.jpg', '/picture/12-1.jpg', 5, '强兼容设计，一条线解决大部分安卓智能手机充电问题.', 0, 2);
INSERT INTO `goods` VALUES (13, '迷你音响', '/picture/13-1.jpg', '/picture/13-1.jpg', '/picture/13-1.jpg', 36, '美妙环绕立体声，尽享娱乐影音，游戏，流行音乐.', 1, 2);
INSERT INTO `goods` VALUES (14, '吹风机', '/picture/14-1.jpg', '/picture/14-1.jpg', '/picture/14-1.jpg', 29, '快速升温，恒温不伤发.', 1, 2);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NULL DEFAULT NULL COMMENT '购买时价格',
  `amount` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `good_id` int(11) NULL DEFAULT NULL COMMENT '物品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 11, 1, 1, 4);
INSERT INTO `items` VALUES (2, 30, 1, 2, 3);
INSERT INTO `items` VALUES (3, 40, 1, 3, 6);
INSERT INTO `items` VALUES (4, 5, 1, 4, 12);
INSERT INTO `items` VALUES (5, 80, 1, 5, 5);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL DEFAULT 0 COMMENT '总价',
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '商品总数',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单状态(1未付款/2已付款/3已发货/4已完成)',
  `paytype` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付方式 (1微信/2支付宝/3货到付款)',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `systime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '下单用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, 5, 1, 4, 1, 'k', '138', 'zxcvbn', '2019-07-05 12:35:59', 3);

-- ----------------------------
-- Table structure for tops
-- ----------------------------
DROP TABLE IF EXISTS `tops`;
CREATE TABLE `tops`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '推荐类型(1条幅/2大图/3小图)',
  `good_id` int(11) NULL DEFAULT NULL COMMENT '物品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tops
-- ----------------------------
INSERT INTO `tops` VALUES (14, 2, 12);
INSERT INTO `tops` VALUES (15, 2, 11);
INSERT INTO `tops` VALUES (22, 3, 5);
INSERT INTO `tops` VALUES (24, 3, 4);
INSERT INTO `tops` VALUES (25, 2, 6);
INSERT INTO `tops` VALUES (29, 3, 13);
INSERT INTO `tops` VALUES (30, 3, 12);
INSERT INTO `tops` VALUES (33, 3, 2);
INSERT INTO `tops` VALUES (34, 3, 1);
INSERT INTO `tops` VALUES (37, 1, 14);
INSERT INTO `tops` VALUES (38, 2, 14);
INSERT INTO `tops` VALUES (40, 2, 13);
INSERT INTO `tops` VALUES (41, 2, 5);
INSERT INTO `tops` VALUES (42, 2, 4);
INSERT INTO `tops` VALUES (43, 2, 3);
INSERT INTO `tops` VALUES (44, 2, 2);
INSERT INTO `tops` VALUES (45, 2, 1);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (2, '数码系列');
INSERT INTO `types` VALUES (4, '课本系列');
INSERT INTO `types` VALUES (5, '生活系列');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'user', 'uIJeA9BWckozB8wRo8Y81Q==', 'k', '138', 'zxcvbn');
INSERT INTO `users` VALUES (4, 'user2', 'uIJeA9BWckozB8wRo8Y81Q==', 'sfrasg', 'rggreg', 'gfarrg');

SET FOREIGN_KEY_CHECKS = 1;

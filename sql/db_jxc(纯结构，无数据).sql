/*
 Navicat Premium Data Transfer

 Source Server         : localhost - MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : db_jxc

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 30/12/2021 11:21:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '福州新弯曲5号', '小李子', '福州艾玛超市', '2132-23213421', '');
INSERT INTO `t_customer` VALUES (2, '天津兴达大街888号', '小张', '天津王大连锁酒店', '23432222311', '优质客户');
INSERT INTO `t_customer` VALUES (3, '大凉山妥洛村', '小爱', '大凉山希望小学', '233243211', '照顾客户2');
INSERT INTO `t_customer` VALUES (4, '南通通州新金路888号', '王二小', '南通通州综艺集团', '1832132321', '');

-- ----------------------------
-- Table structure for t_customer_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list`;
CREATE TABLE `t_customer_return_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NULL DEFAULT NULL,
  `amount_payable` float NULL DEFAULT NULL,
  `customer_return_date` date NULL DEFAULT NULL,
  `customer_return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKl0ahdwa8slkocbfe57opembfx`(`customer_id`) USING BTREE,
  INDEX `FKd55ju83f0ntixagdvdrsmw10c`(`user_id`) USING BTREE,
  CONSTRAINT `FKd55ju83f0ntixagdvdrsmw10c` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl0ahdwa8slkocbfe57opembfx` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_return_list
-- ----------------------------
INSERT INTO `t_customer_return_list` VALUES (10, 17, 17, '2020-10-14', 'XT202010150001', '', 1, 1, 1);
INSERT INTO `t_customer_return_list` VALUES (11, 1250, 1250, '2020-10-15', 'XT202010150001', '', 1, 1, 1);

-- ----------------------------
-- Table structure for t_customer_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list_goods`;
CREATE TABLE `t_customer_return_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_return_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtqt67mbn96lxn8hvtl4piblhi`(`customer_return_list_id`) USING BTREE,
  INDEX `FK4sm5si4swbj3gae46jfk441yx`(`type_id`) USING BTREE,
  CONSTRAINT `FK4sm5si4swbj3gae46jfk441yx` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtqt67mbn96lxn8hvtl4piblhi` FOREIGN KEY (`customer_return_list_id`) REFERENCES `t_customer_return_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_return_list_goods
-- ----------------------------
INSERT INTO `t_customer_return_list_goods` VALUES (13, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 2, 8.5, 17, '瓶', 10, 10);
INSERT INTO `t_customer_return_list_goods` VALUES (14, '0004', 12, '2斤装', '新疆红枣', 50, 25, 1250, '袋', 11, 10);

-- ----------------------------
-- Table structure for t_damage_list
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list`;
CREATE TABLE `t_damage_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `damage_date` date NULL DEFAULT NULL,
  `damage_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpn094ma69sch1icjc2gu7xus`(`user_id`) USING BTREE,
  CONSTRAINT `FKpn094ma69sch1icjc2gu7xus` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_damage_list
-- ----------------------------
INSERT INTO `t_damage_list` VALUES (1, '2020-01-15', 'JH202001150001', '受潮', 1);
INSERT INTO `t_damage_list` VALUES (2, '2020-01-15', 'JH202001150002', '已过期', 1);
INSERT INTO `t_damage_list` VALUES (3, '2020-10-15', 'JH202010150001', '已过期', 1);

-- ----------------------------
-- Table structure for t_damage_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list_goods`;
CREATE TABLE `t_damage_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `damage_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbf5m8mm3gctrnuubr9xkjamj8`(`damage_list_id`) USING BTREE,
  INDEX `FKdbdfmp09hlf2raktincwroe9n`(`type_id`) USING BTREE,
  CONSTRAINT `FKbf5m8mm3gctrnuubr9xkjamj8` FOREIGN KEY (`damage_list_id`) REFERENCES `t_damage_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdbdfmp09hlf2raktincwroe9n` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_damage_list_goods
-- ----------------------------
INSERT INTO `t_damage_list_goods` VALUES (1, '0002', 2, 'Note8', '华为荣耀Note8', 1, 2220, 2220, '台', 1, 16);
INSERT INTO `t_damage_list_goods` VALUES (2, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 10, 8.5, 85, '瓶', 2, 10);
INSERT INTO `t_damage_list_goods` VALUES (3, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 5, 8.5, 42.5, '瓶', 3, 10);

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inventory_quantity` int NULL DEFAULT NULL,
  `last_purchasing_price` float NULL DEFAULT NULL,
  `min_num` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchasing_price` float NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selling_price` float NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  `code_or_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlxnna5ngumghp4f279mmbjtyo`(`type_id`) USING BTREE,
  CONSTRAINT `FKlxnna5ngumghp4f279mmbjtyo` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (1, '0001', 59, 8.5, 1000, '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', 7.09, '好卖', 8.5, 2, '瓶', 10, NULL);
INSERT INTO `t_goods` VALUES (2, '0002', 100, 2220, 400, 'Note8', '华为荣耀Note8', '华为计算机系统有限公司', 2029.68, '热销', 2200, 2, '台', 16, NULL);
INSERT INTO `t_goods` VALUES (11, '0003', 1590, 38, 400, '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', 23, '够黑2', 38, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (12, '0004', 1130, 25, 300, '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', 12.3, '好吃', 25, 2, '袋', 10, NULL);
INSERT INTO `t_goods` VALUES (13, '0005', 1000, 15, 1000, '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', 7.06, 'Goods', 15, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (14, '0006', 1000, 13, 1999, '300g装', '冰糖金桔干', '揭西县同心食品有限公司', 5.01, '', 13, 2, '盒', 11, NULL);
INSERT INTO `t_goods` VALUES (15, '0007', 100659, 4.5, 400, '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', 4.5, 'good', 10, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (16, '0008', 1000, 3, 500, '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', 3, '', 10, 2, '盒', 11, NULL);
INSERT INTO `t_goods` VALUES (17, '0009', 250, 33, 1000, '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', 20, '', 33, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (18, '0010', 200, 12, 300, '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', 12, '', 20, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (19, '0011', 11, 3.2, 300, '198g装', '山楂条', '临朐县七贤升利食品厂', 3.2, '', 10, 0, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (20, '0012', 22, 20, 200, '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', 20, '', 25, 0, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (21, '0013', 400, 3, 100, '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', 3, '', 8, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (22, '0014', 12, 5, 200, '250g装', '美国青豆原味 蒜香', '菲律宾', 5, '', 8, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (24, '0015', 47, 8000, 100, 'X', ' iPhone X', 'xx2', 8000, 'xxx2', 9500, 2, '台', 16, NULL);
INSERT INTO `t_goods` VALUES (26, '0017', 0, 3000, 100, 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', 3000, 'xxx', 3650, 2, '台', 15, NULL);
INSERT INTO `t_goods` VALUES (27, '0018', 0, 800, 400, 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', 800, 'xxx', 1299, 2, '台', 15, NULL);
INSERT INTO `t_goods` VALUES (28, '0019', 100, 60, 300, 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', 60, '', 129, 2, '台', 17, NULL);
INSERT INTO `t_goods` VALUES (29, '0020', 0, 1000, 50, '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', 1000, '', 1699, 0, '台', 14, NULL);
INSERT INTO `t_goods` VALUES (30, '0021', 98, 1199, 320, '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', 700, '', 1199, 2, '台', 12, NULL);
INSERT INTO `t_goods` VALUES (31, '0022', 0, 400, 40, 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', 400, '', 729, 0, '台', 13, NULL);
INSERT INTO `t_goods` VALUES (32, '0023', 0, 4, 1000, '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', 4, '', 15, 0, '袋', 9, NULL);
INSERT INTO `t_goods` VALUES (33, '0024', 0, 168, 10, 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', 168, '', 298, 0, '件', 6, NULL);
INSERT INTO `t_goods` VALUES (34, '0025', 0, 189, 10, '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', 189, '', 299, 0, '件', 7, NULL);
INSERT INTO `t_goods` VALUES (35, '0026', 0, 200, 10, 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', 200, '', 89, 0, '条', 8, NULL);
INSERT INTO `t_goods` VALUES (40, '0027', 0, 0, 100, '宽松直筒', '加绒加厚牛仔裤男直筒宽松带绒秋冬季冬天商务弹力修身黑色裤子男 ', 'MUZHILEE/慕志李', 200, '品牌: MUZHILEE/慕志李\r\n材质: 棉\r\n尺码: 28 29 30 31 32 33 34 35 36 38 40\r\n牛仔面料: 棉弹牛仔布\r\n腰型: 中高腰\r\n颜色: 6281 【秋冬厚款不加绒】 6306 【秋冬厚款不加绒】 8872 【秋冬厚款不加绒】 6821 【秋冬厚款不加绒】 8870 【秋冬厚款不加绒】 8853 【秋冬厚款不加绒】 8879【秋冬厚款不加绒】 6281 【加绒加厚款】 6306 【加绒加厚款】 8853 【加绒加厚款】 8879 【加绒加厚款】\r\n裤门襟: 拉链\r\n弹力: 微弹\r\n细分风格: 商务休闲\r\n基础风格: 商务绅士\r\n适用季节: 夏季\r\n厚薄: 薄款\r\n适用场景: 其他休闲\r\n款式细节: logo标识\r\n工艺处理: 水洗\r\n适用对象: 中年\r\n裤长: 长裤\r\n款式版型: 宽松直筒\r\n裤脚口款式: 直脚\r\n洗水工艺: 水洗\r\n材质成分: 棉66% 聚酯纤维33%', 269, 0, '条', 7, NULL);
INSERT INTO `t_goods` VALUES (45, '0028', 0, 0, 100, '三文鱼中段400g', '鲜有汇聚冰鲜三文鱼中段日料刺身拼盘新鲜生鱼片即食海鲜三文鱼肉 ', 'MARINE HARVEST NORWAY', 66, '品牌名称：鲜有汇聚\r\n\r\n产品参数：\r\n\r\n    厂名：MARINE HARVEST NORWAY AS N1115\r\n    厂址：BAT-30237\r\n    厂家联系方式：0512-36859438\r\n    配料表：冰鲜三文鱼\r\n    储藏方法：0℃- 4℃冷藏\r\n    保质期：4 天\r\n    食品添加剂：无\r\n    品牌: 鲜有汇聚\r\n    产地: 挪威\r\n    食品工艺: 鲜活水产\r\n    包装方式: 包装\r\n    售卖方式: 单品\r\n    配送频次: 1周2次\r\n    鱼肉部位: 鱼中段\r\n    净含量: 400g', 74, 0, '件', 10, NULL);

-- ----------------------------
-- Table structure for t_goods_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_copy`;
CREATE TABLE `t_goods_copy`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inventory_quantity` int NULL DEFAULT NULL,
  `last_purchasing_price` float NULL DEFAULT NULL,
  `min_num` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchasing_price` float NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selling_price` float NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  `code_or_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlxnna5ngumghp4f279mmbjtyo`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods_copy
-- ----------------------------
INSERT INTO `t_goods_copy` VALUES (1, '0001', 90, 8.5, 1000, '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', 6.59, '好卖', 8.5, 2, '瓶', 10, NULL);
INSERT INTO `t_goods_copy` VALUES (2, '0002', 100, 2220, 400, 'Note8', '华为荣耀Note8', '华为计算机系统有限公司', 2029.68, '热销', 2200, 2, '台', 16, NULL);
INSERT INTO `t_goods_copy` VALUES (11, '0003', 2000, 38, 400, '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', 23, '够黑2', 38, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (12, '0004', 1100, 25, 300, '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', 12.3, '好吃', 25, 2, '袋', 10, NULL);
INSERT INTO `t_goods_copy` VALUES (13, '0005', 1000, 15, 1000, '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', 7.06, 'Goods', 15, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (14, '0006', 1000, 13, 1999, '300g装', '冰糖金桔干', '揭西县同心食品有限公司', 5.01, '', 13, 2, '盒', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (15, '0007', 100659, 4.5, 400, '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', 4.5, 'good', 10, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (16, '0008', 1000, 3, 500, '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', 3, '', 10, 2, '盒', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (17, '0009', 400, 33, 1000, '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', 20, '', 33, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (18, '0010', 200, 12, 300, '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', 12, '', 20, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (19, '0011', 11, 3.2, 300, '198g装', '山楂条', '临朐县七贤升利食品厂', 3.2, '', 10, 0, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (20, '0012', 22, 20, 200, '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', 20, '', 25, 0, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (21, '0013', 400, 3, 100, '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', 3, '', 8, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (22, '0014', 12, 5, 200, '250g装', '美国青豆原味 蒜香', '菲律宾', 5, '', 8, 2, '袋', 11, NULL);
INSERT INTO `t_goods_copy` VALUES (24, '0015', 47, 8000, 100, 'X', ' iPhone X', 'xx2', 8000, 'xxx2', 9500, 2, '台', 16, NULL);
INSERT INTO `t_goods_copy` VALUES (26, '0017', 0, 3000, 100, 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', 3000, 'xxx', 3650, 2, '台', 15, NULL);
INSERT INTO `t_goods_copy` VALUES (27, '0018', 0, 800, 400, 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', 800, 'xxx', 1299, 2, '台', 15, NULL);
INSERT INTO `t_goods_copy` VALUES (28, '0019', 100, 60, 300, 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', 60, '', 129, 2, '台', 17, NULL);
INSERT INTO `t_goods_copy` VALUES (29, '0020', 0, 1000, 50, '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', 1000, '', 1699, 0, '台', 14, NULL);
INSERT INTO `t_goods_copy` VALUES (30, '0021', 98, 1199, 320, '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', 700, '', 1199, 2, '台', 12, NULL);
INSERT INTO `t_goods_copy` VALUES (31, '0022', 0, 400, 40, 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', 400, '', 729, 0, '台', 13, NULL);
INSERT INTO `t_goods_copy` VALUES (32, '0023', 0, 4, 1000, '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', 4, '', 15, 0, '袋', 9, NULL);
INSERT INTO `t_goods_copy` VALUES (33, '0024', 0, 168, 10, 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', 168, '', 298, 0, '件', 6, NULL);
INSERT INTO `t_goods_copy` VALUES (34, '0025', 0, 189, 10, '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', 189, '', 299, 0, '件', 7, NULL);
INSERT INTO `t_goods_copy` VALUES (35, '0026', 0, 200, 10, 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', 200, '', 89, 0, '条', 8, NULL);
INSERT INTO `t_goods_copy` VALUES (40, '0027', 0, 0, 100, '宽松直筒', '加绒加厚牛仔裤男直筒宽松带绒秋冬季冬天商务弹力修身黑色裤子男 ', 'MUZHILEE/慕志李', 200, '品牌: MUZHILEE/慕志李\r\n材质: 棉\r\n尺码: 28 29 30 31 32 33 34 35 36 38 40\r\n牛仔面料: 棉弹牛仔布\r\n腰型: 中高腰\r\n颜色: 6281 【秋冬厚款不加绒】 6306 【秋冬厚款不加绒】 8872 【秋冬厚款不加绒】 6821 【秋冬厚款不加绒】 8870 【秋冬厚款不加绒】 8853 【秋冬厚款不加绒】 8879【秋冬厚款不加绒】 6281 【加绒加厚款】 6306 【加绒加厚款】 8853 【加绒加厚款】 8879 【加绒加厚款】\r\n裤门襟: 拉链\r\n弹力: 微弹\r\n细分风格: 商务休闲\r\n基础风格: 商务绅士\r\n适用季节: 夏季\r\n厚薄: 薄款\r\n适用场景: 其他休闲\r\n款式细节: logo标识\r\n工艺处理: 水洗\r\n适用对象: 中年\r\n裤长: 长裤\r\n款式版型: 宽松直筒\r\n裤脚口款式: 直脚\r\n洗水工艺: 水洗\r\n材质成分: 棉66% 聚酯纤维33%', 269, 0, '条', 7, NULL);
INSERT INTO `t_goods_copy` VALUES (45, '0028', 0, 0, 100, '三文鱼中段400g', '鲜有汇聚冰鲜三文鱼中段日料刺身拼盘新鲜生鱼片即食海鲜三文鱼肉 ', 'MARINE HARVEST NORWAY', 66, '品牌名称：鲜有汇聚\r\n\r\n产品参数：\r\n\r\n    厂名：MARINE HARVEST NORWAY AS N1115\r\n    厂址：BAT-30237\r\n    厂家联系方式：0512-36859438\r\n    配料表：冰鲜三文鱼\r\n    储藏方法：0℃- 4℃冷藏\r\n    保质期：4 天\r\n    食品添加剂：无\r\n    品牌: 鲜有汇聚\r\n    产地: 挪威\r\n    食品工艺: 鲜活水产\r\n    包装方式: 包装\r\n    售卖方式: 单品\r\n    配送频次: 1周2次\r\n    鱼肉部位: 鱼中段\r\n    净含量: 400g', 74, 0, '件', 10, NULL);

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_id` int NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES (1, 'icon-folderOpen', '所有类别', -1, 1);
INSERT INTO `t_goodstype` VALUES (2, 'icon-folder', '服饰', 1, 1);
INSERT INTO `t_goodstype` VALUES (3, 'icon-folder', '食品', 1, 1);
INSERT INTO `t_goodstype` VALUES (4, 'icon-folder', '家电', 1, 1);
INSERT INTO `t_goodstype` VALUES (5, 'icon-folder', '数码', 1, 1);
INSERT INTO `t_goodstype` VALUES (6, 'icon-folder', '连衣裙', 2, 0);
INSERT INTO `t_goodstype` VALUES (7, 'icon-folder', '男士西装', 2, 0);
INSERT INTO `t_goodstype` VALUES (8, 'icon-folder', '牛仔裤', 2, 0);
INSERT INTO `t_goodstype` VALUES (9, 'icon-folder', '进口食品', 3, 0);
INSERT INTO `t_goodstype` VALUES (10, 'icon-folder', '地方特产', 3, 0);
INSERT INTO `t_goodstype` VALUES (11, 'icon-folder', '休闲食品', 3, 0);
INSERT INTO `t_goodstype` VALUES (12, 'icon-folder', '电视机', 4, 0);
INSERT INTO `t_goodstype` VALUES (13, 'icon-folder', '洗衣机', 4, 0);
INSERT INTO `t_goodstype` VALUES (14, 'icon-folder', '冰箱', 4, 0);
INSERT INTO `t_goodstype` VALUES (15, 'icon-folder', '相机', 5, 0);
INSERT INTO `t_goodstype` VALUES (16, 'icon-folder', '手机', 5, 0);
INSERT INTO `t_goodstype` VALUES (17, 'icon-folder', '音箱', 5, 0);

-- ----------------------------
-- Table structure for t_goodsunit
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsunit`;
CREATE TABLE `t_goodsunit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goodsunit
-- ----------------------------
INSERT INTO `t_goodsunit` VALUES (1, '个');
INSERT INTO `t_goodsunit` VALUES (2, '袋');
INSERT INTO `t_goodsunit` VALUES (3, '盒');
INSERT INTO `t_goodsunit` VALUES (4, '箱');
INSERT INTO `t_goodsunit` VALUES (5, '台');
INSERT INTO `t_goodsunit` VALUES (6, '包');
INSERT INTO `t_goodsunit` VALUES (11, '件');
INSERT INTO `t_goodsunit` VALUES (12, '条');
INSERT INTO `t_goodsunit` VALUES (15, '新');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbvn5yabu3vqwvtjoh32i9r4ip`(`user_id`) USING BTREE,
  CONSTRAINT `FKbvn5yabu3vqwvtjoh32i9r4ip` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_id` int NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_overflow_list
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list`;
CREATE TABLE `t_overflow_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `overflow_date` date NULL DEFAULT NULL,
  `overflow_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3bu8hj2xniqwbrtg6ls6b8ej2`(`user_id`) USING BTREE,
  CONSTRAINT `FK3bu8hj2xniqwbrtg6ls6b8ej2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_overflow_list
-- ----------------------------

-- ----------------------------
-- Table structure for t_overflow_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list_goods`;
CREATE TABLE `t_overflow_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overflow_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd3s9761mgl456tn2xb0d164h7`(`overflow_list_id`) USING BTREE,
  INDEX `FK8t46iik5kpciki8fnqtiuq5q3`(`type_id`) USING BTREE,
  CONSTRAINT `FK8t46iik5kpciki8fnqtiuq5q3` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKd3s9761mgl456tn2xb0d164h7` FOREIGN KEY (`overflow_list_id`) REFERENCES `t_overflow_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_overflow_list_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_purchase_list
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list`;
CREATE TABLE `t_purchase_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NULL DEFAULT NULL,
  `amount_payable` float NULL DEFAULT NULL,
  `purchase_date` date NULL DEFAULT NULL,
  `purchase_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5j2dev8b2b5d0l69nb8vtr4yb`(`supplier_id`) USING BTREE,
  INDEX `FK69s6eyxr4wwvsywe9hbthef1h`(`user_id`) USING BTREE,
  CONSTRAINT `FK5j2dev8b2b5d0l69nb8vtr4yb` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK69s6eyxr4wwvsywe9hbthef1h` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_purchase_list
-- ----------------------------

-- ----------------------------
-- Table structure for t_purchase_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list_goods`;
CREATE TABLE `t_purchase_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `total` float NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfvdvgcebqkkokyn0o00idqnpy`(`purchase_list_id`) USING BTREE,
  INDEX `FK83ikbi2x3epn49fwcco8jlfwu`(`type_id`) USING BTREE,
  CONSTRAINT `FK83ikbi2x3epn49fwcco8jlfwu` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfvdvgcebqkkokyn0o00idqnpy` FOREIGN KEY (`purchase_list_id`) REFERENCES `t_purchase_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_purchase_list_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list`;
CREATE TABLE `t_return_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_date` date NULL DEFAULT NULL,
  `return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `supplier_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4qxjj8bvj2etne243xluni0vn`(`supplier_id`) USING BTREE,
  INDEX `FK904juw2v1hm2av0ig26gae9jb`(`user_id`) USING BTREE,
  INDEX `FKctbounbcalncft1244tljfo1s`(`customer_id`) USING BTREE,
  CONSTRAINT `FK4qxjj8bvj2etne243xluni0vn` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK904juw2v1hm2av0ig26gae9jb` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKctbounbcalncft1244tljfo1s` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return_list
-- ----------------------------

-- ----------------------------
-- Table structure for t_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list_goods`;
CREATE TABLE `t_return_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKemclu281vyvyk063c3foafq1w`(`return_list_id`) USING BTREE,
  INDEX `FKa1prpd96fcs0x2oe0omny9vio`(`type_id`) USING BTREE,
  CONSTRAINT `FKa1prpd96fcs0x2oe0omny9vio` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKemclu281vyvyk063c3foafq1w` FOREIGN KEY (`return_list_id`) REFERENCES `t_return_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return_list_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhayg4ib6v7h1wyeyxhq6xlddq`(`menu_id`) USING BTREE,
  INDEX `FKsonb0rbt2u99hbrqqvv3r0wse`(`role_id`) USING BTREE,
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_sale_list
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list`;
CREATE TABLE `t_sale_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_date` date NULL DEFAULT NULL,
  `sale_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKox4qfs87eu3fvwdmrvelqhi8e`(`customer_id`) USING BTREE,
  INDEX `FK34bnujemrdqimbhg133enp8k8`(`user_id`) USING BTREE,
  CONSTRAINT `FK34bnujemrdqimbhg133enp8k8` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKox4qfs87eu3fvwdmrvelqhi8e` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_list
-- ----------------------------

-- ----------------------------
-- Table structure for t_sale_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list_goods`;
CREATE TABLE `t_sale_list_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_list_id` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK20ehd6ta9geyql4hxtdsnhbox`(`sale_list_id`) USING BTREE,
  INDEX `FKn9i5p1d8f0gek5x7q45cq8ibw`(`type_id`) USING BTREE,
  CONSTRAINT `FK20ehd6ta9geyql4hxtdsnhbox` FOREIGN KEY (`sale_list_id`) REFERENCES `t_sale_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKn9i5p1d8f0gek5x7q45cq8ibw` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_list_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKa9c8iiy6ut0gnx491fqx4pxam`(`role_id`) USING BTREE,
  INDEX `FKq5un6x7ecoef5w1n39cop66kl`(`user_id`) USING BTREE,
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

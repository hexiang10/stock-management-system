/*
 Navicat Premium Data Transfer

 Source Server         : localhost - MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : db_jxc_test

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 30/12/2021 11:20:55
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '珠海市香洲区5号', '小李子', '华发商城', '2132-23213421', '');
INSERT INTO `t_customer` VALUES (2, '安堂村666街', '小张', '新航酒店', '23432222311', '优质客户');
INSERT INTO `t_customer` VALUES (3, '下坝村', '小爱', '希望小学', '233243211', '照顾客户2');
INSERT INTO `t_customer` VALUES (4, '深圳必胜客888号', '王二小', '南山必胜客集团', '1832132321', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_return_list
-- ----------------------------
INSERT INTO `t_customer_return_list` VALUES (10, 17, 17, '2021-12-08', 'XT202010150001', '', 1, 1, 1);
INSERT INTO `t_customer_return_list` VALUES (11, 1250, 1250, '2021-12-08', 'XT202010150001', '', 1, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_damage_list
-- ----------------------------
INSERT INTO `t_damage_list` VALUES (1, '2021-12-08', 'JH202001150001', '受潮', 1);
INSERT INTO `t_damage_list` VALUES (2, '2021-12-08', 'JH202001150002', '已过期', 1);
INSERT INTO `t_damage_list` VALUES (3, '2021-12-08', 'JH202010150001', '已过期', 1);
INSERT INTO `t_damage_list` VALUES (4, '2021-12-13', 'JH202112130001', '异味', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_damage_list_goods
-- ----------------------------
INSERT INTO `t_damage_list_goods` VALUES (1, '0002', 2, 'Note8', '华为荣耀Note8', 1, 2220, 2220, '台', 1, 16);
INSERT INTO `t_damage_list_goods` VALUES (2, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 10, 8.5, 85, '瓶', 2, 10);
INSERT INTO `t_damage_list_goods` VALUES (3, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 5, 8.5, 42.5, '瓶', 3, 10);
INSERT INTO `t_damage_list_goods` VALUES (4, '0014', 22, '250g装', '美国青豆原味 蒜香', 1, 5, 5, '袋', 4, 11);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (1, '0001', 1, 8.5, 1000, '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', 7.47, '好卖', 8.5, 2, '瓶', 10, NULL);
INSERT INTO `t_goods` VALUES (2, '0002', 100, 2220, 400, 'Note8', '华为荣耀手机', '华为计算机系统有限公司', 2029.68, '热销', 2200, 2, '台', 16, NULL);
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
INSERT INTO `t_goods` VALUES (22, '0014', 11, 5, 200, '250g装', '美国青豆原味 蒜香', '菲律宾', 5, '', 8, 2, '袋', 11, NULL);
INSERT INTO `t_goods` VALUES (24, '0015', 47, 8000, 100, 'X', ' iPhone 手机', 'xx2', 8000, 'xxx2', 9500, 2, '台', 16, NULL);
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
INSERT INTO `t_goods` VALUES (45, '0028', 10, 25, 100, '三文鱼中段400g', '鲜有汇聚冰鲜三文鱼中段日料刺身拼盘新鲜生鱼片即食海鲜三文鱼肉 ', 'MARINE HARVEST NORWAY', 25, '品牌名称：鲜有汇聚\r\n\r\n产品参数：\r\n\r\n    厂名：MARINE HARVEST NORWAY AS N1115\r\n    厂址：BAT-30237\r\n    厂家联系方式：0512-36859438\r\n    配料表：冰鲜三文鱼\r\n    储藏方法：0℃- 4℃冷藏\r\n    保质期：4 天\r\n    食品添加剂：无\r\n    品牌: 鲜有汇聚\r\n    产地: 挪威\r\n    食品工艺: 鲜活水产\r\n    包装方式: 包装\r\n    售卖方式: 单品\r\n    配送频次: 1周2次\r\n    鱼肉部位: 鱼中段\r\n    净含量: 400g', 74, 2, '件', 10, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5053 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (4814, '用户登录', '2021-12-12 22:50:30', '登录操作', 1);
INSERT INTO `t_log` VALUES (4815, '查询商品信息', '2021-12-12 22:50:34', '查询操作', 1);
INSERT INTO `t_log` VALUES (4816, '查询商品信息', '2021-12-12 22:51:41', '查询操作', 1);
INSERT INTO `t_log` VALUES (4817, '查询商品信息', '2021-12-12 22:51:42', '查询操作', 1);
INSERT INTO `t_log` VALUES (4818, '查询商品信息', '2021-12-12 22:51:46', '查询操作', 1);
INSERT INTO `t_log` VALUES (4819, '查询商品信息', '2021-12-12 22:51:47', '查询操作', 1);
INSERT INTO `t_log` VALUES (4820, '查询库存报警商品信息', '2021-12-12 22:51:57', '查询操作', 1);
INSERT INTO `t_log` VALUES (4821, '查询商品信息', '2021-12-12 22:57:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (4822, '查询商品信息', '2021-12-12 22:57:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (4823, '查询商品信息', '2021-12-12 23:02:38', '查询操作', 1);
INSERT INTO `t_log` VALUES (4824, '查询商品信息', '2021-12-12 23:02:41', '查询操作', 1);
INSERT INTO `t_log` VALUES (4825, '查询商品信息', '2021-12-12 23:02:42', '查询操作', 1);
INSERT INTO `t_log` VALUES (4826, '查询所有商品类别信息', '2021-12-12 23:03:41', '查询操作', 1);
INSERT INTO `t_log` VALUES (4827, '查询供应商信息', '2021-12-12 23:08:01', '查询操作', 1);
INSERT INTO `t_log` VALUES (4828, '查询供应商信息', '2021-12-12 23:08:01', '查询操作', 1);
INSERT INTO `t_log` VALUES (4829, '查询商品信息', '2021-12-12 23:08:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4830, '查询商品单位信息', '2021-12-12 23:08:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4831, '查询所有商品类别信息', '2021-12-12 23:08:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4832, '查询商品单位信息', '2021-12-12 23:08:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4833, '查询商品信息', '2021-12-12 23:08:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4834, '查询商品信息(无库存)', '2021-12-12 23:08:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (4835, '查询商品信息(有库存)', '2021-12-12 23:08:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (4836, '查询商品信息(无库存)', '2021-12-12 23:08:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (4837, '查询商品信息(有库存)', '2021-12-12 23:08:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (4838, '查询商品信息(无库存)', '2021-12-12 23:09:05', '查询操作', 1);
INSERT INTO `t_log` VALUES (4839, '查询商品信息(无库存)', '2021-12-12 23:09:05', '查询操作', 1);
INSERT INTO `t_log` VALUES (4840, '查询商品信息(无库存)', '2021-12-12 23:09:07', '查询操作', 1);
INSERT INTO `t_log` VALUES (4841, '查询商品信息(无库存)', '2021-12-12 23:09:08', '查询操作', 1);
INSERT INTO `t_log` VALUES (4842, '查询商品信息(无库存)', '2021-12-12 23:09:14', '查询操作', 1);
INSERT INTO `t_log` VALUES (4843, '查询商品信息(无库存)', '2021-12-12 23:09:15', '查询操作', 1);
INSERT INTO `t_log` VALUES (4844, '查询商品信息(无库存)', '2021-12-12 23:09:15', '查询操作', 1);
INSERT INTO `t_log` VALUES (4845, '查询商品信息(无库存)', '2021-12-12 23:09:15', '查询操作', 1);
INSERT INTO `t_log` VALUES (4846, '查询商品信息(无库存)', '2021-12-12 23:10:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4847, '查询商品信息(有库存)', '2021-12-12 23:10:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4848, '查询商品信息(无库存)', '2021-12-12 23:10:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4849, '查询商品信息(有库存)', '2021-12-12 23:10:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4850, '用户登录', '2021-12-12 23:55:21', '登录操作', 1);
INSERT INTO `t_log` VALUES (4851, '查询商品信息', '2021-12-12 23:55:25', '查询操作', 1);
INSERT INTO `t_log` VALUES (4852, '查询角色信息', '2021-12-12 23:55:36', '查询操作', 1);
INSERT INTO `t_log` VALUES (4853, '查询角色信息', '2021-12-12 23:55:36', '查询操作', 1);
INSERT INTO `t_log` VALUES (4854, '查询客户信息', '2021-12-13 00:05:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4855, '查询客户信息', '2021-12-13 00:05:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4856, '进货单查询', '2021-12-13 00:06:07', '查询操作', 1);
INSERT INTO `t_log` VALUES (4857, '退货单查询', '2021-12-13 00:06:07', '查询操作', 1);
INSERT INTO `t_log` VALUES (4858, '查询商品信息', '2021-12-13 00:28:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4859, '查询商品单位信息', '2021-12-13 00:28:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4860, '查询所有商品类别信息', '2021-12-13 00:28:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4861, '查询商品单位信息', '2021-12-13 00:28:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4862, '查询商品信息', '2021-12-13 00:28:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4863, '查询商品信息(无库存)', '2021-12-13 00:29:47', '查询操作', 1);
INSERT INTO `t_log` VALUES (4864, '查询商品信息(有库存)', '2021-12-13 00:29:48', '查询操作', 1);
INSERT INTO `t_log` VALUES (4865, '查询商品信息(无库存)', '2021-12-13 00:29:48', '查询操作', 1);
INSERT INTO `t_log` VALUES (4866, '查询商品信息(有库存)', '2021-12-13 00:29:48', '查询操作', 1);
INSERT INTO `t_log` VALUES (4867, '查询商品信息', '2021-12-13 00:30:11', '查询操作', 1);
INSERT INTO `t_log` VALUES (4868, '查询商品信息', '2021-12-13 00:32:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4869, '查询商品信息', '2021-12-13 00:32:31', '查询操作', 1);
INSERT INTO `t_log` VALUES (4870, '查询所有商品类别信息', '2021-12-13 00:33:46', '查询操作', 1);
INSERT INTO `t_log` VALUES (4871, '查询商品信息', '2021-12-13 00:33:50', '查询操作', 1);
INSERT INTO `t_log` VALUES (4872, '查询商品信息', '2021-12-13 00:33:51', '查询操作', 1);
INSERT INTO `t_log` VALUES (4873, '查询商品信息', '2021-12-13 00:33:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (4874, '查询商品信息', '2021-12-13 00:34:04', '查询操作', 1);
INSERT INTO `t_log` VALUES (4875, '查询商品信息', '2021-12-13 00:34:17', '查询操作', 1);
INSERT INTO `t_log` VALUES (4876, '查询商品信息', '2021-12-13 00:34:19', '查询操作', 1);
INSERT INTO `t_log` VALUES (4877, '查询商品信息', '2021-12-13 00:34:26', '查询操作', 1);
INSERT INTO `t_log` VALUES (4878, '查询商品信息', '2021-12-13 00:34:31', '查询操作', 1);
INSERT INTO `t_log` VALUES (4879, '查询商品信息', '2021-12-13 00:39:28', '查询操作', 1);
INSERT INTO `t_log` VALUES (4880, '查询商品信息', '2021-12-13 00:39:42', '查询操作', 1);
INSERT INTO `t_log` VALUES (4881, '查询商品信息', '2021-12-13 00:39:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (4882, '查询商品信息', '2021-12-13 00:39:49', '查询操作', 1);
INSERT INTO `t_log` VALUES (4883, '查询商品信息', '2021-12-13 00:39:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4884, '查询商品信息', '2021-12-13 00:39:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4885, '添加进货单', '2021-12-13 00:41:12', '添加操作', 1);
INSERT INTO `t_log` VALUES (4886, '查询商品信息', '2021-12-13 00:41:16', '查询操作', 1);
INSERT INTO `t_log` VALUES (4887, '查询商品信息', '2021-12-13 00:41:16', '查询操作', 1);
INSERT INTO `t_log` VALUES (4888, '进货单查询', '2021-12-13 00:41:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4889, '进货单查询', '2021-12-13 00:41:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4890, '进货单商品查询', '2021-12-13 00:41:38', '查询操作', 1);
INSERT INTO `t_log` VALUES (4891, '进货单商品查询', '2021-12-13 00:41:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4892, '进货单商品查询', '2021-12-13 00:41:41', '查询操作', 1);
INSERT INTO `t_log` VALUES (4893, '进货单商品查询', '2021-12-13 00:41:42', '查询操作', 1);
INSERT INTO `t_log` VALUES (4894, '退货单查询', '2021-12-13 00:41:43', '查询操作', 1);
INSERT INTO `t_log` VALUES (4895, '退货单查询', '2021-12-13 00:41:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (4896, '查询商品信息', '2021-12-13 00:41:46', '查询操作', 1);
INSERT INTO `t_log` VALUES (4897, '查询商品信息', '2021-12-13 00:41:47', '查询操作', 1);
INSERT INTO `t_log` VALUES (4898, '查询商品信息', '2021-12-13 00:41:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4899, '查询商品信息', '2021-12-13 00:42:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4900, '查询商品信息', '2021-12-13 00:42:31', '查询操作', 1);
INSERT INTO `t_log` VALUES (4901, '查询所有商品类别信息', '2021-12-13 00:42:33', '查询操作', 1);
INSERT INTO `t_log` VALUES (4902, '查询商品信息', '2021-12-13 00:43:03', '查询操作', 1);
INSERT INTO `t_log` VALUES (4903, '添加商品报损单--{编号=4, 商品报损单号=\'JH202112130001\', 商品报损日期=2021-12-13, 操作用户=小何, 备注=\'异味\'}', '2021-12-13 00:43:30', '添加操作', 1);
INSERT INTO `t_log` VALUES (4904, '查询商品信息', '2021-12-13 00:43:33', '查询操作', 1);
INSERT INTO `t_log` VALUES (4905, '查询商品信息', '2021-12-13 00:43:34', '查询操作', 1);
INSERT INTO `t_log` VALUES (4906, '查询商品信息', '2021-12-13 00:43:48', '查询操作', 1);
INSERT INTO `t_log` VALUES (4907, '查询商品信息', '2021-12-13 00:43:49', '查询操作', 1);
INSERT INTO `t_log` VALUES (4908, '查询商品信息', '2021-12-13 00:44:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (4909, '查询商品信息', '2021-12-13 00:44:13', '查询操作', 1);
INSERT INTO `t_log` VALUES (4910, '查询商品信息', '2021-12-13 00:44:28', '查询操作', 1);
INSERT INTO `t_log` VALUES (4911, '查询商品信息', '2021-12-13 00:44:29', '查询操作', 1);
INSERT INTO `t_log` VALUES (4912, '查询商品信息', '2021-12-13 00:44:41', '查询操作', 1);
INSERT INTO `t_log` VALUES (4913, '查询库存报警商品信息', '2021-12-13 00:44:42', '查询操作', 1);
INSERT INTO `t_log` VALUES (4914, '商品报溢单查询', '2021-12-13 00:45:29', '查询操作', 1);
INSERT INTO `t_log` VALUES (4915, '商品报损单查询', '2021-12-13 00:45:32', '查询操作', 1);
INSERT INTO `t_log` VALUES (4916, '商品报损单商品查询', '2021-12-13 00:45:39', '查询操作', 1);
INSERT INTO `t_log` VALUES (4917, '商品报损单商品查询', '2021-12-13 00:45:39', '查询操作', 1);
INSERT INTO `t_log` VALUES (4918, '商品报损单商品查询', '2021-12-13 00:45:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4919, '商品报损单商品查询', '2021-12-13 00:45:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4920, '查询商品信息', '2021-12-13 00:46:03', '查询操作', 1);
INSERT INTO `t_log` VALUES (4921, '查询商品信息', '2021-12-13 00:46:04', '查询操作', 1);
INSERT INTO `t_log` VALUES (4922, '查询所有商品类别信息', '2021-12-13 00:46:07', '查询操作', 1);
INSERT INTO `t_log` VALUES (4923, '用户登录', '2021-12-13 09:49:49', '登录操作', 1);
INSERT INTO `t_log` VALUES (4924, '查询商品信息', '2021-12-13 09:49:52', '查询操作', 1);
INSERT INTO `t_log` VALUES (4925, '查询商品信息', '2021-12-13 09:50:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4926, '查询商品信息', '2021-12-13 09:50:01', '查询操作', 1);
INSERT INTO `t_log` VALUES (4927, '查询所有商品类别信息', '2021-12-13 09:50:08', '查询操作', 1);
INSERT INTO `t_log` VALUES (4928, '查询商品信息', '2021-12-13 09:51:52', '查询操作', 1);
INSERT INTO `t_log` VALUES (4929, '查询商品信息', '2021-12-13 09:51:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (4930, '进货单查询', '2021-12-13 09:52:07', '查询操作', 1);
INSERT INTO `t_log` VALUES (4931, '进货单查询', '2021-12-13 09:52:08', '查询操作', 1);
INSERT INTO `t_log` VALUES (4932, '进货单商品查询', '2021-12-13 09:52:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (4933, '查询商品信息', '2021-12-13 09:54:37', '查询操作', 1);
INSERT INTO `t_log` VALUES (4934, '查询商品信息', '2021-12-13 09:54:38', '查询操作', 1);
INSERT INTO `t_log` VALUES (4935, '查询所有商品类别信息', '2021-12-13 09:54:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (4936, '查询商品信息', '2021-12-13 09:56:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (4937, '查询商品信息', '2021-12-13 09:56:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4938, '查询所有商品类别信息', '2021-12-13 09:56:57', '查询操作', 1);
INSERT INTO `t_log` VALUES (4939, '查询库存报警商品信息', '2021-12-13 10:17:27', '查询操作', 1);
INSERT INTO `t_log` VALUES (4940, '查询商品信息', '2021-12-13 10:18:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4941, '查询商品信息', '2021-12-13 10:18:31', '查询操作', 1);
INSERT INTO `t_log` VALUES (4942, '添加商品报损单--{编号=5, 商品报损单号=\'JH202112130002\', 商品报损日期=2021-12-13, 操作用户=小何, 备注=\'\'}', '2021-12-13 10:18:52', '添加操作', 1);
INSERT INTO `t_log` VALUES (4943, '查询商品信息', '2021-12-13 10:18:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4944, '查询商品信息', '2021-12-13 10:18:56', '查询操作', 1);
INSERT INTO `t_log` VALUES (4945, '查询所有商品类别信息', '2021-12-13 10:18:58', '查询操作', 1);
INSERT INTO `t_log` VALUES (4946, '查询商品信息', '2021-12-13 10:19:08', '查询操作', 1);
INSERT INTO `t_log` VALUES (4947, '查询商品信息', '2021-12-13 10:19:09', '查询操作', 1);
INSERT INTO `t_log` VALUES (4948, '查询商品信息', '2021-12-13 10:19:29', '查询操作', 1);
INSERT INTO `t_log` VALUES (4949, '查询商品信息', '2021-12-13 10:19:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4950, '查询商品信息', '2021-12-13 10:19:59', '查询操作', 1);
INSERT INTO `t_log` VALUES (4951, '查询商品信息', '2021-12-13 10:20:05', '查询操作', 1);
INSERT INTO `t_log` VALUES (4952, '查询商品信息', '2021-12-13 10:20:06', '查询操作', 1);
INSERT INTO `t_log` VALUES (4953, '商品报损单查询', '2021-12-13 10:20:37', '查询操作', 1);
INSERT INTO `t_log` VALUES (4954, '商品报损单商品查询', '2021-12-13 10:20:48', '查询操作', 1);
INSERT INTO `t_log` VALUES (4955, '商品报损单商品查询', '2021-12-13 10:20:49', '查询操作', 1);
INSERT INTO `t_log` VALUES (4956, '商品报损单商品查询', '2021-12-13 10:20:51', '查询操作', 1);
INSERT INTO `t_log` VALUES (4957, '查询商品信息', '2021-12-13 10:21:09', '查询操作', 1);
INSERT INTO `t_log` VALUES (4958, '查询商品信息', '2021-12-13 10:21:10', '查询操作', 1);
INSERT INTO `t_log` VALUES (4959, '查询商品信息', '2021-12-13 10:21:11', '查询操作', 1);
INSERT INTO `t_log` VALUES (4960, '查询商品信息', '2021-12-13 10:21:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (4961, '商品报损单商品查询', '2021-12-13 10:21:18', '查询操作', 1);
INSERT INTO `t_log` VALUES (4962, '商品报损单商品查询', '2021-12-13 10:21:18', '查询操作', 1);
INSERT INTO `t_log` VALUES (4963, '商品报损单商品查询', '2021-12-13 10:21:19', '查询操作', 1);
INSERT INTO `t_log` VALUES (4964, '商品报损单商品查询', '2021-12-13 10:21:21', '查询操作', 1);
INSERT INTO `t_log` VALUES (4965, '商品报损单商品查询', '2021-12-13 10:21:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4966, '商品报损单商品查询', '2021-12-13 10:21:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (4967, '商品报损单商品查询', '2021-12-13 10:21:24', '查询操作', 1);
INSERT INTO `t_log` VALUES (4968, '商品报损单查询', '2021-12-13 10:21:46', '查询操作', 1);
INSERT INTO `t_log` VALUES (4969, '商品报损单商品查询', '2021-12-13 10:21:56', '查询操作', 1);
INSERT INTO `t_log` VALUES (4970, '查询商品信息', '2021-12-13 10:22:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (4971, '查询商品信息', '2021-12-13 10:23:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4972, '查询商品信息', '2021-12-13 10:23:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (4973, '查询所有商品类别信息', '2021-12-13 10:23:58', '查询操作', 1);
INSERT INTO `t_log` VALUES (4974, '进货单查询', '2021-12-13 10:24:20', '查询操作', 1);
INSERT INTO `t_log` VALUES (4975, '退货单查询', '2021-12-13 10:24:20', '查询操作', 1);
INSERT INTO `t_log` VALUES (4976, '退货单查询', '2021-12-13 10:24:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4977, '进货单查询', '2021-12-13 10:24:30', '查询操作', 1);
INSERT INTO `t_log` VALUES (4978, '进货单查询', '2021-12-13 10:24:51', '查询操作', 1);
INSERT INTO `t_log` VALUES (4979, '退货单查询', '2021-12-13 10:24:51', '查询操作', 1);
INSERT INTO `t_log` VALUES (4980, '进货单商品查询', '2021-12-13 10:24:56', '查询操作', 1);
INSERT INTO `t_log` VALUES (4981, '销售单查询', '2021-12-13 10:26:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4982, '客户退货单查询', '2021-12-13 10:26:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4983, '客户退货单商品查询', '2021-12-13 10:26:08', '查询操作', 1);
INSERT INTO `t_log` VALUES (4984, '销售单商品查询', '2021-12-13 10:26:10', '查询操作', 1);
INSERT INTO `t_log` VALUES (4985, '商品采购统计查询', '2021-12-13 10:30:36', '查询操作', 1);
INSERT INTO `t_log` VALUES (4986, '商品采购统计查询', '2021-12-13 10:30:36', '查询操作', 1);
INSERT INTO `t_log` VALUES (4987, '商品采购统计查询', '2021-12-13 10:31:15', '查询操作', 1);
INSERT INTO `t_log` VALUES (4988, '商品采购统计查询', '2021-12-13 10:31:15', '查询操作', 1);
INSERT INTO `t_log` VALUES (4989, '查询角色信息', '2021-12-13 10:36:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4990, '查询角色信息', '2021-12-13 10:36:40', '查询操作', 1);
INSERT INTO `t_log` VALUES (4991, '查询商品信息', '2021-12-13 10:36:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (4992, '查询商品单位信息', '2021-12-13 10:36:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (4993, '查询所有商品类别信息', '2021-12-13 10:36:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4994, '查询商品单位信息', '2021-12-13 10:36:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4995, '查询商品信息', '2021-12-13 10:36:54', '查询操作', 1);
INSERT INTO `t_log` VALUES (4996, '查询供应商信息', '2021-12-13 10:37:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4997, '查询供应商信息', '2021-12-13 10:37:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (4998, '查询客户信息', '2021-12-13 10:37:27', '查询操作', 1);
INSERT INTO `t_log` VALUES (4999, '查询客户信息', '2021-12-13 10:37:27', '查询操作', 1);
INSERT INTO `t_log` VALUES (5000, '查询商品信息', '2021-12-13 10:37:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (5001, '查询商品单位信息', '2021-12-13 10:37:44', '查询操作', 1);
INSERT INTO `t_log` VALUES (5002, '查询所有商品类别信息', '2021-12-13 10:37:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (5003, '查询商品单位信息', '2021-12-13 10:37:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (5004, '查询商品信息', '2021-12-13 10:37:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (5005, '查询商品信息(无库存)', '2021-12-13 10:37:59', '查询操作', 1);
INSERT INTO `t_log` VALUES (5006, '查询商品信息(有库存)', '2021-12-13 10:37:59', '查询操作', 1);
INSERT INTO `t_log` VALUES (5007, '查询商品信息(无库存)', '2021-12-13 10:38:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (5008, '查询商品信息(有库存)', '2021-12-13 10:38:00', '查询操作', 1);
INSERT INTO `t_log` VALUES (5009, '查询商品信息(有库存)', '2021-12-13 10:38:11', '查询操作', 1);
INSERT INTO `t_log` VALUES (5010, '查询商品信息(有库存)', '2021-12-13 10:38:12', '查询操作', 1);
INSERT INTO `t_log` VALUES (5011, '查询用户信息', '2021-12-13 10:38:17', '查询操作', 1);
INSERT INTO `t_log` VALUES (5012, '查询用户信息', '2021-12-13 10:38:18', '查询操作', 1);
INSERT INTO `t_log` VALUES (5013, '查询角色信息', '2021-12-13 10:38:52', '查询操作', 1);
INSERT INTO `t_log` VALUES (5014, '查询角色信息', '2021-12-13 10:38:53', '查询操作', 1);
INSERT INTO `t_log` VALUES (5015, '查询用户信息', '2021-12-13 10:42:19', '查询操作', 1);
INSERT INTO `t_log` VALUES (5016, '查询用户信息', '2021-12-13 10:42:20', '查询操作', 1);
INSERT INTO `t_log` VALUES (5017, '查询商品信息', '2021-12-13 10:45:06', '查询操作', 1);
INSERT INTO `t_log` VALUES (5018, '查询用户信息', '2021-12-13 10:45:18', '查询操作', 1);
INSERT INTO `t_log` VALUES (5019, '查询用户信息', '2021-12-13 10:45:18', '查询操作', 1);
INSERT INTO `t_log` VALUES (5020, '用户注销', '2021-12-13 11:04:35', '注销操作', 1);
INSERT INTO `t_log` VALUES (5021, '用户登录', '2021-12-27 09:01:13', '登录操作', 1);
INSERT INTO `t_log` VALUES (5022, '查询商品信息', '2021-12-27 09:01:17', '查询操作', 1);
INSERT INTO `t_log` VALUES (5023, '查询商品信息', '2021-12-27 09:02:09', '查询操作', 1);
INSERT INTO `t_log` VALUES (5024, '查询商品信息', '2021-12-27 09:02:10', '查询操作', 1);
INSERT INTO `t_log` VALUES (5025, '查询所有商品类别信息', '2021-12-27 09:02:23', '查询操作', 1);
INSERT INTO `t_log` VALUES (5026, '添加进货单', '2021-12-27 09:02:51', '添加操作', 1);
INSERT INTO `t_log` VALUES (5027, '查询商品信息', '2021-12-27 09:02:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (5028, '查询商品信息', '2021-12-27 09:02:55', '查询操作', 1);
INSERT INTO `t_log` VALUES (5029, '进货单查询', '2021-12-27 09:02:57', '查询操作', 1);
INSERT INTO `t_log` VALUES (5030, '进货单查询', '2021-12-27 09:02:57', '查询操作', 1);
INSERT INTO `t_log` VALUES (5031, '退货单查询', '2021-12-27 09:03:33', '查询操作', 1);
INSERT INTO `t_log` VALUES (5032, '退货单查询', '2021-12-27 09:03:33', '查询操作', 1);
INSERT INTO `t_log` VALUES (5033, '查询商品信息', '2021-12-27 09:03:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (5034, '查询商品信息', '2021-12-27 09:03:45', '查询操作', 1);
INSERT INTO `t_log` VALUES (5035, '查询所有商品类别信息', '2021-12-27 09:03:52', '查询操作', 1);
INSERT INTO `t_log` VALUES (5036, '添加销售单--{编号=14, 销售单号=\'XS202112270001\', 客户=新航酒店, 应付金额=680.0, 实付金额=680.0}', '2021-12-27 09:04:09', '添加操作', 1);
INSERT INTO `t_log` VALUES (5037, '查询商品信息', '2021-12-27 09:04:13', '查询操作', 1);
INSERT INTO `t_log` VALUES (5038, '查询商品信息', '2021-12-27 09:04:13', '查询操作', 1);
INSERT INTO `t_log` VALUES (5039, '查询商品信息', '2021-12-27 09:04:16', '查询操作', 1);
INSERT INTO `t_log` VALUES (5040, '查询商品信息', '2021-12-27 09:04:16', '查询操作', 1);
INSERT INTO `t_log` VALUES (5041, '查询商品信息', '2021-12-27 09:04:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (5042, '查询商品信息', '2021-12-27 09:04:22', '查询操作', 1);
INSERT INTO `t_log` VALUES (5043, '查询库存报警商品信息', '2021-12-27 09:04:28', '查询操作', 1);
INSERT INTO `t_log` VALUES (5044, '退货单查询', '2021-12-27 09:06:43', '查询操作', 1);
INSERT INTO `t_log` VALUES (5045, '进货单查询', '2021-12-27 09:06:43', '查询操作', 1);
INSERT INTO `t_log` VALUES (5046, '查询角色信息', '2021-12-27 09:07:02', '查询操作', 1);
INSERT INTO `t_log` VALUES (5047, '查询角色信息', '2021-12-27 09:07:03', '查询操作', 1);
INSERT INTO `t_log` VALUES (5048, '查询用户信息', '2021-12-27 09:07:26', '查询操作', 1);
INSERT INTO `t_log` VALUES (5049, '查询用户信息', '2021-12-27 09:07:27', '查询操作', 1);
INSERT INTO `t_log` VALUES (5050, '用户注销', '2021-12-27 09:08:20', '注销操作', 1);
INSERT INTO `t_log` VALUES (5051, '用户登录', '2021-12-27 09:08:29', '登录操作', 7);
INSERT INTO `t_log` VALUES (5052, '查询商品信息', '2021-12-27 09:08:32', '查询操作', 7);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6051 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 'menu-plugin', '系统菜单', -1, 1, NULL);
INSERT INTO `t_menu` VALUES (10, 'menu-1', '进货管理', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (20, 'menu-2', '销售管理', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (30, 'menu-3', '库存管理', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (40, 'menu-4', '统计报表', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (50, 'menu-5', '基础资料', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (60, 'menu-6', '系统管理', 1, 1, NULL);
INSERT INTO `t_menu` VALUES (1010, 'menu-11', '进货入库', 10, 0, '/purchase/purchase.html');
INSERT INTO `t_menu` VALUES (1020, 'menu-12', '退货出库', 10, 0, '/purchase/return.html');
INSERT INTO `t_menu` VALUES (1030, 'menu-13', '进货单据查询', 10, 0, '/purchase/purchaseSearch.html');
INSERT INTO `t_menu` VALUES (1040, 'menu-14', '退货单据查询', 10, 0, '/purchase/returnSearch.html');
INSERT INTO `t_menu` VALUES (1050, 'menu-15', '当前库存查询', 10, 0, '/common/stockSearch.html');
INSERT INTO `t_menu` VALUES (2010, 'menu-21', '销售出库', 20, 0, '/sale/saleout.html');
INSERT INTO `t_menu` VALUES (2020, 'menu-22', '客户退货', 20, 0, '/sale/salereturn.html');
INSERT INTO `t_menu` VALUES (2030, 'menu-23', '销售单据查询', 20, 0, '/sale/saleSearch.html');
INSERT INTO `t_menu` VALUES (2040, 'menu-24', '客户退货查询', 20, 0, '/sale/returnSearch.html');
INSERT INTO `t_menu` VALUES (2050, 'menu-25', '当前库存查询', 20, 0, '/common/stockSearch.html');
INSERT INTO `t_menu` VALUES (3010, 'menu-31', '商品报损', 30, 0, '/stock/damage.html');
INSERT INTO `t_menu` VALUES (3020, 'menu-32', '商品报溢', 30, 0, '/stock/overflow.html');
INSERT INTO `t_menu` VALUES (3030, 'menu-33', '库存报警', 30, 0, '/stock/alarm.html');
INSERT INTO `t_menu` VALUES (3040, 'menu-34', '报损报溢查询', 30, 0, '/stock/damageOverflowSearch.html');
INSERT INTO `t_menu` VALUES (3050, 'menu-35', '当前库存查询', 30, 0, '/common/stockSearch.html');
INSERT INTO `t_menu` VALUES (4010, 'menu-41', '供应商统计', 40, 0, '/count/supplier.html');
INSERT INTO `t_menu` VALUES (4020, 'menu-42', '客户统计', 40, 0, '/count/customer.html');
INSERT INTO `t_menu` VALUES (4030, 'menu-43', '商品采购统计', 40, 0, '/count/purchase.html');
INSERT INTO `t_menu` VALUES (4040, 'menu-44', '商品销售统计', 40, 0, '/count/sale.html');
INSERT INTO `t_menu` VALUES (4050, 'menu-45', '按日统计分析', 40, 0, '/count/saleDay.html');
INSERT INTO `t_menu` VALUES (4060, 'menu-46', '按月统计分析', 40, 0, '/count/saleMonth.html');
INSERT INTO `t_menu` VALUES (5010, 'menu-51', '供应商管理', 50, 0, '/basicData/supplier.html');
INSERT INTO `t_menu` VALUES (5020, 'menu-52', '客户管理', 50, 0, '/basicData/customer.html');
INSERT INTO `t_menu` VALUES (5030, 'menu-53', '商品管理', 50, 0, '/basicData/goods.html');
INSERT INTO `t_menu` VALUES (5040, 'menu-54', '期初库存', 50, 0, '/basicData/stock.html');
INSERT INTO `t_menu` VALUES (6010, 'menu-61', '角色管理', 60, 0, '/power/role.html');
INSERT INTO `t_menu` VALUES (6020, 'menu-62', '用户管理', 60, 0, '/power/user.html');
INSERT INTO `t_menu` VALUES (6030, 'menu-65', '系统日志', 60, 0, '/power/log.html');
INSERT INTO `t_menu` VALUES (6040, 'menu-63', '修改密码', 60, 0, NULL);
INSERT INTO `t_menu` VALUES (6050, 'menu-64', '安全退出', 60, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_overflow_list
-- ----------------------------
INSERT INTO `t_overflow_list` VALUES (1, '2021-12-08', 'JH202001150001', '', 1);
INSERT INTO `t_overflow_list` VALUES (2, '2021-12-08', 'JH202001150002', '', 1);
INSERT INTO `t_overflow_list` VALUES (3, '2021-12-08', 'JH202010150001', '', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_overflow_list_goods
-- ----------------------------
INSERT INTO `t_overflow_list_goods` VALUES (1, '0002', 2, 'Note8', '华为荣耀Note8', 1, 2220, 2220, '台', 1, 16);
INSERT INTO `t_overflow_list_goods` VALUES (2, '0004', 12, '2斤装', '新疆红枣', 100, 25, 2500, '袋', 2, 10);
INSERT INTO `t_overflow_list_goods` VALUES (3, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 2, 8.5, 17, '瓶', 3, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_purchase_list
-- ----------------------------
INSERT INTO `t_purchase_list` VALUES (26, 170, 170, '2021-12-08', 'JH202010150001', '', 1, 1, 1);
INSERT INTO `t_purchase_list` VALUES (27, 93.5, 93.5, '2021-12-08', 'JH202010150001', '', 1, 1, 1);
INSERT INTO `t_purchase_list` VALUES (28, 250, 250, '2021-12-13', 'JH202112130001', '最喜欢的供应商', 1, 14, 1);
INSERT INTO `t_purchase_list` VALUES (29, 187, 187, '2021-12-27', 'JH202112270001', '', 1, 14, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_purchase_list_goods
-- ----------------------------
INSERT INTO `t_purchase_list_goods` VALUES (45, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 20, 8.5, 170, '瓶', 26, 10);
INSERT INTO `t_purchase_list_goods` VALUES (46, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 11, 8.5, 93.5, '瓶', 27, 10);
INSERT INTO `t_purchase_list_goods` VALUES (47, '0028', 45, '三文鱼中段400g', '鲜有汇聚冰鲜三文鱼中段日料刺身拼盘新鲜生鱼片即食海鲜三文鱼肉 ', 10, 25, 250, '件', 28, 10);
INSERT INTO `t_purchase_list_goods` VALUES (48, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 22, 8.5, 187, '瓶', 29, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return_list
-- ----------------------------
INSERT INTO `t_return_list` VALUES (3, 93.5, 93.5, '已过期', '2021-12-08', 'TH202010150001', 1, 1, 1, NULL);
INSERT INTO `t_return_list` VALUES (4, 380, 380, '', '2021-12-08', 'TH202010150001', 1, 1, 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return_list_goods
-- ----------------------------
INSERT INTO `t_return_list_goods` VALUES (3, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 11, 8.5, 93.5, '瓶', 3, 10);
INSERT INTO `t_return_list_goods` VALUES (4, '0003', 11, '500g装', '野生东北黑木耳', 10, 38, 380, '袋', 4, 11);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '管理员 最高权限');
INSERT INTO `t_role` VALUES (2, '主管', '主管');
INSERT INTO `t_role` VALUES (4, '采购员', '采购员');
INSERT INTO `t_role` VALUES (5, '销售经理', '销售经理');
INSERT INTO `t_role` VALUES (7, '仓库管理员', '仓库管理员');
INSERT INTO `t_role` VALUES (9, '总经理', '总经理');

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
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (2, 1, 1);
INSERT INTO `t_role_menu` VALUES (3, 10, 1);
INSERT INTO `t_role_menu` VALUES (4, 20, 1);
INSERT INTO `t_role_menu` VALUES (5, 30, 1);
INSERT INTO `t_role_menu` VALUES (6, 40, 1);
INSERT INTO `t_role_menu` VALUES (7, 50, 1);
INSERT INTO `t_role_menu` VALUES (8, 60, 1);
INSERT INTO `t_role_menu` VALUES (9, 1010, 1);
INSERT INTO `t_role_menu` VALUES (10, 1020, 1);
INSERT INTO `t_role_menu` VALUES (11, 1030, 1);
INSERT INTO `t_role_menu` VALUES (12, 1040, 1);
INSERT INTO `t_role_menu` VALUES (13, 1050, 1);
INSERT INTO `t_role_menu` VALUES (14, 2010, 1);
INSERT INTO `t_role_menu` VALUES (15, 2020, 1);
INSERT INTO `t_role_menu` VALUES (16, 2030, 1);
INSERT INTO `t_role_menu` VALUES (17, 2040, 1);
INSERT INTO `t_role_menu` VALUES (18, 2050, 1);
INSERT INTO `t_role_menu` VALUES (19, 3010, 1);
INSERT INTO `t_role_menu` VALUES (20, 3020, 1);
INSERT INTO `t_role_menu` VALUES (21, 3030, 1);
INSERT INTO `t_role_menu` VALUES (22, 3040, 1);
INSERT INTO `t_role_menu` VALUES (23, 3050, 1);
INSERT INTO `t_role_menu` VALUES (24, 4010, 1);
INSERT INTO `t_role_menu` VALUES (25, 4020, 1);
INSERT INTO `t_role_menu` VALUES (26, 4030, 1);
INSERT INTO `t_role_menu` VALUES (27, 4040, 1);
INSERT INTO `t_role_menu` VALUES (28, 4050, 1);
INSERT INTO `t_role_menu` VALUES (29, 4060, 1);
INSERT INTO `t_role_menu` VALUES (30, 5010, 1);
INSERT INTO `t_role_menu` VALUES (31, 5020, 1);
INSERT INTO `t_role_menu` VALUES (32, 5030, 1);
INSERT INTO `t_role_menu` VALUES (33, 5040, 1);
INSERT INTO `t_role_menu` VALUES (34, 6010, 1);
INSERT INTO `t_role_menu` VALUES (35, 6020, 1);
INSERT INTO `t_role_menu` VALUES (43, 6030, 1);
INSERT INTO `t_role_menu` VALUES (44, 6040, 1);
INSERT INTO `t_role_menu` VALUES (48, 1, 5);
INSERT INTO `t_role_menu` VALUES (49, 30, 5);
INSERT INTO `t_role_menu` VALUES (50, 3010, 5);
INSERT INTO `t_role_menu` VALUES (55, 1, 9);
INSERT INTO `t_role_menu` VALUES (56, 30, 9);
INSERT INTO `t_role_menu` VALUES (57, 3040, 9);
INSERT INTO `t_role_menu` VALUES (58, 3050, 9);
INSERT INTO `t_role_menu` VALUES (59, 50, 9);
INSERT INTO `t_role_menu` VALUES (60, 5010, 9);
INSERT INTO `t_role_menu` VALUES (61, 5020, 9);
INSERT INTO `t_role_menu` VALUES (62, 5030, 9);
INSERT INTO `t_role_menu` VALUES (63, 5040, 9);
INSERT INTO `t_role_menu` VALUES (64, 6050, 1);
INSERT INTO `t_role_menu` VALUES (65, 1, 7);
INSERT INTO `t_role_menu` VALUES (66, 10, 7);
INSERT INTO `t_role_menu` VALUES (67, 1010, 7);
INSERT INTO `t_role_menu` VALUES (68, 1020, 7);
INSERT INTO `t_role_menu` VALUES (69, 1030, 7);
INSERT INTO `t_role_menu` VALUES (70, 1040, 7);
INSERT INTO `t_role_menu` VALUES (71, 1050, 7);
INSERT INTO `t_role_menu` VALUES (72, 20, 7);
INSERT INTO `t_role_menu` VALUES (73, 2010, 7);
INSERT INTO `t_role_menu` VALUES (74, 2020, 7);
INSERT INTO `t_role_menu` VALUES (75, 2030, 7);
INSERT INTO `t_role_menu` VALUES (76, 40, 7);
INSERT INTO `t_role_menu` VALUES (77, 4010, 7);
INSERT INTO `t_role_menu` VALUES (78, 4020, 7);
INSERT INTO `t_role_menu` VALUES (79, 1, 4);
INSERT INTO `t_role_menu` VALUES (80, 20, 4);
INSERT INTO `t_role_menu` VALUES (81, 2010, 4);
INSERT INTO `t_role_menu` VALUES (82, 60, 4);
INSERT INTO `t_role_menu` VALUES (83, 6040, 4);
INSERT INTO `t_role_menu` VALUES (84, 1, 2);
INSERT INTO `t_role_menu` VALUES (85, 10, 2);
INSERT INTO `t_role_menu` VALUES (86, 1010, 2);
INSERT INTO `t_role_menu` VALUES (87, 1020, 2);
INSERT INTO `t_role_menu` VALUES (88, 1030, 2);
INSERT INTO `t_role_menu` VALUES (89, 1040, 2);
INSERT INTO `t_role_menu` VALUES (90, 1050, 2);
INSERT INTO `t_role_menu` VALUES (91, 60, 2);
INSERT INTO `t_role_menu` VALUES (92, 6040, 2);
INSERT INTO `t_role_menu` VALUES (93, 6050, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_list
-- ----------------------------
INSERT INTO `t_sale_list` VALUES (12, 8100, 8100, '', '2021-12-08', 'XS202010150001', 1, 1, 1);
INSERT INTO `t_sale_list` VALUES (13, 425, 425, '', '2021-12-08', 'XS202010150001', 1, 1, 1);
INSERT INTO `t_sale_list` VALUES (14, 680, 680, '', '2021-12-27', 'XS202112270001', 1, 2, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_list_goods
-- ----------------------------
INSERT INTO `t_sale_list_goods` VALUES (16, '0003', 11, '500g装', '野生东北黑木耳', 200, 38, 7600, '袋', 12, 11);
INSERT INTO `t_sale_list_goods` VALUES (17, '0004', 12, '2斤装', '新疆红枣', 20, 25, 500, '袋', 12, 10);
INSERT INTO `t_sale_list_goods` VALUES (18, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 50, 8.5, 425, '瓶', 13, 10);
INSERT INTO `t_sale_list_goods` VALUES (19, '0001', 1, '红色装', '陶华碧老干妈香辣脆油辣椒', 80, 8.5, 680, '瓶', 14, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES (1, '上海市金山区张堰镇松金公路2072号6607室', '小张', '上海福桂食品有限公司', '0773-7217175', '失信供应商');
INSERT INTO `t_supplier` VALUES (2, '安徽省合肥市肥西县桃花工业园合派路', '小王', '安徽麦堡食品工业有限公司', '0773-7217275', NULL);
INSERT INTO `t_supplier` VALUES (3, '晋江市罗山后林西区41号', '小李', '福建省晋江市罗山惠康食品有限公司', '1273-1217175', '优质供应商');
INSERT INTO `t_supplier` VALUES (4, '南京市江宁区科学园竹山路565号1幢', '小丽', '南京含羞草食品有限公司', '2121-7217175', NULL);
INSERT INTO `t_supplier` VALUES (5, '南京市高淳县阳江镇新桥村下桥278号', '王大狗', '南京禾乃美工贸有限公司', '2133-7217125', NULL);
INSERT INTO `t_supplier` VALUES (6, '开平市水口镇东埠路６号', '小七', '开平广合腐乳有限公司', '3332-7217175', '2');
INSERT INTO `t_supplier` VALUES (7, '汕头市跃进路２３号利鸿基中心大厦写字楼２座', '刘钩子', '汕头市金茂食品有限公司', '0723-7232175', NULL);
INSERT INTO `t_supplier` VALUES (8, '南京市溧水区经济开发区', '七枷社', '南京喜之郎食品有限公司', '1773-7217175', NULL);
INSERT INTO `t_supplier` VALUES (9, '深圳市罗湖区翠竹北路中深石化区厂房B栋6楼', '小蔡', '深圳昌信实业有限公司', '1773-7217175', NULL);
INSERT INTO `t_supplier` VALUES (10, '南京市下关区金陵小区6村27-2-203室', '小路', '南京市下关区红鹰调味品商行', '2132-7217175', NULL);
INSERT INTO `t_supplier` VALUES (11, '荔浦县荔塔路１６－３６号', '亲亲', '桂林阜康食品工业有限公司', '2123-7217175', NULL);
INSERT INTO `t_supplier` VALUES (12, '南京鼓楼区世纪大楼123号', '小二', '南京大王科技', '0112-1426789', '123');
INSERT INTO `t_supplier` VALUES (13, '南京将军路800号', '小吴', '南京大陆食品公司', '1243-2135487', 'cc');
INSERT INTO `t_supplier` VALUES (14, '珠海', '3444343', '珠海无敌威', '343443', '434334');

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '管理员', '小何', 'admin');
INSERT INTO `t_user` VALUES (2, '123', '主管', '小赖', 'fanfan');
INSERT INTO `t_user` VALUES (3, '123', '销售经理', '卓霖大哥', 'zuoling');
INSERT INTO `t_user` VALUES (4, '123', '仓库管理员', '平少', 'pingshao');
INSERT INTO `t_user` VALUES (7, '333', '主管', '黄家二少', 'binbin');

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
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (19, 2, 2);
INSERT INTO `t_user_role` VALUES (20, 4, 2);
INSERT INTO `t_user_role` VALUES (21, 5, 2);
INSERT INTO `t_user_role` VALUES (28, 2, 3);
INSERT INTO `t_user_role` VALUES (29, 4, 3);
INSERT INTO `t_user_role` VALUES (30, 5, 3);
INSERT INTO `t_user_role` VALUES (31, 7, 3);
INSERT INTO `t_user_role` VALUES (78, 7, 4);
INSERT INTO `t_user_role` VALUES (79, 2, 7);

-- ----------------------------
-- Procedure structure for good_group_count
-- ----------------------------
DROP PROCEDURE IF EXISTS `good_group_count`;
delimiter ;;
CREATE PROCEDURE `good_group_count`()
BEGIN
		SELECT t.good_type_id,t.good_type,COUNT(t.good_name) good_num FROM (SELECT t_goodstype.id good_type_id,t_goods.`name` good_name,t_goodstype.`name` good_type FROM t_goods,t_goodstype WHERE t_goods.type_id=t_goodstype.id) as t GROUP BY t.good_type;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : wstro

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-10-13 18:10:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', '', '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', 'admin/sys/admin.html', 'user:user:manager', '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'admin/sys/role.html', 'role:role:manager', '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'admin/sys/menu.html', 'menu:menu:manager', '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '2', '新增', '', 'sys:user:save,sys:role:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '2', '修改', '', 'sys:user:update,sys:role:select', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '新增', null, 'sys:role:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '3', '修改', null, 'sys:role:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '3', '授权', null, 'sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '1', '监控管理', 'druid/index.html', 'druid:druid:manager', '1', 'fa fa-cogs', '5');
INSERT INTO `sys_menu` VALUES ('19', '1', 'Swagger管理', 'swagger-ui.html', 'swaggerui:swaggerui:manager', '1', 'fa fa-diamond', '6');
INSERT INTO `sys_menu` VALUES ('21', '22', '登录日志', 'admin/sys/sysLog.html', 'sys:log:list', '1', 'fa fa-eye', '1');
INSERT INTO `sys_menu` VALUES ('22', '0', '系统日志', '', '', '0', 'fa fa-dashboard', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('13', 'ADMIN', 'admin', '管理员角色，最高权限', '1498801511');
INSERT INTO `sys_role` VALUES ('14', 'PU', '普通会员', '非VIP', '1507690736');
INSERT INTO `sys_role` VALUES ('15', 'BY', '白银会员', '消费1万及以下', '1507704046');
INSERT INTO `sys_role` VALUES ('16', 'HJ', '黄金会员', '消费1万到10万', '1507704080');
INSERT INTO `sys_role` VALUES ('17', 'ZS', '钻石会员', '消费10万到20万', '1507704106');
INSERT INTO `sys_role` VALUES ('18', 'ZZ', '至尊会员', '消费20万以上', '1507704150');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('361', '16', '1');
INSERT INTO `sys_role_menu` VALUES ('362', '16', '2');
INSERT INTO `sys_role_menu` VALUES ('363', '16', '5');
INSERT INTO `sys_role_menu` VALUES ('364', '16', '6');
INSERT INTO `sys_role_menu` VALUES ('365', '16', '7');
INSERT INTO `sys_role_menu` VALUES ('366', '16', '3');
INSERT INTO `sys_role_menu` VALUES ('367', '16', '9');
INSERT INTO `sys_role_menu` VALUES ('368', '16', '10');
INSERT INTO `sys_role_menu` VALUES ('369', '16', '11');
INSERT INTO `sys_role_menu` VALUES ('370', '16', '4');
INSERT INTO `sys_role_menu` VALUES ('371', '16', '14');
INSERT INTO `sys_role_menu` VALUES ('372', '16', '15');
INSERT INTO `sys_role_menu` VALUES ('373', '16', '16');
INSERT INTO `sys_role_menu` VALUES ('374', '16', '19');
INSERT INTO `sys_role_menu` VALUES ('375', '15', '1');
INSERT INTO `sys_role_menu` VALUES ('376', '15', '2');
INSERT INTO `sys_role_menu` VALUES ('377', '15', '5');
INSERT INTO `sys_role_menu` VALUES ('378', '15', '6');
INSERT INTO `sys_role_menu` VALUES ('379', '15', '7');
INSERT INTO `sys_role_menu` VALUES ('380', '15', '3');
INSERT INTO `sys_role_menu` VALUES ('381', '15', '9');
INSERT INTO `sys_role_menu` VALUES ('382', '15', '10');
INSERT INTO `sys_role_menu` VALUES ('383', '15', '11');
INSERT INTO `sys_role_menu` VALUES ('384', '15', '4');
INSERT INTO `sys_role_menu` VALUES ('385', '15', '14');
INSERT INTO `sys_role_menu` VALUES ('386', '15', '15');
INSERT INTO `sys_role_menu` VALUES ('387', '15', '16');
INSERT INTO `sys_role_menu` VALUES ('388', '17', '1');
INSERT INTO `sys_role_menu` VALUES ('389', '17', '2');
INSERT INTO `sys_role_menu` VALUES ('390', '17', '5');
INSERT INTO `sys_role_menu` VALUES ('391', '17', '6');
INSERT INTO `sys_role_menu` VALUES ('392', '17', '7');
INSERT INTO `sys_role_menu` VALUES ('393', '17', '3');
INSERT INTO `sys_role_menu` VALUES ('394', '17', '9');
INSERT INTO `sys_role_menu` VALUES ('395', '17', '10');
INSERT INTO `sys_role_menu` VALUES ('396', '17', '11');
INSERT INTO `sys_role_menu` VALUES ('397', '17', '4');
INSERT INTO `sys_role_menu` VALUES ('398', '17', '14');
INSERT INTO `sys_role_menu` VALUES ('399', '17', '15');
INSERT INTO `sys_role_menu` VALUES ('400', '17', '16');
INSERT INTO `sys_role_menu` VALUES ('401', '17', '18');
INSERT INTO `sys_role_menu` VALUES ('402', '17', '19');
INSERT INTO `sys_role_menu` VALUES ('403', '18', '1');
INSERT INTO `sys_role_menu` VALUES ('404', '18', '2');
INSERT INTO `sys_role_menu` VALUES ('405', '18', '5');
INSERT INTO `sys_role_menu` VALUES ('406', '18', '6');
INSERT INTO `sys_role_menu` VALUES ('407', '18', '7');
INSERT INTO `sys_role_menu` VALUES ('408', '18', '3');
INSERT INTO `sys_role_menu` VALUES ('409', '18', '9');
INSERT INTO `sys_role_menu` VALUES ('410', '18', '10');
INSERT INTO `sys_role_menu` VALUES ('411', '18', '11');
INSERT INTO `sys_role_menu` VALUES ('412', '18', '13');
INSERT INTO `sys_role_menu` VALUES ('413', '18', '4');
INSERT INTO `sys_role_menu` VALUES ('414', '18', '14');
INSERT INTO `sys_role_menu` VALUES ('415', '18', '15');
INSERT INTO `sys_role_menu` VALUES ('416', '18', '16');
INSERT INTO `sys_role_menu` VALUES ('417', '18', '18');
INSERT INTO `sys_role_menu` VALUES ('418', '18', '19');
INSERT INTO `sys_role_menu` VALUES ('419', '14', '1');
INSERT INTO `sys_role_menu` VALUES ('420', '14', '2');
INSERT INTO `sys_role_menu` VALUES ('421', '14', '5');
INSERT INTO `sys_role_menu` VALUES ('422', '14', '3');
INSERT INTO `sys_role_menu` VALUES ('423', '14', '9');
INSERT INTO `sys_role_menu` VALUES ('424', '14', '4');
INSERT INTO `sys_role_menu` VALUES ('425', '14', '14');
INSERT INTO `sys_role_menu` VALUES ('446', '13', '1');
INSERT INTO `sys_role_menu` VALUES ('447', '13', '2');
INSERT INTO `sys_role_menu` VALUES ('448', '13', '5');
INSERT INTO `sys_role_menu` VALUES ('449', '13', '6');
INSERT INTO `sys_role_menu` VALUES ('450', '13', '7');
INSERT INTO `sys_role_menu` VALUES ('451', '13', '8');
INSERT INTO `sys_role_menu` VALUES ('452', '13', '3');
INSERT INTO `sys_role_menu` VALUES ('453', '13', '9');
INSERT INTO `sys_role_menu` VALUES ('454', '13', '10');
INSERT INTO `sys_role_menu` VALUES ('455', '13', '11');
INSERT INTO `sys_role_menu` VALUES ('456', '13', '12');
INSERT INTO `sys_role_menu` VALUES ('457', '13', '13');
INSERT INTO `sys_role_menu` VALUES ('458', '13', '4');
INSERT INTO `sys_role_menu` VALUES ('459', '13', '14');
INSERT INTO `sys_role_menu` VALUES ('460', '13', '15');
INSERT INTO `sys_role_menu` VALUES ('461', '13', '16');
INSERT INTO `sys_role_menu` VALUES ('462', '13', '17');
INSERT INTO `sys_role_menu` VALUES ('463', '13', '18');
INSERT INTO `sys_role_menu` VALUES ('464', '13', '19');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0=保密/1=男/2=女',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像缩略图地址',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '管理员', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '0', '2434387555@qq.com', '13647910242', '1507888801', '0:0:0:0:0:0:0:1', 'upload/adminAvatar/201707/1499675749475head.jpg', '1', '1498801511');
INSERT INTO `sys_user` VALUES ('7', 'lastone', '测试账号', 'd50b4c0cab140a3310e256d86fd3cd33c02f145635df4694e71df062c1679a8f', '2', 'asd@qq.com', '13456465465', '1499069279', '192.168.1.88', 'upload/adminAvatar/201707/1499675749475head.jpg', '1', '1499069190');
INSERT INTO `sys_user` VALUES ('8', 'joey', '朱迪', 'bfef4adc39f01b033fe749bb5f28f10b581fef319d34445d21a7bc63fe732fa3', '2', '2434387555@qq.com', '13647910412', '1499670576', '192.168.1.88', 'upload/adminAvatar/201707/1499675749475head.jpg', '1', '1499410874');
INSERT INTO `sys_user` VALUES ('13', 'rewrewre', 'fdfsf', '1c64ca3b36a4effbee0a8d1210a92cdd73d94d691566a5ddddee626fd267a9b3', '0', '1309459884@qq.com', '15317071350', null, null, null, '1', '1507708574');
INSERT INTO `sys_user` VALUES ('14', 'eqwe', 'sss', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0', '1309459884@qq.com', '15317071350', '1507716574', '0:0:0:0:0:0:0:1', null, '1', '1507716372');

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_time` int(11) DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_code` varchar(50) NOT NULL,
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------
INSERT INTO `sys_user_login_log` VALUES ('144', '1498643487', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('145', '1498643522', '192.168.1.13', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('146', '1498644136', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('147', '1498696770', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('148', '1498696935', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('149', '1498697948', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('150', '1498698072', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('151', '1498698196', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('152', '1498699082', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('153', '1498699432', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('154', '1498699706', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('155', '1498699646', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('156', '1498699799', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('157', '1498700536', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('158', '1498703621', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('159', '1498703553', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('160', '1498703797', '192.168.1.26', '1', 'admin', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('161', '1498703941', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('162', '1498704012', '192.168.1.26', '1', 'admin', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('163', '1498704110', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('164', '1498704322', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('165', '1498704455', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('166', '1498704533', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('167', '1498704682', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('168', '1498706068', '192.168.1.26', '1', 'admin', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('169', '1498707433', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('170', '1498707589', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('171', '1498708225', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('172', '1498714561', '192.168.1.13', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('173', '1498714892', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('174', '1498714912', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('175', '1498717536', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('176', '1498719628', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('177', '1498719718', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('178', '1498720250', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('179', '1498721509', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('180', '1498721472', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('181', '1498721707', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('182', '1498722682', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('183', '1498722697', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('184', '1498722774', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('185', '1498722797', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('186', '1498723998', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('187', '1498724109', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('188', '1498724427', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('189', '1498724612', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('190', '1498726269', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('191', '1498726979', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('192', '1498727250', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('193', '1498729214', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('194', '1498730522', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('195', '1498730704', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('196', '1498784021', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('197', '1498784093', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('198', '1498784793', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('199', '1498785172', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('200', '1498786010', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('201', '1498786323', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('202', '1498786548', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('203', '1498786548', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('204', '1498786716', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('205', '1498786626', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('206', '1498786988', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('207', '1498787137', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('208', '1498787414', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('209', '1498787655', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('210', '1498787901', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('211', '1498788939', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('212', '1498789243', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('213', '1498792867', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('214', '1498793558', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('215', '1498793866', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('216', '1498794052', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('217', '1498794300', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('218', '1498801042', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('219', '1498800942', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('220', '1498802396', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('221', '1498802454', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('222', '1498803515', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('223', '1498804811', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('224', '1498805228', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('225', '1498805241', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('226', '1498805469', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('227', '1498805899', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('228', '1498806813', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('229', '1498806800', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('230', '1498806995', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('231', '1498807290', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('232', '1498807203', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('233', '1498807725', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('234', '1498808125', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('235', '1498809962', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('236', '1498811173', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('237', '1498811214', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('238', '1498811582', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('239', '1498811989', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('240', '1498812194', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('241', '1498812256', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('242', '1498812373', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('243', '1498812703', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('244', '1498812751', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('245', '1498814101', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('246', '1498814281', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('247', '1498814294', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('248', '1498815015', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('249', '1499042315', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('250', '1499043527', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('251', '1499049141', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('252', '1499051653', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('253', '1499051758', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('254', '1499052573', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('255', '1499052849', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('256', '1499053115', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('257', '1499060576', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('258', '1499062246', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('259', '1499066402', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('260', '1499066583', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('261', '1499066779', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('262', '1499067338', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('263', '1499069038', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('265', '1499069518', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('266', '1499069582', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('267', '1499070803', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('268', '1499070825', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('269', '1499071525', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('270', '1499131270', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('271', '1499134326', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('272', '1499134791', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('273', '1499153429', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('274', '1499155324', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('275', '1499155573', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('276', '1499157566', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('277', '1499157784', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('278', '1499224438', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('279', '1499224558', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('280', '1499237804', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('281', '1499238665', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('282', '1499240768', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('283', '1499240844', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('284', '1499240927', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('285', '1499241009', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('286', '1499241689', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('287', '1499241852', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('288', '1499241940', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('289', '1499242070', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('290', '1499242204', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('291', '1499242576', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('292', '1499242686', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('293', '1499242786', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('294', '1499243019', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('295', '1499243826', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('296', '1499244330', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('297', '1499244413', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('298', '1499244893', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('299', '1499245106', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('300', '1499304924', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('301', '1499305120', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('302', '1499305230', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('303', '1499305433', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('304', '1499305555', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('305', '1499305754', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('306', '1499305988', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('307', '1499306086', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('308', '1499306206', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('309', '1499306272', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('310', '1499306446', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('311', '1499323795', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('312', '1499324004', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('313', '1499325387', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('314', '1499325470', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('315', '1499325657', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('316', '1499325738', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('317', '1499325800', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('318', '1499326940', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('319', '1499326972', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('320', '1499327095', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('321', '1499327157', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('322', '1499327897', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('323', '1499328094', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('324', '1499328214', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('325', '1499333844', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('326', '1499389330', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('327', '1499392633', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('328', '1499394310', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('329', '1499394750', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('330', '1499397025', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('331', '1499397556', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('332', '1499399214', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('333', '1499407108', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('334', '1499407181', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('335', '1499410304', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('336', '1499410387', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('337', '1499410642', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('340', '1499419066', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('341', '1499649774', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('342', '1499649874', '192.168.1.11', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('343', '1499650352', '192.168.1.11', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('344', '1499651147', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('345', '1499651546', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('346', '1499651696', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('347', '1499652951', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('348', '1499653330', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('349', '1499656282', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('350', '1499657144', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('351', '1499665646', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('352', '1499665846', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('353', '1499666672', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('354', '1499667521', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('355', '1499668376', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('356', '1499668738', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('357', '1499668939', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('358', '1499669915', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('360', '1499675439', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('361', '1499675579', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('362', '1499675677', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('363', '1499675734', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('364', '1499676954', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('365', '1499678029', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('366', '1499733831', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('367', '1499736644', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('368', '1499740053', '192.168.1.12', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('369', '1499739950', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('370', '1499751595', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('371', '1499754490', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('372', '1499754532', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('373', '1499754626', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('374', '1499754671', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('375', '1499754889', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('376', '1499755582', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('377', '1499823697', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('378', '1499824314', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('379', '1499830448', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('380', '1499830781', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('381', '1499851241', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('382', '1499911630', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('383', '1499911942', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('384', '1499912210', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('385', '1499912417', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('386', '1499912551', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('387', '1499913005', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('388', '1499914224', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('389', '1499914472', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('390', '1499915663', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('391', '1499918084', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('392', '1499925822', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('393', '1499936087', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('394', '1499938281', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('395', '1499938450', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('396', '1500012618', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('397', '1500018058', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('398', '1500018358', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('399', '1500018527', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('400', '1500018635', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('401', '1500018856', '192.168.1.88', '1', 'admin', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('402', '1506669261', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('403', '1506743621', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('404', '1506758393', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('405', '1506758455', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('406', '1506758592', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('407', '1506760148', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('408', '1506761782', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'IE11');
INSERT INTO `sys_user_login_log` VALUES ('409', '1507513465', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('410', '1507521083', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('411', '1507527889', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('412', '1507530050', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('413', '1507530475', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('414', '1507531769', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('415', '1507534464', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('416', '1507537220', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('417', '1507598486', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('418', '1507601860', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('419', '1507613788', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('420', '1507615437', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('421', '1507624054', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('422', '1507626727', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('423', '1507628250', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('424', '1507629700', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('425', '1507688982', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('426', '1507690665', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('427', '1507702100', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('428', '1507707470', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('429', '1507707880', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('430', '1507708087', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('431', '1507708949', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('432', '1507714380', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('434', '1507716528', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('436', '1507774914', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('437', '1507777113', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('438', '1507777747', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('439', '1507788086', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('440', '1507793178', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('441', '1507793374', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('442', '1507863802', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('443', '1507885247', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('444', '1507886263', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('445', '1507887446', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('446', '1507888801', '0:0:0:0:0:0:0:1', '1', 'admin', 'WINDOWS_7', 'CHROME');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('62', '1', '13');
INSERT INTO `sys_user_role` VALUES ('72', '8', '13');
INSERT INTO `sys_user_role` VALUES ('73', '7', '13');
INSERT INTO `sys_user_role` VALUES ('79', '11', '18');
INSERT INTO `sys_user_role` VALUES ('80', '12', '17');
INSERT INTO `sys_user_role` VALUES ('84', '13', '15');
INSERT INTO `sys_user_role` VALUES ('86', '14', '18');

-- ----------------------------
-- Table structure for layim_user
-- ----------------------------
drop table if exists layim_user;
create table layim_user
(
   user_id              bigint(20) not null comment '用户id',
   sign                 varchar(100) comment '用户签名',
   status               smallint(6) comment '在线状态',
   delete_flag          smallint(6) comment '是否删除',
   create_time         int(11) DEFAULT NULL comment '创建时间',
   create_user_id       bigint(20) comment '创建人id',
   update_time          int(11) DEFAULT NULL comment '修改时间',
   update_user_id       bigint(20) comment '修改人id',
   primary key (user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_user
-- ----------------------------
INSERT INTO `layim_user`(user_id,sign,status,delete_flag,create_time,create_user_id) VALUES (1, "今天天气好", 0,0,'1507704046',1);

-- ----------------------------
-- Table structure for layim_user_group
-- ----------------------------
drop table if exists layim_user_group;
create table layim_user_group
(
   PKID                 bigint(20) not null comment '主键',
   user_id              bigint(20) comment '用户id',
   group_id             bigint(20) comment '群组id',
   delete_flag          smallint(6) comment '是否删除',
   primary key (PKID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_user_group
-- ----------------------------
INSERT INTO `layim_user_group` VALUES (1, 1, 1,0);
INSERT INTO `layim_user_group` VALUES (2, 1, 2,0);

-- ----------------------------
-- Table structure for layim_group
-- ----------------------------
drop table if exists layim_group;
create table layim_group
(
   group_id             bigint(20) not null comment '组别id',
   group_name           varchar(50) comment '组别名称',
   avatar                  varchar(255) DEFAULT NULL COMMENT '头像缩略图地址',
   delete_flag          smallint(6) comment '是否删除',
   create_time          int(11) DEFAULT NULL comment '创建时间',
   create_user_id       bigint(20) comment '创建人id',
   update_time          int(11) DEFAULT NULL comment '修改时间',
   update_user_id       bigint(20) comment '修改人id',
   primary key (group_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_group
-- ----------------------------
INSERT INTO `layim_group`(group_id,group_name,avatar,delete_flag,create_time,create_user_id) VALUES (1, "吃喝玩乐",'upload/adminAvatar/201707/1499675749475head.jpg', 0,'1507704046',1);
INSERT INTO `layim_group`(group_id,group_name,avatar,delete_flag,create_time,create_user_id) VALUES (2, "单身俱乐部", 'upload/adminAvatar/201707/1499675749475head.jpg',0,'1507704046',1);

-- ----------------------------
-- Table structure for layim_user_friend
-- ----------------------------
drop table if exists layim_user_friend;
create table layim_user_friend
(
   PKID                 bigint(20) not null comment '主键',
   user_id              bigint(20) comment '用户id',
   friend_id            bigint(20) comment '好友id',
   friend_group_id      bigint(20) comment '好友所在组别',
   delete_flag          smallint(6) comment '是否删除',
   primary key (PKID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_user_friend
-- ----------------------------
INSERT INTO `layim_user_friend` VALUES (1, 1, 7,1,0);
INSERT INTO `layim_user_friend` VALUES (2, 1, 8,2,0);

-- ----------------------------
-- Table structure for layim_friend_group
-- ----------------------------
drop table if exists layim_friend_group;
create table layim_friend_group
(
   group_id             bigint(20) not null comment '组别id',
   group_name           varchar(50) comment '组别名称',
   delete_flag          smallint(6) comment '是否删除',
   create_time          int(11) DEFAULT NULL comment '创建时间',
   create_user_id       bigint(20) comment '创建人id',
   update_time          int(11) DEFAULT NULL comment '修改时间',
   update_user_id       bigint(20) comment '修改人id',
   primary key (group_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_friend_group
-- ----------------------------
INSERT INTO `layim_friend_group`(group_id,group_name,delete_flag,create_time,create_user_id) VALUES (1, '高中', 0,'1507704046',1);
INSERT INTO `layim_friend_group`(group_id,group_name,delete_flag,create_time,create_user_id) VALUES (2, '大学', 0,'1507704046',1);

-- ----------------------------
-- Table structure for layim_message_his
-- ----------------------------
DROP TABLE IF EXISTS `layim_message_his`;
CREATE TABLE `layim_message_his` (
  `id` varchar(36) NOT NULL,
  `msg_type` varchar(50) DEFAULT NULL COMMENT '消息类型',
  `msg` varchar(1024) DEFAULT NULL COMMENT '消息数据',
  `from_user` varchar(50) DEFAULT NULL COMMENT '消息发送者',
  `from_name` varchar(100) DEFAULT NULL COMMENT '发送者的真实姓名',
  `to_user` varchar(50) DEFAULT NULL COMMENT '消息接收者',
  `to_name` varchar(100) DEFAULT NULL COMMENT '接收者的真实姓名',
  `accountid` varchar(36) DEFAULT NULL,
  `create_date`  int(11) DEFAULT NULL DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layim_message_his
-- ----------------------------
INSERT INTO `layim_message_his` VALUES ('053E905ED5A241088B686EC588F98548', 'friend', 'eee', '402880e74d75c4dd014d75d44af30005', 'demo', '8a8ab0b246dc81120146dc8181950052', '管理员', null, null, null);
INSERT INTO `layim_message_his` VALUES ('115C3CC613EF4E7BA9852F9E2E6CE35E', 'friend', '0000', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('18D158EC78FC4C5899DDA94F4023B35C', 'friend', '000', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('20254AF789F1486D885DB9D4EF66798C', 'friend', '111', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('2236E68595FE47B1BD27BEE77FD21ED8', 'friend', '你好', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('2C2C06A5D2C24CF29A5955C6F5530F64', 'friend', 'dddd', '402880e74d75c4dd014d75d44af30005', 'demo', '8a8ab0b246dc81120146dc8181950052', '管理员', null, null, null);
INSERT INTO `layim_message_his` VALUES ('91D83DA4C9064F0DABBAC59C7D55C961', 'friend', 'face[馋嘴] ', '402880e74d75c4dd014d75d44af30005', 'demo', '8a8ab0b246dc81120146dc8181950052', '管理员', null, null, null);
INSERT INTO `layim_message_his` VALUES ('9B5D86C36B324A4ABF240070521BB9E8', 'friend', 'face[晕] ', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('B7BD27DF21C9473EA8A09BF6E094FD38', 'friend', '1111', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('C8C744D046FA490D8902B9BAAC922327', 'friend', '00000', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('CE3EB7D8CD8D40FBB8CA083DEB526C16', 'friend', '99face[悲伤] ', '8a8ab0b246dc81120146dc8181950052', '管理员', '8a8ab0b246dc81120146dc81819d0053', '张代浩', null, null, null);
INSERT INTO `layim_message_his` VALUES ('CF572347C607485BAB4F5793E9ADDE75', 'friend', 'ddd', '402880e74d75c4dd014d75d44af30005', 'demo', '8a8ab0b246dc81120146dc8181950052', '管理员', null, null, null);
INSERT INTO `layim_message_his` VALUES ('D4C5F22A6C0E434BB266E7C13BB7BAE2', 'friend', '000000000000000000000', '402880e74d75c4dd014d75d44af30005', 'demo', '8a8ab0b246dc81120146dc8181950052', '管理员', null, null, null);

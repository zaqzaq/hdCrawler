/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : homedo

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2015-12-02 15:00:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` varchar(32) NOT NULL DEFAULT '',
  `ord` smallint(6) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('10000', '1', '信息设施', '10000', null);
INSERT INTO `category` VALUES ('10001', '2', '公共安全', '10001', null);
INSERT INTO `category` VALUES ('10002', '3', '楼宇自控', '10002', null);
INSERT INTO `category` VALUES ('10003', '4', '机房工程', '10003', null);
INSERT INTO `category` VALUES ('10004', '5', '音视频', '10004', null);
INSERT INTO `category` VALUES ('10005', '6', '智能家居', '10005', null);
INSERT INTO `category` VALUES ('10006', '7', '工程线缆', '10006', null);
INSERT INTO `category` VALUES ('10007', '8', '电脑/外设', '10007', null);
INSERT INTO `category` VALUES ('10008', '9', '辅材/工具', '10008', null);
INSERT INTO `category` VALUES ('10009', '1', '综合布线', '10000|10009', '10000');
INSERT INTO `category` VALUES ('10010', '2', '程控交换', '10000|10010', '10000');
INSERT INTO `category` VALUES ('10011', '3', '计算机网络', '10000|10011', '10000');
INSERT INTO `category` VALUES ('10012', '4', '无线网络', '10000|10012', '10000');
INSERT INTO `category` VALUES ('10013', '5', '有线电视及卫星电视', '10000|10013', '10000');
INSERT INTO `category` VALUES ('10014', '6', '无线对讲通信覆盖', '10000|10014', '10000');
INSERT INTO `category` VALUES ('10015', '7', '时钟系统', '10000|10015', '10000');
INSERT INTO `category` VALUES ('10016', '8', '信息化应用', '10000|10016', '10000');
INSERT INTO `category` VALUES ('10017', '3', '模块', '10000|10009|10017', '10009');
INSERT INTO `category` VALUES ('10018', '4', '面板', '10000|10009|10018', '10009');
INSERT INTO `category` VALUES ('10019', '5', '配线架', '10000|10009|10019', '10009');
INSERT INTO `category` VALUES ('10020', '1', '网络数据电缆', '10000|10009|10020', '10009');
INSERT INTO `category` VALUES ('10021', '6', '跳线', '10000|10009|10021', '10009');
INSERT INTO `category` VALUES ('10022', '1', '电话交换主机', '10000|10010|10022', '10010');
INSERT INTO `category` VALUES ('10023', '2', '电话机及配件（耳麦等）', '10000|10010|10023', '10010');
INSERT INTO `category` VALUES ('10024', '3', '板卡', '10000|10010|10024', '10010');
INSERT INTO `category` VALUES ('10025', '4', '配件（电源箱，电源等）', '10000|10010|10025', '10010');
INSERT INTO `category` VALUES ('10026', '5', '软件及许可', '10000|10010|10026', '10010');
INSERT INTO `category` VALUES ('10027', '6', 'PC话务台', '10000|10010|10027', '10010');
INSERT INTO `category` VALUES ('10028', '1', '交换机', '10000|10011|10028', '10011');
INSERT INTO `category` VALUES ('10029', '2', '路由器', '10000|10011|10029', '10011');
INSERT INTO `category` VALUES ('10030', '3', '防火墙', '10000|10011|10030', '10011');
INSERT INTO `category` VALUES ('10031', '4', '硬盘', '10000|10011|10031', '10011');
INSERT INTO `category` VALUES ('10032', '5', '服务器', '10000|10011|10032', '10011');
INSERT INTO `category` VALUES ('10033', '1', '无线路由器', '10000|10012|10033', '10012');
INSERT INTO `category` VALUES ('10034', '2', '无线控制器', '10000|10012|10034', '10012');
INSERT INTO `category` VALUES ('10035', '3', '无线接入设备（无线AP）', '10000|10012|10035', '10012');
INSERT INTO `category` VALUES ('10036', '1', '编码器', '10000|10013|10036', '10013');
INSERT INTO `category` VALUES ('10037', '2', '调制器', '10000|10013|10037', '10013');
INSERT INTO `category` VALUES ('10038', '3', '功分器', '10000|10013|10038', '10013');
INSERT INTO `category` VALUES ('10039', '4', '放大器', '10000|10013|10039', '10013');
INSERT INTO `category` VALUES ('10040', '5', '卫星天线', '10000|10013|10040', '10013');
INSERT INTO `category` VALUES ('10041', '6', '用户终端', '10000|10013|10041', '10013');
INSERT INTO `category` VALUES ('10042', '7', '解调器', '10000|10013|10042', '10013');
INSERT INTO `category` VALUES ('10043', '8', '混合器', '10000|10013|10043', '10013');
INSERT INTO `category` VALUES ('10044', '9', '分配器', '10000|10013|10044', '10013');
INSERT INTO `category` VALUES ('10045', '10', '分支器', '10000|10013|10045', '10013');
INSERT INTO `category` VALUES ('10046', '11', '机顶盒', '10000|10013|10046', '10013');
INSERT INTO `category` VALUES ('10047', '12', '供电器', '10000|10013|10047', '10013');
INSERT INTO `category` VALUES ('10048', '13', '接头', '10000|10013|10048', '10013');
INSERT INTO `category` VALUES ('10049', '14', '75Ω负载', '10000|10013|10049', '10013');
INSERT INTO `category` VALUES ('10050', '1', '信道控制器', '10000|10014|10050', '10014');
INSERT INTO `category` VALUES ('10051', '2', '合路器', '10000|10014|10051', '10014');
INSERT INTO `category` VALUES ('10052', '3', '分路器', '10000|10014|10052', '10014');
INSERT INTO `category` VALUES ('10053', '4', '双工器', '10000|10014|10053', '10014');
INSERT INTO `category` VALUES ('10054', '5', '干线放大器', '10000|10014|10054', '10014');
INSERT INTO `category` VALUES ('10055', '6', '功分器', '10000|10014|10055', '10014');
INSERT INTO `category` VALUES ('10056', '7', '全向天线', '10000|10014|10056', '10014');
INSERT INTO `category` VALUES ('10057', '8', '对讲机', '10000|10014|10057', '10014');
INSERT INTO `category` VALUES ('10058', '9', '同轴射频电缆', '10000|10014|10058', '10014');
INSERT INTO `category` VALUES ('10059', '10', '车载台', '10000|10014|10059', '10014');
INSERT INTO `category` VALUES ('10060', '11', '中转台', '10000|10014|10060', '10014');
INSERT INTO `category` VALUES ('10061', '12', '跳线', '10000|10014|10061', '10014');
INSERT INTO `category` VALUES ('10062', '13', '充电器', '10000|10014|10062', '10014');
INSERT INTO `category` VALUES ('10063', '14', '电池', '10000|10014|10063', '10014');
INSERT INTO `category` VALUES ('10064', '1', '信号接收器', '10000|10015|10064', '10015');
INSERT INTO `category` VALUES ('10065', '2', '主设备', '10000|10015|10065', '10015');
INSERT INTO `category` VALUES ('10066', '3', '接口模块', '10000|10015|10066', '10015');
INSERT INTO `category` VALUES ('10067', '4', '控制管理设备', '10000|10015|10067', '10015');
INSERT INTO `category` VALUES ('10068', '5', '终端显示', '10000|10015|10068', '10015');
INSERT INTO `category` VALUES ('10069', '6', '其他', '10000|10015|10069', '10015');
INSERT INTO `category` VALUES ('10070', '1', '酒店管理系统', '10000|10016|10070', '10016');
INSERT INTO `category` VALUES ('10071', '2', '排队叫号系统', '10000|10016|10071', '10016');
INSERT INTO `category` VALUES ('10072', '3', '访客系统', '10000|10016|10072', '10016');
INSERT INTO `category` VALUES ('10073', '4', '探视系统', '10000|10016|10073', '10016');
INSERT INTO `category` VALUES ('10074', '5', '信息系统集成软件', '10000|10016|10074', '10016');
INSERT INTO `category` VALUES ('10075', '6', '客流分析系统', '10000|10016|10075', '10016');
INSERT INTO `category` VALUES ('10076', '7', '客控系统', '10000|10016|10076', '10016');
INSERT INTO `category` VALUES ('10077', '8', '升降旗控制系统', '10000|10016|10077', '10016');
INSERT INTO `category` VALUES ('10078', '9', '信息发布系统', '10000|10016|10078', '10016');
INSERT INTO `category` VALUES ('10079', '1', '视频监控', '10001|10079', '10001');
INSERT INTO `category` VALUES ('10080', '2', '防盗报警', '10001|10080', '10001');
INSERT INTO `category` VALUES ('10081', '3', '电子巡更', '10001|10081', '10001');
INSERT INTO `category` VALUES ('10082', '4', '门禁', '10001|10082', '10001');
INSERT INTO `category` VALUES ('10083', '5', '车辆管理', '10001|10083', '10001');
INSERT INTO `category` VALUES ('10084', '6', '楼宇对讲', '10001|10084', '10001');
INSERT INTO `category` VALUES ('10085', '1', '传输设备', '10001|10079|10085', '10079');
INSERT INTO `category` VALUES ('10086', '2', '安防专用交换设备', '10001|10079|10086', '10079');
INSERT INTO `category` VALUES ('10087', '3', '监控摄像机', '10001|10079|10087', '10079');
INSERT INTO `category` VALUES ('10088', '4', '球形摄像机', '10001|10079|10088', '10079');
INSERT INTO `category` VALUES ('10089', '5', '安防用工具', '10001|10079|10089', '10079');
INSERT INTO `category` VALUES ('10090', '6', '特种领域专用摄像机', '10001|10079|10090', '10079');
INSERT INTO `category` VALUES ('10091', '7', '显示设备', '10001|10079|10091', '10079');
INSERT INTO `category` VALUES ('10092', '8', '数字标牌', '10001|10079|10092', '10079');
INSERT INTO `category` VALUES ('10093', '9', '视频编解码器', '10001|10079|10093', '10079');
INSERT INTO `category` VALUES ('10094', '10', '硬盘录像机', '10001|10079|10094', '10079');
INSERT INTO `category` VALUES ('10095', '11', '控制设备', '10001|10079|10095', '10079');
INSERT INTO `category` VALUES ('10096', '12', '镜头', '10001|10079|10096', '10079');
INSERT INTO `category` VALUES ('10097', '13', '系统集成平台', '10001|10079|10097', '10079');
INSERT INTO `category` VALUES ('10098', '14', '云台', '10001|10079|10098', '10079');
INSERT INTO `category` VALUES ('10099', '15', '电源', '10001|10079|10099', '10079');
INSERT INTO `category` VALUES ('10100', '16', '监控服务器/PC存储设备', '10001|10079|10100', '10079');
INSERT INTO `category` VALUES ('10101', '17', '防爆监控设备', '10001|10079|10101', '10079');
INSERT INTO `category` VALUES ('10102', '18', '护罩', '10001|10079|10102', '10079');
INSERT INTO `category` VALUES ('10103', '19', '支架', '10001|10079|10103', '10079');
INSERT INTO `category` VALUES ('10104', '20', '补光灯', '10001|10079|10104', '10079');
INSERT INTO `category` VALUES ('10105', '21', '监控平台软件', '10001|10079|10105', '10079');
INSERT INTO `category` VALUES ('10106', '22', '简便套装', '10001|10079|10106', '10079');
INSERT INTO `category` VALUES ('10107', '23', '监控系统配件', '10001|10079|10107', '10079');
INSERT INTO `category` VALUES ('10108', '24', '安防矩阵', '10001|10079|10108', '10079');
INSERT INTO `category` VALUES ('10109', '25', '道路监控设备', '10001|10079|10109', '10079');
INSERT INTO `category` VALUES ('10110', '26', '楼显', '10001|10079|10110', '10079');
INSERT INTO `category` VALUES ('10111', '27', '智能分析系统', '10001|10079|10111', '10079');
INSERT INTO `category` VALUES ('10112', '28', '安防存储', '10001|10079|10112', '10079');
INSERT INTO `category` VALUES ('10113', '1', '探测器', '10001|10080|10113', '10080');
INSERT INTO `category` VALUES ('10114', '2', '报警主机', '10001|10080|10114', '10080');
INSERT INTO `category` VALUES ('10115', '3', '电子围栏', '10001|10080|10115', '10080');
INSERT INTO `category` VALUES ('10116', '4', '门磁', '10001|10080|10116', '10080');
INSERT INTO `category` VALUES ('10117', '5', '紧急按钮', '10001|10080|10117', '10080');
INSERT INTO `category` VALUES ('10118', '6', '声光报警', '10001|10080|10118', '10080');
INSERT INTO `category` VALUES ('10119', '7', '报警键盘', '10001|10080|10119', '10080');
INSERT INTO `category` VALUES ('10120', '8', '总线驱动器', '10001|10080|10120', '10080');
INSERT INTO `category` VALUES ('10121', '9', '地址模块', '10001|10080|10121', '10080');
INSERT INTO `category` VALUES ('10122', '10', '报警周边器材', '10001|10080|10122', '10080');
INSERT INTO `category` VALUES ('10123', '11', '报警用打印机', '10001|10080|10123', '10080');
INSERT INTO `category` VALUES ('10124', '12', '串口通讯模块', '10001|10080|10124', '10080');
INSERT INTO `category` VALUES ('10125', '13', '电子地图', '10001|10080|10125', '10080');
INSERT INTO `category` VALUES ('10126', '14', '联动继电器板', '10001|10080|10126', '10080');
INSERT INTO `category` VALUES ('10127', '15', '报警软件', '10001|10080|10127', '10080');
INSERT INTO `category` VALUES ('10128', '16', '红外对射', '10001|10080|10128', '10080');
INSERT INTO `category` VALUES ('10129', '17', '周界报警', '10001|10080|10129', '10080');
INSERT INTO `category` VALUES ('10130', '18', '脚踢开关', '10001|10080|10130', '10080');
INSERT INTO `category` VALUES ('10131', '19', 'IP通讯模块', '10001|10080|10131', '10080');
INSERT INTO `category` VALUES ('10132', '20', '配套支架', '10001|10080|10132', '10080');
INSERT INTO `category` VALUES ('10133', '1', '巡更棒', '10001|10081|10133', '10081');
INSERT INTO `category` VALUES ('10134', '2', '通讯座', '10001|10081|10134', '10081');
INSERT INTO `category` VALUES ('10135', '3', '巡更软件', '10001|10081|10135', '10081');
INSERT INTO `category` VALUES ('10136', '4', '巡更钮', '10001|10081|10136', '10081');
INSERT INTO `category` VALUES ('10137', '5', '标识牌', '10001|10081|10137', '10081');
INSERT INTO `category` VALUES ('10138', '1', '门禁控制器', '10001|10082|10138', '10082');
INSERT INTO `category` VALUES ('10139', '2', '读卡器', '10001|10082|10139', '10082');
INSERT INTO `category` VALUES ('10140', '3', '电锁', '10001|10082|10140', '10082');
INSERT INTO `category` VALUES ('10141', '4', '生物识别设备', '10001|10082|10141', '10082');
INSERT INTO `category` VALUES ('10142', '5', '门禁发卡器/采集器', '10001|10082|10142', '10082');
INSERT INTO `category` VALUES ('10143', '6', '通信转换器', '10001|10082|10143', '10082');
INSERT INTO `category` VALUES ('10144', '7', '门禁周边器材', '10001|10082|10144', '10082');
INSERT INTO `category` VALUES ('10145', '8', '消费系统', '10001|10082|10145', '10082');
INSERT INTO `category` VALUES ('10146', '9', '电锁支架门夹', '10001|10082|10146', '10082');
INSERT INTO `category` VALUES ('10147', '10', '门禁软件', '10001|10082|10147', '10082');
INSERT INTO `category` VALUES ('10148', '11', '考勤系统', '10001|10082|10148', '10082');
INSERT INTO `category` VALUES ('10149', '12', '梯控系统', '10001|10082|10149', '10082');
INSERT INTO `category` VALUES ('10150', '13', '一卡通应用', '10001|10082|10150', '10082');
INSERT INTO `category` VALUES ('10151', '14', '感应卡片', '10001|10082|10151', '10082');
INSERT INTO `category` VALUES ('10152', '15', '通道闸机', '10001|10082|10152', '10082');
INSERT INTO `category` VALUES ('10153', '1', '入口控制机', '10001|10083|10153', '10083');
INSERT INTO `category` VALUES ('10154', '2', '出口控制机', '10001|10083|10154', '10083');
INSERT INTO `category` VALUES ('10155', '3', '出/入口控制箱', '10001|10083|10155', '10083');
INSERT INTO `category` VALUES ('10156', '4', '停车系统发卡器', '10001|10083|10156', '10083');
INSERT INTO `category` VALUES ('10157', '5', '远/近距离识别设备', '10001|10083|10157', '10083');
INSERT INTO `category` VALUES ('10158', '6', '吞/吐卡机', '10001|10083|10158', '10083');
INSERT INTO `category` VALUES ('10159', '7', '语音对讲设备', '10001|10083|10159', '10083');
INSERT INTO `category` VALUES ('10160', '8', '路障机', '10001|10083|10160', '10083');
INSERT INTO `category` VALUES ('10161', '9', '挡车器', '10001|10083|10161', '10083');
INSERT INTO `category` VALUES ('10162', '10', '升降柱', '10001|10083|10162', '10083');
INSERT INTO `category` VALUES ('10163', '11', '计费/缴费', '10001|10083|10163', '10083');
INSERT INTO `category` VALUES ('10164', '12', '出/入口控制器', '10001|10083|10164', '10083');
INSERT INTO `category` VALUES ('10165', '13', '反向查询系统', '10001|10083|10165', '10083');
INSERT INTO `category` VALUES ('10166', '14', '视频捕捉卡', '10001|10083|10166', '10083');
INSERT INTO `category` VALUES ('10167', '15', '车牌识别系统', '10001|10083|10167', '10083');
INSERT INTO `category` VALUES ('10168', '16', '地感线圈', '10001|10083|10168', '10083');
INSERT INTO `category` VALUES ('10169', '17', '车辆检测器', '10001|10083|10169', '10083');
INSERT INTO `category` VALUES ('10170', '18', '停车场引导屏', '10001|10083|10170', '10083');
INSERT INTO `category` VALUES ('10171', '19', '停车场管理软件', '10001|10083|10171', '10083');
INSERT INTO `category` VALUES ('10172', '20', '车牌识别软件管理器', '10001|10083|10172', '10083');
INSERT INTO `category` VALUES ('10173', '21', '自助缴费一体机', '10001|10083|10173', '10083');
INSERT INTO `category` VALUES ('10174', '22', '车位引导', '10001|10083|10174', '10083');
INSERT INTO `category` VALUES ('10175', '1', '门口机', '10001|10084|10175', '10084');
INSERT INTO `category` VALUES ('10176', '2', '对讲室内机', '10001|10084|10176', '10084');
INSERT INTO `category` VALUES ('10177', '3', '管理中心机', '10001|10084|10177', '10084');
INSERT INTO `category` VALUES ('10178', '4', '楼宇对讲周边器材', '10001|10084|10178', '10084');
INSERT INTO `category` VALUES ('10179', '1', '楼宇自控', '10002|10179', '10002');
INSERT INTO `category` VALUES ('10180', '2', '能源管理', '10002|10180', '10002');
INSERT INTO `category` VALUES ('10181', '3', '智能照明', '10002|10181', '10002');
INSERT INTO `category` VALUES ('10182', '1', '机房装修系统', '10003|10182', '10003');
INSERT INTO `category` VALUES ('10183', '2', '供配电系统', '10003|10183', '10003');
INSERT INTO `category` VALUES ('10184', '3', 'UPS系统', '10003|10184', '10003');
INSERT INTO `category` VALUES ('10185', '4', '精密空调系统', '10003|10185', '10003');
INSERT INTO `category` VALUES ('10186', '5', '机柜系统', '10003|10186', '10003');
INSERT INTO `category` VALUES ('10187', '6', '环境监控系统', '10003|10187', '10003');
INSERT INTO `category` VALUES ('10188', '7', '消防系统', '10003|10188', '10003');
INSERT INTO `category` VALUES ('10189', '1', '视频显示', '10004|10189', '10004');
INSERT INTO `category` VALUES ('10190', '2', '公共广播及背景音乐', '10004|10190', '10004');
INSERT INTO `category` VALUES ('10191', '3', '会议系统', '10004|10191', '10004');
INSERT INTO `category` VALUES ('10192', '4', '舞美', '10004|10192', '10004');
INSERT INTO `category` VALUES ('10193', '5', '多媒体教学', '10004|10193', '10004');
INSERT INTO `category` VALUES ('10195', '1', '家居娱乐', '10005|10195', '10005');
INSERT INTO `category` VALUES ('10196', '2', '家居安全', '10005|10196', '10005');
INSERT INTO `category` VALUES ('10197', '3', '家电控制', '10005|10197', '10005');
INSERT INTO `category` VALUES ('10198', '4', '家居辅助', '10005|10198', '10005');
INSERT INTO `category` VALUES ('10205', '1', '电脑整机', '10007|10205', '10007');
INSERT INTO `category` VALUES ('10206', '2', '电脑外设', '10007|10206', '10007');
INSERT INTO `category` VALUES ('10207', '3', '存储设备', '10007|10207', '10007');
INSERT INTO `category` VALUES ('10208', '4', '办公设备', '10007|10208', '10007');
INSERT INTO `category` VALUES ('10209', '2', '桥架管材', '10008|10209', '10008');
INSERT INTO `category` VALUES ('10210', '1', '施工工具', '10008|10210', '10008');
INSERT INTO `category` VALUES ('10211', '3', '电箱立杆', '10008|10211', '10008');
INSERT INTO `category` VALUES ('10212', '4', '工程耗材', '10008|10212', '10008');
INSERT INTO `category` VALUES ('10214', '1', '楼控系统软件', '10002|10179|10214', '10179');
INSERT INTO `category` VALUES ('10215', '2', '楼控控制器', '10002|10179|10215', '10179');
INSERT INTO `category` VALUES ('10216', '3', '楼控传感器', '10002|10179|10216', '10179');
INSERT INTO `category` VALUES ('10217', '4', '水阀及其执行器', '10002|10179|10217', '10179');
INSERT INTO `category` VALUES ('10218', '5', '风阀执行器', '10002|10179|10218', '10179');
INSERT INTO `category` VALUES ('10219', '6', '楼控附件', '10002|10179|10219', '10179');
INSERT INTO `category` VALUES ('10220', '1', '能源管理系统平台', '10002|10180|10220', '10180');
INSERT INTO `category` VALUES ('10221', '2', '能源管理系统配套设备', '10002|10180|10221', '10180');
INSERT INTO `category` VALUES ('10223', '1', '灯具/整灯', '10002|10181|10223', '10181');
INSERT INTO `category` VALUES ('10224', '2', '景观亮化控制', '10002|10181|10224', '10181');
INSERT INTO `category` VALUES ('10225', '3', '新能源照明', '10002|10181|10225', '10181');
INSERT INTO `category` VALUES ('10226', '4', '光源', '10002|10181|10226', '10181');
INSERT INTO `category` VALUES ('10227', '5', '电源', '10002|10181|10227', '10181');
INSERT INTO `category` VALUES ('10228', '6', '照明控制', '10002|10181|10228', '10181');
INSERT INTO `category` VALUES ('10231', '7', '配套设备', '10002|10181|10231', '10181');
INSERT INTO `category` VALUES ('10232', '1', '吊顶（含照明）', '10003|10182|10232', '10182');
INSERT INTO `category` VALUES ('10233', '2', '彩钢板', '10003|10182|10233', '10182');
INSERT INTO `category` VALUES ('10234', '3', '静电地板', '10003|10182|10234', '10182');
INSERT INTO `category` VALUES ('10235', '1', '配电柜', '10003|10183|10235', '10183');
INSERT INTO `category` VALUES ('10236', '2', 'PDU配电', '10003|10183|10236', '10183');
INSERT INTO `category` VALUES ('10237', '1', 'UPS', '10003|10184|10237', '10184');
INSERT INTO `category` VALUES ('10238', '2', '蓄电池', '10003|10184|10238', '10184');
INSERT INTO `category` VALUES ('10239', '3', '电池柜', '10003|10184|10239', '10184');
INSERT INTO `category` VALUES ('10240', '1', '精密空调', '10003|10185|10240', '10185');
INSERT INTO `category` VALUES ('10241', '2', '新风机', '10003|10185|10241', '10185');
INSERT INTO `category` VALUES ('10242', '1', '机房机柜', '10003|10186|10242', '10186');
INSERT INTO `category` VALUES ('10243', '1', '动力环境监控', '10003|10187|10243', '10187');
INSERT INTO `category` VALUES ('10244', '1', '消防控制系统', '10003|10188|10244', '10188');
INSERT INTO `category` VALUES ('10245', '1', 'LED显示屏', '10004|10189|10245', '10189');
INSERT INTO `category` VALUES ('10246', '2', 'DLP背投大屏', '10004|10189|10246', '10189');
INSERT INTO `category` VALUES ('10247', '3', 'LCD液晶拼接', '10004|10189|10247', '10189');
INSERT INTO `category` VALUES ('10248', '4', '液晶电视', '10004|10189|10248', '10189');
INSERT INTO `category` VALUES ('10249', '5', '图像处理器', '10004|10189|10249', '10189');
INSERT INTO `category` VALUES ('10250', '6', '显示周边及配件', '10004|10189|10250', '10189');
INSERT INTO `category` VALUES ('10251', '1', '广播音箱', '10004|10190|10251', '10190');
INSERT INTO `category` VALUES ('10252', '2', '广播功放', '10004|10190|10252', '10190');
INSERT INTO `category` VALUES ('10253', '3', '公共广播主机', '10004|10190|10253', '10190');
INSERT INTO `category` VALUES ('10254', '4', '调谐器', '10004|10190|10254', '10190');
INSERT INTO `category` VALUES ('10255', '5', '音源信号放大分配器', '10004|10190|10255', '10190');
INSERT INTO `category` VALUES ('10256', '6', '分区矩阵', '10004|10190|10256', '10190');
INSERT INTO `category` VALUES ('10257', '7', '电源时序器', '10004|10190|10257', '10190');
INSERT INTO `category` VALUES ('10258', '8', '消防信号采集器', '10004|10190|10258', '10190');
INSERT INTO `category` VALUES ('10259', '9', '消防语音报警器', '10004|10190|10259', '10190');
INSERT INTO `category` VALUES ('10260', '10', '远程寻呼主机', '10004|10190|10260', '10190');
INSERT INTO `category` VALUES ('10261', '11', '远程寻呼话筒', '10004|10190|10261', '10190');
INSERT INTO `category` VALUES ('10262', '12', '广播周边及配件', '10004|10190|10262', '10190');
INSERT INTO `category` VALUES ('10263', '1', '投影机', '10004|10191|10263', '10191');
INSERT INTO `category` VALUES ('10264', '2', '投影周边产品', '10004|10191|10264', '10191');
INSERT INTO `category` VALUES ('10265', '3', '幕布', '10004|10191|10265', '10191');
INSERT INTO `category` VALUES ('10266', '4', '数字会讨', '10004|10191|10266', '10191');
INSERT INTO `category` VALUES ('10267', '5', '专业音箱', '10004|10191|10267', '10191');
INSERT INTO `category` VALUES ('10268', '6', '专业功放', '10004|10191|10268', '10191');
INSERT INTO `category` VALUES ('10269', '7', '调音台', '10004|10191|10269', '10191');
INSERT INTO `category` VALUES ('10270', '8', '音频周边', '10004|10191|10270', '10191');
INSERT INTO `category` VALUES ('10271', '9', '音频处理', '10004|10191|10271', '10191');
INSERT INTO `category` VALUES ('10272', '10', '话筒', '10004|10191|10272', '10191');
INSERT INTO `category` VALUES ('10273', '11', '信号处理', '10004|10191|10273', '10191');
INSERT INTO `category` VALUES ('10274', '12', '集中控制系统', '10004|10191|10274', '10191');
INSERT INTO `category` VALUES ('10275', '13', '摄像录像', '10004|10191|10275', '10191');
INSERT INTO `category` VALUES ('10276', '14', '视频会议', '10004|10191|10276', '10191');
INSERT INTO `category` VALUES ('10277', '3', '信息插', '10004|10385|10277', '10385');
INSERT INTO `category` VALUES ('10278', '15', '会议周边及配件', '10004|10191|10278', '10191');
INSERT INTO `category` VALUES ('10279', '1', '音视频线材', '10004|10385|10279', '10385');
INSERT INTO `category` VALUES ('10280', '2', '音视频辅材', '10004|10385|10280', '10385');
INSERT INTO `category` VALUES ('10281', '1', '舞台灯光', '10004|10192|10281', '10192');
INSERT INTO `category` VALUES ('10282', '2', '舞台器械', '10004|10192|10282', '10192');
INSERT INTO `category` VALUES ('10283', '3', '舞台周边及配件', '10004|10192|10283', '10192');
INSERT INTO `category` VALUES ('10284', '1', '电子白板', '10004|10193|10284', '10193');
INSERT INTO `category` VALUES ('10285', '2', '录播', '10004|10193|10285', '10193');
INSERT INTO `category` VALUES ('10286', '3', '教学中控', '10004|10193|10286', '10193');
INSERT INTO `category` VALUES ('10287', '5', '教学周边及配件', '10004|10193|10287', '10193');
INSERT INTO `category` VALUES ('10289', '1', '家居娱乐控制面板', '10005|10195|10289', '10195');
INSERT INTO `category` VALUES ('10293', '1', '家居智能摄像机', '10005|10196|10293', '10196');
INSERT INTO `category` VALUES ('10294', '2', '智能门锁', '10005|10196|10294', '10196');
INSERT INTO `category` VALUES ('10295', '3', '智能门铃/可视对讲', '10005|10196|10295', '10196');
INSERT INTO `category` VALUES ('10296', '1', '智能开关/面板', '10005|10197|10296', '10197');
INSERT INTO `category` VALUES ('10299', '1', '自动能源控制', '10005|10198|10299', '10198');
INSERT INTO `category` VALUES ('10300', '2', '智能门/窗控制', '10005|10198|10300', '10198');
INSERT INTO `category` VALUES ('10301', '3', '其他智能单品', '10005|10198|10301', '10198');
INSERT INTO `category` VALUES ('10330', '2', '台式机', '10007|10205|10330', '10205');
INSERT INTO `category` VALUES ('10331', '5', '笔记本', '10007|10205|10331', '10205');
INSERT INTO `category` VALUES ('10332', '6', '平板电脑', '10007|10205|10332', '10205');
INSERT INTO `category` VALUES ('10333', '1', '键盘', '10007|10206|10333', '10206');
INSERT INTO `category` VALUES ('10334', '3', '网络设备', '10007|10206|10334', '10206');
INSERT INTO `category` VALUES ('10335', '4', '插线板', '10007|10206|10335', '10206');
INSERT INTO `category` VALUES ('10336', '1', '硬盘', '10007|10207|10336', '10207');
INSERT INTO `category` VALUES ('10337', '2', '移动硬盘', '10007|10207|10337', '10207');
INSERT INTO `category` VALUES ('10338', '3', '固态硬盘', '10007|10207|10338', '10207');
INSERT INTO `category` VALUES ('10339', '6', '存储卡', '10007|10207|10339', '10207');
INSERT INTO `category` VALUES ('10340', '1', '打印机', '10007|10208|10340', '10208');
INSERT INTO `category` VALUES ('10341', '3', '打印耗材', '10007|10208|10341', '10208');
INSERT INTO `category` VALUES ('10342', '7', '工业交换机', '10000|10011|10342', '10011');
INSERT INTO `category` VALUES ('10343', '8', '应用交付网关', '10000|10011|10343', '10011');
INSERT INTO `category` VALUES ('10344', '3', 'PVC,PP-R管', '10008|10209|10344', '10209');
INSERT INTO `category` VALUES ('10345', '4', '配件', '10008|10209|10345', '10209');
INSERT INTO `category` VALUES ('10346', '1', '手动工具', '10008|10210|10346', '10210');
INSERT INTO `category` VALUES ('10347', '2', '电动工具', '10008|10210|10347', '10210');
INSERT INTO `category` VALUES ('10348', '3', '管道工具', '10008|10210|10348', '10210');
INSERT INTO `category` VALUES ('10349', '4', '测量测试工具', '10008|10210|10349', '10210');
INSERT INTO `category` VALUES ('10350', '5', '登高工具', '10008|10210|10350', '10210');
INSERT INTO `category` VALUES ('10353', '1', '箱体柜体', '10008|10211|10353', '10211');
INSERT INTO `category` VALUES ('10354', '2', '工作台操作台', '10008|10211|10354', '10211');
INSERT INTO `category` VALUES ('10356', '3', '钢制防火门', '10008|10211|10356', '10211');
INSERT INTO `category` VALUES ('10357', '4', '配电箱(成品）', '10008|10211|10357', '10211');
INSERT INTO `category` VALUES ('10358', '5', '立杆', '10008|10211|10358', '10211');
INSERT INTO `category` VALUES ('10361', '1', '胶带', '10008|10212|10361', '10212');
INSERT INTO `category` VALUES ('10362', '2', '扎带', '10008|10212|10362', '10212');
INSERT INTO `category` VALUES ('10363', '3', '紧固件', '10008|10212|10363', '10212');
INSERT INTO `category` VALUES ('10366', '4', '胶类', '10008|10212|10366', '10212');
INSERT INTO `category` VALUES ('10367', '6', '焊材', '10008|10212|10367', '10212');
INSERT INTO `category` VALUES ('10370', '7', '易耗品工具', '10008|10212|10370', '10212');
INSERT INTO `category` VALUES ('10372', '2', '鼠标', '10007|10206|10372', '10206');
INSERT INTO `category` VALUES ('10373', '5', 'U盘', '10007|10207|10373', '10207');
INSERT INTO `category` VALUES ('10374', '4', '网络存储', '10007|10207|10374', '10207');
INSERT INTO `category` VALUES ('10375', '1', '工作站', '10007|10205|10375', '10205');
INSERT INTO `category` VALUES ('10376', '4', '一体机', '10007|10205|10376', '10205');
INSERT INTO `category` VALUES ('10377', '2', '多功能一体机', '10007|10208|10377', '10208');
INSERT INTO `category` VALUES ('10378', '4', '实物展台', '10004|10193|10378', '10193');
INSERT INTO `category` VALUES ('10379', '4', '扫描仪', '10007|10208|10379', '10208');
INSERT INTO `category` VALUES ('10380', '6', '磁盘阵列', '10000|10011|10380', '10011');
INSERT INTO `category` VALUES ('10381', '10', '对讲系统', '10000|10016|10381', '10016');
INSERT INTO `category` VALUES ('10382', '5', '磨具磨料', '10008|10212|10382', '10212');
INSERT INTO `category` VALUES ('10384', '6', '其他工具', '10008|10210|10384', '10210');
INSERT INTO `category` VALUES ('10385', '8', '线材辅材', '10004|10385', '10004');
INSERT INTO `category` VALUES ('10388', '2', '光纤光缆', '10000|10009|10388', '10009');
INSERT INTO `category` VALUES ('10389', '7', '光纤配线类产品', '10000|10009|10389', '10009');
INSERT INTO `category` VALUES ('10390', '8', '机柜', '10000|10009|10390', '10009');
INSERT INTO `category` VALUES ('10391', '9', '家居布线类产品', '10000|10009|10391', '10009');
INSERT INTO `category` VALUES ('10392', '10', '水晶头', '10000|10009|10392', '10009');
INSERT INTO `category` VALUES ('10393', '11', '布线工具', '10000|10009|10393', '10009');
INSERT INTO `category` VALUES ('10394', '5', '考勤机', '10007|10208|10394', '10208');
INSERT INTO `category` VALUES ('10402', '6', '碎纸机', '10007|10208|10402', '10208');
INSERT INTO `category` VALUES ('10403', '7', '收款/POS机', '10007|10208|10403', '10208');
INSERT INTO `category` VALUES ('10404', '8', '点钞/验钞机', '10007|10208|10404', '10208');
INSERT INTO `category` VALUES ('10405', '2', '家居娱乐喇叭/音箱', '10005|10195|10405', '10195');
INSERT INTO `category` VALUES ('10406', '3', '家居娱乐功放', '10005|10195|10406', '10195');
INSERT INTO `category` VALUES ('10407', '4', '家居娱乐分控器', '10005|10195|10407', '10195');
INSERT INTO `category` VALUES ('10408', '5', '家居娱乐主机', '10005|10195|10408', '10195');
INSERT INTO `category` VALUES ('10409', '6', '娱乐手柄/控制终端', '10005|10195|10409', '10195');
INSERT INTO `category` VALUES ('10410', '7', '家居娱乐感应/探测', '10005|10195|10410', '10195');
INSERT INTO `category` VALUES ('10411', '8', '智能数码展示产品', '10005|10195|10411', '10195');
INSERT INTO `category` VALUES ('10412', '9', '家居娱乐周边组件', '10005|10195|10412', '10195');
INSERT INTO `category` VALUES ('10413', '10', '家居娱乐辅材', '10005|10195|10413', '10195');
INSERT INTO `category` VALUES ('10414', '4', '家居安全感应/探测', '10005|10196|10414', '10196');
INSERT INTO `category` VALUES ('10415', '5', '智能声/光报警', '10005|10196|10415', '10196');
INSERT INTO `category` VALUES ('10416', '6', '家居安全周边组件', '10005|10196|10416', '10196');
INSERT INTO `category` VALUES ('10417', '7', '家居安全辅材', '10005|10196|10417', '10196');
INSERT INTO `category` VALUES ('10418\r\n', '12', '其它', '10000|10009|10418\r\n', '10009');
INSERT INTO `category` VALUES ('10419', '2', '智能插座/插排', '10005|10197|10419', '10197');
INSERT INTO `category` VALUES ('10420', '3', '智能多用遥控器', '10005|10197|10420', '10197');
INSERT INTO `category` VALUES ('10421', '4', '智能控制模块', '10005|10197|10421', '10197');
INSERT INTO `category` VALUES ('10422', '5', '智能家居主机', '10005|10197|10422', '10197');
INSERT INTO `category` VALUES ('10423', '6', '智能家居网关', '10005|10197|10423', '10197');
INSERT INTO `category` VALUES ('10424', '7', '智能灯具', '10005|10197|10424', '10197');
INSERT INTO `category` VALUES ('10425', '8', '家电控制辅材', '10005|10197|10425', '10197');
INSERT INTO `category` VALUES ('10426', '4', '家用智能机器人', '10005|10198|10426', '10198');
INSERT INTO `category` VALUES ('10427', '5', '智能穿戴', '10005|10198|10427', '10198');
INSERT INTO `category` VALUES ('10428', '6', '智能健康', '10005|10198|10428', '10198');
INSERT INTO `category` VALUES ('10429', '7', '智能环境控制', '10005|10198|10429', '10198');
INSERT INTO `category` VALUES ('10430', '8', '智能凉/晒', '10005|10198|10430', '10198');
INSERT INTO `category` VALUES ('10431', '9', '家居辅助辅材', '10005|10198|10431', '10198');
INSERT INTO `category` VALUES ('10435', '1', '同轴电缆', '10006|10435', '10006');
INSERT INTO `category` VALUES ('10436', '2', '电源线缆/信号线缆 计算机电缆', '10006|10436', '10006');
INSERT INTO `category` VALUES ('10437', '3', '通信/电话电缆', '10006|10437', '10006');
INSERT INTO `category` VALUES ('10438', '4', '控制电缆', '10006|10438', '10006');
INSERT INTO `category` VALUES ('10439', '5', '电力电缆', '10006|10439', '10006');
INSERT INTO `category` VALUES ('10440', '6', '综合/特种电缆', '10006|10440', '10006');
INSERT INTO `category` VALUES ('10442', '1', '实心聚乙烯绝缘同轴电缆', '10006|10435|10442', '10435');
INSERT INTO `category` VALUES ('10443', '2', '发泡聚乙烯绝缘同轴电缆', '10006|10435|10443', '10435');
INSERT INTO `category` VALUES ('10444', '1', '电源/信号线', '10006|10436|10444', '10436');
INSERT INTO `category` VALUES ('10445', '2', 'YXB透明聚氯乙烯绝缘音响线', '10006|10436|10445', '10436');
INSERT INTO `category` VALUES ('10446', '3', 'HTP话筒线', '10006|10436|10446', '10436');
INSERT INTO `category` VALUES ('10447', '4', '计算机电缆', '10006|10436|10447', '10436');
INSERT INTO `category` VALUES ('10448', '1', 'HYA实心聚乙烯绝缘通信电缆', '10006|10437|10448', '10437');
INSERT INTO `category` VALUES ('10449', '2', '电话线', '10006|10437|10449', '10437');
INSERT INTO `category` VALUES ('10450', '1', '聚氯乙烯绝缘控制电缆', '10006|10438|10450', '10438');
INSERT INTO `category` VALUES ('10451', '2', '交联聚乙烯绝缘控制电缆', '10006|10438|10451', '10438');
INSERT INTO `category` VALUES ('10452', '1', '聚氯乙烯绝缘电力电缆', '10006|10439|10452', '10439');
INSERT INTO `category` VALUES ('10453', '2', '交联聚乙烯绝缘电力电缆', '10006|10439|10453', '10439');
INSERT INTO `category` VALUES ('10454', '1', '综合电缆', '10006|10440|10454', '10440');
INSERT INTO `category` VALUES ('10455', '2', '电梯综合电缆', '10006|10440|10455', '10440');
INSERT INTO `category` VALUES ('10456', '3', '电梯电缆', '10006|10440|10456', '10440');
INSERT INTO `category` VALUES ('10457', '4', '地感电缆', '10006|10440|10457', '10440');
INSERT INTO `category` VALUES ('10458', '5', '分支电缆', '10006|10440|10458', '10440');
INSERT INTO `category` VALUES ('10459', '6', '防火电力电缆', '10006|10440|10459', '10440');
INSERT INTO `category` VALUES ('10467', '6', '电视墙', '10008|10211|10467', '10211');
INSERT INTO `category` VALUES ('10468', '7', '铜排及机加件', '10008|10211|10468', '10211');
INSERT INTO `category` VALUES ('10471', '7', '公共安全套餐', '10001|10471', '10001');
INSERT INTO `category` VALUES ('10472', '1', '视频监控类套餐', '10001|10471|10472', '10471');
INSERT INTO `category` VALUES ('10473', '2', '防盗报警类套餐', '10001|10471|10473', '10471');
INSERT INTO `category` VALUES ('10474', '3', '电子巡更类套餐', '10001|10471|10474', '10471');
INSERT INTO `category` VALUES ('10475', '4', '一卡通类套餐', '10001|10471|10475', '10471');
INSERT INTO `category` VALUES ('10476', '5', '车辆管理类套餐', '10001|10471|10476', '10471');
INSERT INTO `category` VALUES ('10477', '6', '楼宇对讲类套餐', '10001|10471|10477', '10471');
INSERT INTO `category` VALUES ('10478', '3', '显示器', '10007|10205|10478', '10205');
INSERT INTO `category` VALUES ('10479', '6', '家庭影音', '10004|10479', '10004');
INSERT INTO `category` VALUES ('10480', '1', '家庭显示', '10004|10479|10480', '10479');
INSERT INTO `category` VALUES ('10481', '2', '家庭影院', '10004|10479|10481', '10479');
INSERT INTO `category` VALUES ('10482', '3', '背景音乐', '10004|10479|10482', '10479');
INSERT INTO `category` VALUES ('10483', '4', '智能及控制', '10004|10479|10483', '10479');
INSERT INTO `category` VALUES ('10484', '7', '音视频套餐', '10004|10484', '10004');
INSERT INTO `category` VALUES ('10485', '1', '显示套餐', '10004|10484|10485', '10484');
INSERT INTO `category` VALUES ('10486', '2', '公共广播及背景音乐套餐', '10004|10484|10486', '10484');
INSERT INTO `category` VALUES ('10487', '3', '会议套餐', '10004|10484|10487', '10484');
INSERT INTO `category` VALUES ('10488', '4', '家庭影音套餐', '10004|10484|10488', '10484');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsCode` varchar(32) NOT NULL DEFAULT '',
  `uri` varchar(1024) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `prize` decimal(10,2) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `categoryId` varchar(32) DEFAULT NULL,
  `eval1` text,
  `eval2` text,
  `eval3` text,
  PRIMARY KEY (`goodsCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品信息';

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsforimg`
-- ----------------------------
DROP TABLE IF EXISTS `goodsforimg`;
CREATE TABLE `goodsforimg` (
  `goodsId` varchar(32) NOT NULL DEFAULT '',
  `imgUri` varchar(1024) DEFAULT NULL,
  `ord` smallint(6) DEFAULT NULL,
  `typeSize` smallint(6) DEFAULT NULL,
  `typePostion` smallint(6) DEFAULT NULL,
  `myPath` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品的图片';

-- ----------------------------
-- Records of goodsforimg
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsforlfprop`
-- ----------------------------
DROP TABLE IF EXISTS `goodsforlfprop`;
CREATE TABLE `goodsforlfprop` (
  `goodsId` varchar(32) DEFAULT NULL,
  `isTag` smallint(6) DEFAULT NULL,
  `propForListId` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsforlfprop
-- ----------------------------

-- ----------------------------
-- Table structure for `prop`
-- ----------------------------
DROP TABLE IF EXISTS `prop`;
CREATE TABLE `prop` (
  `propertyId` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `ord` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`propertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品的属性类';

-- ----------------------------
-- Records of prop
-- ----------------------------

-- ----------------------------
-- Table structure for `propforlist`
-- ----------------------------
DROP TABLE IF EXISTS `propforlist`;
CREATE TABLE `propforlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propId` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `ord` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='属性拥有的类型';

-- ----------------------------
-- Records of propforlist
-- ----------------------------

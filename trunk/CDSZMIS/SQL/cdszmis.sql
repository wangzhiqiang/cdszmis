# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: cdszmis
# ------------------------------------------------------
# Server version 5.1.51-community

DROP DATABASE IF EXISTS `cdszmis`;
CREATE DATABASE `cdszmis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cdszmis`;

#
# Source for table tb_attachment
#

DROP TABLE IF EXISTS `tb_attachment`;
CREATE TABLE `tb_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `filestatus` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `filesEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD135EF94E45B0B8` (`filesEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_attachment
#

INSERT INTO `tb_attachment` VALUES (10,'11200544115511.jpg',1792,NULL,'image/jpeg','/uploadFile/1205200740159745.jpg',NULL);
INSERT INTO `tb_attachment` VALUES (11,'download.png',8115,NULL,'image/png','\\uploadFile\\1205200742073817.png',NULL);
INSERT INTO `tb_attachment` VALUES (12,'asdfaSD.PnG',514294,NULL,'image/png','\\uploadFile\\1205200753117596.PnG',NULL);
INSERT INTO `tb_attachment` VALUES (13,'CEC LOGO.jpg',53319,NULL,'image/jpeg','\\uploadFile\\1205200839103646.jpg',NULL);

#
# Source for table tb_depart
#

DROP TABLE IF EXISTS `tb_depart`;
CREATE TABLE `tb_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `departname` varchar(255) DEFAULT NULL,
  `departnode` varchar(255) DEFAULT NULL,
  `departowner` varchar(255) DEFAULT NULL,
  `departphonenumber` varchar(255) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_depart
#

INSERT INTO `tb_depart` VALUES (1,NULL,'维护部','对外项目维护','wzq','15680769721','对客户定制项目的维护以及更新',0);
INSERT INTO `tb_depart` VALUES (2,NULL,'研发部','产品研发','王志强','15680769721','开发新的产品适应新的需求',0);
INSERT INTO `tb_depart` VALUES (3,NULL,'人事部','公司内部人事管理','WP','15680769721','对公司的人事调整和人员培训',0);
INSERT INTO `tb_depart` VALUES (4,NULL,'测试部','测试研发部研发的产品','TEST','15680769721','对产品进行严格的测试，保证产品的合格率',0);
INSERT INTO `tb_depart` VALUES (5,NULL,'设计一所','工程设计部门','所长','02887992324','对工程，项目进行设计。',0);

#
# Source for table tb_files
#

DROP TABLE IF EXISTS `tb_files`;
CREATE TABLE `tb_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `depart` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_files
#


#
# Source for table tb_prijectdepartarrangement
#

DROP TABLE IF EXISTS `tb_prijectdepartarrangement`;
CREATE TABLE `tb_prijectdepartarrangement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargeperson` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  `projectEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK880741945442F5F8` (`projectEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_prijectdepartarrangement
#

INSERT INTO `tb_prijectdepartarrangement` VALUES (1,'4',1,'2011-01-23','陈帝霖','无',1);
INSERT INTO `tb_prijectdepartarrangement` VALUES (2,'13',2,'2011-01-23','王攀','项目尽快完成',2);
INSERT INTO `tb_prijectdepartarrangement` VALUES (3,'4',7,'2011-01-23','王攀','无',7);
INSERT INTO `tb_prijectdepartarrangement` VALUES (4,'1',6,'2011-01-23','王攀','无',6);
INSERT INTO `tb_prijectdepartarrangement` VALUES (5,'1',8,'2011-01-23','王攀','项目尽快完成',8);
INSERT INTO `tb_prijectdepartarrangement` VALUES (6,'15',3,'2011-01-23','陈帝霖','无',3);
INSERT INTO `tb_prijectdepartarrangement` VALUES (7,'16',4,'2011-01-23','王攀','项目尽快完成',4);
INSERT INTO `tb_prijectdepartarrangement` VALUES (8,'17',11,'2011-01-23','王攀','项目尽快完成',11);
INSERT INTO `tb_prijectdepartarrangement` VALUES (9,'4',5,'2011-01-23','王攀','无',5);

#
# Source for table tb_prijectstatus
#

DROP TABLE IF EXISTS `tb_prijectstatus`;
CREATE TABLE `tb_prijectstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `projectEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDA3E7BB45442F5F8` (`projectEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_prijectstatus
#

INSERT INTO `tb_prijectstatus` VALUES (2,'2011-02-25','暂无',1,'2011-02-25','陈帝霖',5,1);
INSERT INTO `tb_prijectstatus` VALUES (3,'2011-02-25','123',2,'2011-02-25','陈帝霖',7,2);
INSERT INTO `tb_prijectstatus` VALUES (4,'2011-02-25','暂无',3,'2011-02-25','王攀',6,3);
INSERT INTO `tb_prijectstatus` VALUES (5,'2011-02-25','暂无',4,'2011-02-25','陈帝霖',3,4);
INSERT INTO `tb_prijectstatus` VALUES (6,NULL,NULL,5,NULL,NULL,1,5);
INSERT INTO `tb_prijectstatus` VALUES (7,'2011-02-25','暂无',6,'2011-02-25','王攀',4,6);
INSERT INTO `tb_prijectstatus` VALUES (8,'2011-02-25','暂无',7,'2011-02-25','陈玮',3,7);
INSERT INTO `tb_prijectstatus` VALUES (9,'2011-02-25','暂无',8,'2011-02-25','王攀',6,8);
INSERT INTO `tb_prijectstatus` VALUES (10,NULL,NULL,11,NULL,NULL,1,11);
INSERT INTO `tb_prijectstatus` VALUES (11,NULL,NULL,9,NULL,NULL,0,9);
INSERT INTO `tb_prijectstatus` VALUES (12,NULL,NULL,12,NULL,NULL,0,12);

#
# Source for table tb_project
#

DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commissionedname` varchar(255) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `contactphone` varchar(255) DEFAULT NULL,
  `contractdate` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `important` varchar(255) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `prijectname` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `serialnumbers` varchar(255) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `subperson` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_project
#

INSERT INTO `tb_project` VALUES (1,'文生局','张局长','15680769721','2012-05-14','2012-05-14','作为圆林建设的模范','2012-05-14','0',1232350000,'园林一号','123123','SZ0986975','2012-05-14','李四');
INSERT INTO `tb_project` VALUES (2,'网信','王志强','15680769721','2012-05-05','2012-05-05','装修','2012-09-05','0',345,'外墙翻新','243','SZ0986977','2012-05-05','admin');
INSERT INTO `tb_project` VALUES (3,'CD市政院','刘新','13356982651','2009-06-05','2009-06-05','和谐进行中','2009-06-05','1',1232350000,'CD一号桥建设','123123','20090658','2009-06-05','WZQ');
INSERT INTO `tb_project` VALUES (4,'cec','cec','02887992324','2009-06-05','2009-06-05','测试中','2009-06-05','0',35689,'测试数据','125','12313455','2009-06-05','WZQ');
INSERT INTO `tb_project` VALUES (5,'成都市政院','WZQ','15698563256','2009-06-05','2009-06-07','2011-09-25',NULL,'0',2341230,'CDSZMIS','123123','0986975','2009-08-05','KAI');
INSERT INTO `tb_project` VALUES (6,'CEC','CEC','15680769721','2012-05-14','2012-05-14','成都工业学院项目情况测试','2012-05-14','0',435634,'CECTEST','123','123456789','2012-05-14','WZQ');
INSERT INTO `tb_project` VALUES (7,'cec','韩寒','13356982651','2009-06-05','2009-06-05','实施中','2009-06-05','0',23,'信息管理','4','011258','2009-06-05','小强');
INSERT INTO `tb_project` VALUES (8,'华为','王志强','15698563256','2012-05-05','2012-05-05','正在进行','2012-05-14','2',2345,'项目测试','9','0281234','2012-05-05','王红');
INSERT INTO `tb_project` VALUES (9,'中信','王攀','13356982651','2009-06-05','2012-05-05','项目实施','2009-06-05','1',678,'房屋建筑','45','03546','2009-06-05','王攀');
INSERT INTO `tb_project` VALUES (10,'CD市政院','陈帝霖','13356982651','2009-06-05','2012-05-05','和谐进行中','2009-06-05','2',1232350000,'道路实施','9','12345','2009-06-05','陈帝霖');
INSERT INTO `tb_project` VALUES (11,'中信','韩寒','15680769721','2009-06-05','2012-05-05','暂无','2009-06-05','0',34,'道路建设','3','0112','2009-06-05','WZQ');
INSERT INTO `tb_project` VALUES (12,'中信','韩寒','15698563256','2012-05-05','2009-06-07','暂无','2012-05-14','2',56,'修筑河流','5','67890','2012-05-05','admin');
INSERT INTO `tb_project` VALUES (13,'cec','韩寒','15680769721','2009-06-05','2009-06-05','和谐进行中','2009-06-05','2',234,'清扫道路','243','1345','2009-06-05','WZQ');

#
# Source for table tb_projectarrangement
#

DROP TABLE IF EXISTS `tb_projectarrangement`;
CREATE TABLE `tb_projectarrangement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departids` varchar(255) DEFAULT NULL,
  `designdate` datetime DEFAULT NULL,
  `examinationedate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `publicationdate` datetime DEFAULT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `signdate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  `projectEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7E5413C25442F5F8` (`projectEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_projectarrangement
#

INSERT INTO `tb_projectarrangement` VALUES (4,'2',NULL,NULL,'园林一号',1,NULL,NULL,'',NULL,NULL,'',1);
INSERT INTO `tb_projectarrangement` VALUES (5,'4',NULL,NULL,'外墙翻新',2,NULL,NULL,'',NULL,NULL,'',2);
INSERT INTO `tb_projectarrangement` VALUES (6,'3',NULL,NULL,'CD一号桥建设',3,NULL,NULL,'',NULL,NULL,'',3);
INSERT INTO `tb_projectarrangement` VALUES (7,'2',NULL,NULL,'测试数据',4,NULL,NULL,'',NULL,NULL,'',4);
INSERT INTO `tb_projectarrangement` VALUES (8,'2',NULL,NULL,'CDSZMIS',5,NULL,NULL,'',NULL,NULL,'',5);
INSERT INTO `tb_projectarrangement` VALUES (9,'3','2011-10-23','2011-10-23','CECTEST',6,'2011-10-23','2011-10-23','王攀','2011-10-23','2011-10-23','继续实施',6);
INSERT INTO `tb_projectarrangement` VALUES (10,'1','2011-10-23','2011-10-23','信息管理',7,'2011-10-23','2011-10-23','陈帝霖','2011-10-23','2011-10-23','项目参照需求',7);
INSERT INTO `tb_projectarrangement` VALUES (11,'1','2011-10-23','2011-10-23','项目测试',8,'2011-10-23','2011-10-23','王攀','2011-10-23','2011-10-23','继续实施',8);
INSERT INTO `tb_projectarrangement` VALUES (12,'3','2011-10-23','2011-10-23','道路建设',11,'2011-10-23','2011-10-23','王攀','2011-10-23','2011-10-23','继续实施',11);
INSERT INTO `tb_projectarrangement` VALUES (13,'2','2011-10-23','2011-10-23','房屋建筑',9,'2011-10-23','2011-10-23','王攀','2011-10-23','2011-10-23','继续实施',9);
INSERT INTO `tb_projectarrangement` VALUES (14,'1','2011-10-23','2011-10-23','修筑河流',12,'2011-10-23','2011-10-23','陈帝霖','2011-10-23','2011-10-23','项目参照需求',12);

#
# Source for table tb_projectsubmit
#

DROP TABLE IF EXISTS `tb_projectsubmit`;
CREATE TABLE `tb_projectsubmit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enddate` datetime DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `nopass` varchar(255) DEFAULT NULL,
  `opinion` varchar(255) DEFAULT NULL,
  `projectid` int(11) DEFAULT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `projectEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57A91C605442F5F8` (`projectEntity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_projectsubmit
#


#
# Source for table tb_sys_menu
#

DROP TABLE IF EXISTS `tb_sys_menu`;
CREATE TABLE `tb_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuimg` varchar(255) DEFAULT NULL,
  `menuname` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_sys_menu
#

INSERT INTO `tb_sys_menu` VALUES (1,'','系统管理系统',0,'#');
INSERT INTO `tb_sys_menu` VALUES (2,NULL,'文件办理系统',0,'#');
INSERT INTO `tb_sys_menu` VALUES (3,NULL,'任务管理系统',0,'#');
INSERT INTO `tb_sys_menu` VALUES (4,NULL,'部门管理',1,'#');
INSERT INTO `tb_sys_menu` VALUES (5,NULL,'用户管理',1,'#');
INSERT INTO `tb_sys_menu` VALUES (6,NULL,'用户组管理',1,'#');
INSERT INTO `tb_sys_menu` VALUES (7,NULL,'系统配置',1,'#');
INSERT INTO `tb_sys_menu` VALUES (8,NULL,'办理人员配置',2,'#');
INSERT INTO `tb_sys_menu` VALUES (9,NULL,'意见模板',2,'#');
INSERT INTO `tb_sys_menu` VALUES (10,NULL,'任务进度管理',3,'#');
INSERT INTO `tb_sys_menu` VALUES (11,NULL,'任务查询管理',3,'#');
INSERT INTO `tb_sys_menu` VALUES (12,NULL,'任务统计管理',3,'#');
INSERT INTO `tb_sys_menu` VALUES (13,NULL,'部门信息维护',4,'/depart/depart_departmanager');
INSERT INTO `tb_sys_menu` VALUES (14,NULL,'部门信息查询',4,'/depart/depart_findallDepart');
INSERT INTO `tb_sys_menu` VALUES (15,NULL,'用户注销',5,'/user/user_userLogout');
INSERT INTO `tb_sys_menu` VALUES (16,NULL,'用户信息查询',5,'/user/user_userSelect');
INSERT INTO `tb_sys_menu` VALUES (17,NULL,'用户人事管理',5,'/user/user_userManagelist');
INSERT INTO `tb_sys_menu` VALUES (18,NULL,'用户权限分配',5,'/user/user_userPower');
INSERT INTO `tb_sys_menu` VALUES (19,NULL,'用户信息维护',5,'/user/user_userUpdate');
INSERT INTO `tb_sys_menu` VALUES (20,NULL,'用户分配',6,'/usergroup/group_groupUser');
INSERT INTO `tb_sys_menu` VALUES (21,NULL,'权限分配',6,'/usergroup/group_groupMenu');
INSERT INTO `tb_sys_menu` VALUES (22,NULL,'用户组信息维护',6,'/usergroup/group_groupManager');
INSERT INTO `tb_sys_menu` VALUES (23,NULL,'职务管理',7,'/systemdic/systemdic_dicmanager');
INSERT INTO `tb_sys_menu` VALUES (24,NULL,'职称管理',7,'/systemdic/systemdic_dicmanager01');
INSERT INTO `tb_sys_menu` VALUES (25,NULL,'办理人员列表',8,'/files/files_listOfTransact');
INSERT INTO `tb_sys_menu` VALUES (26,NULL,'审批人员列表',8,'/files/files_listOfExamine');
INSERT INTO `tb_sys_menu` VALUES (27,NULL,'抄送人员列表',8,'/files/files_listOfCopy');
INSERT INTO `tb_sys_menu` VALUES (28,NULL,'办理意见模板',9,'/files/files_mouldTransact');
INSERT INTO `tb_sys_menu` VALUES (29,NULL,'审批意见模板',9,'/files/files_mouldExamine');
INSERT INTO `tb_sys_menu` VALUES (30,NULL,'抄送意见模板',9,'/files/files_mouodlCopy');
INSERT INTO `tb_sys_menu` VALUES (31,NULL,'取消意见模板',9,'/files/files_mouldCancel');
INSERT INTO `tb_sys_menu` VALUES (32,NULL,'办理完成意见模板',9,'/files/files_mouldTransactSuccess');
INSERT INTO `tb_sys_menu` VALUES (33,NULL,'项目登记',10,'/project/pro_projectmanage');
INSERT INTO `tb_sys_menu` VALUES (34,NULL,'分派项目',10,'/project/pro_arrangeDepartids');
INSERT INTO `tb_sys_menu` VALUES (35,NULL,'所级安排',10,'/project/pro_arrangePerson');
INSERT INTO `tb_sys_menu` VALUES (36,NULL,'项目实施',10,'/project/pro_projectImpl');
INSERT INTO `tb_sys_menu` VALUES (37,NULL,'总工审查',10,'/project/pro_projectCheck');
INSERT INTO `tb_sys_menu` VALUES (38,NULL,'签字出图',10,'/project/pro_projectSign');
INSERT INTO `tb_sys_menu` VALUES (39,NULL,'出版发行',10,'/project/pro_projectPublic');
INSERT INTO `tb_sys_menu` VALUES (40,NULL,'发行收费',10,'/project/pro_projectSale');
INSERT INTO `tb_sys_menu` VALUES (41,NULL,'归档',10,'/project/pro_projectFilling');
INSERT INTO `tb_sys_menu` VALUES (42,NULL,'项目状态查询',11,'/project/pro_projectStatus');
INSERT INTO `tb_sys_menu` VALUES (43,NULL,'项目进度查询',11,'/project/pro_projectProgress');
INSERT INTO `tb_sys_menu` VALUES (44,NULL,'项目详细信息查询',11,'/project/pro_projectDetail');
INSERT INTO `tb_sys_menu` VALUES (45,NULL,'按部门统计',12,'/project/pro_conutBydepart');
INSERT INTO `tb_sys_menu` VALUES (46,NULL,'用户注册',5,'/user/user_userRegister');
INSERT INTO `tb_sys_menu` VALUES (47,NULL,'文件管理',2,'#');
INSERT INTO `tb_sys_menu` VALUES (48,NULL,'文件上传',47,'/files/files_fileUpload');
INSERT INTO `tb_sys_menu` VALUES (49,NULL,'文件下载',47,'/files/files_listFile');

#
# Source for table tb_sysdictionary
#

DROP TABLE IF EXISTS `tb_sysdictionary`;
CREATE TABLE `tb_sysdictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `properties` varchar(255) DEFAULT NULL,
  `seq` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_sysdictionary
#

INSERT INTO `tb_sysdictionary` VALUES (1,'2011-03-11','院长','职务字典','position',0);
INSERT INTO `tb_sysdictionary` VALUES (2,'2011-03-11','书记','职务字典','position',0);
INSERT INTO `tb_sysdictionary` VALUES (3,'2011-03-11','副院长','职务字典','position',0);
INSERT INTO `tb_sysdictionary` VALUES (4,'2011-03-11','总工程师','职务字典','postion',0);
INSERT INTO `tb_sysdictionary` VALUES (5,'2011-03-11','主任','职务字典','position',0);
INSERT INTO `tb_sysdictionary` VALUES (6,'2011-03-11','所长','职务字典','position',0);
INSERT INTO `tb_sysdictionary` VALUES (7,'2011-03-11','会计','职称字典','titles',0);
INSERT INTO `tb_sysdictionary` VALUES (8,'2011-03-11','工程师','职称字典','titles',0);

#
# Source for table tb_templates
#

DROP TABLE IF EXISTS `tb_templates`;
CREATE TABLE `tb_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_templates
#


#
# Source for table tb_user
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `conditions` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL,
  `officenum` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `usname` varchar(255) DEFAULT NULL,
  `uspass` varchar(255) DEFAULT NULL,
  `uspositions` varchar(255) DEFAULT NULL,
  `ustitles` varchar(255) DEFAULT NULL,
  `departmentEntity_id` int(11) DEFAULT NULL,
  `usdeparts` int(11) DEFAULT NULL,
  `usgroups` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA4FF6AFCF2DEE75C` (`departmentEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_user
#

INSERT INTO `tb_user` VALUES (1,'1991-03-05','新员工任职, ',NULL,'wzq@126.com',NULL,'51382319910305483X',NULL,'admin','02887992324','15680769721',0,'admin','418296719726',NULL,NULL,NULL,2,'1');
INSERT INTO `tb_user` VALUES (4,'1991-03-05','调职到维护部, ',NULL,'qwe@125.com','男','51382319910305483X','实习生','qwe','028-87992324','15690789876',0,'qwe','54091676987955',NULL,NULL,NULL,1,NULL);
INSERT INTO `tb_user` VALUES (13,'1990-03-05','新员工任职,',NULL,'qwe@125.com','男','510108198806180315','','chen','','15690789876',0,'陈帝霖','907507748629153657650',NULL,NULL,NULL,1,NULL);
INSERT INTO `tb_user` VALUES (14,'1991-03-05','新员工任职,2,',NULL,'wangpan@qq.com','男','510108198806180315','新员工，考核新内容','wang','','15589563254',1,'王攀','54091676987955',NULL,NULL,NULL,1,'2, 6');
INSERT INTO `tb_user` VALUES (15,'1980-01-05','新员工任职, ',NULL,'wangpan@qq.com','男','510108198806180315','实习生','wang盘','','15589563254',0,'王攀','54091676987955',NULL,NULL,NULL,1,NULL);
INSERT INTO `tb_user` VALUES (16,'1990-11-05','新员工任职, ',NULL,'chenwei@qq.com','男','531823499503054831',NULL,'chenwei','','15680769721',0,'陈伟','54091677185334',NULL,NULL,1,1,'2, 6');
INSERT INTO `tb_user` VALUES (17,'1991-03-05','新员工任职, ',NULL,'wzq@g.com','男','51382319910305483X','Wzq的简介','wzq11','','15690879875',0,'WZQ','513155346737',NULL,NULL,1,1,'6, 14');
INSERT INTO `tb_user` VALUES (18,NULL,NULL,NULL,'efew@163.com','女','','','lx','','13688174070',0,'李幸','465872958003',NULL,NULL,3,3,'1');

#
# Source for table tb_user_tb_usergroup
#

DROP TABLE IF EXISTS `tb_user_tb_usergroup`;
CREATE TABLE `tb_user_tb_usergroup` (
  `tb_user_id` int(11) NOT NULL,
  `userGroupEntity_id` int(11) NOT NULL,
  PRIMARY KEY (`tb_user_id`,`userGroupEntity_id`),
  KEY `FK97C7C166E63B0FEE` (`tb_user_id`),
  KEY `FK97C7C1669CF4C078` (`userGroupEntity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_user_tb_usergroup
#

INSERT INTO `tb_user_tb_usergroup` VALUES (1,1);
INSERT INTO `tb_user_tb_usergroup` VALUES (4,1);
INSERT INTO `tb_user_tb_usergroup` VALUES (13,1);
INSERT INTO `tb_user_tb_usergroup` VALUES (13,2);
INSERT INTO `tb_user_tb_usergroup` VALUES (14,6);
INSERT INTO `tb_user_tb_usergroup` VALUES (15,14);
INSERT INTO `tb_user_tb_usergroup` VALUES (16,2);
INSERT INTO `tb_user_tb_usergroup` VALUES (16,6);
INSERT INTO `tb_user_tb_usergroup` VALUES (17,6);
INSERT INTO `tb_user_tb_usergroup` VALUES (17,14);
INSERT INTO `tb_user_tb_usergroup` VALUES (18,1);

#
# Source for table tb_usergroup
#

DROP TABLE IF EXISTS `tb_usergroup`;
CREATE TABLE `tb_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_usergroup
#

INSERT INTO `tb_usergroup` VALUES (1,NULL,'管理员','/user,/usergroup,/files,/project,/depart');
INSERT INTO `tb_usergroup` VALUES (2,NULL,'任务管理组',' /usergroup,  /files,  /project');
INSERT INTO `tb_usergroup` VALUES (6,NULL,'测试','/user,/usergroup,/files');
INSERT INTO `tb_usergroup` VALUES (14,NULL,'系统组','/user,/usergroup,/files,/project,/depart');

#
# Source for table tb_usergroup_tb_sys_menu
#

DROP TABLE IF EXISTS `tb_usergroup_tb_sys_menu`;
CREATE TABLE `tb_usergroup_tb_sys_menu` (
  `tb_usergroup_id` int(11) NOT NULL,
  `menSysMenuEntities_id` int(11) NOT NULL,
  PRIMARY KEY (`tb_usergroup_id`,`menSysMenuEntities_id`),
  KEY `FKC1F0C106F81A326C` (`tb_usergroup_id`),
  KEY `FKC1F0C106933EABF0` (`menSysMenuEntities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_usergroup_tb_sys_menu
#

INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,2);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,3);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,7);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,10);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,11);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,12);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,13);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,14);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,15);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,16);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,17);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,18);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,19);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,20);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,21);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,22);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,23);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,24);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,25);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,26);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,27);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,28);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,29);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,30);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,31);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,32);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,33);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,34);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,35);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,36);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,37);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,38);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,39);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,40);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,41);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,42);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,43);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,44);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,45);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,46);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,47);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,48);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,49);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,3);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,10);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,11);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,12);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,33);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,35);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,36);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,37);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,38);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,39);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,40);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,41);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,42);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,43);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,44);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,45);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,13);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,14);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,16);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,18);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,19);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,7);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,13);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,14);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,15);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,16);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,17);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,18);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,19);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,20);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,21);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,22);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,23);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,24);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (14,46);

#
#  Foreign keys for table tb_attachment
#

ALTER TABLE `tb_attachment`
ADD CONSTRAINT `FKD135EF94E45B0B8` FOREIGN KEY (`filesEntity_id`) REFERENCES `tb_files` (`id`);

#
#  Foreign keys for table tb_prijectdepartarrangement
#

ALTER TABLE `tb_prijectdepartarrangement`
ADD CONSTRAINT `FK880741945442F5F8` FOREIGN KEY (`projectEntity_id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_prijectstatus
#

ALTER TABLE `tb_prijectstatus`
ADD CONSTRAINT `FKDA3E7BB45442F5F8` FOREIGN KEY (`projectEntity_id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_projectarrangement
#

ALTER TABLE `tb_projectarrangement`
ADD CONSTRAINT `FK7E5413C25442F5F8` FOREIGN KEY (`projectEntity_id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_projectsubmit
#

ALTER TABLE `tb_projectsubmit`
ADD CONSTRAINT `FK57A91C605442F5F8` FOREIGN KEY (`projectEntity_id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_user
#

ALTER TABLE `tb_user`
ADD CONSTRAINT `FKA4FF6AFCF2DEE75C` FOREIGN KEY (`departmentEntity_id`) REFERENCES `tb_depart` (`id`);

#
#  Foreign keys for table tb_user_tb_usergroup
#

ALTER TABLE `tb_user_tb_usergroup`
ADD CONSTRAINT `FK97C7C1669CF4C078` FOREIGN KEY (`userGroupEntity_id`) REFERENCES `tb_usergroup` (`id`),
ADD CONSTRAINT `FK97C7C166E63B0FEE` FOREIGN KEY (`tb_user_id`) REFERENCES `tb_user` (`id`);

#
#  Foreign keys for table tb_usergroup_tb_sys_menu
#

ALTER TABLE `tb_usergroup_tb_sys_menu`
ADD CONSTRAINT `FKC1F0C106933EABF0` FOREIGN KEY (`menSysMenuEntities_id`) REFERENCES `tb_sys_menu` (`id`),
ADD CONSTRAINT `FKC1F0C106F81A326C` FOREIGN KEY (`tb_usergroup_id`) REFERENCES `tb_usergroup` (`id`);


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

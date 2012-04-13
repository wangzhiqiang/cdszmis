# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: cdszmis
# ------------------------------------------------------
# Server version 5.1.51-community

DROP DATABASE IF EXISTS `cdszmis`;
CREATE DATABASE `cdszmis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cdszmis`;

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
  `departphonenumber` varchar(20) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_depart
#

/*!40000 ALTER TABLE `tb_depart` DISABLE KEYS */;
INSERT INTO `tb_depart` VALUES (2,NULL,'研发部','啊是地方','王志强','15680769721','serta',0);
INSERT INTO `tb_depart` VALUES (3,NULL,'人事部','阿呆沙发','实施','123455678','啊所发生',0);
/*!40000 ALTER TABLE `tb_depart` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tb_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_files` ENABLE KEYS */;

#
# Source for table tb_prijectdepartarrangement
#

DROP TABLE IF EXISTS `tb_prijectdepartarrangement`;
CREATE TABLE `tb_prijectdepartarrangement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargeperson` varchar(255) DEFAULT NULL,
  `projectid` int(11) NOT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88074194CCA70315` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_prijectdepartarrangement
#

/*!40000 ALTER TABLE `tb_prijectdepartarrangement` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prijectdepartarrangement` ENABLE KEYS */;

#
# Source for table tb_prijectstatus
#

DROP TABLE IF EXISTS `tb_prijectstatus`;
CREATE TABLE `tb_prijectstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `projectid` int(11) NOT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `projectEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDA3E7BB45442F5F8` (`projectEntity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_prijectstatus
#

/*!40000 ALTER TABLE `tb_prijectstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prijectstatus` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_project
#

/*!40000 ALTER TABLE `tb_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_project` ENABLE KEYS */;

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
  `projectid` int(11) NOT NULL,
  `publicationdate` datetime DEFAULT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  `signdate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7E5413C2CCA70315` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_projectarrangement
#

/*!40000 ALTER TABLE `tb_projectarrangement` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_projectarrangement` ENABLE KEYS */;

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
  `projectid` int(11) NOT NULL,
  `reportdate` datetime DEFAULT NULL,
  `reportperson` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57A91C60CCA70315` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_projectsubmit
#

/*!40000 ALTER TABLE `tb_projectsubmit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_projectsubmit` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_sys_menu
#

/*!40000 ALTER TABLE `tb_sys_menu` DISABLE KEYS */;
INSERT INTO `tb_sys_menu` VALUES (1,'','系统管理系统',0,'');
INSERT INTO `tb_sys_menu` VALUES (2,NULL,'文件办理系统',0,NULL);
INSERT INTO `tb_sys_menu` VALUES (3,NULL,'任务管理系统',0,NULL);
INSERT INTO `tb_sys_menu` VALUES (4,NULL,'部门管理',1,NULL);
INSERT INTO `tb_sys_menu` VALUES (5,NULL,'用户管理',1,NULL);
INSERT INTO `tb_sys_menu` VALUES (6,NULL,'用户组管理',1,NULL);
INSERT INTO `tb_sys_menu` VALUES (7,NULL,'系统配置',1,NULL);
INSERT INTO `tb_sys_menu` VALUES (8,NULL,'办理人员配置',2,NULL);
INSERT INTO `tb_sys_menu` VALUES (9,NULL,'意见模板',2,NULL);
INSERT INTO `tb_sys_menu` VALUES (10,NULL,'任务进度管理',3,NULL);
INSERT INTO `tb_sys_menu` VALUES (11,NULL,'任务查询管理',3,NULL);
INSERT INTO `tb_sys_menu` VALUES (12,NULL,'任务统计管理',3,NULL);
INSERT INTO `tb_sys_menu` VALUES (13,NULL,'部门信息维护',4,'/depart/depart_departmanager');
INSERT INTO `tb_sys_menu` VALUES (14,NULL,'部门信息查询',4,'/depart/depart_findallDepart');
INSERT INTO `tb_sys_menu` VALUES (15,NULL,'用户注销',5,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (16,NULL,'用户信息查询',5,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (17,NULL,'用户人事管理',5,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (18,NULL,'用户权限分配',5,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (19,NULL,'用户信息维护',5,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (20,NULL,'用户分配',6,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (21,NULL,'权限分配',6,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (22,NULL,'用户组信息维护',6,'/usergroup/group_groupManager');
INSERT INTO `tb_sys_menu` VALUES (23,NULL,'职务管理',7,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (24,NULL,'职称管理',7,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (25,NULL,'办理人员列表',8,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (26,NULL,'审批人员列表',8,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (27,NULL,'抄送人员列表',8,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (28,NULL,'办理意见模板',9,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (29,NULL,'审批意见模板',9,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (30,NULL,'抄送意见模板',9,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (31,NULL,'取消意见模板',9,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (32,NULL,'办理完成意见模板',9,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (33,NULL,'项目登记',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (34,NULL,'分派项目',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (35,NULL,'所级安排',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (36,NULL,'项目实施',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (37,NULL,'总工审查',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (38,NULL,'签字出图',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (39,NULL,'出版发行',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (40,NULL,'发行收费',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (41,NULL,'归档',10,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (42,NULL,'项目状态查询',11,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (43,NULL,'项目进度查询',11,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (44,NULL,'项目详细信息查询',11,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (45,NULL,'按部门统计',12,'${rooturl}/');
INSERT INTO `tb_sys_menu` VALUES (46,NULL,'用户注册',5,'/user/user_userRegister');
/*!40000 ALTER TABLE `tb_sys_menu` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tb_sysdictionary` DISABLE KEYS */;
INSERT INTO `tb_sysdictionary` VALUES (1,'2011-03-11','院长','职务字典','position_01',0);
INSERT INTO `tb_sysdictionary` VALUES (2,'2011-03-11','书记','职务字典','position_02',0);
INSERT INTO `tb_sysdictionary` VALUES (3,'2011-03-11','副院长','职务字典','position_03',0);
INSERT INTO `tb_sysdictionary` VALUES (4,'2011-03-11','总工程师','职务字典','position_04',0);
INSERT INTO `tb_sysdictionary` VALUES (5,'2011-03-11','主任','职务字典','position_05',0);
INSERT INTO `tb_sysdictionary` VALUES (6,'2011-03-11','所长','职务字典','position_06',0);
INSERT INTO `tb_sysdictionary` VALUES (7,'2011-03-11','会计','职称字典','titles_01',0);
INSERT INTO `tb_sysdictionary` VALUES (8,'2011-03-11','工程师','职称字典','titles_02',0);
/*!40000 ALTER TABLE `tb_sysdictionary` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tb_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_templates` ENABLE KEYS */;

#
# Source for table tb_user
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `usname` varchar(255) DEFAULT NULL,
  `uspass` varchar(255) DEFAULT NULL,
  `uspositions` varchar(255) DEFAULT NULL,
  `ustitles` varchar(255) DEFAULT NULL,
  `departmentEntity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA4FF6AFCF2DEE75C` (`departmentEntity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_user
#

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,NULL,NULL,NULL,'admin',0,'admin','418296719726',NULL,NULL,NULL);
INSERT INTO `tb_user` VALUES (2,NULL,NULL,NULL,'123',0,'123','3224115',NULL,NULL,2);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tb_user_tb_usergroup` DISABLE KEYS */;
INSERT INTO `tb_user_tb_usergroup` VALUES (1,1);
INSERT INTO `tb_user_tb_usergroup` VALUES (1,2);
INSERT INTO `tb_user_tb_usergroup` VALUES (2,2);
/*!40000 ALTER TABLE `tb_user_tb_usergroup` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_usergroup
#

/*!40000 ALTER TABLE `tb_usergroup` DISABLE KEYS */;
INSERT INTO `tb_usergroup` VALUES (1,NULL,'admin','/');
INSERT INTO `tb_usergroup` VALUES (2,NULL,'kai','/group');
INSERT INTO `tb_usergroup` VALUES (6,NULL,'123','123');
/*!40000 ALTER TABLE `tb_usergroup` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `tb_usergroup_tb_sys_menu` DISABLE KEYS */;
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,2);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,3);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,7);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,8);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (1,9);
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
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,2);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,12);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,13);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,14);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (2,15);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,1);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,4);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,5);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,6);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,13);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,14);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,15);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,16);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,18);
INSERT INTO `tb_usergroup_tb_sys_menu` VALUES (6,19);
/*!40000 ALTER TABLE `tb_usergroup_tb_sys_menu` ENABLE KEYS */;

#
#  Foreign keys for table tb_prijectdepartarrangement
#

ALTER TABLE `tb_prijectdepartarrangement`
ADD CONSTRAINT `FK88074194CCA70315` FOREIGN KEY (`id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_prijectstatus
#

ALTER TABLE `tb_prijectstatus`
ADD CONSTRAINT `FKDA3E7BB45442F5F8` FOREIGN KEY (`projectEntity_id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_projectarrangement
#

ALTER TABLE `tb_projectarrangement`
ADD CONSTRAINT `FK7E5413C2CCA70315` FOREIGN KEY (`id`) REFERENCES `tb_project` (`id`);

#
#  Foreign keys for table tb_projectsubmit
#

ALTER TABLE `tb_projectsubmit`
ADD CONSTRAINT `FK57A91C60CCA70315` FOREIGN KEY (`id`) REFERENCES `tb_project` (`id`);

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


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

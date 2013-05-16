/*
SQLyog Trial v9.63 
MySQL - 5.5.27 : Database - vcms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vcms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `vcms`;

/*Table structure for table `dir_article` */

DROP TABLE IF EXISTS `dir_article`;

CREATE TABLE `dir_article` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dir_article` */

insert  into `dir_article`(`did`,`name`,`name_alias`,`parent`,`children`,`status`) values (0,'root','root',0,'',0);

/*Table structure for table `dir_info` */

DROP TABLE IF EXISTS `dir_info`;

CREATE TABLE `dir_info` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `children` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dir_info` */

insert  into `dir_info`(`did`,`name`,`name_alias`,`parent`,`children`,`status`) values (0,'root','root',0,'7,8,14',0),(7,'sub2','sub_alias',0,'9,10,11',0),(8,'sub2','sub_alias',0,'12',0),(9,'sub3','sub3_alias',7,'',0),(10,'sub4','sub4_alias',7,'13,16',0),(11,'sub4','sub4_alias',7,'',0),(12,'longzhou','lz',8,'',0),(13,'longzhou2','lz2',10,'17',0),(14,'sub3','sb3',0,'15',0),(15,'longzhou3','lz3',14,'',0),(16,'longzhou4','lz4',10,'',0),(17,'hi_little_longzhou','hi_l_lz',13,'',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

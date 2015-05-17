/*
SQLyog Community Edition- MySQL GUI v7.14 
MySQL - 5.1.67-0ubuntu0.10.04.1 : Database - majordomo_devel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`majordomo_devel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `majordomo_devel`;

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL DEFAULT '',
  `LOGIN` varchar(100) NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) NOT NULL DEFAULT '',
  `EMAIL` varchar(100) NOT NULL DEFAULT '',
  `COMMENTS` text,
  `ACCESS` text,
  `PRIVATE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EMAIL_ORDERS` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EMAIL_INVENTORY` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users` */

insert  into `admin_users`(`ID`,`NAME`,`LOGIN`,`PASSWORD`,`EMAIL`,`COMMENTS`,`ACCESS`,`PRIVATE`,`EMAIL_ORDERS`,`EMAIL_INVENTORY`) values (1,'Administrator','admin','21232f297a57a5a743894a0e4a801fc3','webmaster@domain.com','','control_modules,device,control_access,master,cms_docs,news,statistic,newsletter,backup,edit_templates,newslist,saverestore,skins,settings,dateselect,thumb,footercode,holdingpage,dashboard,events,users,terminals,mediabrowser,player,commands,classes,history,locations,methods,properties,objects,pvalues,shoutbox,shoutrooms,jobs,btdevices,weather,usbdevices,app_mediabrowser,app_products,app_tdwiki,app_weather,layouts,scripts,rss_channels,languages,pinghosts,watchfolders,app_player,app_gpstrack,webvars,patterns,onewire,app_calendar,xray,scheduled_job',0,0,0);

/*Table structure for table `app_quotes` */

DROP TABLE IF EXISTS `app_quotes`;

CREATE TABLE `app_quotes` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BODY` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `app_quotes` */

insert  into `app_quotes`(`ID`,`BODY`) values (1,'Tets');

/*Table structure for table `btdevices` */

DROP TABLE IF EXISTS `btdevices`;

CREATE TABLE `btdevices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `MAC` varchar(255) NOT NULL DEFAULT '',
  `LOG` text NOT NULL,
  `LAST_FOUND` datetime DEFAULT NULL,
  `FIRST_FOUND` datetime DEFAULT NULL,
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `btdevices` */

/*Table structure for table `calendar_categories` */

DROP TABLE IF EXISTS `calendar_categories`;

CREATE TABLE `calendar_categories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `ACTIVE` int(255) NOT NULL DEFAULT '0',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `ICON` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `calendar_categories` */

/*Table structure for table `calendar_events` */

DROP TABLE IF EXISTS `calendar_events`;

CREATE TABLE `calendar_events` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `SYSTEM` varchar(255) NOT NULL DEFAULT '',
  `NOTES` text,
  `DUE` date DEFAULT NULL,
  `ADDED` datetime DEFAULT NULL,
  `DONE_WHEN` datetime DEFAULT NULL,
  `IS_TASK` int(3) NOT NULL DEFAULT '0',
  `IS_DONE` int(3) NOT NULL DEFAULT '0',
  `IS_NODATE` int(3) NOT NULL DEFAULT '0',
  `IS_REPEATING` int(3) NOT NULL DEFAULT '0',
  `REPEAT_TYPE` int(3) NOT NULL DEFAULT '0',
  `WEEK_DAYS` varchar(255) NOT NULL DEFAULT '',
  `IS_REPEATING_AFTER` int(3) NOT NULL DEFAULT '0',
  `REPEAT_IN` int(10) NOT NULL DEFAULT '0',
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  `CALENDAR_CATEGORY_ID` int(10) NOT NULL DEFAULT '0',
  `DONE_SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `DONE_CODE` text,
  `LOG` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `calendar_events` */

insert  into `calendar_events`(`ID`,`TITLE`,`SYSTEM`,`NOTES`,`DUE`,`ADDED`,`DONE_WHEN`,`IS_TASK`,`IS_DONE`,`IS_NODATE`,`IS_REPEATING`,`REPEAT_TYPE`,`WEEK_DAYS`,`IS_REPEATING_AFTER`,`REPEAT_IN`,`USER_ID`,`LOCATION_ID`,`CALENDAR_CATEGORY_ID`,`DONE_SCRIPT_ID`,`DONE_CODE`,`LOG`) values (1,'123123123','','qweqwe','2013-08-20','2013-08-20 20:57:23','0000-00-00 00:00:00',1,0,0,0,1,'',0,3,0,0,0,0,'','');

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PARENT_ID` int(10) NOT NULL DEFAULT '0',
  `SUB_LIST` text,
  `PARENT_LIST` text,
  `NOLOG` int(3) NOT NULL DEFAULT '0',
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `PARENT_ID` (`PARENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (12,'Skype',0,'12','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (19,'tempSensors',0,'19','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (7,'Timer',0,'7','0',1,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (18,'BlueToothDevice',0,'18','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (9,'USBDevice',0,'9','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (10,'Computer',0,'10','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (20,'WeatherStations',0,'20','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (21,'systemStates',0,'21','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (22,'keySensors',0,'23','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (23,'inhouseMovementSensors',22,'23','22',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (24,'OperationalModes',0,'24','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (25,'Rooms',0,'25','0',0,'');
insert  into `classes`(`ID`,`TITLE`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`NOLOG`,`DESCRIPTION`) values (26,'Relays',0,'26','0',0,'');

/*Table structure for table `collections` */

DROP TABLE IF EXISTS `collections`;

CREATE TABLE `collections` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PATH` varchar(255) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `collections` */

/*Table structure for table `commands` */

DROP TABLE IF EXISTS `commands`;

CREATE TABLE `commands` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `COMMAND` varchar(255) NOT NULL DEFAULT '',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `WIDTH` int(10) NOT NULL DEFAULT '0',
  `HEIGHT` int(10) NOT NULL DEFAULT '0',
  `PARENT_ID` int(10) NOT NULL DEFAULT '0',
  `SUB_LIST` text,
  `PARENT_LIST` text,
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `WINDOW` varchar(255) NOT NULL DEFAULT '',
  `AUTOSTART` int(3) NOT NULL DEFAULT '0',
  `TYPE` char(50) NOT NULL DEFAULT '',
  `MIN_VALUE` int(10) NOT NULL DEFAULT '0',
  `MAX_VALUE` int(10) NOT NULL DEFAULT '0',
  `CUR_VALUE` varchar(255) NOT NULL DEFAULT '',
  `STEP_VALUE` int(10) NOT NULL DEFAULT '0',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `ONCHANGE_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `ONCHANGE_METHOD` varchar(255) NOT NULL DEFAULT '',
  `ICON` varchar(50) NOT NULL DEFAULT '',
  `DATA` text,
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `AUTO_UPDATE` int(10) NOT NULL DEFAULT '0',
  `CODE` text,
  `SYSTEM` varchar(255) NOT NULL DEFAULT '',
  `EXT_ID` int(10) NOT NULL DEFAULT '0',
  `VISIBLE_DELAY` int(10) NOT NULL DEFAULT '0',
  `INLINE` int(3) NOT NULL DEFAULT '0',
  `SUB_PRELOAD` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Data for the table `commands` */

insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (1,'<#LANG_APP_MEDIA_BROWSER#>','','',0,0,0,'2,3','0',6000,'',0,'',0,0,'0',0,'','','','','1_iPhone_MUSIC_5_sm.png','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (2,'Browse','','/popup/mediabrowse.html',600,500,1,'2','1',100,'mediaBrowser',0,'url',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (3,'Player control','','',0,0,1,'3','1',90,'',0,'custom',0,0,'0',0,'','','','','','[#module name=\"app_player\" mode=\"menu\"#]',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (75,'Module','','',0,0,86,'75','86',0,'',0,'custom',0,0,'0',0,'','','','','','[#module name=\"layouts\"#]',0,60,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (11,'<#LANG_GENERAL_SECURITY_CAMERA#>','','',0,0,0,'81','0',5000,'',0,'',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (82,'<#LANG_GENERAL_EVENTS_LOG#>','','',0,0,0,'82','0',10,'',0,'label',0,0,'',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (63,'%ClockChime.time%','','',0,0,66,'63','66',10000,'',0,'custom',0,0,'0',0,'','','','','','%ClockChime.time%<br>\r\nhello! <a href=\"/test\">test</a>',0,60,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (66,'Demo controls','','',0,0,0,'63,67,68,69,70,71,72,73,77,78,80,98,99,100,101,102,103,104','0',0,'',0,'',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (67,'<#LANG_LABEL#>','','',0,0,66,'67','66',9000,'',0,'label',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (68,'New window','','http://192.168.1.120:85/Hc/demos/highcharts/column_and_bar/basic_bar.php',600,600,66,'68','66',8000,'12',0,'window',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (69,'<#LANG_URL#>','','http://google.com/',0,0,66,'69','66',7000,'',0,'url',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (70,'Buttons','','',0,0,66,'70','66',6000,'',0,'button',0,0,'clicked',0,'','','','','','',0,0,'say(\"Привет\");','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (71,'<#LANG_ON_OFF_SWITCH#>','','',0,0,66,'71','66',5000,'',0,'switch',0,0,'0',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (72,'Select box','','',0,0,66,'72','66',4000,'',0,'selectbox',0,0,'2',0,'','','','','','1|Item 1\r\n2|Item 2\r\n3|Item 3',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (73,'Plus minus box','','',0,0,66,'73','66',3000,'',0,'plusminus',0,5,'5',1,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (74,'<#LANG_GENERAL_EVENTS_LOG#> (code)','','',0,0,0,'74','0',9,'',0,'custom',0,0,'0',0,'','','','','','<div style=\"text-shadow:none;font-weight:normal;\">[#module name=\"shoutbox\" limit=\"10\" reverse=\"1\" mobile=\"1\"#]</div>',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (77,'Alarm time','','',0,0,66,'77','66',0,'',0,'timebox',0,0,'09:30',0,'ThisComputer','AlarmTime','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (78,'<#LANG_TEXT_BOX#>','','',0,0,66,'78','66',0,'',0,'textbox',0,0,'0',0,'ThisComputer','textBoxTest','','','','',0,10,'','',0,0,1,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (80,'<#LANG_SLIDER_BOX#>','','',0,0,66,'80','66',0,'',0,'sliderbox',0,10,'0',1,'ThisComputer','textBoxTest','','','','',0,5,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (81,'Web-cam','','',0,0,11,'81','11',0,'',0,'custom',0,0,'',0,'','','','','','<p align=\"center\"><img src=\"http://abclocal.go.com/three/wabc/webcam/skycpk.jpg\" width=\"270\">\r\n<br/><br/>\r\n<img src=\"http://213.179.245.12/axis-cgi/mjpg/video.cgi?resolution=352x288&dummy=1340376440935\" width=\"270\">\r\n\r\n</p>',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (86,'<#LANG_GENERAL_SERVICE#>','','',0,0,0,'75','0',2,'',0,'',0,0,'',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (87,'<#LANG_GENERAL_OPERATIONAL_MODES#>','','',0,0,0,'88,89,90,94','0',10000,'',0,'',0,0,'',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (88,'<#LANG_GENERAL_SECURITY_MODE#>','','',0,0,87,'88','87',100,'',0,'switch',0,0,'0',0,'ThisComputer','securityMode','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (89,'<#LANG_GENERAL_NOBODYS_HOME_MODE#>','','',0,0,87,'89','87',90,'',0,'switch',0,0,'0',0,'ThisComputer','nobodyHome','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (90,'<#LANG_GENERAL_WE_HAVE_GUESTS_MODE#>','','',0,0,87,'90','87',80,'',0,'switch',0,0,'1',0,'ThisComputer','WeHaveGuests','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (91,'<#LANG_GENERAL_CLIMATE#> (%TempOutside%°C)','','',0,0,0,'92,93,95,96','0',8000,'',0,'',0,0,'',0,'','','','','','',0,60,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (92,'<#LANG_GENERAL_WEATHER_FORECAST#> (code)','','',0,0,91,'92','91',1000,'',0,'custom',0,0,'',0,'','','','','','%ThisComputer.weatherFull%',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (93,'<#LANG_GENERAL_WEATHER_FORECAST#>','','',0,0,91,'93','91',1001,'',0,'label',0,0,'',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (94,'<#LANG_GENERAL_ENERGY_SAVING_MODE#>','','',0,0,87,'94','87',110,'',0,'switch',0,0,'0',0,'ThisComputer','Econom','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (95,'<#LANG_GENERAL_GRAPHICS#> (48h) (code)','','',0,0,91,'95','91',900,'',0,'custom',0,0,'',0,'','','','','','<img src=\"http://192.168.1.120:85/Hc/graph/getGraph.php?obj=ThisComputer&property=1w_temp&graphType=1&aggregationType=2\">',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (96,'<#LANG_GENERAL_GRAPHICS#> (48h)','','',0,0,91,'96','91',901,'',0,'label',0,0,'',0,'','','','','','',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (97,'State','','',0,0,0,'97','0',100010,'',0,'custom',0,0,'',0,'','','','','','<big style=\"font-size:24px\">18</big>\r\n\r\n<img src=\"/img/icons/status/lock_32_%Security.stateColor%.png\" align=\"absmiddle\"> %Security.stateDetails%\r\n<img src=\"/img/icons/status/system_32_%System.stateColor%.png\" align=\"absmiddle\"> %System.stateDetails%\r\n<img src=\"/img/icons/status/network_32_%Communication.stateColor%.png\" align=\"absmiddle\"> %Communication.stateDetails%',0,10,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (98,'1234','','',0,0,66,'98','66',0,'',0,'sliderbox',0,5,'0',1,'','','','','',NULL,0,10,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (99,'4444','','http://192.168.1.120:85/Hc/graph/getGraph.php?obj=ThisComputer&property=d_on&graphType=1&aggregationType=0&dateStart=2013-12-30',0,0,66,'99','66',0,'',0,'url',0,0,'',0,'','','','','',NULL,0,0,NULL,'',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (100,'ТП1','','',0,0,66,'101,102,103,104','66',0,'',0,'',0,0,'',0,'','','','','',NULL,0,0,NULL,'',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (101,'Температура','','',0,0,100,'101','66,100',30,'',0,'custom',0,0,'',0,'','','','','','<big style=\"font-size:24px\">Темппература: %ThisComputer.d_on%</big>',0,0,'','',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (102,'Установить','','',0,0,100,'102','66,100',20,'',0,'sliderbox',0,35,'16',1,'ThisComputer','d_on','','','',NULL,0,0,'','',0,0,1,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (103,'Гр','','http://192.168.1.120:85/Hc/graph/getGraph.php?obj=ThisComputer&property=1w_temp&graphType=1&aggregationType=3',800,600,100,'103','66,100',10,'tt1',0,'window',0,0,'',0,'','','','','',NULL,0,0,NULL,'',0,0,0,0);
insert  into `commands`(`ID`,`TITLE`,`COMMAND`,`URL`,`WIDTH`,`HEIGHT`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`,`PRIORITY`,`WINDOW`,`AUTOSTART`,`TYPE`,`MIN_VALUE`,`MAX_VALUE`,`CUR_VALUE`,`STEP_VALUE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`ONCHANGE_OBJECT`,`ONCHANGE_METHOD`,`ICON`,`DATA`,`SCRIPT_ID`,`AUTO_UPDATE`,`CODE`,`SYSTEM`,`EXT_ID`,`VISIBLE_DELAY`,`INLINE`,`SUB_PRELOAD`) values (104,'1234','','http://192.168.1.120:85/Hc/graph/getGraph.php?obj=ThisComputer&property=1w_temp&graphType=1&aggregationType=2',0,0,100,'104','66,100',0,'tt',0,'window',0,0,'',0,'','','','','',NULL,0,0,NULL,'',0,0,0,0);

/*Table structure for table `device_plugin` */

DROP TABLE IF EXISTS `device_plugin`;

CREATE TABLE `device_plugin` (
  `device_plugin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`device_plugin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `device_plugin` */

insert  into `device_plugin`(`device_plugin_id`,`name`,`title`) values (1,'plugin_example','');
insert  into `device_plugin`(`device_plugin_id`,`name`,`title`) values (2,'thermo_for_tp','');

/*Table structure for table `device_plugin_job` */

DROP TABLE IF EXISTS `device_plugin_job`;

CREATE TABLE `device_plugin_job` (
  `device_plugin_job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL,
  `command` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `val` varchar(255) NOT NULL,
  `run_at` datetime DEFAULT NULL,
  `ret_object_name` varchar(255) NOT NULL DEFAULT '',
  `ret_object_property` varchar(255) NOT NULL DEFAULT '',
  `start_execute_at` datetime DEFAULT NULL,
  `executed_at` datetime DEFAULT NULL,
  `result` text,
  `result_status` varchar(255) NOT NULL,
  PRIMARY KEY (`device_plugin_job_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `device_plugin_job` */

insert  into `device_plugin_job`(`device_plugin_job_id`,`device_id`,`command`,`port`,`val`,`run_at`,`ret_object_name`,`ret_object_property`,`start_execute_at`,`executed_at`,`result`,`result_status`) values (1,1,'SetPortVal','2','3','2013-10-04 19:11:04','ThisComputer','123','2013-10-04 19:12:39','2013-10-04 19:12:39','html><body><h1>It works!</h1>\n<p>This is','done');
insert  into `device_plugin_job`(`device_plugin_job_id`,`device_id`,`command`,`port`,`val`,`run_at`,`ret_object_name`,`ret_object_property`,`start_execute_at`,`executed_at`,`result`,`result_status`) values (2,1,'SetPortVal','2','3','2013-10-04 19:19:59','ThisComputer','123','2013-10-04 19:20:16','2013-10-04 19:20:16','html><body><h1>It works!</h1>\n<p>This is','done');
insert  into `device_plugin_job`(`device_plugin_job_id`,`device_id`,`command`,`port`,`val`,`run_at`,`ret_object_name`,`ret_object_property`,`start_execute_at`,`executed_at`,`result`,`result_status`) values (3,1,'SetPortVal','2','3','2013-10-04 19:20:57','ThisComputer','123','2013-10-04 19:21:14','2013-10-04 19:21:14','html><body><h1>It works!</h1>\n<p>This is','done');
insert  into `device_plugin_job`(`device_plugin_job_id`,`device_id`,`command`,`port`,`val`,`run_at`,`ret_object_name`,`ret_object_property`,`start_execute_at`,`executed_at`,`result`,`result_status`) values (4,1,'SetPortVal','2','3','2013-10-04 19:21:47','ThisComputer','123','2013-10-04 19:28:44','2013-10-04 19:28:44','html><body><h1>It works!</h1>\n<p>This is','done');

/*Table structure for table `device_properties` */

DROP TABLE IF EXISTS `device_properties`;

CREATE TABLE `device_properties` (
  `property_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sysname` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `check_latest` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `linked_object` varchar(255) NOT NULL DEFAULT '',
  `linked_property` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`property_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `device_properties` */

insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (1,1,'p1','',NULL,NULL,'','','p1');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (2,1,'p2','',NULL,NULL,'','','p2');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (3,1,'1','',NULL,NULL,'','','1');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (4,1,'2','1',NULL,'2013-10-19 16:16:32','Relay1','status','2');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (5,1,'3','',NULL,NULL,'','','3');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (6,1,'4','',NULL,NULL,'','','4');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (7,1,'5','',NULL,NULL,'','','5');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (8,1,'6','',NULL,NULL,'','','6');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (9,1,'7','',NULL,NULL,'','','7');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (10,1,'8','',NULL,NULL,'','','8');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (11,1,'9','',NULL,NULL,'','','9');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (12,1,'10','905',NULL,'2013-10-19 16:16:32','','','10');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (13,1,'11','',NULL,NULL,'','','11');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (14,1,'12','',NULL,NULL,'','','12');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (15,2,'NeedTemp','12',NULL,'2014-01-12 11:58:11','','','NeedTemp');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (16,2,'RealTemp','27',NULL,'2014-01-12 11:58:11','','','RealTemp');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (17,2,'RealAirTemp','120',NULL,'2014-01-12 11:58:11','','','RealAirTemp');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (18,2,'WorkState','20',NULL,'2014-01-12 11:58:11','','','WorkState');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (19,2,'IP','192.168.1.31',NULL,'2014-01-12 11:58:11','','','IP');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (20,2,'MaxReleWorkTimeCount','1500',NULL,'2014-01-12 11:58:11','','','MaxReleWorkTimeCount');
insert  into `device_properties`(`property_id`,`device_id`,`sysname`,`value`,`check_latest`,`updated`,`linked_object`,`linked_property`,`path`) values (21,2,'TempGisteresis','4',NULL,'2014-01-12 11:58:11','','','TempGisteresis');

/*Table structure for table `devices` */

DROP TABLE IF EXISTS `devices`;

CREATE TABLE `devices` (
  `device_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `raw_id` varchar(255) NOT NULL,
  `device_plugin_id` int(11) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '0',
  `check_latest` datetime DEFAULT NULL,
  `check_next` datetime DEFAULT NULL,
  `script_id` int(10) NOT NULL DEFAULT '0',
  `code` text,
  `online_interval` int(10) NOT NULL DEFAULT '0',
  `log` text,
  PRIMARY KEY (`device_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `devices` */

insert  into `devices`(`device_id`,`title`,`raw_id`,`device_plugin_id`,`status`,`check_latest`,`check_next`,`script_id`,`code`,`online_interval`,`log`) values (1,'dev1','192.168.1.44',1,0,'2014-01-09 22:58:56','2014-01-09 22:58:56',0,'',0,NULL);
insert  into `devices`(`device_id`,`title`,`raw_id`,`device_plugin_id`,`status`,`check_latest`,`check_next`,`script_id`,`code`,`online_interval`,`log`) values (2,'d1','192.168.1.31',2,1,'2014-01-12 11:58:11','2014-01-12 11:58:21',0,'',10,NULL);

/*Table structure for table `elements` */

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SCENE_ID` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `TYPE` varchar(255) NOT NULL DEFAULT '',
  `TOP` int(10) NOT NULL DEFAULT '0',
  `LEFT` int(255) NOT NULL DEFAULT '0',
  `WIDTH` int(255) NOT NULL DEFAULT '0',
  `HEIGHT` int(255) NOT NULL DEFAULT '0',
  `CROSS_SCENE` int(3) NOT NULL DEFAULT '0',
  `BACKGROUND` int(3) NOT NULL DEFAULT '1',
  `JAVASCRIPT` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `elements` */

insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (7,2,'аааа','img',11,11,10,10,0,0,'');
insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (2,2,'Time','html',10,10,300,20,0,1,NULL);
insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (6,1,'123123','img',155,419,0,0,0,1,'');
insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (8,1,'1231231','img',203,459,0,0,0,1,'');
insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (9,1,'t1','img',123,123,0,0,0,1,NULL);
insert  into `elements`(`ID`,`SCENE_ID`,`TITLE`,`TYPE`,`TOP`,`LEFT`,`WIDTH`,`HEIGHT`,`CROSS_SCENE`,`BACKGROUND`,`JAVASCRIPT`) values (10,1,'00001','img',335,420,0,0,0,1,NULL);

/*Table structure for table `elm_states` */

DROP TABLE IF EXISTS `elm_states`;

CREATE TABLE `elm_states` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ELEMENT_ID` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `IMAGE` varchar(255) NOT NULL DEFAULT '',
  `HTML` text,
  `IS_DYNAMIC` int(3) NOT NULL DEFAULT '0',
  `CURRENT_STATE` int(3) NOT NULL DEFAULT '0',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `CONDITION` int(3) NOT NULL DEFAULT '0',
  `CONDITION_VALUE` varchar(255) NOT NULL DEFAULT '',
  `CONDITION_ADVANCED` text,
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `SWITCH_SCENE` int(3) NOT NULL DEFAULT '0',
  `CURRENT_STATUS` int(3) NOT NULL DEFAULT '0',
  `ACTION_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `ACTION_METHOD` varchar(255) NOT NULL DEFAULT '',
  `MENU_ITEM_ID` int(10) NOT NULL DEFAULT '0',
  `WINDOW_POSX` int(10) NOT NULL DEFAULT '0',
  `WINDOW_POSY` int(10) NOT NULL DEFAULT '0',
  `WINDOW_WIDTH` int(10) NOT NULL DEFAULT '0',
  `WINDOW_HEIGHT` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `elm_states` */

insert  into `elm_states`(`ID`,`ELEMENT_ID`,`TITLE`,`IMAGE`,`HTML`,`IS_DYNAMIC`,`CURRENT_STATE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CONDITION`,`CONDITION_VALUE`,`CONDITION_ADVANCED`,`SCRIPT_ID`,`SWITCH_SCENE`,`CURRENT_STATUS`,`ACTION_OBJECT`,`ACTION_METHOD`,`MENU_ITEM_ID`,`WINDOW_POSX`,`WINDOW_POSY`,`WINDOW_WIDTH`,`WINDOW_HEIGHT`) values (2,2,'Test','','<b>Sample element</b> %ClockChime.time%',2,1,'','',1,'','$t=rand(0,1);\r\nif ($t) {\r\n $display=1;\r\n}',0,0,0,'','',0,0,0,0,0);
insert  into `elm_states`(`ID`,`ELEMENT_ID`,`TITLE`,`IMAGE`,`HTML`,`IS_DYNAMIC`,`CURRENT_STATE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CONDITION`,`CONDITION_VALUE`,`CONDITION_ADVANCED`,`SCRIPT_ID`,`SWITCH_SCENE`,`CURRENT_STATUS`,`ACTION_OBJECT`,`ACTION_METHOD`,`MENU_ITEM_ID`,`WINDOW_POSX`,`WINDOW_POSY`,`WINDOW_WIDTH`,`WINDOW_HEIGHT`) values (4,8,'sadada11','http://192.168.1.120:85/cms/scenes/elements/lightbulb/on.png',NULL,1,1,'Relay1','status',1,'1','',0,1,0,'Relay1','turnOff',0,0,0,0,0);
insert  into `elm_states`(`ID`,`ELEMENT_ID`,`TITLE`,`IMAGE`,`HTML`,`IS_DYNAMIC`,`CURRENT_STATE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CONDITION`,`CONDITION_VALUE`,`CONDITION_ADVANCED`,`SCRIPT_ID`,`SWITCH_SCENE`,`CURRENT_STATUS`,`ACTION_OBJECT`,`ACTION_METHOD`,`MENU_ITEM_ID`,`WINDOW_POSX`,`WINDOW_POSY`,`WINDOW_WIDTH`,`WINDOW_HEIGHT`) values (6,8,'qqqqq','http://192.168.1.120:85/cms/scenes/elements/lightbulb/off.png',NULL,1,0,'Relay1','status',1,'0','',0,0,0,'Relay1','turnOn',0,0,0,0,0);
insert  into `elm_states`(`ID`,`ELEMENT_ID`,`TITLE`,`IMAGE`,`HTML`,`IS_DYNAMIC`,`CURRENT_STATE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CONDITION`,`CONDITION_VALUE`,`CONDITION_ADVANCED`,`SCRIPT_ID`,`SWITCH_SCENE`,`CURRENT_STATUS`,`ACTION_OBJECT`,`ACTION_METHOD`,`MENU_ITEM_ID`,`WINDOW_POSX`,`WINDOW_POSY`,`WINDOW_WIDTH`,`WINDOW_HEIGHT`) values (8,10,'123123213','http://192.168.1.120:85/cms/scenes/elements/lightbulb/off.png',NULL,0,1,'','',1,'','',0,0,0,'','',100,-145,-3,500,500);
insert  into `elm_states`(`ID`,`ELEMENT_ID`,`TITLE`,`IMAGE`,`HTML`,`IS_DYNAMIC`,`CURRENT_STATE`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CONDITION`,`CONDITION_VALUE`,`CONDITION_ADVANCED`,`SCRIPT_ID`,`SWITCH_SCENE`,`CURRENT_STATUS`,`ACTION_OBJECT`,`ACTION_METHOD`,`MENU_ITEM_ID`,`WINDOW_POSX`,`WINDOW_POSY`,`WINDOW_WIDTH`,`WINDOW_HEIGHT`) values (7,9,'1s','http://192.168.1.120:85/cms/scenes/elements/lightbulb/456.gif',NULL,0,1,'','',1,'','',0,0,0,'','',0,0,0,0,0);

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EVENT_TYPE` varchar(10) NOT NULL DEFAULT '',
  `TERMINAL_FROM` varchar(255) NOT NULL DEFAULT '',
  `TERMINAL_TO` varchar(255) NOT NULL DEFAULT '',
  `USER_FROM` varchar(255) NOT NULL DEFAULT '',
  `USER_TO` varchar(255) NOT NULL DEFAULT '',
  `WINDOW` varchar(255) NOT NULL DEFAULT '',
  `DETAILS` text,
  `ADDED` datetime DEFAULT NULL,
  `EXPIRE` datetime DEFAULT NULL,
  `PROCESSED` int(3) NOT NULL DEFAULT '0',
  `EVENT_NAME` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `events` */

/*Table structure for table `gpsactions` */

DROP TABLE IF EXISTS `gpsactions`;

CREATE TABLE `gpsactions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `ACTION_TYPE` int(255) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `CODE` text,
  `LOG` text,
  `EXECUTED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `gpsactions` */

/*Table structure for table `gpsdevices` */

DROP TABLE IF EXISTS `gpsdevices`;

CREATE TABLE `gpsdevices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `LAT` varchar(255) NOT NULL DEFAULT '',
  `LON` varchar(255) NOT NULL DEFAULT '',
  `UPDATED` datetime DEFAULT NULL,
  `DEVICEID` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `gpsdevices` */

/*Table structure for table `gpslocations` */

DROP TABLE IF EXISTS `gpslocations`;

CREATE TABLE `gpslocations` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `LAT` float NOT NULL DEFAULT '0',
  `LON` float NOT NULL DEFAULT '0',
  `RANGE` float NOT NULL DEFAULT '0',
  `VIRTUAL_USER_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `gpslocations` */

/*Table structure for table `gpslog` */

DROP TABLE IF EXISTS `gpslog`;

CREATE TABLE `gpslog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ADDED` datetime DEFAULT NULL,
  `LAT` float NOT NULL DEFAULT '0',
  `LON` float NOT NULL DEFAULT '0',
  `ALT` float NOT NULL DEFAULT '0',
  `PROVIDER` varchar(30) NOT NULL DEFAULT '',
  `SPEED` float NOT NULL DEFAULT '0',
  `BATTLEVEL` int(3) NOT NULL DEFAULT '0',
  `CHARGING` int(3) NOT NULL DEFAULT '0',
  `DEVICEID` varchar(255) NOT NULL DEFAULT '',
  `DEVICE_ID` int(10) NOT NULL DEFAULT '0',
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  `ACCURACY` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DEVICE_ID` (`DEVICE_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `gpslog` */

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ADDED` datetime DEFAULT NULL,
  `OBJECT_ID` int(10) NOT NULL DEFAULT '0',
  `METHOD_ID` int(10) NOT NULL DEFAULT '0',
  `VALUE_ID` int(10) NOT NULL DEFAULT '0',
  `OLD_VALUE` varchar(255) NOT NULL DEFAULT '',
  `NEW_VALUE` varchar(255) NOT NULL DEFAULT '',
  `DETAILS` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `history` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `COMMANDS` text NOT NULL,
  `RUNTIME` datetime DEFAULT NULL,
  `EXPIRE` datetime DEFAULT NULL,
  `PROCESSED` int(3) NOT NULL DEFAULT '0',
  `STARTED` datetime DEFAULT NULL,
  `EXPIRED` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jobs` */

insert  into `jobs`(`ID`,`TITLE`,`COMMANDS`,`RUNTIME`,`EXPIRE`,`PROCESSED`,`STARTED`,`EXPIRED`) values (1,'testTimer','say(\"Hello world!\");','2013-08-25 16:33:03','2013-08-25 16:34:03',0,NULL,1);

/*Table structure for table `layouts` */

DROP TABLE IF EXISTS `layouts`;

CREATE TABLE `layouts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `TYPE` varchar(255) NOT NULL DEFAULT '',
  `CODE` text,
  `APP` varchar(255) NOT NULL DEFAULT '',
  `URL` char(255) NOT NULL DEFAULT '',
  `DETAILS` text,
  `REFRESH` int(10) NOT NULL DEFAULT '0',
  `ICON` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `layouts` */

insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (6,'<#LANG_APP_PRODUCTS#>',70,'app','','app_products','','',0,'');
insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (7,'<#LANG_MODULE_SCENES#>',550,'app','','scenes','','',0,'');
insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (8,'<#LANG_WELCOME_GREETING#>',1000,'html','<div style=\"padding-left:50px;padding-top:30px\">\r\n<h1><#LANG_WELCOME_GREETING#></h1>\r\n&nbsp;\r\n<p style=\"font-size:14px\">\r\n<#LANG_WELCOME_TEXT#>\r\n</p>\r\n</div>','','','',0,'');
insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (9,'<#LANG_APP_CALENDAR#>',100,'app','','app_calendar','','',0,'');
insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (10,'<#LANG_APP_MEDIA_BROWSER#>',200,'app','','app_mediabrowser','','',0,'');
insert  into `layouts`(`ID`,`TITLE`,`PRIORITY`,`TYPE`,`CODE`,`APP`,`URL`,`DETAILS`,`REFRESH`,`ICON`) values (12,'GPS',0,'app','','app_gpstrack','','',0,'');

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `locations` */

insert  into `locations`(`ID`,`TITLE`) values (1,'Office');

/*Table structure for table `media_favorites` */

DROP TABLE IF EXISTS `media_favorites`;

CREATE TABLE `media_favorites` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PATH` varchar(255) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `LIST_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `COLLECTION_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `media_favorites` */

/*Table structure for table `methods` */

DROP TABLE IF EXISTS `methods`;

CREATE TABLE `methods` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(10) NOT NULL DEFAULT '0',
  `CLASS_ID` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` text,
  `CODE` text,
  `CALL_PARENT` int(3) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `EXECUTED` datetime DEFAULT NULL,
  `EXECUTED_PARAMS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `OBJECT_ID` (`OBJECT_ID`),
  KEY `CLASS_ID` (`CLASS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `methods` */

insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (1,0,1,'KeyPressed','событие, возникающее при нажатии на кнопку','$this->setProperty(\"lastTimePressed\",time());',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (23,0,11,'say','','echo \"notify: \".utf2win($params[\'say\']).\"<br>\";\r\n$say=utf2win($params[\'say\']);\r\n$say=str_replace(\' \',\'..\',$say);\r\necho (\'\"c:\\\\program files\\\\Growl for windows\\\\growlnotify.com\" /t:Alice \'.$say.\'\');\r\nexec(\'\"c:\\\\program files\\\\Growl for windows\\\\growlnotify.com\" /t:Alice \'.$say.\'\');',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (14,0,7,'onNewMinute','','',0,0,'2013-08-09 14:25:00','a:4:{s:6:\"object\";s:10:\"ClockChime\";s:2:\"op\";s:1:\"m\";s:1:\"m\";s:11:\"onNewMinute\";s:21:\"ORIGINAL_OBJECT_TITLE\";s:10:\"ClockChime\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (15,0,7,'onNewHour','','',0,0,'2013-08-09 14:00:00','a:4:{s:6:\"object\";s:10:\"ClockChime\";s:2:\"op\";s:1:\"m\";s:1:\"m\";s:9:\"onNewHour\";s:21:\"ORIGINAL_OBJECT_TITLE\";s:10:\"ClockChime\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (16,0,9,'Connected','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (55,0,18,'Lost','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (18,6,0,'onNewMinute','','$h=(int)date(\'G\',time());\r\n$m=date(\'i\',time());\r\n\r\n\r\nif (isWeekDay()) {\r\n\r\n}\r\n\r\n\r\nif (($h>=8)) {\r\n if ($m==\"00\") {\r\n   say(timeNow());\r\n }\r\n}',1,0,'2013-08-09 14:25:00','a:3:{s:6:\"object\";s:10:\"ClockChime\";s:2:\"op\";s:1:\"m\";s:1:\"m\";s:11:\"onNewMinute\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (19,4,0,'Connected','','if ($params[\'serial\']==\'\' && $params[\'devname\']!=\'\') {\r\n $params[\'serial\']=$params[\'devname\'];\r\n}\r\n\r\n$device=SQLSelectOne(\"SELECT * FROM usbdevices WHERE SERIAL LIKE \'\".$params[\'serial\'].\"\'\");\r\nif (!$device[\'ID\']) {\r\n // new device connected\r\n //say(\"Подключено новое устройство\",1);\r\n $device=array();\r\n $device[\'SERIAL\']=$params[\'serial\'];\r\n $device[\'TITLE\']=\'устройство \'.$params[\'devname\'];\r\n $device[\'FIRST_FOUND\']=date(\'Y-m-d H:i:s\');\r\n $device[\'LAST_FOUND\']=date(\'Y-m-d H:i:s\');\r\n $device[\'LOG\'].=$device[\'FIRST_FOUND\'].\' подключено (впервые)\'.\"\\n\";\r\n $device[\'ID\']=SQLInsert(\'usbdevices\',$device);\r\n} else {\r\n // device already in our database\r\n //say(\"Подключено \".$device[\'TITLE\'],1);\r\n if ($device[\'USER_ID\']) {\r\n  $user=SQLSelectOne(\"SELECT * FROM users WHERE ID=\'\".$device[\'USER_ID\'].\"\'\");\r\n  if ($user[\'ID\']) {\r\n    //$user[\'NAME\']; // теперь мы знаем имя пользователя, связанного с этим устройством\r\n  }\r\n }\r\n $device[\'LAST_FOUND\']=date(\'Y-m-d H:i:s\');\r\n $device[\'LOG\']=$device[\'LAST_FOUND\'].\' подключено\'.\"\\n\".$device[\'LOG\'];\r\n SQLUpdate(\'usbdevices\',$device);\r\n if ($device[\'SCRIPT_ID\']!=\'\') {\r\n  runScript($device[\'SCRIPT_ID\'],$params);\r\n } elseif ($device[\'SCRIPT\']!=\'\') {\r\n  eval($device[\'SCRIPT\']);\r\n }\r\n}',1,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (20,0,10,'WakedUp','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (25,0,10,'onIdle','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (27,0,10,'StartUp','','',0,0,'2013-08-09 14:22:19','a:4:{s:6:\"object\";s:12:\"ThisComputer\";s:2:\"op\";s:1:\"m\";s:1:\"m\";s:7:\"StartUp\";s:21:\"ORIGINAL_OBJECT_TITLE\";s:12:\"ThisComputer\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (29,0,10,'commandReceived','получение новой команды','',0,0,'2013-09-29 12:15:43','a:2:{s:7:\"command\";s:3:\"111\";s:21:\"ORIGINAL_OBJECT_TITLE\";s:12:\"ThisComputer\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (30,7,0,'commandReceived','','$command=$params[\'command\'];\r\n\r\n$short_command=\'\';\r\n$dt=recognizeTime($command,$short_command);\r\n\r\nif (preg_match(\'/скажи сколько время/is\',$command)) {\r\n if ($dt>0) {\r\n  addScheduledJob(\"command\".$dt,\"processCommand(\'\".$short_command.\"\');\",$dt);\r\n  say(\'Задача принята\');\r\n  return;\r\n }\r\n global $voicemode;\r\n $voicemode=\'on\';\r\n say(\'Сейчас \'.timeNow());\r\n} elseif (preg_match(\'/сколько время/is\',$command)) {\r\n if ($dt>0) {\r\n  addScheduledJob(\"command\".$dt,\"processCommand(\'\".$short_command.\"\');\",$dt);\r\n  say(\'Задача принята\');\r\n  echo $short_command;\r\n  return;\r\n }\r\n say(\'Сейчас \'.timeNow());\r\n} elseif (preg_match(\'/повтори (.+)/is\',$command,$m) || preg_match(\'/скажи (.+)/is\',$command,$m)) {\r\n if ($dt>0) {\r\n  addScheduledJob(\"command\".$dt,\"processCommand(\'\".$short_command.\"\');\",$dt);\r\n  say(\'Задача принята\');\r\n  return;\r\n }\r\n global $voicemode;\r\n $voicemode=\'on\';\r\n say($m[1]);\r\n} else {\r\n say(\'Неизвестная команда...\');\r\n}',1,0,'2013-09-29 12:15:43','a:1:{s:7:\"command\";s:3:\"111\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (31,0,12,'onNewMessage','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (32,0,12,'onStatusChange','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (33,10,0,'onStatusChange',NULL,'echo \"status received: \".$params[\'status\'];',1,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (34,10,0,'onNewMessage','',' global $voicemode;\r\n $voicemode=\'off\';\r\n processCommand($params[\'message\']);',1,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (45,0,10,'powerConnected','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (46,0,10,'powerDisconnected','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (48,7,0,'powerDisconnected',NULL,'say(\"Отключено питание\");',1,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (54,0,18,'Found','','',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (56,13,0,'Found','','// new device\r\n\r\n$tm=registeredEventTime(\'btcall\'); \r\nif ((time()-$tm)>60 || $tm<0) {\r\n registerEvent(\'btcall\'); \r\n}\r\n\r\n\r\nif ($params[\'new\']) {\r\n //say(\'Обнаружено новое блютуз устройство\');\r\n}\r\nif ($params[\'user\']!=\'\') {\r\n //say($params[\'user\'].\' где-то рядом\');\r\n}',1,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (57,13,0,'Lost','','// device lost\r\n',1,1,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (59,0,21,'checkState','','	',0,0,'2015-05-15 23:03:57','a:1:{s:21:\"ORIGINAL_OBJECT_TITLE\";s:13:\"Communication\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (60,0,21,'stateChanged','','',0,0,'2014-01-09 23:04:53','a:2:{s:5:\"STATE\";s:3:\"red\";s:21:\"ORIGINAL_OBJECT_TITLE\";s:6:\"System\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (61,0,22,'statusChanged','','$this->setProperty(\'status\',$params[\'status\']);\r\n$this->setProperty(\'updatedTimestamp\',time());\r\n\r\n$this->setProperty(\"alive\",1);\r\n$ot=$this->object_title;\r\n$alive_timeout=(int)$this->getProperty(\"aliveTimeOut\");\r\nif (!$alive_timeout) {\r\n $alive_timeout=12*60*60;\r\n}\r\nclearTimeOut($ot.\"_alive\");\r\nsetTimeOut($ot.\"_alive\",\"sg(\'\".$ot.\".alive\',0);\",$alive_timeout);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (62,0,23,'statusChanged','','$this->setProperty(\'status\',$params[\'status\']); \r\n$this->setProperty(\'updatedTimestamp\',time()); \r\n\r\n$this->setProperty(\'alive\',1);\r\n$ot=$this->object_title;\r\n$alive_timeout=(int)$this->getProperty(\"aliveTimeOut\");\r\nif (!$alive_timeout) {\r\n $alive_timeout=24*60*60;\r\n}\r\nclearTimeOut($ot.\"_alive\");\r\nsetTimeOut($ot.\"_alive\",\"sg(\'\".$ot.\".alive\',0);\",$alive_timeout);\r\n\r\nif ($params[\'status\']) {\r\n \r\n $this->setProperty(\'motionDetected\',1);\r\n clearTimeOut($this->object_title.\'_detected\'); \r\n setTimeOut($this->object_title.\'_detected\',\"setGlobal(\'\".$this->object_title.\".motionDetected\',0);\",30);\r\n\r\n $linked_room=$this->getProperty(\'LinkedRoom\');\r\n if ($linked_room!=\'\') {\r\n  callMethod($linked_room.\'.onActivity\');\r\n }\r\n\r\n\r\n if (getGlobal(\'somebodyHome\')!=1) {\r\n  setGlobal(\'somebodyHome\',1);\r\n }\r\n\r\n\r\n $last_register=registeredEventTime(\'inhouseMovement\');\r\n  registerEvent(\'inhouseMovement\',$this->name,2);\r\n if (!$last_register || ((time()-$last_register)>2*60*60)) {\r\n  if (timeBetween(\'06:00\', \'12:00\')) {\r\n   runScript(\'morningGreeting\');\r\n  }\r\n  if (timeBetween(\'16:00\', \'01:00\')) {\r\n   runScript(\'eveningGreeting\');\r\n  }  \r\n }\r\n}',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (63,0,24,'modeChanged','','$this->setProperty(\"updated\",time());\r\n$this->setProperty(\"updatedTime\",date(\'H:i\'));\r\nif ($this->getProperty(\'status\')) {\r\n say(\"Mode \".$this->getProperty(\'title\').\" activated.\");\r\n} else {\r\n say(\"Mode \".$this->getProperty(\'title\').\" deactivated.\");\r\n}',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (64,0,24,'activate','','$this->setProperty(\'active\',1);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (65,0,24,'deactivate','','$this->setProperty(\'active\',0);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (66,0,25,'onActivity','','$latestActivity=$this->getProperty(\'LatestActivity\');\r\n$this->setProperty(\'LatestActivity\',time());\r\n$this->setProperty(\'LatestActivityTime\',date(\'H:i\'));\r\n\r\n$this->setProperty(\'SomebodyHere\',1);\r\n$ot=$this->object_title;\r\n$activity_timeout=10*60;\r\nclearTimeOut($ot.\"_activity_timeout\");\r\nsetTimeOut($ot.\"_activity_timeout\",\"callMethod(\'\".$ot.\".onIdle\');\",$activity_timeout);\r\n',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (67,0,25,'onIdle','','$this->setProperty(\'SomebodyHere\',0);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (68,0,26,'refresh','','$status=$this->getProperty(\"status\");\r\nif ($status) {\r\n $this->callMethod(\'turnOn\');\r\n} else {\r\n $this->callMethod(\'turnOff\');\r\n}',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (69,0,26,'switch','','$status=$this->getProperty(\"status\");\r\nif ($status) {\r\n $this->callMethod(\'turnOff\');\r\n} else {\r\n $this->callMethod(\'turnOn\');\r\n}',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (70,0,26,'turnOff','','$this->setProperty(\"status\",0);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (71,0,26,'turnOn','','$this->setProperty(\"status\",1);',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (72,0,19,'tempChanged','','//$params[\'t\']\r\n $this->setProperty(\"updated\",time());\r\n $this->setProperty(\"updatedTime\",date(\"H:i\",time()));\r\n $this->setProperty(\"alive\",1); \r\n \r\n$ot=$this->object_title;\r\n$alive_timeout=(int)$this->getProperty(\"aliveTimeOut\");\r\nif (!$alive_timeout) {\r\n $alive_timeout=30*60;\r\n}\r\nclearTimeOut($ot.\"_alive\");\r\nsetTimeOut($ot.\"_alive\",\"sg(\'\".$ot.\".alive\',0);\",$alive_timeout); \r\n\r\nif (!isset($params[\'t\'])) {\r\n return;\r\n}\r\n\r\n\r\n$old_temp=$this->getProperty(\'temp\');\r\n$t=round($params[\'t\'],1);\r\n\r\nif ($t>110) return;\r\n\r\n$this->setProperty(\'temp\',$t);\r\nif ($params[\'uptime\']) {\r\n $this->setProperty(\'uptime\',$params[\'uptime\']);\r\n}\r\n\r\nif ($t>$old_temp) {\r\n $d=1;\r\n} elseif ($t<$old_temp) {\r\n $d=-1;\r\n} else {\r\n $d=0;\r\n}\r\n$this->setProperty(\'direction\',$d);\r\n\r\n$linked_room=$this->getProperty(\"LinkedRoom\");\r\nif ($linked_room) {\r\n setGlobal($linked_room.\'.Temperature\',$t);\r\n}',0,0,NULL,NULL);
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (73,17,0,'checkState','','$details=array();\r\n$red_state=0;\r\n$yellow_state=0;\r\n\r\n$cycles=array(\'states\'=>\'states cycle\',\'main\'=>\'main cycle\',\'execs\'=>\'exec cycle\',\'scheduler\'=>\'scheduler cycle\');\r\nforeach($cycles as $k=>$v) {\r\n $tm=getGlobal(\'ThisComputer.cycle_\'.$k.\'Run\');\r\n if (time()-$tm>5*60) {\r\n  $red_state=1;\r\n  $details[]=$v.\" stopped.\";\r\n }\r\n}\r\n\r\n$cycles=array(\'ping\'=>\'ping cycle\',\'webvars\'=>\'webvars cycle\',\'watchfolders\'=>\'watch folders cycle\',\'rss\'=>\'RSS cycle\');\r\nforeach($cycles as $k=>$v) {\r\n $tm=getGlobal(\'ThisComputer.cycle_\'.$k.\'Run\');\r\n if (time()-$tm>10*60) {\r\n  $yellow_state=1;\r\n  $details[]=$v.\" stopped.\";\r\n }\r\n}\r\n\r\nif ($red_state) {\r\n $state=\'red\';\r\n $state_title=\'Red\'; \r\n} elseif ($yellow_state) {\r\n $state=\'yellow\';\r\n $state_title=\'Yellow\';  \r\n} else {\r\n $state=\'green\';\r\n $state_title=\'Green\';   \r\n}\r\n\r\n$new_details=implode(\". \",$details);\r\nif ($this->getProperty(\"stateDetails\")!=$new_details) {\r\n $this->setProperty(\'stateDetails\',$new_details);\r\n}\r\n\r\nif ($this->getProperty(\'stateColor\')!=$state) {\r\n $this->setProperty(\'stateColor\',$state);\r\n $this->setProperty(\'stateTitle\',$state_title);\r\n if ($state!=\'green\') {\r\n  say(\"System state changed to \".$state_title.\".\");\r\n  say(implode(\". \",$details));\r\n } else {\r\n  say(\"System state restored to \".$state_title);\r\n }\r\n $this->callMethod(\'stateChanged\');\r\n}',1,0,'2015-05-15 23:03:57','');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (74,18,0,'checkState','','$details=array();\r\n$red_state=0;\r\n$yellow_state=0;\r\n\r\nif ($red_state) {\r\n $state=\'red\';\r\n $state_title=\'Red\'; \r\n} elseif ($yellow_state) {\r\n $state=\'yellow\';\r\n $state_title=\'Yellow\';  \r\n} else {\r\n $state=\'green\';\r\n $state_title=\'Green\';   \r\n}\r\n\r\n$new_details=implode(\". \",$details);\r\nif ($this->getProperty(\"stateDetails\")!=$new_details) {\r\n $this->setProperty(\'stateDetails\',$new_details);\r\n}\r\n\r\nif ($this->getProperty(\'stateColor\')!=$state) {\r\n $this->setProperty(\'stateColor\',$state);\r\n $this->setProperty(\'stateTitle\',$state_title);\r\n if ($state!=\'green\') {\r\n  say(\"System state changed to \".$state_title.\".\");\r\n  say(implode(\". \",$details));\r\n } else {\r\n  say(\"System state restored to \".$state_title);\r\n }\r\n $this->callMethod(\'stateChanged\');\r\n}',1,0,'2015-05-15 23:03:57','');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (75,16,0,'checkState','','$details=array();\r\n$red_state=0;\r\n$yellow_state=0;\r\n\r\nif ($red_state) {\r\n $state=\'red\';\r\n $state_title=\'Red\'; \r\n} elseif ($yellow_state) {\r\n $state=\'yellow\';\r\n $state_title=\'Yellow\';  \r\n} else {\r\n $state=\'green\';\r\n $state_title=\'Green\';   \r\n}\r\n\r\n$new_details=implode(\". \",$details);\r\nif ($this->getProperty(\"stateDetails\")!=$new_details) {\r\n $this->setProperty(\'stateDetails\',$new_details);\r\n}\r\n\r\nif ($this->getProperty(\'stateColor\')!=$state) {\r\n $this->setProperty(\'stateColor\',$state);\r\n $this->setProperty(\'stateTitle\',$state_title);\r\n if ($state!=\'green\') {\r\n  say(\"System state changed to \".$state_title.\".\");\r\n  say(implode(\". \",$details));\r\n } else {\r\n  say(\"System state restored to \".$state_title);\r\n }\r\n $this->callMethod(\'stateChanged\');\r\n}',1,0,'2015-05-15 23:03:57','a:3:{s:6:\"object\";s:8:\"Security\";s:2:\"op\";s:1:\"m\";s:1:\"m\";s:10:\"checkState\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (76,25,0,'turnOff',NULL,'addDevicePluginJob(\'dev11\', \'SetDeviceProperty\', \'2\', \'0\', \'\', \'\', null);',0,0,'2015-05-15 23:03:48','a:1:{s:5:\"STATE\";s:8:\"sadada11\";}');
insert  into `methods`(`ID`,`OBJECT_ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`CODE`,`CALL_PARENT`,`SCRIPT_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (77,25,0,'turnOn',NULL,'addDevicePluginJob(\'dev11\', \'SetDeviceProperty\', \'2\', \'1\', \'\', \'\', null);',0,0,NULL,NULL);

/*Table structure for table `mqtt` */

DROP TABLE IF EXISTS `mqtt`;

CREATE TABLE `mqtt` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  `UPDATED` datetime DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL DEFAULT '',
  `PATH` varchar(255) NOT NULL DEFAULT '',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `mqtt` */

/*Table structure for table `newsletter` */

DROP TABLE IF EXISTS `newsletter`;

CREATE TABLE `newsletter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL DEFAULT '',
  `LIST` varchar(255) NOT NULL DEFAULT '',
  `ADDED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `newsletter` */

/*Table structure for table `objects` */

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `CLASS_ID` int(10) NOT NULL DEFAULT '0',
  `DESCRIPTION` text,
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `objects` */

insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (4,'USBDev',9,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (13,'BlueDev',18,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (6,'ClockChime',7,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (7,'ThisComputer',10,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (10,'mySkype',12,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (15,'ws',20,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (16,'Security',21,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (17,'System',21,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (18,'Communication',21,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (19,'EconomMode',24,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (20,'NobodyHomeMode',24,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (21,'SecurityArmedMode',24,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (22,'GuestsMode',24,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (23,'DarknessMode',24,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (24,'Livingroom',25,'',0);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (25,'Relay1',26,'',1);
insert  into `objects`(`ID`,`TITLE`,`CLASS_ID`,`DESCRIPTION`,`LOCATION_ID`) values (26,'TempSensor1',19,'',1);

/*Table structure for table `owdevices` */

DROP TABLE IF EXISTS `owdevices`;

CREATE TABLE `owdevices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `UDID` varchar(255) NOT NULL DEFAULT '',
  `STATUS` int(3) NOT NULL DEFAULT '0',
  `CHECK_LATEST` datetime DEFAULT NULL,
  `CHECK_NEXT` datetime DEFAULT NULL,
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `CODE` text,
  `ONLINE_INTERVAL` int(10) NOT NULL DEFAULT '0',
  `LOG` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `owdevices` */

insert  into `owdevices`(`ID`,`TITLE`,`UDID`,`STATUS`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`CODE`,`ONLINE_INTERVAL`,`LOG`) values (1,'28.90027E020000','28.90027E020000',1,'2014-01-09 22:59:23','2014-01-09 22:59:33',0,'',10,'2013-08-20 21:02:57 Added');
insert  into `owdevices`(`ID`,`TITLE`,`UDID`,`STATUS`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`CODE`,`ONLINE_INTERVAL`,`LOG`) values (2,'28.E91D7E020000','28.E91D7E020000',1,'2014-01-09 22:47:39','2014-01-09 23:47:39',0,'',3600,'2013-08-20 21:03:00 Added');
insert  into `owdevices`(`ID`,`TITLE`,`UDID`,`STATUS`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`CODE`,`ONLINE_INTERVAL`,`LOG`) values (3,'28.D9337E020000','28.D9337E020000',1,'2014-01-09 22:59:30','2014-01-09 22:59:40',0,'',10,'2013-08-20 21:03:03 Added');
insert  into `owdevices`(`ID`,`TITLE`,`UDID`,`STATUS`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`CODE`,`ONLINE_INTERVAL`,`LOG`) values (4,'81.90722E000000','81.90722E000000',1,'2014-01-09 22:47:41','2014-01-09 23:47:41',0,'',3600,'2013-08-20 21:03:05 Added');

/*Table structure for table `owdisplays` */

DROP TABLE IF EXISTS `owdisplays`;

CREATE TABLE `owdisplays` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UDID` int(10) unsigned NOT NULL DEFAULT '0',
  `ROWS` int(3) unsigned NOT NULL DEFAULT '0',
  `COLS` int(3) unsigned NOT NULL DEFAULT '0',
  `UPDATE_INTERVAL` int(10) unsigned NOT NULL DEFAULT '0',
  `VALUE` text,
  `UPDATE_LATEST` int(10) unsigned NOT NULL DEFAULT '0',
  `UPDATE_NEXT` int(10) unsigned NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `owdisplays` */

/*Table structure for table `owproperties` */

DROP TABLE IF EXISTS `owproperties`;

CREATE TABLE `owproperties` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SYSNAME` varchar(255) NOT NULL DEFAULT '',
  `VALUE` varchar(255) NOT NULL DEFAULT '',
  `CHECK_LATEST` datetime DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `PATH` varchar(255) NOT NULL DEFAULT '',
  `STARRED` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `owproperties` */

insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (1,1,'address','2890027E020000DE','0000-00-00 00:00:00','2013-09-11 18:02:10','','','/28.90027E020000/address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (2,1,'alias','','0000-00-00 00:00:00','2013-09-09 19:38:57','','','/28.90027E020000/alias',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (3,1,'crc8','DE','0000-00-00 00:00:00','2013-09-11 18:02:10','','','/28.90027E020000/crc8',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (4,1,'errata','','0000-00-00 00:00:00','2013-09-09 19:38:57','','','/28.90027E020000/errata',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (5,1,'family','28','0000-00-00 00:00:00','2013-09-11 18:02:10','','','/28.90027E020000/family',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (6,1,'fasttemp','23','0000-00-00 00:00:00','2014-01-09 22:58:53','','','/28.90027E020000/fasttemp',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (7,1,'id','90027E020000','0000-00-00 00:00:00','2013-09-11 18:02:11','','','/28.90027E020000/id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (8,1,'locator','FFFFFFFFFFFFFFFF','0000-00-00 00:00:00','2013-09-11 18:02:11','','','/28.90027E020000/locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (9,1,'power','1','0000-00-00 00:00:00','2013-09-12 10:13:12','','','/28.90027E020000/power',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (10,1,'r_address','DE0000027E029028','0000-00-00 00:00:00','2013-09-11 18:02:11','','','/28.90027E020000/r_address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (11,1,'r_id','0000027E0290','0000-00-00 00:00:00','2013-12-29 21:37:08','','','/28.90027E020000/r_id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (12,1,'r_locator','FFFFFFFFFFFFFFFF','0000-00-00 00:00:00','2013-12-29 21:37:08','','','/28.90027E020000/r_locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (13,1,'temperature','23.125','0000-00-00 00:00:00','2014-01-09 22:58:54','','','/28.90027E020000/temperature',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (14,1,'temperature10','23','0000-00-00 00:00:00','2014-01-09 22:58:54','','','/28.90027E020000/temperature10',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (15,1,'temperature11','23.125','0000-00-00 00:00:00','2014-01-09 22:58:55','','','/28.90027E020000/temperature11',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (16,1,'temperature12','23.125','0000-00-00 00:00:00','2014-01-09 22:58:55','ThisComputer','1w_temp','/28.90027E020000/temperature12',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (17,1,'temperature9','23','0000-00-00 00:00:00','2014-01-09 22:58:55','','','/28.90027E020000/temperature9',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (18,1,'temphigh','75','0000-00-00 00:00:00','2013-12-29 21:37:08','','','/28.90027E020000/temphigh',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (19,1,'templow','70','0000-00-00 00:00:00','2013-12-29 21:37:08','','','/28.90027E020000/templow',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (20,1,'type','DS18B20','0000-00-00 00:00:00','2013-12-29 21:37:08','','','/28.90027E020000/type',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (21,2,'address','28E91D7E020000C3',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (22,2,'alias','',NULL,NULL,'','','/28.E91D7E020000/alias',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (23,2,'crc8','C3',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/crc8',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (24,2,'errata','',NULL,NULL,'','','/28.E91D7E020000/errata',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (25,2,'family','28',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/family',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (26,2,'fasttemp','21','0000-00-00 00:00:00','2014-01-09 20:07:30','','','/28.E91D7E020000/fasttemp',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (27,2,'id','E91D7E020000',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (28,2,'locator','FFFFFFFFFFFFFFFF',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (29,2,'power','1',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/power',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (30,2,'r_address','C30000027E1DE928',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/r_address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (31,2,'r_id','0000027E1DE9',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/r_id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (32,2,'r_locator','FFFFFFFFFFFFFFFF',NULL,'2013-08-20 21:03:00','','','/28.E91D7E020000/r_locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (33,2,'temperature','20.8125','0000-00-00 00:00:00','2014-01-09 22:47:40','','','/28.E91D7E020000/temperature',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (34,2,'temperature10','21','0000-00-00 00:00:00','2014-01-09 22:47:41','','','/28.E91D7E020000/temperature10',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (35,2,'temperature11','20.875','0000-00-00 00:00:00','2014-01-09 22:47:41','','','/28.E91D7E020000/temperature11',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (36,2,'temperature12','20.8125','0000-00-00 00:00:00','2014-01-09 22:47:41','','','/28.E91D7E020000/temperature12',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (37,2,'temperature9','21','0000-00-00 00:00:00','2014-01-09 20:07:32','','','/28.E91D7E020000/temperature9',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (38,2,'temphigh','          75',NULL,'2013-08-20 21:03:03','','','/28.E91D7E020000/temphigh',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (39,2,'templow','          70',NULL,'2013-08-20 21:03:03','','','/28.E91D7E020000/templow',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (40,2,'type','DS18B20',NULL,'2013-08-20 21:03:03','','','/28.E91D7E020000/type',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (41,3,'address','28D9337E02000074','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (42,3,'alias','','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/alias',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (43,3,'crc8','74','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/crc8',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (44,3,'errata','','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/errata',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (45,3,'family','28','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/family',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (46,3,'fasttemp','24','0000-00-00 00:00:00','2014-01-09 20:07:27','','','/28.D9337E020000/fasttemp',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (47,3,'id','D9337E020000','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (48,3,'locator','FFFFFFFFFFFFFFFF','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (49,3,'power','1','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/power',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (50,3,'r_address','740000027E33D928','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/r_address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (51,3,'r_id','0000027E33D9','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/r_id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (52,3,'r_locator','FFFFFFFFFFFFFFFF','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/r_locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (53,3,'temperature','24','0000-00-00 00:00:00','2014-01-09 22:58:51','','','/28.D9337E020000/temperature',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (54,3,'temperature10','24','0000-00-00 00:00:00','2014-01-09 22:51:55','','','/28.D9337E020000/temperature10',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (55,3,'temperature11','24.125','0000-00-00 00:00:00','2014-01-09 22:52:27','','','/28.D9337E020000/temperature11',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (56,3,'temperature12','24','0000-00-00 00:00:00','2014-01-09 22:58:52','','','/28.D9337E020000/temperature12',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (57,3,'temperature9','24','0000-00-00 00:00:00','2014-01-09 20:07:27','','','/28.D9337E020000/temperature9',1);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (58,3,'temphigh','75','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/temphigh',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (59,3,'templow','70','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/templow',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (60,3,'type','DS18B20','0000-00-00 00:00:00','2013-09-09 19:38:52','','','/28.D9337E020000/type',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (61,4,'address','8190722E00000090',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (62,4,'alias','',NULL,NULL,'','','/81.90722E000000/alias',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (63,4,'crc8','90',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/crc8',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (64,4,'family','81',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/family',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (65,4,'id','90722E000000',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (66,4,'locator','FFFFFFFFFFFFFFFF',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (67,4,'r_address','900000002E729081',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/r_address',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (68,4,'r_id','0000002E7290',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/r_id',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (69,4,'r_locator','FFFFFFFFFFFFFFFF',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/r_locator',0);
insert  into `owproperties`(`ID`,`DEVICE_ID`,`SYSNAME`,`VALUE`,`CHECK_LATEST`,`UPDATED`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`PATH`,`STARRED`) values (70,4,'type','DS1420',NULL,'2013-08-20 21:03:05','','','/81.90722E000000/type',0);

/*Table structure for table `patterns` */

DROP TABLE IF EXISTS `patterns`;

CREATE TABLE `patterns` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PATTERN` text,
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `SCRIPT` text,
  `LOG` text,
  `TIME_LIMIT` int(245) NOT NULL DEFAULT '0',
  `EXECUTED` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `patterns` */

/*Table structure for table `performance_log` */

DROP TABLE IF EXISTS `performance_log`;

CREATE TABLE `performance_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OPERATION` varchar(255) NOT NULL DEFAULT '',
  `COUNTER` int(10) NOT NULL DEFAULT '0',
  `TIMEUSED` float NOT NULL DEFAULT '0',
  `SOURCE` char(10) NOT NULL DEFAULT '',
  `ADDED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `performance_log` */

/*Table structure for table `phistory` */

DROP TABLE IF EXISTS `phistory`;

CREATE TABLE `phistory` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ADDED` datetime DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `VALUE_ID` (`VALUE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `phistory` */

insert  into `phistory`(`ID`,`VALUE_ID`,`ADDED`,`VALUE`) values (14,105,'2014-04-30 17:03:53','16');

/*Table structure for table `pinghosts` */

DROP TABLE IF EXISTS `pinghosts`;

CREATE TABLE `pinghosts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HOSTNAME` varchar(255) NOT NULL DEFAULT '',
  `TYPE` int(30) NOT NULL DEFAULT '0',
  `STATUS` int(3) NOT NULL DEFAULT '0',
  `SEARCH_WORD` varchar(255) NOT NULL DEFAULT '',
  `CHECK_LATEST` datetime DEFAULT NULL,
  `CHECK_NEXT` datetime DEFAULT NULL,
  `SCRIPT_ID_ONLINE` int(10) NOT NULL DEFAULT '0',
  `CODE_ONLINE` text,
  `SCRIPT_ID_OFFLINE` int(10) NOT NULL DEFAULT '0',
  `CODE_OFFLINE` text,
  `OFFLINE_INTERVAL` int(10) NOT NULL DEFAULT '0',
  `ONLINE_INTERVAL` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `LOG` text,
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `COUNTER_CURRENT` int(10) NOT NULL DEFAULT '0',
  `COUNTER_REQUIRED` int(10) NOT NULL DEFAULT '0',
  `STATUS_EXPECTED` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `pinghosts` */

insert  into `pinghosts`(`ID`,`HOSTNAME`,`TYPE`,`STATUS`,`SEARCH_WORD`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID_ONLINE`,`CODE_ONLINE`,`SCRIPT_ID_OFFLINE`,`CODE_OFFLINE`,`OFFLINE_INTERVAL`,`ONLINE_INTERVAL`,`TITLE`,`LOG`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`COUNTER_CURRENT`,`COUNTER_REQUIRED`,`STATUS_EXPECTED`) values (8,'tut.by',0,1,'','2014-01-09 22:58:50','2014-01-09 23:08:50',0,'',0,'',600,600,'tut.by','2012-11-17 14:47:08 Host is online\n2012-11-17 14:37:06 Host is offline\n2012-11-17 14:27:05 Host is online\n2012-11-16 17:29:14 Host is offline\n2012-11-16 16:59:02 Host is online\n2012-11-16 16:49:01 Host is offline\n2012-11-16 15:08:49 Host is online\n2012-11-16 14:58:45 Host is offline\n2012-10-31 09:59:11 Host is online\n2012-10-31 09:49:11 Host is offline\n2012-10-29 09:48:24 Host is online\n2012-10-29 06:37:11 Host is offline\n2012-10-29 06:27:07 Host is online\n2012-10-29 05:46:55 Host is offline\n2012-10-29 05:26:51 Host is online\n2012-10-29 05:16:51 Host is offline\n2012-10-29 05:06:47 Host is online\n2012-10-29 04:06:27 Host is offline\n2012-10-29 03:56:23 Host is online\n2012-10-29 03:46:23 Host is offline\n2012-10-29 03:36:19 Host is online\n2012-10-29 03:16:15 Host is offline\n2012-10-29 03:06:11 Host is online\n2012-10-29 01:25:44 Host is offline\n2012-10-29 01:15:41 Host is online\n2012-10-29 00:05:17 Host is offline\n2012-10-23 14:53:36 Host is online\n2012-10-23 14:23:28 Host is offline\n2012-10-19 06:11:55 Host is online\n2012-10-19 06:01:55 Host is offline\n2012-10-16 11:55:17 Host is online\n','','',0,0,1);

/*Table structure for table `plugins` */

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `MODULE_NAME` varchar(255) NOT NULL DEFAULT '',
  `REPOSITORY_URL` char(255) NOT NULL DEFAULT '',
  `AUTHOR` varchar(255) NOT NULL DEFAULT '',
  `SUPPORT_URL` char(255) NOT NULL DEFAULT '',
  `DESCRIPTION_RU` text,
  `DESCRIPTION_EN` text,
  `CURRENT_VERSION` varchar(255) NOT NULL DEFAULT '',
  `LATEST_VERSION` varchar(255) NOT NULL DEFAULT '',
  `IS_INSTALLED` int(3) NOT NULL DEFAULT '0',
  `WHATSNEW` text,
  `LATEST_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `plugins` */

insert  into `plugins`(`ID`,`TITLE`,`MODULE_NAME`,`REPOSITORY_URL`,`AUTHOR`,`SUPPORT_URL`,`DESCRIPTION_RU`,`DESCRIPTION_EN`,`CURRENT_VERSION`,`LATEST_VERSION`,`IS_INSTALLED`,`WHATSNEW`,`LATEST_UPDATE`) values (1,'','blank','','','',NULL,NULL,'1.0','',1,NULL,'2014-02-05 20:29:29');

/*Table structure for table `prod_categories` */

DROP TABLE IF EXISTS `prod_categories`;

CREATE TABLE `prod_categories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `prod_categories` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `PARENT_ID` int(10) NOT NULL DEFAULT '0',
  `SUB_LIST` text,
  `PARENT_LIST` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `product_categories` */

insert  into `product_categories`(`ID`,`TITLE`,`PRIORITY`,`PARENT_ID`,`SUB_LIST`,`PARENT_LIST`) values (1,'<#LANG_APP_PRODUCTS#>',0,0,'2,3,4,5,7,8','0');

/*Table structure for table `product_codes` */

DROP TABLE IF EXISTS `product_codes`;

CREATE TABLE `product_codes` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `CODE` varchar(255) NOT NULL DEFAULT '',
  `PRODUCT_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `product_codes` */

insert  into `product_codes`(`ID`,`TITLE`,`CODE`,`PRODUCT_ID`) values (33,'ХЛЕБ ','4811002027133',1);
insert  into `product_codes`(`ID`,`TITLE`,`CODE`,`PRODUCT_ID`) values (34,'МОЛОЧНАЯ КАША ДЛЯ ДЕТСКОГО ПИТАНИЯ ','4606272002061',2);

/*Table structure for table `product_log` */

DROP TABLE IF EXISTS `product_log`;

CREATE TABLE `product_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PRODUCT_ID` int(10) NOT NULL DEFAULT '0',
  `CODE_ID` int(10) NOT NULL DEFAULT '0',
  `ACTION` char(10) NOT NULL DEFAULT '',
  `UPDATED` datetime DEFAULT NULL,
  `QTY` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_log` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `COMMENTS` varchar(255) NOT NULL DEFAULT '',
  `CATEGORY_ID` int(10) NOT NULL DEFAULT '0',
  `INSTOCK` int(3) NOT NULL DEFAULT '0',
  `IMAGE` varchar(70) NOT NULL DEFAULT '',
  `WILL_EXPIRE` int(3) NOT NULL DEFAULT '0',
  `EXPIRE_DATE` date DEFAULT NULL,
  `EXPIRE_DEFAULT` int(10) NOT NULL DEFAULT '0',
  `UPDATED` datetime DEFAULT NULL,
  `QTY` int(10) NOT NULL DEFAULT '0',
  `MIN_QTY` int(10) NOT NULL DEFAULT '0',
  `DETAILS` text,
  `DEFAULT_PRICE` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

/*Table structure for table `project_modules` */

DROP TABLE IF EXISTS `project_modules`;

CREATE TABLE `project_modules` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `TITLE` varchar(100) NOT NULL DEFAULT '',
  `CATEGORY` varchar(50) NOT NULL DEFAULT '',
  `PARENT_NAME` varchar(50) NOT NULL DEFAULT '',
  `DATA` text,
  `HIDDEN` int(3) NOT NULL DEFAULT '0',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `ADDED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

/*Data for the table `project_modules` */

insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (1,'control_modules','Project Modules','System','','',1,0,'2011-09-29 22:16:10');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (67,'scripts','<#LANG_MODULE_SCRIPTS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2010-09-13 19:12:16');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (4,'control_access','Control Access','<#LANG_SECTION_SYSTEM#>','','',1,0,'2011-09-29 22:16:01');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (7,'master','<#LANG_MODULE_MASTER_LOGIN#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2009-01-30 13:21:41');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (70,'pinghosts','<#LANG_MODULE_PINGHOSTS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2011-01-06 01:02:57');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (20,'saverestore','<#LANG_MODULE_SAVERESTORE#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2009-02-07 14:35:05');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (21,'userlog','<#LANG_MODULE_USERLOG#>','<#LANG_SECTION_SYSTEM#>','','',1,0,'2009-02-07 14:45:52');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (22,'skins','<#LANG_MODULE_SKINS#>','<#LANG_SECTION_SYSTEM#>','','',1,0,'2009-02-07 15:02:54');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (23,'settings','<#LANG_MODULE_SETTINGS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2009-02-07 15:05:40');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (24,'dateselect','Date Selector','System','','',1,0,'2009-02-07 15:47:32');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (25,'thumb','<#LANG_MODULE_THUMB#>','<#LANG_SECTION_SYSTEM#>','','',1,0,'2009-02-07 15:48:32');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (74,'app_gpstrack','<#LANG_APP_GPSTRACK#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2011-07-25 15:27:19');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (71,'watchfolders','<#LANG_MODULE_WATCHFOLDERS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2011-01-14 01:08:25');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (73,'app_player','<#LANG_APP_PLAYER#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2011-05-03 15:02:57');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (28,'dashboard','Dashboard','CMS','','a:5:{s:12:\"CPANEL_STATS\";i:0;s:15:\"CPANEL_USERNAME\";s:0:\"\";s:15:\"CPANEL_PASSWORD\";s:0:\"\";s:13:\"CPANEL_DOMAIN\";s:0:\"\";s:10:\"CPANEL_URL\";s:0:\"\";}',1,0,'2009-02-23 13:15:23');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (29,'events','<#LANG_MODULE_EVENTS#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2009-03-27 16:04:51');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (30,'users','<#LANG_MODULE_USERS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2009-03-27 16:08:07');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (31,'terminals','<#LANG_MODULE_TERMINALS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2009-03-27 16:10:00');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (34,'commands','<#LANG_MODULE_CONTROL_MENU#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2009-04-11 07:14:03');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (37,'classes','<#LANG_MODULE_OBJECTS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2009-05-22 14:09:27');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (38,'history','<#LANG_MODULE_OBJECTS_HISTORY#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2009-05-22 14:09:51');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (39,'locations','<#LANG_MODULE_LOCATIONS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2009-05-22 14:11:01');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (40,'methods','<#LANG_MODULE_METHODS#>','<#LANG_SECTION_OBJECTS#>','','',1,0,'2009-05-22 14:11:23');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (41,'properties','<#LANG_MODULE_PROPERTIES#>','<#LANG_SECTION_OBJECTS#>','','',1,0,'2009-05-22 14:11:47');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (42,'objects','<#LANG_MODULE_OBJECT_INSTANCES#>','<#LANG_SECTION_OBJECTS#>','','',1,0,'2009-05-22 14:12:04');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (85,'pvalues','<#LANG_MODULE_PVALUES#>','<#LANG_SECTION_OBJECTS#>','','',1,0,'2012-11-16 19:04:26');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (44,'shoutbox','<#LANG_MODULE_SHOUTBOX#>','<#LANG_SECTION_SYSTEM#>','','',1,0,'2009-07-29 17:53:13');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (45,'shoutrooms','<#LANG_MODULE_SHOUTROOMS#>','<#LANG_SECTION_SYSTEM#>','','',1,0,'2009-07-29 17:53:28');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (46,'jobs','<#LANG_MODULE_JOBS#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2009-10-13 22:29:16');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (47,'btdevices','<#LANG_MODULE_BT_DEVICES#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2009-12-13 21:06:47');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (80,'app_calendar','<#LANG_APP_CALENDAR#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2012-06-25 13:34:08');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (81,'scenes','<#LANG_MODULE_SCENES#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2012-06-25 13:34:26');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (49,'usbdevices','<#LANG_MODULE_USB_DEVICES#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2010-03-22 15:18:32');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (68,'rss_channels','<#LANG_MODULE_RSS_CHANNELS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2010-09-22 14:54:52');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (61,'app_mediabrowser','<#LANG_APP_MEDIA_BROWSER#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2010-08-31 13:09:33');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (64,'app_tdwiki','<#LANG_APP_TDWIKI#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2010-08-31 13:11:38');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (63,'app_products','<#LANG_APP_PRODUCTS#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2010-08-31 13:11:24');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (66,'layouts','<#LANG_MODULE_LAYOUTS#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2010-09-13 19:03:49');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (82,'webvars','<#LANG_MODULE_WEBVARS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2012-11-06 12:49:14');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (77,'patterns','<#LANG_MODULE_PATTERNS#>','<#LANG_SECTION_OBJECTS#>','','',0,0,'2011-12-13 18:36:03');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (78,'onewire','<#LANG_MODULE_ONEWIRE#>','<#LANG_SECTION_DEVICES#>','','',0,0,'2012-03-22 00:04:32');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (83,'xray','X-Ray','<#LANG_SECTION_SYSTEM#>','','',0,0,'2012-11-16 18:59:57');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (86,'app_quotes','<#LANG_APP_QUOTES#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2013-03-06 16:25:28');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (87,'app_readit','<#LANG_APP_READIT#>','<#LANG_SECTION_APPLICATIONS#>','','',0,0,'2013-03-06 16:25:29');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (88,'security_rules','<#LANG_MODULE_SECURITY_RULES#>','<#LANG_SECTION_SETTINGS#>','','',0,0,'2013-05-18 15:31:37');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (89,'snmpdevices','<#LANG_MODULE_SNMP#>','<#LANG_SECTION_DEVICES#>','','',0,0,'2013-05-18 15:31:38');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (90,'connect','<#LANG_MODULE_CONNECT#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2013-08-09 14:02:04');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (91,'mqtt','<#LANG_MODULE_MQTT#>','<#LANG_SECTION_DEVICES#>','','a:3:{s:9:\"MQTT_HOST\";s:9:\"localhost\";s:9:\"MQTT_PORT\";s:4:\"1883\";s:10:\"MQTT_QUERY\";s:10:\"/var/now/#\";}',0,0,'2013-08-09 14:02:06');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (92,'zwave','<#LANG_MODULE_ZWAVE#>','<#LANG_SECTION_DEVICES#>','','',0,0,'2013-08-09 14:02:09');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (93,'objects','<#LANG_MODULE_OBJECT_INSTANCES#>','<#LANG_SECTION_OBJECTS#>','',NULL,0,0,'2013-09-12 21:53:52');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (94,'device','Dev t','<#LANG_SECTION_DEVICES#>','',NULL,0,0,'2013-10-11 19:13:57');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (95,'scheduled_job','scheduled_job','<#LANG_SECTION_SYSTEM#>','',NULL,0,0,'2014-02-04 21:52:43');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (96,'market','<#LANG_MODULE_MARKET#>','<#LANG_SECTION_SYSTEM#>','','',0,0,'2014-02-05 20:27:16');
insert  into `project_modules`(`ID`,`NAME`,`TITLE`,`CATEGORY`,`PARENT_NAME`,`DATA`,`HIDDEN`,`PRIORITY`,`ADDED`) values (97,'blank','Blank','<#LANG_SECTION_APPLICATIONS#>','',NULL,0,0,'2014-02-05 20:29:29');

/*Table structure for table `properties` */

DROP TABLE IF EXISTS `properties`;

CREATE TABLE `properties` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CLASS_ID` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` text,
  `OBJECT_ID` int(10) NOT NULL DEFAULT '0',
  `KEEP_HISTORY` int(10) NOT NULL DEFAULT '0',
  `ONCHANGE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `CLASS_ID` (`CLASS_ID`),
  KEY `OBJECT_ID` (`OBJECT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `properties` */

insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (1,1,'lastTimePressed','когда нажималась в последний раз',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (8,5,'СтепеньКрасноты','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (10,10,'checked','время последней проверки',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (17,0,'testProp',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (12,7,'time','текущее время',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (18,10,'minMsgLevel','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (19,19,'temp','',0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (20,0,'weatherFull',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (21,0,'AlarmTime',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (22,0,'textBoxTest',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (82,0,'1w_temp',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (24,20,'tempOutside',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (25,20,'relHumOutside',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (26,20,'dewPoint',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (27,20,'windLatest',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (28,20,'windAverage',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (29,20,'rainfallRate',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (30,20,'rainfallHour',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (31,20,'rainfall24',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (32,20,'pressure',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (33,20,'pressureTrend',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (34,20,'windDirection',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (35,20,'windDirectionAverage',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (36,20,'tempInside',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (37,20,'relHumInside',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (38,20,'pressureRt',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (39,20,'updatedTime',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (40,20,'updatedDate',NULL,0,7,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (41,21,'stateDetails','details for the state',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (42,21,'stateColor','green / yellow / red',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (43,0,'TempOutside',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (44,0,'Econom',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (45,0,'securityMode',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (46,0,'nobodyHome',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (47,0,'WeHaveGuests',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (48,0,'cycle_statesRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (49,22,'alive','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (50,22,'aliveTimeOut','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (51,22,'status','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (52,22,'statusText','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (53,22,'updatedTimestamp','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (54,23,'LinkedRoom','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (55,24,'active','',0,0,'modeChanged');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (56,24,'title','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (57,24,'updated','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (58,24,'updatedTime','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (59,25,'LatestActivity','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (60,25,'LatestActivityTime','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (61,25,'SomebodyHere','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (62,25,'Temperature','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (63,26,'status','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (64,19,'LinkedRoom','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (65,19,'alive','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (66,19,'aliveTimeOut','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (67,19,'updated','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (68,19,'updatedTime','',0,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (69,0,'cycle_execsRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (70,0,'cycle_mainRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (71,0,'cycle_rssRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (72,0,'cycle_pingRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (73,0,'cycle_watchfoldersRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (74,0,'cycle_schedulerRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (75,0,'cycle_webvarsRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (76,0,'stateTitle',NULL,17,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (77,0,'stateTitle',NULL,18,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (78,0,'stateTitle',NULL,16,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (79,0,'cycle_onewire_starredRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (80,0,'cycle_onewireRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (83,0,'',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (84,0,'d_on',NULL,7,15,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (85,0,'123',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (86,0,'cycle_devicesRun',NULL,7,0,'');
insert  into `properties`(`ID`,`CLASS_ID`,`TITLE`,`DESCRIPTION`,`OBJECT_ID`,`KEEP_HISTORY`,`ONCHANGE`) values (87,0,'cycle_scheduled_jobRun',NULL,7,0,'');

/*Table structure for table `pvalues` */

DROP TABLE IF EXISTS `pvalues`;

CREATE TABLE `pvalues` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(10) NOT NULL DEFAULT '0',
  `OBJECT_ID` int(10) NOT NULL DEFAULT '0',
  `VALUE` text NOT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `PROPERTY_NAME` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `PROPERTY_ID` (`PROPERTY_ID`),
  KEY `OBJECT_ID` (`OBJECT_ID`),
  KEY `PROPERTY_NAME` (`PROPERTY_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Data for the table `pvalues` */

insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (59,18,7,'0','2013-12-29 21:41:40','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (60,17,7,'-15','2013-12-29 21:41:40','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (58,10,7,'1346415251','2013-12-29 21:41:40','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (24,12,6,'2014-01-09 22:59:00','2014-01-09 22:59:00','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (61,20,7,'\n<br>  \n<b>Сегодня:</b><br />днем: +4&deg;...+6&deg;, пасмурно, ночью: +3&deg;...+5&deg;,\nпасмурно, небольшой дождь, ветер: З — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +4&deg;...+6&deg;, пасмурно, без существенных осадков, ночью: +3&deg;...+5&deg;,\nпасмурно, ветер: ЮЗ — 10-12 м/с, давление: 746 мм.рт.ст, влажность: 85%<br /><br />\n','2014-01-09 22:47:37','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (105,84,7,'16','2014-04-30 17:03:53','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (106,85,7,'html><body><h1>It works!</h1>\r\n<p>This is','2013-12-29 21:41:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (80,43,7,'+4.1','2014-01-09 22:49:14','ThisComputer.TempOutside');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (62,21,7,'09:30','2013-12-29 21:41:40','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (63,22,7,'0','2014-01-17 20:29:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (65,24,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (66,25,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (67,26,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (68,27,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (69,28,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (70,29,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (71,30,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (72,31,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (73,32,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (74,33,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (75,34,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (76,35,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (77,36,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (78,37,15,'',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (79,38,15,'0',NULL,'');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (81,44,7,'0','2013-12-29 21:41:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (82,45,7,'0','2013-12-29 21:41:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (83,46,7,'0','2013-12-29 21:41:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (84,47,7,'1','2014-01-18 19:36:49','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (85,48,7,'1431716637','2015-05-15 23:03:57','ThisComputer.cycle_statesRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (86,69,7,'1389293971','2014-01-09 22:59:31','ThisComputer.cycle_execsRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (87,70,7,'1389293971','2014-01-09 22:59:31','ThisComputer.cycle_mainRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (88,71,7,'1389293962','2014-01-09 22:59:22','ThisComputer.cycle_rssRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (89,72,7,'1389293963','2014-01-09 22:59:23','ThisComputer.cycle_pingRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (90,73,7,'1389293963','2014-01-09 22:59:23','ThisComputer.cycle_watchfoldersRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (91,74,7,'1389293971','2014-01-09 22:59:31','ThisComputer.cycle_schedulerRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (92,75,7,'1389293962','2014-01-09 22:59:22','ThisComputer.cycle_webvarsRun');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (93,42,17,'red','2014-01-09 23:04:53','System.stateColor');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (94,76,17,'Red','2014-01-09 23:04:53','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (95,42,18,'green','2013-08-09 13:28:48','Communication.stateColor');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (96,77,18,'Green','2013-08-09 13:28:48','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (97,42,16,'green','2013-08-09 13:29:00','Security.stateColor');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (98,78,16,'Green','2013-08-09 13:29:00','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (99,41,17,'main cycle stopped.. exec cycle stopped.. scheduler cycle stopped.. ping cycle stopped.. webvars cycle stopped.. watch folders cycle stopped.. RSS cycle stopped.','2014-01-12 11:57:08','System.stateDetails');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (100,79,7,'1389293971','2014-01-09 22:59:31','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (101,80,7,'1389293971','2014-01-09 22:59:31','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (103,82,7,'2','2014-02-05 21:00:41','ThisComputer.1w_temp');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (104,83,7,'','2013-12-29 21:41:41','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (107,86,7,'1389293929','2014-01-09 22:58:49','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (108,63,25,'1','2013-10-19 16:16:32','');
insert  into `pvalues`(`ID`,`PROPERTY_ID`,`OBJECT_ID`,`VALUE`,`UPDATED`,`PROPERTY_NAME`) values (109,87,7,'1391619641','2014-02-05 21:00:41','');

/*Table structure for table `readit_channels` */

DROP TABLE IF EXISTS `readit_channels`;

CREATE TABLE `readit_channels` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `readit_channels` */

/*Table structure for table `readit_urls` */

DROP TABLE IF EXISTS `readit_urls`;

CREATE TABLE `readit_urls` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `URL` char(255) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `FAVORITE` int(3) NOT NULL DEFAULT '0',
  `ADDED` datetime DEFAULT NULL,
  `SYS_ID` varchar(255) NOT NULL DEFAULT '',
  `CHANNEL_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `readit_urls` */

/*Table structure for table `rss_channels` */

DROP TABLE IF EXISTS `rss_channels`;

CREATE TABLE `rss_channels` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `URL` char(255) NOT NULL DEFAULT '',
  `NEXT_UPDATE` datetime DEFAULT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `UPDATE_EVERY` int(10) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `rss_channels` */

/*Table structure for table `rss_items` */

DROP TABLE IF EXISTS `rss_items`;

CREATE TABLE `rss_items` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `BODY` text,
  `URL` char(255) NOT NULL DEFAULT '',
  `GUID` varchar(255) NOT NULL DEFAULT '',
  `ADDED` varchar(255) NOT NULL DEFAULT '',
  `CHANNEL_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11825 DEFAULT CHARSET=utf8;

/*Data for the table `rss_items` */

/*Table structure for table `safe_execs` */

DROP TABLE IF EXISTS `safe_execs`;

CREATE TABLE `safe_execs` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COMMAND` text NOT NULL,
  `ADDED` datetime DEFAULT NULL,
  `EXCLUSIVE` int(3) NOT NULL DEFAULT '0',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

/*Data for the table `safe_execs` */

insert  into `safe_execs`(`ID`,`COMMAND`,`ADDED`,`EXCLUSIVE`,`PRIORITY`) values (154,'mplayer /home/projects/php/projects/devel/majordomo/sounds/dingdong.mp3','2014-01-09 23:04:53',1,0);
insert  into `safe_execs`(`ID`,`COMMAND`,`ADDED`,`EXCLUSIVE`,`PRIORITY`) values (155,'mplayer /home/projects/php/projects/devel/majordomo/cached/voice/e438a18b0f0895593e307466a8550d04.mp3','2014-01-09 23:04:53',1,0);
insert  into `safe_execs`(`ID`,`COMMAND`,`ADDED`,`EXCLUSIVE`,`PRIORITY`) values (156,'mplayer /home/projects/php/projects/devel/majordomo/cached/voice/c8e8008c1693caf15e31c42ba3528ccf.mp3','2014-01-09 23:04:53',1,0);

/*Table structure for table `scenes` */

DROP TABLE IF EXISTS `scenes`;

CREATE TABLE `scenes` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `BACKGROUND` varchar(255) NOT NULL DEFAULT '',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `scenes` */

insert  into `scenes`(`ID`,`TITLE`,`BACKGROUND`,`PRIORITY`) values (1,'Scene 1','/cms/scenes/backgrounds/photolib.png',100);
insert  into `scenes`(`ID`,`TITLE`,`BACKGROUND`,`PRIORITY`) values (2,'Scene 2','/cms/scenes/backgrounds/photolib2.png',50);

/*Table structure for table `scheduled_job` */

DROP TABLE IF EXISTS `scheduled_job`;

CREATE TABLE `scheduled_job` (
  `scheduled_job_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `crontab` varchar(200) DEFAULT NULL,
  `last_run_date` datetime DEFAULT NULL,
  `next_run_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_periodical` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scheduled_job_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `scheduled_job` */

insert  into `scheduled_job`(`scheduled_job_id`,`name`,`crontab`,`last_run_date`,`next_run_date`,`status`,`is_active`,`is_periodical`) values (15,'NEW','* * * * *','2014-02-05 21:00:41','2014-02-05 21:01:41',0,1,1);

/*Table structure for table `scheduled_job_action` */

DROP TABLE IF EXISTS `scheduled_job_action`;

CREATE TABLE `scheduled_job_action` (
  `scheduled_job_action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `scheduled_job_id` int(11) NOT NULL,
  `params` varchar(200) NOT NULL,
  PRIMARY KEY (`scheduled_job_action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `scheduled_job_action` */

insert  into `scheduled_job_action`(`scheduled_job_action_id`,`type_id`,`scheduled_job_id`,`params`) values (20,2,15,'ThisComputer.1w_temp=2');

/*Table structure for table `script_categories` */

DROP TABLE IF EXISTS `script_categories`;

CREATE TABLE `script_categories` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `script_categories` */

insert  into `script_categories`(`ID`,`TITLE`) values (3,'Test');
insert  into `script_categories`(`ID`,`TITLE`) values (4,'<#LANG_GENERAL_OPERATIONAL_MODES#>');
insert  into `script_categories`(`ID`,`TITLE`) values (5,'<#LANG_GENERAL_SENSORS#>');

/*Table structure for table `scripts` */

DROP TABLE IF EXISTS `scripts`;

CREATE TABLE `scripts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `CODE` text,
  `DESCRIPTION` text,
  `TYPE` int(3) unsigned NOT NULL DEFAULT '0',
  `XML` text,
  `CATEGORY_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EXECUTED` datetime DEFAULT NULL,
  `EXECUTED_PARAMS` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `scripts` */

insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (1,'morningGreeting','say(\'Good morning!\');\r\nif (!getGlobal(\'ThisComputer.WeHaveGuests\')) {\r\n  runScript(\'sayTodayAgenda\',0);\r\n  runScript(\'playFavoriteMusic\',0);\r\n}\r\n','',1,'<xml>\r\n  <block type=\"majordomo_say\" inline=\"false\" x=\"140\" y=\"51\">\r\n    <value name=\"TEXT\">\r\n      <block type=\"text\">\r\n        <title name=\"TEXT\">Good morning!</title>\r\n      </block>\r\n    </value>\r\n    <next>\r\n      <block type=\"controls_if\" inline=\"false\">\r\n        <value name=\"IF0\">\r\n          <block type=\"logic_negate\" inline=\"false\">\r\n            <value name=\"BOOL\">\r\n              <block type=\"majordomo_getglobal\">\r\n                <title name=\"TEXT\">ThisComputer.WeHaveGuests</title>\r\n              </block>\r\n            </value>\r\n          </block>\r\n        </value>\r\n        <statement name=\"DO0\">\r\n          <block type=\"majordomo_runscript\" inline=\"false\">\r\n            <title name=\"TEXT\">sayTodayAgenda</title>\r\n            <next>\r\n              <block type=\"majordomo_runscript\" inline=\"false\">\r\n                <title name=\"TEXT\">playFavoriteMusic</title>\r\n              </block>\r\n            </next>\r\n          </block>\r\n        </statement>\r\n      </block>\r\n    </next>\r\n  </block>\r\n</xml>',0,'2013-08-25 16:33:27','a:1:{s:5:\"STATE\";s:3:\"off\";}');
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (8,'timeNow','say(timeNow());','',0,'',3,'2013-08-25 16:30:37','a:1:{s:6:\"script\";s:7:\"timeNow\";}');
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (9,'EconomChanged','','',1,'<xml xmlns=\"http://www.w3.org/1999/xhtml\">\r\n  <block type=\"controls_if\" inline=\"false\" x=\"197\" y=\"88\">\r\n    <mutation else=\"1\"></mutation>\r\n    <value name=\"IF0\">\r\n      <block type=\"majordomo_getglobal\">\r\n        <title name=\"TEXT\">ThisComputer.Econom</title>\r\n      </block>\r\n    </value>\r\n    <statement name=\"DO0\">\r\n      <block type=\"majordomo_say\" inline=\"false\">\r\n        <value name=\"TEXT\">\r\n          <block type=\"text\">\r\n            <title name=\"TEXT\">Перехожу в режим экономии</title>\r\n          </block>\r\n        </value>\r\n      </block>\r\n    </statement>\r\n    <statement name=\"ELSE\">\r\n      <block type=\"majordomo_say\" inline=\"false\">\r\n        <value name=\"TEXT\">\r\n          <block type=\"text\">\r\n            <title name=\"TEXT\">Выхожу из режима экономии</title>\r\n          </block>\r\n        </value>\r\n      </block>\r\n    </statement>\r\n  </block>\r\n</xml>',4,NULL,NULL);
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (3,'rssProcess','/*\r\n$params[\'URL\'] --link\r\n$params[\'TITLE\'] -- title\r\n$params[\'BODY\'] -- body\r\n$params[\'CHANNEL_ID\'] -- channel ID\r\n$params[\'CHANNEL_TITLE\'] -- channed title\r\n\r\n*/\r\n\r\n//say($params[\'TITLE\']); // reading news','',0,'',0,NULL,NULL);
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (10,'test','setTimeOut(\'testTimer\',\'say(\"Hello world!\");\',30);','',0,'',3,'2013-08-25 16:32:33','');
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (11,'on_1','sg(\'d_on\', 1);','',0,'',3,'2013-10-19 16:18:06','a:1:{s:5:\"STATE\";s:6:\"sadada\";}');
insert  into `scripts`(`ID`,`TITLE`,`CODE`,`DESCRIPTION`,`TYPE`,`XML`,`CATEGORY_ID`,`EXECUTED`,`EXECUTED_PARAMS`) values (12,'off_1','sg(\'d_on\', 0);','',0,'',3,'2013-10-19 16:10:30','a:1:{s:5:\"STATE\";s:6:\"sadada\";}');

/*Table structure for table `security_rules` */

DROP TABLE IF EXISTS `security_rules`;

CREATE TABLE `security_rules` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OBJECT_TYPE` char(20) NOT NULL DEFAULT '',
  `OBJECT_ID` int(10) NOT NULL DEFAULT '0',
  `TERMINALS` varchar(255) NOT NULL DEFAULT '',
  `TERMINALS_EXCEPT` int(3) NOT NULL DEFAULT '0',
  `USERS` varchar(255) NOT NULL DEFAULT '',
  `USERS_EXCEPT` int(3) NOT NULL DEFAULT '0',
  `TIMES` varchar(255) NOT NULL DEFAULT '',
  `TIMES_EXCEPT` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `security_rules` */

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PRIORITY` int(3) unsigned NOT NULL DEFAULT '0',
  `HR` int(3) unsigned NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `TYPE` varchar(59) NOT NULL DEFAULT '',
  `NOTES` text NOT NULL,
  `VALUE` varchar(255) NOT NULL DEFAULT '',
  `DEFAULTVALUE` varchar(255) NOT NULL DEFAULT '',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `URL_TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (1,255,0,'Site Title','SITE_TITLE','text','','MajorDoMo','CMS1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (2,254,0,'Site Domain Name','SITE_DOMAIN','text','','domain.com','domain.com','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (3,0,0,'Contact E-mail','SITE_EMAIL','text','','info@domain.com','info@domain.com','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (7,0,0,'Days to show in \"soon\" section','APP_CALENDAR_SOONLIMIT','text','','6','6','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (8,0,0,'Show recently done items','APP_CALENDAR_SHOWDONE','yesno','','1','1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (9,0,0,'Scene width','SCENES_WIDTH','text','','803','803','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (24,0,0,'Scene height','SCENES_HEIGHT','text','','606','606','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (29,100,0,'Run bluetooth scanner','BLUETOOTH_CYCLE','onoff','','0','0','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (30,100,0,'Run Skype script','SKYPE_CYCLE','onoff','','0','0','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (31,30,0,'Twitter Consumer key','TWITTER_CKEY','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (32,29,0,'Twitter Consumer secret','TWITTER_CSECRET','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (33,28,0,'Twitter Access token','TWITTER_ATOKEN','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (34,27,0,'Twitter Access token secret','TWITTER_ASECRET','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (35,0,0,'Save debug information to history','DEBUG_HISTORY','onoff','','0','0','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (36,60,0,'Use Google Text-to-Speech engine','TTS_GOOGLE','onoff','','1','1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (41,0,0,'Voice notifications language','VOICE_LANGUAGE','text','','ru','en','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (44,0,0,'Play sound signal before speaking','SPEAK_SIGNAL','onoff','','1','1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (45,0,0,'Pushover.net user key','PUSHOVER_USER_KEY','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (46,0,0,'Pushover.net message minimum level','PUSHOVER_LEVEL','text','','1','1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (47,0,0,'Language','SITE_LANGUAGE','text','','ru','en','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (48,0,0,'Time zone','SITE_TIMEZONE','text','','Indian/Reunion','Europe/Moscow','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (49,0,0,'Color theme','THEME','text','','light','dark','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (54,43,0,'Forward notification to Growl service','GROWL_ENABLE','onoff','','0','0','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (55,42,0,'Growl service hostname','GROWL_HOST','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (56,41,0,'Growl service password (optional)','GROWL_PASSWORD','text','','','','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (57,40,0,'Growl notification minimum level','GROWL_LEVEL','text','','1','1','','');
insert  into `settings`(`ID`,`PRIORITY`,`HR`,`TITLE`,`NAME`,`TYPE`,`NOTES`,`VALUE`,`DEFAULTVALUE`,`URL`,`URL_TITLE`) values (58,2000,0,'graphite host','GRAPHITE_HOST','text','','1234','','','');

/*Table structure for table `sheduled_job_object` */

DROP TABLE IF EXISTS `sheduled_job_object`;

CREATE TABLE `sheduled_job_object` (
  `sheduled_job_object_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `start_sheduled_job_id` int(11) NOT NULL,
  `stop_sheduled_job_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `is_periodical` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`sheduled_job_object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sheduled_job_object` */

/*Table structure for table `shoplist` */

DROP TABLE IF EXISTS `shoplist`;

CREATE TABLE `shoplist` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shoplist` */

/*Table structure for table `shopping_list_items` */

DROP TABLE IF EXISTS `shopping_list_items`;

CREATE TABLE `shopping_list_items` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `PRODUCT_ID` int(10) NOT NULL DEFAULT '0',
  `PRICE` float NOT NULL DEFAULT '0',
  `CODE` varchar(255) NOT NULL DEFAULT '',
  `IN_CART` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `shopping_list_items` */

/*Table structure for table `shoutrooms` */

DROP TABLE IF EXISTS `shoutrooms`;

CREATE TABLE `shoutrooms` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(250) NOT NULL DEFAULT '',
  `PRIORITY` int(10) NOT NULL DEFAULT '0',
  `ADDED_BY` int(10) NOT NULL DEFAULT '0',
  `ADDED` datetime DEFAULT NULL,
  `IS_PUBLIC` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `shoutrooms` */

/*Table structure for table `shouts` */

DROP TABLE IF EXISTS `shouts`;

CREATE TABLE `shouts` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_ID` int(10) NOT NULL DEFAULT '0',
  `MEMBER_ID` int(10) NOT NULL DEFAULT '0',
  `MESSAGE` varchar(255) NOT NULL DEFAULT '',
  `ADDED` datetime DEFAULT NULL,
  `IMPORTANCE` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Data for the table `shouts` */

/*Table structure for table `snmpdevices` */

DROP TABLE IF EXISTS `snmpdevices`;

CREATE TABLE `snmpdevices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `HOST` varchar(255) NOT NULL DEFAULT '',
  `STATUS` int(3) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `CODE` text,
  `MIB_FILE` varchar(70) NOT NULL DEFAULT '',
  `READ_COMMUNITY` varchar(255) NOT NULL DEFAULT '',
  `WRITE_COMMUNITY` varchar(255) NOT NULL DEFAULT '',
  `TRAPLOG` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `snmpdevices` */

/*Table structure for table `snmpproperties` */

DROP TABLE IF EXISTS `snmpproperties`;

CREATE TABLE `snmpproperties` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(10) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `OID` varchar(255) NOT NULL DEFAULT '',
  `VALUE` varchar(255) NOT NULL DEFAULT '',
  `TYPE` char(10) NOT NULL DEFAULT '',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `ONLINE_INTERVAL` int(10) NOT NULL DEFAULT '0',
  `CHECK_NEXT` datetime DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `snmpproperties` */

/*Table structure for table `tdwiki` */

DROP TABLE IF EXISTS `tdwiki`;

CREATE TABLE `tdwiki` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL DEFAULT '',
  `CONTENT` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tdwiki` */

insert  into `tdwiki`(`ID`,`NAME`,`CONTENT`) values (1,'','<!--#\n @version 0.1 (auto-set)\n#-->\n<div tiddler=\"DefaultTiddlers\" modified=\"200610311519\" modifier=\"Serge J.\" tags=\"\">[[Notes]]</div>\r\n<div tiddler=\"MainMenu\" modified=\"200610311519\" modifier=\"Serge J.\" tags=\"\">[[Notes]]  [[FormattingInstructions]] [[MainMenu]] [[DefaultTiddlers]]</div>\r\n<div tiddler=\"FormattingInstructions\" modified=\"200607061334\" modifier=\"YourName\" tags=\"\">TiddlyWiki uses Wiki style markup, a way of lightly &quot;tagging&quot; plain text so it can be transformed into HTML. Edit this Tiddler to see samples.\\n\\n! Header Samples\\n!Header 1\\n!!Header 2\\n!!!Header 3\\n!!!!Header 4\\n!!!!!Header 5\\n\\n! Unordered Lists:\\n* Lists are where it\'s at\\n* Just use an asterisk and you\'re set\\n** To nest lists just add more asterisks...\\n***...like this\\n* The circle makes a great bullet because once you\'ve printed a list you can mark off completed items\\n* You can also nest mixed list types\\n## Like this\\n\\n! Ordered Lists\\n# Ordered lists are pretty neat too\\n# If you\'re handy with HTML and CSS you could customize the [[numbering scheme|http://www.w3schools.com/css/pr_list-style-type.asp]]\\n## To nest, just add more octothorpes (pound signs)...\\n### Like this\\n* You can also\\n** Mix list types\\n*** like this\\n# Pretty neat don\'t you think?\\n\\n! Tiddler links\\nTo create a Tiddler link, just use mixed-case WikiWord, or use [[brackets]] for NonWikiWordLinks. This is how the GTD style [[@Action]] lists are created. \\n\\nNote that existing Tiddlers are in bold and empty Tiddlers are in italics. See CreatingTiddlers for details.\\n\\n! External Links\\nYou can link to [[external sites|http://google.com]] with brackets. You can also LinkToFolders on your machine or network shares.\\n\\n! Images\\nEdit this tiddler to see how it\'s done.\\n[img[http://img110.echo.cx/img110/139/gorilla8nw.jpg]]\\n\\n!Tables\\n|!th1111111111|!th2222222222|\\n|&gt;| colspan |\\n| rowspan |left|\\n|~| right|\\n|colored| center |\\n|caption|c\\n\\nFor a complex table example, see PeriodicTable.\\n\\n! Horizontal Rules\\nYou can divide a tiddler into\\n----\\nsections by typing four dashes on a line by themselves.\\n\\n! Blockquotes\\n&lt;&lt;&lt;\\nThis is how you do an extended, wrapped blockquote so you don\'t have to put angle quotes on every line.\\n&lt;&lt;&lt;\\n&gt;level 1\\n&gt;level 1\\n&gt;&gt;level 2\\n&gt;&gt;level 2\\n&gt;&gt;&gt;level 3\\n&gt;&gt;&gt;level 3\\n&gt;&gt;level 2\\n&gt;level 1\\n\\n! Other Formatting\\n\'\'Bold\'\'\\n==Strike==\\n__Underline__\\n//Italic//\\nSuperscript: 2^^3^^=8\\nSubscript: a~~ij~~ = -a~~ji~~\\n@@highlight@@ Unfortunately highlighting is broken right now.\\n@@color(green):green colored@@\\n@@bgcolor(#ff0000):color(#ffffff):red colored@@ Hex colors are also broken right now.\\n</div>');
insert  into `tdwiki`(`ID`,`NAME`,`CONTENT`) values (2,'default','<!--#\n @version 0.1 (auto-set)\n#-->\n<div tiddler=\"DefaultTiddlers\" modified=\"200610311519\" modifier=\"Serge J.\" tags=\"\">[[Notes]]</div>\r\n<div tiddler=\"MainMenu\" modified=\"200610311519\" modifier=\"Serge J.\" tags=\"\">[[Notes]]  [[FormattingInstructions]] [[MainMenu]] [[DefaultTiddlers]]</div>\r\n<div tiddler=\"FormattingInstructions\" modified=\"200607061334\" modifier=\"YourName\" tags=\"\">TiddlyWiki uses Wiki style markup, a way of lightly &quot;tagging&quot; plain text so it can be transformed into HTML. Edit this Tiddler to see samples.\\n\\n! Header Samples\\n!Header 1\\n!!Header 2\\n!!!Header 3\\n!!!!Header 4\\n!!!!!Header 5\\n\\n! Unordered Lists:\\n* Lists are where it\'s at\\n* Just use an asterisk and you\'re set\\n** To nest lists just add more asterisks...\\n***...like this\\n* The circle makes a great bullet because once you\'ve printed a list you can mark off completed items\\n* You can also nest mixed list types\\n## Like this\\n\\n! Ordered Lists\\n# Ordered lists are pretty neat too\\n# If you\'re handy with HTML and CSS you could customize the [[numbering scheme|http://www.w3schools.com/css/pr_list-style-type.asp]]\\n## To nest, just add more octothorpes (pound signs)...\\n### Like this\\n* You can also\\n** Mix list types\\n*** like this\\n# Pretty neat don\'t you think?\\n\\n! Tiddler links\\nTo create a Tiddler link, just use mixed-case WikiWord, or use [[brackets]] for NonWikiWordLinks. This is how the GTD style [[@Action]] lists are created. \\n\\nNote that existing Tiddlers are in bold and empty Tiddlers are in italics. See CreatingTiddlers for details.\\n\\n! External Links\\nYou can link to [[external sites|http://google.com]] with brackets. You can also LinkToFolders on your machine or network shares.\\n\\n! Images\\nEdit this tiddler to see how it\'s done.\\n[img[http://img110.echo.cx/img110/139/gorilla8nw.jpg]]\\n\\n!Tables\\n|!th1111111111|!th2222222222|\\n|&gt;| colspan |\\n| rowspan |left|\\n|~| right|\\n|colored| center |\\n|caption|c\\n\\nFor a complex table example, see PeriodicTable.\\n\\n! Horizontal Rules\\nYou can divide a tiddler into\\n----\\nsections by typing four dashes on a line by themselves.\\n\\n! Blockquotes\\n&lt;&lt;&lt;\\nThis is how you do an extended, wrapped blockquote so you don\'t have to put angle quotes on every line.\\n&lt;&lt;&lt;\\n&gt;level 1\\n&gt;level 1\\n&gt;&gt;level 2\\n&gt;&gt;level 2\\n&gt;&gt;&gt;level 3\\n&gt;&gt;&gt;level 3\\n&gt;&gt;level 2\\n&gt;level 1\\n\\n! Other Formatting\\n\'\'Bold\'\'\\n==Strike==\\n__Underline__\\n//Italic//\\nSuperscript: 2^^3^^=8\\nSubscript: a~~ij~~ = -a~~ji~~\\n@@highlight@@ Unfortunately highlighting is broken right now.\\n@@color(green):green colored@@\\n@@bgcolor(#ff0000):color(#ffffff):red colored@@ Hex colors are also broken right now.\\n</div>');

/*Table structure for table `terminals` */

DROP TABLE IF EXISTS `terminals`;

CREATE TABLE `terminals` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `HOST` varchar(255) NOT NULL DEFAULT '',
  `CANPLAY` int(3) NOT NULL DEFAULT '0',
  `PLAYER_TYPE` char(10) NOT NULL DEFAULT '',
  `PLAYER_PORT` varchar(255) NOT NULL DEFAULT '',
  `PLAYER_USERNAME` varchar(255) NOT NULL DEFAULT '',
  `PLAYER_PASSWORD` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `terminals` */

insert  into `terminals`(`ID`,`NAME`,`TITLE`,`HOST`,`CANPLAY`,`PLAYER_TYPE`,`PLAYER_PORT`,`PLAYER_USERNAME`,`PLAYER_PASSWORD`) values (2,'MAIN','Server','localhost',1,'','','','');

/*Table structure for table `usbdevices` */

DROP TABLE IF EXISTS `usbdevices`;

CREATE TABLE `usbdevices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `SERIAL` varchar(255) NOT NULL DEFAULT '',
  `LOG` text NOT NULL,
  `LAST_FOUND` datetime DEFAULT NULL,
  `FIRST_FOUND` datetime DEFAULT NULL,
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `SCRIPT` text NOT NULL,
  `SCRIPT_ID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `usbdevices` */

/*Table structure for table `userlog` */

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL DEFAULT '0',
  `MESSAGE` varchar(100) NOT NULL DEFAULT '',
  `IP` varchar(20) NOT NULL DEFAULT '',
  `ADDED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `userlog` */

insert  into `userlog`(`ID`,`USER_ID`,`MESSAGE`,`IP`,`ADDED`) values (1,1,'Logged In','127.0.0.1','2013-05-18 15:33:30');
insert  into `userlog`(`ID`,`USER_ID`,`MESSAGE`,`IP`,`ADDED`) values (2,1,'Logged In','192.168.1.201','2013-08-24 00:11:51');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL DEFAULT '',
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL DEFAULT '',
  `SKYPE` varchar(255) NOT NULL DEFAULT '',
  `MOBILE` varchar(255) NOT NULL DEFAULT '',
  `AVATAR` varchar(255) NOT NULL DEFAULT '',
  `PASSWORD` varchar(255) NOT NULL DEFAULT '',
  `IS_ADMIN` tinyint(3) NOT NULL DEFAULT '0',
  `IS_DEFAULT` tinyint(3) NOT NULL DEFAULT '0',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `HOST` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`ID`,`USERNAME`,`NAME`,`EMAIL`,`SKYPE`,`MOBILE`,`AVATAR`,`PASSWORD`,`IS_ADMIN`,`IS_DEFAULT`,`LINKED_OBJECT`,`HOST`) values (1,'user1','User1','user@domain.com','','','','',1,1,'','');

/*Table structure for table `watchfolders` */

DROP TABLE IF EXISTS `watchfolders`;

CREATE TABLE `watchfolders` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `FOLDER` varchar(255) NOT NULL DEFAULT '',
  `CHECK_MASK` varchar(255) NOT NULL DEFAULT '',
  `CHECK_LATEST` datetime DEFAULT NULL,
  `CHECK_NEXT` datetime DEFAULT NULL,
  `CHECK_INTERVAL` int(255) NOT NULL DEFAULT '0',
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `SCRIPT_TYPE` int(255) NOT NULL DEFAULT '0',
  `CHECK_RESULTS` longtext,
  `CHECK_SUB` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `watchfolders` */

/*Table structure for table `webvars` */

DROP TABLE IF EXISTS `webvars`;

CREATE TABLE `webvars` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `HOSTNAME` varchar(255) NOT NULL DEFAULT '',
  `TYPE` int(30) NOT NULL DEFAULT '0',
  `SEARCH_PATTERN` varchar(255) NOT NULL DEFAULT '',
  `CHECK_PATTERN` varchar(255) NOT NULL DEFAULT '',
  `LATEST_VALUE` text NOT NULL,
  `CHECK_LATEST` datetime DEFAULT NULL,
  `CHECK_NEXT` datetime DEFAULT NULL,
  `SCRIPT_ID` int(10) NOT NULL DEFAULT '0',
  `ONLINE_INTERVAL` int(10) NOT NULL DEFAULT '0',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `CODE` text,
  `LOG` text,
  `ENCODING` varchar(50) NOT NULL DEFAULT '',
  `AUTH` int(3) NOT NULL DEFAULT '0',
  `USERNAME` varchar(100) NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `webvars` */

insert  into `webvars`(`ID`,`TITLE`,`HOSTNAME`,`TYPE`,`SEARCH_PATTERN`,`CHECK_PATTERN`,`LATEST_VALUE`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`ONLINE_INTERVAL`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CODE`,`LOG`,`ENCODING`,`AUTH`,`USERNAME`,`PASSWORD`) values (1,'<#LANG_GENERAL_WEATHER_FORECAST#>','http://pogoda.tut.by/pda/city/26850/',0,'город<\\/a><br>(.+?)<br \\/><a','','\n<br>  \n<b>Сегодня:</b><br />днем: +4&deg;...+6&deg;, пасмурно, ночью: +3&deg;...+5&deg;,\nпасмурно, небольшой дождь, ветер: З — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +4&deg;...+6&deg;, пасмурно, без существенных осадков, ночью: +3&deg;...+5&deg;,\nпасмурно, ветер: ЮЗ — 10-12 м/с, давление: 746 мм.рт.ст, влажность: 85%<br /><br />\n','2014-01-09 22:47:37','2014-01-10 00:47:37',0,7200,'ThisComputer','weatherFull','','2014-01-09 22:47:37 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +4&deg;...+6&deg;, пасмурно, ночью: +3&deg;...+5&deg;,\nпасмурно, небольшой дождь, ветер: З — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +4&deg;...+6&deg;, пасмурно, без существенных осадков, ночью: +3&deg;...+5&deg;,\nпасмурно, ветер: ЮЗ — 10-12 м/с, давление: 746 мм.рт.ст, влажность: 85%<br /><br />\n\n2014-01-09 18:17:37 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +4&deg;...+6&deg;, пасмурно, ночью: +3&deg;...+5&deg;,\nпасмурно, небольшой дождь, ветер: З — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +4&deg;...+6&deg;, пасмурно, без существенных осадков, ночью: +3&deg;...+5&deg;,\nпасмурно, ветер: ЮЗ — 9-11 м/с, давление: 746 мм.рт.ст, влажность: 90%<br /><br />\n\n2013-09-13 11:19:39 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\nоблачно, ветер: В — 5-7 м/с, давление: 760 мм.рт.ст, влажность: 90%<br /><br />\n<b>Завтра:</b><br />днем: +13&deg;...+15&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\nдождь, гроза, ветер: В — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 95%<br /><br />\n\n2013-09-12 21:33:20 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +20&deg;...+22&deg;, переменная облачность, ночью: +9&deg;...+11&deg;,\nпеременная облачность, ветер: ЮВ — 4-6 м/с, давление: 761 мм.рт.ст, влажность: 60%<br /><br />\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, небольшой дождь, ночью: +14&deg;...+16&deg;,\nоблачно, без существенных осадков, ветер: В — 4-6 м/с, давление: 760 мм.рт.ст, влажность: 80%<br /><br />\n\n2013-09-12 18:46:21 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, облачно, ночью: +9&deg;...+11&deg;,\nпеременная облачность, ветер: ЮВ — 3-5 м/с, давление: 761 мм.рт.ст, влажность: 65%<br /><br />\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\nоблачно, без существенных осадков, ветер: В — 5-7 м/с, давление: 759 мм.рт.ст, влажность: 90%<br /><br />\n\n2013-09-12 09:48:21 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\nпеременная облачность, ветер: ЮВ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 70%<br /><br />\n<b>Завтра:</b><br />днем: +14&deg;...+16&deg;, облачно, без существенных осадков, ночью: +13&deg;...+15&deg;,\nоблачно, ветер: В — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 95%<br /><br />\n\n2013-09-11 23:12:22 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nоблачно, ветер: Ю — 4-6 м/с, давление: 763 мм.рт.ст, влажность: 60%<br /><br />\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\nпеременная облачность, ветер: ЮВ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 70%<br /><br />\n\n2013-09-11 14:22:20 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nоблачно, ветер: Ю — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 65%<br /><br />\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\nпеременная облачность, ветер: ЮВ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 75%<br /><br />\n\n2013-09-09 18:57:12 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +7&deg;...+9&deg;,\nясно, ветер: В — 1-3 м/с, давление: 765 мм.рт.ст, влажность: 55%<br /><br />\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +10&deg;...+12&deg;,\nясно, ветер: Ю — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 55%<br /><br />\n\n2013-09-09 08:21:13 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +10&deg;...+12&deg;,\nясно, ветер: В — 2-4 м/с, давление: 765 мм.рт.ст, влажность: 55%<br /><br />\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nпеременная облачность, ветер: Ю — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 55%<br /><br />\n\n2013-09-03 19:43:59 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +13&deg;...+15&deg;, дождь, гроза, ночью: +9&deg;...+11&deg;,\nоблачно, без существенных осадков, ветер: C — 7-9 м/с, давление: 754 мм.рт.ст, влажность: 80%<br /><br />\n<b>Завтра:</b><br />днем: +15&deg;...+17&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nоблачно, ветер: C — 7-9 м/с, давление: 764 мм.рт.ст, влажность: 70%<br /><br />\n\n2013-09-02 19:16:57 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +13&deg;...+15&deg;, дождь, гроза, ночью: +10&deg;...+12&deg;,\nясно, ветер: ЮЗ — 7-9 м/с, давление: 757 мм.рт.ст, влажность: 70%<br /><br />\n<b>Завтра:</b><br />днем: +13&deg;...+15&deg;, дождь, гроза, ночью: +10&deg;...+12&deg;,\nдождь, ветер: C — 8-10 м/с, давление: 753 мм.рт.ст, влажность: 80%<br /><br />\n\n2013-09-01 20:14:33 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +10&deg;...+12&deg;,\nпеременная облачность, ветер: З — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 75%<br /><br />\n<b>Завтра:</b><br />днем: +12&deg;...+14&deg;, дождь, гроза, ночью: +10&deg;...+12&deg;,\nпеременная облачность, ветер: ЮЗ — 7-9 м/с, давление: 757 мм.рт.ст, влажность: 80%<br /><br />\n\n2013-08-29 20:17:28 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, переменная облачность, ночью: +6&deg;...+8&deg;,\nпеременная облачность, ветер: C — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 65%<br /><br />\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +10&deg;...+12&deg;,\nпеременная облачность, ветер: C — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 55%<br /><br />\n\n2013-08-26 19:19:21 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, переменная облачность, ночью: +10&deg;...+12&deg;,\nоблачно, ветер: CВ — 4-6 м/с, давление: 765 мм.рт.ст, влажность: 55%<br /><br />\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nпеременная облачность, ветер: В — 4-6 м/с, давление: 766 мм.рт.ст, влажность: 60%<br /><br />\n\n2013-08-25 16:21:39 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +14&deg;...+16&deg;, облачно, ночью: +10&deg;...+12&deg;,\nоблачно, ветер: C — 5-7 м/с, давление: 764 мм.рт.ст, влажность: 65%<br /><br />\n<b>Завтра:</b><br />днем: +17&deg;...+19&deg;, переменная облачность, ночью: +11&deg;...+13&deg;,\nоблачно, без существенных осадков, ветер: CВ — 5-7 м/с, давление: 765 мм.рт.ст, влажность: 60%<br /><br />\n\n2013-08-23 21:01:53 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +15&deg;...+17&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\nоблачно, ветер: C — 6-8 м/с, давление: 762 мм.рт.ст, влажность: 85%<br /><br />\n<b>Завтра:</b><br />днем: +14&deg;...+16&deg;, облачно, ночью: +12&deg;...+14&deg;,\nпеременная облачность, ветер: C — 6-8 м/с, давление: 763 мм.рт.ст, влажность: 70%<br /><br />\n\n2013-08-22 19:42:34 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +22&deg;...+24&deg;, облачно, ночью: +16&deg;...+18&deg;,\nпеременная облачность, ветер: ЮЗ — 4-6 м/с, давление: 762 мм.рт.ст, влажность: 55%<br /><br />\n<b>Завтра:</b><br />днем: +15&deg;...+17&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\nдождь, гроза, ветер: C — 6-8 м/с, давление: 762 мм.рт.ст, влажность: 85%<br /><br />\n\n2013-08-21 19:32:04 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +24&deg;...+26&deg;, переменная облачность, ночью: +17&deg;...+19&deg;,\nпеременная облачность, ветер: ЮЗ — 1-3 м/с, давление: 766 мм.рт.ст, влажность: 60%<br /><br />\n<b>Завтра:</b><br />днем: +24&deg;...+26&deg;, дождь, гроза, ночью: +17&deg;...+19&deg;,\nоблачно, ветер: Ю — 3-5 м/с, давление: 761 мм.рт.ст, влажность: 50%<br /><br />\n\n2013-08-20 21:05:35 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, ночью: +18&deg;...+20&deg;,\nоблачно, ветер: Ю — 4-6 м/с, давление: 765 мм.рт.ст, влажность: 50%<br /><br />\n<b>Завтра:</b><br />днем: +25&deg;...+27&deg;, переменная облачность, ночью: +18&deg;...+20&deg;,\nпеременная облачность, ветер: ЮЗ — 2-4 м/с, давление: 765 мм.рт.ст, влажность: 45%<br /><br />\n\n2013-08-09 13:22:43 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +33&deg;...+35&deg;, переменная облачность, ночью: +18&deg;...+20&deg;,\nясно, ветер: ЮЗ — 4-6 м/с, давление: 761 мм.рт.ст, влажность: 30%<br /><br />\n<b>Завтра:</b><br />днем: +31&deg;...+33&deg;, переменная облачность, ночью: +18&deg;...+20&deg;,\nпеременная облачность, ветер: Ю — 3-5 м/с, давление: 760 мм.рт.ст, влажность: 35%<br /><br />\n\n2013-05-18 15:32:19 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\nясно, ветер: ЮВ — 5-7 м/с, давление: 760 мм.рт.ст, влажность: 35%<br /><br />\n<b>Завтра:</b><br />днем: +23&deg;...+25&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\nпеременная облачность, небольшой дождь, ветер: Ю — 4-6 м/с, давление: 760 мм.рт.ст, влажность: 65%<br /><br />\n\n2013-03-06 15:46:08 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +0&deg;, переменная облачность, ночью: -4&deg;...-6&deg;,\nясно, ветер: ЮЗ — 4-6 м/с, давление: 759 мм.рт.ст, влажность: 100%<br /><br />\n<b>Завтра:</b><br />днем: +0&deg;...-2&deg;, переменная облачность, ночью: -1&deg;...-3&deg;,\nоблачно, ветер: C — 3-5 м/с, давление: 761 мм.рт.ст, влажность: 90%<br /><br />\n\n2012-11-17 15:01:40 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +2&deg;...+4&deg;, облачно, ночью: +1&deg;...+3&deg;,\nоблачно, ветер: Ю — 4-6 м/с, давление: 768 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, облачно, ночью: +0&deg;,\nоблачно, ветер: Ю — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 90%<br /><br />\n\n2012-11-17 14:33:22 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +2&deg;...+4&deg;, облачно, ночью: +1&deg;...+3&deg;,\nоблачно, ветер: Ю — 4-6 м/с, давление: 768 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, облачно, ночью: +0&deg;,\nоблачно, ветер: Ю — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 90%<br /><br />\n\n2012-11-16 14:20:58 new value:\n<br>  \n<b>Сегодня:</b><br />днем: +3&deg;...+5&deg;, облачно, ночью: +0&deg;...+2&deg;,\nоблачно, ветер: З — 3-5 м/с, давление: 769 мм.рт.ст, влажность: 95%<br /><br />\n<b>Завтра:</b><br />днем: +1&deg;...+3&deg;, облачно, ночью: +1&deg;...+3&deg;,\nоблачно, ветер: Ю — 4-6 м/с, давление: 768 мм.рт.ст, влажность: 90%<br /><br />\n\n2012-11-16 14:15:56 incorrect value:\n2012-11-16 14:15:43 incorrect value:\n2012-11-16 13:58:39 incorrect value:\n2012-11-07 14:02:19 incorrect value:\n2012-11-07 12:02:19 incorrect value:\n2012-11-07 10:02:19 incorrect value:\n2012-11-07 08:02:19 incorrect value:\n2012-11-07 06:02:19 incorrect value:\n2012-11-07 04:02:19 incorrect value:\n2012-11-07 02:02:19 incorrect value:\n2012-11-07 00:02:19 incorrect value:\n2012-11-06 22:02:19 incorrect value:\n2012-11-06 20:02:19 incorrect value:\n2012-11-06 18:02:20 incorrect value:\n2012-11-03 13:58:16 incorrect value:\n2012-11-03 11:58:16 incorrect value:\n2012-11-03 09:58:16 incorrect value:\n2012-11-03 07:58:16 incorrect value:\n2012-11-03 05:58:16 incorrect value:\n2012-11-03 03:58:16 incorrect value:\n2012-11-03 01:58:16 incorrect value:\n2012-11-02 23:58:16 incorrect value:\n2012-11-02 21:58:16 incorrect value:\n2012-11-02 19:58:16 incorrect value:\n2012-11-02 17:58:16 incorrect value:\n2012-11-02 15:58:16 incorrect value:\n2012-11-02 13:58:15 incorrect value:\n2012-11-02 11:58:15 incorrect value:\n2012-11-02 09:58:22 incorrect value:\n2012-11-02 07:58:15 incorrect value:\n2012-11-02 05:58:15 incorrect value:\n2012-11-02 03:58:15 incorrect value:\n2012-11-02 01:58:15 incorrect value:\n2012-11-01 23:58:15 incorrect value:\n2012-11-01 21:58:15 incorrect value:\n2012-11-01 19:58:15 incorrect value:\n2012-11-01 17:58:15 incorrect value:\n2012-11-01 15:58:15 incorrect value:\n2012-11-01 13:58:16 incorrect value:\n2012-11-01 11:58:15 incorrect value:\n2012-11-01 09:58:15 incorrect value:\n2012-11-01 07:58:15 incorrect value:\n2012-11-01 05:58:16 incorrect value:\n2012-11-01 03:58:15 incorrect value:\n2012-11-01 01:58:16 incorrect value:\n2012-10-31 23:58:15 incorrect value:\n2012-10-31 21:58:16 incorrect value:\n2012-10-31 19:58:15 incorrect value:\n2012-10-31 17:58:15 incorrect value:\n2012-10-31 15:58:15 incorrect value:\n2012-10-31 13:58:15 incorrect value:\n2012-10-31 11:58:15 incorrect value:\n2012-10-31 09:58:15 incorrect value:\n2012-10-31 07:58:15 incorrect value:\n2012-10-31 05:58:15 incorrect value:\n2012-10-31 03:58:15 incorrect value:\n2012-10-31 01:58:16 incorrect value:\n2012-10-30 23:58:15 incorrect value:\n2012-10-30 21:58:15 incorrect value:\n2012-10-30 19:58:15 incorrect value:\n2012-10-30 17:58:14 incorrect value:\n2012-10-30 15:58:14 incorrect value:\n2012-10-30 13:58:14 incorrect value:\n2012-10-30 11:58:14 incorrect value:\n2012-10-30 09:58:14 incorrect value:\n2012-10-30 07:58:14 incorrect value:\n2012-10-30 05:58:14 incorrect value:\n2012-10-30 03:58:14 incorrect value:\n2012-10-30 01:58:15 incorrect value:\n2012-10-29 23:58:14 incorrect value:\n2012-10-29 21:58:14 incorrect value:\n2012-10-29 19:58:14 incorrect value:\n2012-10-29 17:58:14 incorrect value:\n2012-10-29 15:58:14 incorrect value:\n2012-10-29 13:58:14 incorrect value:\n2012-10-29 11:58:14 incorrect value:\n2012-10-29 09:58:15 incorrect value:\n2012-10-29 07:58:14 incorrect value:\n2012-10-29 05:59:16 incorrect value:\n2012-10-29 03:57:09 incorrect value:\n2012-10-29 01:57:09 incorrect value:\n2012-10-28 23:55:18 incorrect value:\n2012-10-28 21:55:18 incorrect value:\n2012-10-28 19:55:18 incorrect value:\n2012-10-28 17:55:18 incorrect value:\n2012-10-28 15:55:18 incorrect value:\n2012-10-28 13:55:19 incorrect value:\n2012-10-28 11:55:18 incorrect value:\n2012-10-28 09:55:19 incorrect value:\n2012-10-28 07:55:18 incorrect value:\n2012-10-28 05:55:18 incorrect value:\n2012-10-28 03:55:18 incorrect value:\n2012-10-28 01:55:18 incorrect value:\n2012-10-27 23:55:18 incorrect value:\n2012-10-27 21:55:18 incorrect value:\n2012-10-27 19:55:18 incorrect value:\n2012-10-27 17:55:18 incorrect value:\n2012-10-27 15:55:18 incorrect value:\n2012-10-27 13:55:18 incorrect value:\n2012-10-27 11:55:18 incorrect value:\n2012-10-27 09:55:18 incorrect value:\n2012-10-27 07:55:18 incorrect value:\n2012-10-27 05:55:18 incorrect value:\n2012-10-27 03:55:18 incorrect value:\n2012-10-27 01:55:18 incorrect value:\n2012-10-26 23:55:18 incorrect value:\n2012-10-26 21:55:18 incorrect value:\n2012-10-26 19:55:18 incorrect value:\n2012-10-26 17:55:18 incorrect value:\n2012-10-26 15:55:18 incorrect value:\n2012-10-26 13:55:18 incorrect value:\n2012-10-26 11:55:18 incorrect value:\n2012-10-26 09:55:19 incorrect value:\n2012-10-26 07:55:18 incorrect value:\n2012-10-26 05:55:18 incorrect value:\n2012-10-26 03:55:18 incorrect value:\n2012-10-26 01:55:19 incorrect value:\n2012-10-25 23:55:18 incorrect value:\n2012-10-25 21:55:18 incorrect value:\n2012-10-25 19:55:18 incorrect value:\n2012-10-25 17:55:18 incorrect value:\n2012-10-25 15:55:18 incorrect value:\n2012-10-25 13:55:19 incorrect value:\n2012-10-25 11:55:18 incorrect value:\n2012-10-25 09:55:18 incorrect value:\n2012-10-25 07:55:18 incorrect value:\n2012-10-25 05:55:18 incorrect value:\n2012-10-25 03:55:18 incorrect value:\n2012-10-25 01:55:18 incorrect value:\n2012-10-24 23:55:18 incorrect value:\n2012-10-24 21:55:18 incorrect value:\n2012-10-24 19:55:18 incorrect value:\n2012-10-24 17:55:18 incorrect value:\n2012-10-24 15:55:18 incorrect value:\n2012-10-24 13:55:18 incorrect value:\n2012-10-24 11:55:18 incorrect value:\n2012-10-24 09:55:19 incorrect value:\n2012-10-24 07:55:18 incorrect value:\n2012-10-24 05:55:18 incorrect value:\n2012-10-24 03:55:18 incorrect value:\n2012-10-24 01:55:18 incorrect value:\n2012-10-23 23:55:18 incorrect value:\n2012-10-23 21:55:18 incorrect value:\n2012-10-23 19:55:18 incorrect value:\n2012-10-23 17:55:19 incorrect value:\n2012-10-23 15:55:18 incorrect value:\n2012-10-23 13:55:18 incorrect value:\n2012-10-23 11:55:18 incorrect value:\n2012-10-23 09:55:18 incorrect value:\n2012-10-23 07:55:18 incorrect value:\n2012-10-23 05:55:18 incorrect value:\n2012-10-23 03:55:17 incorrect value:\n2012-10-23 01:55:17 incorrect value:\n2012-10-22 23:55:17 incorrect value:\n2012-10-22 21:55:17 incorrect value:\n2012-10-22 19:55:17 incorrect value:\n2012-10-22 17:55:18 incorrect value:\n2012-10-22 15:55:17 incorrect value:\n2012-10-22 13:55:20 incorrect value:\n2012-10-22 11:55:17 incorrect value:\n2012-10-22 09:55:17 incorrect value:\n2012-10-22 07:55:17 incorrect value:\n2012-10-22 05:55:17 incorrect value:\n2012-10-22 03:55:17 incorrect value:\n2012-10-22 01:55:18 incorrect value:\n2012-10-21 23:55:17 incorrect value:\n2012-10-21 21:55:17 incorrect value:\n2012-10-21 19:55:17 incorrect value:\n2012-10-21 17:55:18 incorrect value:\n2012-10-21 15:55:17 incorrect value:\n2012-10-21 13:55:17 incorrect value:\n2012-10-21 11:55:17 incorrect value:\n2012-10-21 09:55:17 incorrect value:\n2012-10-21 07:55:17 incorrect value:\n2012-10-21 05:55:17 incorrect value:\n2012-10-21 03:55:17 incorrect value:\n2012-10-21 01:55:17 incorrect value:\n2012-10-20 23:55:16 incorrect value:\n2012-10-20 21:55:16 incorrect value:\n2012-10-20 19:55:16 incorrect value:\n2012-10-20 17:55:16 incorrect value:\n2012-10-20 15:55:16 incorrect value:\n2012-10-20 13:55:16 incorrect value:\n2012-10-20 11:55:16 incorrect value:\n2012-10-20 09:55:16 incorrect value:\n2012-10-20 07:55:17 incorrect value:\n2012-10-20 05:55:16 incorrect value:\n2012-10-20 03:55:17 incorrect value:\n2012-10-20 01:55:16 incorrect value:\n2012-10-19 23:55:16 incorrect value:\n2012-10-19 21:55:16 incorrect value:\n2012-10-19 19:55:16 incorrect value:\n2012-10-19 17:55:16 incorrect value:\n2012-10-19 15:55:16 incorrect value:\n2012-10-19 13:55:16 incorrect value:\n2012-10-19 11:55:16 incorrect value:\n2012-10-19 09:55:16 incorrect value:\n2012-10-19 07:55:16 incorrect value:\n2012-10-19 05:55:16 incorrect value:\n2012-10-19 03:55:16 incorrect value:\n2012-10-19 01:55:16 incorrect value:\n2012-10-18 23:55:16 incorrect value:\n2012-10-18 21:55:16 incorrect value:\n2012-10-18 19:55:16 incorrect value:\n2012-10-18 17:55:16 incorrect value:\n2012-10-18 15:55:17 incorrect value:\n2012-10-18 13:55:16 incorrect value:\n2012-10-18 11:55:16 incorrect value:\n2012-10-18 09:55:16 incorrect value:\n2012-10-18 07:55:16 incorrect value:\n2012-10-18 05:55:16 incorrect value:\n2012-10-18 03:55:16 incorrect value:\n2012-10-18 01:55:16 incorrect value:\n2012-10-17 23:55:16 incorrect value:\n2012-10-17 21:55:16 incorrect value:\n2012-10-17 19:55:16 incorrect value:\n2012-10-17 17:55:16 incorrect value:\n2012-10-17 15:55:16 incorrect value:\n2012-10-17 13:55:16 incorrect value:\n2012-10-17 11:55:16 incorrect value:\n2012-10-17 09:55:16 incorrect value:\n2012-10-17 07:55:16 incorrect value:\n2012-10-17 05:55:16 incorrect value:\n2012-10-17 03:55:17 incorrect value:\n2012-10-17 01:55:16 incorrect value:\n2012-10-16 23:55:16 incorrect value:\n2012-10-16 21:55:16 incorrect value:\n2012-10-16 19:55:16 incorrect value:\n2012-10-16 17:55:16 incorrect value:\n2012-10-16 15:55:16 incorrect value:\n2012-10-16 13:55:16 incorrect value:\n2012-10-16 11:55:17 incorrect value:\n2012-10-04 17:56:25 incorrect value:\n2012-10-04 15:56:24 incorrect value:\n2012-10-04 13:56:25 incorrect value:\n2012-10-04 11:56:24 incorrect value:\n2012-10-04 09:56:24 incorrect value:\n2012-10-04 07:56:24 incorrect value:\n2012-10-04 05:56:24 incorrect value:\n2012-10-04 03:56:23 incorrect value:\n2012-10-04 01:56:23 incorrect value:\n2012-10-03 23:56:23 incorrect value:\n2012-10-03 21:56:24 incorrect value:\n2012-10-03 19:56:23 incorrect value:\n2012-10-03 17:56:23 incorrect value:\n2012-10-03 15:56:23 incorrect value:\n2012-10-03 13:56:23 incorrect value:\n2012-10-03 11:56:23 incorrect value:\n2012-10-03 09:56:23 incorrect value:\n2012-10-03 07:56:23 incorrect value:\n2012-10-03 05:56:24 incorrect value:\n2012-10-03 03:56:23 incorrect value:\n2012-10-03 01:56:23 incorrect value:\n2012-10-02 23:56:23 incorrect value:\n2012-10-02 21:56:23 incorrect value:\n2012-10-02 19:56:23 incorrect value:\n2012-10-02 17:56:23 incorrect value:\n2012-09-25 11:47:25 incorrect value:\n2012-09-25 09:47:27 incorrect value:\n2012-09-24 16:34:30 incorrect value:\n2012-09-24 14:34:29 incorrect value:\n2012-09-24 12:34:29 incorrect value:\n2012-09-24 10:34:29 incorrect value:\n2012-09-24 08:34:29 incorrect value:\n2012-09-24 06:34:29 incorrect value:\n2012-09-24 04:34:29 incorrect value:\n2012-09-24 02:34:29 incorrect value:\n2012-09-24 00:34:29 incorrect value:\n2012-09-23 22:34:29 incorrect value:\n2012-09-23 20:34:29 incorrect value:\n2012-09-23 18:34:29 incorrect value:\n2012-09-23 16:34:30 incorrect value:\n2012-09-23 14:34:29 incorrect value:\n2012-09-23 12:34:29 incorrect value:\n2012-09-23 10:34:29 incorrect value:\n2012-09-23 08:34:29 incorrect value:\n2012-09-23 06:34:29 incorrect value:\n2012-09-23 04:34:29 incorrect value:\n2012-09-23 02:34:29 incorrect value:\n2012-09-23 00:34:29 incorrect value:\n2012-09-22 22:34:29 incorrect value:\n2012-09-22 20:34:29 incorrect value:\n2012-09-22 18:34:29 incorrect value:\n2012-09-22 16:34:29 incorrect value:\n2012-09-22 14:34:28 incorrect value:\n2012-09-22 12:34:28 incorrect value:\n2012-09-22 10:34:29 incorrect value:\n2012-09-22 08:34:28 incorrect value:\n2012-09-22 06:34:28 incorrect value:\n2012-09-22 04:34:28 incorrect value:\n2012-09-22 02:34:28 incorrect value:\n2012-09-22 00:34:28 incorrect value:\n2012-09-21 22:34:28 incorrect value:\n2012-09-21 20:34:28 incorrect value:\n2012-09-21 18:34:28 incorrect value:\n2012-09-21 16:34:28 incorrect value:\n2012-09-21 14:34:28 incorrect value:\n2012-09-21 12:34:28 incorrect value:\n2012-09-21 10:34:28 incorrect value:\n2012-09-21 08:34:28 incorrect value:\n2012-09-21 06:34:28 incorrect value:\n2012-09-21 04:34:28 incorrect value:\n2012-09-21 02:34:28 incorrect value:\n2012-09-21 00:34:28 incorrect value:\n2012-09-20 22:34:28 incorrect value:\n2012-09-20 20:34:28 incorrect value:\n2012-09-20 18:34:28 incorrect value:\n2012-09-18 15:23:17 incorrect value:\n2012-09-04 09:27:44 incorrect value:\n2012-08-31 15:32:01 incorrect value:\n2012-08-31 13:30:44 incorrect value:\n2012-08-31 11:30:43 incorrect value:\n2012-08-31 09:30:43 incorrect value:\n2012-08-31 07:30:43 incorrect value:\n2012-08-31 05:30:43 incorrect value:\n2012-08-31 03:30:43 incorrect value:\n2012-08-31 01:30:43 incorrect value:\n2012-08-30 23:30:43 incorrect value:\n2012-08-30 21:30:43 incorrect value:\n2012-08-30 19:30:43 incorrect value:\n2012-08-30 17:30:44 incorrect value:\n2012-08-30 15:30:43 incorrect value:\n2012-08-30 13:30:43 incorrect value:\n2012-08-30 11:30:43 incorrect value:\n2012-08-30 09:30:44 incorrect value:\n2012-08-29 17:51:18 incorrect value:\n2012-08-29 15:51:18 incorrect value:\n2012-08-29 13:51:18 incorrect value:\n2012-08-29 11:51:18 incorrect value:\n2012-08-29 09:51:18 incorrect value:\n2012-08-29 07:51:19 incorrect value:\n2012-08-29 05:51:18 incorrect value:\n2012-08-29 03:51:18 incorrect value:\n2012-08-29 01:51:18 incorrect value:\n2012-08-28 23:51:19 incorrect value:\n2012-08-28 21:51:18 incorrect value:\n2012-08-28 19:51:18 incorrect value:\n2012-08-28 17:51:17 incorrect value:\n2012-08-28 15:51:17 incorrect value:\n2012-08-28 13:51:17 incorrect value:\n2012-08-28 11:51:17 incorrect value:\n2012-08-28 09:51:17 incorrect value:\n2012-08-27 19:29:44 incorrect value:\n2012-08-27 17:29:44 incorrect value:\n2012-07-31 17:40:36 incorrect value:\n2012-07-13 06:31:11 incorrect value:\n2012-07-13 04:31:12 incorrect value:\n2012-07-13 02:31:11 incorrect value:\n2012-07-13 00:31:11 incorrect value:\n2012-07-12 22:31:11 incorrect value:\n2012-07-12 20:31:11 incorrect value:\n2012-07-12 18:31:11 incorrect value:\n2012-07-12 16:31:12 incorrect value:\n2012-07-12 14:31:10 incorrect value:\n2012-07-12 12:31:10 incorrect value:\n2012-07-12 10:31:10 incorrect value:\n2012-07-12 08:31:10 incorrect value:\n2012-07-12 06:31:10 incorrect value:\n2012-07-12 04:31:11 incorrect value:\n2012-07-12 02:31:10 incorrect value:\n2012-07-12 00:31:10 incorrect value:\n2012-07-11 22:31:10 incorrect value:\n2012-07-11 20:31:10 incorrect value:\n2012-07-11 18:31:10 incorrect value:\n2012-07-11 16:31:10 incorrect value:\n2012-07-11 14:31:10 incorrect value:\n2012-07-11 12:31:10 incorrect value:\n2012-07-11 10:31:10 incorrect value:\n2012-07-11 08:31:10 incorrect value:\n2012-07-11 06:31:10 incorrect value:\n2012-07-11 04:31:11 incorrect value:\n2012-07-11 02:31:10 incorrect value:\n2012-07-11 00:31:10 incorrect value:\n2012-07-10 22:31:10 incorrect value:\n2012-07-10 20:31:10 incorrect value:\n2012-07-10 18:31:10 incorrect value:\n2012-07-10 16:31:10 incorrect value:\n2012-07-10 14:31:10 incorrect value:\n2012-07-10 12:31:10 incorrect value:\n2012-07-10 00:31:10 new value: \r\n<b>Сегодня:</b><br />днем: +25&deg;...+27&deg;, переменная облачность, небольшой дождь, ночью: +18&deg;...+20&deg;,\r\nясно, ветер: З — 4-6 м/с, давление: 758 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +24&deg;...+26&deg;, переменная облачность, ночью: +16&deg;...+18&deg;,\r\nясно, ветер: З — 2-4 м/с, давление: 759 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-07-09 13:17:12 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, небольшой дождь, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: ЮЗ — 4-6 м/с, давление: 756 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +25&deg;...+27&deg;, переменная облачность, небольшой дождь, ночью: +18&deg;...+20&deg;,\r\nясно, ветер: З — 4-6 м/с, давление: 758 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-07-09 01:17:11 new value: \r\n<b>Сегодня:</b><br />днем: +28&deg;...+30&deg;, дождь, гроза, ночью: +21&deg;...+23&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 755 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +25&deg;...+27&deg;, дождь, ночью: +21&deg;...+23&deg;,\r\nдождь, ветер: CЗ — 5-7 м/с, давление: 757 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-08 11:17:10 new value: \r\n<b>Сегодня:</b><br />днем: +30&deg;...+32&deg;, дождь, гроза, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: Ю — 2-4 м/с, давление: 758 мм.рт.ст, влажность: 45%<br /><br />\r\n<b>Завтра:</b><br />днем: +28&deg;...+30&deg;, дождь, гроза, ночью: +21&deg;...+23&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 755 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-07-08 01:17:09 new value: \r\n<b>Сегодня:</b><br />днем: +28&deg;...+30&deg;, переменная облачность, небольшой дождь, ночью: +20&deg;...+22&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 758 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +28&deg;...+30&deg;, дождь, ночью: +21&deg;...+23&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 755 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-07 13:17:09 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, дождь, гроза, ночью: +19&deg;...+21&deg;,\r\nпеременная облачность, ветер: В — 1-3 м/с, давление: 761 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +28&deg;...+30&deg;, переменная облачность, небольшой дождь, ночью: +20&deg;...+22&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 758 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-07 01:17:08 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: CВ — 2-4 м/с, давление: 761 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +28&deg;...+30&deg;, переменная облачность, небольшой дождь, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: ЮВ — 2-4 м/с, давление: 758 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-06 13:17:07 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +18&deg;...+20&deg;,\r\nпеременная облачность, ветер: В — 2-4 м/с, давление: 762 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: CВ — 2-4 м/с, давление: 761 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-06 01:17:07 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: В — 2-4 м/с, давление: 762 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, небольшой дождь, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: В — 3-5 м/с, давление: 760 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-05 13:17:06 new value: \r\n<b>Сегодня:</b><br />днем: +27&deg;...+29&deg;, ясно, ночью: +17&deg;...+19&deg;,\r\nясно, ветер: В — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: В — 2-4 м/с, давление: 762 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-07-05 11:17:05 new value: \r\n<b>Сегодня:</b><br />днем: +26&deg;...+28&deg;, облачно, без существенных осадков, ночью: +18&deg;...+20&deg;,\r\nясно, ветер: ЮВ — 3-5 м/с, давление: 763 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +27&deg;...+29&deg;, переменная облачность, ночью: +19&deg;...+21&deg;,\r\nясно, ветер: В — 3-5 м/с, давление: 761 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-06-25 14:29:27 new value: \r\n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\r\nпеременная облачность, ветер: ЮЗ — 6-8 м/с, давление: 757 мм.рт.ст, влажность: 85%<br /><br />\r\n<b>Завтра:</b><br />днем: +17&deg;...+19&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nпеременная облачность, ветер: ЮЗ — 7-9 м/с, давление: 754 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-06-25 01:39:24 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: ЮЗ — 6-8 м/с, давление: 756 мм.рт.ст, влажность: 95%<br /><br />\r\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\r\nпеременная облачность, ветер: ЮЗ — 8-10 м/с, давление: 754 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-06-24 13:39:23 new value: \r\n<b>Сегодня:</b><br />днем: +20&deg;...+22&deg;, дождь, гроза, ночью: +11&deg;...+13&deg;,\r\nясно, ветер: З — 5-7 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: ЮЗ — 6-8 м/с, давление: 756 мм.рт.ст, влажность: 95%<br /><br />\r\n\n2012-06-24 01:39:23 new value: \r\n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nясно, ветер: З — 5-7 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nоблачно, ветер: Ю — 7-9 м/с, давление: 754 мм.рт.ст, влажность: 95%<br /><br />\r\n\n2012-06-23 13:39:23 new value: \r\n<b>Сегодня:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +17&deg;...+19&deg;,\r\nоблачно, без существенных осадков, ветер: З — 8-10 м/с, давление: 762 мм.рт.ст, влажность: 70%<br /><br />\r\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nясно, ветер: З — 5-7 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-06-23 07:39:22 new value: \r\n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +17&deg;...+19&deg;,\r\nпеременная облачность, небольшой дождь, ветер: З — 7-9 м/с, давление: 762 мм.рт.ст, влажность: 70%<br /><br />\r\n<b>Завтра:</b><br />днем: +20&deg;...+22&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nпеременная облачность, ветер: З — 5-7 м/с, давление: 764 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-06-22 14:28:40 new value: \r\n<b>Сегодня:</b><br />днем: +21&deg;...+23&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\r\nдождь, гроза, ветер: ЮВ — 4-6 м/с, давление: 759 мм.рт.ст, влажность: 80%<br /><br />\r\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +17&deg;...+19&deg;,\r\nпеременная облачность, небольшой дождь, ветер: З — 7-9 м/с, давление: 762 мм.рт.ст, влажность: 70%<br /><br />\r\n\n2012-06-22 02:28:40 new value: \r\n<b>Сегодня:</b><br />днем: +21&deg;...+23&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nдождь, гроза, ветер: ЮВ — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 80%<br /><br />\r\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, переменная облачность, ночью: +17&deg;...+19&deg;,\r\nпеременная облачность, ветер: З — 7-9 м/с, давление: 761 мм.рт.ст, влажность: 70%<br /><br />\r\n\n2012-06-21 14:28:40 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nоблачно, ветер: В — 4-6 м/с, давление: 762 мм.рт.ст, влажность: 90%<br /><br />\r\n<b>Завтра:</b><br />днем: +21&deg;...+23&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nдождь, гроза, ветер: ЮВ — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-06-21 02:28:40 new value: \r\n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nоблачно, ветер: В — 4-6 м/с, давление: 762 мм.рт.ст, влажность: 80%<br /><br />\r\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\r\nдождь, гроза, ветер: В — 5-7 м/с, давление: 757 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-06-20 17:28:38 incorrect value:\n2012-06-20 14:28:38 new value: \r\n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nпеременная облачность, ветер: C — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nоблачно, ветер: В — 4-6 м/с, давление: 762 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-06-20 02:28:37 new value: \r\n<b>Сегодня:</b><br />днем: +20&deg;...+22&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: C — 1-3 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +18&deg;...+20&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nоблачно, без существенных осадков, ветер: В — 3-5 м/с, давление: 761 мм.рт.ст, влажность: 70%<br /><br />\r\n\n2012-06-19 14:28:36 new value: \r\n<b>Сегодня:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, небольшой дождь, ночью: +15&deg;...+17&deg;,\r\nпеременная облачность, ветер: З — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +20&deg;...+22&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: C — 1-3 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-06-19 02:28:35 new value: \r\n<b>Сегодня:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, небольшой дождь, ночью: +15&deg;...+17&deg;,\r\nясно, ветер: ЮЗ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +15&deg;...+17&deg;,\r\nясно, ветер: C — 2-4 м/с, давление: 763 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-06-18 14:28:34 new value: \r\n<b>Сегодня:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 767 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, небольшой дождь, ночью: +15&deg;...+17&deg;,\r\nясно, ветер: ЮЗ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 65%<br /><br />\r\n\n2012-06-18 02:28:33 new value: \r\n<b>Сегодня:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 767 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +26&deg;...+28&deg;, дождь, гроза, ночью: +15&deg;...+17&deg;,\r\nясно, ветер: ЮЗ — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 65%<br /><br />\r\n\n2012-06-17 20:28:32 incorrect value:\n2012-06-17 14:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +25&deg;...+27&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nпеременная облачность, ветер: ЮЗ — 6-8 м/с, давление: 763 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 767 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-06-17 08:28:32 incorrect value:\n2012-06-17 02:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +25&deg;...+27&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\r\nпеременная облачность, ветер: ЮЗ — 7-9 м/с, давление: 763 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +22&deg;...+24&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 767 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-06-16 14:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +20&deg;...+22&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nоблачно, без существенных осадков, ветер: CЗ — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +25&deg;...+27&deg;, дождь, гроза, ночью: +12&deg;...+14&deg;,\r\nпеременная облачность, ветер: ЮЗ — 7-9 м/с, давление: 763 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-06-16 02:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: CЗ — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +26&deg;...+28&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nясно, ветер: ЮЗ — 7-9 м/с, давление: 763 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-06-15 20:28:35 incorrect value:\n2012-06-15 14:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, дождь, гроза, ночью: +13&deg;...+15&deg;,\r\nдождь, гроза, ветер: CЗ — 5-7 м/с, давление: 760 мм.рт.ст, влажность: 85%<br /><br />\r\n<b>Завтра:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +14&deg;...+16&deg;,\r\nпеременная облачность, ветер: CЗ — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-06-15 08:28:32 incorrect value:\n2012-06-15 02:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nоблачно, без существенных осадков, ветер: C — 3-5 м/с, давление: 759 мм.рт.ст, влажность: 80%<br /><br />\r\n<b>Завтра:</b><br />днем: +21&deg;...+23&deg;, переменная облачность, ночью: +13&deg;...+15&deg;,\r\nпеременная облачность, ветер: CЗ — 6-8 м/с, давление: 764 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-06-14 17:28:32 new value: \r\n<b>Сегодня:</b><br />днем: +18&deg;...+20&deg;, дождь, гроза, ночью: +10&deg;...+12&deg;,\r\nпеременная облачность, ветер: CВ — 2-4 м/с, давление: 761 мм.рт.ст, влажность: 70%<br /><br />\r\n<b>Завтра:</b><br />днем: +17&deg;...+19&deg;, дождь, гроза, ночью: +14&deg;...+16&deg;,\r\nоблачно, без существенных осадков, ветер: C — 3-5 м/с, давление: 759 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-06-01 18:39:32 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, облачно, ночью: +8&deg;...+10&deg;,\r\nоблачно, ветер: Ю — 6-8 м/с, давление: 755 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +11&deg;...+13&deg;, облачно, ночью: +7&deg;...+9&deg;,\r\nдождь, ветер: ЮЗ — 8-10 м/с, давление: 753 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-05-29 16:51:35 new value: \r\n<b>Сегодня:</b><br />днем: +22&deg;...+24&deg;, переменная облачность, ночью: +10&deg;...+12&deg;,\r\nпеременная облачность, ветер: ЮЗ — 5-7 м/с, давление: 755 мм.рт.ст, влажность: 45%<br /><br />\r\n<b>Завтра:</b><br />днем: +12&deg;...+14&deg;, облачно, ночью: +14&deg;...+16&deg;,\r\nдождь, гроза, ветер: CЗ — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-05-09 02:14:01 incorrect value:\n2012-05-08 23:14:01 incorrect value:\n2012-05-08 20:13:59 new value: \r\n<b>Сегодня:</b><br />днем: +10&deg;...+12&deg;, облачно, без существенных осадков, ночью: +7&deg;...+9&deg;,\r\nоблачно, ветер: CВ — 4-6 м/с, давление: 766 мм.рт.ст, влажность: 75%<br /><br />\r\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, переменная облачность, ночью: +6&deg;...+8&deg;,\r\nпеременная облачность, ветер: CВ — 1-3 м/с, давление: 767 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-05-08 17:14:00 incorrect value:\n2012-05-02 10:58:10 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, ясно, ночью: +7&deg;...+9&deg;,\r\nясно, ветер: ЮЗ — 1-3 м/с, давление: 763 мм.рт.ст, влажность: 45%<br /><br />\r\n<b>Завтра:</b><br />днем: +17&deg;...+19&deg;, ясно, ночью: +9&deg;...+11&deg;,\r\nясно, ветер: C — 1-3 м/с, давление: 758 мм.рт.ст, влажность: 40%<br /><br />\r\n\n2012-05-01 16:19:11 new value: \r\n<b>Сегодня:</b><br />днем: +20&deg;...+22&deg;, ясно, ночью: +11&deg;...+13&deg;,\r\nясно, ветер: CЗ — 6-8 м/с, давление: 763 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +16&deg;...+18&deg;, ясно, ночью: +7&deg;...+9&deg;,\r\nясно, ветер: ЮЗ — 1-3 м/с, давление: 763 мм.рт.ст, влажность: 45%<br /><br />\r\n\n2012-05-01 00:22:24 incorrect value:\n2012-05-01 00:20:58 incorrect value:\n2012-05-01 00:12:03 incorrect value:\n2012-04-27 01:33:23 new value: \r\n<b>Сегодня:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +9&deg;...+11&deg;,\r\nпеременная облачность, ветер: ЮЗ — 5-7 м/с, давление: 767 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +22&deg;...+24&deg;, переменная облачность, ночью: +12&deg;...+14&deg;,\r\nясно, ветер: З — 3-5 м/с, давление: 768 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-04-26 19:33:23 new value: \r\n<b>Сегодня:</b><br />днем: +16&deg;...+18&deg;, ясно, ночью: +10&deg;...+12&deg;,\r\nдождь, ветер: З — 3-5 м/с, давление: 764 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +19&deg;...+21&deg;, переменная облачность, ночью: +9&deg;...+11&deg;,\r\nпеременная облачность, ветер: ЮЗ — 5-7 м/с, давление: 767 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-04-03 10:57:55 new value: \r\n<b>Сегодня:</b><br />днем: +3&deg;...+5&deg;, облачно, ночью: -2&deg;...-4&deg;,\r\nпеременная облачность, ветер: З — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 45%<br /><br />\r\n<b>Завтра:</b><br />днем: +5&deg;...+7&deg;, облачно, ночью: +0&deg;...-2&deg;,\r\nпеременная облачность, ветер: ЮВ — 6-8 м/с, давление: 759 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-04-02 15:09:28 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...+2&deg;, снег, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: З — 12-14 м/с, давление: 745 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +3&deg;...+5&deg;, облачно, ночью: -2&deg;...-4&deg;,\r\nпеременная облачность, ветер: З — 5-7 м/с, давление: 758 мм.рт.ст, влажность: 45%<br /><br />\r\n\n2012-04-02 12:09:28 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...+2&deg;, снег, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: З — 10-12 м/с, давление: 745 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +3&deg;...+5&deg;, облачно, ночью: -1&deg;...-3&deg;,\r\nпеременная облачность, ветер: З — 7-9 м/с, давление: 758 мм.рт.ст, влажность: 50%<br /><br />\r\n\n2012-04-01 14:15:21 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...+2&deg;, облачно, небольшой снег, ночью: +0&deg;,\r\nоблачно, ветер: CЗ — 7-9 м/с, давление: 750 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, снег, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: З — 10-12 м/с, давление: 745 мм.рт.ст, влажность: 65%<br /><br />\r\n\n2012-03-22 00:47:41 new value: \r\n<b>Сегодня:</b><br />днем: +8&deg;...+10&deg;, облачно, ночью: +3&deg;...+5&deg;,\r\nоблачно, ветер: CЗ — 5-7 м/с, давление: 770 мм.рт.ст, влажность: 75%<br /><br />\r\n<b>Завтра:</b><br />днем: +8&deg;...+10&deg;, облачно, ночью: +5&deg;...+7&deg;,\r\nоблачно, ветер: CЗ — 7-9 м/с, давление: 764 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-03-21 22:46:52 new value: \r\n<b>Сегодня:</b><br />днем: +6&deg;...+8&deg;, облачно, ночью: +3&deg;...+5&deg;,\r\nоблачно, без существенных осадков, ветер: CЗ — 6-8 м/с, давление: 767 мм.рт.ст, влажность: 75%<br /><br />\r\n<b>Завтра:</b><br />днем: +8&deg;...+10&deg;, облачно, ночью: +3&deg;...+5&deg;,\r\nоблачно, ветер: CЗ — 5-7 м/с, давление: 770 мм.рт.ст, влажность: 75%<br /><br />\r\n\n2012-03-21 16:16:42 incorrect value:\n2012-03-16 00:09:12 new value: \r\n<b>Сегодня:</b><br />днем: +2&deg;...+4&deg;, облачно, ночью: +0&deg;...-2&deg;,\r\nоблачно, ветер: З — 3-5 м/с, давление: 764 мм.рт.ст, влажность: 90%<br /><br />\r\n<b>Завтра:</b><br />днем: +7&deg;...+9&deg;, облачно, без существенных осадков, ночью: +1&deg;...+3&deg;,\r\nоблачно, ветер: З — 5-7 м/с, давление: 762 мм.рт.ст, влажность: 90%<br /><br />\r\n\n2012-03-15 18:09:08 new value: \r\n<b>Сегодня:</b><br />днем: +2&deg;...+4&deg;, переменная облачность, ночью: -1&deg;...-3&deg;,\r\nпеременная облачность, ветер: C — 7-9 м/с, давление: 767 мм.рт.ст, влажность: 45%<br /><br />\r\n<b>Завтра:</b><br />днем: +2&deg;...+4&deg;, облачно, ночью: +0&deg;...-2&deg;,\r\nоблачно, ветер: З — 3-5 м/с, давление: 764 мм.рт.ст, влажность: 90%<br /><br />\r\n\n2012-03-15 01:40:29 new value: \r\n<b>Сегодня:</b><br />днем: +1&deg;...+3&deg;, облачно, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: C — 7-9 м/с, давление: 766 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +2&deg;...+4&deg;, облачно, ночью: -1&deg;...-3&deg;,\r\nпеременная облачность, ветер: ЮЗ — 3-5 м/с, давление: 766 мм.рт.ст, влажность: 85%<br /><br />\r\n\n2012-03-14 13:40:29 new value: \r\n<b>Сегодня:</b><br />днем: +2&deg;...+4&deg;, переменная облачность, ночью: +0&deg;...-2&deg;,\r\nпеременная облачность, ветер: CЗ — 9-11 м/с, давление: 761 мм.рт.ст, влажность: 50%<br /><br />\r\n<b>Завтра:</b><br />днем: +1&deg;...+3&deg;, облачно, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: C — 7-9 м/с, давление: 766 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-03-12 19:03:41 new value: \r\n<b>Сегодня:</b><br />днем: +3&deg;...+5&deg;, облачно, ночью: +0&deg;...+2&deg;,\r\nоблачно, ветер: З — 6-8 м/с, давление: 758 мм.рт.ст, влажность: 70%<br /><br />\r\n<b>Завтра:</b><br />днем: +9&deg;...+11&deg;, переменная облачность, ночью: +1&deg;...+3&deg;,\r\nясно, ветер: З — 10-12 м/с, давление: 757 мм.рт.ст, влажность: 65%<br /><br />\r\n\n2012-03-09 10:11:01 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...-2&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: ЮЗ — 2-4 м/с, давление: 775 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, облачно, небольшой снег, ночью: -1&deg;...-3&deg;,\r\nоблачно, ветер: ЮЗ — 6-8 м/с, давление: 770 мм.рт.ст, влажность: 95%<br /><br />\r\n\n2012-03-08 20:44:40 new value: \r\n<b>Сегодня:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -7&deg;...-9&deg;,\r\nоблачно, ветер: ЮВ — 2-4 м/с, давление: 770 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;...-2&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: ЮЗ — 2-4 м/с, давление: 775 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-03-07 14:51:38 new value: \r\n<b>Сегодня:</b><br />днем: -3&deg;...-5&deg;, облачно, ночью: -6&deg;...-8&deg;,\r\nоблачно, ветер: C — 2-4 м/с, давление: 771 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: -1&deg;...-3&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: Ю — 2-4 м/с, давление: 769 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-03-07 10:51:32 new value: \r\n<b>Сегодня:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -4&deg;...-6&deg;,\r\nоблачно, ветер: C — 2-4 м/с, давление: 771 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: -1&deg;...-3&deg;, облачно, небольшой снег, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: Ю — 2-4 м/с, давление: 769 мм.рт.ст, влажность: 60%<br /><br />\r\n\n2012-03-06 10:25:26 new value: \r\n<b>Сегодня:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: C — 5-7 м/с, давление: 770 мм.рт.ст, влажность: 55%<br /><br />\r\n<b>Завтра:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -5&deg;...-7&deg;,\r\nоблачно, ветер: C — 2-4 м/с, давление: 772 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-03-05 14:46:40 new value: \r\n<b>Сегодня:</b><br />днем: -1&deg;...-3&deg;, облачно, ночью: -2&deg;...-4&deg;,\r\nоблачно, ветер: C — 4-6 м/с, давление: 767 мм.рт.ст, влажность: 65%<br /><br />\r\n<b>Завтра:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: C — 5-7 м/с, давление: 770 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-03-05 10:46:40 new value: \r\n<b>Сегодня:</b><br />днем: -1&deg;...-3&deg;, облачно, ночью: -2&deg;...-4&deg;,\r\nоблачно, ветер: C — 4-6 м/с, давление: 765 мм.рт.ст, влажность: 60%<br /><br />\r\n<b>Завтра:</b><br />днем: -2&deg;...-4&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, ветер: C — 5-7 м/с, давление: 769 мм.рт.ст, влажность: 55%<br /><br />\r\n\n2012-03-02 14:00:42 new value: \r\n<b>Сегодня:</b><br />днем: +3&deg;...+5&deg;, облачно, небольшой дождь, ночью: +0&deg;...+2&deg;,\r\nоблачно, небольшой снег, ветер: З — 6-8 м/с, давление: 754 мм.рт.ст, влажность: 95%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;, снег, ночью: +0&deg;...-2&deg;,\r\nметель, ветер: C — 8-10 м/с, давление: 760 мм.рт.ст, влажность: 95%<br /><br />\r\n\n2012-03-02 10:00:41 new value: \r\n<b>Сегодня:</b><br />днем: +3&deg;...+5&deg;, облачно, без существенных осадков, ночью: +0&deg;...+2&deg;,\r\nснег, ветер: З — 5-7 м/с, давление: 753 мм.рт.ст, влажность: 100%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;, снег, ночью: +0&deg;,\r\nснег, ветер: C — 10-12 м/с, давление: 762 мм.рт.ст, влажность: 80%<br /><br />\r\n\n2012-03-01 14:26:15 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...+2&deg;, облачно, небольшой снег, ночью: -2&deg;...-4&deg;,\r\nпеременная облачность, ветер: ЮЗ — 4-6 м/с, давление: 762 мм.рт.ст, влажность: 95%<br /><br />\r\n<b>Завтра:</b><br />днем: +3&deg;...+5&deg;, облачно, без существенных осадков, ночью: +0&deg;...+2&deg;,\r\nснег, ветер: З — 5-7 м/с, давление: 753 мм.рт.ст, влажность: 100%<br /><br />\r\n\n2012-03-01 10:26:15 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;, переменная облачность, ночью: -6&deg;...-8&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 100%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, снег, ночью: +0&deg;...-2&deg;,\r\nснег, ветер: ЮЗ — 2-4 м/с, давление: 754 мм.рт.ст, влажность: 100%<br /><br />\r\n\n2012-02-29 16:50:21 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...-2&deg;, облачно, ночью: -5&deg;...-7&deg;,\r\nясно, ветер: CЗ — 1-3 м/с, давление: 761 мм.рт.ст, влажность: 90%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;, переменная облачность, ночью: -6&deg;...-8&deg;,\r\nпеременная облачность, ветер: Ю — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 100%<br /><br />\r\n\n2012-02-28 00:40:59 new value: \r\n<b>Сегодня:</b><br />днем: -3&deg;...-5&deg;, ясно, ночью: -9&deg;...-11&deg;,\r\nпеременная облачность, ветер: ЮЗ — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 85%<br /><br />\r\n<b>Завтра:</b><br />днем: +0&deg;...+2&deg;, облачно, ночью: -3&deg;...-5&deg;,\r\nоблачно, небольшой снег, ветер: CЗ — 4-6 м/с, давление: 758 мм.рт.ст, влажность: 100%<br /><br />\r\n\n2012-02-27 14:40:57 new value: \r\n<b>Сегодня:</b><br />днем: -3&deg;...-5&deg;, облачно, небольшой снег, ночью: -5&deg;...-7&deg;,\r\nясно, ветер: C — 5-7 м/с, давление: 761 мм.рт.ст, влажность: 85%<br /><br />\r\n<b>Завтра:</b><br />днем: -3&deg;...-5&deg;, ясно, ночью: -9&deg;...-11&deg;,\r\nпеременная облачность, ветер: ЮЗ — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 85%<br /><br />\r\n\n2012-02-27 10:40:56 new value: \r\n<b>Сегодня:</b><br />днем: -3&deg;...-5&deg;, облачно, ночью: -5&deg;...-7&deg;,\r\nметель, ветер: C — 5-7 м/с, давление: 760 мм.рт.ст, влажность: 85%<br /><br />\r\n<b>Завтра:</b><br />днем: -3&deg;...-5&deg;, переменная облачность, ночью: -8&deg;...-10&deg;,\r\nоблачно, ветер: З — 2-4 м/с, давление: 764 мм.рт.ст, влажность: 85%<br /><br />\r\n\n2012-02-25 18:16:00 new value: \r\n<b>Сегодня:</b><br />днем: +0&deg;...+2&deg;, облачно, ночью: +0&deg;...+2&deg;,\r\nясно, ветер: З — 5-7 м/с, давление: 746 мм.рт.ст, влажность: 100%<br /><br />\r\n<b>Завтра:</b><br />днем: -1&deg;...-3&deg;, метель, ночью: +0&deg;...-2&deg;,\r\nметель, ветер: C — 5','',0,'','');
insert  into `webvars`(`ID`,`TITLE`,`HOSTNAME`,`TYPE`,`SEARCH_PATTERN`,`CHECK_PATTERN`,`LATEST_VALUE`,`CHECK_LATEST`,`CHECK_NEXT`,`SCRIPT_ID`,`ONLINE_INTERVAL`,`LINKED_OBJECT`,`LINKED_PROPERTY`,`CODE`,`LOG`,`ENCODING`,`AUTH`,`USERNAME`,`PASSWORD`) values (4,'<#LANG_GENERAL_TEMPERATURE_OUTSIDE#>','http://pogoda.by/pda/?city=26850',0,'погода фактическая.+?Температура воздуха (.+?)[°&]','','+4.1','2014-01-09 22:49:14','2014-01-09 23:29:14',0,2400,'ThisComputer','TempOutside','','2014-01-09 22:49:14 new value:+4.1\n2014-01-09 20:07:29 new value:+5.0\n2014-01-09 18:18:33 new value:+5.4\n2013-09-13 11:19:51 new value:+14.0\n2013-09-12 21:33:30 new value:+20.2\n2013-09-12 18:46:33 new value:+21.2\n2013-09-12 11:08:45 new value:+12.0\n2013-09-12 09:48:33 new value:+8.5\n2013-09-11 23:13:18 new value:+14.4\n2013-09-11 19:52:35 new value:+18.2\n2013-09-11 17:02:55 new value:+18.6\n2013-09-11 14:22:32 new value:+17.3\n2013-09-09 19:39:51 new value:+20.0\n2013-09-09 18:57:25 new value:+21.4\n2013-09-09 08:21:25 new value:+8.1\n2013-09-02 19:58:35 new value:+13.2\n2013-09-02 19:17:10 new value:+15.6\n2013-09-01 20:14:44 new value:+18.5\n2013-08-22 19:42:45 new value:+18.6\n2013-08-21 20:12:24 new value:+26.9\n2013-08-21 19:32:14 new value:+27.7\n2013-08-20 21:05:47 new value:+28.2\n2013-08-09 13:23:02 new value:+25.0\n2013-05-18 15:32:20 new value:+25.6\n2013-03-06 15:46:10 new value:+4.8\n2012-11-17 15:02:20 new value:+3.0\n2012-11-17 14:33:22 new value:+3.0\n2012-11-16 16:20:46 new value:+2.7\n2012-11-16 15:40:38 incorrect value:\n2012-11-16 15:40:35 incorrect value:\n2012-11-16 15:40:29 incorrect value:\n2012-11-16 15:39:59 incorrect value:\n2012-11-16 15:36:57 incorrect value:\n2012-11-16 15:36:30 incorrect value:\n2012-11-16 15:36:24 incorrect value:\n2012-11-16 15:36:08 incorrect value:\n2012-11-16 15:36:01 incorrect value:\n2012-11-16 15:35:15 incorrect value:\n2012-11-16 15:34:09 incorrect value:\n2012-11-16 15:29:02 incorrect value:\n2012-11-16 15:28:55 incorrect value:\n2012-11-16 15:28:13 incorrect value:\n2012-11-16 15:27:57 incorrect value:\n2012-11-16 15:27:36 incorrect value:\n2012-11-16 15:27:33 incorrect value:\n2012-11-16 15:27:17 incorrect value:\n2012-11-16 15:27:12 incorrect value:\n2012-11-16 15:26:39 incorrect value:\n2012-11-16 15:25:56 new value:+2.8\n','windows-1251',0,'','');

/*Table structure for table `zwave_devices` */

DROP TABLE IF EXISTS `zwave_devices`;

CREATE TABLE `zwave_devices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `NODE_ID` varchar(50) NOT NULL DEFAULT '',
  `INSTANCE_ID` varchar(50) NOT NULL DEFAULT '',
  `BASIC` varchar(50) NOT NULL DEFAULT '',
  `LEVEL` varchar(50) NOT NULL DEFAULT '',
  `BATTERY_LEVEL` varchar(50) NOT NULL DEFAULT '',
  `SENSOR_VALUE` varchar(255) NOT NULL DEFAULT '',
  `MODE_VALUE` varchar(255) NOT NULL DEFAULT '',
  `DEVICE_TYPE` varchar(50) NOT NULL DEFAULT '',
  `STATUS` int(3) NOT NULL DEFAULT '0',
  `AUTO_POLL` int(3) NOT NULL DEFAULT '0',
  `LATEST_UPDATE` datetime DEFAULT NULL,
  `LOCATION_ID` int(10) NOT NULL DEFAULT '0',
  `CLASS_BASIC` int(3) NOT NULL DEFAULT '0',
  `CLASS_SENSOR_BINARY` int(3) NOT NULL DEFAULT '0',
  `CLASS_SENSOR_MULTILEVEL` int(3) NOT NULL DEFAULT '0',
  `CLASS_SWITCH_BINARY` int(3) NOT NULL DEFAULT '0',
  `CLASS_SWITCH_MULTILEVEL` int(3) NOT NULL DEFAULT '0',
  `CLASS_METER` int(3) NOT NULL DEFAULT '0',
  `CLASS_BATTERY` int(3) NOT NULL DEFAULT '0',
  `CLASS_THERMOSTAT` int(3) NOT NULL DEFAULT '0',
  `ALL_CLASSES` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `zwave_devices` */

/*Table structure for table `zwave_properties` */

DROP TABLE IF EXISTS `zwave_properties`;

CREATE TABLE `zwave_properties` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(10) NOT NULL DEFAULT '0',
  `UNIQ_ID` varchar(100) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `VALUE` varchar(255) NOT NULL DEFAULT '',
  `VALUE_TYPE` varchar(255) NOT NULL DEFAULT '',
  `READ_ONLY` int(3) NOT NULL DEFAULT '0',
  `LINKED_OBJECT` varchar(255) NOT NULL DEFAULT '',
  `LINKED_PROPERTY` varchar(255) NOT NULL DEFAULT '',
  `UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `zwave_properties` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

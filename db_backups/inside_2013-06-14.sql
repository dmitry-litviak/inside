# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.28-0ubuntu0.12.04.3)
# Database: inside
# Generation Time: 2013-06-14 14:09:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table achievments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `achievments`;

CREATE TABLE `achievments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `achievments` WRITE;
/*!40000 ALTER TABLE `achievments` DISABLE KEYS */;

INSERT INTO `achievments` (`id`, `title`, `level_id`)
VALUES
	(1,'Middle company tests',2),
	(2,'Practice experince (1 completed project for middle developer)',2),
	(3,'Senior company tests',3),
	(4,'Brainbench tests',3),
	(5,'Practice experince (3 completed projects for senior developer)',3);

/*!40000 ALTER TABLE `achievments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table certificates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;

INSERT INTO `certificates` (`id`, `title`)
VALUES
	(1,'PHP'),
	(21,'JS'),
	(22,'SQL'),
	(23,'CoffeeScript'),
	(24,'NodeJS'),
	(25,'Atatata'),
	(26,'Java'),
	(27,'iOS');

/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enlevels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enlevels`;

CREATE TABLE `enlevels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `enlevels` WRITE;
/*!40000 ALTER TABLE `enlevels` DISABLE KEYS */;

INSERT INTO `enlevels` (`id`, `title`, `days`)
VALUES
	(1,'Basic',3),
	(2,'Pre-intermediate',7),
	(3,'Intermediate',10),
	(4,'Upper-intermediate',12),
	(5,'Advanced',20);

/*!40000 ALTER TABLE `enlevels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feeds`;

CREATE TABLE `feeds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('add','pass_achievment','pass_certificate','level_up') NOT NULL DEFAULT 'add',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;

INSERT INTO `feeds` (`id`, `type`, `time`, `user_id`, `level`)
VALUES
	(9,'add','2012-12-26 10:27:43',6,3),
	(10,'pass_certificate','2012-12-26 10:27:43',6,NULL),
	(12,'level_up','2012-12-26 11:12:32',6,NULL),
	(18,'add','2012-12-26 11:42:15',13,1),
	(20,'add','2013-01-31 09:34:34',14,2),
	(21,'pass_certificate','2013-01-31 09:34:34',14,NULL),
	(24,'add','2013-02-26 12:11:53',17,4),
	(25,'add','2013-02-26 12:12:38',18,3),
	(26,'add','2013-02-26 19:49:19',19,2),
	(27,'add','2013-05-27 15:30:43',20,4);

/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table levels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;

INSERT INTO `levels` (`id`, `title`, `days`)
VALUES
	(1,'Junior',7),
	(2,'Middle',30),
	(3,'Senior',90),
	(4,'Project Manager',0);

/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mailers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mailers`;

CREATE TABLE `mailers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mailers` WRITE;
/*!40000 ALTER TABLE `mailers` DISABLE KEYS */;

INSERT INTO `mailers` (`id`, `email`)
VALUES
	(1,'dmitrli@yahoo.com'),
	(2,'tucan@mail.ru'),
	(3,'ololo@gmail.com');

/*!40000 ALTER TABLE `mailers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notices`;

CREATE TABLE `notices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(250) NOT NULL DEFAULT '',
  `type` enum('success','error','info','alert','user') NOT NULL DEFAULT 'success',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;

INSERT INTO `notices` (`id`, `text`, `type`, `status`)
VALUES
	(5,'Hi','success',0),
	(9,'Today there will be meeting with contractor at about 5 p.m.','error',1),
	(10,'Hey people, pancakes are waitinf gor you at the kitchen!','success',1),
	(11,'Well done','success',0),
	(12,'Well done','success',0),
	(13,'Well done','success',0),
	(14,'To the earth coming meteorite!','success',0),
	(15,'Meteorite aimed at the building of the SberBank of Taganrog city!','success',1),
	(16,'Meteorite has missed!','error',1);

/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table passings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passings`;

CREATE TABLE `passings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `days` int(11) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('company','english') NOT NULL DEFAULT 'company',
  `check` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `passings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `passings` WRITE;
/*!40000 ALTER TABLE `passings` DISABLE KEYS */;

INSERT INTO `passings` (`id`, `user_id`, `days`, `time`, `type`, `check`)
VALUES
	(1,1,0,'2013-05-15 14:17:50','company',1),
	(2,1,0,'2013-03-20 04:17:18','english',1),
	(11,6,90,'2012-12-26 11:12:32','company',0),
	(12,6,20,'2012-12-26 10:27:43','english',0),
	(25,13,0,'2013-01-08 23:32:15','company',0),
	(26,13,0,'2012-12-29 05:10:56','english',0),
	(27,14,30,'2013-06-08 09:16:16','company',0),
	(28,14,0,'2013-02-26 02:44:01','english',0),
	(33,17,20,'2013-02-26 12:11:53','english',0),
	(34,18,90,'2013-02-26 12:12:38','company',0),
	(35,18,0,'2013-03-30 09:38:57','english',1),
	(36,19,30,'2013-02-26 19:49:19','company',0),
	(37,19,10,'2013-03-08 05:58:59','english',0),
	(38,20,12,'2013-05-27 15:30:43','english',0);

/*!40000 ALTER TABLE `passings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `description`)
VALUES
	(1,'login','Login privileges, granted after account confirmation'),
	(2,'admin','Administrative user, has access to everything.');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles_users`;

CREATE TABLE `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;

INSERT INTO `roles_users` (`user_id`, `role_id`)
VALUES
	(1,1),
	(6,1),
	(13,1),
	(14,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(1,2),
	(18,2),
	(20,2);

/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_tokens`;

CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`),
  KEY `expires` (`expires`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `enlevel_id` int(11) DEFAULT NULL,
  `pr_type` int(11) DEFAULT NULL COMMENT 'web, mobile',
  `level_id` int(11) DEFAULT NULL,
  `devrole` varchar(100) DEFAULT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `hire_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pc_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `enlevel_id`, `pr_type`, `level_id`, `devrole`, `avatar`, `phone`, `hash`, `hire_date`, `status`, `pc_password`)
VALUES
	(1,'dmitrli@yahoo.com','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',109,1370787228,'zellos-_','dlitvyak2','Dmitry','Litvyak',4,1,2,'PHP developer, Front-end developer','1370771579.jpg','(928)1072384',NULL,'2012-12-18 07:37:21',1,''),
	(6,'zahar_p@gmail.com','zahar_p','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',5,1362040103,'','','Zahar','Pecherin',5,1,3,'PHP developer, Front-end developer','1362039914.jpg','',NULL,'2010-06-08 02:27:42',1,''),
	(13,'erty@kil.com','123a_le123on','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','Leon',1,1,1,'PHP developer, Front-end developer','',NULL,NULL,'2012-12-26 05:02:26',1,''),
	(14,'trololo@ololo.com','Trololo','223b114bdd638f315ebedeb393998635ed8c687352a59c0c4b0928763b280718',2,1360239818,'','123123','Trol','Olol',3,2,2,'iOS Developer','1362039988.jpg','',NULL,'1976-11-25 02:26:42',1,''),
	(17,'purum@gmail.com','purum','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1370771176,NULL,NULL,'Alex','Mason',5,1,4,NULL,'',NULL,NULL,'2013-02-03 04:46:06',1,NULL),
	(18,'vvx@softengine.ru','vvx','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',20,1371106020,NULL,NULL,'Valery','Khashkovsky',4,1,3,'System Administrator','',NULL,NULL,'2012-12-11 02:12:38',1,NULL),
	(19,'kasatka@gmail.com','kasatka','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',2,1362743947,NULL,NULL,'Olga','Petrova',3,2,2,'Android Developer','',NULL,NULL,'2013-02-03 09:49:19',1,NULL),
	(20,'morozovasfu@gmail.com','t_morozova','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',6,1369723159,NULL,NULL,'Татьяна','Морозова',4,1,4,NULL,'1369668639.jpg',NULL,NULL,'2013-05-26 10:30:42',1,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_achievments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_achievments`;

CREATE TABLE `users_achievments` (
  `user_id` int(11) unsigned NOT NULL,
  `achievment_id` int(11) unsigned NOT NULL,
  `check` tinyint(1) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `achievment_id` (`achievment_id`),
  CONSTRAINT `users_achievments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_achievments_ibfk_2` FOREIGN KEY (`achievment_id`) REFERENCES `achievments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_achievments` WRITE;
/*!40000 ALTER TABLE `users_achievments` DISABLE KEYS */;

INSERT INTO `users_achievments` (`user_id`, `achievment_id`, `check`)
VALUES
	(1,1,0),
	(1,2,0),
	(1,3,0),
	(1,4,0),
	(1,5,1),
	(6,1,0),
	(6,2,0),
	(6,3,0),
	(6,4,0),
	(6,5,0),
	(13,1,1),
	(13,2,1),
	(13,3,0),
	(13,4,0),
	(13,5,0),
	(14,1,0),
	(14,2,0),
	(14,3,1),
	(14,4,0),
	(14,5,0),
	(18,1,0),
	(18,2,0),
	(18,3,0),
	(18,4,0),
	(18,5,0),
	(19,1,0),
	(19,2,0),
	(19,3,0),
	(19,4,1),
	(19,5,0);

/*!40000 ALTER TABLE `users_achievments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_certificates_feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_certificates_feeds`;

CREATE TABLE `users_certificates_feeds` (
  `user_id` int(11) unsigned NOT NULL,
  `certificate_id` int(11) unsigned NOT NULL,
  `feed_id` int(11) unsigned NOT NULL,
  `score` float NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `certificate_id` (`certificate_id`),
  KEY `feed_id` (`feed_id`),
  CONSTRAINT `users_certificates_feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_certificates_feeds_ibfk_2` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_certificates_feeds` WRITE;
/*!40000 ALTER TABLE `users_certificates_feeds` DISABLE KEYS */;

INSERT INTO `users_certificates_feeds` (`user_id`, `certificate_id`, `feed_id`, `score`)
VALUES
	(6,23,10,2.3),
	(14,27,21,4);

/*!40000 ALTER TABLE `users_certificates_feeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_notices`;

CREATE TABLE `users_notices` (
  `user_id` int(11) unsigned NOT NULL,
  `notice_id` int(11) unsigned NOT NULL,
  `check` tinyint(1) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `notice_id` (`notice_id`),
  CONSTRAINT `users_notices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_notices_ibfk_2` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_notices` WRITE;
/*!40000 ALTER TABLE `users_notices` DISABLE KEYS */;

INSERT INTO `users_notices` (`user_id`, `notice_id`, `check`)
VALUES
	(1,5,1),
	(6,5,0),
	(13,5,0),
	(19,5,0),
	(1,9,1),
	(6,9,0),
	(13,9,0),
	(14,9,0),
	(17,9,0),
	(18,9,0),
	(19,9,0),
	(1,10,1),
	(6,10,0),
	(13,10,0),
	(14,10,0),
	(17,10,1),
	(18,10,0),
	(19,10,0),
	(1,11,1),
	(6,11,0),
	(13,11,0),
	(14,11,0),
	(17,11,1),
	(18,11,0),
	(19,11,0),
	(1,12,1),
	(6,12,0),
	(13,12,0),
	(14,12,0),
	(17,12,1),
	(18,12,0),
	(19,12,0),
	(1,13,1),
	(6,13,0),
	(13,13,0),
	(14,13,0),
	(17,13,1),
	(18,13,0),
	(19,13,0),
	(1,14,1),
	(6,14,0),
	(13,14,0),
	(14,14,0),
	(17,14,0),
	(18,14,0),
	(19,14,0),
	(1,15,1),
	(6,15,0),
	(13,15,0),
	(14,15,0),
	(17,15,0),
	(18,15,0),
	(19,15,0),
	(1,16,1),
	(6,16,0),
	(13,16,0),
	(14,16,0),
	(17,16,0),
	(18,16,0),
	(19,16,0),
	(20,5,0),
	(20,9,1),
	(20,10,0),
	(20,11,1),
	(20,12,1),
	(20,13,1),
	(20,14,0),
	(20,15,0),
	(20,16,0);

/*!40000 ALTER TABLE `users_notices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vacations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vacations`;

CREATE TABLE `vacations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `day_start` int(2) unsigned NOT NULL,
  `month_start` int(2) unsigned NOT NULL,
  `day_end` int(2) NOT NULL,
  `month_end` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;

INSERT INTO `vacations` (`id`, `user_id`, `day_start`, `month_start`, `day_end`, `month_end`, `year`)
VALUES
	(13,13,14,2,12,2,2014),
	(14,13,2,3,2,4,2014),
	(16,13,15,2,12,3,2013),
	(17,13,15,4,12,5,2013),
	(18,13,7,6,9,7,2015),
	(23,12,1,1,14,1,2013),
	(24,12,13,5,14,6,2013),
	(31,1,13,2,15,2,2013);

/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

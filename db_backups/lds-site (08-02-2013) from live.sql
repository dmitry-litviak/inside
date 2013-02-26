# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: lds-site
# Generation Time: 2013-02-08 06:04:16 +0000
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
	(13,'add','2012-12-26 11:36:11',8,1),
	(14,'add','2012-12-26 11:38:56',9,1),
	(15,'add','2012-12-26 11:40:43',10,1),
	(16,'add','2012-12-26 11:41:04',11,1),
	(17,'add','2012-12-26 11:41:52',12,1),
	(18,'add','2012-12-26 11:42:15',13,1),
	(19,'level_up','2012-12-27 12:26:38',11,NULL),
	(20,'add','2013-01-31 09:34:34',14,2),
	(21,'pass_certificate','2013-01-31 09:34:34',14,NULL),
	(22,'add','2013-01-31 09:46:16',15,1),
	(23,'add','2013-02-07 16:45:01',16,1);

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
	(5,'Hi','success',1),
	(6,'Hallo','success',1);

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
	(1,1,0,'2013-01-27 23:26:59','company',1),
	(2,1,0,'2013-01-27 23:26:59','english',1),
	(11,6,90,'2012-12-26 11:12:32','company',0),
	(12,6,20,'2012-12-26 10:27:43','english',0),
	(15,8,7,'2012-12-26 11:36:11','company',0),
	(16,8,3,'2012-12-26 11:36:11','english',0),
	(17,9,0,'2013-01-10 05:33:44','company',0),
	(18,9,0,'2013-01-10 05:33:44','english',0),
	(19,10,0,'2013-01-10 05:33:40','company',0),
	(20,10,0,'2013-01-10 05:33:40','english',0),
	(21,11,0,'2013-01-30 23:40:43','company',0),
	(22,11,0,'2013-01-30 23:40:43','english',1),
	(23,12,0,'2013-01-10 05:20:30','company',0),
	(24,12,0,'2013-01-10 05:20:30','english',0),
	(25,13,0,'2013-01-08 23:32:15','company',0),
	(26,13,0,'2012-12-29 05:10:56','english',0),
	(27,14,30,'2013-01-31 09:34:34','company',0),
	(28,14,10,'2013-01-31 09:34:34','english',0),
	(29,15,0,'2013-02-07 06:47:16','company',0),
	(30,15,0,'2013-02-07 06:47:16','english',0),
	(31,16,7,'2013-02-07 16:45:01','company',0),
	(32,16,3,'2013-02-07 16:45:01','english',0);

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
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(1,2);

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
	(1,'dmitry.l@lodoss.org','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',79,1360240863,'zellos-_','dlitvyak2','Dmitry','Litvyak',4,1,2,'PHP developer, Front-end developer','1357727999.png','(928)1072384',NULL,'2012-12-18 06:54:00',1,''),
	(6,'zahar_p@gmail.com','zahar_p','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',4,1359610306,'','','Zahar','Pecherin',5,1,3,'PHP developer, Front-end developer','1359610267.png','',NULL,'2010-06-08 23:29:13',1,''),
	(8,'alonzo@gmail.ru','zaha3r_p','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1356613987,NULL,NULL,'sdfsdf','Pecherin',1,1,1,'PHP Developer','',NULL,NULL,'2012-12-13 06:15:10',1,NULL),
	(9,'alonz1o@gmail.ru','a_leon','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','dfgdfgdfg',1,1,1,'PHP Developer','',NULL,NULL,'2012-12-31 01:38:56',1,NULL),
	(10,'z_pecherin@lodoss.org','a_leo2n','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexander','dfgdfgdfg',1,1,1,'PHP Developer','',NULL,NULL,'2012-12-26 01:40:43',1,NULL),
	(11,'a_leon@gmail.com','23у','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1356596757,NULL,NULL,'Dmitry','Pecherin',1,1,2,'PHP developer, Front-end developer','',NULL,NULL,'2012-12-26 02:26:38',1,NULL),
	(12,'1zahar_p@gmail.com','112a_leon','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1357817657,NULL,NULL,'Alexander','dfgdfgdfg',1,1,1,'PHP','',NULL,NULL,'2012-12-26 01:25:47',1,''),
	(13,'erty@kil.com','123a_le123on','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','Leon',1,1,1,'PHP developer, Front-end developer','',NULL,NULL,'2012-12-26 05:02:26',1,''),
	(14,'trololo@ololo.com','Trololo','223b114bdd638f315ebedeb393998635ed8c687352a59c0c4b0928763b280718',2,1360239818,'','123123','Trol','Olol',3,2,2,'iOS Developer','1360239992.jpg','',NULL,'1976-11-25 06:22:00',1,''),
	(15,'sgfwrgqrg@qwefqwef.com','qgergeqgeg','2f6e2bab770fea7666a6e6695f96f9040e1a8d8716032df5b7c22b0111ef4a79',0,NULL,NULL,NULL,'ergerwgwerg','wergwegwerg',1,1,1,'PHP developer, Front-end developer','',NULL,NULL,'2013-01-30 23:46:16',1,''),
	(16,'G@f.com','gdfgsdfg','0aff1fd85c02f393929b910cbbbacddf3136e5688200b28e68acf54fea2716fb',0,NULL,NULL,NULL,'dfgs','sdfsdfsdf',1,1,1,'sdfsdf','',NULL,NULL,'2013-02-07 06:45:01',1,'sfdsdfsdf');

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
	(8,1,1),
	(8,2,0),
	(8,3,0),
	(8,4,0),
	(8,5,0),
	(9,1,1),
	(9,2,0),
	(9,3,0),
	(9,4,0),
	(9,5,0),
	(10,1,1),
	(10,2,1),
	(10,3,0),
	(10,4,0),
	(10,5,0),
	(11,1,1),
	(11,2,1),
	(11,3,0),
	(11,4,0),
	(11,5,0),
	(12,1,1),
	(12,2,0),
	(12,3,0),
	(12,4,0),
	(12,5,0),
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
	(15,1,0),
	(15,2,0),
	(15,3,0),
	(15,4,0),
	(15,5,0),
	(16,1,1),
	(16,2,1),
	(16,3,0),
	(16,4,0),
	(16,5,0);

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
	(8,5,0),
	(9,5,0),
	(10,5,0),
	(11,5,0),
	(12,5,0),
	(13,5,0),
	(1,6,1),
	(6,6,1),
	(8,6,0),
	(9,6,0),
	(10,6,0),
	(11,6,1),
	(12,6,0),
	(13,6,0);

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
	(30,1,13,2,15,2,2013);

/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

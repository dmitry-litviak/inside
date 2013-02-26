# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: lds-site
# Generation Time: 2012-12-13 13:23:08 +0000
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
	(25,'Atatata');

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
	(3,'Intermediate',8),
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
	(79,'add','2012-12-06 10:54:39',75,2),
	(80,'pass_certificate','2012-12-06 10:54:39',75,NULL),
	(82,'pass_achievment','2012-12-06 10:54:39',75,NULL),
	(83,'pass_achievment','2012-12-06 10:54:39',75,NULL),
	(84,'add','2012-12-06 14:59:01',77,2),
	(85,'pass_achievment','2012-12-06 14:59:01',77,NULL),
	(86,'pass_achievment','2012-12-06 16:24:24',75,NULL),
	(87,'pass_achievment','2012-12-06 16:24:33',77,NULL),
	(88,'pass_achievment','2012-12-06 16:24:33',77,NULL),
	(89,'level_up','2012-12-06 16:30:40',75,NULL),
	(90,'add','2012-12-11 12:08:37',78,2),
	(91,'pass_certificate','2012-12-11 12:08:37',78,NULL),
	(92,'pass_achievment','2012-12-11 12:08:37',78,NULL),
	(97,'add','2012-12-13 16:40:41',81,4),
	(98,'pass_certificate','2012-12-13 16:40:41',81,NULL);

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
	(4,'Project Manager',NULL);

/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
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



# Dump of table passings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passings`;

CREATE TABLE `passings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `days` int(11) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('company','english') NOT NULL DEFAULT 'company',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `passings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `passings` WRITE;
/*!40000 ALTER TABLE `passings` DISABLE KEYS */;

INSERT INTO `passings` (`id`, `user_id`, `days`, `time`, `type`)
VALUES
	(2,75,0,'2012-12-06 12:12:08','company'),
	(3,1,30,'2012-12-06 16:15:10','company'),
	(4,77,30,'2012-12-12 10:06:24','company'),
	(5,77,12,'2012-12-12 10:05:38','english'),
	(6,75,12,'2012-12-11 11:46:16','english'),
	(7,78,30,'2012-12-11 12:08:37','company'),
	(8,78,8,'2012-12-11 12:08:37','english'),
	(9,1,12,'2012-12-12 10:02:20','english'),
	(14,81,3,'2012-12-13 16:40:41','english');

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
	(75,1),
	(77,1),
	(78,1),
	(81,1),
	(1,2),
	(75,2);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `enlevel_id`, `pr_type`, `level_id`, `devrole`, `avatar`, `phone`, `hash`)
VALUES
	(1,'dmitry.l@lodoss.org','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',60,1355401760,'zellos-_','dlitvyak','Dmitry','Litvyak',4,1,2,'PHP developer, Front-end developer','1355377804.png','(928)1072384',NULL),
	(75,'z_pecherin@lodoss.org','z_pecherin','56c40eef0213adc8fbce35219cba5ecf99132cbc6ed5884dc5b2f184be6ffa5b',4,1355395389,'','','Zahar','Pecherin',4,1,3,'PHP developer, Front-end developer','1355118600.jpg','',NULL),
	(77,'a_ped@gmail.com','a_ped','cb54bbafcbecb62b42d7f47e66bd9e576919162596016aa18054a0fd2cc0bc29',10,1355308601,'','','Alexey','Pedyashev',4,1,2,'PHP Developer','1355292276.jpeg','',NULL),
	(78,'k_vet@gmail.com','k_vet','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',2,1355213500,'','','Vetal','Koltunov',3,1,2,'PHP developer, Front-end developer','1355213315.jpeg','',NULL),
	(81,'alonzo@gmail.ru','alonzo1','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1355402719,'','','Alonzo','G1',1,NULL,4,NULL,'1355402439.jpg','',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_achievments_feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_achievments_feeds`;

CREATE TABLE `users_achievments_feeds` (
  `user_id` int(11) unsigned NOT NULL,
  `achievment_id` int(11) unsigned NOT NULL,
  `feed_id` int(11) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `achievment_id` (`achievment_id`),
  KEY `feed_id` (`feed_id`),
  CONSTRAINT `users_achievments_feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_achievments_feeds_ibfk_2` FOREIGN KEY (`achievment_id`) REFERENCES `achievments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_achievments_feeds_ibfk_3` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_achievments_feeds` WRITE;
/*!40000 ALTER TABLE `users_achievments_feeds` DISABLE KEYS */;

INSERT INTO `users_achievments_feeds` (`user_id`, `achievment_id`, `feed_id`)
VALUES
	(75,4,82),
	(75,5,83),
	(77,5,85),
	(75,3,86),
	(77,3,87),
	(77,4,88),
	(75,4,82),
	(75,5,83),
	(77,5,85),
	(75,3,86),
	(77,3,87),
	(77,4,88),
	(78,5,92);

/*!40000 ALTER TABLE `users_achievments_feeds` ENABLE KEYS */;
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
	(75,1,80,2.1),
	(78,21,91,1),
	(81,25,98,2.1);

/*!40000 ALTER TABLE `users_certificates_feeds` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

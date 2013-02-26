# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: lds-site
# Generation Time: 2012-12-05 08:34:20 +0000
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
	(24,'NodeJS');

/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feeds`;

CREATE TABLE `feeds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('add','pass_achievment','pass_certificate','level_up') NOT NULL DEFAULT 'add',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;

INSERT INTO `feeds` (`id`, `type`, `time`, `user_id`)
VALUES
	(29,'pass_certificate','2012-11-22 16:24:06',50),
	(31,'pass_achievment','2012-11-22 17:23:28',50),
	(33,'add','2012-11-28 14:11:10',51),
	(34,'pass_certificate','2012-11-28 14:11:10',51),
	(35,'pass_certificate','2012-11-28 14:11:10',51),
	(36,'pass_achievment','2012-11-28 14:11:10',51),
	(53,'add','2012-11-28 15:20:29',60),
	(56,'pass_achievment','2012-11-28 15:20:29',60),
	(57,'pass_certificate','2012-11-29 12:41:24',60),
	(64,'pass_achievment','2012-11-29 16:48:48',60),
	(65,'pass_achievment','2012-11-29 17:15:37',60),
	(66,'pass_achievment','2012-11-29 17:22:38',1),
	(67,'pass_achievment','2012-11-29 17:51:49',22),
	(68,'pass_achievment','2012-11-29 17:52:55',50),
	(69,'pass_achievment','2012-12-05 12:14:35',1),
	(70,'level_up','2012-12-05 12:22:13',60);

/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table levels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;

INSERT INTO `levels` (`id`, `title`)
VALUES
	(1,'Junior'),
	(2,'Middle'),
	(3,'Senior');

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

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;

INSERT INTO `notices` (`id`, `text`, `type`, `status`)
VALUES
	(25,'fdsfsdf','success',0),
	(26,'fsdf','success',0),
	(28,'sdfsdfsf','info',0),
	(36,'dgdfgf','success',0),
	(43,'English lesson will be at Thursday 12.12.2012. Come everybody and invite your friends!','success',1);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(5,1),
	(22,1),
	(50,1),
	(51,1),
	(60,1),
	(1,2);

/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT '7',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `level_id`, `time`)
VALUES
	(1,1,7),
	(2,2,30),
	(3,3,90);

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
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
  `english_level` int(11) DEFAULT NULL,
  `pr_type` int(11) DEFAULT NULL COMMENT 'web, mobile',
  `level_id` int(11) DEFAULT NULL,
  `devrole` varchar(100) DEFAULT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `english_level`, `pr_type`, `level_id`, `devrole`, `avatar`)
VALUES
	(1,'ololo@gmail.com','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',38,1354628761,'zellos-_','dlitvyak','Dmitry','Litvyak',5,1,2,'PHP developer, Front-end developer','1354687625.jpg'),
	(5,'a_leontev@gmail.com','a_leontev','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alex','Leontev',3,1,1,'PHP developer, Front-end developer, Slam',NULL),
	(22,'cyrax@mortal.ru','cyrax','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexander','Ped',1,1,2,'PHP developer, Front-end developer, Robot','1354197091.jpeg'),
	(50,'erty@kil.com','Trololo','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','Pechuorin',3,1,2,'PHP Developer','1354197173.png'),
	(51,'a_ped@gmail.com','a_ped','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexey','Pedyashev',3,2,3,'PHP Developer','1354097464.jpeg'),
	(60,'a_leon@gmail.com','a_leon','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexander','Leon',4,1,3,'PHP Developer','1354174179.jpg');

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
	(50,3,31),
	(51,3,36),
	(60,4,56),
	(60,5,64),
	(60,3,65),
	(1,2,66),
	(22,4,67),
	(50,4,68),
	(1,3,69);

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
  CONSTRAINT `users_certificates_feeds_ibfk_2` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_certificates_feeds_ibfk_3` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_certificates_feeds` WRITE;
/*!40000 ALTER TABLE `users_certificates_feeds` DISABLE KEYS */;

INSERT INTO `users_certificates_feeds` (`user_id`, `certificate_id`, `feed_id`, `score`)
VALUES
	(50,1,29,3.3),
	(51,1,34,1),
	(51,21,35,2),
	(60,21,57,4);

/*!40000 ALTER TABLE `users_certificates_feeds` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

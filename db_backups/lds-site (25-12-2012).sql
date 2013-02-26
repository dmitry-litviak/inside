# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: lds-site
# Generation Time: 2012-12-25 08:41:31 +0000
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
	(26,'Java');

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
	(90,'add','2012-12-18 10:46:43',78,1),
	(91,'add','2012-12-18 10:50:38',79,4),
	(92,'pass_certificate','2012-12-18 10:50:38',79,NULL),
	(93,'add','2012-12-18 16:10:43',81,1),
	(94,'add','2012-12-18 16:18:17',83,1),
	(95,'add','2012-12-18 16:25:58',84,1),
	(96,'pass_certificate','2012-12-18 16:40:26',83,NULL),
	(97,'pass_certificate','2012-12-18 16:40:41',81,NULL),
	(98,'pass_certificate','2012-12-18 16:40:52',77,NULL),
	(99,'pass_certificate','2012-12-18 17:00:40',84,NULL),
	(100,'pass_certificate','2012-12-18 17:00:40',84,NULL),
	(102,'pass_certificate','2012-12-18 17:00:53',81,NULL),
	(103,'pass_certificate','2012-12-18 17:01:02',77,NULL),
	(104,'pass_certificate','2012-12-18 17:01:29',81,NULL),
	(112,'add','2012-12-20 16:40:45',86,4),
	(113,'add','2012-12-20 16:47:39',87,4),
	(115,'add','2012-12-20 16:49:53',89,1),
	(118,'add','2012-12-20 16:54:30',92,1),
	(119,'add','2012-12-20 16:54:52',93,4),
	(120,'add','2012-12-20 16:56:55',94,4),
	(121,'add','2012-12-24 09:21:46',95,1),
	(122,'pass_achievment','2012-12-24 10:58:10',95,NULL),
	(123,'pass_achievment','2012-12-24 10:58:42',89,NULL),
	(124,'add','2012-12-25 10:50:21',98,1);

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
	(1,'&lt;script&gt;alert(&quot;123&quot;)&lt;/script&gt;\n&lt;?php echo &quot;123&quot; ?&gt;','success',1);

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
	(4,77,30,'2012-12-20 04:36:16','company'),
	(5,77,12,'2012-12-20 04:16:49','english'),
	(6,75,12,'2012-12-11 11:46:16','english'),
	(9,1,0,'2012-12-23 23:20:36','english'),
	(10,78,3,'2012-12-18 10:46:43','english'),
	(11,79,0,'2012-12-25 02:13:33','english'),
	(12,81,7,'2012-12-25 02:18:33','english'),
	(13,83,0,'2012-12-23 23:53:50','english'),
	(14,84,3,'2012-12-18 16:25:58','english'),
	(17,86,3,'2012-12-20 06:47:04','english'),
	(18,87,3,'2012-12-20 16:47:39','english'),
	(20,89,7,'2012-12-20 06:50:07','company'),
	(21,89,0,'2012-12-24 00:58:39','english'),
	(24,92,7,'2012-12-20 06:55:11','company'),
	(25,92,0,'2012-12-25 02:22:28','english'),
	(26,93,3,'2012-12-20 06:55:05','english'),
	(27,94,0,'2012-12-24 00:58:24','english'),
	(28,95,7,'2012-12-24 09:21:46','company'),
	(29,95,3,'2012-12-24 09:21:46','english'),
	(32,82,3,'2012-12-25 10:38:45','english'),
	(39,98,7,'2012-12-25 10:51:30','company'),
	(40,98,3,'2012-12-25 10:51:30','english');

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
	(79,1),
	(81,1),
	(83,1),
	(84,1),
	(86,1),
	(87,1),
	(89,1),
	(92,1),
	(93,1),
	(94,1),
	(95,1),
	(98,1),
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
  `hire_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `enlevel_id`, `pr_type`, `level_id`, `devrole`, `avatar`, `phone`, `hash`, `hire_date`)
VALUES
	(1,'dmitry.l@lodoss.org','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',69,1356417794,'zellos-_','dlitvyak2','Dmitry','Litvyak',4,1,2,'PHP developer, Front-end developer','1356420919.jpg','(928)1072384',NULL,'2012-12-18 15:33:38'),
	(75,'z_pecherin@lodoss.org','z_pecherin','56c40eef0213adc8fbce35219cba5ecf99132cbc6ed5884dc5b2f184be6ffa5b',4,1355395389,'','','Zahar','Pecherin',4,1,3,'PHP developer, Front-end developer','1355118600.jpg','',NULL,'2012-01-19 06:04:38'),
	(77,'a_ped@gmail.com','a_ped','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',11,1355998560,'','','Alexey','Pedyashev',4,1,2,'PHP Developer','1355811851.jpeg','',NULL,'2012-12-18 04:15:56'),
	(78,'alonzo@gmail.ru','alonzo1','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1355814023,'','','Alexey','dfgdfgdfg',1,1,1,'PHP Developer','1355827155.jpg','(928)1034322',NULL,'2012-12-18 15:33:38'),
	(79,'erty@kil.com','alonzo12','d4079558bf055c9c69c46ac6a39358fd6efda4181c97f253bc4f97c3c1fb5fe5',1,1355828754,NULL,NULL,'sdfsdf','dfgdfgdfg',1,2,4,NULL,'1355827953.jpg',NULL,NULL,'2009-06-16 06:03:20'),
	(81,'erty1@kil.com','z_pecherin1','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'sdfsdf','Litvyak',2,1,1,'PHP developer, Front-end developer','1355832631.jpg',NULL,NULL,'2012-12-15 07:01:29'),
	(82,'er123ty@kil.com','Trololo','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'sdfsdf','Leon',1,1,1,'PHP developer, Front-end developer',NULL,NULL,NULL,'2012-12-01 06:17:32'),
	(83,'ert23y@kil.com','Trololo2','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexander','Pechuorin',1,1,1,'PHP developer, Front-end developer','1355833087.jpg',NULL,NULL,'2012-12-18 06:40:26'),
	(84,'alonzo123@gmail.ru','alonzo123','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1355987982,NULL,NULL,'Alexander','Pechuorin',1,1,1,'PHP Developer','',NULL,NULL,'2012-11-05 07:00:40'),
	(86,'a_leon1@gmail.com','a_leon','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Alexander','Pedyashev',1,1,4,NULL,'',NULL,NULL,'2012-12-20 06:40:45'),
	(87,'zahar_p@gmail.com','z_pecherin13','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'sdfsdf','Leon',1,1,4,NULL,'',NULL,NULL,'2012-12-20 06:47:39'),
	(89,'alonzo1123@gmail.ru','zahar_p','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','Pecherin',1,1,1,'PHP Developer','',NULL,NULL,'2012-12-20 01:12:15'),
	(92,'zahar_p123@gmail.com','a_leon123','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','dfgdfgdfg',1,1,1,'PHP developer, Front-end developer','',NULL,NULL,'2012-12-20 06:54:30'),
	(93,'z_pecheri1n@lodoss.org','zahar_p1233','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'sdfsdf','Pecherin',1,1,4,NULL,'',NULL,NULL,'2012-12-20 06:54:52'),
	(94,'a_leon@gmail.com','Trololo123','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1356008263,NULL,NULL,'Alexander','Leon',1,1,4,NULL,'',NULL,NULL,'2012-12-20 06:57:38'),
	(95,'alonz1o@gmail.ru','a_leon1','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',0,NULL,NULL,NULL,'Zahar','Pecherin',1,1,1,'PHP Developer','',NULL,NULL,'2012-12-02 01:12:34'),
	(98,'al123onzo@gmail.ru','Trololo1','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1356418272,NULL,NULL,'Dmitry','dfgdfgdfg',1,1,1,'PHP developer, Front-end developer','',NULL,NULL,'2012-12-02 00:50:21');

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
	(95,1,122),
	(89,2,123);

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
	(79,23,92,2.1),
	(83,23,96,1.3),
	(81,1,97,4.2),
	(77,25,98,3.2),
	(84,21,99,2),
	(84,1,100,4),
	(84,23,101,2),
	(81,26,102,5),
	(77,25,103,1.1),
	(81,21,104,3);

/*!40000 ALTER TABLE `users_certificates_feeds` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

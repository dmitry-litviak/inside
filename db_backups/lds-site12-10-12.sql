# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.25)
# Database: lds-site
# Generation Time: 2012-12-10 07:43:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `enlevel_id`, `pr_type`, `level_id`, `devrole`, `avatar`, `phone`)
VALUES
	(1,'ololo@gmail.com','d_litvyak','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',48,1355118585,'zellos-_','dlitvyak','Dmitry','Litvyak',5,1,2,'PHP developer, Front-end developer','1355123264.png','(928)1072384'),
	(75,'z_pecherin@lodoss.org','z_pecherin','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',1,1355118558,NULL,NULL,'Zahar','Pecherin',3,1,3,'PHP developer, Front-end developer','1355118600.jpg',NULL),
	(77,'a_ped@gmail.com','a_ped','4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc',3,1354802226,'','','Alexey','Pedyashev',3,1,2,'PHP Developer','1354793503.jpeg',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 10 2012 г., 09:34
-- Версия сервера: 5.1.61
-- Версия PHP: 5.3.5-1ubuntu7.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ldssite`
--

-- --------------------------------------------------------

--
-- Структура таблицы `achievments`
--

CREATE TABLE IF NOT EXISTS `achievments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `achievments`
--

INSERT INTO `achievments` (`id`, `title`, `level_id`) VALUES
(1, 'Middle company tests', 2),
(2, 'Practice experince (1 completed project for middle developer)', 2),
(3, 'Senior company tests', 3),
(4, 'Brainbench tests', 3),
(5, 'Practice experince (3 completed projects for senior developer)', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `certificates`
--

CREATE TABLE IF NOT EXISTS `certificates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `certificates`
--

INSERT INTO `certificates` (`id`, `title`) VALUES
(1, 'PHP'),
(21, 'JS'),
(22, 'SQL'),
(23, 'CoffeeScript'),
(24, 'NodeJS'),
(25, 'PHP5');

-- --------------------------------------------------------

--
-- Структура таблицы `enlevels`
--

CREATE TABLE IF NOT EXISTS `enlevels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `enlevels`
--

INSERT INTO `enlevels` (`id`, `title`, `days`) VALUES
(1, 'Basic', 3),
(2, 'Pre-intermediate', 7),
(3, 'Intermediate', 8),
(4, 'Upper-intermediate', 12),
(5, 'Advanced', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `feeds`
--

CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('add','pass_achievment','pass_certificate','level_up') NOT NULL DEFAULT 'add',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Дамп данных таблицы `feeds`
--

INSERT INTO `feeds` (`id`, `type`, `time`, `user_id`, `level`) VALUES
(79, 'add', '2012-12-06 10:54:39', 75, 2),
(82, 'pass_achievment', '2012-12-06 10:54:39', 75, NULL),
(83, 'pass_achievment', '2012-12-06 10:54:39', 75, NULL),
(84, 'add', '2012-12-06 14:59:01', 77, 2),
(85, 'pass_achievment', '2012-12-06 14:59:01', 77, NULL),
(86, 'pass_achievment', '2012-12-06 16:24:24', 75, NULL),
(87, 'pass_achievment', '2012-12-06 16:24:33', 77, NULL),
(88, 'pass_achievment', '2012-12-06 16:24:33', 77, NULL),
(89, 'level_up', '2012-12-06 16:30:40', 75, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `levels`
--

INSERT INTO `levels` (`id`, `title`, `days`) VALUES
(1, 'Junior', 7),
(2, 'Middle', 30),
(3, 'Senior', 90);

-- --------------------------------------------------------

--
-- Структура таблицы `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(250) NOT NULL DEFAULT '',
  `type` enum('success','error','info','alert','user') NOT NULL DEFAULT 'success',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Дамп данных таблицы `notices`
--

INSERT INTO `notices` (`id`, `text`, `type`, `status`) VALUES
(46, 'Hi, this is new internal site of our team. Enjoy', 'success', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `passings`
--

CREATE TABLE IF NOT EXISTS `passings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `days` int(11) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('company','english') NOT NULL DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `passings`
--

INSERT INTO `passings` (`id`, `user_id`, `days`, `time`, `type`) VALUES
(2, 75, 0, '2012-12-06 12:12:08', 'company'),
(3, 1, 30, '2012-12-06 16:15:10', 'company'),
(4, 77, 0, '2012-12-06 14:59:01', 'company'),
(5, 77, 8, '2012-12-06 16:16:18', 'english');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation'),
(2, 'admin', 'Administrative user, has access to everything.');

-- --------------------------------------------------------

--
-- Структура таблицы `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(75, 1),
(77, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `skype`, `twitter`, `first_name`, `last_name`, `enlevel_id`, `pr_type`, `level_id`, `devrole`, `avatar`) VALUES
(1, 'ololo@gmail.com', 'd_litvyak', '4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc', 45, 1355116634, 'zellos-_', 'dlitvyak', 'Dmitry', 'Litvyak', 5, 1, 2, 'PHP developer, Front-end developer', '1354876514.JPG'),
(75, 'z_pecherin@lodoss.org', 'z_pecherin', '4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc', 0, NULL, NULL, NULL, 'Zahar', 'Pecherin', 3, 1, 3, 'PHP developer, Front-end developer', '1355117106.JPG'),
(77, 'a_ped@gmail.com', 'a_ped', '4f2058f85ce3d718f1c724845a9a7a22406b222c11cdbb27a8f84b7da7d5f0bc', 2, 1354797846, '', '', 'Alexey', 'Pedyashev', 3, 1, 2, 'PHP Developer', '1355117575.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `users_achievments_feeds`
--

CREATE TABLE IF NOT EXISTS `users_achievments_feeds` (
  `user_id` int(11) unsigned NOT NULL,
  `achievment_id` int(11) unsigned NOT NULL,
  `feed_id` int(11) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `achievment_id` (`achievment_id`),
  KEY `feed_id` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_achievments_feeds`
--

INSERT INTO `users_achievments_feeds` (`user_id`, `achievment_id`, `feed_id`) VALUES
(75, 4, 82),
(75, 5, 83),
(77, 5, 85),
(75, 3, 86),
(77, 3, 87),
(77, 4, 88);

-- --------------------------------------------------------

--
-- Структура таблицы `users_certificates_feeds`
--

CREATE TABLE IF NOT EXISTS `users_certificates_feeds` (
  `user_id` int(11) unsigned NOT NULL,
  `certificate_id` int(11) unsigned NOT NULL,
  `feed_id` int(11) unsigned NOT NULL,
  `score` float NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `certificate_id` (`certificate_id`),
  KEY `feed_id` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_certificates_feeds`
--


-- --------------------------------------------------------

--
-- Структура таблицы `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`),
  KEY `expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `user_tokens`
--


--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_achievments_feeds`
--
ALTER TABLE `users_achievments_feeds`
  ADD CONSTRAINT `users_achievments_feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_achievments_feeds_ibfk_2` FOREIGN KEY (`achievment_id`) REFERENCES `achievments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_achievments_feeds_ibfk_3` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_certificates_feeds`
--
ALTER TABLE `users_certificates_feeds`
  ADD CONSTRAINT `users_certificates_feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

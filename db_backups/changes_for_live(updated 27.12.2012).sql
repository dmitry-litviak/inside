ALTER TABLE users_certificates_feeds DROP FOREIGN KEY users_certificates_feeds_ibfk_3;
INSERT INTO `levels` (`id`, `title`, `days`) VALUES (4,'Project Manager',NULL);

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

# ************************************************************ 18.12.2012
ALTER TABLE users ADD hire_date timestamp NULL DEFAULT NULL;
ALTER TABLE users ADD phone VARCHAR(20);
ALTER TABLE users ADD hash VARCHAR(200);

# ************************************************************ 26.12.2012
ALTER TABLE users_achievments_feeds DROP COLUMN feed_id;
TRUNCATE TABLE users_achievments;
# после чего нужно выполнить /admin/employees/modify_achievments

# ************************************************************ 27.12.2012
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

ALTER TABLE users ADD status tinyint(1) NOT NULL DEFAULT '1';
UPDATE users SET status='1'
WHERE status='0';
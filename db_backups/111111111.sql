ALTER TABLE users_achievments_feeds DROP COLUMN feed_id;
RENAME TABLE users_achievments_feeds TO users_achievments;
TRUNCATE TABLE users_achievments;
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

use 'mydb';

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
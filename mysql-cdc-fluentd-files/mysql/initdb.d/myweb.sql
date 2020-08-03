CREATE DATABASE IF NOT EXISTS myweb CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE IF NOT EXISTS `search_test`
(
  `id` int auto_increment, 
  `text` text CHARACTER SET utf8 NOT NULL, 
  PRIMARY KEY (`id`)
)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `miaosha` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `miaosha`;

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '“”',
  `price` double NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL DEFAULT '“”',
  `sales` int(11) NOT NULL DEFAULT '0',
  `img_url` varchar(100) NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `order_info` (
  `id` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_price` double NOT NULL,
  `amount` int(11) NOT NULL,
  `order_price` double NOT NULL,
  `promo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_name` varchar(50) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `promo_item_price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sequence_info` (
  `name` varchar(255) NOT NULL,
  `current_value` int(11) NOT NULL DEFAULT '0',
  `step` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '//1代表男，2代表女性',
  `age` int(10) unsigned NOT NULL DEFAULT '0',
  `telphone` varchar(64) NOT NULL DEFAULT '',
  `register_mode` varchar(64) NOT NULL DEFAULT '' COMMENT '//byphone,bywechat,byalipay',
  `third_party_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `telphone` (`telphone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='//用户信息表\r\n';

CREATE TABLE IF NOT EXISTS `user_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `encrpt_password` varchar(128) NOT NULL DEFAULT '""',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='//用户密码，单独出来';

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

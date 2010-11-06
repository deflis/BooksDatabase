-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- ホスト: localhost
-- 生成時間: 2010 年 11 月 06 日 16:13
-- サーバのバージョン: 5.1.41
-- PHP のバージョン: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `bookdb`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `isbn` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `illustrator` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `publish_date` date NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `users_books`
--

CREATE TABLE IF NOT EXISTS `users_books` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `isbn` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `read_date` date DEFAULT NULL,
  `review_title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_body` text COLLATE utf8_unicode_ci,
  `rating` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

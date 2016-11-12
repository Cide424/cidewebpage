-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-11-12 11:53:15
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_assets`
--

CREATE TABLE IF NOT EXISTS `o2kj3_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=91 ;

--
-- 转存表中的数据 `o2kj3_assets`
--

INSERT INTO `o2kj3_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 175, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 46, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 47, 48, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 49, 136, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 137, 140, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 141, 142, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 143, 144, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 145, 146, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 147, 148, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 149, 152, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 153, 154, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 138, 139, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 150, 151, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 155, 156, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 157, 158, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 159, 160, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 161, 162, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 163, 164, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 165, 166, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 50, 51, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 18, 52, 53, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 54, 55, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 56, 57, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 58, 59, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 60, 61, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 62, 63, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 64, 65, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 66, 67, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 68, 69, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 70, 71, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 72, 73, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 74, 75, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 76, 77, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 78, 79, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 16, 38, 39, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 1, 167, 168, 1, 'com_k2', 'COM_K2', '{}'),
(56, 18, 80, 81, 2, 'com_modules.module.87', 'K2 Comments', '{}'),
(57, 18, 82, 83, 2, 'com_modules.module.88', 'K2 Content', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(58, 18, 84, 85, 2, 'com_modules.module.89', 'K2 Tools', '{}'),
(59, 18, 86, 87, 2, 'com_modules.module.90', 'K2 Users', '{}'),
(60, 18, 88, 89, 2, 'com_modules.module.91', 'K2 User', '{}'),
(61, 18, 90, 91, 2, 'com_modules.module.92', 'K2 Quick Icons (admin)', '{}'),
(62, 18, 92, 93, 2, 'com_modules.module.93', 'K2 Stats (admin)', '{}'),
(63, 1, 169, 170, 1, '#__languages.2', '#__languages.2', '{}'),
(64, 18, 94, 95, 2, 'com_modules.module.94', '导航菜单', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(65, 18, 96, 97, 2, 'com_modules.module.95', '中文菜单', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(66, 16, 40, 41, 2, 'com_menus.menu.2', '中文菜单', '{}'),
(67, 18, 98, 99, 2, 'com_modules.module.96', '当前路径', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(68, 16, 42, 43, 2, 'com_menus.menu.3', '页脚-常用链接', '{}'),
(69, 18, 100, 101, 2, 'com_modules.module.97', '页脚菜单', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(70, 18, 102, 103, 2, 'com_modules.module.98', '留言板', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(71, 18, 104, 105, 2, 'com_modules.module.99', '退出', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(72, 18, 106, 107, 2, 'com_modules.module.100', '搜索', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(73, 18, 108, 109, 2, 'com_modules.module.101', '常用链接', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(74, 18, 110, 111, 2, 'com_modules.module.102', 'Popular Posts', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(75, 18, 112, 113, 2, 'com_modules.module.103', '热门新闻', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(76, 18, 114, 115, 2, 'com_modules.module.104', 'K2 Tool', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(77, 18, 116, 117, 2, 'com_modules.module.105', '随机图片', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(78, 1, 171, 174, 1, 'com_djimageslider', 'com_djimageslider', '{}'),
(79, 18, 118, 119, 2, 'com_modules.module.106', '滑动图片', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(80, 78, 172, 173, 2, 'com_djimageslider.category.8', 'slide-picture', '{}'),
(81, 18, 120, 121, 2, 'com_modules.module.107', '滑动图片', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(82, 18, 122, 123, 2, 'com_modules.module.108', '滑动图片', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(83, 16, 44, 45, 2, 'com_menus.menu.4', '页脚-友情链接', '{}'),
(84, 18, 124, 125, 2, 'com_modules.module.109', '友情链接', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(85, 18, 126, 127, 2, 'com_modules.module.110', '网站统计', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(86, 18, 128, 129, 2, 'com_modules.module.111', '联系我们', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(87, 18, 130, 131, 2, 'com_modules.module.112', 'Oukan Baidu Map', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(88, 18, 132, 133, 2, 'com_modules.module.113', '百度地图模块', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(89, 18, 134, 135, 2, 'com_modules.module.114', '登录', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(90, 27, 19, 20, 3, 'com_content.article.1', '学术讲座通知 ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_associations`
--

CREATE TABLE IF NOT EXISTS `o2kj3_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_banners`
--

CREATE TABLE IF NOT EXISTS `o2kj3_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_banner_clients`
--

CREATE TABLE IF NOT EXISTS `o2kj3_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `o2kj3_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_categories`
--

CREATE TABLE IF NOT EXISTS `o2kj3_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `o2kj3_categories`
--

INSERT INTO `o2kj3_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 977, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 80, 1, 11, 12, 1, 'slide-pic', 'com_djimageslider', 'slide-picture', 'slide-pic', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 977, '2016-10-30 05:17:49', 977, '2016-10-30 05:17:53', 0, '*', 1);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_contact_details`
--

CREATE TABLE IF NOT EXISTS `o2kj3_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_content`
--

CREATE TABLE IF NOT EXISTS `o2kj3_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o2kj3_content`
--

INSERT INTO `o2kj3_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 90, '学术讲座通知 ', '2016-11-02-07-30-35', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt;"><b style="mso-bidi-font-weight: normal;"><span style="font-size: 14pt; font-family: 黑体; mso-bidi-font-size: 12.0pt;">题<span lang="EN-US"><span style="mso-spacerun: yes;">    </span></span>目：</span></b><span style="font-size: 14pt; font-family: 黑体; mso-bidi-font-size: 12.0pt;">多媒体大数据计算</span></p>\r\n<p class="MsoNormal" style="margin: 7.8pt 0cm; mso-para-margin-top: .5gd; mso-para-margin-right: 0cm; mso-para-margin-bottom: .5gd; mso-para-margin-left: 0cm;"><b style="mso-bidi-font-weight: normal;"><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">讲者信息：朱文武</span></b><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">，清华大学计算机系副主任、清华</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">-</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">伯克利深圳学院信息科学与大数据中心主任、清华大学数据科学研究院首席科学家，国家“千人计划”特聘专家，国家</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">973</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">项目首席科学家。</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">IEEE Fellow</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">、</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">SPIE Fellow</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">、</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">ACM Distinguished Scientist</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">。曾任微软亚洲研究院主任研究员，英特尔中国研究院首席科学家，及美国贝尔实验室研究员等职。现主要从事三元空间大数据计算、多媒体大数据计算等工作。在多媒体计算、通信及网络等研究领域发表高水平国际论文</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">260</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">余篇。被任命为下一届</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">IEEE Transactions on Multimedia </span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">主编。曾</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">6</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">次获</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">ACM</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">及</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">IEEE</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">等国际最佳论文奖。获</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">2012</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">年度国家自然科学二等奖（排名第</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">2</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">）。</span></p>\r\n<p class="MsoNormal" style="margin: 7.8pt 0cm; mso-para-margin-top: .5gd; mso-para-margin-right: 0cm; mso-para-margin-bottom: .5gd; mso-para-margin-left: 0cm;"><b style="mso-bidi-font-weight: normal;"><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">报告信息</span></b><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">：监控图像视频数据正呈现出爆炸性的增长，根据</span><span lang="EN-US" style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;">IDC</span><span style="font-size: 12pt; font-family: 宋体; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: 宋体; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';">的研究报告，大数据中的一半是监控图像视频，已经成为大数据时代的重要数据对象。然而由于图像视频数据本身的非结构化等特性，给监控图像视频数据的处理和分析带来巨大挑战，具有极其重要的理论意义与十分迫切的应用需求。本报告将瞄准国家和社会公共安全的重大战略需求，以图像视频大数据为主要研究对象，围绕图像视频大数据高效表达与压缩、视觉对象感知与跨域关联分析、多元异构信息映射等科学问题，阐述图像视频大数据高效表达与深度计算理论方法与技术体系，为国家大数据战略和智慧城市管理应用提供有力支撑。</span><u></u></p>', '', 1, 2, '2016-11-02 07:30:35', 977, '', '2016-11-02 07:30:35', 0, 977, '2016-11-12 01:38:28', '2016-11-02 07:30:35', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `o2kj3_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `o2kj3_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_content_rating`
--

CREATE TABLE IF NOT EXISTS `o2kj3_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_content_types`
--

CREATE TABLE IF NOT EXISTS `o2kj3_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `o2kj3_content_types`
--

INSERT INTO `o2kj3_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `o2kj3_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_djimageslider`
--

CREATE TABLE IF NOT EXISTS `o2kj3_djimageslider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `o2kj3_djimageslider`
--

INSERT INTO `o2kj3_djimageslider` (`id`, `catid`, `title`, `alias`, `image`, `description`, `published`, `publish_up`, `publish_down`, `checked_out`, `checked_out_time`, `ordering`, `params`) VALUES
(1, 8, 'pic1', 'pic1', 'images/random/pic-1.jpg', '<p>this is pic1</p>', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"link_type":"","link_menu":"101","link_url":"","link_article":"","link_target":"","link_rel":""}'),
(2, 8, 'pic2', 'pic2', 'images/random/pic-3.jpg', '<p>this is pic2</p>', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"link_type":"","link_menu":"101","link_url":"","link_article":"","link_target":"","link_rel":""}'),
(3, 8, 'pic3', 'pic3', 'images/random/pic-4.jpg', '<p>This is pic3</p>', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"link_type":"","link_menu":"101","link_url":"","link_article":"","link_target":"","link_rel":""}'),
(4, 8, 'pic4', 'pic4', 'images/random/pic-5.jpg', '<p>this is pic4</p>', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"link_type":"","link_menu":"101","link_url":"","link_article":"","link_target":"","link_rel":""}');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_extensions`
--

CREATE TABLE IF NOT EXISTS `o2kj3_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10029 ;

--
-- 转存表中的数据 `o2kj3_extensions`
--

INSERT INTO `o2kj3_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"zh-CN","site":"zh-CN"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"f45e9bb00b5a77fae48c0f8e445e100f"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.17.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2016","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.4.0","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `o2kj3_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1478947148}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":3,"lastrun":1476496686,"unique_id":"1b9bd1e5848152c0a26dce514b482e831666e6f0","interval":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"August 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, '', 'language', 'zh-CN', '', 0, 1, 0, 0, '{"name":"\\u7b80\\u4f53\\u4e2d\\u6587","type":"language","creationDate":"2015-03-03","author":"CHN Translation Team: joomla.cn","copyright":"Copyright (C) 2005 - 2015 \\u7b80\\u4f53\\u4e2d\\u6587\\u7ffb\\u8bd1\\u7ec4\\uff08joomla.cn\\uff09\\u53caOpen Source Matters\\uff0c\\u7248\\u6743\\u6240\\u6709\\u3002","authorEmail":"zhous1998@sohu.com","authorUrl":"www.joomla.cn","version":"3.4.1.1","description":"\\n    \\n<div align=\\"center\\">\\n <table border=\\"0\\" width=\\"90%\\">\\n  <table width=\\"100%\\" border=\\"0\\">\\n  <tr>\\n    <td colspan=\\"2\\">Chinese language for Joomla 3.x front-end. Translated by CHN Joomla Translation Team, one of Joomla Accredited Translations.<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">Joomla 3.4\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u662f\\u7531Joomla\\u5b98\\u65b9\\u7ffb\\u8bd1\\u7ec4\\u7684Derek Joe\\u5728Joomla 2.5\\u7ffb\\u8bd1\\u5de5\\u4f5c\\u7684\\u57fa\\u7840\\u4e0a\\u8865\\u5145\\u7ffb\\u8bd1\\u3002<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">Joomla\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7684\\u4e3b\\u8981\\u8d21\\u732e\\u4eba\\uff1a<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u524d\\u53f0\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/wuyujie\\/\\" target=\\"_blank\\">\\u6b66\\u7389\\u6770<\\/a>(wuyujie)\\u3001 <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/gzpan123\\/\\" target=\\"_blank\\">\\u90ed\\u5fd7\\u6500<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u540e\\u53f0\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/keydiagram\\/\\" target=\\"_blank\\">Key Diagram<\\/a>\\u3001<a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\">Yusuf  Wang<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u5b89\\u88c5\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/freechoice\\/\\" target=\\"_blank\\">Johnathan Cheun<\\/a>\\u3001<a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\">Yusuf  Wang<\\/a>\\u3001 <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\" target=\\"_blank\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u793a\\u8303\\u5185\\u5bb9\\u53ca\\u7f16\\u8f91\\u5668\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\" target=\\"_blank\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u591a\\u8c22\\u5927\\u5bb6\\u7684\\u5949\\u732e\\u7cbe\\u795e\\u548c\\u8f9b\\u52e4\\u52b3\\u52a8\\uff01<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td width=\\"132\\"><p><a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\"><img src=\\"http:\\/\\/www.joomla.cn\\/images\\/aboutJoomlaChina.png\\" alt=\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\" width=\\"130\\" height=\\"70\\" align=\\"left\\" longdesc=\\"http:\\/\\/www.joomla.cn\\"><br \\/>\\n    <\\/a><\\/p><\\/td>\\n    <td valign=\\"middle\\"><a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\">Joomla\\u53ca\\u5176\\u6269\\u5c55\\u6c49\\u5316\\u7684\\u5206\\u4eab\\u4e0e\\u8ba8\\u8bba\\u8bf7\\u8bbf\\u95ee\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\"<\\/a><br \\/>\\n      <b>\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u7684\\u670b\\u53cb<\\/b><br \\/>\\n    <a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\"><b>\\u52a0\\u5165\\u6211\\u4eec\\u7684\\u7ffb\\u8bd1\\u7ec4<\\/b><\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">&nbsp;<\\/td>\\n  <\\/tr>\\n<\\/table>\\n <\\/div>\\n  \\n\\t","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, '', 'language', 'zh-CN', '', 1, 1, 0, 0, '{"name":"\\u7b80\\u4f53\\u4e2d\\u6587","type":"language","creationDate":"2015-3-14","author":"CHN Translation Team: joomla.cn","copyright":"Copyright (C) 2005 - 2014 \\u7b80\\u4f53\\u4e2d\\u6587\\u7ffb\\u8bd1\\u7ec4\\uff08joomla.cn\\uff09\\u53caOpen Source Matters\\uff0c\\u7248\\u6743\\u6240\\u6709\\u3002","authorEmail":"zhous1998@sohu.com","authorUrl":"www.joomla.cn","version":"3.4.1.1","description":"\\n    \\n<div align=\\"center\\">\\n <table border=\\"0\\" width=\\"90%\\">\\n  <table width=\\"100%\\" border=\\"0\\">\\n  <tr>\\n    <td colspan=\\"2\\">Chinese language for Joomla 3.x front-end. Translated by CHN Joomla Translation Team, one of Joomla Accredited Translations.<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">Joomla 3.4\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u662f\\u7531Joomla\\u5b98\\u65b9\\u7ffb\\u8bd1\\u7ec4\\u7684Derek Joe\\u5728Joomla 2.5\\u7ffb\\u8bd1\\u5de5\\u4f5c\\u7684\\u57fa\\u7840\\u4e0a\\u8865\\u5145\\u7ffb\\u8bd1\\u3002<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">Joomla\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7684\\u4e3b\\u8981\\u8d21\\u732e\\u4eba\\uff1a<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u524d\\u53f0\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/wuyujie\\/\\" target=\\"_blank\\">\\u6b66\\u7389\\u6770<\\/a>(wuyujie)\\u3001 <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/gzpan123\\/\\" target=\\"_blank\\">\\u90ed\\u5fd7\\u6500<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u540e\\u53f0\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/keydiagram\\/\\" target=\\"_blank\\">Key Diagram<\\/a>\\u3001<a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\">Yusuf  Wang<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u5b89\\u88c5\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/freechoice\\/\\" target=\\"_blank\\">Johnathan Cheun<\\/a>\\u3001<a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\">Yusuf  Wang<\\/a>\\u3001 <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\" target=\\"_blank\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u793a\\u8303\\u5185\\u5bb9\\u53ca\\u7f16\\u8f91\\u5668\\uff1a <a href=\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\" target=\\"_blank\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">\\u591a\\u8c22\\u5927\\u5bb6\\u7684\\u5949\\u732e\\u7cbe\\u795e\\u548c\\u8f9b\\u52e4\\u52b3\\u52a8\\uff01<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td width=\\"132\\"><p><a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\"><img src=\\"http:\\/\\/www.joomla.cn\\/images\\/aboutJoomlaChina.png\\" alt=\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\" width=\\"130\\" height=\\"70\\" align=\\"left\\" longdesc=\\"http:\\/\\/www.joomla.cn\\"><br \\/>\\n    <\\/a><\\/p><\\/td>\\n    <td valign=\\"middle\\"><a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\">Joomla\\u53ca\\u5176\\u6269\\u5c55\\u6c49\\u5316\\u7684\\u5206\\u4eab\\u4e0e\\u8ba8\\u8bba\\u8bf7\\u8bbf\\u95ee\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\"<\\/a><br \\/>\\n      <b>\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u7684\\u670b\\u53cb<\\/b><br \\/>\\n    <a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\"><b>\\u52a0\\u5165\\u6211\\u4eec\\u7684\\u7ffb\\u8bd1\\u7ec4<\\/b><\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\"2\\">&nbsp;<\\/td>\\n  <\\/tr>\\n<\\/table>\\n <\\/div>\\n  \\n\\t","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, '简体中文语言包', 'package', 'pkg_zh-CN', '', 0, 1, 1, 0, '{"name":"\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305","type":"package","creationDate":"2015-03-03","author":"CHN Translation Team: joomla.cn","copyright":"Copyright (C) 2005 - 2015 \\u56e7\\u5566\\u4e2d\\u56fd\\uff08joomla.cn\\uff09\\u53caOpen Source Matters\\uff0c\\u7248\\u6743\\u6240\\u6709\\u3002","authorEmail":"zhous1998@sohu.com","authorUrl":"www.joomla.cn","version":"3.4.1.1","description":"\\n\\t\\n\\t<h3>Joomla! 3.4.1\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7b2c\\u4e00\\u7248<\\/h3>\\n    <h3>Joomla! 3.4.1 Full Simplified Chinese (zh-CN) Language Package version 1<\\/h3>\\n\\t<div>\\n\\t<a href=\\"http:\\/\\/www.joomla.cn\\" target=\\"_blank\\"><img src=\\"http:\\/\\/www.joomla.cn\\/images\\/joomla.cn_logo.png\\" alt=\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\uff08Joomla.cn\\uff09\\" title=\\"\\u7ffb\\u8bd1\\u57fa\\u5730\\uff1a\\u56e7\\u5566!\\u4e2d\\u56fd\\uff08Joomla.cn\\uff09\\" \\/><\\/a>\\u3002<br><br>\\u6b22\\u8fce\\u52a0\\u5165\\u201cJoomla\\u4f7f\\u7528\\u4ea4\\u6d41\\u201dQ\\u7fa4\\uff1a154673214\\u300172746093\\u3002<br><br>\\n\\tJoomla\\u5b98\\u65b9\\u7ffb\\u8bd1\\u7ec4\\u5468\\u671d\\u6656\\uff08Derek Zhou\\uff09\\u7ec4\\u7ec7\\u7ffb\\u8bd1\\u3002<br><br>\\u611f\\u8c22Joomla\\u7b80\\u4f53\\u4e2d\\u6587\\u7ffb\\u8bd1\\u7ec4\\u7684\\u6240\\u6709\\u5fd7\\u613f\\u8005\\uff1a<br>\\u6b66\\u7389\\u6770\\u3001Key Diagram\\u3001Yusuf  Wang\\u3001\\u90ed\\u5fd7\\u6500\\u3001Eric Wong\\uff08http:\\/\\/berocks2.com\\/\\uff09\\u3001wayne82\\uff01<br>\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u7684\\u670b\\u53cb\\u52a0\\u5165\\u6211\\u4eec\\u3002<br><br>\\n\\t <br>\\n\\t<\\/div>\\n\\t\\n\\t","group":"","filename":"pkg_zh-CN"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'plg_installer_webinstaller', 'plugin', 'webinstaller', 'installer', 0, 1, 1, 0, '{"name":"plg_installer_webinstaller","type":"plugin","creationDate":"17 February 2016","author":"Joomla! Project","copyright":"Copyright (C) 2013-2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.1.0","description":"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION","group":"","filename":"webinstaller"}', '{"tab_position":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'COM_K2', 'component', 'com_k2', '', 1, 1, 0, 0, '{"name":"COM_K2","type":"component","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"Thank you for installing K2 by JoomlaWorks, the powerful content extension for Joomla!","group":"","filename":"k2"}', '{"enable_css":"1","jQueryHandling":"1.8remote","backendJQueryHandling":"remote","userName":"1","userImage":"1","userDescription":"1","userURL":"1","userEmail":"0","userFeedLink":"1","userFeedIcon":"1","userItemCount":"10","userItemTitle":"1","userItemTitleLinked":"1","userItemDateCreated":"1","userItemImage":"1","userItemIntroText":"1","userItemCategory":"1","userItemTags":"1","userItemCommentsAnchor":"1","userItemReadMore":"1","userItemK2Plugins":"1","tagItemCount":"10","tagItemTitle":"1","tagItemTitleLinked":"1","tagItemDateCreated":"1","tagItemImage":"1","tagItemIntroText":"1","tagItemCategory":"1","tagItemReadMore":"1","tagItemExtraFields":"0","tagOrdering":"","tagFeedLink":"1","tagFeedIcon":"1","genericItemCount":"10","genericItemTitle":"1","genericItemTitleLinked":"1","genericItemDateCreated":"1","genericItemImage":"1","genericItemIntroText":"1","genericItemCategory":"1","genericItemReadMore":"1","genericItemExtraFields":"0","genericFeedLink":"1","genericFeedIcon":"1","feedLimit":"10","feedItemImage":"1","feedImgSize":"S","feedItemIntroText":"1","feedTextWordLimit":"","feedItemFullText":"1","feedItemTags":"0","feedItemVideo":"0","feedItemGallery":"0","feedItemAttachments":"0","feedBogusEmail":"","introTextCleanup":"0","introTextCleanupExcludeTags":"","introTextCleanupTagAttr":"","fullTextCleanup":"0","fullTextCleanupExcludeTags":"","fullTextCleanupTagAttr":"","xssFiltering":"0","linkPopupWidth":"900","linkPopupHeight":"600","imagesQuality":"100","itemImageXS":"100","itemImageS":"200","itemImageM":"400","itemImageL":"600","itemImageXL":"900","itemImageGeneric":"300","catImageWidth":"100","catImageDefault":"1","userImageWidth":"100","userImageDefault":"1","commenterImgWidth":"48","onlineImageEditor":"sumopaint","imageTimestamp":"0","imageMemoryLimit":"","socialButtonCode":"<div class=\\"bshare-custom\\"><a title=\\"\\u5206\\u4eab\\u5230QQ\\u7a7a\\u95f4\\" class=\\"bshare-qzone\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u65b0\\u6d6a\\u5fae\\u535a\\" class=\\"bshare-sinaminiblog\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u4eba\\u4eba\\u7f51\\" class=\\"bshare-renren\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u817e\\u8baf\\u5fae\\u535a\\" class=\\"bshare-qqmb\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u7f51\\u6613\\u5fae\\u535a\\" class=\\"bshare-neteasemb\\"><\\/a><a title=\\"\\u66f4\\u591a\\u5e73\\u53f0\\" class=\\"bshare-more bshare-more-icon more-style-addthis\\"><\\/a><span class=\\"BSHARE_COUNT bshare-share-count\\">0<\\/span><\\/div><script type=\\"text\\/javascript\\" charset=\\"utf-8\\" src=\\"http:\\/\\/static.bshare.cn\\/b\\/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh\\"><\\/script><script type=\\"text\\/javascript\\" charset=\\"utf-8\\" src=\\"http:\\/\\/static.bshare.cn\\/b\\/bshareC0.js\\"><\\/script>\\r\\n","twitterUsername":"admin","facebookMetatags":"1","facebookImage":"Medium","comments":"1","commentsOrdering":"DESC","commentsLimit":"10","commentsFormPosition":"below","commentsPublishing":"0","commentsReporting":"2","commentsReportRecipient":"","inlineCommentsModeration":"0","gravatar":"1","antispam":"0","recaptchaForRegistered":"1","akismetForRegistered":"1","commentsFormNotes":"1","commentsFormNotesText":"","frontendEditing":"1","showImageTab":"1","showImageGalleryTab":"1","showVideoTab":"1","showExtraFieldsTab":"1","showAttachmentsTab":"1","showK2Plugins":"1","sideBarDisplayFrontend":"0","mergeEditors":"1","sideBarDisplay":"1","attachmentsFolder":"","hideImportButton":"0","googleSearch":"0","googleSearchContainer":"k2GoogleSearchContainer","K2UserProfile":"1","redirect":"101","adminSearch":"simple","cookieDomain":"","gatherStatistics":"1","taggingSystem":"1","lockTags":"0","showTagFilter":"0","k2TagNorm":"0","k2TagNormCase":"lower","k2TagNormAdditionalReplacements":"","recaptcha_public_key":"","recaptcha_private_key":"admin","recaptcha_theme":"clean","recaptchaV2":"1","recaptchaOnRegistration":"0","akismetApiKey":"","stopForumSpam":"0","stopForumSpamApiKey":"","profilePageDisplay":"0","showItemsCounterAdmin":"1","showChildCatItems":"1","disableCompactOrdering":"0","metaDescLimit":"150","enforceSEFReplacements":"0","SEFReplacements":"\\u00c0|A, \\u00c1|A, \\u00c2|A, \\u00c3|A, \\u00c4|A, \\u00c5|A, \\u00e0|a, \\u00e1|a, \\u00e2|a, \\u00e3|a, \\u00e4|a, \\u00e5|a, \\u0100|A, \\u0101|a, \\u0102|A, \\u0103|a, \\u0104|A, \\u0105|a, \\u00c7|C, \\u00e7|c, \\u0106|C, \\u0107|c, \\u0108|C, \\u0109|c, \\u010a|C, \\u010b|c, \\u010c|C, \\u010d|c, \\u00d0|D, \\u00f0|d, \\u010e|D, \\u010f|d, \\u0110|D, \\u0111|d, \\u00c8|E, \\u00c9|E, \\u00ca|E, \\u00cb|E, \\u00e8|e, \\u00e9|e, \\u00ea|e, \\u00eb|e, \\u0112|E, \\u0113|e, \\u0114|E, \\u0115|e, \\u0116|E, \\u0117|e, \\u0118|E, \\u0119|e, \\u011a|E, \\u011b|e, \\u011c|G, \\u011d|g, \\u011e|G, \\u011f|g, \\u0120|G, \\u0121|g, \\u0122|G, \\u0123|g, \\u0124|H, \\u0125|h, \\u0126|H, \\u0127|h, \\u00cc|I, \\u00cd|I, \\u00ce|I, \\u00cf|I, \\u00ec|i, \\u00ed|i, \\u00ee|i, \\u00ef|i, \\u0128|I, \\u0129|i, \\u012a|I, \\u012b|i, \\u012c|I, \\u012d|i, \\u012e|I, \\u012f|i, \\u0130|I, \\u0131|i, \\u0134|J, \\u0135|j, \\u0136|K, \\u0137|k, \\u0138|k, \\u0139|L, \\u013a|l, \\u013b|L, \\u013c|l, \\u013d|L, \\u013e|l, \\u013f|L, \\u0140|l, \\u0141|L, \\u0142|l, \\u00d1|N, \\u00f1|n, \\u0143|N, \\u0144|n, \\u0145|N, \\u0146|n, \\u0147|N, \\u0148|n, \\u0149|n, \\u014a|N, \\u014b|n, \\u00d2|O, \\u00d3|O, \\u00d4|O, \\u00d5|O, \\u00d6|O, \\u00d8|O, \\u00f2|o, \\u00f3|o, \\u00f4|o, \\u00f5|o, \\u00f6|o, \\u00f8|o, \\u014c|O, \\u014d|o, \\u014e|O, \\u014f|o, \\u0150|O, \\u0151|o, \\u0154|R, \\u0155|r, \\u0156|R, \\u0157|r, \\u0158|R, \\u0159|r, \\u015a|S, \\u015b|s, \\u015c|S, \\u015d|s, \\u015e|S, \\u015f|s, \\u0160|S, \\u0161|s, \\u017f|s, \\u0162|T, \\u0163|t, \\u0164|T, \\u0165|t, \\u0166|T, \\u0167|t, \\u00d9|U, \\u00da|U, \\u00db|U, \\u00dc|U, \\u00f9|u, \\u00fa|u, \\u00fb|u, \\u00fc|u, \\u0168|U, \\u0169|u, \\u016a|U, \\u016b|u, \\u016c|U, \\u016d|u, \\u016e|U, \\u016f|u, \\u0170|U, \\u0171|u, \\u0172|U, \\u0173|u, \\u0174|W, \\u0175|w, \\u00dd|Y, \\u00fd|y, \\u00ff|y, \\u0176|Y, \\u0177|y, \\u0178|Y, \\u0179|Z, \\u017a|z, \\u017b|Z, \\u017c|z, \\u017d|Z, \\u017e|z, \\u03b1|a, \\u03b2|b, \\u03b3|g, \\u03b4|d, \\u03b5|e, \\u03b6|z, \\u03b7|h, \\u03b8|th, \\u03b9|i, \\u03ba|k, \\u03bb|l, \\u03bc|m, \\u03bd|n, \\u03be|x, \\u03bf|o, \\u03c0|p, \\u03c1|r, \\u03c3|s, \\u03c4|t, \\u03c5|y, \\u03c6|f, \\u03c7|ch, \\u03c8|ps, \\u03c9|w, \\u0391|A, \\u0392|B, \\u0393|G, \\u0394|D, \\u0395|E, \\u0396|Z, \\u0397|H, \\u0398|Th, \\u0399|I, \\u039a|K, \\u039b|L, \\u039c|M, \\u039e|X, \\u039f|O, \\u03a0|P, \\u03a1|R, \\u03a3|S, \\u03a4|T, \\u03a5|Y, \\u03a6|F, \\u03a7|Ch, \\u03a8|Ps, \\u03a9|W, \\u03ac|a, \\u03ad|e, \\u03ae|h, \\u03af|i, \\u03cc|o, \\u03cd|y, \\u03ce|w, \\u0386|A, \\u0388|E, \\u0389|H, \\u038a|I, \\u038c|O, \\u038e|Y, \\u038f|W, \\u03ca|i, \\u0390|i, \\u03cb|y, \\u03c2|s, \\u0410|A, \\u04d0|A, \\u04d2|A, \\u04d8|E, \\u04da|E, \\u04d4|E, \\u0411|B, \\u0412|V, \\u0413|G, \\u0490|G, \\u0403|G, \\u0492|G, \\u04f6|G, y|Y, \\u0414|D, \\u0415|E, \\u0400|E, \\u0401|YO, \\u04d6|E, \\u04bc|E, \\u04be|E, \\u0404|YE, \\u0416|ZH, \\u04c1|DZH, \\u0496|ZH, \\u04dc|DZH, \\u0417|Z, \\u0498|Z, \\u04de|DZ, \\u04e0|DZ, \\u0405|DZ, \\u0418|I, \\u040d|I, \\u04e4|I, \\u04e2|I, \\u0406|I, \\u0407|JI, \\u04c0|I, \\u0419|Y, \\u048a|Y, \\u0408|J, \\u041a|K, \\u049a|Q, \\u049e|Q, \\u04a0|K, \\u04c3|Q, \\u049c|K, \\u041b|L, \\u04c5|L, \\u0409|L, \\u041c|M, \\u04cd|M, \\u041d|N, \\u04c9|N, \\u04a2|N, \\u04c7|N, \\u04a4|N, \\u040a|N, \\u041e|O, \\u04e6|O, \\u04e8|O, \\u04ea|O, \\u04a8|O, \\u041f|P, \\u04a6|PF, \\u0420|P, \\u048e|P, \\u0421|S, \\u04aa|S, \\u0422|T, \\u04ac|TH, \\u040b|T, \\u040c|K, \\u0423|U, \\u040e|U, \\u04f2|U, \\u04f0|U, \\u04ee|U, \\u04ae|U, \\u04b0|U, \\u0424|F, \\u0425|H, \\u04b2|H, \\u04ba|H, \\u0426|TS, \\u04b4|TS, \\u0427|CH, \\u04f4|CH, \\u04b6|CH, \\u04cb|CH, \\u04b8|CH, \\u040f|DZ, \\u0428|SH, \\u0429|SHT, \\u042a|A, \\u042b|Y, \\u04f8|Y, \\u042c|Y, \\u048c|Y, \\u042d|E, \\u04ec|E, \\u042e|YU, \\u042f|YA, \\u0430|a, \\u04d1|a, \\u04d3|a, \\u04d9|e, \\u04db|e, \\u04d5|e, \\u0431|b, \\u0432|v, \\u0433|g, \\u0491|g, \\u0453|g, \\u0493|g, \\u04f7|g, y|y, \\u0434|d, \\u0435|e, \\u0450|e, \\u0451|yo, \\u04d7|e, \\u04bd|e, \\u04bf|e, \\u0454|ye, \\u0436|zh, \\u04c2|dzh, \\u0497|zh, \\u04dd|dzh, \\u0437|z, \\u0499|z, \\u04df|dz, \\u04e1|dz, \\u0455|dz, \\u0438|i, \\u045d|i, \\u04e5|i, \\u04e3|i, \\u0456|i, \\u0457|ji, \\u04c0|i, \\u0439|y, \\u048b|y, \\u0458|j, \\u043a|k, \\u049b|q, \\u049f|q, \\u04a1|k, \\u04c4|q, \\u049d|k, \\u043b|l, \\u04c6|l, \\u0459|l, \\u043c|m, \\u04ce|m, \\u043d|n, \\u04ca|n, \\u04a3|n, \\u04c8|n, \\u04a5|n, \\u045a|n, \\u043e|o, \\u04e7|o, \\u04e9|o, \\u04eb|o, \\u04a9|o, \\u043f|p, \\u04a7|pf, \\u0440|p, \\u048f|p, \\u0441|s, \\u04ab|s, \\u0442|t, \\u04ad|th, \\u045b|t, \\u045c|k, \\u0443|u, \\u045e|u, \\u04f3|u, \\u04f1|u, \\u04ef|u, \\u04af|u, \\u04b1|u, \\u0444|f, \\u0445|h, \\u04b3|h, \\u04bb|h, \\u0446|ts, \\u04b5|ts, \\u0447|ch, \\u04f5|ch, \\u04b7|ch, \\u04cc|ch, \\u04b9|ch, \\u045f|dz, \\u0448|sh, \\u0449|sht, \\u044a|a, \\u044b|y, \\u04f9|y, \\u044c|y, \\u048d|y, \\u044d|e, \\u04ed|e, \\u044e|yu, \\u044f|ya","k2Sef":"0","k2SefLabelCat":"content","k2SefLabelTag":"tag","k2SefLabelUser":"author","k2SefLabelSearch":"search","k2SefLabelDate":"date","k2SefLabelItem":"0","k2SefLabelItemCustomPrefix":"","k2SefInsertItemId":"1","k2SefItemIdTitleAliasSep":"dash","k2SefUseItemTitleAlias":"1","k2SefInsertCatId":"1","k2SefCatIdTitleAliasSep":"dash","k2SefUseCatTitleAlias":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'plg_finder_k2', 'plugin', 'k2', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_k2","type":"plugin","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"PLG_FINDER_K2_DESCRIPTION","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'Search - K2', 'plugin', 'k2', 'search', 0, 1, 1, 0, '{"name":"Search - K2","type":"plugin","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_THIS_PLUGIN_EXTENDS_THE_DEFAULT_JOOMLA_SEARCH_FUNCTIONALITY_TO_K2_CONTENT","group":"","filename":"k2"}', '{"search_limit":"50","search_tags":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'System - K2', 'plugin', 'k2', 'system', 0, 1, 1, 0, '{"name":"System - K2","type":"plugin","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_THE_K2_SYSTEM_PLUGIN_IS_USED_TO_ASSIST_THE_PROPER_FUNCTIONALITY_OF_THE_K2_COMPONENT_SITE_WIDE_MAKE_SURE_ITS_ALWAYS_PUBLISHED_WHEN_THE_K2_COMPONENT_IS_INSTALLED","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'User - K2', 'plugin', 'k2', 'user', 0, 1, 1, 0, '{"name":"User - K2","type":"plugin","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_A_USER_SYNCHRONIZATION_PLUGIN_FOR_K2","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'K2 Comments', 'module', 'mod_k2_comments', '', 0, 1, 0, 0, '{"name":"K2 Comments","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"MOD_K2_COMMENTS_DESCRIPTION","group":"","filename":"mod_k2_comments.j25"}', '{"moduleclass_sfx":"","module_usage":"","":"K2_TOP_COMMENTERS","catfilter":"0","category_id":"","comments_limit":"5","comments_word_limit":"10","commenterName":"1","commentAvatar":"1","commentAvatarWidthSelect":"custom","commentAvatarWidth":"50","commentDate":"1","commentDateFormat":"absolute","commentLink":"1","itemTitle":"1","itemCategory":"1","feed":"1","commenters_limit":"5","commenterNameOrUsername":"1","commenterAvatar":"1","commenterAvatarWidthSelect":"custom","commenterAvatarWidth":"50","commenterLink":"1","commenterCommentsCounter":"1","commenterLatestComment":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'K2 Content', 'module', 'mod_k2_content', '', 0, 1, 0, 0, '{"name":"K2 Content","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_MOD_K2_CONTENT_DESCRIPTION","group":"","filename":"mod_k2_content.j25"}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"filter","":"K2_OTHER_OPTIONS","catfilter":"0","category_id":"","getChildren":"0","itemCount":"5","itemsOrdering":"","FeaturedItems":"1","popularityRange":"","videosOnly":"0","item":"","items":"","itemTitle":"1","itemAuthor":"1","itemAuthorAvatar":"1","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"1","itemIntroText":"1","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Small","itemVideo":"1","itemVideoCaption":"1","itemVideoCredits":"1","itemAttachments":"1","itemTags":"1","itemCategory":"1","itemDateCreated":"1","itemHits":"1","itemReadMore":"1","itemExtraFields":"0","itemCommentsCounter":"1","feed":"1","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'K2 Tools', 'module', 'mod_k2_tools', '', 0, 1, 0, 0, '{"name":"K2 Tools","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_TOOLS","group":"","filename":"mod_k2_tools.j25"}', '{"moduleclass_sfx":"","module_usage":"0","":"K2_CUSTOM_CODE_SETTINGS","archiveItemsCounter":"1","archiveCategory":"","authors_module_category":"","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"","home":"","seperator":"","root_id":"","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"","catfilter":"0","category_id":"","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","searchItemId":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":"0","cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'K2 Users', 'module', 'mod_k2_users', '', 0, 1, 0, 0, '{"name":"K2 Users","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_MOD_K2_USERS_DESCRTIPTION","group":"","filename":"mod_k2_users.j25"}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"0","":"K2_DISPLAY_OPTIONS","filter":"1","K2UserGroup":"","ordering":"1","limit":"4","userIDs":"","userName":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","userDescription":"1","userDescriptionWordLimit":"","userURL":"1","userEmail":"0","userFeed":"1","userItemCount":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `o2kj3_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10013, 'K2 User', 'module', 'mod_k2_user', '', 0, 1, 0, 0, '{"name":"K2 User","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_MOD_K2_USER_DESCRIPTION","group":"","filename":"mod_k2_user.j25"}', '{"moduleclass_sfx":"","pretext":"","":"K2_LOGIN_LOGOUT_REDIRECTION","name":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","menu":"","login":"","logout":"","usesecure":"0","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'K2 Quick Icons (admin)', 'module', 'mod_k2_quickicons', '', 1, 1, 2, 0, '{"name":"K2 Quick Icons (admin)","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_QUICKICONS_FOR_USE_IN_THE_JOOMLA_CONTROL_PANEL_DASHBOARD_PAGE","group":"","filename":"mod_k2_quickicons.j25"}', '{"modCSSStyling":"1","modLogo":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'K2 Stats (admin)', 'module', 'mod_k2_stats', '', 1, 1, 2, 0, '{"name":"K2 Stats (admin)","type":"module","creationDate":"August 4th, 2016","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.7.1","description":"K2_STATS_FOR_USE_IN_THE_K2_DASHBOARD_PAGE","group":"","filename":"mod_k2_stats.j25"}', '{"latestItems":"1","popularItems":"1","mostCommentedItems":"1","latestComments":"1","statistics":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'Chinese (China) language pack for K2', 'file', '_install', '', 0, 1, 0, 0, '{"name":"Chinese (China) language pack for K2","type":"file","creationDate":"October 29, 2013","author":"getk2.org","copyright":"Copyright (c) 2006 - 2011 JoomlaWorks Ltd. All rights reserved.","authorEmail":"nospam@getk2.org","authorUrl":"getk2.org","version":"2.5.0","description":"Chinese (China) language pack for K2","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'ryantemplate', 'template', 'template', '', 0, 1, 1, 0, '{"name":"ryantemplate","type":"template","creationDate":"14\\/9\\/2016","author":"Ryan Chow","copyright":"Copyright (C) 2016Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@nkuryan.top","authorUrl":"","version":"1.0","description":"This is a template made by ryan","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'T3 Framework', 'plugin', 't3', 'system', 0, 1, 1, 0, '{"name":"T3 Framework","type":"plugin","creationDate":"August 15, 2016","author":"JoomlArt.com","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"info@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.6.1","description":"\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2016 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":"","filename":"t3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 't3_blank', 'template', 't3_blank', '', 0, 1, 1, 0, '{"name":"t3_blank","type":"template","creationDate":"July 22 2016","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.2.3","description":"\\n\\t\\t\\n\\t\\t<div align=\\"center\\">\\n\\t\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t\\t\\t<p> <\\/p>\\n\\t\\t\\t\\t<span style=\\"color:#FF0000\\">Note: T3 blank requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2004 - 2015 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 't3_bs3_blank', 'template', 't3_bs3_blank', '', 0, 1, 1, 0, '{"name":"t3_bs3_blank","type":"template","creationDate":"July 22 2016","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.2.3","description":"\\n\\t\\t\\n\\t\\t<div align=\\"center\\">\\n\\t\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t\\t\\t<p> <\\/p>\\n\\t\\t\\t\\t<span style=\\"color:#FF0000\\">Note: T3 blank requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2004 - 2015 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'T3 Framework Package', 'package', 'pkg_t3', '', 0, 1, 1, 0, '{"name":"T3 Framework Package","type":"package","creationDate":"August 15, 2016","author":"t3-framework.org","copyright":"(C) 2012 - 2016. All rights reserved.","authorEmail":"support@t3-framework.org","authorUrl":"www.t3-framework.org","version":"2.6.1","description":"\\t\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2016 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":"","filename":"pkg_t3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'com_djimageslider', 'component', 'com_djimageslider', '', 1, 1, 0, 0, '{"name":"com_djimageslider","type":"component","creationDate":"May 2016","author":"DJ-Extensions.com","copyright":"Copyright (C) 2012 DJ-Extensions.com, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.1.2","description":"DJ-ImageSlider component","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'DJ-ImageSlider', 'module', 'mod_djimageslider', '', 0, 1, 0, 0, '{"name":"DJ-ImageSlider","type":"module","creationDate":"May 2016","author":"DJ-Extensions.com","copyright":"Copyright (C) 2013 DJ-Extensions.com, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.1.2","description":"DJ-ImageSlider Module","group":"","filename":"mod_djimageslider"}', '{"slider_source":"0","slider_type":"0","theme":"default","link_image":"1","image_folder":"images\\/sampledata\\/fruitshop","link":"","show_title":"1","show_desc":"1","show_readmore":"0","readmore_text":"","link_title":"1","link_desc":"0","limit_desc":"","full_width":"0","image_width":"240","image_height":"180","fit_to":"0","image_centering":"0","visible_images":"3","space_between_images":"10","max_images":"20","sort_by":"1","css3":"1","autoplay":"1","show_buttons":"1","show_arrows":"1","show_custom_nav":"0","wcag":"1","desc_width":"","desc_bottom":"0","desc_horizontal":"0","left_arrow":"","right_arrow":"","play_button":"","pause_button":"","arrows_top":"40","arrows_horizontal":"10","idx_style":"0","effect":"Expo","effect_type":"0","duration":"","delay":"","preload":"800","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'DJ-ImageSlider Package', 'package', 'pkg_dj-imageslider', '', 0, 1, 1, 0, '{"name":"DJ-ImageSlider Package","type":"package","creationDate":"May 2016","author":"DJ-Extensions.com","copyright":"Copyright (C) 2012 DJ-Extensions.com, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.1.2","description":"\\n\\t\\t<style type=\\"text\\/css\\">\\n\\t\\t\\t.djex-info { padding: 20px 30px 10px; margin: 0 0 20px 0; background: #ac00d4; color: #fff; border: 1px solid #81009f; font-family: Arial, Helvetica, sans-serif; font-size: 13px; font-weight: normal; -webkit-border-radius: 4px; border-radius: 4px; }\\n\\t\\t\\t.djex-title { text-transform: uppercase; font-weight: bold; font-size: 14px; }\\n\\t\\t\\t.djex-info a:link, .djex-info a:visited, .djex-info a:hover { color:#fff; text-decoration:underline; font-weight: 600; }\\t\\n\\t\\t\\t.djex-info img { float: left; margin: 0 30px 10px 0; }\\n\\t\\t<\\/style>\\n\\t\\t<div class=\\"djex-info\\">\\n\\t\\t\\t<a href=\\"index.php?option=com_djimageslider\\"><img src=\\"components\\/com_djimageslider\\/assets\\/ex_slider.png\\" \\/><\\/a>\\n\\t\\t\\t<p class=\\"djex-title\\">Thank you for installing DJ-ImageSlider!<\\/p>\\n\\t\\t\\t<p>The DJ-ImageSlider extension allows you to display slideshows containing slides with title and short description linked to any menu item, article or custom url address. \\n\\t\\t\\tIf you want to learn how to use DJ-ImageSlider please read <a target=\\"_blank\\" href=\\"http:\\/\\/dj-extensions.com\\/documentation\\">Documentation<\\/a> and <a target=\\"_blank\\" href=\\"http:\\/\\/dj-extensions.com\\/faq\\">FAQ section<\\/a><\\/p>\\n\\t\\t\\t<p>Check out our other extensions at <a target=\\"_blank\\" href=\\"http:\\/\\/dj-extensions.com\\">DJ-Extensions.com<\\/a><\\/p>\\n\\t\\t\\t<div style=\\"clear:both\\"><\\/div>\\n\\t\\t<\\/div>\\n\\t\\t","group":"","filename":"pkg_dj-imageslider"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'Simple Responsive Slideshow', 'module', 'mod_simple_responsive_slideshow', '', 0, 1, 0, 0, '{"name":"Simple Responsive Slideshow","type":"module","creationDate":"2013","author":"FavThemes","copyright":"Copyright (C) FavThemes. All rights reserved.","authorEmail":"","authorUrl":"http:\\/\\/www.favthemes.com","version":"2.4","description":"\\n\\t\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\"><strong>Simple Responsive Slideshow<\\/strong><\\/a> is a free responsive Joomla! module that let''s you upload up to 10 images to create a slideshow and customize each slide.\\n<br\\/>\\nFor more info, please see the <a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">demo and documentation<\\/a> for the Simple Responsive Slideshow module.\\n<br\\/><br\\/>\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\">\\n\\t<img src=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/img\\/simple-responsive-slideshow.jpg\\" alt=\\"Simple Reponsive Slideshow\\">\\n<\\/a>\\n\\n<br\\/><br\\/>\\nCopyright &#169; 2012-2016 <a href=\\"http:\\/\\/www.favthemes.com\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">FavThemes<\\/a>.\\n<br\\/><br\\/>\\n\\n<link rel=\\"stylesheet\\" href=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/css\\/admin.css\\" type=\\"text\\/css\\" \\/>\\n<link rel=\\"stylesheet\\" href=\\"\\/\\/maxcdn.bootstrapcdn.com\\/font-awesome\\/4.6.3\\/css\\/font-awesome.min.css\\" type=\\"text\\/css\\" \\/>\\n<script src=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/js\\/jscolor\\/jscolor.js\\" type=\\"text\\/javascript\\"><\\/script>\\n\\n\\t","group":"","filename":"mod_simple_responsive_slideshow"}', '{"jqueryLoad":"1","animation":"fade","slideDirection":"horizontal","slideshowSpeed":"7000","animationDuration":"600","flexsliderBgColor":"#ffffff","directionNav":"1","controlNav":"1","slideshow":"1","randomize":"0","animationLoop":"1","pauseOnAction":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","file1active":"1","file1":"media\\/simple-responsive-slideshow\\/demo\\/slide1.jpg","file2active":"1","file2":"media\\/simple-responsive-slideshow\\/demo\\/slide2.jpg","file3active":"1","file3":"media\\/simple-responsive-slideshow\\/demo\\/slide3.jpg","file4active":"1","file4":"media\\/simple-responsive-slideshow\\/demo\\/slide4.jpg","file5active":"1","file5":"media\\/simple-responsive-slideshow\\/demo\\/slide5.jpg","file6active":"0","file7active":"0","file8active":"0","file9active":"0","file10active":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'JE Camera Slideshow', 'module', 'mod_je_camera', '', 0, 1, 0, 0, '{"name":"JE Camera Slideshow","type":"module","creationDate":"February, 2015","author":"jExtensions.com","copyright":"Copyright 2015 - jExtensions.com","authorEmail":"support@jExtensions.com","authorUrl":"http:\\/\\/jExtensions.com","version":"3.4","description":"\\n\\t<h1 class=\\"sub-heading\\">JE Camera Slideshow<\\/h1>\\n\\t<div class=\\"description\\">Download more free extensions from <a href=\\"http:\\/\\/jextensions.com\\/\\" target=\\"_blank\\">jExtensions.com<\\/a><br\\/>\\n\\tNeed help? <a href=\\"http:\\/\\/jextensions.com\\/camera-jquery-slideshow-joomla\\/\\" target=\\"_blank\\">Click here to visit the support page<\\/a>.<br\\/>\\n\\t<span class=\\"credits\\">Credits: <a href=\\"http:\\/\\/www.pixedelic.com\\/plugins\\/camera\\/\\" target=\\"_blank\\" >Camera<\\/a><\\/span>\\n\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"mod_je_camera"}', '{"jQuery":"1","imgHeight":"400","alignment":"center","autoPlay":"true","cameraSkin":"black","fx":"random","slideOn":"true","cols":"6","rows":"4","slicedCols":"12","slicedRows":"8","easing":"easeInOutExpo","caption":"fadeFromBottom","time":"7000","transPeriod":"1500","pagination":"true","navigation":"true","navigationHover":"true","playPause":"true","pauseOnClick":"true","hover":"true","loader":"pie","loaderColor":"#eeeeee","loaderBgColor":"#222222","pieDiameter":"38","piePosition":"rightTop","barPosition":"bottom","barDirection":"leftToRight","thumbnails":"true","thumbWidth":"100","thumbHeight":"100","thumbQuality":"100","thumbAlign":"t","Text1":"","Text2":"","Text3":"","Text4":"","Text5":"","Text6":"","Text7":"","Text8":"","Text9":"","Text10":"","Text11":"","Text12":"","Text13":"","Text14":"","Text15":"","Text16":"","Text17":"","Text18":"","Text19":"","Text20":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 'Oukan Baidu Map', 'module', 'mod_oukan_baidumap', '', 0, 1, 0, 0, '{"name":"Oukan Baidu Map","type":"module","creationDate":"2014-05-20","author":"Oukan","copyright":"Copyright (C) 2014  Open Source Matters. All rights reserved.","authorEmail":"oukan@126.com","authorUrl":"http:\\/\\/www.oukan.net","version":"1.0","description":"\\u767e\\u5ea6\\u5730\\u56fe\\u6a21\\u5757\\uff0c\\u8bf7\\u5230 http:\\/\\/api.map.baidu.com\\/lbsapi\\/creatmap\\/index.html \\u83b7\\u53d6\\u5730\\u56fe\\u7684\\u5750\\u6807,\\u8bbf\\u95ee","group":"","filename":"mod_oukan_baidumap"}', '{"classname":"","x":"116.349396","y":"39.985147","level":"18","title":"","width":"697px","height":"500px"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10028, '百度地图模块', 'module', 'mod_baidumap', '', 0, 1, 0, 0, '{"name":"\\u767e\\u5ea6\\u5730\\u56fe\\u6a21\\u5757","type":"module","creationDate":"2015-01-09","author":"\\u9648\\u661f","copyright":"Copyright (C) 2005 - 2014 \\u9648\\u661f. All rights reserved.","authorEmail":"569977161@qq.com","authorUrl":"www.xingzai.org","version":"1.0.2","description":"\\n\\t\\u661f\\u4ed4\\u7801\\u5934\\u767e\\u5ea6\\u5730\\u56fe\\u6a21\\u5757\\uff0c\\u652f\\u6301\\u591a\\u70b9\\u6807\\u6ce8\\u3002\\n\\t \\n\\t <p><a href=\\"http:\\/\\/api.map.baidu.com\\/lbsapi\\/getpoint\\/index.html\\" target=\\"new\\" class=\\"btn btn-success\\" title=\\"\\u767e\\u5ea6\\u5750\\u6807\\u62fe\\u53d6\\u7cfb\\u7edf\\">\\u5982\\u4f55\\u83b7\\u53d6\\u6807\\u8bb0\\u70b9\\u7684\\u5750\\u6807\\uff1f<\\/a> <a href=\\"http:\\/\\/www.xingzai.org\\/extensions\\/baidu-map-module-for-joomla.html\\" target=\\"new\\" class=\\"btn btn-info\\" title=\\"\\u5730\\u56fe\\u6a21\\u5757\\u4f7f\\u7528\\u8bf4\\u660e\\">\\u90fd\\u6709\\u4ec0\\u4e48\\u6837\\u7684\\u56fe\\u6807\\u554a\\uff1f<\\/a><\\/p>\\n\\t <p>\\u66f4\\u591aJoomla\\u6269\\u5c55\\u548c\\u6559\\u7a0b\\u8bf7\\u8bbf\\u95ee\\uff1a<a href=\\"http:\\/\\/www.xingzai.org\\" target=\\"new\\">\\u661f\\u4ed4\\u7801\\u5934<\\/a><\\/p>\\n\\t  \\n\\t","group":"","filename":"mod_baidumap"}', '{"point_c":"116.403874,39.914889","level":"16","width":"100%","height":"300px","map_zoom":"1","zoom_style":"LARGE","zoom_position":"TOP_LEFT","thumb":"1","thumb_status":"1","thumb_position":"BOTTOM_RIGHT","scale":"1","scale_unit":"0","scale_position":"BOTTOM_LEFT","mouse":"1","keyboard":"1","drag":"1","double":"1","marker_icon":"21","point_marker":"","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_filters`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `o2kj3_finder_links`
--

INSERT INTO `o2kj3_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(3, 'index.php?option=com_k2&view=item&id=10', 'index.php?option=com_k2&view=item&id=10:2016-11-12-01-31-52&Itemid=115', '信息前沿】第十讲预告', ' 第十讲题目 ：计算机的未来 课程简介 ： 随着人工智能的发展 , 摩尔定律走到了尽头 , 新的计算模式和计算技术正在发展 , 本课程将会介绍计算技术的发展走向和新的计算技术方向。 IBM 讲师： 苏中 个人简介 : 苏中是 IBM 中国研究院的研究总监，大数据及认知计算研究方向首席科学家。在 2002 年获得清华大学计算机系博士学位后加入 IBM 。在中国研究院先后参与了文本分析、企业搜索、元数据管理、数据集成、社会化计算及信息可视化等方面的研究。他所领导的多项技术研发被 IBM 软件产品采用，并在国际', '2016-11-12 09:33:41', 'f7744139cd4d2fe0a82454208fa1080a', 1, 1, 1, '*', '2016-11-12 01:29:54', '0000-00-00 00:00:00', '2016-11-12 01:29:54', '0000-00-00 00:00:00', 0, 0, 6, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31393a7b733a31313a22002a00656c656d656e7473223b613a32373a7b733a323a226964223b733a323a223130223b733a353a22616c696173223b733a31393a22323031362d31312d31322d30312d33312d3532223b733a373a2273756d6d617279223b733a383137363a223c7020636c6173733d224d736f4e6f726d616c22207374796c653d226c696e652d6865696768743a20313530253b20776f72642d627265616b3a20627265616b2d616c6c3b2220616c69676e3d226c656674223e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee7acace58d81e8aeb2e9a298e79bae3c2f7370616e3e203c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223eefbc9ae8aea1e7ae97e69cbae79a84e69caae69da53c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c22207374796c653d226c696e652d6865696768743a20313530253b20776f72642d627265616b3a20627265616b2d616c6c3b2220616c69676e3d226c656674223e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223ec2a03c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c2220616c69676e3d226c656674223e3c623e3c7370616e206c616e673d2241522d534122207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b206d736f2d666172656173742d6c616e67756167653a2041522d53413b223ee8afbee7a88be7ae80e4bb8b3c2f7370616e3e3c2f623e3c623e3c7370616e207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b223eefbc9a3c2f7370616e3e3c2f623e3c7370616e207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b223ee99a8fe79d80e4babae5b7a5e699bae883bde79a84e58f91e5b1953c7370616e206c616e673d22454e2d5553223e2c3c2f7370616e3ee691a9e5b094e5ae9ae5be8be8b5b0e588b0e4ba86e5b0bde5a4b43c7370616e206c616e673d22454e2d5553223e2c3c2f7370616e3ee696b0e79a84e8aea1e7ae97e6a8a1e5bc8fe5928ce8aea1e7ae97e68a80e69cafe6ada3e59ca8e58f91e5b1953c7370616e206c616e673d22454e2d5553223e2c3c2f7370616e3ee69cace8afbee7a88be5b086e4bc9ae4bb8be7bb8de8aea1e7ae97e68a80e69cafe79a84e58f91e5b195e8b5b0e59091e5928ce696b0e79a84e8aea1e7ae97e68a80e69cafe696b9e59091e380823c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c2220616c69676e3d226c656674223e3c623e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b223e49424d3c2f7370616e3e3c2f623e3c623e3c7370616e207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b223ee8aeb2e5b888efbc9a3c2f7370616e3e3c2f623e3c7370616e207374796c653d22666f6e742d73697a653a203970743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee88b8fe4b8ad3c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c223e3c623e3c7370616e207374796c653d22666f6e742d73697a653a20392e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a202754696d6573204e657720526f6d616e273b206d736f2d666f6e742d6b65726e696e673a202e3570743b223ee4b8aae4babae7ae80e4bb8b3c7370616e206c616e673d22454e2d5553223e3a3c2f7370616e3e3c2f7370616e3e3c2f623e203c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee88b8fe4b8ade698af3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee4b8ade59bbde7a094e7a9b6e999a2e79a84e7a094e7a9b6e680bbe79b91efbc8ce5a4a7e695b0e68daee58f8ae8aea4e79fa5e8aea1e7ae97e7a094e7a9b6e696b9e59091e9a696e5b8ade7a791e5ada6e5aeb6e38082e59ca83c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e323030323c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee5b9b4e88eb7e5be97e6b885e58d8ee5a4a7e5ada6e8aea1e7ae97e69cbae7b3bbe58d9ae5a3abe5ada6e4bd8de5908ee58aa0e585a53c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee38082e59ca8e4b8ade59bbde7a094e7a9b6e999a2e58588e5908ee58f82e4b88ee4ba86e69687e69cace58886e69e90e38081e4bc81e4b89ae6909ce7b4a2e38081e58583e695b0e68daee7aea1e79086e38081e695b0e68daee99b86e68890e38081e7a4bee4bc9ae58c96e8aea1e7ae97e58f8ae4bfa1e681afe58fafe8a786e58c96e7ad89e696b9e99da2e79a84e7a094e7a9b6e38082e4bb96e68980e9a286e5afbce79a84e5a49ae9a1b9e68a80e69cafe7a094e58f91e8a2ab3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee8bdafe4bbb6e4baa7e59381e98787e794a8efbc8ce5b9b6e59ca8e59bbde99985e4bba5e58f8ae59bbde58685e79a84e5a49ae6aca1e68a80e69cafe8af84e4bcb0e4b8ade5be97e588b0e7acace4b880e5908defbc8ce4b99fe59ba0e6ada4e695b0e6aca1e88eb7e5be973c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee585a8e79083e7a094e7a9b6e68a80e69cafe68890e5b0b1e5a596efbc8ce59ca83c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e323030383c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223eefbc8c3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e323031303c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee4bba5e58f8a3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e323031343c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee5b9b4e88eb7e5be973c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee585a8e79083e7a094e7a9b6e69db0e587bae68a80e69cafe68890e5b0b1e5a596e38082e88b8fe4b8ade59ca83c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e323030373c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee5b9b4e8a2abe8af84e4b8ba3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee58f91e6988ee5a4a7e5b888efbc8ce68b85e4bbbbe7a094e7a9b6e999a2e4b893e588a9e8af84e5aea1e5a794e59198e4bc9ae4b8bbe5b8ade38082e8bf84e4bb8ae4b8bae6ada2e5b7b2e7bb8fe59ca8e59bbde99985e9a1b6e7baa7e4bc9ae8aeaee58f8ae69c9fe5888ae58f91e8a1a8e5ada6e69cafe8aebae696873c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e36303c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee4bd99e7af87efbc8c3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e35303c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee4bd99e9a1b9e58f91e6988ee4b893e588a9e58f8ae4b893e588a9e794b3e8afb7e38082e4bb96e79baee5898de585bce4bbbbe58d97e5bc80e5a4a7e5ada6e585bce8818ce69599e68e88efbc8ce4b88ae6b5b7e4baa4e9809ae5a4a7e5ada63c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e415045583c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee5ae9ee9aa8ce5aea4e5aea2e5baa7e69599e68e88efbc8c3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20417269616c2c2073616e732d73657269663b223e49424d3c2f7370616e3e3c7370616e207374796c653d22666f6e742d73697a653a20313070743b20666f6e742d66616d696c793a20e5ae8be4bd933b223ee5a4a7e4b8ade58d8ee58cbae68a80e69cafe4b893e5aeb6e5a794e59198e4bc9ae4b8bbe5b8ade380823c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c2220616c69676e3d226c656674223e3c7370616e206c616e673d22454e2d555322207374796c653d22666f6e742d73697a653a2031322e3070743b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d626964692d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223ec2a03c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c22207374796c653d226c696e652d6865696768743a20313530253b20776f72642d627265616b3a20627265616b2d616c6c3b2220616c69676e3d226c656674223e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223ec2a03c2f7370616e3e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee697b6e997b4efbc9a3c2f7370616e3e203c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee591a8e59b9befbc883c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223e31313c2f7370616e3e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee69c883c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223e31373c2f7370616e3e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee697a5efbc893c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223e31383a33302d32303a30303c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c22207374796c653d226c696e652d6865696768743a20313530253b20776f72642d627265616b3a20627265616b2d616c6c3b2220616c69676e3d226c656674223e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223ec2a03c2f7370616e3e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee59cb0e782b9efbc9a3c2f7370616e3e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223e2035423330333c2f7370616e3e3c2f703e0d0a3c7020636c6173733d224d736f4e6f726d616c22207374796c653d226c696e652d6865696768743a20313530253b20776f72642d627265616b3a20627265616b2d616c6c3b2220616c69676e3d226c656674223e3c7370616e206c616e673d22454e2d555322207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a2027417269616c272c2773616e732d7365726966273b206d736f2d666172656173742d666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d666f6e742d6b65726e696e673a203070743b223ec2a03c2f7370616e3e3c7370616e207374796c653d226d736f2d626964692d666f6e742d73697a653a2031302e3570743b206c696e652d6865696768743a20313530253b20666f6e742d66616d696c793a20e5ae8be4bd933b206d736f2d61736369692d666f6e742d66616d696c793a20417269616c3b206d736f2d68616e73692d666f6e742d66616d696c793a20417269616c3b206d736f2d626964692d666f6e742d66616d696c793a20417269616c3b206d736f2d666f6e742d6b65726e696e673a203070743b223ee6aca2e8bf8ee5b9bfe5a4a7e5b888e7949fe58f82e4b88ee4baa4e6b581efbc81efbc813c2f7370616e3e3c753e3c2f753e3c2f703e223b733a343a22626f6479223b733a303a22223b733a353a226361746964223b733a313a2232223b733a31303a22637265617465645f6279223b733a333a22393737223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031362d31312d31322030313a33333a3339223b733a31313a226d6f6469666965645f6279223b733a333a22393737223b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a323a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a3135313a7b733a31303a22656e61626c655f637373223b733a313a2231223b733a31343a226a517565727948616e646c696e67223b733a393a22312e3872656d6f7465223b733a32313a226261636b656e644a517565727948616e646c696e67223b733a363a2272656d6f7465223b733a383a22757365724e616d65223b733a313a2231223b733a393a2275736572496d616765223b733a313a2231223b733a31353a22757365724465736372697074696f6e223b733a313a2231223b733a373a227573657255524c223b733a313a2231223b733a393a2275736572456d61696c223b733a313a2230223b733a31323a2275736572466565644c696e6b223b733a313a2231223b733a31323a22757365724665656449636f6e223b733a313a2231223b733a31333a22757365724974656d436f756e74223b733a323a223130223b733a31333a22757365724974656d5469746c65223b733a313a2231223b733a31393a22757365724974656d5469746c654c696e6b6564223b733a313a2231223b733a31393a22757365724974656d4461746543726561746564223b733a313a2231223b733a31333a22757365724974656d496d616765223b733a313a2231223b733a31373a22757365724974656d496e74726f54657874223b733a313a2231223b733a31363a22757365724974656d43617465676f7279223b733a313a2231223b733a31323a22757365724974656d54616773223b733a313a2231223b733a32323a22757365724974656d436f6d6d656e7473416e63686f72223b733a313a2231223b733a31363a22757365724974656d526561644d6f7265223b733a313a2231223b733a31373a22757365724974656d4b32506c7567696e73223b733a313a2231223b733a31323a227461674974656d436f756e74223b733a323a223130223b733a31323a227461674974656d5469746c65223b733a313a2231223b733a31383a227461674974656d5469746c654c696e6b6564223b733a313a2231223b733a31383a227461674974656d4461746543726561746564223b733a313a2231223b733a31323a227461674974656d496d616765223b733a313a2231223b733a31363a227461674974656d496e74726f54657874223b733a313a2231223b733a31353a227461674974656d43617465676f7279223b733a313a2231223b733a31353a227461674974656d526561644d6f7265223b733a313a2231223b733a31383a227461674974656d45787472614669656c6473223b733a313a2230223b733a31313a227461674f72646572696e67223b733a303a22223b733a31313a22746167466565644c696e6b223b733a313a2231223b733a31313a227461674665656449636f6e223b733a313a2231223b733a31363a2267656e657269634974656d436f756e74223b733a323a223130223b733a31363a2267656e657269634974656d5469746c65223b733a313a2231223b733a32323a2267656e657269634974656d5469746c654c696e6b6564223b733a313a2231223b733a32323a2267656e657269634974656d4461746543726561746564223b733a313a2231223b733a31363a2267656e657269634974656d496d616765223b733a313a2231223b733a32303a2267656e657269634974656d496e74726f54657874223b733a313a2231223b733a31393a2267656e657269634974656d43617465676f7279223b733a313a2231223b733a31393a2267656e657269634974656d526561644d6f7265223b733a313a2231223b733a32323a2267656e657269634974656d45787472614669656c6473223b733a313a2230223b733a31353a2267656e65726963466565644c696e6b223b733a313a2231223b733a31353a2267656e657269634665656449636f6e223b733a313a2231223b733a393a22666565644c696d6974223b733a323a223130223b733a31333a22666565644974656d496d616765223b733a313a2231223b733a31313a2266656564496d6753697a65223b733a313a2253223b733a31373a22666565644974656d496e74726f54657874223b733a313a2231223b733a31373a226665656454657874576f72644c696d6974223b733a303a22223b733a31363a22666565644974656d46756c6c54657874223b733a313a2231223b733a31323a22666565644974656d54616773223b733a313a2230223b733a31333a22666565644974656d566964656f223b733a313a2230223b733a31353a22666565644974656d47616c6c657279223b733a313a2230223b733a31393a22666565644974656d4174746163686d656e7473223b733a313a2230223b733a31343a2266656564426f677573456d61696c223b733a303a22223b733a31363a22696e74726f54657874436c65616e7570223b733a313a2230223b733a32373a22696e74726f54657874436c65616e75704578636c75646554616773223b733a303a22223b733a32333a22696e74726f54657874436c65616e757054616741747472223b733a303a22223b733a31353a2266756c6c54657874436c65616e7570223b733a313a2230223b733a32363a2266756c6c54657874436c65616e75704578636c75646554616773223b733a303a22223b733a32323a2266756c6c54657874436c65616e757054616741747472223b733a303a22223b733a31323a2278737346696c746572696e67223b733a313a2230223b733a31343a226c696e6b506f7075705769647468223b733a333a22393030223b733a31353a226c696e6b506f707570486569676874223b733a333a22363030223b733a31333a22696d616765735175616c697479223b733a333a22313030223b733a31313a226974656d496d6167655853223b733a333a22313030223b733a31303a226974656d496d61676553223b733a333a22323030223b733a31303a226974656d496d6167654d223b733a333a22343030223b733a31303a226974656d496d6167654c223b733a333a22363030223b733a31313a226974656d496d616765584c223b733a333a22393030223b733a31363a226974656d496d61676547656e65726963223b733a333a22333030223b733a31333a22636174496d6167655769647468223b733a333a22313030223b733a31353a22636174496d61676544656661756c74223b733a313a2231223b733a31343a2275736572496d6167655769647468223b733a333a22313030223b733a31363a2275736572496d61676544656661756c74223b733a313a2231223b733a31373a22636f6d6d656e746572496d675769647468223b733a323a223438223b733a31373a226f6e6c696e65496d616765456469746f72223b733a393a2273756d6f7061696e74223b733a31343a22696d61676554696d657374616d70223b733a313a2230223b733a31363a22696d6167654d656d6f72794c696d6974223b733a303a22223b733a31363a22736f6369616c427574746f6e436f6465223b733a3731343a223c64697620636c6173733d226273686172652d637573746f6d223e3c61207469746c653d22e58886e4baabe588b05151e7a9bae997b42220636c6173733d226273686172652d717a6f6e65223e3c2f613e3c61207469746c653d22e58886e4baabe588b0e696b0e6b5aae5beaee58d9a2220636c6173733d226273686172652d73696e616d696e69626c6f67223e3c2f613e3c61207469746c653d22e58886e4baabe588b0e4babae4babae7bd912220636c6173733d226273686172652d72656e72656e223e3c2f613e3c61207469746c653d22e58886e4baabe588b0e885bee8aeafe5beaee58d9a2220636c6173733d226273686172652d71716d62223e3c2f613e3c61207469746c653d22e58886e4baabe588b0e7bd91e69893e5beaee58d9a2220636c6173733d226273686172652d6e6574656173656d62223e3c2f613e3c61207469746c653d22e69bb4e5a49ae5b9b3e58fb02220636c6173733d226273686172652d6d6f7265206273686172652d6d6f72652d69636f6e206d6f72652d7374796c652d61646474686973223e3c2f613e3c7370616e20636c6173733d224253484152455f434f554e54206273686172652d73686172652d636f756e74223e303c2f7370616e3e3c2f6469763e3c73637269707420747970653d22746578742f6a6176617363726970742220636861727365743d227574662d3822207372633d22687474703a2f2f7374617469632e6273686172652e636e2f622f627574746f6e4c6974652e6a73237374796c653d2d3126616d703b757569643d26616d703b706f7068636f6c3d3226616d703b6c616e673d7a68223e3c2f7363726970743e3c73637269707420747970653d22746578742f6a6176617363726970742220636861727365743d227574662d3822207372633d22687474703a2f2f7374617469632e6273686172652e636e2f622f62736861726543302e6a73223e3c2f7363726970743e0d0a223b733a31353a2274776974746572557365726e616d65223b733a353a2261646d696e223b733a31363a2266616365626f6f6b4d65746174616773223b733a313a2231223b733a31333a2266616365626f6f6b496d616765223b733a363a224d656469756d223b733a383a22636f6d6d656e7473223b733a313a2231223b733a31363a22636f6d6d656e74734f72646572696e67223b733a343a2244455343223b733a31333a22636f6d6d656e74734c696d6974223b733a323a223130223b733a32303a22636f6d6d656e7473466f726d506f736974696f6e223b733a353a2262656c6f77223b733a31383a22636f6d6d656e74735075626c697368696e67223b733a313a2230223b733a31373a22636f6d6d656e74735265706f7274696e67223b733a313a2232223b733a32333a22636f6d6d656e74735265706f7274526563697069656e74223b733a303a22223b733a32343a22696e6c696e65436f6d6d656e74734d6f6465726174696f6e223b733a313a2230223b733a383a226772617661746172223b733a313a2231223b733a383a22616e74697370616d223b733a313a2230223b733a32323a22726563617074636861466f7252656769737465726564223b733a313a2231223b733a32303a22616b69736d6574466f7252656769737465726564223b733a313a2231223b733a31373a22636f6d6d656e7473466f726d4e6f746573223b733a313a2231223b733a32313a22636f6d6d656e7473466f726d4e6f74657354657874223b733a303a22223b733a31353a2266726f6e74656e6445646974696e67223b733a313a2231223b733a31323a2273686f77496d616765546162223b733a313a2231223b733a31393a2273686f77496d61676547616c6c657279546162223b733a313a2231223b733a31323a2273686f77566964656f546162223b733a313a2231223b733a31383a2273686f7745787472614669656c6473546162223b733a313a2231223b733a31383a2273686f774174746163686d656e7473546162223b733a313a2231223b733a31333a2273686f774b32506c7567696e73223b733a313a2231223b733a32323a2273696465426172446973706c617946726f6e74656e64223b733a313a2230223b733a31323a226d65726765456469746f7273223b733a313a2231223b733a31343a2273696465426172446973706c6179223b733a313a2231223b733a31373a226174746163686d656e7473466f6c646572223b733a303a22223b733a31363a2268696465496d706f7274427574746f6e223b733a313a2230223b733a31323a22676f6f676c65536561726368223b733a313a2230223b733a32313a22676f6f676c65536561726368436f6e7461696e6572223b733a32333a226b32476f6f676c65536561726368436f6e7461696e6572223b733a31333a224b325573657250726f66696c65223b733a313a2231223b733a383a227265646972656374223b733a333a22313031223b733a31313a2261646d696e536561726368223b733a363a2273696d706c65223b733a31323a22636f6f6b6965446f6d61696e223b733a303a22223b733a31363a2267617468657253746174697374696373223b733a313a2231223b733a31333a2274616767696e6753797374656d223b733a313a2231223b733a383a226c6f636b54616773223b733a313a2230223b733a31333a2273686f7754616746696c746572223b733a313a2230223b733a393a226b325461674e6f726d223b733a313a2230223b733a31333a226b325461674e6f726d43617365223b733a353a226c6f776572223b733a33313a226b325461674e6f726d4164646974696f6e616c5265706c6163656d656e7473223b733a303a22223b733a32303a227265636170746368615f7075626c69635f6b6579223b733a303a22223b733a32313a227265636170746368615f707269766174655f6b6579223b733a353a2261646d696e223b733a31353a227265636170746368615f7468656d65223b733a353a22636c65616e223b733a31313a227265636170746368615632223b733a313a2231223b733a32333a227265636170746368614f6e526567697374726174696f6e223b733a313a2230223b733a31333a22616b69736d65744170694b6579223b733a303a22223b733a31333a2273746f70466f72756d5370616d223b733a313a2230223b733a31393a2273746f70466f72756d5370616d4170694b6579223b733a303a22223b733a31383a2270726f66696c6550616765446973706c6179223b733a313a2230223b733a32313a2273686f774974656d73436f756e74657241646d696e223b733a313a2231223b733a31373a2273686f774368696c644361744974656d73223b733a313a2231223b733a32323a2264697361626c65436f6d706163744f72646572696e67223b733a313a2230223b733a31333a226d657461446573634c696d6974223b733a333a22313530223b733a32323a22656e666f7263655345465265706c6163656d656e7473223b733a313a2230223b733a31353a225345465265706c6163656d656e7473223b733a323736383a22c3807c412c20c3817c412c20c3827c412c20c3837c412c20c3847c412c20c3857c412c20c3a07c612c20c3a17c612c20c3a27c612c20c3a37c612c20c3a47c612c20c3a57c612c20c4807c412c20c4817c612c20c4827c412c20c4837c612c20c4847c412c20c4857c612c20c3877c432c20c3a77c632c20c4867c432c20c4877c632c20c4887c432c20c4897c632c20c48a7c432c20c48b7c632c20c48c7c432c20c48d7c632c20c3907c442c20c3b07c642c20c48e7c442c20c48f7c642c20c4907c442c20c4917c642c20c3887c452c20c3897c452c20c38a7c452c20c38b7c452c20c3a87c652c20c3a97c652c20c3aa7c652c20c3ab7c652c20c4927c452c20c4937c652c20c4947c452c20c4957c652c20c4967c452c20c4977c652c20c4987c452c20c4997c652c20c49a7c452c20c49b7c652c20c49c7c472c20c49d7c672c20c49e7c472c20c49f7c672c20c4a07c472c20c4a17c672c20c4a27c472c20c4a37c672c20c4a47c482c20c4a57c682c20c4a67c482c20c4a77c682c20c38c7c492c20c38d7c492c20c38e7c492c20c38f7c492c20c3ac7c692c20c3ad7c692c20c3ae7c692c20c3af7c692c20c4a87c492c20c4a97c692c20c4aa7c492c20c4ab7c692c20c4ac7c492c20c4ad7c692c20c4ae7c492c20c4af7c692c20c4b07c492c20c4b17c692c20c4b47c4a2c20c4b57c6a2c20c4b67c4b2c20c4b77c6b2c20c4b87c6b2c20c4b97c4c2c20c4ba7c6c2c20c4bb7c4c2c20c4bc7c6c2c20c4bd7c4c2c20c4be7c6c2c20c4bf7c4c2c20c5807c6c2c20c5817c4c2c20c5827c6c2c20c3917c4e2c20c3b17c6e2c20c5837c4e2c20c5847c6e2c20c5857c4e2c20c5867c6e2c20c5877c4e2c20c5887c6e2c20c5897c6e2c20c58a7c4e2c20c58b7c6e2c20c3927c4f2c20c3937c4f2c20c3947c4f2c20c3957c4f2c20c3967c4f2c20c3987c4f2c20c3b27c6f2c20c3b37c6f2c20c3b47c6f2c20c3b57c6f2c20c3b67c6f2c20c3b87c6f2c20c58c7c4f2c20c58d7c6f2c20c58e7c4f2c20c58f7c6f2c20c5907c4f2c20c5917c6f2c20c5947c522c20c5957c722c20c5967c522c20c5977c722c20c5987c522c20c5997c722c20c59a7c532c20c59b7c732c20c59c7c532c20c59d7c732c20c59e7c532c20c59f7c732c20c5a07c532c20c5a17c732c20c5bf7c732c20c5a27c542c20c5a37c742c20c5a47c542c20c5a57c742c20c5a67c542c20c5a77c742c20c3997c552c20c39a7c552c20c39b7c552c20c39c7c552c20c3b97c752c20c3ba7c752c20c3bb7c752c20c3bc7c752c20c5a87c552c20c5a97c752c20c5aa7c552c20c5ab7c752c20c5ac7c552c20c5ad7c752c20c5ae7c552c20c5af7c752c20c5b07c552c20c5b17c752c20c5b27c552c20c5b37c752c20c5b47c572c20c5b57c772c20c39d7c592c20c3bd7c792c20c3bf7c792c20c5b67c592c20c5b77c792c20c5b87c592c20c5b97c5a2c20c5ba7c7a2c20c5bb7c5a2c20c5bc7c7a2c20c5bd7c5a2c20c5be7c7a2c20ceb17c612c20ceb27c622c20ceb37c672c20ceb47c642c20ceb57c652c20ceb67c7a2c20ceb77c682c20ceb87c74682c20ceb97c692c20ceba7c6b2c20cebb7c6c2c20cebc7c6d2c20cebd7c6e2c20cebe7c782c20cebf7c6f2c20cf807c702c20cf817c722c20cf837c732c20cf847c742c20cf857c792c20cf867c662c20cf877c63682c20cf887c70732c20cf897c772c20ce917c412c20ce927c422c20ce937c472c20ce947c442c20ce957c452c20ce967c5a2c20ce977c482c20ce987c54682c20ce997c492c20ce9a7c4b2c20ce9b7c4c2c20ce9c7c4d2c20ce9e7c582c20ce9f7c4f2c20cea07c502c20cea17c522c20cea37c532c20cea47c542c20cea57c592c20cea67c462c20cea77c43682c20cea87c50732c20cea97c572c20ceac7c612c20cead7c652c20ceae7c682c20ceaf7c692c20cf8c7c6f2c20cf8d7c792c20cf8e7c772c20ce867c412c20ce887c452c20ce897c482c20ce8a7c492c20ce8c7c4f2c20ce8e7c592c20ce8f7c572c20cf8a7c692c20ce907c692c20cf8b7c792c20cf827c732c20d0907c412c20d3907c412c20d3927c412c20d3987c452c20d39a7c452c20d3947c452c20d0917c422c20d0927c562c20d0937c472c20d2907c472c20d0837c472c20d2927c472c20d3b67c472c20797c592c20d0947c442c20d0957c452c20d0807c452c20d0817c594f2c20d3967c452c20d2bc7c452c20d2be7c452c20d0847c59452c20d0967c5a482c20d3817c445a482c20d2967c5a482c20d39c7c445a482c20d0977c5a2c20d2987c5a2c20d39e7c445a2c20d3a07c445a2c20d0857c445a2c20d0987c492c20d08d7c492c20d3a47c492c20d3a27c492c20d0867c492c20d0877c4a492c20d3807c492c20d0997c592c20d28a7c592c20d0887c4a2c20d09a7c4b2c20d29a7c512c20d29e7c512c20d2a07c4b2c20d3837c512c20d29c7c4b2c20d09b7c4c2c20d3857c4c2c20d0897c4c2c20d09c7c4d2c20d38d7c4d2c20d09d7c4e2c20d3897c4e2c20d2a27c4e2c20d3877c4e2c20d2a47c4e2c20d08a7c4e2c20d09e7c4f2c20d3a67c4f2c20d3a87c4f2c20d3aa7c4f2c20d2a87c4f2c20d09f7c502c20d2a67c50462c20d0a07c502c20d28e7c502c20d0a17c532c20d2aa7c532c20d0a27c542c20d2ac7c54482c20d08b7c542c20d08c7c4b2c20d0a37c552c20d08e7c552c20d3b27c552c20d3b07c552c20d3ae7c552c20d2ae7c552c20d2b07c552c20d0a47c462c20d0a57c482c20d2b27c482c20d2ba7c482c20d0a67c54532c20d2b47c54532c20d0a77c43482c20d3b47c43482c20d2b67c43482c20d38b7c43482c20d2b87c43482c20d08f7c445a2c20d0a87c53482c20d0a97c5348542c20d0aa7c412c20d0ab7c592c20d3b87c592c20d0ac7c592c20d28c7c592c20d0ad7c452c20d3ac7c452c20d0ae7c59552c20d0af7c59412c20d0b07c612c20d3917c612c20d3937c612c20d3997c652c20d39b7c652c20d3957c652c20d0b17c622c20d0b27c762c20d0b37c672c20d2917c672c20d1937c672c20d2937c672c20d3b77c672c20797c792c20d0b47c642c20d0b57c652c20d1907c652c20d1917c796f2c20d3977c652c20d2bd7c652c20d2bf7c652c20d1947c79652c20d0b67c7a682c20d3827c647a682c20d2977c7a682c20d39d7c647a682c20d0b77c7a2c20d2997c7a2c20d39f7c647a2c20d3a17c647a2c20d1957c647a2c20d0b87c692c20d19d7c692c20d3a57c692c20d3a37c692c20d1967c692c20d1977c6a692c20d3807c692c20d0b97c792c20d28b7c792c20d1987c6a2c20d0ba7c6b2c20d29b7c712c20d29f7c712c20d2a17c6b2c20d3847c712c20d29d7c6b2c20d0bb7c6c2c20d3867c6c2c20d1997c6c2c20d0bc7c6d2c20d38e7c6d2c20d0bd7c6e2c20d38a7c6e2c20d2a37c6e2c20d3887c6e2c20d2a57c6e2c20d19a7c6e2c20d0be7c6f2c20d3a77c6f2c20d3a97c6f2c20d3ab7c6f2c20d2a97c6f2c20d0bf7c702c20d2a77c70662c20d1807c702c20d28f7c702c20d1817c732c20d2ab7c732c20d1827c742c20d2ad7c74682c20d19b7c742c20d19c7c6b2c20d1837c752c20d19e7c752c20d3b37c752c20d3b17c752c20d3af7c752c20d2af7c752c20d2b17c752c20d1847c662c20d1857c682c20d2b37c682c20d2bb7c682c20d1867c74732c20d2b57c74732c20d1877c63682c20d3b57c63682c20d2b77c63682c20d38c7c63682c20d2b97c63682c20d19f7c647a2c20d1887c73682c20d1897c7368742c20d18a7c612c20d18b7c792c20d3b97c792c20d18c7c792c20d28d7c792c20d18d7c652c20d3ad7c652c20d18e7c79752c20d18f7c7961223b733a353a226b32536566223b733a313a2230223b733a31333a226b325365664c6162656c436174223b733a373a22636f6e74656e74223b733a31333a226b325365664c6162656c546167223b733a333a22746167223b733a31343a226b325365664c6162656c55736572223b733a363a22617574686f72223b733a31363a226b325365664c6162656c536561726368223b733a363a22736561726368223b733a31343a226b325365664c6162656c44617465223b733a343a2264617465223b733a31343a226b325365664c6162656c4974656d223b733a313a2230223b733a32363a226b325365664c6162656c4974656d437573746f6d507265666978223b733a303a22223b733a31373a226b32536566496e736572744974656d4964223b733a313a2231223b733a32343a226b325365664974656d49645469746c65416c696173536570223b733a343a2264617368223b733a32323a226b325365665573654974656d5469746c65416c696173223b733a313a2231223b733a31363a226b32536566496e736572744361744964223b733a313a2231223b733a32333a226b3253656643617449645469746c65416c696173536570223b733a343a2264617368223b733a32313a226b325365665573654361745469746c65416c696173223b733a313a2231223b7d733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a323a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a323a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d733a393a22736570617261746f72223b733a313a222e223b7d733a383a226f72646572696e67223b733a313a2239223b733a353a227472617368223b733a313a2230223b733a393a226361745f7472617368223b733a313a2230223b733a383a2263617465676f7279223b733a363a22e696b0e997bb223b733a393a226361745f7374617465223b733a313a2231223b733a31303a226361745f616363657373223b733a313a2231223b733a31393a2265787472615f6669656c64735f736561726368223b733a303a22223b733a31323a2265787472615f6669656c6473223b733a323a225b5d223b733a343a22736c7567223b733a32323a2231303a323031362d31312d31322d30312d33312d3532223b733a373a22636174736c7567223b733a363a22323a6e657773223b733a363a22617574686f72223b733a31303a2253757065722055736572223b733a363a226c61796f7574223b733a343a226974656d223b733a343a2270617468223b733a34373a22696e6465782e7068702f6e6577732d6c6973742f6974656d2f31302d323031362d31312d31322d30312d33312d3532223b733a31303a226d657461617574686f72223b4e3b7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a393a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b693a383b733a31393a2265787472615f6669656c64735f736561726368223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a353a7b733a343a2254797065223b613a313a7b733a373a224b32204974656d223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a224b32204974656d223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a363a22417574686f72223b613a313a7b733a31303a2253757065722055736572223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a2253757065722055736572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a31313a224b322043617465676f7279223b613a313a7b733a363a22e696b0e997bb223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a363a22e696b0e997bb223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a224c616e6775616765223b613a313a7b733a313a222a223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a31323a224578747261206669656c6473223b613a313a7b733a323a225b5d223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a323a225b5d223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a33393a22696e6465782e7068703f6f7074696f6e3d636f6d5f6b3226766965773d6974656d2669643d3130223b733a353a22726f757465223b733a37303a22696e6465782e7068703f6f7074696f6e3d636f6d5f6b3226766965773d6974656d2669643d31303a323031362d31312d31322d30312d33312d3532264974656d69643d313135223b733a353a227469746c65223b733a33303a22e4bfa1e681afe5898de6b2bfe38091e7acace58d81e8aeb2e9a284e5918a223b733a31313a226465736372697074696f6e223b733a313331363a2220e7acace58d81e8aeb2e9a298e79bae20efbc9ae8aea1e7ae97e69cbae79a84e69caae69da520e8afbee7a88be7ae80e4bb8b20efbc9a20e99a8fe79d80e4babae5b7a5e699bae883bde79a84e58f91e5b195202c20e691a9e5b094e5ae9ae5be8be8b5b0e588b0e4ba86e5b0bde5a4b4202c20e696b0e79a84e8aea1e7ae97e6a8a1e5bc8fe5928ce8aea1e7ae97e68a80e69cafe6ada3e59ca8e58f91e5b195202c20e69cace8afbee7a88be5b086e4bc9ae4bb8be7bb8de8aea1e7ae97e68a80e69cafe79a84e58f91e5b195e8b5b0e59091e5928ce696b0e79a84e8aea1e7ae97e68a80e69cafe696b9e59091e380822049424d20e8aeb2e5b888efbc9a20e88b8fe4b8ad20e4b8aae4babae7ae80e4bb8b203a20e88b8fe4b8ade698af2049424d20e4b8ade59bbde7a094e7a9b6e999a2e79a84e7a094e7a9b6e680bbe79b91efbc8ce5a4a7e695b0e68daee58f8ae8aea4e79fa5e8aea1e7ae97e7a094e7a9b6e696b9e59091e9a696e5b8ade7a791e5ada6e5aeb6e38082e59ca8203230303220e5b9b4e88eb7e5be97e6b885e58d8ee5a4a7e5ada6e8aea1e7ae97e69cbae7b3bbe58d9ae5a3abe5ada6e4bd8de5908ee58aa0e585a52049424d20e38082e59ca8e4b8ade59bbde7a094e7a9b6e999a2e58588e5908ee58f82e4b88ee4ba86e69687e69cace58886e69e90e38081e4bc81e4b89ae6909ce7b4a2e38081e58583e695b0e68daee7aea1e79086e38081e695b0e68daee99b86e68890e38081e7a4bee4bc9ae58c96e8aea1e7ae97e58f8ae4bfa1e681afe58fafe8a786e58c96e7ad89e696b9e99da2e79a84e7a094e7a9b6e38082e4bb96e68980e9a286e5afbce79a84e5a49ae9a1b9e68a80e69cafe7a094e58f91e8a2ab2049424d20e8bdafe4bbb6e4baa7e59381e98787e794a8efbc8ce5b9b6e59ca8e59bbde99985e4bba5e58f8ae59bbde58685e79a84e5a49ae6aca1e68a80e69cafe8af84e4bcb0e4b8ade5be97e588b0e7acace4b880e5908defbc8ce4b99fe59ba0e6ada4e695b0e6aca1e88eb7e5be972049424d20e585a8e79083e7a094e7a9b6e68a80e69cafe68890e5b0b1e5a596efbc8ce59ca8203230303820efbc8c203230313020e4bba5e58f8a203230313420e5b9b4e88eb7e5be972049424d20e585a8e79083e7a094e7a9b6e69db0e587bae68a80e69cafe68890e5b0b1e5a596e38082e88b8fe4b8ade59ca8203230303720e5b9b4e8a2abe8af84e4b8ba2049424d20e58f91e6988ee5a4a7e5b888efbc8ce68b85e4bbbbe7a094e7a9b6e999a2e4b893e588a9e8af84e5aea1e5a794e59198e4bc9ae4b8bbe5b8ade38082e8bf84e4bb8ae4b8bae6ada2e5b7b2e7bb8fe59ca8e59bbde99985e9a1b6e7baa7e4bc9ae8aeaee58f8ae69c9fe5888ae58f91e8a1a8e5ada6e69cafe8aebae6968720363020e4bd99e7af87efbc8c20353020e4bd99e9a1b9e58f91e6988ee4b893e588a9e58f8ae4b893e588a9e794b3e8afb7e38082e4bb96e79baee5898de585bce4bbbbe58d97e5bc80e5a4a7e5ada6e585bce8818ce69599e68e88efbc8ce4b88ae6b5b7e4baa4e9809ae5a4a7e5ada6204150455820e5ae9ee9aa8ce5aea4e5aea2e5baa7e69599e68e88efbc8c2049424d20e5a4a7e4b8ade58d8ee58cbae68a80e69cafe4b893e5aeb6e5a794e59198e4bc9ae4b8bbe5b8ade3808220e697b6e997b4efbc9a20e591a8e59b9befbc8820313120e69c8820313720e697a5efbc892031383a33302d32303a303020e59cb0e782b9efbc9a20354233303320e6aca2e8bf8ee5b9bfe5a4a7e5b888e7949fe58f82e4b88ee4baa4e6b581efbc81efbc8120223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b693a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031362d31312d31322030313a32393a3534223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22323031362d31312d31322030313a32393a3534223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a363b733a31353a2264656661756c744c616e6775616765223b733a353a227a682d434e223b7d);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms0`
--

INSERT INTO `o2kj3_finder_links_terms0` (`link_id`, `term_id`, `weight`) VALUES
(3, 577, 0.18669),
(3, 578, 0.98),
(3, 579, 1.07331),
(3, 580, 0.23331),
(3, 581, 1.07331),
(3, 582, 1.19),
(3, 615, 0.46669),
(3, 616, 1.05),
(3, 617, 1.16669),
(3, 618, 0.79992),
(3, 619, 3.19992),
(3, 639, 0.09331),
(3, 640, 0.86331),
(3, 641, 0.95669),
(3, 700, 0.65331),
(3, 701, 1.4),
(3, 702, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms1`
--

INSERT INTO `o2kj3_finder_links_terms1` (`link_id`, `term_id`, `weight`) VALUES
(3, 574, 0.14),
(3, 575, 0.81669),
(3, 576, 0.88669),
(3, 656, 0.42),
(3, 657, 0.95669),
(3, 658, 1.07331),
(3, 659, 0.51331),
(3, 660, 1.05),
(3, 673, 0.09331),
(3, 674, 0.88669),
(3, 675, 1.14331),
(3, 685, 0.32669),
(3, 686, 0.95669),
(3, 687, 1.28331);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms2`
--

INSERT INTO `o2kj3_finder_links_terms2` (`link_id`, `term_id`, `weight`) VALUES
(3, 665, 0.09338),
(3, 666, 0.84),
(3, 667, 1.28331),
(3, 668, 0.84),
(3, 669, 0.95669),
(3, 670, 0.7),
(3, 671, 1.16669),
(3, 672, 1.30669),
(3, 682, 0.09331),
(3, 683, 1.14331),
(3, 684, 1.23669);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms3`
--

INSERT INTO `o2kj3_finder_links_terms3` (`link_id`, `term_id`, `weight`) VALUES
(3, 512, 0.7),
(3, 513, 1.4),
(3, 514, 1.4),
(3, 713, 0.04669),
(3, 714, 0.79331),
(3, 715, 0.93331),
(3, 725, 0.7),
(3, 726, 1.4),
(3, 727, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms4`
--

INSERT INTO `o2kj3_finder_links_terms4` (`link_id`, `term_id`, `weight`) VALUES
(3, 688, 0.14),
(3, 689, 0.86331),
(3, 690, 1.14331),
(3, 691, 0.7),
(3, 692, 1.21331),
(3, 693, 1.4),
(3, 694, 0.18669),
(3, 695, 0.88669),
(3, 696, 1.00331),
(3, 748, 0.7),
(3, 749, 1.28331),
(3, 750, 1.35331);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms5`
--

INSERT INTO `o2kj3_finder_links_terms5` (`link_id`, `term_id`, `weight`) VALUES
(3, 515, 0.18669),
(3, 516, 0.91),
(3, 517, 1.00331),
(3, 633, 0.56),
(3, 634, 1.07331),
(3, 635, 1.23669),
(3, 636, 0.60669),
(3, 637, 1.16669),
(3, 638, 1.28331),
(3, 706, 0.18669),
(3, 707, 1.21331),
(3, 708, 1.4),
(3, 709, 0.7),
(3, 710, 1.4),
(3, 711, 1.4),
(3, 712, 0.15996),
(3, 724, 0.46669),
(3, 732, 0.09331),
(3, 733, 0.14),
(3, 734, 0.14),
(3, 735, 0.86331),
(3, 736, 1.12),
(3, 737, 0.28),
(3, 738, 0.95669),
(3, 739, 1.19);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms6`
--

INSERT INTO `o2kj3_finder_links_terms6` (`link_id`, `term_id`, `weight`) VALUES
(3, 607, 0.7),
(3, 608, 1.30669),
(3, 609, 1.4),
(3, 610, 1.4),
(3, 611, 1.19),
(3, 612, 1.30669),
(3, 613, 1.16669),
(3, 614, 1.23669),
(3, 630, 0.32669),
(3, 631, 0.95669),
(3, 632, 1.19),
(3, 697, 0.7),
(3, 698, 1.37669),
(3, 699, 1.4),
(3, 716, 0.09331),
(3, 717, 0.81669),
(3, 745, 0.28),
(3, 746, 1.35331),
(3, 747, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms7`
--

INSERT INTO `o2kj3_finder_links_terms7` (`link_id`, `term_id`, `weight`) VALUES
(3, 620, 0.64008);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms8`
--

INSERT INTO `o2kj3_finder_links_terms8` (`link_id`, `term_id`, `weight`) VALUES
(3, 583, 0.51331),
(3, 584, 1.4),
(3, 585, 1.4),
(3, 586, 1.12),
(3, 587, 1.02669),
(3, 588, 1.4),
(3, 589, 1.00331),
(3, 590, 1.05),
(3, 591, 1.05),
(3, 592, 1.14331),
(3, 593, 0.88669),
(3, 594, 1.23669),
(3, 595, 1.14331),
(3, 596, 1.26),
(3, 597, 1.09669),
(3, 598, 1.16669),
(3, 599, 0.84),
(3, 600, 0.91),
(3, 601, 0.93331),
(3, 602, 1.4),
(3, 603, 0.6666),
(3, 604, 0.32004),
(3, 605, 0.15996),
(3, 606, 1.47996),
(3, 645, 0.09331),
(3, 646, 0.81669),
(3, 647, 1.09669),
(3, 648, 0.51331),
(3, 649, 1.28331),
(3, 650, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_terms9`
--

INSERT INTO `o2kj3_finder_links_terms9` (`link_id`, `term_id`, `weight`) VALUES
(3, 624, 0.18669),
(3, 625, 0.88669),
(3, 626, 0.98),
(3, 642, 0.18669),
(3, 643, 0.93331),
(3, 644, 1.05),
(3, 661, 0.18669),
(3, 662, 1.14331),
(3, 663, 1.4),
(3, 740, 0.09331),
(3, 741, 0.81669);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termsa`
--

INSERT INTO `o2kj3_finder_links_termsa` (`link_id`, `term_id`, `weight`) VALUES
(3, 621, 0.28),
(3, 622, 0.95669),
(3, 623, 1.14331),
(3, 627, 0.46669),
(3, 628, 1.35331),
(3, 629, 1.4),
(3, 664, 0.09331),
(3, 676, 0.60669),
(3, 677, 1.07331),
(3, 678, 1.14331),
(3, 679, 0.7),
(3, 680, 1.14331),
(3, 681, 1.26),
(3, 721, 0.7),
(3, 722, 1.37669),
(3, 723, 1.4),
(3, 728, 0.56661),
(3, 729, 0.23331),
(3, 730, 0.98),
(3, 731, 1.09669),
(3, 751, 0.42),
(3, 752, 1.14331),
(3, 753, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termsb`
--

INSERT INTO `o2kj3_finder_links_termsb` (`link_id`, `term_id`, `weight`) VALUES
(3, 651, 0.45339),
(3, 652, 2.26661);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termsc`
--

INSERT INTO `o2kj3_finder_links_termsc` (`link_id`, `term_id`, `weight`) VALUES
(3, 518, 0.14),
(3, 519, 0.81669),
(3, 520, 0.95669),
(3, 521, 0.4),
(3, 522, 2.3334),
(3, 523, 2.5334),
(3, 524, 0.14),
(3, 525, 0.84),
(3, 526, 0.88669),
(3, 527, 0.34),
(3, 528, 0.54),
(3, 529, 2.3334),
(3, 530, 2.5334),
(3, 531, 0.79331),
(3, 532, 0.86331),
(3, 533, 0.4),
(3, 534, 2.3334),
(3, 535, 2.5334),
(3, 536, 0.21),
(3, 537, 1.05),
(3, 538, 1.4),
(3, 539, 0.14),
(3, 540, 0.79331),
(3, 541, 0.86331),
(3, 542, 0.14),
(3, 543, 0.88669),
(3, 544, 0.95669),
(3, 545, 0.28),
(3, 546, 1.23669),
(3, 547, 1.33),
(3, 548, 0.28),
(3, 549, 0.91),
(3, 550, 1.00331),
(3, 551, 0.28),
(3, 552, 0.91),
(3, 553, 0.98),
(3, 554, 0.28),
(3, 555, 0.86331),
(3, 556, 0.98),
(3, 557, 0.28),
(3, 558, 0.88669),
(3, 559, 0.98),
(3, 560, 0.8),
(3, 561, 2.4666),
(3, 562, 2.6666),
(3, 653, 0.23331),
(3, 654, 0.93331),
(3, 655, 1.35331);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termsd`
--

INSERT INTO `o2kj3_finder_links_termsd` (`link_id`, `term_id`, `weight`) VALUES
(3, 511, 0),
(3, 742, 0.18669),
(3, 743, 1.02669),
(3, 744, 1.26);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termse`
--

INSERT INTO `o2kj3_finder_links_termse` (`link_id`, `term_id`, `weight`) VALUES
(3, 563, 0.35),
(3, 564, 0.88669),
(3, 565, 0.95669),
(3, 566, 0.4),
(3, 567, 2.3334),
(3, 568, 0.14),
(3, 569, 1.02669),
(3, 570, 1.35331),
(3, 571, 0.4),
(3, 572, 0.23331),
(3, 573, 1.07331),
(3, 718, 0.04669),
(3, 719, 0.79331),
(3, 720, 0.84);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_links_termsf`
--

INSERT INTO `o2kj3_finder_links_termsf` (`link_id`, `term_id`, `weight`) VALUES
(3, 703, 0.42),
(3, 704, 1.28331),
(3, 705, 1.4);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `o2kj3_finder_taxonomy`
--

INSERT INTO `o2kj3_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0),
(2, 1, 'Type', 1, 1, 0),
(4, 1, 'Author', 1, 1, 0),
(6, 1, 'K2 Category', 1, 1, 0),
(8, 1, 'Language', 1, 1, 0),
(10, 1, 'Extra fields', 1, 1, 0),
(17, 2, 'K2 Item', 1, 1, 0),
(18, 4, 'Super User', 1, 1, 0),
(19, 6, '新闻', 1, 1, 0),
(20, 8, '*', 1, 1, 0),
(21, 10, '[]', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_taxonomy_map`
--

INSERT INTO `o2kj3_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_terms`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=766 ;

--
-- 转存表中的数据 `o2kj3_finder_terms`
--

INSERT INTO `o2kj3_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`, `language`) VALUES
(511, '', '', 0, 0, 0, '', 1, '*'),
(512, '''arial'',''sans-serif''', 'arial', 0, 0, 1, 'A6425261', 1, '*'),
(513, '''arial'',''sans-serif'' mso-fareast-font-family', 'arial mso-fareast-font-family', 0, 1, 2, 'A6425261521623153154', 1, '*'),
(514, '''arial'',''sans-serif'' mso-fareast-font-family 宋体', 'arial mso-fareast-font-family 宋体', 0, 1, 2, 'A6425261521623153154', 1, '*'),
(515, '.5pt', '.5pt', 0, 0, 0.2667, 'P300', 1, '*'),
(516, '.5pt 个人简介', '.5pt 个人简介', 0, 1, 1.3, 'P300', 1, '*'),
(517, '.5pt 个人简介 苏中是', '.5pt 个人简介 苏中是', 0, 1, 1.4333, 'P300', 1, '*'),
(518, '00', '00', 0, 0, 0.2, '', 1, '*'),
(519, '00 地点', '00 地点', 0, 1, 1.1667, '地000', 1, '*'),
(520, '00 地点 5b303', '00 地点 5b303', 0, 1, 1.3667, '地100', 1, '*'),
(521, '01', '01', 0, 0, 0.2, '', 1, '*'),
(522, '01 31', '01 31', 0, 1, 1.1667, '', 1, '*'),
(523, '01 31 52', '01 31 52', 0, 1, 1.2667, '', 1, '*'),
(524, '0pt', '0pt', 0, 0, 0.2, 'P300', 1, '*'),
(525, '0pt 11', '0pt 11', 0, 1, 1.2, 'P300', 1, '*'),
(526, '0pt 11 月', '0pt 11 月', 0, 1, 1.2667, 'P300', 1, '*'),
(527, '10', '10', 0, 0, 0.2, '', 1, '*'),
(528, '11', '11', 0, 0, 0.2, '', 1, '*'),
(529, '11 12', '11 12', 0, 1, 1.1667, '', 1, '*'),
(530, '11 12 01', '11 12 01', 0, 1, 1.2667, '', 1, '*'),
(531, '11 月', '11 月', 0, 1, 1.1333, '月000', 1, '*'),
(532, '11 月 17', '11 月 17', 0, 1, 1.2333, '月000', 1, '*'),
(533, '12', '12', 0, 0, 0.2, '', 1, '*'),
(534, '12 01', '12 01', 0, 1, 1.1667, '', 1, '*'),
(535, '12 01 31', '12 01 31', 0, 1, 1.2667, '', 1, '*'),
(536, '150', '150', 0, 0, 0.3, '', 1, '*'),
(537, '150 font-family', '150 font-family', 0, 1, 1.5, 'F53154', 1, '*'),
(538, '150 font-family ''arial'',''sans-serif''', '150 font-family arial', 0, 1, 2, 'F531546425261', 1, '*'),
(539, '17', '17', 0, 0, 0.2, '', 1, '*'),
(540, '17 日', '17 日', 0, 1, 1.1333, '日000', 1, '*'),
(541, '17 日 18', '17 日 18', 0, 1, 1.2333, '日000', 1, '*'),
(542, '18', '18', 0, 0, 0.2, '', 1, '*'),
(543, '18 30-20', '18 30-20', 0, 1, 1.2667, '', 1, '*'),
(544, '18 30-20 00', '18 30-20 00', 0, 1, 1.3667, '', 1, '*'),
(545, '2002', '2002', 0, 0, 0.4, '', 1, '*'),
(546, '2002 年获得清华大学计算机系博士学位后加入', '2002 年获得清华大学计算机系博士学位后加入', 0, 1, 1.7667, '年000', 1, '*'),
(547, '2002 年获得清华大学计算机系博士学位后加入 ibm', '2002 年获得清华大学计算机系博士学位后加入 ibm', 0, 1, 1.9, '年150', 1, '*'),
(548, '2007', '2007', 0, 0, 0.4, '', 1, '*'),
(549, '2007 年被评为', '2007 年被评为', 0, 1, 1.3, '年000', 1, '*'),
(550, '2007 年被评为 ibm', '2007 年被评为 ibm', 0, 1, 1.4333, '年150', 1, '*'),
(551, '2008', '2008', 0, 0, 0.4, '', 1, '*'),
(552, '2008 2010', '2008 2010', 0, 1, 1.3, '', 1, '*'),
(553, '2008 2010 以及', '2008 2010 以及', 0, 1, 1.4, '以000', 1, '*'),
(554, '2010', '2010', 0, 0, 0.4, '', 1, '*'),
(555, '2010 以及', '2010 以及', 0, 1, 1.2333, '以000', 1, '*'),
(556, '2010 以及 2014', '2010 以及 2014', 0, 1, 1.4, '以000', 1, '*'),
(557, '2014', '2014', 0, 0, 0.4, '', 1, '*'),
(558, '2014 年获得', '2014 年获得', 0, 1, 1.2667, '年000', 1, '*'),
(559, '2014 年获得 ibm', '2014 年获得 ibm', 0, 1, 1.4, '年150', 1, '*'),
(560, '2016', '2016', 0, 0, 0.4, '', 1, '*'),
(561, '2016 11', '2016 11', 0, 1, 1.2333, '', 1, '*'),
(562, '2016 11 12', '2016 11 12', 0, 1, 1.3333, '', 1, '*'),
(563, '30-20', '30-20', 0, 0, 0.5, '', 1, '*'),
(564, '30-20 00', '30-20 00', 0, 1, 1.2667, '', 1, '*'),
(565, '30-20 00 地点', '30-20 00 地点', 0, 1, 1.3667, '地000', 1, '*'),
(566, '31', '31', 0, 0, 0.2, '', 1, '*'),
(567, '31 52', '31 52', 0, 1, 1.1667, '', 1, '*'),
(568, '50', '50', 0, 0, 0.2, '', 1, '*'),
(569, '50 余项发明专利及专利申请', '50 余项发明专利及专利申请', 0, 1, 1.4667, '余000', 1, '*'),
(570, '50 余项发明专利及专利申请 他目前兼任南开大学兼职教授', '50 余项发明专利及专利申请 他目前兼任南开大学兼职教授', 0, 1, 1.9333, '余000', 1, '*'),
(571, '52', '52', 0, 0, 0.2, '', 1, '*'),
(572, '5b303', '5b303', 0, 0, 0.3333, 'B000', 1, '*'),
(573, '5b303 欢迎广大师生参与交流', '5b303 欢迎广大师生参与交流', 0, 1, 1.5333, 'B000', 1, '*'),
(574, '60', '60', 0, 0, 0.2, '', 1, '*'),
(575, '60 余篇', '60 余篇', 0, 1, 1.1667, '余000', 1, '*'),
(576, '60 余篇 50', '60 余篇 50', 0, 1, 1.2667, '余000', 1, '*'),
(577, 'apex', 'apex', 0, 0, 0.2667, 'A120', 1, '*'),
(578, 'apex 实验室客座教授', 'apex 实验室客座教授', 0, 1, 1.4, 'A120', 1, '*'),
(579, 'apex 实验室客座教授 ibm', 'apex 实验室客座教授 ibm', 0, 1, 1.5333, 'A1215', 1, '*'),
(580, 'arial', 'arial', 0, 0, 0.3333, 'A640', 1, '*'),
(581, 'arial sans-serif', 'arial sans-serif', 0, 1, 1.5333, 'A6425261', 1, '*'),
(582, 'arial sans-serif 2007', 'arial sans-serif 2007', 0, 1, 1.7, 'A6425261', 1, '*'),
(583, 'font-family', 'font-family', 0, 0, 0.7333, 'F53154', 1, '*'),
(584, 'font-family ''arial'',''sans-serif''', 'font-family arial', 0, 1, 2, 'F531546425261', 1, '*'),
(585, 'font-family ''arial'',''sans-serif'' mso-fareast-font-family', 'font-family arial mso-fareast-font-family', 0, 1, 2, 'F531546425261521623153154', 1, '*'),
(586, 'ibm', 'ibm', 0, 0, 0.2, 'I150', 1, '*'),
(587, 'ibm 中国研究院的研究总监', 'ibm 中国研究院的研究总监', 0, 1, 1.4667, 'I150', 1, '*'),
(588, 'ibm 中国研究院的研究总监 大数据及认知计算研究方向首席科学家', 'ibm 中国研究院的研究总监 大数据及认知计算研究方向首席科学家', 0, 1, 2, 'I150', 1, '*'),
(589, 'ibm 全球研究技术成就奖', 'ibm 全球研究技术成就奖', 0, 1, 1.4333, 'I150', 1, '*'),
(590, 'ibm 全球研究技术成就奖 在', 'ibm 全球研究技术成就奖 在', 0, 1, 1.5, 'I150', 1, '*'),
(591, 'ibm 全球研究杰出技术成就奖', 'ibm 全球研究杰出技术成就奖', 0, 1, 1.5, 'I150', 1, '*'),
(592, 'ibm 全球研究杰出技术成就奖 苏中在', 'ibm 全球研究杰出技术成就奖 苏中在', 0, 1, 1.6333, 'I150', 1, '*'),
(593, 'ibm 发明大师', 'ibm 发明大师', 0, 1, 1.2667, 'I150', 1, '*'),
(594, 'ibm 发明大师 担任研究院专利评审委员会主席', 'ibm 发明大师 担任研究院专利评审委员会主席', 0, 1, 1.7667, 'I150', 1, '*'),
(595, 'ibm 在中国研究院先后参与了文本分析', 'ibm 在中国研究院先后参与了文本分析', 0, 1, 1.6333, 'I150', 1, '*'),
(596, 'ibm 在中国研究院先后参与了文本分析 企业搜索', 'ibm 在中国研究院先后参与了文本分析 企业搜索', 0, 1, 1.8, 'I150', 1, '*'),
(597, 'ibm 大中华区技术专家委员会主席', 'ibm 大中华区技术专家委员会主席', 0, 1, 1.5667, 'I150', 1, '*'),
(598, 'ibm 大中华区技术专家委员会主席 时间', 'ibm 大中华区技术专家委员会主席 时间', 0, 1, 1.6667, 'I150', 1, '*'),
(599, 'ibm 讲师', 'ibm 讲师', 0, 1, 1.2, 'I150', 1, '*'),
(600, 'ibm 讲师 苏中', 'ibm 讲师 苏中', 0, 1, 1.3, 'I150', 1, '*'),
(601, 'ibm 软件产品采用', 'ibm 软件产品采用', 0, 1, 1.3333, 'I150', 1, '*'),
(602, 'ibm 软件产品采用 并在国际以及国内的多次技术评估中得到第一名', 'ibm 软件产品采用 并在国际以及国内的多次技术评估中得到第一名', 0, 1, 2, 'I150', 1, '*'),
(603, 'index', 'index', 0, 0, 0.3333, 'I532', 1, '*'),
(604, 'item', 'item', 0, 0, 0.2667, 'I350', 1, '*'),
(605, 'k2', 'k2', 0, 0, 0.1333, 'K000', 1, '*'),
(606, 'k2 item', 'k2 item', 0, 1, 1.2333, 'K350', 1, '*'),
(607, 'mso-fareast-font-family', 'mso-fareast-font-family', 0, 0, 1, 'M21623153154', 1, '*'),
(608, 'mso-fareast-font-family 宋体', 'mso-fareast-font-family 宋体', 0, 1, 1.8667, 'M21623153154', 1, '*'),
(609, 'mso-fareast-font-family 宋体 mso-font-kerning', 'mso-fareast-font-family 宋体 mso-font-kerning', 0, 1, 2, 'M21623153154521532652', 1, '*'),
(610, 'mso-font-kerning', 'mso-font-kerning', 0, 0, 1, 'M21532652', 1, '*'),
(611, 'mso-font-kerning .5pt', 'mso-font-kerning .5pt', 0, 1, 1.7, 'M2153265213', 1, '*'),
(612, 'mso-font-kerning .5pt 个人简介', 'mso-font-kerning .5pt 个人简介', 0, 1, 1.8667, 'M2153265213', 1, '*'),
(613, 'mso-font-kerning 0pt', 'mso-font-kerning 0pt', 0, 1, 1.6667, 'M2153265213', 1, '*'),
(614, 'mso-font-kerning 0pt 11', 'mso-font-kerning 0pt 11', 0, 1, 1.7667, 'M2153265213', 1, '*'),
(615, 'sans-serif', 'sans-serif', 0, 0, 0.6667, 'S5261', 1, '*'),
(616, 'sans-serif 2007', 'sans-serif 2007', 0, 1, 1.5, 'S5261', 1, '*'),
(617, 'sans-serif 2007 年被评为', 'sans-serif 2007 年被评为', 0, 1, 1.6667, 'S5261', 1, '*'),
(618, 'super', 'super', 0, 0, 0.3333, 'S160', 1, '*'),
(619, 'super user', 'super user', 0, 1, 1.3333, 'S1626', 1, '*'),
(620, 'user', 'user', 0, 0, 0.2667, 'U260', 1, '*'),
(621, '上海交通大学', '上海交通大学', 0, 0, 0.4, '上000', 1, '*'),
(622, '上海交通大学 apex', '上海交通大学 apex', 0, 1, 1.3667, '上120', 1, '*'),
(623, '上海交通大学 apex 实验室客座教授', '上海交通大学 apex 实验室客座教授', 0, 1, 1.6333, '上120', 1, '*'),
(624, '个人简介', '个人简介', 0, 0, 0.2667, '个000', 1, '*'),
(625, '个人简介 苏中是', '个人简介 苏中是', 0, 1, 1.2667, '个000', 1, '*'),
(626, '个人简介 苏中是 ibm', '个人简介 苏中是 ibm', 0, 1, 1.4, '个150', 1, '*'),
(627, '中国研究院的研究总监', '中国研究院的研究总监', 0, 0, 0.6667, '中000', 1, '*'),
(628, '中国研究院的研究总监 大数据及认知计算研究方向首席科学家', '中国研究院的研究总监 大数据及认知计算研究方向首席科学家', 0, 1, 1.9333, '中000', 1, '*'),
(629, '中国研究院的研究总监 大数据及认知计算研究方向首席科学家 在', '中国研究院的研究总监 大数据及认知计算研究方向首席科学家 在', 0, 1, 2, '中000', 1, '*'),
(630, '也因此数次获得', '也因此数次获得', 0, 0, 0.4667, '也000', 1, '*'),
(631, '也因此数次获得 ibm', '也因此数次获得 ibm', 0, 1, 1.3667, '也150', 1, '*'),
(632, '也因此数次获得 ibm 全球研究技术成就奖', '也因此数次获得 ibm 全球研究技术成就奖', 0, 1, 1.7, '也150', 1, '*'),
(633, '他所领导的多项技术研发被', '他所领导的多项技术研发被', 0, 0, 0.8, '他000', 1, '*'),
(634, '他所领导的多项技术研发被 ibm', '他所领导的多项技术研发被 ibm', 0, 1, 1.5333, '他150', 1, '*'),
(635, '他所领导的多项技术研发被 ibm 软件产品采用', '他所领导的多项技术研发被 ibm 软件产品采用', 0, 1, 1.7667, '他150', 1, '*'),
(636, '他目前兼任南开大学兼职教授', '他目前兼任南开大学兼职教授', 0, 0, 0.8667, '他000', 1, '*'),
(637, '他目前兼任南开大学兼职教授 上海交通大学', '他目前兼任南开大学兼职教授 上海交通大学', 0, 1, 1.6667, '他000', 1, '*'),
(638, '他目前兼任南开大学兼职教授 上海交通大学 apex', '他目前兼任南开大学兼职教授 上海交通大学 apex', 0, 1, 1.8333, '他120', 1, '*'),
(639, '以及', '以及', 0, 0, 0.1333, '以000', 1, '*'),
(640, '以及 2014', '以及 2014', 0, 1, 1.2333, '以000', 1, '*'),
(641, '以及 2014 年获得', '以及 2014 年获得', 0, 1, 1.3667, '以000', 1, '*'),
(642, '企业搜索', '企业搜索', 0, 0, 0.2667, '企000', 1, '*'),
(643, '企业搜索 元数据管理', '企业搜索 元数据管理', 0, 1, 1.3333, '企000', 1, '*'),
(644, '企业搜索 元数据管理 数据集成', '企业搜索 元数据管理 数据集成', 0, 1, 1.5, '企000', 1, '*'),
(645, '余篇', '余篇', 0, 0, 0.1333, '余000', 1, '*'),
(646, '余篇 50', '余篇 50', 0, 1, 1.1667, '余000', 1, '*'),
(647, '余篇 50 余项发明专利及专利申请', '余篇 50 余项发明专利及专利申请', 0, 1, 1.5667, '余000', 1, '*'),
(648, '余项发明专利及专利申请', '余项发明专利及专利申请', 0, 0, 0.7333, '余000', 1, '*'),
(649, '余项发明专利及专利申请 他目前兼任南开大学兼职教授', '余项发明专利及专利申请 他目前兼任南开大学兼职教授', 0, 1, 1.8333, '余000', 1, '*'),
(650, '余项发明专利及专利申请 他目前兼任南开大学兼职教授 上海交通大学', '余项发明专利及专利申请 他目前兼任南开大学兼职教授 上海交通大学', 0, 1, 2, '余000', 1, '*'),
(651, '信息前沿', '信息前沿', 0, 0, 0.2667, '信000', 1, '*'),
(652, '信息前沿 第十讲预告', '信息前沿 第十讲预告', 0, 1, 1.3333, '信000', 1, '*'),
(653, '元数据管理', '元数据管理', 0, 0, 0.3333, '元000', 1, '*'),
(654, '元数据管理 数据集成', '元数据管理 数据集成', 0, 1, 1.3333, '元000', 1, '*'),
(655, '元数据管理 数据集成 社会化计算及信息可视化等方面的研究', '元数据管理 数据集成 社会化计算及信息可视化等方面的研究', 0, 1, 1.9333, '元000', 1, '*'),
(656, '全球研究技术成就奖', '全球研究技术成就奖', 0, 0, 0.6, '全000', 1, '*'),
(657, '全球研究技术成就奖 在', '全球研究技术成就奖 在', 0, 1, 1.3667, '全000', 1, '*'),
(658, '全球研究技术成就奖 在 2008', '全球研究技术成就奖 在 2008', 0, 1, 1.5333, '全000', 1, '*'),
(659, '全球研究杰出技术成就奖', '全球研究杰出技术成就奖', 0, 0, 0.7333, '全000', 1, '*'),
(660, '全球研究杰出技术成就奖 苏中在', '全球研究杰出技术成就奖 苏中在', 0, 1, 1.5, '全000', 1, '*'),
(661, '发明大师', '发明大师', 0, 0, 0.2667, '发000', 1, '*'),
(662, '发明大师 担任研究院专利评审委员会主席', '发明大师 担任研究院专利评审委员会主席', 0, 1, 1.6333, '发000', 1, '*'),
(663, '发明大师 担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文', '发明大师 担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文', 0, 1, 2, '发000', 1, '*'),
(664, '周四', '周四', 0, 0, 0.1333, '周000', 1, '*'),
(665, '在', '在', 0, 0, 0.0667, '在000', 1, '*'),
(666, '在 2002', '在 2002', 0, 1, 1.2, '在000', 1, '*'),
(667, '在 2002 年获得清华大学计算机系博士学位后加入', '在 2002 年获得清华大学计算机系博士学位后加入', 0, 1, 1.8333, '在000', 1, '*'),
(668, '在 2008', '在 2008', 0, 1, 1.2, '在000', 1, '*'),
(669, '在 2008 2010', '在 2008 2010', 0, 1, 1.3667, '在000', 1, '*'),
(670, '在中国研究院先后参与了文本分析', '在中国研究院先后参与了文本分析', 0, 0, 1, '在000', 1, '*'),
(671, '在中国研究院先后参与了文本分析 企业搜索', '在中国研究院先后参与了文本分析 企业搜索', 0, 1, 1.6667, '在000', 1, '*'),
(672, '在中国研究院先后参与了文本分析 企业搜索 元数据管理', '在中国研究院先后参与了文本分析 企业搜索 元数据管理', 0, 1, 1.8667, '在000', 1, '*'),
(673, '地点', '地点', 0, 0, 0.1333, '地000', 1, '*'),
(674, '地点 5b303', '地点 5b303', 0, 1, 1.2667, '地100', 1, '*'),
(675, '地点 5b303 欢迎广大师生参与交流', '地点 5b303 欢迎广大师生参与交流', 0, 1, 1.6333, '地100', 1, '*'),
(676, '大中华区技术专家委员会主席', '大中华区技术专家委员会主席', 0, 0, 0.8667, '大000', 1, '*'),
(677, '大中华区技术专家委员会主席 时间', '大中华区技术专家委员会主席 时间', 0, 1, 1.5333, '大000', 1, '*'),
(678, '大中华区技术专家委员会主席 时间 周四', '大中华区技术专家委员会主席 时间 周四', 0, 1, 1.6333, '大000', 1, '*'),
(679, '大数据及认知计算研究方向首席科学家', '大数据及认知计算研究方向首席科学家', 0, 0, 1, '大000', 1, '*'),
(680, '大数据及认知计算研究方向首席科学家 在', '大数据及认知计算研究方向首席科学家 在', 0, 1, 1.6333, '大000', 1, '*'),
(681, '大数据及认知计算研究方向首席科学家 在 2002', '大数据及认知计算研究方向首席科学家 在 2002', 0, 1, 1.8, '大000', 1, '*'),
(682, '宋体', '宋体', 0, 0, 0.1333, '宋000', 1, '*'),
(683, '宋体 mso-font-kerning', '宋体 mso-font-kerning', 0, 1, 1.6333, '宋521532652', 1, '*'),
(684, '宋体 mso-font-kerning 0pt', '宋体 mso-font-kerning 0pt', 0, 1, 1.7667, '宋52153265213', 1, '*'),
(685, '实验室客座教授', '实验室客座教授', 0, 0, 0.4667, '实000', 1, '*'),
(686, '实验室客座教授 ibm', '实验室客座教授 ibm', 0, 1, 1.3667, '实150', 1, '*'),
(687, '实验室客座教授 ibm 大中华区技术专家委员会主席', '实验室客座教授 ibm 大中华区技术专家委员会主席', 0, 1, 1.8333, '实150', 1, '*'),
(688, '年获得', '年获得', 0, 0, 0.2, '年000', 1, '*'),
(689, '年获得 ibm', '年获得 ibm', 0, 1, 1.2333, '年150', 1, '*'),
(690, '年获得 ibm 全球研究杰出技术成就奖', '年获得 ibm 全球研究杰出技术成就奖', 0, 1, 1.6333, '年150', 1, '*'),
(691, '年获得清华大学计算机系博士学位后加入', '年获得清华大学计算机系博士学位后加入', 0, 0, 1, '年000', 1, '*'),
(692, '年获得清华大学计算机系博士学位后加入 ibm', '年获得清华大学计算机系博士学位后加入 ibm', 0, 1, 1.7333, '年150', 1, '*'),
(693, '年获得清华大学计算机系博士学位后加入 ibm 在中国研究院先后参与了文本分析', '年获得清华大学计算机系博士学位后加入 ibm 在中国研究院先后参与了文本分析', 0, 1, 2, '年150', 1, '*'),
(694, '年被评为', '年被评为', 0, 0, 0.2667, '年000', 1, '*'),
(695, '年被评为 ibm', '年被评为 ibm', 0, 1, 1.2667, '年150', 1, '*'),
(696, '年被评为 ibm 发明大师', '年被评为 ibm 发明大师', 0, 1, 1.4333, '年150', 1, '*'),
(697, '并在国际以及国内的多次技术评估中得到第一名', '并在国际以及国内的多次技术评估中得到第一名', 0, 0, 1, '并000', 1, '*'),
(698, '并在国际以及国内的多次技术评估中得到第一名 也因此数次获得', '并在国际以及国内的多次技术评估中得到第一名 也因此数次获得', 0, 1, 1.9667, '并000', 1, '*'),
(699, '并在国际以及国内的多次技术评估中得到第一名 也因此数次获得 ibm', '并在国际以及国内的多次技术评估中得到第一名 也因此数次获得 ibm', 0, 1, 2, '并150', 1, '*'),
(700, '担任研究院专利评审委员会主席', '担任研究院专利评审委员会主席', 0, 0, 0.9333, '担000', 1, '*'),
(701, '担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文', '担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文', 0, 1, 2, '担000', 1, '*'),
(702, '担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文 60', '担任研究院专利评审委员会主席 迄今为止已经在国际顶级会议及期刊发表学术论文 60', 0, 1, 2, '担000', 1, '*'),
(703, '摩尔定律走到了尽头', '摩尔定律走到了尽头', 0, 0, 0.6, '摩000', 1, '*'),
(704, '摩尔定律走到了尽头 新的计算模式和计算技术正在发展', '摩尔定律走到了尽头 新的计算模式和计算技术正在发展', 0, 1, 1.8333, '摩000', 1, '*'),
(705, '摩尔定律走到了尽头 新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向', '摩尔定律走到了尽头 新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向', 0, 1, 2, '摩000', 1, '*'),
(706, '数据集成', '数据集成', 0, 0, 0.2667, '数000', 1, '*'),
(707, '数据集成 社会化计算及信息可视化等方面的研究', '数据集成 社会化计算及信息可视化等方面的研究', 0, 1, 1.7333, '数000', 1, '*'),
(708, '数据集成 社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被', '数据集成 社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被', 0, 1, 2, '数000', 1, '*'),
(709, '新的计算模式和计算技术正在发展', '新的计算模式和计算技术正在发展', 0, 0, 1, '新000', 1, '*'),
(710, '新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向', '新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向', 0, 1, 2, '新000', 1, '*'),
(711, '新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm', '新的计算模式和计算技术正在发展 本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm', 0, 1, 2, '新150', 1, '*'),
(712, '新闻', '新闻', 0, 0, 0.1333, '新000', 1, '*'),
(713, '日', '日', 0, 0, 0.0667, '日000', 1, '*'),
(714, '日 18', '日 18', 0, 1, 1.1333, '日000', 1, '*'),
(715, '日 18 30-20', '日 18 30-20', 0, 1, 1.3333, '日000', 1, '*'),
(716, '时间', '时间', 0, 0, 0.1333, '时000', 1, '*'),
(717, '时间 周四', '时间 周四', 0, 1, 1.1667, '时000', 1, '*'),
(718, '月', '月', 0, 0, 0.0667, '月000', 1, '*'),
(719, '月 17', '月 17', 0, 1, 1.1333, '月000', 1, '*'),
(720, '月 17 日', '月 17 日', 0, 1, 1.2, '月000', 1, '*'),
(721, '本课程将会介绍计算技术的发展走向和新的计算技术方向', '本课程将会介绍计算技术的发展走向和新的计算技术方向', 0, 0, 1, '本000', 1, '*'),
(722, '本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm', '本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm', 0, 1, 1.9667, '本150', 1, '*'),
(723, '本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm 讲师', '本课程将会介绍计算技术的发展走向和新的计算技术方向 ibm 讲师', 0, 1, 2, '本150', 1, '*'),
(724, '欢迎广大师生参与交流', '欢迎广大师生参与交流', 0, 0, 0.6667, '欢000', 1, '*'),
(725, '社会化计算及信息可视化等方面的研究', '社会化计算及信息可视化等方面的研究', 0, 0, 1, '社000', 1, '*'),
(726, '社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被', '社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被', 0, 1, 2, '社000', 1, '*'),
(727, '社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被 ibm', '社会化计算及信息可视化等方面的研究 他所领导的多项技术研发被 ibm', 0, 1, 2, '社150', 1, '*'),
(728, '第十讲预告', '第十讲预告', 0, 0, 0.3333, '第000', 1, '*'),
(729, '第十讲题目', '第十讲题目', 0, 0, 0.3333, '第000', 1, '*'),
(730, '第十讲题目 计算机的未来', '第十讲题目 计算机的未来', 0, 1, 1.4, '第000', 1, '*'),
(731, '第十讲题目 计算机的未来 课程简介', '第十讲题目 计算机的未来 课程简介', 0, 1, 1.5667, '第000', 1, '*'),
(732, '苏中', '苏中', 0, 0, 0.1333, '苏000', 1, '*'),
(733, '苏中在', '苏中在', 0, 0, 0.2, '苏000', 1, '*'),
(734, '苏中是', '苏中是', 0, 0, 0.2, '苏000', 1, '*'),
(735, '苏中是 ibm', '苏中是 ibm', 0, 1, 1.2333, '苏150', 1, '*'),
(736, '苏中是 ibm 中国研究院的研究总监', '苏中是 ibm 中国研究院的研究总监', 0, 1, 1.6, '苏150', 1, '*'),
(737, '计算机的未来', '计算机的未来', 0, 0, 0.4, '计000', 1, '*'),
(738, '计算机的未来 课程简介', '计算机的未来 课程简介', 0, 1, 1.3667, '计000', 1, '*'),
(739, '计算机的未来 课程简介 随着人工智能的发展', '计算机的未来 课程简介 随着人工智能的发展', 0, 1, 1.7, '计000', 1, '*'),
(740, '讲师', '讲师', 0, 0, 0.1333, '讲000', 1, '*'),
(741, '讲师 苏中', '讲师 苏中', 0, 1, 1.1667, '讲000', 1, '*'),
(742, '课程简介', '课程简介', 0, 0, 0.2667, '课000', 1, '*'),
(743, '课程简介 随着人工智能的发展', '课程简介 随着人工智能的发展', 0, 1, 1.4667, '课000', 1, '*'),
(744, '课程简介 随着人工智能的发展 摩尔定律走到了尽头', '课程简介 随着人工智能的发展 摩尔定律走到了尽头', 0, 1, 1.8, '课000', 1, '*'),
(745, '软件产品采用', '软件产品采用', 0, 0, 0.4, '软000', 1, '*'),
(746, '软件产品采用 并在国际以及国内的多次技术评估中得到第一名', '软件产品采用 并在国际以及国内的多次技术评估中得到第一名', 0, 1, 1.9333, '软000', 1, '*'),
(747, '软件产品采用 并在国际以及国内的多次技术评估中得到第一名 也因此数次获得', '软件产品采用 并在国际以及国内的多次技术评估中得到第一名 也因此数次获得', 0, 1, 2, '软000', 1, '*'),
(748, '迄今为止已经在国际顶级会议及期刊发表学术论文', '迄今为止已经在国际顶级会议及期刊发表学术论文', 0, 0, 1, '迄000', 1, '*'),
(749, '迄今为止已经在国际顶级会议及期刊发表学术论文 60', '迄今为止已经在国际顶级会议及期刊发表学术论文 60', 0, 1, 1.8333, '迄000', 1, '*'),
(750, '迄今为止已经在国际顶级会议及期刊发表学术论文 60 余篇', '迄今为止已经在国际顶级会议及期刊发表学术论文 60 余篇', 0, 1, 1.9333, '迄000', 1, '*'),
(751, '随着人工智能的发展', '随着人工智能的发展', 0, 0, 0.6, '随000', 1, '*'),
(752, '随着人工智能的发展 摩尔定律走到了尽头', '随着人工智能的发展 摩尔定律走到了尽头', 0, 1, 1.6333, '随000', 1, '*'),
(753, '随着人工智能的发展 摩尔定律走到了尽头 新的计算模式和计算技术正在发展', '随着人工智能的发展 摩尔定律走到了尽头 新的计算模式和计算技术正在发展', 0, 1, 2, '随000', 1, '*');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `o2kj3_finder_terms_common`
--

INSERT INTO `o2kj3_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_finder_types`
--

CREATE TABLE IF NOT EXISTS `o2kj3_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `o2kj3_finder_types`
--

INSERT INTO `o2kj3_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Tag', ''),
(2, 'Category', ''),
(3, 'Contact', ''),
(4, 'Article', ''),
(5, 'News Feed', ''),
(6, 'K2 Item', '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_attachments`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleAttribute` text NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_categories`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`published`,`access`,`trash`),
  KEY `parent` (`parent`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  KEY `trash` (`trash`),
  KEY `language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `o2kj3_k2_categories`
--

INSERT INTO `o2kj3_k2_categories` (`id`, `name`, `alias`, `description`, `parent`, `extraFieldsGroup`, `published`, `access`, `ordering`, `image`, `params`, `trash`, `plugins`, `language`) VALUES
(1, '全部分类', 'all', '', 0, 0, 1, 1, 1, '', '{"inheritFrom":"0","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"10","num_leading_columns":"1","leadingImgSize":"none","num_primary_items":"0","num_primary_columns":"0","primaryImgSize":"none","num_secondary_items":"0","num_secondary_columns":"0","secondaryImgSize":"Small","num_links":"0","num_links_columns":"0","linksImgSize":"none","catCatalogMode":"1","catFeaturedItems":"1","catOrdering":"rdate","catPagination":"2","catPaginationResults":"1","catTitle":"0","catTitleItemCounter":"1","catDescription":"0","catImage":"0","catFeedLink":"0","catFeedIcon":"0","subCategories":"0","subCatColumns":"2","subCatOrdering":"","subCatTitle":"0","subCatTitleItemCounter":"0","subCatDescription":"0","subCatImage":"0","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"0","catItemDateCreated":"0","catItemRating":"0","catItemImage":"0","catItemIntroText":"0","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"0","catItemTags":"0","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"0","catItemCommentsAnchor":"0","catItemK2Plugins":"0","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"0","itemAuthor":"0","itemFontResizer":"0","itemPrintButton":"0","itemEmailButton":"0","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"0","itemRating":"0","itemImage":"0","itemImgSize":"Medium","itemImageMainCaption":"1","itemImageMainCredits":"0","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"0","itemHits":"1","itemCategory":"0","itemTags":"1","itemAttachments":"0","itemAttachmentsCounter":"0","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"0","itemVideoCredits":"0","itemImageGallery":"0","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"0","itemTwitterButton":"0","itemFacebookButton":"0","itemGooglePlusOneButton":"0","itemAuthorBlock":"0","itemAuthorImage":"0","itemAuthorDescription":"0","itemAuthorURL":"0","itemAuthorEmail":"0","itemAuthorLatest":"0","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', '*'),
(2, '新闻', 'news', '', 1, 0, 1, 1, 2, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"5","num_leading_columns":"1","leadingImgSize":"none","num_primary_items":"0","num_primary_columns":"0","primaryImgSize":"none","num_secondary_items":"0","num_secondary_columns":"0","secondaryImgSize":"none","num_links":"0","num_links_columns":"0","linksImgSize":"XSmall","catCatalogMode":"1","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"0","catTitleItemCounter":"0","catDescription":"0","catImage":"0","catFeedLink":"0","catFeedIcon":"0","subCategories":"0","subCatColumns":"0","subCatOrdering":"","subCatTitle":"0","subCatTitleItemCounter":"0","subCatDescription":"0","subCatImage":"0","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"0","catItemDateCreated":"0","catItemRating":"0","catItemImage":"0","catItemIntroText":"0","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"0","catItemTags":"0","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"0","catItemCommentsAnchor":"0","catItemK2Plugins":"1","itemDateCreated":"0","itemTitle":"1","itemFeaturedNotice":"0","itemAuthor":"1","itemFontResizer":"0","itemPrintButton":"0","itemEmailButton":"0","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"0","itemRating":"0","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"0","itemDateModified":"0","itemHits":"1","itemCategory":"0","itemTags":"0","itemAttachments":"0","itemAttachmentsCounter":"0","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"0","itemTwitterButton":"0","itemFacebookButton":"0","itemGooglePlusOneButton":"0","itemAuthorBlock":"0","itemAuthorImage":"0","itemAuthorDescription":"0","itemAuthorURL":"0","itemAuthorEmail":"0","itemAuthorLatest":"0","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(3, '人员', 'people', '', 1, 0, 1, 1, 3, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(4, '近期工作', 'recent', '', 1, 0, 1, 1, 4, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(5, '科研项目', 'project', '', 1, 0, 1, 1, 5, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(6, '论著', 'paper', '', 1, 0, 1, 1, 6, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(7, '学生相关', 'student', '', 1, 0, 1, 1, 7, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(8, '联系我们', 'contact', '', 1, 0, 1, 1, 9, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(9, '首页', 'intro', '', 1, 0, 1, 1, 1, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(10, '学生名单', 'student-list', '', 7, 0, 1, 1, 1, '', '{"inheritFrom":"7","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(11, '教学', 'educate', '', 7, 0, 1, 1, 2, '', '{"inheritFrom":"7","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(12, '招生', 'enroll', '', 7, 0, 1, 1, 3, '', '{"inheritFrom":"7","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN'),
(13, '合作交流', 'cooperate', '', 1, 0, 1, 1, 8, '', '{"inheritFrom":"1","catMetaDesc":"","catMetaKey":"","catMetaRobots":"","catMetaAuthor":"","theme":"","num_leading_items":"2","num_leading_columns":"1","leadingImgSize":"Large","num_primary_items":"4","num_primary_columns":"2","primaryImgSize":"Medium","num_secondary_items":"4","num_secondary_columns":"1","secondaryImgSize":"Small","num_links":"4","num_links_columns":"1","linksImgSize":"XSmall","catCatalogMode":"0","catFeaturedItems":"1","catOrdering":"","catPagination":"2","catPaginationResults":"1","catTitle":"1","catTitleItemCounter":"1","catDescription":"1","catImage":"1","catFeedLink":"1","catFeedIcon":"1","subCategories":"1","subCatColumns":"2","subCatOrdering":"","subCatTitle":"1","subCatTitleItemCounter":"1","subCatDescription":"1","subCatImage":"1","itemImageXS":"","itemImageS":"","itemImageM":"","itemImageL":"","itemImageXL":"","catItemTitle":"1","catItemTitleLinked":"1","catItemFeaturedNotice":"0","catItemAuthor":"1","catItemDateCreated":"1","catItemRating":"0","catItemImage":"1","catItemIntroText":"1","catItemIntroTextWordLimit":"","catItemExtraFields":"0","catItemHits":"0","catItemCategory":"1","catItemTags":"1","catItemAttachments":"0","catItemAttachmentsCounter":"0","catItemVideo":"0","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"0","catItemImageGallery":"0","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"0","catItemReadMore":"1","catItemCommentsAnchor":"1","catItemK2Plugins":"1","itemDateCreated":"1","itemTitle":"1","itemFeaturedNotice":"1","itemAuthor":"1","itemFontResizer":"1","itemPrintButton":"1","itemEmailButton":"1","itemSocialButton":"1","itemVideoAnchor":"1","itemImageGalleryAnchor":"1","itemCommentsAnchor":"1","itemRating":"1","itemImage":"1","itemImgSize":"Large","itemImageMainCaption":"1","itemImageMainCredits":"1","itemIntroText":"1","itemFullText":"1","itemExtraFields":"1","itemDateModified":"1","itemHits":"1","itemCategory":"1","itemTags":"1","itemAttachments":"1","itemAttachmentsCounter":"1","itemVideo":"1","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"0","itemVideoCaption":"1","itemVideoCredits":"1","itemImageGallery":"1","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"1","itemComments":"1","itemTwitterButton":"1","itemFacebookButton":"1","itemGooglePlusOneButton":"1","itemAuthorBlock":"1","itemAuthorImage":"1","itemAuthorDescription":"1","itemAuthorURL":"1","itemAuthorEmail":"0","itemAuthorLatest":"1","itemAuthorLatestLimit":"5","itemRelated":"1","itemRelatedLimit":"5","itemRelatedTitle":"1","itemRelatedCategory":"0","itemRelatedImageSize":"0","itemRelatedIntrotext":"0","itemRelatedFulltext":"0","itemRelatedAuthor":"0","itemRelatedMedia":"0","itemRelatedImageGallery":"0","itemK2Plugins":"1"}', 0, '', 'zh-CN');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_comments`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `userID` (`userID`),
  KEY `published` (`published`),
  KEY `latestComments` (`published`,`commentDate`),
  KEY `countComments` (`itemID`,`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_extra_fields`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_extra_fields_groups`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_items`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` text,
  `gallery` varchar(255) DEFAULT NULL,
  `extra_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `extra_fields_search` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` smallint(6) NOT NULL DEFAULT '0',
  `featured_ordering` int(11) NOT NULL DEFAULT '0',
  `image_caption` text NOT NULL,
  `image_credits` varchar(255) NOT NULL,
  `video_caption` text NOT NULL,
  `video_credits` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  `params` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `metakey` text NOT NULL,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  KEY `catid` (`catid`),
  KEY `created_by` (`created_by`),
  KEY `ordering` (`ordering`),
  KEY `featured` (`featured`),
  KEY `featured_ordering` (`featured_ordering`),
  KEY `hits` (`hits`),
  KEY `created` (`created`),
  KEY `language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `o2kj3_k2_items`
--

INSERT INTO `o2kj3_k2_items` (`id`, `title`, `alias`, `catid`, `published`, `introtext`, `fulltext`, `video`, `gallery`, `extra_fields`, `extra_fields_search`, `created`, `created_by`, `created_by_alias`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `publish_up`, `publish_down`, `trash`, `access`, `ordering`, `featured`, `featured_ordering`, `image_caption`, `image_credits`, `video_caption`, `video_credits`, `hits`, `params`, `metadesc`, `metadata`, `metakey`, `plugins`, `language`) VALUES
(1, '新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:01:08', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 1, 0, 1, '', '', '', '', 0, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(2, '复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:13:52', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 2, 0, 1, '', '', '', '', 0, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(3, '复制 复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:01', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 3, 0, 1, '', '', '', '', 0, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(4, '复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:01', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 4, 0, 1, '', '', '', '', 0, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(5, '复制 复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:16', 977, 'ryan', 977, '2016-10-30 03:49:59', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 5, 0, 1, '', '', '', '', 26, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN');
INSERT INTO `o2kj3_k2_items` (`id`, `title`, `alias`, `catid`, `published`, `introtext`, `fulltext`, `video`, `gallery`, `extra_fields`, `extra_fields_search`, `created`, `created_by`, `created_by_alias`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `publish_up`, `publish_down`, `trash`, `access`, `ordering`, `featured`, `featured_ordering`, `image_caption`, `image_credits`, `video_caption`, `video_credits`, `hits`, `params`, `metadesc`, `metadata`, `metakey`, `plugins`, `language`) VALUES
(6, '复制 复制 复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:16', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 6, 0, 1, '', '', '', '', 0, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(7, '复制 复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:16', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 7, 0, 1, '', '', '', '', 3, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(8, '复制 新加坡国立大学杜玉泉老师报告', '2016-10-15-05-11-27', 2, 1, '<p class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 15pt; font-family: 黑体; mso-hansi-font-family: ''Times New Roman'';">学术讲座</span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 1: Mitigating shipping emissions: models and algorithms</span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size: 10.5pt;">Session 2: Recent advances in top commercial optimization solvers</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人：杜玉泉</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">（博士后</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">新加坡国立大学，</span><span lang="EN-US">assistant prof  Australian Maritime College, University of Tasmania</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">）</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">时间：</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">10</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">月</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">1</span><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">日</span> <span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">下午</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';"> 14:00-16:00</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">地点：津南校区计控楼</span><span lang="EN-US" style="font-size: 10.5pt; font-family: ''Arial'',''sans-serif''; mso-hansi-font-family: ''Times New Roman'';">329</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告简介：</span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/joomla_black.png" alt="" /></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 1 covers the operation research (optimization) issues regarding how to mitigate the shipping emissions through managerial apporaches. To create interests in a short presentation time, the speaker will omit the mathematical details and focus mainly on the description of the OR problems pertaining to ship emission reduction. </span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Session 2, on the contrary, involves detailed mathematical sophistication by introucing the most recent advances in top commercial optimization solvers, such as the distributed branch-and-bound algorithmic framework and the optimization algorithms for noncovex quadratic programming models.  </span></p>\r\n<p class="MsoNormal"><span style="font-size: 10.5pt; font-family: 宋体; mso-hansi-font-family: ''Times New Roman''; mso-ascii-font-family: Arial; mso-bidi-font-family: Arial;">报告人介绍：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">Dr. Yuquan Du obtained his B.E. in Software Engineering in 2004 at Nankai University in China. Then, he worked as a teacher and a technical specialist in Jiangxi Vocational College of Finance and Economics between 2004 and 2006. After the two-year work, he returned to Nankai University to pursue his master’s and doctor’s degrees. He obtained his D. Eng. In Control Theory and Control Engineering in June 2012. After that, he worked for Inner Mongolia University, as an assistant professor, for one year from July 2012 to Oct 2013, and for National University of Singapore, as a postdoctoral research fellow, for three years from Nov 2013 to Oct 2016. He is going to commence a lecturer (assistant prof) position at Australian Maritime College, University of Tasmania in Nov 2016.</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">His research at present concentrates on scheduling models and algorithms, logistics and supply chain management, especially on the optimization problems in ports and shipping. Dr. Du has been devoting 10 years completely to maritime studies since his first research project on port operations as a master’s student in 2006. Some of his studies gain high academic or industrial reputation, such as INFORMS President’s Pick, and Industry Mention of IBM’s Optimization Team on CPLEX. One of his paper also ranks in the MOST CITED ARTICLES since 2011 of Transportation Research Part E.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal"><span lang="EN-US">He is also enthusiastic about promoting the applications of optimization theory and solvers through his blog “Chinese OR Tea”, which is now included into the INFORMS OR/MS Blog List. This blog has attracted more than 210,000 visits since its opening in 2008.</span></p>', '', NULL, NULL, '[]', '', '2016-10-15 05:14:16', 977, 'ryan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '2016-10-15 05:01:08', '0000-00-00 00:00:00', 0, 1, 8, 0, 1, '', '', '', '', 15, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(9, '站点介绍', 'intro', 9, 1, '<p><span style="font-family: arial, tahoma, ''Microsoft Yahei'', 宋体, sans-serif; font-size: 34px; line-height: 39.1px;"><img src="images/nklogo.jpg" alt="" width="204" height="176" /><span style="line-height: 39.1px;">南</span></span><span style="font-family: arial, tahoma, ''Microsoft Yahei'', 宋体, sans-serif; font-size: 34px; line-height: 39.1px;">开</span><span style="font-family: arial, tahoma, ''Microsoft Yahei'', 宋体, sans-serif; font-size: 34px; line-height: 39.1px;">大</span><span style="font-family: arial, tahoma, ''Microsoft Yahei'', 宋体, sans-serif; font-size: 34px; line-height: 39.1px;">学大数据研究院</span></p>\r\n<div class="lemma-summary" style="clear: both; font-size: 14px; word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;">\r\n<div class="para" style="word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; zoom: 1;">南开大学大数据研究院成立于2016年9月22日，南开大学与河北省承德市政府签署战略合作协议，双方将合作建设南开大学大数据研究院。</div>\r\n</div>\r\n<div class="para" style="font-size: 14px; word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;">双方将本着“优势互补、互惠互利、务实高效、共同发展”的原则，发挥承德市的区位、资源、产业优势和南开大学的科技、人才、智力优势，推动京津大数据产业向承德地区转移，合作建设“南开大学大数据研究院(承德)”，并在技术合作研发、科技成果转化、人才交流与培养、教育事业发展、社会治理、城市管理和旅游发展等领域开展合作。</div>\r\n<div class="para" style="font-size: 14px; word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;">依照京津冀协同发展战略，天津对口帮扶承德，南开大学要将“知中国服务中国”的传统同国家战略相结合，把“大数据”作为双方合作的切入点，将数据科学与旅游、医学、产业发展、城市服务等领域结合，通过加强数据应用和数据资源的发掘，建设“大数据+”，并使之助力承德“绿色崛起”的亮点。</div>', '', NULL, NULL, '[]', '', '2016-10-15 07:08:25', 977, '', 0, '0000-00-00 00:00:00', '2016-10-15 07:13:54', 977, '2016-10-15 07:08:25', '0000-00-00 00:00:00', 0, 1, 1, 1, 1, '', '', '', '', 101, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', 'zh-CN'),
(10, '信息前沿】第十讲预告', '2016-11-12-01-31-52', 2, 1, '<p class="MsoNormal" style="line-height: 150%; word-break: break-all;" align="left"><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">第十讲题目</span> <span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">：计算机的未来</span></p>\r\n<p class="MsoNormal" style="line-height: 150%; word-break: break-all;" align="left"><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;"> </span></p>\r\n<p class="MsoNormal" align="left"><b><span lang="AR-SA" style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt; mso-fareast-language: AR-SA;">课程简介</span></b><b><span style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt;">：</span></b><span style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt;">随着人工智能的发展<span lang="EN-US">,</span>摩尔定律走到了尽头<span lang="EN-US">,</span>新的计算模式和计算技术正在发展<span lang="EN-US">,</span>本课程将会介绍计算技术的发展走向和新的计算技术方向。</span></p>\r\n<p class="MsoNormal" align="left"><b><span lang="EN-US" style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt;">IBM</span></b><b><span style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt;">讲师：</span></b><span style="font-size: 9pt; font-family: 宋体;">苏中</span></p>\r\n<p class="MsoNormal"><b><span style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: .5pt;">个人简介<span lang="EN-US">:</span></span></b> <span style="font-size: 10pt; font-family: 宋体;">苏中是</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">中国研究院的研究总监，大数据及认知计算研究方向首席科学家。在</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">2002</span><span style="font-size: 10pt; font-family: 宋体;">年获得清华大学计算机系博士学位后加入</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">。在中国研究院先后参与了文本分析、企业搜索、元数据管理、数据集成、社会化计算及信息可视化等方面的研究。他所领导的多项技术研发被</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">软件产品采用，并在国际以及国内的多次技术评估中得到第一名，也因此数次获得</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">全球研究技术成就奖，在</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">2008</span><span style="font-size: 10pt; font-family: 宋体;">，</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">2010</span><span style="font-size: 10pt; font-family: 宋体;">以及</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">2014</span><span style="font-size: 10pt; font-family: 宋体;">年获得</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">全球研究杰出技术成就奖。苏中在</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">2007</span><span style="font-size: 10pt; font-family: 宋体;">年被评为</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">发明大师，担任研究院专利评审委员会主席。迄今为止已经在国际顶级会议及期刊发表学术论文</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">60</span><span style="font-size: 10pt; font-family: 宋体;">余篇，</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">50</span><span style="font-size: 10pt; font-family: 宋体;">余项发明专利及专利申请。他目前兼任南开大学兼职教授，上海交通大学</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">APEX</span><span style="font-size: 10pt; font-family: 宋体;">实验室客座教授，</span><span lang="EN-US" style="font-size: 10pt; font-family: Arial, sans-serif;">IBM</span><span style="font-size: 10pt; font-family: 宋体;">大中华区技术专家委员会主席。</span></p>\r\n<p class="MsoNormal" align="left"><span lang="EN-US" style="font-size: 12.0pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt;"> </span></p>\r\n<p class="MsoNormal" style="line-height: 150%; word-break: break-all;" align="left"><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;"> </span><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">时间：</span> <span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">周四（</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;">11</span><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">月</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;">17</span><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">日）</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;">18:30-20:00</span></p>\r\n<p class="MsoNormal" style="line-height: 150%; word-break: break-all;" align="left"><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;"> </span><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">地点：</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;"> 5B303</span></p>\r\n<p class="MsoNormal" style="line-height: 150%; word-break: break-all;" align="left"><span lang="EN-US" style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; mso-fareast-font-family: 宋体; mso-font-kerning: 0pt;"> </span><span style="mso-bidi-font-size: 10.5pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 0pt;">欢迎广大师生参与交流！！</span><u></u></p>', '', NULL, NULL, '[]', '', '2016-11-12 01:29:54', 977, '', 0, '0000-00-00 00:00:00', '2016-11-12 01:33:39', 977, '2016-11-12 01:29:54', '0000-00-00 00:00:00', 0, 1, 9, 0, 0, '', '', '', '', 4, '{"catItemTitle":"","catItemTitleLinked":"","catItemFeaturedNotice":"","catItemAuthor":"","catItemDateCreated":"","catItemRating":"","catItemImage":"","catItemIntroText":"","catItemExtraFields":"","catItemHits":"","catItemCategory":"","catItemTags":"","catItemAttachments":"","catItemAttachmentsCounter":"","catItemVideo":"","catItemVideoWidth":"","catItemVideoHeight":"","catItemAudioWidth":"","catItemAudioHeight":"","catItemVideoAutoPlay":"","catItemImageGallery":"","catItemImageGalleryWidth":"","catItemImageGalleryHeight":"","catItemDateModified":"","catItemReadMore":"","catItemCommentsAnchor":"","catItemK2Plugins":"","itemDateCreated":"","itemTitle":"","itemFeaturedNotice":"","itemAuthor":"","itemFontResizer":"","itemPrintButton":"","itemEmailButton":"","itemSocialButton":"","itemVideoAnchor":"","itemImageGalleryAnchor":"","itemCommentsAnchor":"","itemRating":"","itemImage":"","itemImgSize":"","itemImageMainCaption":"","itemImageMainCredits":"","itemIntroText":"","itemFullText":"","itemExtraFields":"","itemDateModified":"","itemHits":"","itemCategory":"","itemTags":"","itemAttachments":"","itemAttachmentsCounter":"","itemVideo":"","itemVideoWidth":"","itemVideoHeight":"","itemAudioWidth":"","itemAudioHeight":"","itemVideoAutoPlay":"","itemVideoCaption":"","itemVideoCredits":"","itemImageGallery":"","itemImageGalleryWidth":"","itemImageGalleryHeight":"","itemNavigation":"","itemComments":"","itemTwitterButton":"","itemFacebookButton":"","itemGooglePlusOneButton":"","itemAuthorBlock":"","itemAuthorImage":"","itemAuthorDescription":"","itemAuthorURL":"","itemAuthorEmail":"","itemAuthorLatest":"","itemAuthorLatestLimit":"","itemRelated":"","itemRelatedLimit":"","itemRelatedTitle":"","itemRelatedCategory":"","itemRelatedImageSize":"","itemRelatedIntrotext":"","itemRelatedFulltext":"","itemRelatedAuthor":"","itemRelatedMedia":"","itemRelatedImageGallery":"","itemK2Plugins":""}', '', 'robots=\nauthor=', '', '', '*');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_log`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_log` (
  `status` int(11) NOT NULL,
  `response` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `o2kj3_k2_log`
--

INSERT INTO `o2kj3_k2_log` (`status`, `response`, `timestamp`) VALUES
(200, 'OK', '2016-10-15 02:49:53');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_rating`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_tags`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_tags_xref`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_tags_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagID` (`tagID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_users`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `group` (`group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o2kj3_k2_users`
--

INSERT INTO `o2kj3_k2_users` (`id`, `userID`, `userName`, `gender`, `description`, `image`, `url`, `group`, `plugins`, `ip`, `hostname`, `notes`) VALUES
(1, 977, 'Super User', 'm', '', NULL, NULL, 1, '', '::1', 'RyanZhou', '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_k2_user_groups`
--

CREATE TABLE IF NOT EXISTS `o2kj3_k2_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_languages`
--

CREATE TABLE IF NOT EXISTS `o2kj3_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `o2kj3_languages`
--

INSERT INTO `o2kj3_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 0, 1, 1),
(2, 63, 'zh-CN', '中文', '中文', 'zh-cn', 'zh_cn', '', '', '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_menu`
--

CREATE TABLE IF NOT EXISTS `o2kj3_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=134 ;

--
-- 转存表中的数据 `o2kj3_menu`
--

INSERT INTO `o2kj3_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 107, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 3, 12, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 4, 5, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 6, 7, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 8, 9, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 10, 11, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 13, 18, 0, '*', 1),
(8, 'menu', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 14, 15, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 16, 17, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 19, 24, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 25, 30, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 26, 27, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 28, 29, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 31, 32, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 35, 36, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 37, 38, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 41, 42, 0, '*', 1),
(101, 'mainmenu', '主页', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 977, '2016-11-11 17:51:58', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 43, 44, 1, '*', 0),
(102, 'main', 'COM_K2', 'com-k2', '', 'com-k2', 'index.php?option=com_k2', 'component', 0, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, '../media/k2/assets/images/system/k2_16x16.png', 0, '{}', 45, 66, 0, '', 1),
(103, 'main', 'K2_ITEMS', 'k2-items', '', 'com-k2/k2-items', 'index.php?option=com_k2&view=items', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 46, 47, 0, '', 1),
(104, 'main', 'K2_CATEGORIES', 'k2-categories', '', 'com-k2/k2-categories', 'index.php?option=com_k2&view=categories', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 48, 49, 0, '', 1),
(105, 'main', 'K2_TAGS', 'k2-tags', '', 'com-k2/k2-tags', 'index.php?option=com_k2&view=tags', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 50, 51, 0, '', 1),
(106, 'main', 'K2_COMMENTS', 'k2-comments', '', 'com-k2/k2-comments', 'index.php?option=com_k2&view=comments', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 52, 53, 0, '', 1),
(107, 'main', 'K2_USERS', 'k2-users', '', 'com-k2/k2-users', 'index.php?option=com_k2&view=users', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 54, 55, 0, '', 1),
(108, 'main', 'K2_USER_GROUPS', 'k2-user-groups', '', 'com-k2/k2-user-groups', 'index.php?option=com_k2&view=usergroups', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 56, 57, 0, '', 1),
(109, 'main', 'K2_EXTRA_FIELDS', 'k2-extra-fields', '', 'com-k2/k2-extra-fields', 'index.php?option=com_k2&view=extrafields', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 58, 59, 0, '', 1),
(110, 'main', 'K2_EXTRA_FIELD_GROUPS', 'k2-extra-field-groups', '', 'com-k2/k2-extra-field-groups', 'index.php?option=com_k2&view=extrafieldsgroups', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 60, 61, 0, '', 1),
(111, 'main', 'K2_MEDIA_MANAGER', 'k2-media-manager', '', 'com-k2/k2-media-manager', 'index.php?option=com_k2&view=media', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 62, 63, 0, '', 1),
(112, 'main', 'K2_INFORMATION', 'k2-information', '', 'com-k2/k2-information', 'index.php?option=com_k2&view=info', 'component', 0, 102, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1),
(113, 'mainmenu', '新闻', 'news', '', 'news', 'index.php?option=com_newsfeeds&view=category&id=5', 'component', -2, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_items":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_articles":"","show_link":"","show_pagination":"","show_pagination_results":"","show_feed_image":"","show_feed_description":"","show_item_description":"","feed_character_count":"0","feed_display_order":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, 'zh-CN', 0),
(114, 'chinese-menu', '介绍', 'intro', '', 'intro', 'index.php?option=com_k2&view=item&layout=item&id=9', 'component', 0, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 69, 70, 0, 'zh-CN', 0),
(115, 'chinese-menu', '新闻公告', 'news-list', '', 'news-list', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=2', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["2"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, 'zh-CN', 0),
(116, 'chinese-menu', '人才队伍', 'member', '', 'member', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=3', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["3"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 74, 0, 'zh-CN', 0),
(117, 'chinese-menu', '近期工作', 'recent-work', '', 'recent-work', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=4', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["4"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 76, 0, 'zh-CN', 0),
(118, 'chinese-menu', '科研项目', 'project', '', 'project', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=5', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["5"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 77, 78, 0, 'zh-CN', 0),
(119, 'chinese-menu', '学术论著', '2016-10-15-07-56-13', '', '2016-10-15-07-56-13', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=6', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["6"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, 'zh-CN', 0),
(120, 'chinese-menu', '教学与招生', 'teach-enrol', '', 'teach-enrol', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=7', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["7"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 88, 0, 'zh-CN', 0),
(121, 'chinese-menu', '学生名单', 'student-list', '', 'teach-enrol/student-list', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=10', 'component', 0, 120, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["10"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 82, 83, 0, 'zh-CN', 0),
(122, 'chinese-menu', '教学', 'educate', '', 'teach-enrol/educate', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=11', 'component', 1, 120, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["11"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 84, 85, 0, 'zh-CN', 0),
(123, 'chinese-menu', '招生', 'enroll', '', 'teach-enrol/enroll', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=12', 'component', 1, 120, 2, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["12"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 86, 87, 0, 'zh-CN', 0),
(124, 'chinese-menu', '合作交流', 'cooperate', '', 'cooperate', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=13', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["13"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 89, 90, 0, 'zh-CN', 0),
(125, 'chinese-menu', '联系我们', 'contact', '', 'contact', 'index.php?option=com_k2&view=itemlist&layout=category&task=category&id=8', 'component', 1, 1, 1, 10004, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"categories":["8"],"singleCatOrdering":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 92, 0, 'zh-CN', 0),
(126, 'footer-menu2', '登录', 'login', '', 'login', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"loginredirectchoice":"1","login_redirect_url":"","login_redirect_menuitem":"","logindescription_show":"1","login_description":"","login_image":"","logoutredirectchoice":"1","logout_redirect_url":"","logout_redirect_menuitem":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(127, 'footer-menu2', '主页', 'index', '', 'index', '/joomla_new', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu-anchor_rel":"","menu_image":"","menu_text":1,"menu_show":1}', 95, 96, 0, '*', 0),
(128, 'main', 'COM_DJIMAGESLIDER', 'com-djimageslider', '', 'com-djimageslider', 'index.php?option=com_djimageslider', 'component', 0, 1, 1, 10022, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_djimageslider/assets/icon-16-djimageslider.png', 0, '{}', 97, 102, 0, '', 1),
(129, 'main', 'COM_DJIMAGESLIDER_SLIDES', 'com-djimageslider-slides', '', 'com-djimageslider/com-djimageslider-slides', 'index.php?option=com_djimageslider&view=items', 'component', 0, 128, 2, 10022, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_djimageslider/assets/icon-16-menu-slides.png', 0, '{}', 98, 99, 0, '', 1),
(130, 'main', 'COM_DJIMAGESLIDER_CATEGORIES', 'com-djimageslider-categories', '', 'com-djimageslider/com-djimageslider-categories', 'index.php?option=com_categories&extension=com_djimageslider', 'component', 0, 128, 2, 10022, 0, '0000-00-00 00:00:00', 0, 1, 'class:category', 0, '{}', 100, 101, 0, '', 1),
(131, 'footer-menu3', '南开大学', 'nku', '', 'nku', 'http://www.nankai.edu.cn/', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu-anchor_rel":"","menu_image":"","menu_text":1,"menu_show":1}', 103, 104, 0, 'zh-CN', 0),
(132, 'chinese-menu', '登录', 'user-login', '', 'user-login', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 977, '2016-11-11 17:48:47', 0, 1, ' ', 0, '{"loginredirectchoice":"1","login_redirect_url":"","login_redirect_menuitem":"","logindescription_show":"1","login_description":"","login_image":"","logoutredirectchoice":"1","logout_redirect_url":"","logout_redirect_menuitem":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 105, 106, 0, 'zh-CN', 0),
(133, 'chinese-menu', '首页', 'webhome', '', 'webhome', 'http://localhost/cidewebpage/', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu-anchor_rel":"","menu_image":"","menu_text":1,"menu_show":1}', 1, 2, 0, '*', 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_menu_types`
--

CREATE TABLE IF NOT EXISTS `o2kj3_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `o2kj3_menu_types`
--

INSERT INTO `o2kj3_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 66, 'chinese-menu', '中文菜单', ''),
(3, 68, 'footer-menu2', '页脚-常用链接', ''),
(4, 83, 'footer-menu3', '页脚-友情链接', '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_messages`
--

CREATE TABLE IF NOT EXISTS `o2kj3_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `o2kj3_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_modules`
--

CREATE TABLE IF NOT EXISTS `o2kj3_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=115 ;

--
-- 转存表中的数据 `o2kj3_modules`
--

INSERT INTO `o2kj3_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"0","cache_time":"0","cachemode":"itemid"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 56, 'K2 Comments', '', '', 0, '', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_k2_comments', 1, 1, '', 0, '*'),
(88, 57, 'K2 Content', '', '', 1, 'position-12', 0, '0000-00-00 00:00:00', '2016-10-15 05:41:51', '0000-00-00 00:00:00', -2, 'mod_k2_content', 1, 1, '{"moduleclass_sfx":"","getTemplate":"Default","source":"filter","catfilter":"0","getChildren":"0","itemCount":"5","itemsOrdering":"","FeaturedItems":"1","popularityRange":"","videosOnly":"0","item":"","itemTitle":"1","itemAuthor":"1","itemAuthorAvatar":"1","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"1","itemIntroText":"1","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Small","itemVideo":"1","itemVideoCaption":"1","itemVideoCredits":"1","itemAttachments":"1","itemTags":"1","itemCategory":"1","itemDateCreated":"1","itemHits":"1","itemReadMore":"1","itemExtraFields":"0","itemCommentsCounter":"1","feed":"1","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"101","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(89, 58, 'K2 Tools', '', '', 0, '', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_k2_tools', 1, 1, '', 0, '*'),
(90, 59, 'K2 Users', '', '', 0, '', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_k2_users', 1, 1, '', 0, '*'),
(91, 60, 'K2 User', '', '', 0, '', 0, '0000-00-00 00:00:00', '2016-10-22 10:46:42', '0000-00-00 00:00:00', -2, 'mod_k2_user', 1, 1, '', 0, '*'),
(92, 61, 'K2 Quick Icons (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_quickicons', 1, 1, '', 1, '*'),
(93, 62, 'K2 Stats (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_stats', 1, 1, '', 1, '*'),
(94, 64, '导航菜单', '', '', 1, 'nav', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"chinese-menu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(95, 65, '中文菜单', '', '', 1, '', 0, '0000-00-00 00:00:00', '2016-10-15 06:40:28', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"chinese-menu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(96, 67, '当前路径', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"0","showHome":"0","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"0","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(97, 69, '页脚菜单', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '2016-10-15 12:15:18', '0000-00-00 00:00:00', -2, 'mod_footer', 1, 0, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(98, 70, '留言板', '', '<blockquote style="font-size: 12.16px; line-height: 15.808px;">\r\n<p>"We invested in these for our new home last year, and are already seeing the paybacks."</p>\r\n<small>Sally Horton</small></blockquote>\r\n<blockquote style="font-size: 12.16px; line-height: 15.808px;">\r\n<p>"I’m so excited to be living in Blue Sky and to help pilot this experimental wind energy. So cool!"</p>\r\n<small>Bart Guita</small></blockquote>\r\n<blockquote style="font-size: 12.16px; line-height: 15.808px;">\r\n<p>"I’ve been using solar power for 12 years now, and I still can’t get over watching my meter run backwards. It’s a feeling of personal success that I’m doing something so wonderful for the planet."</p>\r\n<small>Jane Levington</small></blockquote>', 1, 'right', 0, '0000-00-00 00:00:00', '2016-10-30 04:20:32', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(99, 71, '退出', '', '', 1, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 2, 1, '{"pretext":"\\u524d\\u5bfc\\u6587\\u672c","posttext":"\\u540e\\u7ee7\\u6587\\u672c\\r\\n","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(100, 72, '搜索', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"1","button_pos":"right","imagebutton":"0","button_text":"\\u641c\\u7d22","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(101, 73, '常用链接', '', '', 1, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu2","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(102, 74, 'Popular Posts', '', '', 1, 'footer-1', 0, '0000-00-00 00:00:00', '2016-10-30 02:46:42', '0000-00-00 00:00:00', -2, 'mod_articles_popular', 1, 1, '{"catid":[""],"count":"5","show_front":"1","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(103, 75, '热门新闻', '', '', 1, 'footer-1', 0, '0000-00-00 00:00:00', '2016-10-30 04:23:06', '0000-00-00 00:00:00', 1, 'mod_k2_content', 1, 1, '{"moduleclass_sfx":"","getTemplate":"Default","source":"specific","catfilter":"0","getChildren":"0","itemCount":"5","itemsOrdering":"hits","FeaturedItems":"1","popularityRange":"7","videosOnly":"0","item":"","items":["9","8","7"],"itemTitle":"1","itemAuthor":"0","itemAuthorAvatar":"0","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"0","itemIntroText":"0","itemIntroTextWordLimit":"","itemImage":"0","itemImgSize":"Small","itemVideo":"0","itemVideoCaption":"0","itemVideoCredits":"0","itemAttachments":"0","itemTags":"0","itemCategory":"0","itemDateCreated":"0","itemHits":"0","itemReadMore":"1","itemExtraFields":"0","itemCommentsCounter":"0","feed":"0","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"101","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(104, 76, 'K2 Tool', '', '', 1, 'footer-2', 0, '0000-00-00 00:00:00', '2016-10-30 04:20:32', '0000-00-00 00:00:00', -2, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"8","archiveItemsCounter":"1","archiveCategory":"2","authors_module_category":"0","authorItemsCounter":"0","authorAvatar":"0","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"0","calendarCategory":"0","home":"","seperator":"","root_id":"0","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","searchItemId":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"<?php if(count($items)): ?>\\r\\n<ul>\\r\\n<?php foreach ($items as $key=>$item):    ?>\\r\\n<li class=\\"<?php echo ($key%2) ? \\"odd\\" : \\"even\\"; if(count($items)==$key+1) echo '' lastItem''; ?>\\">\\r\\n\\u9ed8\\u8ba4\\u5185\\u5bb9\\u5f15\\u7528\\r\\n<\\/li>\\r\\n<?php endforeach; ?>\\r\\n<\\/ul>\\r\\n<?php endif; ?>","parsePhp":"1","K2Plugins":"0","JPlugins":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 77, '随机图片', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '2016-10-30 05:09:48', '0000-00-00 00:00:00', -2, 'mod_random_image', 1, 0, '{"type":"jpg","folder":"\\/images\\/random","link":"","width":"1000px","height":"200px","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(106, 79, '滑动图片', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '2016-10-30 05:13:22', '0000-00-00 00:00:00', -2, 'mod_djimageslider', 1, 1, '{"slider_source":"0","slider_type":"0","theme":"_override","link_image":"1","image_folder":"images\\/random","link":"","category":"8","show_title":"1","show_desc":"1","show_readmore":"0","readmore_text":"","link_title":"1","link_desc":"0","limit_desc":"","full_width":"0","image_width":"240","image_height":"180","fit_to":"0","image_centering":"0","visible_images":"3","space_between_images":"10","max_images":"20","sort_by":"1","css3":"1","autoplay":"1","show_buttons":"1","show_arrows":"1","show_custom_nav":"0","wcag":"1","desc_width":"","desc_bottom":"0","desc_horizontal":"0","left_arrow":"","right_arrow":"","play_button":"","pause_button":"","arrows_top":"40","arrows_horizontal":"10","idx_style":"0","effect":"Expo","effect_type":"0","duration":"","delay":"","preload":"800","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(107, 81, '滑动图片', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '2016-10-30 05:36:47', '0000-00-00 00:00:00', -2, 'mod_simple_responsive_slideshow', 1, 1, '{"jqueryLoad":"1","animation":"fade","slideDirection":"horizontal","slideshowSpeed":"7000","animationDuration":"600","flexsliderBgColor":"FFFFFF","directionNav":"1","controlNav":"1","slideshow":"1","randomize":"0","animationLoop":"1","pauseOnAction":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","file1active":"1","file1":"images\\/random\\/pic-1.jpg","file1link":"","file1caption":"pict1nlkn","file1alt":"ss","file2active":"1","file2":"images\\/random\\/pic-2.jpg","file2link":"","file2caption":"","file2alt":"","file3active":"1","file3":"images\\/random\\/pic-4.jpg","file3link":"","file3caption":"","file3alt":"","file4active":"1","file4":"images\\/random\\/pic-5.jpg","file4link":"","file4caption":"","file4alt":"","file5active":"0","file5":"media\\/simple-responsive-slideshow\\/demo\\/slide5.jpg","file5link":"","file5caption":"","file5alt":"","file6active":"0","file6":"","file6link":"","file6caption":"","file6alt":"","file7active":"0","file7":"","file7link":"","file7caption":"","file7alt":"","file8active":"0","file8":"","file8link":"","file8caption":"","file8alt":"","file9active":"0","file9":"","file9link":"","file9caption":"","file9alt":"","file10active":"0","file10":"","file10link":"","file10caption":"","file10alt":"","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(108, 82, '滑动图片', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_je_camera', 1, 0, '{"jQuery":"1","imgHeight":"400","alignment":"center","autoPlay":"true","cameraSkin":"black","fx":"random","slideOn":"random","cols":"6","rows":"4","slicedCols":"12","slicedRows":"8","easing":"easeInOutExpo","caption":"fadeFromBottom","time":"5000","transPeriod":"1500","pagination":"true","navigation":"true","navigationHover":"true","playPause":"true","pauseOnClick":"true","hover":"true","loader":"pie","loaderColor":"#EEEEEE","loaderBgColor":"#222222","pieDiameter":"38","piePosition":"rightTop","barPosition":"bottom","barDirection":"leftToRight","thumbnails":"true","thumbWidth":"100","thumbHeight":"100","thumbQuality":"100","thumbAlign":"t","Image1":"images\\/random\\/pic-1.jpg","Video1":"","Link1":"","Text1":"This is pic-1","Image2":"images\\/random\\/pic-2.jpg","Video2":"","Link2":"","Text2":"This is pic-2","Image3":"images\\/random\\/pic-3.jpg","Video3":"","Link3":"","Text3":"This is pic-3","Image4":"images\\/random\\/pic-4.jpg","Video4":"","Link4":"","Text4":"This is pic-4","Image5":"","Video5":"","Link5":"","Text5":"","Image6":"","Video6":"","Link6":"","Text6":"","Image7":"","Video7":"","Link7":"","Text7":"","Image8":"","Video8":"","Link8":"","Text8":"","Image9":"","Video9":"","Link9":"","Text9":"","Image10":"","Video10":"","Link10":"","Text10":"","Image11":"","Video11":"","Link11":"","Text11":"","Image12":"","Video12":"","Link12":"","Text12":"","Image13":"","Video13":"","Link13":"","Text13":"","Image14":"","Video14":"","Link14":"","Text14":"","Image15":"","Video15":"","Link15":"","Text15":"","Image16":"","Video16":"","Link16":"","Text16":"","Image17":"","Video17":"","Link17":"","Text17":"","Image18":"","Video18":"","Link18":"","Text18":"","Image19":"","Video19":"","Link19":"","Text19":"","Image20":"","Video20":"","Link20":"","Text20":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(109, 84, '友情链接', '', '', 1, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu3","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(110, 85, '网站统计', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '2016-11-01 11:12:20', '0000-00-00 00:00:00', -2, 'mod_stats', 1, 1, '{"serverinfo":"1","siteinfo":"1","counter":"1","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 86, '联系我们', '', '<p>地址：待定待定待定待定待定待定</p>\r\n<p>邮箱：dakhjk@nku.cn</p>\r\n<p>电话：010-12345678</p>', 1, 'footer-4', 0, '0000-00-00 00:00:00', '2016-11-01 10:59:26', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'zh-CN'),
(112, 87, 'Oukan Baidu Map', '', '', 1, 'footer-4', 0, '0000-00-00 00:00:00', '2016-11-01 11:12:32', '0000-00-00 00:00:00', -2, 'mod_oukan_baidumap', 1, 1, '{"classname":"","x":"117.34914","y":"38.992942","level":"18","title":"","mapcontent":"","width":"300px","height":"300px","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(113, 88, '百度地图模块', '', '', 1, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_baidumap', 1, 1, '{"point_c":"117.34914,38.992942","level":"18","width":"300px","height":"300px","map_zoom":"1","zoom_style":"LARGE","zoom_position":"TOP_LEFT","thumb":"1","thumb_status":"1","thumb_position":"BOTTOM_RIGHT","scale":"1","scale_unit":"0","scale_position":"BOTTOM_LEFT","mouse":"1","keyboard":"1","drag":"1","double":"1","marker_icon":"21","point_marker":"","marker_title":"","marker_content":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(114, 89, '登录', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_modules_menu`
--

CREATE TABLE IF NOT EXISTS `o2kj3_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `o2kj3_modules_menu`
--

INSERT INTO `o2kj3_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(88, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, -114),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 101),
(106, 101),
(107, 101),
(108, 101),
(109, 0),
(110, 101),
(111, 0),
(114, 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `o2kj3_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_overrider`
--

CREATE TABLE IF NOT EXISTS `o2kj3_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `o2kj3_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `o2kj3_postinstall_messages`
--

INSERT INTO `o2kj3_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_redirect_links`
--

CREATE TABLE IF NOT EXISTS `o2kj3_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_schemas`
--

CREATE TABLE IF NOT EXISTS `o2kj3_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `o2kj3_schemas`
--

INSERT INTO `o2kj3_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.6.0-2016-06-05'),
(10022, '2.0');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_session`
--

CREATE TABLE IF NOT EXISTS `o2kj3_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `o2kj3_session`
--

INSERT INTO `o2kj3_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('7jiiee72k89dp2mqm60siv2n06', 0, 1, '1478947431', 'joomla|s:644:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTozMjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE0Nzg5NDcxNDg7czo0OiJsYXN0IjtpOjE0Nzg5NDc0MjY7czozOiJub3ciO2k6MTQ3ODk0NzQzMTt9czo1OiJ0b2tlbiI7czozMjoiVVZBdVVqMzVzVXQzN0pnV3UyZ3NSWlFsYUV5YlVUN2QiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_tags`
--

CREATE TABLE IF NOT EXISTS `o2kj3_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o2kj3_tags`
--

INSERT INTO `o2kj3_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 977, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_template_styles`
--

CREATE TABLE IF NOT EXISTS `o2kj3_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `o2kj3_template_styles`
--

INSERT INTO `o2kj3_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'template', 0, '0', 'ryantemplate - 默认', '{}'),
(10, 't3_blank', 0, '0', 't3_blank - 默认', '{}'),
(11, 't3_bs3_blank', 0, '1', 't3_bs3_blank - 默认', '{"t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"0","minify":"0","minify_js":"0","minify_js_tool":"jsmin","minify_exclude":"","link_titles":"","theme":"","logotype":"text","sitename":"\\u5357\\u5f00\\u5927\\u5b66\\u5927\\u6570\\u636e\\u7814\\u7a76\\u9662","slogan":"Institute of Big Date Technology,NKU","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"my-layout","sublayout":"","mm_type":"chinese-menu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":"fading","navigation_animation_duration":"400","mm_config":"{\\"chinese-menu\\":{\\"item-120\\":{\\"sub\\":{\\"rows\\":[[{\\"item\\":122,\\"width\\":12}]]}},\\"item-132\\":{\\"sub\\":{\\"rows\\":[[{\\"position\\":\\"114\\",\\"width\\":12}]]},\\"hidewcol\\":1}}}","navigation_collapse_enable":"1","addon_offcanvas_enable":"0","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":"","snippet_close_head":"","snippet_open_body":"","snippet_close_body":"","snippet_debug":"0"}');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_ucm_base`
--

CREATE TABLE IF NOT EXISTS `o2kj3_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_ucm_content`
--

CREATE TABLE IF NOT EXISTS `o2kj3_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_ucm_history`
--

CREATE TABLE IF NOT EXISTS `o2kj3_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `o2kj3_ucm_history`
--

INSERT INTO `o2kj3_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 1, 1, '', '2016-11-02 07:30:35', 977, 13671, 'ed4759cd838a6d19c01c279cc22846962e2f3da4', '{"id":1,"asset_id":90,"title":"\\u5b66\\u672f\\u8bb2\\u5ea7\\u901a\\u77e5 ","alias":"2016-11-02-07-30-35","introtext":"<p class=\\"MsoNormal\\" style=\\"margin: 0cm 0cm 0pt;\\"><b style=\\"mso-bidi-font-weight: normal;\\"><span style=\\"font-size: 14pt; font-family: \\u9ed1\\u4f53; mso-bidi-font-size: 12.0pt;\\">\\u9898<span lang=\\"EN-US\\"><span style=\\"mso-spacerun: yes;\\">\\u00a0\\u00a0\\u00a0 <\\/span><\\/span>\\u76ee\\uff1a<\\/span><\\/b><span style=\\"font-size: 14pt; font-family: \\u9ed1\\u4f53; mso-bidi-font-size: 12.0pt;\\">\\u591a\\u5a92\\u4f53\\u5927\\u6570\\u636e\\u8ba1\\u7b97<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin: 7.8pt 0cm; mso-para-margin-top: .5gd; mso-para-margin-right: 0cm; mso-para-margin-bottom: .5gd; mso-para-margin-left: 0cm;\\"><b style=\\"mso-bidi-font-weight: normal;\\"><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u8bb2\\u8005\\u4fe1\\u606f\\uff1a\\u6731\\u6587\\u6b66<\\/span><\\/b><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\uff0c\\u6e05\\u534e\\u5927\\u5b66\\u8ba1\\u7b97\\u673a\\u7cfb\\u526f\\u4e3b\\u4efb\\u3001\\u6e05\\u534e<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">-<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u4f2f\\u514b\\u5229\\u6df1\\u5733\\u5b66\\u9662\\u4fe1\\u606f\\u79d1\\u5b66\\u4e0e\\u5927\\u6570\\u636e\\u4e2d\\u5fc3\\u4e3b\\u4efb\\u3001\\u6e05\\u534e\\u5927\\u5b66\\u6570\\u636e\\u79d1\\u5b66\\u7814\\u7a76\\u9662\\u9996\\u5e2d\\u79d1\\u5b66\\u5bb6\\uff0c\\u56fd\\u5bb6\\u201c\\u5343\\u4eba\\u8ba1\\u5212\\u201d\\u7279\\u8058\\u4e13\\u5bb6\\uff0c\\u56fd\\u5bb6<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">973<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u9879\\u76ee\\u9996\\u5e2d\\u79d1\\u5b66\\u5bb6\\u3002<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">IEEE Fellow<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u3001<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">SPIE Fellow<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u3001<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">ACM Distinguished Scientist<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u3002\\u66fe\\u4efb\\u5fae\\u8f6f\\u4e9a\\u6d32\\u7814\\u7a76\\u9662\\u4e3b\\u4efb\\u7814\\u7a76\\u5458\\uff0c\\u82f1\\u7279\\u5c14\\u4e2d\\u56fd\\u7814\\u7a76\\u9662\\u9996\\u5e2d\\u79d1\\u5b66\\u5bb6\\uff0c\\u53ca\\u7f8e\\u56fd\\u8d1d\\u5c14\\u5b9e\\u9a8c\\u5ba4\\u7814\\u7a76\\u5458\\u7b49\\u804c\\u3002\\u73b0\\u4e3b\\u8981\\u4ece\\u4e8b\\u4e09\\u5143\\u7a7a\\u95f4\\u5927\\u6570\\u636e\\u8ba1\\u7b97\\u3001\\u591a\\u5a92\\u4f53\\u5927\\u6570\\u636e\\u8ba1\\u7b97\\u7b49\\u5de5\\u4f5c\\u3002\\u5728\\u591a\\u5a92\\u4f53\\u8ba1\\u7b97\\u3001\\u901a\\u4fe1\\u53ca\\u7f51\\u7edc\\u7b49\\u7814\\u7a76\\u9886\\u57df\\u53d1\\u8868\\u9ad8\\u6c34\\u5e73\\u56fd\\u9645\\u8bba\\u6587<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">260<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u4f59\\u7bc7\\u3002\\u88ab\\u4efb\\u547d\\u4e3a\\u4e0b\\u4e00\\u5c4a<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">IEEE Transactions on Multimedia <\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u4e3b\\u7f16\\u3002\\u66fe<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">6<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u6b21\\u83b7<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">ACM<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u53ca<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">IEEE<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u7b49\\u56fd\\u9645\\u6700\\u4f73\\u8bba\\u6587\\u5956\\u3002\\u83b7<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">2012<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u5e74\\u5ea6\\u56fd\\u5bb6\\u81ea\\u7136\\u79d1\\u5b66\\u4e8c\\u7b49\\u5956\\uff08\\u6392\\u540d\\u7b2c<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">2<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\uff09\\u3002<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin: 7.8pt 0cm; mso-para-margin-top: .5gd; mso-para-margin-right: 0cm; mso-para-margin-bottom: .5gd; mso-para-margin-left: 0cm;\\"><b style=\\"mso-bidi-font-weight: normal;\\"><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u62a5\\u544a\\u4fe1\\u606f<\\/span><\\/b><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\uff1a\\u76d1\\u63a7\\u56fe\\u50cf\\u89c6\\u9891\\u6570\\u636e\\u6b63\\u5448\\u73b0\\u51fa\\u7206\\u70b8\\u6027\\u7684\\u589e\\u957f\\uff0c\\u6839\\u636e<\\/span><span lang=\\"EN-US\\" style=\\"font-size: 12pt; font-family: ''Times New Roman'',''serif''; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt;\\">IDC<\\/span><span style=\\"font-size: 12pt; font-family: \\u5b8b\\u4f53; mso-ascii-font-family: ''Times New Roman''; mso-fareast-font-family: \\u5b8b\\u4f53; mso-fareast-theme-font: minor-fareast; mso-hansi-font-family: Calibri; mso-hansi-theme-font: minor-latin; mso-bidi-font-size: 11.0pt; mso-bidi-font-family: ''Times New Roman'';\\">\\u7684\\u7814\\u7a76\\u62a5\\u544a\\uff0c\\u5927\\u6570\\u636e\\u4e2d\\u7684\\u4e00\\u534a\\u662f\\u76d1\\u63a7\\u56fe\\u50cf\\u89c6\\u9891\\uff0c\\u5df2\\u7ecf\\u6210\\u4e3a\\u5927\\u6570\\u636e\\u65f6\\u4ee3\\u7684\\u91cd\\u8981\\u6570\\u636e\\u5bf9\\u8c61\\u3002\\u7136\\u800c\\u7531\\u4e8e\\u56fe\\u50cf\\u89c6\\u9891\\u6570\\u636e\\u672c\\u8eab\\u7684\\u975e\\u7ed3\\u6784\\u5316\\u7b49\\u7279\\u6027\\uff0c\\u7ed9\\u76d1\\u63a7\\u56fe\\u50cf\\u89c6\\u9891\\u6570\\u636e\\u7684\\u5904\\u7406\\u548c\\u5206\\u6790\\u5e26\\u6765\\u5de8\\u5927\\u6311\\u6218\\uff0c\\u5177\\u6709\\u6781\\u5176\\u91cd\\u8981\\u7684\\u7406\\u8bba\\u610f\\u4e49\\u4e0e\\u5341\\u5206\\u8feb\\u5207\\u7684\\u5e94\\u7528\\u9700\\u6c42\\u3002\\u672c\\u62a5\\u544a\\u5c06\\u7784\\u51c6\\u56fd\\u5bb6\\u548c\\u793e\\u4f1a\\u516c\\u5171\\u5b89\\u5168\\u7684\\u91cd\\u5927\\u6218\\u7565\\u9700\\u6c42\\uff0c\\u4ee5\\u56fe\\u50cf\\u89c6\\u9891\\u5927\\u6570\\u636e\\u4e3a\\u4e3b\\u8981\\u7814\\u7a76\\u5bf9\\u8c61\\uff0c\\u56f4\\u7ed5\\u56fe\\u50cf\\u89c6\\u9891\\u5927\\u6570\\u636e\\u9ad8\\u6548\\u8868\\u8fbe\\u4e0e\\u538b\\u7f29\\u3001\\u89c6\\u89c9\\u5bf9\\u8c61\\u611f\\u77e5\\u4e0e\\u8de8\\u57df\\u5173\\u8054\\u5206\\u6790\\u3001\\u591a\\u5143\\u5f02\\u6784\\u4fe1\\u606f\\u6620\\u5c04\\u7b49\\u79d1\\u5b66\\u95ee\\u9898\\uff0c\\u9610\\u8ff0\\u56fe\\u50cf\\u89c6\\u9891\\u5927\\u6570\\u636e\\u9ad8\\u6548\\u8868\\u8fbe\\u4e0e\\u6df1\\u5ea6\\u8ba1\\u7b97\\u7406\\u8bba\\u65b9\\u6cd5\\u4e0e\\u6280\\u672f\\u4f53\\u7cfb\\uff0c\\u4e3a\\u56fd\\u5bb6\\u5927\\u6570\\u636e\\u6218\\u7565\\u548c\\u667a\\u6167\\u57ce\\u5e02\\u7ba1\\u7406\\u5e94\\u7528\\u63d0\\u4f9b\\u6709\\u529b\\u652f\\u6491\\u3002<\\/span><u><\\/u><\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-11-02 07:30:35","created_by":"977","created_by_alias":"","modified":"2016-11-02 07:30:35","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-11-02 07:30:35","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"info_block_show_title\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":1,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_updates`
--

CREATE TABLE IF NOT EXISTS `o2kj3_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates' AUTO_INCREMENT=385 ;

--
-- 转存表中的数据 `o2kj3_updates`
--

INSERT INTO `o2kj3_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 8, 0, 'JA University Template for J25 & J32', '', 'ja_university', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_university.xml', '', ''),
(2, 8, 0, 'JA University T3 template', '', 'ja_university_t3', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_university_t3.xml', '', ''),
(3, 8, 0, 'JA Vintas Template for J25 & J31', '', 'ja_vintas', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_vintas.xml', '', ''),
(4, 8, 0, 'JA Wall Template for J25 & J34', '', 'ja_wall', 'template', '', 0, '1.2.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_wall.xml', '', ''),
(5, 8, 0, 'JA ZiteTemplate', '', 'ja_zite', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_zite.xml', '', ''),
(6, 8, 0, 'JA Bookmark plugin for Joomla 1.6.x', '', 'jabookmark', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jabookmark.xml', '', ''),
(7, 8, 0, 'JA Comment plugin for Joomla 1.6.x', '', 'jacomment', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacomment.xml', '', ''),
(8, 8, 0, 'JA Comment Off Plugin for Joomla 1.6', '', 'jacommentoff', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommentoff.xml', '', ''),
(9, 8, 0, 'JA Comment On Plugin for Joomla 1.6', '', 'jacommenton', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommenton.xml', '', ''),
(10, 8, 0, 'JA Content Extra Fields for Joomla 1.6', '', 'jacontentextrafields', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml', '', ''),
(11, 8, 0, 'JA Disqus Debate Echo plugin for Joomla 1.6.x', '', 'jadisqus_debate_echo', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml', '', ''),
(12, 8, 0, 'JA System Google Map plugin for Joomla 1.6.x', '', 'jagooglemap', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagooglemap.xml', '', ''),
(13, 8, 0, 'JA Google Translate plugin for Joomla 1.6.x', '', 'jagoogletranslate', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml', '', ''),
(14, 8, 0, 'JA Highslide plugin for Joomla 1.6.x', '', 'jahighslide', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jahighslide.xml', '', ''),
(15, 8, 0, 'JA K2 Search Plugin for Joomla 2.5', '', 'jak2_filter', 'plugin', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/jak2_filter.xml', '', ''),
(16, 8, 0, 'JA K2 Extra Fields Plugin for Joomla 2.5', '', 'jak2_indexing', 'plugin', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml', '', ''),
(17, 8, 0, 'JA Load module Plugin for Joomla 2.5', '', 'jaloadmodule', 'plugin', 'jaloadmodule', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml', '', ''),
(18, 8, 0, 'JA System Nrain plugin for Joomla 1.6.x', '', 'janrain', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/janrain.xml', '', ''),
(19, 8, 0, 'JA Popup plugin for Joomla 1.6', '', 'japopup', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/japopup.xml', '', ''),
(20, 8, 0, 'JA System Social plugin for Joomla 1.7', '', 'jasocial', 'file', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/jasocial.xml', '', ''),
(21, 8, 0, 'JA T3 System plugin for Joomla 1.6', '', 'jat3', 'plugin', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/jat3.xml', '', ''),
(22, 8, 0, 'JA Tabs plugin for Joomla 1.6.x', '', 'jatabs', 'plugin', 'jatabs', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/jatabs.xml', '', ''),
(23, 8, 0, 'JA Typo plugin For Joomla 1.6', '', 'jatypo', 'plugin', 'jatypo', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jatypo.xml', '', ''),
(24, 8, 0, 'Jomsocial Theme 3.x for JA Social', '', 'jomsocial_theme_social', 'custom', '', 0, '4.1.x', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social.xml', '', ''),
(25, 8, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16', 'file', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml', '', ''),
(26, 8, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16_26', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml', '', ''),
(27, 8, 0, 'JShopping Template for Ja Orisite', '', 'jshopping_theme_orisite', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml', '', ''),
(28, 8, 0, 'JA Tiris Jshopping theme for J25 & J3x', '', 'jshopping_theme_tiris', 'custom', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml', '', ''),
(29, 8, 0, 'Theme for Jshopping j17', '', 'jshopping_theme_tiris_j17', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml', '', ''),
(30, 8, 0, 'JA Kranos kunena theme for Joomla 3.x', '', 'kunena_theme_kranos_j17', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml', '', ''),
(31, 8, 0, 'Kunena Template for JA Mendozite', '', 'kunena_theme_mendozite', 'custom', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml', '', ''),
(32, 8, 0, 'JA Mitius Kunena Theme for Joomla 25 ', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml', '', ''),
(33, 8, 0, 'Kunena theme for JA Nex J2.5', '', 'kunena_theme_nex_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml', '', ''),
(34, 8, 0, 'Kunena theme for JA Nex T3', '', 'kunena_theme_nex_t3', 'custom', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_t3.xml', '', ''),
(35, 8, 0, 'Kunena Template for Ja Orisite', '', 'kunena_theme_orisite', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml', '', ''),
(36, 8, 0, 'Kunena theme for ja PlayMag', '', 'kunena_theme_playmag', 'custom', '', 0, '1.1.6', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_playmag.xml', '', ''),
(37, 8, 0, 'Kunena theme for JA Social T3', '', 'kunena_theme_social', 'custom', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social.xml', '', ''),
(38, 8, 0, 'Kunena theme for Joomla 2.5', '', 'kunena_theme_social_j16', 'custom', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml', '', ''),
(39, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.6.4', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', ''),
(40, 8, 0, 'Kunena theme for ja Techzone', '', 'kunena_theme_techzone', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_techzone.xml', '', ''),
(41, 8, 0, 'JA Tiris kunena theme for Joomla 2.5', '', 'kunena_theme_tiris_j16', 'custom', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml', '', ''),
(42, 8, 0, 'JA Bookshop Theme for Mijoshop V2', '', 'mijoshop_theme_bookshop', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_bookshop.xml', '', ''),
(43, 8, 0, 'JA Decor Theme for Mijoshop', '', 'mijoshop_theme_decor', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_decor.xml', '', ''),
(44, 8, 0, 'JA Decor Theme for Mijoshop V3', '', 'mijoshop_theme_decor_v3', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_decor_v3.xml', '', ''),
(45, 8, 0, 'JA ACM Module', '', 'mod_ja_acm', 'module', '', 0, '2.1.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_acm.xml', '', ''),
(46, 8, 0, 'JA Jobs Tags module for Joomla 2.5', '', 'mod_ja_jobs_tags', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml', '', ''),
(47, 8, 0, 'JA Accordion Module for J25 & J34', '', 'mod_jaaccordion', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml', '', ''),
(48, 8, 0, 'JA Animation module for Joomla 2.5 & 3.2', '', 'mod_jaanimation', 'module', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml', '', ''),
(49, 8, 0, 'JA Bulletin Module for J3.x', '', 'mod_jabulletin', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml', '', ''),
(50, 8, 0, 'JA Latest Comment Module for Joomla 2.5 & 3.3', '', 'mod_jaclatest_comments', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml', '', ''),
(51, 8, 0, 'JA Content Popup Module for J25 & J34', '', 'mod_jacontentpopup', 'module', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml', '', ''),
(52, 8, 0, 'JA Content Scroll module for Joomla 1.6', '', 'mod_jacontentscroll', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml', '', ''),
(53, 8, 0, 'JA Contenslider module for Joomla 1.6', '', 'mod_jacontentslide', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml', '', ''),
(54, 3, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/hy-AM_details.xml', '', ''),
(55, 8, 0, 'JA Content Slider Module for J25 & J34', '', 'mod_jacontentslider', 'module', '', 0, '2.7.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslider.xml', '', ''),
(56, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.4.1.2', '', 'https://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(57, 8, 0, 'JA CountDown Module for Joomla 2.5 & 3.4', '', 'mod_jacountdown', 'module', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml', '', ''),
(58, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.6.0.1', '', 'https://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(59, 8, 0, 'JA Facebook Activity Module for J25 & J30', '', 'mod_jafacebookactivity', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml', '', ''),
(60, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(61, 8, 0, 'JA Facebook Like Box Module for Joonla 25 & 34', '', 'mod_jafacebooklikebox', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml', '', ''),
(62, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(63, 8, 0, 'JA Featured Employer module for Joomla 2.5', '', 'mod_jafeatured_employer', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml', '', ''),
(64, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(65, 8, 0, 'JA Filter Jobs module for Joomla 2.5', '', 'mod_jafilter_jobs', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml', '', ''),
(66, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/gl-ES_details.xml', '', ''),
(67, 8, 0, 'JA flowlist module for Joomla 2.5 & 3.0', '', 'mod_jaflowlist', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml', '', ''),
(68, 3, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/ka-GE_details.xml', '', ''),
(69, 8, 0, 'JA Google chart 2', '', 'mod_jagooglechart_2', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jagooglechart_2.xml', '', ''),
(70, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.6.3.2', '', 'https://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(71, 8, 0, 'JAEC Halloween Module for Joomla 2.5 & 3', '', 'mod_jahalloween', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml', '', ''),
(72, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(73, 8, 0, 'JA Image Hotspot Module for Joomla 2.5 & 3.4', '', 'mod_jaimagehotspot', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaimagehotspot.xml', '', ''),
(74, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'https://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(75, 8, 0, 'JA static module for Joomla 2.5', '', 'mod_jajb_statistic', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml', '', ''),
(76, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(77, 8, 0, 'JA Jobboard Menu module for Joomla 2.5', '', 'mod_jajobboard_menu', 'module', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml', '', ''),
(78, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(79, 8, 0, 'JA Jobs Counter module for Joomla 2.5', '', 'mod_jajobs_counter', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml', '', ''),
(80, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.6.4.2', '', 'https://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(81, 8, 0, 'JA Jobs Map module for Joomla 2.5', '', 'mod_jajobs_map', 'module', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml', '', ''),
(82, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.1', '', 'https://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(83, 8, 0, 'JA K2 Fillter Module for Joomla 2.5', '', 'mod_jak2_filter', 'module', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml', '', ''),
(84, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.4.4.2', '', 'https://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(85, 8, 0, 'JA K2 Filter Module for J25 & J3.x', '', 'mod_jak2filter', 'module', '', 0, '1.2.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', '', ''),
(86, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(87, 8, 0, 'JA K2 Timeline', '', 'mod_jak2timeline', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml', '', ''),
(88, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(89, 8, 0, 'JA Latest Resumes module for Joomla 2.5', '', 'mod_jalatest_resumes', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml', '', ''),
(90, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(91, 8, 0, 'JA List Employer module for Joomla 2.5', '', 'mod_jalist_employers', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml', '', ''),
(92, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(93, 8, 0, 'JA List Jobs module for Joomla 2.5', '', 'mod_jalist_jobs', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml', '', ''),
(94, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(95, 8, 0, 'JA List Resumes module for Joomla 2.5', '', 'mod_jalist_resumes', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml', '', ''),
(96, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.6.0.1', '', 'https://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(97, 8, 0, 'JA Login module for J25 & J3x', '', 'mod_jalogin', 'module', '', 0, '2.6.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml', '', ''),
(98, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(99, 8, 0, 'JA Masshead Module for J25 & J34', '', 'mod_jamasshead', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml', '', ''),
(100, 3, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/km-KH_details.xml', '', ''),
(101, 8, 0, 'JA News Featured Module for J25 & J34', '', 'mod_janews_featured', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml', '', ''),
(102, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(103, 8, 0, 'JA Newsflash module for Joomla 1.6.x', '', 'mod_janewsflash', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml', '', ''),
(104, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.6.2.2', '', 'https://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(105, 8, 0, 'JA Newsmoo module for Joomla 1.6.x', '', 'mod_janewsmoo', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml', '', ''),
(106, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(107, 8, 0, 'JA News Pro Module for J25 & J3x', '', 'mod_janewspro', 'module', '', 0, '2.6.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml', '', ''),
(108, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(109, 8, 0, 'JA Newsticker Module for J3x', '', 'mod_janewsticker', 'module', '', 0, '2.6.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml', '', ''),
(110, 3, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.2.1', '', 'https://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(111, 8, 0, 'JA Quick Contact Module for J3.x', '', 'mod_jaquickcontact', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml', '', ''),
(112, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(113, 8, 0, 'JA Recent Viewed Jobs module for Joomla 2.5', '', 'mod_jarecent_viewed_jobs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml', '', ''),
(114, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(115, 8, 0, 'JA SideNews Module for J25 & J34', '', 'mod_jasidenews', 'module', '', 0, '2.6.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasidenews.xml', '', ''),
(116, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.6.4.3', '', 'https://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(117, 8, 0, 'JA Slideshow Module for Joomla 2.5 & 3.x', '', 'mod_jaslideshow', 'module', '', 0, '2.7.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml', '', ''),
(118, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.6.2.2', '', 'https://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(119, 8, 0, 'JA Slideshow Lite Module for J25 & J3.4', '', 'mod_jaslideshowlite', 'module', '', 0, '1.2.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml', '', ''),
(120, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(121, 8, 0, 'JA Soccerway Module for J25 & J33', '', 'mod_jasoccerway', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml', '', ''),
(122, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(123, 8, 0, 'JA Social Locker module', '', 'mod_jasocial_locker', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasocial_locker.xml', '', ''),
(124, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(125, 8, 0, 'JA Tab module for Joomla 2.5', '', 'mod_jatabs', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml', '', ''),
(126, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(127, 8, 0, 'JA Toppanel Module for Joomla 2.5 & Joomla 3.4', '', 'mod_jatoppanel', 'module', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml', '', ''),
(128, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(129, 8, 0, 'JA Twitter Module for J25 & J3.4', '', 'mod_jatwitter', 'module', '', 0, '2.6.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', '', ''),
(130, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(131, 8, 0, 'JA List of Voices Module for J2.5 & J3.x', '', 'mod_javlist_voices', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml', '', ''),
(132, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(133, 8, 0, 'JA VMProducts Module', '', 'mod_javmproducts', 'module', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_javmproducts.xml', '', ''),
(134, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(135, 8, 0, 'JA Voice  Work Flow Module for J2.5 & J3.x', '', 'mod_javwork_flow', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml', '', ''),
(136, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(137, 8, 0, 'JA Amazon S3 Button Plugin for joomla 2.5 & 3.x', '', 'jaamazons3', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml', '', ''),
(138, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.3.0.1', '', 'https://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(139, 8, 0, 'JA AVTracklist Button plugin for J2.5 & J3.3', '', 'jaavtracklist', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml', '', ''),
(140, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'https://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(141, 8, 0, 'JA Comment Off Plugin for Joomla 2.5 & 3.3', '', 'jacommentoff', 'plugin', 'button', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml', '', ''),
(142, 3, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/eu-ES_details.xml', '', ''),
(143, 8, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.3', '', 'jacommenton', 'plugin', 'button', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', '', ''),
(144, 3, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.2', '', 'https://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(145, 8, 0, 'JA Amazon S3 System plugin for joomla 2.5 & 3.x', '', 'plg_jaamazons3', 'plugin', 'plg_jaamazons3', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml', '', ''),
(146, 3, 0, 'German DE', '', 'pkg_de-DE', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(147, 8, 0, 'JA AVTracklist plugin for J2.5 & J3.x', '', 'plg_jaavtracklist', 'plugin', 'plg_jaavtracklist', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaavtracklist.xml', '', ''),
(148, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(149, 8, 0, 'JA Bookmark plugin for J3.x', '', 'plg_jabookmark', 'plugin', 'plg_jabookmark', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_jabookmark.xml', '', ''),
(150, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(151, 8, 0, 'JA Comment Plugin for Joomla 2.5 & 3.3', '', 'plg_jacomment', 'plugin', 'plg_jacomment', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_jacomment.xml', '', ''),
(152, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(153, 8, 0, 'JA Disqus Debate Echo plugin for J3x', '', 'debate_echo', 'plugin', 'jadisqus', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jadisqus_debate_echo.xml', '', ''),
(154, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(155, 8, 0, 'JA Google Storage Plugin for j25 & j30', '', 'plg_jagooglestorage', 'plugin', 'plg_jagooglestorage', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagooglestorage.xml', '', ''),
(156, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.6.3.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(157, 8, 0, 'JA Translate plugin for Joomla 1.6.x', '', 'plg_jagoogletranslate', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagoogletranslate.xml', '', ''),
(158, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'https://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(159, 8, 0, 'JA Megafilter Virturemart Plugin', '', 'virtuemart', 'plugin', 'jamegafilter', 0, '1.0.0 Beta 1', '', 'http://update.joomlart.com/service/tracking/j16/plg_jamegafilter_virtuemart.xml', '', ''),
(160, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(161, 8, 0, 'JA Thumbnail Plugin for J25 & J3', '', 'plg_jathumbnail', 'plugin', 'plg_jathumbnail', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_jathumbnail.xml', '', ''),
(162, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(163, 8, 0, 'JA Tooltips plugin for Joomla 1.6.x', '', 'plg_jatooltips', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatooltips.xml', '', ''),
(164, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(165, 8, 0, 'JA Typo Button Plugin for J25 & J3x', '', 'plg_jatypobutton', 'plugin', 'plg_jatypobutton', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatypobutton.xml', '', ''),
(166, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.1', '', 'https://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(167, 8, 0, 'JA K2 Filter Plg for J25 & J3.x', '', 'jak2filter', 'plugin', 'k2', 0, '1.2.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml', '', ''),
(168, 3, 0, 'English CA', '', 'pkg_en-CA', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(169, 8, 0, 'JA K2 Timeline Plugin', '', 'jak2timeline', 'plugin', 'k2', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2timeline.xml', '', ''),
(170, 3, 0, 'French CA', '', 'pkg_fr-CA', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(171, 8, 0, 'Multi Captcha Engine Plugin for J3.x', '', 'captcha_engine', 'plugin', 'multiple', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_multiple_captcha_engine.xml', '', ''),
(172, 3, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.3.0.2', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(173, 8, 0, 'JA JobBoard Payment Plugin Authorize for Joomla 2.5', '', 'plg_payment_jajb_authorize_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_authorize_25.xml', '', ''),
(174, 3, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.1', '', 'https://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(175, 8, 0, 'JA JobBoard Payment Plugin MoneyBooker for Joomla 2.5', '', 'plg_payment_jajb_moneybooker_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_moneybooker_25.xml', '', ''),
(176, 3, 0, 'Dari Persian', '', 'pkg_prs-AF', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/prs-AF_details.xml', '', ''),
(177, 8, 0, 'JA JobBoard Payment Plugin Paypal for Joomla 2.5', '', 'plg_payment_jajb_paypal_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_paypal_25.xml', '', ''),
(178, 3, 0, 'Turkmen', '', 'pkg_tk-TM', 'package', '', 0, '3.5.0.2', '', 'https://update.joomla.org/language/details3/tk-TM_details.xml', '', ''),
(179, 8, 0, 'JA JobBoard Payment Plugin BankWire for Joomla 2.5', '', 'plg_payment_jajb_wirebank_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_wirebank_25.xml', '', ''),
(180, 3, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '3.6.0.1', '', 'https://update.joomla.org/language/details3/ga-IE_details.xml', '', ''),
(181, 8, 0, 'JA Search Comment Plugin for Joomla J2.5 & 3.x', '', 'jacomment', 'plugin', 'search', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jacomment.xml', '', ''),
(182, 3, 0, 'Dzongkha', '', 'pkg_dz-BT', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/dz-BT_details.xml', '', ''),
(183, 8, 0, 'JA Search Jobs plugin for Joomla 2.5', '', 'jajob', 'plugin', 'search', 0, '1.0.0 stable', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jajob.xml', '', ''),
(184, 3, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', ''),
(185, 8, 0, 'JA System Comment Plugin for Joomla 2.5 & 3.3', '', 'jacomment', 'plugin', 'system', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacomment.xml', '', ''),
(186, 3, 0, 'Spanish CO', '', 'pkg_es-CO', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/es-CO_details.xml', '', ''),
(187, 8, 0, 'JA Content Extra Fields for Joomla 2.5', '', 'jacontentextrafields', 'plugin', 'system', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacontentextrafields.xml', '', ''),
(188, 3, 0, 'German CH', '', 'pkg_de-CH', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-CH_details.xml', '', ''),
(189, 8, 0, 'JA System Google Map plugin for Joomla 2.5 & J3.x', '', 'jagooglemap', 'plugin', 'system', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml', '', ''),
(190, 3, 0, 'German AT', '', 'pkg_de-AT', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-AT_details.xml', '', ''),
(191, 8, 0, 'JAEC PLG System Jobboad Jomsocial Synchonization', '', 'jajb_jomsocial', 'plugin', 'system', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jajb_jomsocial.xml', '', ''),
(192, 3, 0, 'German LI', '', 'pkg_de-LI', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-LI_details.xml', '', ''),
(193, 8, 0, 'JA System Lazyload Plugin for J25 & J3x', '', 'jalazyload', 'plugin', 'system', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jalazyload.xml', '', ''),
(194, 3, 0, 'German LU', '', 'pkg_de-LU', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-LU_details.xml', '', ''),
(195, 8, 0, 'JA Megafilter Plugin', '', 'jamegafilter', 'plugin', 'system', 0, '1.0.0 Beta 1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jamegafilter.xml', '', ''),
(196, 3, 0, 'English NZ', '', 'pkg_en-NZ', 'package', '', 0, '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-NZ_details.xml', '', ''),
(197, 8, 0, 'JA System Nrain Plugin for Joomla 2.5 & 3.3', '', 'janrain', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_janrain.xml', '', ''),
(198, 8, 0, 'JA Popup Plugin for Joomla 25 & 34', '', 'japopup', 'plugin', 'system', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_japopup.xml', '', ''),
(199, 8, 0, 'JA System Social Plugin for Joomla 3.x', '', 'jasocial', 'plugin', 'system', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial.xml', '', ''),
(200, 8, 0, 'JA System Social Feed Plugin for Joomla 2.5 & 3.4', '', 'jasocial_feed', 'plugin', 'system', 0, '1.2.8', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial_feed.xml', '', ''),
(201, 8, 0, 'JA T3v2 System Plugin for J3.x', '', 'jat3', 'plugin', 'system', 0, '2.7.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3.xml', '', ''),
(202, 8, 0, 'JA T3v3 System Plugin', '', 'jat3v3', 'plugin', 'system', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3v3.xml', '', ''),
(203, 8, 0, 'JA Tabs Plugin for J3.x', '', 'jatabs', 'plugin', 'system', 0, '2.6.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatabs.xml', '', ''),
(204, 8, 0, 'JA Typo Plugin for Joomla 2.5 & J34', '', 'jatypo', 'plugin', 'system', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatypo.xml', '', ''),
(205, 8, 0, 'JA Teline III Template for Joomla 2.5', '', 'teline_iii', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/teline_iii.xml', '', ''),
(206, 8, 0, 'Thirdparty Extensions Compatibility Bundle', '', 'thirdparty_exts_compatibility', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/thirdparty_exts_compatibility.xml', '', ''),
(207, 8, 0, 'Uber Template', '', 'uber', 'template', '', 0, '2.1.4', '', 'http://update.joomlart.com/service/tracking/j16/uber.xml', '', ''),
(208, 8, 0, 'Backend Template', '', 'backend_template_package', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j30/backend_template_package.xml', '', ''),
(209, 8, 0, 'Backend Template', '', 'backend_template_pkg', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j30/backend_template_pkg.xml', '', ''),
(210, 8, 0, 'JA Restaurant Template', '', 'ja_restaurant', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j30/ja_restaurant.xml', '', ''),
(211, 8, 0, 'JA K2 v3 Filter package for J33', '', 'com_jak2v3filter', 'component', '', 1, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/com_jak2v3filter.xml', '', ''),
(212, 8, 0, 'JA Multilingual Component for Joomla 2.5 & 3.4', '', 'com_jalang', 'component', '', 1, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j31/com_jalang.xml', '', ''),
(213, 8, 0, 'JA Intranet Theme for EasyBlog', '', 'easyblog_theme_intranet', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/easyblog_theme_intranet.xml', '', ''),
(214, 8, 0, 'JA Resume Theme for EasyBlog', '', 'easyblog_theme_resume', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/easyblog_theme_resume.xml', '', ''),
(215, 8, 0, 'JA Sugite Theme for EasyBlog', '', 'easyblog_theme_sugite', 'custom', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j31/easyblog_theme_sugite.xml', '', ''),
(216, 8, 0, 'JA Biz Template', '', 'ja_biz', 'template', '', 0, '1.1.6', '', 'http://update.joomlart.com/service/tracking/j31/ja_biz.xml', '', ''),
(217, 8, 0, 'JA Brickstore Template', '', 'ja_brickstore', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_brickstore.xml', '', ''),
(218, 8, 0, 'JA Cago template', '', 'ja_cago', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/ja_cago.xml', '', ''),
(219, 8, 0, 'JA Cagox template', '', 'ja_cagox', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_cagox.xml', '', ''),
(220, 8, 0, 'JA Charity template', '', 'ja_charity', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_charity.xml', '', ''),
(221, 8, 0, 'JA Directory Template', '', 'ja_directory', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_directory.xml', '', ''),
(222, 8, 0, 'JA Edenite Template for J25 & J34', '', 'ja_edenite', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_edenite.xml', '', ''),
(223, 8, 0, 'JA Elicyon Template', '', 'ja_elicyon', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_elicyon.xml', '', ''),
(224, 8, 0, 'JA Events II template', '', 'ja_events_ii', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_events_ii.xml', '', ''),
(225, 8, 0, 'JA Fixel Template', '', 'ja_fixel', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_fixel.xml', '', ''),
(226, 8, 0, 'JA Healthcare Template', '', 'ja_healthcare', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_healthcare.xml', '', ''),
(227, 8, 0, 'JA Hotel Template', '', 'ja_hotel', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_hotel.xml', '', ''),
(228, 8, 0, 'JA Intranet Template', '', 'ja_intranet', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_intranet.xml', '', ''),
(229, 8, 0, 'JA Magz II Template', '', 'ja_magz_ii', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_magz_ii.xml', '', ''),
(230, 8, 0, 'JA Megastore Template', '', 'ja_megastore', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_megastore.xml', '', ''),
(231, 8, 0, 'JA Mono Template', '', 'ja_mono', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j31/ja_mono.xml', '', ''),
(232, 8, 0, 'JA Moviemax Template', '', 'ja_moviemax', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_moviemax.xml', '', ''),
(233, 8, 0, 'JA Muzic Template for J25 & J3x', '', 'ja_muzic', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_muzic.xml', '', ''),
(234, 8, 0, 'JA Platon Template', '', 'ja_platon', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_platon.xml', '', ''),
(235, 8, 0, 'JA Playstore Template', '', 'ja_playstore', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_playstore.xml', '', ''),
(236, 8, 0, 'JA Rave Template for Joomla 3.x', '', 'ja_rave', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_rave.xml', '', ''),
(237, 8, 0, 'JA Rent template', '', 'ja_rent', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_rent.xml', '', ''),
(238, 8, 0, 'JA Resume Template', '', 'ja_resume', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_resume.xml', '', ''),
(239, 8, 0, 'JA Simpli Template', '', 'ja_simpli', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/ja_simpli.xml', '', ''),
(240, 8, 0, 'JA Social II template', '', 'ja_social_ii', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_social_ii.xml', '', ''),
(241, 8, 0, 'JA Techzone Template', '', 'ja_techzone', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_techzone.xml', '', ''),
(242, 8, 0, 'JA Teline V Template', '', 'ja_teline_v', 'template', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j31/ja_teline_v.xml', '', ''),
(243, 8, 0, 'JA University Template for J25 & J32', '', 'ja_university', 'template', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j31/ja_university.xml', '', ''),
(244, 8, 0, 'JA University T3 template', '', 'ja_university_t3', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_university_t3.xml', '', ''),
(245, 8, 0, 'JA Vintas Template for J25 & J3x', '', 'ja_vintas', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_vintas.xml', '', ''),
(246, 8, 0, 'JA Wall Template for J25 & J34', '', 'ja_wall', 'template', '', 0, '1.2.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_wall.xml', '', ''),
(247, 8, 0, 'Jomsocial theme for Platon', '', 'jomsocial_theme_platon', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/jomsocial_theme_platon.xml', '', ''),
(248, 8, 0, 'Theme Fixel for JShopping J25 & J3x', '', 'jshopping_theme_fixel', 'custom', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j31/jshopping_theme_fixel.xml', '', ''),
(249, 8, 0, 'JA Tiris Jshopping theme for J3x', '', 'jshopping_theme_tiris_j3x', 'custom', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j31/jshopping_theme_tiris_j3x.xml', '', ''),
(250, 8, 0, 'JA Mitius Kunena Theme for Joomla 3x', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_mitius.xml', '', ''),
(251, 8, 0, 'JA Tiris Kunena Theme for Joomla 3x', '', 'kunena_theme_mitius_j31', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_mitius_j31.xml', '', ''),
(252, 8, 0, 'Kunena Theme MovieMax', '', 'kunena_theme_moviemax', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_moviemax.xml', '', ''),
(253, 8, 0, 'Kunena Theme Platon', '', 'kunena_theme_platon', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_platon.xml', '', ''),
(254, 8, 0, 'Kunena Theme Playstore', '', 'kunena_theme_playstore', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_playstore.xml', '', ''),
(255, 8, 0, 'JA Tiris Kunena Theme for Joomla 3x', '', 'kunena_theme_tiris_j3x', 'custom', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_tiris_j3x.xml', '', ''),
(256, 8, 0, 'Mijoshop Modules Accordion', '', 'mijoshop_mod_accordion', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_accordion.xml', '', ''),
(257, 8, 0, 'Mijoshop V3 Modules Accordion', '', 'mijoshop_mod_accordion_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_accordion_v3.xml', '', ''),
(258, 8, 0, 'Mijoshop Modules Slider', '', 'mijoshop_mod_slider', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_slider.xml', '', ''),
(259, 8, 0, 'Mijoshop V3 Modules Slider', '', 'mijoshop_mod_slider_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_slider_v3.xml', '', ''),
(260, 8, 0, 'JA Bookshop Theme for Mijoshop V3', '', 'mijoshop_theme_bookshop_v3', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_theme_bookshop_v3.xml', '', ''),
(261, 8, 0, 'JA Google Analytics', '', 'mod_jagoogle_analytics', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/mod_jagoogle_analytics.xml', '', ''),
(262, 8, 0, 'JA Google Chart Module', '', 'mod_jagooglechart', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mod_jagooglechart.xml', '', ''),
(263, 8, 0, 'JA Halloween Game for Joomla 3.x', '', 'mod_jahalloweengame', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mod_jahalloweengame.xml', '', ''),
(264, 8, 0, 'JA K2 v3 Filter Module for J33', '', 'mod_jak2v3filter', 'module', '', 0, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/mod_jak2v3filter.xml', '', ''),
(265, 8, 0, 'JA Masthead Module ', '', 'mod_jamasthead', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mod_jamasthead.xml', '', ''),
(266, 8, 0, 'JA Promo Bar module', '', 'mod_japromobar', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j31/mod_japromobar.xml', '', ''),
(267, 8, 0, 'Ja Yahoo Finance', '', 'mod_jayahoo_finance', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mod_jayahoo_finance.xml', '', ''),
(268, 8, 0, 'Ja Yahoo Weather', '', 'mod_jayahoo_weather', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/mod_jayahoo_weather.xml', '', ''),
(269, 8, 0, 'Plugin Ajax JA Content Type', '', 'jacontenttype', 'plugin', 'ajax', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/plg_ajax_jacontenttype.xml', '', ''),
(270, 8, 0, 'JA K2 Data Migration plugin', '', 'plg_jak2tocomcontentmigration', 'plugin', 'plg_jak2tocomcontent', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/plg_jak2tocomcontentmigration.xml', '', ''),
(271, 8, 0, 'Plgin JA K2 import to Joomla Content', '', 'plg_jak2tocontent', 'plugin', 'plg_jak2tocontent', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j31/plg_jak2tocontent.xml', '', ''),
(272, 8, 0, 'JA K2 Extrafields', '', 'jak2extrafields', 'plugin', 'k2', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/plg_k2_jak2extrafields.xml', '', ''),
(273, 8, 0, 'JA K2 v3 Filter Plugin for J33', '', 'jak2v3filter', 'plugin', 'k2', 0, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/plg_k2_jak2v3filter.xml', '', ''),
(274, 8, 0, 'JA System Designit Plugin', '', 'designit', 'plugin', 'system', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/plg_system_designit.xml', '', ''),
(275, 8, 0, 'Plugin JA Content Type', '', 'jacontenttype', 'plugin', 'system', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j31/plg_system_jacontenttype.xml', '', ''),
(276, 8, 0, 'Purity III Template', '', 'purity_iii', 'template', '', 0, '1.1.7', '', 'http://update.joomlart.com/service/tracking/j31/purity_iii.xml', '', ''),
(277, 8, 0, 'Sample package for Uber App', '', 'uber_app', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_app.xml', '', ''),
(278, 8, 0, 'Sample package for Bookstore', '', 'uber_bookstore', 'sample_package', '', 0, '2.1.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_bookstore.xml', '', ''),
(279, 8, 0, 'Sample package for Uber Business', '', 'uber_business', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_business.xml', '', ''),
(280, 8, 0, 'Sample package for Uber Charity', '', 'uber_charity', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_charity.xml', '', ''),
(281, 8, 0, 'Sample package for Uber Church', '', 'uber_church', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_church.xml', '', ''),
(282, 8, 0, 'Sample package for Uber Construction', '', 'uber_construction', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_construction.xml', '', ''),
(283, 8, 0, 'Sample package for Uber Corporate', '', 'uber_corporate', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_corporate.xml', '', ''),
(284, 8, 0, 'Sample package for Uber Gym', '', 'uber_gym', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_gym.xml', '', ''),
(285, 8, 0, 'Sample package for Uber Home', '', 'uber_home', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_home.xml', '', ''),
(286, 8, 0, 'Sample package for Landing page', '', 'uber_landing', 'sample_package', '', 0, '2.1.0', '', 'http://update.joomlart.com/service/tracking/j31/uber_landing.xml', '', ''),
(287, 8, 0, 'Sample package for Uber Lawyer', '', 'uber_lawyer', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_lawyer.xml', '', '');
INSERT INTO `o2kj3_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(288, 8, 0, 'Sample package for Uber Medicare', '', 'uber_medicare', 'sample_package', '', 0, '2.1.0', '', 'http://update.joomlart.com/service/tracking/j31/uber_medicare.xml', '', ''),
(289, 8, 0, 'Sample package for Uber Music', '', 'uber_music', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_music.xml', '', ''),
(290, 8, 0, 'Sample package for Uber Restaurant', '', 'uber_restaurant', 'sample_package', '', 0, '2.0.3', '', 'http://update.joomlart.com/service/tracking/j31/uber_restaurant.xml', '', ''),
(291, 8, 0, 'Sample package for Uber Spa', '', 'uber_spa', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_spa.xml', '', ''),
(292, 8, 0, 'Sample package for Uber University', '', 'uber_university', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_university.xml', '', ''),
(293, 8, 0, 'Sample package for Uber Wedding', '', 'uber_wedding', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_wedding.xml', '', ''),
(294, 9, 0, 'T3 Framework Package', 'T3 Framework update', 'pkg_T3', 'package', '', 1, '1.1.0 RC2', '', 'http://www.t3-framework.org/update.xml', '\n			http://t3-framework.org\n		', ''),
(295, 10, 10024, 'DJ-ImageSlider Package', 'DJ-ImageSlider Package Update', 'pkg_dj-imageslider', 'package', '', 0, '3.2.1', '', 'http://dj-extensions.com/updates/djimageslider.xml', 'https://dj-extensions.com/dj-imageslider', ''),
(296, 8, 0, '', '', '', 'module', '', 0, '', '', 'http://update.joomlart.com/service/tracking/j16/.xml', '', ''),
(297, 8, 0, 'JA Amazon S3 for joomla 16', '', 'com_com_jaamazons3', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml', '', ''),
(298, 8, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', '', ''),
(299, 8, 0, 'JA Amazon S3 for joomla 2.5 & 3.x', '', 'com_jaamazons3', 'component', '', 1, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml', '', ''),
(300, 8, 0, 'JA Comment Package for Joomla 2.5 & 3.x', '', 'com_jacomment', 'component', '', 1, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/com_jacomment.xml', '', ''),
(301, 8, 0, 'JA Extenstion Manager Component for J3.x', '', 'com_jaextmanager', 'component', '', 1, '2.6.2', '', 'http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml', '', ''),
(302, 8, 0, 'JA Google Storage Package for J2.5 & J3.0', '', 'com_jagooglestorage', 'component', '', 1, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml', '', ''),
(303, 8, 0, 'JA Job Board Package For J25', '', 'com_jajobboard', 'component', '', 1, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml', '', ''),
(304, 8, 0, 'JA K2 Filter Package for J25 & J3.x', '', 'com_jak2filter', 'component', '', 1, '1.2.6', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', '', ''),
(305, 8, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2fiter', 'component', '', 1, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml', '', ''),
(306, 8, 0, 'JA Megafilter Component', '', 'com_jamegafilter', 'component', '', 1, '1.0.0 Beta 1', '', 'http://update.joomlart.com/service/tracking/j16/com_jamegafilter.xml', '', ''),
(307, 8, 0, 'JA Showcase component for Joomla 1.7', '', 'com_jashowcase', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml', '', ''),
(308, 8, 0, 'JA Voice Package for Joomla 2.5 & 3.x', '', 'com_javoice', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_javoice.xml', '', ''),
(309, 8, 0, 'JA Appolio Theme for EasyBlog', '', 'easyblog_theme_appolio', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_appolio.xml', '', ''),
(310, 8, 0, 'JA Biz Theme for EasyBlog', '', 'easyblog_theme_biz', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_biz.xml', '', ''),
(311, 8, 0, 'JA Bookshop Theme for EasyBlog', '', 'easyblog_theme_bookshop', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_bookshop.xml', '', ''),
(312, 8, 0, 'Theme Community Plus for Easyblog J25 & J30', '', 'easyblog_theme_community_plus', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_community_plus.xml', '', ''),
(313, 8, 0, 'JA Decor Theme for EasyBlog', '', 'easyblog_theme_decor', 'custom', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_decor.xml', '', ''),
(314, 8, 0, 'Theme Fixel for Easyblog J25 & J3x', '', 'easyblog_theme_fixel', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_fixel.xml', '', ''),
(315, 8, 0, 'Theme Magz for Easyblog J25 & J34', '', 'easyblog_theme_magz', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_magz.xml', '', ''),
(316, 8, 0, 'JA Muzic Theme for EasyBlog', '', 'easyblog_theme_muzic', 'custom', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_muzic.xml', '', ''),
(317, 8, 0, 'JA Obelisk Theme for EasyBlog', '', 'easyblog_theme_obelisk', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_obelisk.xml', '', ''),
(318, 8, 0, 'JA Anion template for Joomla 3.x', '', 'ja_anion', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_anion.xml', '', ''),
(319, 8, 0, 'JA Appolio Template', '', 'ja_appolio', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_appolio.xml', '', ''),
(320, 8, 0, 'JA Argo Template for J3x', '', 'ja_argo', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', '', ''),
(321, 8, 0, 'JA Beranis Template', '', 'ja_beranis', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_beranis.xml', '', ''),
(322, 8, 0, 'JA Bistro Template for Joomla 3.x', '', 'ja_bistro', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_bistro.xml', '', ''),
(323, 8, 0, 'JA Blazes Template for J25 & J3x', '', 'ja_blazes', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_blazes.xml', '', ''),
(324, 8, 0, 'JA Bookshop Template', '', 'ja_bookshop', 'template', '', 0, '1.1.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_bookshop.xml', '', ''),
(325, 8, 0, 'JA Brisk Template for J25 & J3x', '', 'ja_brisk', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_brisk.xml', '', ''),
(326, 8, 0, 'JA Business Template for Joomla 3.x', '', 'ja_business', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_business.xml', '', ''),
(327, 8, 0, 'JA Cloris Template for Joomla 3.x', '', 'ja_cloris', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_cloris.xml', '', ''),
(328, 8, 0, 'JA Community PLus Template for Joomla 3.x', '', 'ja_community_plus', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml', '', ''),
(329, 8, 0, 'JA Decor Template', '', 'ja_decor', 'template', '', 0, '1.1.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_decor.xml', '', ''),
(330, 8, 0, 'JA Droid Template for Joomla 3.x', '', 'ja_droid', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_droid.xml', '', ''),
(331, 8, 0, 'JA Edenite Template for J25 & J34', '', 'ja_edenite', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_edenite.xml', '', ''),
(332, 8, 0, 'JA Elastica Template for J25 & J3x', '', 'ja_elastica', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_elastica.xml', '', ''),
(333, 8, 0, 'JA Erio Template for Joomla 2.5 & 3.x', '', 'ja_erio', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_erio.xml', '', ''),
(334, 8, 0, 'Ja Events Template for Joomla 2.5', '', 'ja_events', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_events.xml', '', ''),
(335, 8, 0, 'JA Fubix Template for J25 & J3x', '', 'ja_fubix', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_fubix.xml', '', ''),
(336, 8, 0, 'JA Graphite Template for Joomla 3x', '', 'ja_graphite', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_graphite.xml', '', ''),
(337, 8, 0, 'JA Hawkstore Template', '', 'ja_hawkstore', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_hawkstore.xml', '', ''),
(338, 8, 0, 'JA Ironis Template for Joomla 2.5 & 3.x', '', 'ja_ironis', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_ironis.xml', '', ''),
(339, 8, 0, 'JA Jason template', '', 'ja_jason', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_jason.xml', '', ''),
(340, 8, 0, 'JA Kranos Template for J2.5 & J3.x', '', 'ja_kranos', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_kranos.xml', '', ''),
(341, 8, 0, 'JA Lens Template for Joomla 2.5 & 3.x', '', 'ja_lens', 'template', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_lens.xml', '', ''),
(342, 8, 0, 'Ja Lime Template for Joomla 3x', '', 'ja_lime', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_lime.xml', '', ''),
(343, 8, 0, 'JA Magz Template for J25 & J34', '', 'ja_magz', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_magz.xml', '', ''),
(344, 8, 0, 'JA Medicare Template', '', 'ja_medicare', 'template', '', 0, '1.1.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_medicare.xml', '', ''),
(345, 8, 0, 'JA Mendozite Template for J25 & J32', '', 'ja_mendozite', 'template', '', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml', '', ''),
(346, 8, 0, 'JA Mero Template for J25 & J3x', '', 'ja_mero', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_mero.xml', '', ''),
(347, 8, 0, 'JA Mers Template for J25 & J3x', '', 'ja_mers', 'template', '', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_mers.xml', '', ''),
(348, 8, 0, 'JA Methys Template for Joomla 3x', '', 'ja_methys', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_methys.xml', '', ''),
(349, 8, 0, 'Ja Minisite Template for Joomla 3.4', '', 'ja_minisite', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_minisite.xml', '', ''),
(350, 8, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', '', ''),
(351, 8, 0, 'JA Mixmaz Template', '', 'ja_mixmaz', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml', '', ''),
(352, 8, 0, 'JA Nex Template for J25 & J30', '', 'ja_nex', 'template', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex.xml', '', ''),
(353, 8, 0, 'JA Nex T3 Template', '', 'ja_nex_t3', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex_t3.xml', '', ''),
(354, 8, 0, 'JA Norite Template for J2.5 & J31', '', 'ja_norite', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_norite.xml', '', ''),
(355, 8, 0, 'JA Nuevo template', '', 'ja_nuevo', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_nuevo.xml', '', ''),
(356, 8, 0, 'JA Obelisk Template', '', 'ja_obelisk', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_obelisk.xml', '', ''),
(357, 8, 0, 'JA Onepage Template', '', 'ja_onepage', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_onepage.xml', '', ''),
(358, 8, 0, 'JA ores template for Joomla 3.x', '', 'ja_ores', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_ores.xml', '', ''),
(359, 8, 0, 'JA Orisite Template  for J25 & J3x', '', 'ja_orisite', 'template', '', 0, '1.1.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_orisite.xml', '', ''),
(360, 8, 0, 'JA Playmag Template', '', 'ja_playmag', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_playmag.xml', '', ''),
(361, 8, 0, 'JA Portfolio Real Estate template for Joomla 1.6.x', '', 'ja_portfolio', 'file', '', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml', '', ''),
(362, 8, 0, 'JA Portfolio Template for Joomla 3.x', '', 'ja_portfolio_real_estate', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml', '', ''),
(363, 8, 0, 'JA Puresite Template for J25 & J3x', '', 'ja_puresite', 'template', '', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', '', ''),
(364, 8, 0, 'JA Purity II template for Joomla 2.5 & 3.2', '', 'ja_purity_ii', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', '', ''),
(365, 8, 0, 'JA Pyro Template for Joomla 3.x', '', 'ja_pyro', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', '', ''),
(366, 8, 0, 'JA Rasite Template for J34', '', 'ja_rasite', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_rasite.xml', '', ''),
(367, 8, 0, 'JA Smashboard Template', '', 'ja_smashboard', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_smashboard.xml', '', ''),
(368, 8, 0, 'JA Social Template for Joomla 2.5', '', 'ja_social', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_social.xml', '', ''),
(369, 8, 0, 'JA Social T3 Template for J25 & J3x', '', 'ja_social_t3', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_social_t3.xml', '', ''),
(370, 8, 0, 'JA Sugite Template', '', 'ja_sugite', 'template', '', 0, '1.1.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_sugite.xml', '', ''),
(371, 8, 0, 'JA System Pager Plugin for J25 & J30', '', 'ja_system_japager', 'plugin', 'ja_system_japager', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml', '', ''),
(372, 8, 0, 'JA T3V2 Blank Template', '', 'ja_t3_blank', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml', '', ''),
(373, 8, 0, 'JA T3 Blank template for joomla 1.6', '', 'ja_t3_blank_j16', 'template', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml', '', ''),
(374, 8, 0, 'JA Blank Template for T3v3', '', 'ja_t3v3_blank', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml', '', ''),
(375, 8, 0, 'JA Teline III  Template for Joomla 1.6', '', 'ja_teline_iii', 'file', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml', '', ''),
(376, 8, 0, 'JA Teline IV Template for J2.5 and J3.2', '', 'ja_teline_iv', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml', '', ''),
(377, 8, 0, 'JA Teline IV T3 Template', '', 'ja_teline_iv_t3', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv_t3.xml', '', ''),
(378, 8, 0, 'JA Tiris Template for J25 & J3x', '', 'ja_tiris', 'template', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_tiris.xml', '', ''),
(379, 8, 0, 'JA Travel Template for Joomla 3x', '', 'ja_travel', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_travel.xml', '', ''),
(380, 8, 0, 'JA University Template for J25 & J32', '', 'ja_university', 'template', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j31/ja_university.xml', '', ''),
(381, 8, 0, 'JA University T3 template', '', 'ja_university_t3', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_university_t3.xml', '', ''),
(382, 8, 0, 'JA Vintas Template for J25 & J3x', '', 'ja_vintas', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/ja_vintas.xml', '', ''),
(383, 8, 0, 'JA Mitius Kunena Theme for Joomla 3x', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_mitius.xml', '', ''),
(384, 8, 0, 'JA K2 Data Migration plugin', '', 'plg_jak2tocomcontentmigration', 'plugin', 'plg_jak2tocomcontent', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/plg_jak2tocomcontentmigration.xml', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_update_sites`
--

CREATE TABLE IF NOT EXISTS `o2kj3_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `o2kj3_update_sites`
--

INSERT INTO `o2kj3_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1478947150, ''),
(2, 'Joomla! Extension Directory', 'collection', 'https://update.joomla.org/jed/list.xml', 1, 1478947151, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 1478918330, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1478918331, ''),
(5, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1478918332, ''),
(6, 'WebInstaller Update Site', 'extension', 'http://appscdn.joomla.org/webapps/jedapps/webinstaller.xml', 1, 1478918332, ''),
(7, 'K2 Updates', 'extension', 'http://getk2.org/app/update.xml', 1, 1478918333, ''),
(8, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1478918339, ''),
(9, 'T3 Framework Update', 'extension', 'http://www.t3-framework.org/update.xml', 1, 1478918339, ''),
(10, 'DJ-ImageSlider Package', 'extension', 'http://dj-extensions.com/updates/djimageslider.xml', 1, 1478918340, '');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `o2kj3_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- 转存表中的数据 `o2kj3_update_sites_extensions`
--

INSERT INTO `o2kj3_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 802),
(4, 28),
(5, 10002),
(6, 10003),
(7, 10004),
(8, 10018),
(8, 10019),
(8, 10020),
(9, 10021),
(10, 10024);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_usergroups`
--

CREATE TABLE IF NOT EXISTS `o2kj3_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `o2kj3_usergroups`
--

INSERT INTO `o2kj3_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_users`
--

CREATE TABLE IF NOT EXISTS `o2kj3_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=978 ;

--
-- 转存表中的数据 `o2kj3_users`
--

INSERT INTO `o2kj3_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(977, 'Super User', 'admin', 'zjjhyzzjc@163.com', '$2y$10$l/T875t.ru6oXYOAQromj.Zw6tRamQnU/icC/JRgCbgNAb4gEP9Lq', 0, 1, '2016-10-15 01:54:16', '2016-11-12 02:34:49', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_user_keys`
--

CREATE TABLE IF NOT EXISTS `o2kj3_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_user_notes`
--

CREATE TABLE IF NOT EXISTS `o2kj3_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_user_profiles`
--

CREATE TABLE IF NOT EXISTS `o2kj3_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `o2kj3_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `o2kj3_user_usergroup_map`
--

INSERT INTO `o2kj3_user_usergroup_map` (`user_id`, `group_id`) VALUES
(977, 8);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_utf8_conversion`
--

CREATE TABLE IF NOT EXISTS `o2kj3_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `o2kj3_utf8_conversion`
--

INSERT INTO `o2kj3_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- 表的结构 `o2kj3_viewlevels`
--

CREATE TABLE IF NOT EXISTS `o2kj3_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `o2kj3_viewlevels`
--

INSERT INTO `o2kj3_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

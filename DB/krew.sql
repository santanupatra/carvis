-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 20, 2018 at 11:04 AM
-- Server version: 5.7.20-0ubuntu0.17.04.1
-- PHP Version: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carvis`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `role` enum('admin','sub-admin') NOT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `cpass_req` varchar(255) DEFAULT NULL,
  `cpass_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `type`, `first_name`, `last_name`, `username`, `password`, `email`, `role`, `permissions`, `created`, `modified`, `status`, `cpass_req`, `cpass_value`) VALUES
(1, 'superadmin', 'Super', 'Admin', 'admin', '$2y$10$viCyM6lGIri0Cz8.T0KGuu2rgAQNqy/RoyDcVkWKEkufT9kAIFCpy', 'spandan@natitsolved.com', 'admin', '1,2,3,9,10,17,18,20,22', '2016-10-05 10:35:16', '2018-01-05 05:56:49', 1, '1', '5KiDboQhdn');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `menu`) VALUES
(1, 'Site Settings'),
(2, 'Admin'),
(3, 'Users'),
(9, 'Contents'),
(10, 'Site Management'),
(17, 'Email Templates'),
(18, 'Category'),
(20, 'Useful Links');

-- --------------------------------------------------------

--
-- Table structure for table `blog_commentmeta`
--

CREATE TABLE `blog_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-11-17 09:25:53', '2017-11-17 09:25:53', 'Hi, this is a comment.\r\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\r\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_links`
--

CREATE TABLE `blog_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_options`
--

CREATE TABLE `blog_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_options`
--

INSERT INTO `blog_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://111.93.169.90/team6/jimja/webroot/blog', 'yes'),
(2, 'home', 'http://111.93.169.90/team6/jimja/webroot/blog', 'yes'),
(3, 'blogname', 'Jimja', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'santanu@natitsolved.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:89:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentyfifteen', 'yes'),
(41, 'stylesheet', 'twentyfifteen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'blog_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'cron', 'a:4:{i:1514496354;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1514537251;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1514539920;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1513232655;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(114, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.1-partial-0.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.1\";s:7:\"version\";s:5:\"4.9.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:3:\"4.9\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.9.1-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.1-rollback-0.zip\";}s:7:\"current\";s:5:\"4.9.1\";s:7:\"version\";s:5:\"4.9.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:3:\"4.9\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1514468859;s:15:\"version_checked\";s:3:\"4.9\";s:12:\"translations\";a:0:{}}', 'no'),
(119, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1514468875;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"1.9\";s:15:\"twentyseventeen\";s:3:\"1.4\";s:13:\"twentysixteen\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(123, 'can_compress_scripts', '0', 'no'),
(256, 'theme_mods_twentyfifteen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(259, 'current_theme', 'Twenty Fifteen', 'yes'),
(260, 'theme_switched', '', 'yes'),
(261, 'theme_switched_via_customizer', '', 'yes'),
(262, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(263, '_transient_is_multi_author', '0', 'yes'),
(264, '_transient_twentyfifteen_categories', '1', 'yes'),
(281, '_site_transient_timeout_theme_roots', '1514470662', 'no'),
(282, '_site_transient_theme_roots', 'a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(283, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1514468870;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.2.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.1\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:7:\"default\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";s:7:\"default\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `blog_postmeta`
--

CREATE TABLE `blog_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_postmeta`
--

INSERT INTO `blog_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 5, '_edit_last', '1'),
(3, 5, '_edit_lock', '1512982230:1'),
(4, 6, '_wp_attached_file', '2017/12/7.png'),
(5, 6, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:280;s:6:\"height\";i:204;s:4:\"file\";s:13:\"2017/12/7.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:13:\"7-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:13:\"7-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(7, 8, '_edit_last', '1'),
(8, 8, '_edit_lock', '1513232474:1'),
(9, 9, '_wp_attached_file', '2017/12/6.png'),
(10, 9, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:280;s:6:\"height\";i:204;s:4:\"file\";s:13:\"2017/12/6.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:13:\"6-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:13:\"6-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(12, 8, '_thumbnail_id', '6'),
(14, 12, '_wp_trash_meta_status', 'publish'),
(15, 12, '_wp_trash_meta_time', '1513232656');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-11-17 09:25:53', '2017-11-17 09:25:53', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2017-11-17 09:25:53', '2017-11-17 09:25:53', '', 0, 'http://111.93.169.90/team6/jimja/webroot/blog/?p=1', 0, 'post', '', 1),
(2, 1, '2017-11-17 09:25:53', '2017-11-17 09:25:53', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\r\n\r\n...or something like this:\r\n\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\n\r\nAs a new WordPress user, you should go to <a href=\"http://111.93.169.90/team6/jimja/webroot/blog/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2017-11-17 09:25:53', '2017-11-17 09:25:53', '', 0, 'http://111.93.169.90/team6/jimja/webroot/blog/?page_id=2', 0, 'page', '', 0),
(5, 1, '2017-12-11 08:50:06', '2017-12-11 08:50:06', 'This is test text.<img class=\"alignnone size-full wp-image-6\" src=\"http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/7.png\" alt=\"\" width=\"280\" height=\"204\" />', 'Test', '', 'publish', 'open', 'open', '', 'test', '', '', '2017-12-11 08:50:06', '2017-12-11 08:50:06', '', 0, 'http://111.93.169.90/team6/jimja/webroot/blog/?p=5', 0, 'post', '', 0),
(6, 1, '2017-12-11 08:49:37', '2017-12-11 08:49:37', '', '7', '', 'inherit', 'open', 'closed', '', '7', '', '', '2017-12-11 08:49:37', '2017-12-11 08:49:37', '', 5, 'http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/7.png', 0, 'attachment', 'image/png', 0),
(7, 1, '2017-12-11 08:50:06', '2017-12-11 08:50:06', 'This is test text.<img class=\"alignnone size-full wp-image-6\" src=\"http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/7.png\" alt=\"\" width=\"280\" height=\"204\" />', 'Test', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2017-12-11 08:50:06', '2017-12-11 08:50:06', '', 5, 'http://111.93.169.90/team6/jimja/webroot/blog/2017/12/11/5-revision-v1/', 0, 'revision', '', 0),
(8, 1, '2017-12-11 08:52:23', '2017-12-11 08:52:23', 'This is test text.<img class=\"alignnone size-medium wp-image-9\" src=\"http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/6.png\" alt=\"\" width=\"280\" height=\"204\" />', 'Test1', '', 'publish', 'open', 'open', '', 'test1', '', '', '2017-12-14 06:23:07', '2017-12-14 06:23:07', '', 0, 'http://111.93.169.90/team6/jimja/webroot/blog/?p=8', 0, 'post', '', 0),
(9, 1, '2017-12-11 08:52:05', '2017-12-11 08:52:05', '', '6', '', 'inherit', 'open', 'closed', '', '6', '', '', '2017-12-11 08:52:05', '2017-12-11 08:52:05', '', 8, 'http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/6.png', 0, 'attachment', 'image/png', 0),
(10, 1, '2017-12-11 08:52:23', '2017-12-11 08:52:23', 'This is test text.<img class=\"alignnone size-medium wp-image-9\" src=\"http://111.93.169.90/team6/jimja/webroot/blog/wp-content/uploads/2017/12/6.png\" alt=\"\" width=\"280\" height=\"204\" />', 'Test1', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2017-12-11 08:52:23', '2017-12-11 08:52:23', '', 8, 'http://111.93.169.90/team6/jimja/webroot/blog/2017/12/11/8-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2017-12-14 06:24:16', '2017-12-14 06:24:16', '{\n    \"old_sidebars_widgets_data\": {\n        \"value\": {\n            \"wp_inactive_widgets\": [],\n            \"sidebar-1\": [\n                \"search-2\",\n                \"recent-posts-2\",\n                \"recent-comments-2\",\n                \"archives-2\",\n                \"categories-2\",\n                \"meta-2\"\n            ],\n            \"sidebar-2\": [],\n            \"sidebar-3\": []\n        },\n        \"type\": \"global_variable\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2017-12-14 06:24:15\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '02c54c8b-7820-43d5-a033-c718384b3610', '', '', '2017-12-14 06:24:16', '2017-12-14 06:24:16', '', 0, 'http://111.93.169.90/team6/jimja/webroot/blog/2017/12/14/02c54c8b-7820-43d5-a033-c718384b3610/', 0, 'customize_changeset', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_termmeta`
--

CREATE TABLE `blog_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_terms`
--

CREATE TABLE `blog_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_terms`
--

INSERT INTO `blog_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_term_relationships`
--

CREATE TABLE `blog_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_term_relationships`
--

INSERT INTO `blog_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 1, 0),
(8, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_term_taxonomy`
--

CREATE TABLE `blog_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_term_taxonomy`
--

INSERT INTO `blog_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `blog_usermeta`
--

CREATE TABLE `blog_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_usermeta`
--

INSERT INTO `blog_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'blog_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'blog_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"9b42c9d489ff188405b1f97af5297000904b6558b52bf25c81bc72b9b56605b3\";a:4:{s:10:\"expiration\";i:1513404972;s:2:\"ip\";s:11:\"192.168.1.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0\";s:5:\"login\";i:1513232172;}}'),
(17, 1, 'blog_dashboard_quick_press_last_post_id', '11'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:11:\"192.168.1.0\";}'),
(19, 1, 'blog_user-settings', 'libraryContent=browse'),
(20, 1, 'blog_user-settings-time', '1512982202');

-- --------------------------------------------------------

--
-- Table structure for table `blog_users`
--

CREATE TABLE `blog_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `blog_users`
--

INSERT INTO `blog_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BYeFIMkWAyBk0SZQcHSmBUgvdqNjKc0', 'admin', 'santanu@natitsolved.com', '', '2017-11-17 09:25:52', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `company_id`, `booking_date`, `booking_status`) VALUES
(1, 23, 3, 25, '2017-11-07 11:50:35', 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `cake_sessions`
--

CREATE TABLE `cake_sessions` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `expires` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_description` text NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `page_slug`, `page_title`, `content`, `meta_title`, `meta_key`, `meta_description`, `is_active`) VALUES
(1, 'about-us', 'About Us', '<section class=\"inner-body-area\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n				<div class=\"col-lg-5 col-md-5 col-sm-5\">\r\n					<h3 class=\"innere-heading-title\">The PerfectShade System was developed by Dr. Huy Nguyen, DDS and Minh Tran, RDT.</h3>\r\n					<p class=\"inner-text\">Huy is a practicing dentist for 11 years and Minh has been working as a dental lab technician for 10 years.   Both Huy and Minh have worked together for many years.  During those years they have used traditional methods to take and send photos to achieve esthetic results for their patients.   After many years they have decided to build a system that every dentist use to get great results with the least amount of effort and costs.  </p>\r\n				</div>\r\n				<div class=\"col-lg-7 col-md-7 col-sm-7\">\r\n					<div class=\"about-pic\"> <img src=\"http://111.93.169.90/team6/carvis/user_img/5a4c7f489cf74.jpg\" alt=\"\"> </div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</section>\r\n\r\n	<section class=\"inner-body-area-b\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n			<div class=\"col-lg-6 col-md-6 col-sm-6\">\r\n				<div class=\"about-pic-b\">\r\n					<img src=\"http://111.93.169.90/team6/carvis/user_img/5a4c7efbc6965.jpg\">\r\n				</div>\r\n			</div>\r\n			<div class=\"col-lg-6 col-md-6 col-sm-6\">\r\n				<p class=\"inner-text inner-text-pad\">Huy is a practicing dentist for 11 years and Minh has been working as a dental lab technician for 10 years.   Both Huy and Minh have worked together for many years.  During those years they have used traditional methods to take and send photos to achieve esthetic results for their patients.   After many years they have decided to build a system that every dentist use to get great results with the least amount of effort and costs.  </p>\r\n				<div class=\"app-icons-area\">\r\n					<ul>\r\n						<li><a href=\"\"><img alt=\"\" src=\"http://111.93.169.90/team6/carvis/user_img/5a4c7f489cf74.jpg\"></a></li>\r\n						\r\n					</ul>										\r\n				</div>\r\n			</div>\r\n		</div>\r\n		</div>		\r\n	</section>\r\n\r\n	<section class=\"inner-body-area\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n				<div class=\"col-lg-5 col-md-5 col-sm-5\">\r\n					<h3 class=\"innere-heading-title\">Perfectshade have solved all of the hurdles to taking a perfect photo.</h3>\r\n					<ul class=\"inner-text-ul\">\r\n						<li> <i class=\"ion-arrow-right-c\"></i> A light ring that is calibrated at 5500K to mimic the most natural lighting</li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> A  Grey Key that is taken inside the photo to provide a constant neutral color</li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> And most importantly a proprietary mobile app that will adjust the photo to the perfect white balance.</li>\r\n					</ul>\r\n					\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</section>', 'About Us', 'about us', 'about us_description', 1);
INSERT INTO `contents` (`id`, `page_slug`, `page_title`, `content`, `meta_title`, `meta_key`, `meta_description`, `is_active`) VALUES
(2, 'how-it-works', 'How It Works', '<br><section class=\"inner-body-area\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n			<div class=\"col-lg-6 col-md-6 col-sm-6\">\r\n				<div class=\"about-pic-b\"><img style=\"width: 481px;\" src=\"data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMqaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjUtYzAxNCA3OS4xNTE0ODEsIDIwMTMvMDMvMTMtMTI6MDk6MTUgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTdFOTg5NTU3ODQ4MTFFNzkwNjlFMDM5RTEzQ0FGMjIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTdFOTg5NTY3ODQ4MTFFNzkwNjlFMDM5RTEzQ0FGMjIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBN0U5ODk1Mzc4NDgxMUU3OTA2OUUwMzlFMTNDQUYyMiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBN0U5ODk1NDc4NDgxMUU3OTA2OUUwMzlFMTNDQUYyMiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pv/uAA5BZG9iZQBkwAAAAAH/2wCEAAEBAQEBAQEBAQEBAQEBAQEBAQEB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aG0xvdHoMK3UNLGvu0prANYNqJi7IBmiD8g6+00du2BZ1Lw5xa/u4i4vkmc/glmrus2R9s5wjuzB27iIPVZmiAJfgXVAxUhamlgqURKIlESiJREoiURKIlESiJREoiURWizFh22sxW0eHmCFZyzMqq1v3AikU7yIeHKGoCGpBcxzkSFBw3EwFUKACAlUKQ5dX96vdVw/3q8PnS9UAi1SIF1tctAL4HkeDPE+gEkZIDgAQWvax7c14H441XgfVRfWJz2T6CaEmjZGjx5XtqSx4FWmoILS5pwxX5Ydy43uV9a10sTM5FmbemoTcdnIszmMDeRjnAlIDli5Ag7TaAYpgEhwKcpih8meNOC+IOAeIJuG+JITFfxGoIqWSsJOWWJ1BnjfTA4EEFrg17XNHuvh3iLSuKdKj1fSJM9q/Ag4OY4esx7ccr21xGwijmktIJo2sUU4lESiJREoiURKIsj3AZo5I0yk+MicrRw4s1oguIB21HLJO51nSJR113oJP0TG+woFe+PuT207LbiO8c0i1kksWNduLoxdue0c7RIwn5wXl37x00TptItw4ds1ty4jeGuMAaegljgOgrIdXuleZUoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIov80cyXJx94tZqzLZ5oQLpsG0DzEAFxt1HcKpKqSUfHtEHzVJ5HquSOFXoJkTIsmY6higA6iADAcU6nPo3D91qltk9ohjzNzCra1AFRUV28u1bG7o+E9P457ydI4S1Xtvs2+uuzl7IhsgYGOc4tJa4CgbUktIABJV87Al5WfsSyp6dQTbTk3aVty8y2SRO3SbyslDMnkigm3UOoogmk8WOUCGMYxQDQREQ1qWs5ZJrOKaYUlfG1zhsoS0E4dKw3XLW2sdavLKycXWcN1KyMk1JYyRzWkkUBJaAagCqq2rlRaURKIlESiJREoiURKIlESiJRFGnKOO8I2llCC5j5Kukthy2IcdXLYrq6Ze5I+3rLCz7slGK5211eeRKDxVtNCUI0gOEwF262gmqqZICwWoWWlW1+zie+k7GS2gdGXucGsyPIwfXbR3q4jE7CaLYXDevcYapw5N3T8P2xvbXVb+K5bCyJ0tx28LHCsOU9UGOvanKeoypc1odWSDdw3eN0HbRdF01dIpOGzluqRdu4brkKqiugskYyayKyZgMUxREpii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9rJA6NziXBpDDHXKMzQCPTnBHfrp+n6NFpXFEM7ri3jDGSxBrg9jRRudrnMIeAACRmDqZjQnG6HHPjEtiiTXvC7ZJhKXSozVYxrSKFwpGwyDrTziwunKLZZ5ILpACWoJkTSIJwDubgMXYvcN93eXuz1F/FPE9xDc8SOiMcTIcxiga/13Z3tY6SVw6nqtaxpeBnzBzcS7z+9qPjK0bomjRSQ6QJA97pKB8pb6oytLg1gPW9YuccpOWhBmHXqlaQSiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlEUQORXAzihyochLZmxDBzl0kbJtEr3h3Elal6FQR/sZF1cVtPIx7LtmgCIIovxdIJAY20gajWN61wjw9xA7tNTtmPuKUztJY/wALmkFwG4OqBuC2pwF3195vdrH7Lwlqs0OmlxcbeQMmt6naRFK17WF3xnR5HGgqTRRwx/6M3p/2DNITpsSyd7u2igKtGmQLzuO4YVFUokEDLwCT2PhpVPQogKT1ByiIGHUgjoIQln3ZcH2kol9ndK4bBI9zm/i1DT0OBCz/AFz72vfjrdo6yGqR2cThRzraCKKQjmlLXSMPPG5jsNu2uT6JiYqBjGELBxkfDQ0U0QYRcTEsm0dGRrFqmVFsyYMGaaLVm0bpFAqaaZCkIUAAAAKzyOOOGMRRNDYmigAAAAGwADAAcgXnO6urm9uH3l5JJNdyuLnve4ue9xNS5znEuc4nEkkknauwruqCURKIlEUQObf+Btr+GkJ/aE1Xlr733+yiP/6vb/1c63b3Bf6cv/xCX8uJYkq+Ya9npREoiURSd4f/AOHe2f8Axdcv94X9eh/us/7Z9O/xe7/6tItT99v+zu7/AGsH9cxZj6+rS8NpREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiK0GbcUfsx2alaXx773O3NMZj4h8L+L7vJoPUPL+U+Ixenc85rv7vTbptHXpqzvf7tP8AWtwo3hj232DLdxz9r2Pb/o2yNy5O1h2565s+FNhrhm/APGP8Da47WvZvaq274snadn6xYc2bJJsy7MuNduCiR+4D/wCtj/kJ/wBMq8w/7kv/AKm/8O/z5bn/AN4//ub/AKX/AJqn7gP/AK2P+Qn/AEyp/uS/+pv/AA7/AD5P94//ALm/6X/mqfuA/wDrY/5Cf9Mqf7kv/qb/AMO/z5P94/8A7m/6X/mqfuA/+tj/AJCf9Mqf7kv/AKm/8O/z5P8AeP8A+5v+l/5qrnYf4lfsUX3GXt+yB8e+HNpJv8M+9X4X3viLBwx3+d++SR7fZ7+7TtG3aaahrrWxO6z7sX+rTjO34v8Atv232eOVvZex9jm7WN0de09qlplzVpkNaUw2rE+Nu+f+MeHZtA+zfZu1dGe09o7SmR4fTL2DK1pT1hTbjsUyK9WrRqURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIlESiJREoiURKIv/Z\" data-filename=\"how-it-1.jpg\"><br></div>\r\n			</div>\r\n			<div class=\"col-lg-6 col-md-6 col-sm-6\">\r\n				<p class=\"inner-text inner-text-pad\">In the world of photography, there are two very important factors that make an image accurate.  EXPOSURE & WHITE BALANCE.  In dentistry to deliver the perfect restoration it must match the rest of the teeth perfectly!  This is much easier said than done.  The dental lab technician must have a perfect image of the tooth while he is coloring and characterizing the restorartion.  He needs more than just a shade value.  He needs a PERFECTSHADE image.    </p>\r\n\r\n			</div>\r\n		</div>\r\n		</div>		\r\n	</section>\r\n\r\n	<section class=\"inner-body-area-b\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n				<div class=\"col-lg-5 col-md-5 col-sm-5\">					\r\n					<ul class=\"inner-text-ul\">\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Dentist downloads the app to their phone (android or apple) and order the light ring from our website.</li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Dentist/dental assistant put the ring light on the phone (right light will work with most current models of phones on the market). </li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Dentist/dental assistant choose the closest shade using the Vita Shade Guide or any shade guide that the office normally use. </li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Dentist/dental assistant takes a photo with the shade guide and the grey key next to the tooth that needs to be color match.</li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> The app will ask the dentist to choose the grey key in the photo.  Once chosen the app will correct the white balance of the photo so that the shade of the tooth is accurate. </li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Send photo to the lab for dental technician!  </li>\r\n						<li> <i class=\"ion-arrow-right-c\"></i> Secure messaging about the case with your dental lab technician  </li>\r\n					</ul>\r\n					<!--<p class=\"inner-text\">Huy is a practicing dentist for 11 years and Minh has been working as a dental lab technician for 10 years.   Both Huy and Minh have worked together for many years.  During those years they have used traditional methods to take and send photos to achieve esthetic results for their patients.   After many years they have decided to build a system that every dentist use to get great results with the least amount of effort and costs.  </p>-->\r\n				</div>\r\n				<div class=\"col-lg-7 col-md-7 col-sm-7\">\r\n					<div class=\"about-pic\"><img style=\"width: 450px;\" src=\"data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMqaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjUtYzAxNCA3OS4xNTE0ODEsIDIwMTMvMDMvMTMtMTI6MDk6MTUgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NkFEMkMxNEE3ODQ5MTFFNzk5MTZFNTZDMUFDQ0RGRDQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NkFEMkMxNEI3ODQ5MTFFNzk5MTZFNTZDMUFDQ0RGRDQiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2QUQyQzE0ODc4NDkxMUU3OTkxNkU1NkMxQUNDREZENCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2QUQyQzE0OTc4NDkxMUU3OTkxNkU1NkMxQUNDREZENCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pv/uAA5BZG9iZQBkwAAAAAH/2wCEAAEBAQEBAQEBAQEBAQEBAQEBAQEB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\" data-filename=\"how-it-2.jpg\"><br></div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</section><p></p>', 'how-it-works', 'how-it-works_key', 'how-it-works_desc', 1);
INSERT INTO `contents` (`id`, `page_slug`, `page_title`, `content`, `meta_title`, `meta_key`, `meta_description`, `is_active`) VALUES
(6, 'terms-and-condition', 'Terms And Condition', '<h3>The legal basis of the service</h3><div class=\"dispatch-other-text\">\r\n    				<h2>Definitions</h2>\r\n    				<p>\"You or yours\" refers to yourself who has submitted your \r\npersonal information on this website agreeing to use the Online Clinic \r\nConsultation service.</p>\r\n\r\n<p>\"We or our\" refers to Index Medical Ltd, incorporated in England and \r\nWales with registered number 06797903 whose registered office is at 2 \r\nWestbury Mews, Westbury Hill, Westbury-on-Trym, Bristol, BS9 3QA.</p>\r\n\r\n<p>\"Website\" means the linked pages of ascotpharma.co.uk that allow an \r\nonline consultation to be performed for the purpose of issuing private \r\nprescriptions and supplying medication.</p>			\r\n\r\n<h2>Declaration</h2>\r\n    <ol><li>You declare you wish to take part in the Online Clinic \r\nConsultation service operated by Index Medical Ltd through the \r\nascotpharma.co.uk website. The online consultations are subject to the \r\nterms and conditions set out in this agreement.</li><li>You undertake that all information provided by you is correct and true.</li><li>Medication is prescribed in accordance with information you provide \r\nto our doctors through assessments on the website and by web-messages, \r\nemail and by telephone. We therefore take no liability for loss or \r\ndamage arising from our service or medication prescribed if you supply \r\nincorrect or incomplete information.</li><li>You will inform our doctors of any side effects of treatment and any\r\n other issues arising from treatments provided through the website.</li><li>You agree to inform your GP about medication supplied and advice given to you through the website.</li><li>We are not liable for damages which arise from your failure to \r\ninform your GP or other healthcare professional about treatment your \r\nreceive from the website.</li><li>We are not liable for any damages which results from your failure to follow advice given on the website.</li><li>You accept the advice that the website does not replace your GP and \r\nthat you should consult with your GP and other healthcare professionals \r\nwhen you are advised and as need arises.</li><li>You undertake to read carefully all product packaging and patient information leaflets supplied with your medication.</li><li>In the event that you do not fully understand the questions in the \r\nassessment part of the website or are unsure how you should answer those\r\n questions or you do not fully understand the advice or information \r\ngiven to you on the website you will seek clarification from the website\r\n doctors.</li><li>In the event your medicine appears to be damage or wrongly dispensed\r\n or delivery is delayed you agree to contact the dispensing pharmacy to \r\nseek advice and replacement as required.</li><li>You direct private prescriptions issued in your name from the \r\nascotpharma.co.uk website to be sent electronically on your behalf to a \r\nregistered UK pharmacy for a pharmacist to dispense the medication \r\nspecified and post it to you at the delivery adAscotess you provide. You \r\nare responsible for paying the pharmacy for dispensing and supply of \r\nmedication and agree we will make a disbursement on your behalf to cover\r\n this cost.</li><li>Prescriptions are issued entirely at the discretion of the \r\nprescriber. Index Medical Ltd cannot guarantee a consultation with a \r\ndoctor on the ascotpharma.co.uk website will result in a prescription \r\nbeing issued.</li><li>If any of these terms are held to be invalid or unenforceable then \r\nthe validity and enforceability of the remaining provisions shall not be\r\n affected.</li><li>You give your consent for information about yourself, your health \r\nand your current medications including, but not limited to, the \r\ninformation you divulge as part of the online consultation assessment to\r\n be viewed and exchanged by and between Index Medical Ltd employees and a\r\n Doctor working on Index Medical\'s behalf for the purpose of conducting a\r\n medical consultation. You understand this information may be exchanged \r\nelectronically.</li><li>All services provided by this Website and other Index Medical Ltd \r\ntechnologies are provided on a \'best endeavours\' basis. Consultations \r\nmade electronically from this Website will be forwarded to a Doctor as \r\nsoon as possible. Due to the range of third party networks and \r\ninnovative technology used for this transmission we are unable to \r\nguarantee a time of arrival of the consultation information for a \r\nDoctor\'s attention or absolutely guarantee that it will arrive at all.</li><li>We are not responsible for failure of third party companies\' \r\ninability to deliver medicines to the correct adAscotess or within any \r\nparticular time or date. You are responsible for signing for packages \r\ncontaining medicines but any signature provided by third parties at the \r\ndelivery adAscotess given by yourself will be deemed to be receipt of the \r\nmedicines.</li><li>You are responsible for providing valid credit or debit card details\r\n which may be charged if you are not exempt from payment. We reserve the\r\n right to not deliver medicines to you if your payment details have \r\nexpired or are invalid in any way. In such cases we will attempt to \r\ncontact you in such instances to enable you to provide updated \r\ninformation.</li><li>Payments are processed by Secure Trading on a \'continuous authority\'\r\n basis, allowing for further payments or refunds to your payment card if\r\n necessary.</li><li>To ensure that your credit, debit or charge card is not being used \r\nwithout your consent, we will validate name, adAscotess and other personal \r\ninformation supplied by you during the order process against appropriate\r\n third party databases. By accepting these terms and conditions you \r\nconsent to such checks being made. In performing these checks personal \r\ninformation provided by you may be disclosed to a registered Credit \r\nReference Agency which may keep a record of that information. You can \r\nrest assured that this is done only to confirm your identity, that a \r\ncredit check is not performed and that your credit rating will be \r\nunaffected. All information provided by you will be treated securely and\r\n strictly in accordance with the Data Protection Act 1998.</li><li>Index Medical Ltd and its directors or related companies shall not \r\nbe liable for any losses or claims arising directly or indirectly from \r\nuse of this website or its services except that this exclusion of \r\nliability does not apply to any damages in connection with death or \r\npersonal injury caused by the negligence of Index Medical Ltd, its \r\ndirectors or employees.</li><li>Your use of this website is governed by English Law and subject to the exclusive jurisdiction of the English courts.</li><li>Index Medical Ltd has taken care in the preparation of the content \r\nof this website. To the fullest extent permitted by the law Index \r\nMedical Ltd disclaims all warranties of any kind with respect to the \r\ncontent of this website.</li></ol>\r\n\r\n\r\n    			</div><p><br></p>', 'terms-and-condition', 'terms-and-condition_key', 'terms-and-condition_desc', 1),
(8, 'home', 'Home', '<p>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\r\n\r\n</p>', 'home', 'home', 'home', 1),
(9, 'privacy-policy', 'Privacy Policy', '<h3>The legal basis of the service</h3><div class=\"dispatch-other-text\">\r\n    				<h2>Definitions</h2>\r\n    				<p>\"You or yours\" refers to yourself who has submitted your \r\npersonal information on this website agreeing to use the Online Clinic \r\nConsultation service.</p>\r\n\r\n<p>\"We or our\" refers to Index Medical Ltd, incorporated in England and \r\nWales with registered number 06797903 whose registered office is at 2 \r\nWestbury Mews, Westbury Hill, Westbury-on-Trym, Bristol, BS9 3QA.</p>\r\n\r\n<p>\"Website\" means the linked pages of ascotpharma.co.uk that allow an \r\nonline consultation to be performed for the purpose of issuing private \r\nprescriptions and supplying medication.</p>			\r\n\r\n<h2>Declaration</h2>\r\n    <ol><li>You declare you wish to take part in the Online Clinic \r\nConsultation service operated by Index Medical Ltd through the \r\nascotpharma.co.uk website. The online consultations are subject to the \r\nterms and conditions set out in this agreement.</li><li>You undertake that all information provided by you is correct and true.</li><li>Medication is prescribed in accordance with information you provide \r\nto our doctors through assessments on the website and by web-messages, \r\nemail and by telephone. We therefore take no liability for loss or \r\ndamage arising from our service or medication prescribed if you supply \r\nincorrect or incomplete information.</li><li>You will inform our doctors of any side effects of treatment and any\r\n other issues arising from treatments provided through the website.</li><li>You agree to inform your GP about medication supplied and advice given to you through the website.</li><li>We are not liable for damages which arise from your failure to \r\ninform your GP or other healthcare professional about treatment your \r\nreceive from the website.</li><li>We are not liable for any damages which results from your failure to follow advice given on the website.</li><li>You accept the advice that the website does not replace your GP and \r\nthat you should consult with your GP and other healthcare professionals \r\nwhen you are advised and as need arises.</li><li>You undertake to read carefully all product packaging and patient information leaflets supplied with your medication.</li><li>In the event that you do not fully understand the questions in the \r\nassessment part of the website or are unsure how you should answer those\r\n questions or you do not fully understand the advice or information \r\ngiven to you on the website you will seek clarification from the website\r\n doctors.</li><li>In the event your medicine appears to be damage or wrongly dispensed\r\n or delivery is delayed you agree to contact the dispensing pharmacy to \r\nseek advice and replacement as required.</li><li>You direct private prescriptions issued in your name from the \r\nascotpharma.co.uk website to be sent electronically on your behalf to a \r\nregistered UK pharmacy for a pharmacist to dispense the medication \r\nspecified and post it to you at the delivery adAscotess you provide. You \r\nare responsible for paying the pharmacy for dispensing and supply of \r\nmedication and agree we will make a disbursement on your behalf to cover\r\n this cost.</li><li>Prescriptions are issued entirely at the discretion of the \r\nprescriber. Index Medical Ltd cannot guarantee a consultation with a \r\ndoctor on the ascotpharma.co.uk website will result in a prescription \r\nbeing issued.</li><li>If any of these terms are held to be invalid or unenforceable then \r\nthe validity and enforceability of the remaining provisions shall not be\r\n affected.</li><li>You give your consent for information about yourself, your health \r\nand your current medications including, but not limited to, the \r\ninformation you divulge as part of the online consultation assessment to\r\n be viewed and exchanged by and between Index Medical Ltd employees and a\r\n Doctor working on Index Medical\'s behalf for the purpose of conducting a\r\n medical consultation. You understand this information may be exchanged \r\nelectronically.</li><li>All services provided by this Website and other Index Medical Ltd \r\ntechnologies are provided on a \'best endeavours\' basis. Consultations \r\nmade electronically from this Website will be forwarded to a Doctor as \r\nsoon as possible. Due to the range of third party networks and \r\ninnovative technology used for this transmission we are unable to \r\nguarantee a time of arrival of the consultation information for a \r\nDoctor\'s attention or absolutely guarantee that it will arrive at all.</li><li>We are not responsible for failure of third party companies\' \r\ninability to deliver medicines to the correct adAscotess or within any \r\nparticular time or date. You are responsible for signing for packages \r\ncontaining medicines but any signature provided by third parties at the \r\ndelivery adAscotess given by yourself will be deemed to be receipt of the \r\nmedicines.</li><li>You are responsible for providing valid credit or debit card details\r\n which may be charged if you are not exempt from payment. We reserve the\r\n right to not deliver medicines to you if your payment details have \r\nexpired or are invalid in any way. In such cases we will attempt to \r\ncontact you in such instances to enable you to provide updated \r\ninformation.</li><li>Payments are processed by Secure Trading on a \'continuous authority\'\r\n basis, allowing for further payments or refunds to your payment card if\r\n necessary.</li><li>To ensure that your credit, debit or charge card is not being used \r\nwithout your consent, we will validate name, adAscotess and other personal \r\ninformation supplied by you during the order process against appropriate\r\n third party databases. By accepting these terms and conditions you \r\nconsent to such checks being made. In performing these checks personal \r\ninformation provided by you may be disclosed to a registered Credit \r\nReference Agency which may keep a record of that information. You can \r\nrest assured that this is done only to confirm your identity, that a \r\ncredit check is not performed and that your credit rating will be \r\nunaffected. All information provided by you will be treated securely and\r\n strictly in accordance with the Data Protection Act 1998.</li><li>Index Medical Ltd and its directors or related companies shall not \r\nbe liable for any losses or claims arising directly or indirectly from \r\nuse of this website or its services except that this exclusion of \r\nliability does not apply to any damages in connection with death or \r\npersonal injury caused by the negligence of Index Medical Ltd, its \r\ndirectors or employees.</li><li>Your use of this website is governed by English Law and subject to the exclusive jurisdiction of the English courts.</li><li>Index Medical Ltd has taken care in the preparation of the content \r\nof this website. To the fullest extent permitted by the law Index \r\nMedical Ltd disclaims all warranties of any kind with respect to the \r\ncontent of this website.</li></ol>\r\n\r\n\r\n    			</div><p><br></p>', 'privacy-policy', 'privacy-policy_key', 'privacy-policy_desc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_subscribers`
--

CREATE TABLE `email_subscribers` (
  `id` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_subscribers`
--

INSERT INTO `email_subscribers` (`id`, `email_id`, `date`, `status`) VALUES
(1, 'palash@natitsolved.com', '2018-01-24 05:53:27', 1),
(6, 'spandan@natitsolved.com', '2018-01-24 13:57:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `subject`, `content`) VALUES
(1, 'Forgot Password Request', '<div class=\"registration-body\">\r\n    <div class=\"container\">\r\n        <div class=\"row\"><br>\r\n        </div>        \r\n        <div class=\"row\">\r\n            <div class=\"col-md-7 col-md-offset-2\">\r\n                <div class=\"registration-body-area login-area\">\r\n                    <h4>Dear , [NAME]</h4>\r\n                    <p class=\"email-text\">Your new password is [PASSWORD] </p>  \r\n                      <p class=\"email-text\"><a href=\"[LINK]\">Click to reset your password.</a> </p>                 \r\n                    <p class=\"email-text\">From :&nbsp;Carvis&nbsp;Admin </p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div> '),
(2, 'Email Verification', '<div class=\"registration-body\">\r\n    <div class=\"container\">\r\n        <div class=\"row\"><br>\r\n        </div>        \r\n        <div class=\"row\">\r\n            <div class=\"col-md-7 col-md-offset-2\">\r\n                <div class=\"registration-body-area login-area\">\r\n                    <h4>Dear , [NAME]</h4>\r\n                    <p class=\"email-text\">Welcome for your new registration. Thanks to register at&nbsp;Carvis. </p>\r\n                    <p class=\"email-text\">Please Click on link as below, active your account. </p>\r\n                    <p class=\"email-text\"><a href=\"[LINK]\">Click to active your account.</a> </p>\r\n                    <p class=\"email-text\">From : Carvis Admin </p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div> '),
(3, 'Contact Us', '<div class=\"registration-body\">\r\n    <div class=\"container\">\r\n        <div class=\"row\"><div class=\"col-md-7 col-md-offset-2\"><div class=\"registration-body-area login-area\"><h4>Name: &nbsp;[NAME]</h4>\r\n                    <h4 style=\"color: rgb(0, 0, 0);\">Email: [EMAIL]</h4><h4 style=\"color: rgb(0, 0, 0);\"><span style=\"line-height: 1.1;\">Contact Number: [PHONE]</span></h4><h4 style=\"color: rgb(0, 0, 0);\">Title: [TITLE]</h4><h4 style=\"color: rgb(0, 0, 0);\">Message: [MESSAGE]</h4>\r\n                    <p class=\"email-text\">From : [EMAIL]</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div> ');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL,
  `club_name` int(11) NOT NULL,
  `music` varchar(222) DEFAULT NULL,
  `crowd` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `location` varchar(222) DEFAULT NULL,
  `event_description` text,
  `event_start_date` datetime DEFAULT NULL,
  `event_end_date` datetime DEFAULT NULL,
  `table_id` varchar(222) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `latitude`, `longitude`, `club_name`, `music`, `crowd`, `image`, `location`, `event_description`, `event_start_date`, `event_end_date`, `table_id`, `category_id`, `status`) VALUES
(1, 'Test Event', '22.6016106', '88.38219879999997', 1, 'Test 1', 'dssadas', '', 'Kolkata Station, Raicharan Sadhukhan Road, Belgachia, Kolkata, West Bengal, India', 'fdsf dff dsf dsf dsf dsf fdsf', '2017-11-03 13:39:00', '2017-12-01 13:39:00', '1,2', 2, 1),
(2, 'Lorem ipsum dolor sit amet', '16.7049873', '74.24325270000008', 2, 'song', 'test', '', 'Kolhapur, Maharashtra, India', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut quis nostrud exercitation.', '2017-11-02 13:56:00', '2017-12-01 13:56:00', '1,2', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `cat` varchar(25) NOT NULL DEFAULT 'general',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `cat`, `cat_id`, `is_active`) VALUES
(3, 'Are these medicines real?', '<p>Medicinesbymailbox only supplies labelled medicines that come from chief UK drug entities for trademarked medication process.</p>\r\n\r\n<p>Those in need of lower cost medicines, UK licensed generic versions available here are genuine too. We never replace inferior medicines with the other.</p>\r\n', 'general', 0, 1),
(4, 'What is the time for arrival?', '<p>Prescribed medicines are usually dispatched the very day of its order. It is typically delivered the day after dispatch or a day after (off on Saturdays and Sundays). For additional details, visit <strong>delivery page</strong></p>\r\n', 'general', 0, 1),
(5, 'Why Medicinesbymailbox offer lesser price?', '<p>Extensive promotion is not our priority. We want to deliver a pocket friendly service for complete customer satisfaction ratings.</p>\r\n', 'general', 0, 1),
(6, 'Who are the Doctors here?', '<p>All of them are British and registered with the General Medical Council. Most are experienced GPs. On each order you can also gather detailed information.</p>\r\n', 'general', 0, 1),
(7, 'Is payment and personal information safe?', '<p>Medicinesbymailbox is &#39;payment card industry compliant&#39;. Encryption before transmission is also served by it. Payment card details are not stored on the server. It directly goes to our card processing partner.</p>\r\n', 'general', 0, 1),
(8, 'Is the process legitimate?', '<p>Only a registered UK pharmacy with the General Pharmaceutical Council is linked with Medicinesbymailbox. Hence, its authentication process gets is inevitable.</p>\r\n', 'general', 0, 1),
(9, 'Are there any medicines not listed on the website?', '<p>No.</p>\r\n', 'general', 0, 1),
(10, 'Can we order by phone?', '<p>No.</p>\r\n', 'general', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `service_owner_id` int(11) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `service_id`, `user_id`, `service_owner_id`, `add_date`) VALUES
(9, 5, 56, 50, '2017-12-12 12:01:27'),
(10, 10, 56, 48, '2017-12-12 12:01:29'),
(11, 3, 56, 41, '2017-12-12 13:39:28'),
(12, 3, 55, 41, '2017-12-12 19:36:26'),
(14, 11, 56, 41, '2017-12-13 11:57:02'),
(15, 9, 56, 48, '2017-12-21 13:03:27'),
(19, 10, 55, 48, '2017-12-27 05:43:38'),
(34, 14, 55, 56, '2017-12-28 06:57:48'),
(35, 4, 55, 41, '2017-12-28 07:01:30'),
(47, NULL, 55, NULL, '2018-01-24 06:50:56'),
(48, 5, 55, 50, '2018-02-01 10:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `feature_name` varchar(255) DEFAULT NULL,
  `service_type_id` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `feature_name`, `service_type_id`, `description`, `status`) VALUES
(1, '24 Hour Access', '1,3,7,10', 'test', 1),
(3, 'Cleaning', '3,8', 'test', 1),
(5, 'Full car service', '1,3,10', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `interest_name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `interest_name`, `status`) VALUES
(2, 'gym', 1),
(3, 'yoga', 1),
(4, 'meditation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `id` int(11) NOT NULL,
  `make_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makes`
--

INSERT INTO `makes` (`id`, `make_name`, `status`) VALUES
(1, 'Honda', 1),
(3, 'Suzuki', 1),
(4, 'Proton', 1),
(5, 'Mazda', 1),
(6, 'Audi', 1),
(7, 'Perodua', 1);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `make_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `make_id`, `model_name`, `status`) VALUES
(1, 1, 'City', 1),
(2, 3, 'I10', 1),
(5, 5, 'CX-5', 1),
(6, 5, '6', 1),
(8, 5, '3', 1),
(9, 1, 'Civic', 1),
(10, 3, 'Swift ', 1),
(11, 6, 'A4', 1),
(12, 6, 'TT', 1),
(13, 7, 'Myvi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_texts`
--

CREATE TABLE `rating_texts` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `rating_value` varchar(255) DEFAULT NULL,
  `rating_text` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_texts`
--

INSERT INTO `rating_texts` (`id`, `type_id`, `rating_value`, `rating_text`, `is_active`) VALUES
(1, 1, '1', 'bad', 1),
(2, 1, '2', 'Average', 1),
(3, 1, '3', 'good', 1),
(5, 1, '4', 'very good', 1),
(6, 1, '5', 'Excelent', 1),
(7, 2, '1', 'bad', 1),
(8, 2, '2', 'not satisfactory', 1),
(9, 2, '3', 'need to work', 1),
(10, 2, '4', 'good', 1),
(11, 2, '5', 'very good', 1),
(12, 3, '1', 'bad', 1),
(13, 3, '2', 'need to work', 1),
(14, 3, '3', 'satisfactory', 1),
(15, 3, '4', 'very good', 1),
(16, 3, '5', 'nice', 1),
(17, 4, '1', 'need to work', 1),
(18, 4, '2', 'not satisfactory', 1),
(19, 4, '3', 'average', 1),
(20, 4, '4', 'nice', 1),
(21, 4, '5', 'awsome', 1),
(22, 1, '0', 'Bad', 1),
(23, 2, '0', 'Bad', 1),
(24, 3, '0', 'Bad', 1),
(25, 4, '0', 'Bad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_types`
--

CREATE TABLE `rating_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_types`
--

INSERT INTO `rating_types` (`id`, `type_name`, `is_active`) VALUES
(1, 'FOOD', 1),
(2, 'FRIENDLY', 1),
(3, 'AMBIENT', 1),
(4, 'SELECTION', 1),
(5, 'PRICEY', 1),
(6, 'COMFORTABLE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_details` text,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `service_provider_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `review_img` text,
  `rating` int(11) NOT NULL,
  `food` int(11) NOT NULL,
  `friendly` int(11) NOT NULL,
  `ambient` int(11) NOT NULL,
  `selection` int(11) NOT NULL,
  `pricey` int(11) NOT NULL,
  `comfortable` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `moderation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `address`, `address_details`, `latitude`, `longitude`, `tag`, `service_provider_id`, `service_id`, `review`, `review_img`, `rating`, `food`, `friendly`, `ambient`, `selection`, `pricey`, `comfortable`, `post_date`, `is_active`, `moderation`) VALUES
(23, 55, 'Kolkata, West Bengal, India', NULL, '22.572646', '88.36389499999996', 'gym-cheap,cool', 56, 14, 'good service', NULL, 4, 4, 5, 4, 3, 4, 4, '2017-12-19 01:15:57', 1, 1),
(24, 23, 'Kidderpore, Kolkata, West Bengal, India', NULL, '22.54206', '88.31895789999999', 'fhgdfh', 56, 14, 'asfsdfdsg', NULL, 5, 3, 3, 2, 3, 3, 3, '2017-12-20 05:14:28', 1, 1),
(25, 55, 'Sydney, New South Wales, Australia', '', '-33.8688197', '151.20929550000005', 'Cool,Jimja Favourite', 50, 6, 'good service', NULL, 3, 2, 2, 4, 5, 3, 3, '2017-12-27 07:30:18', 1, 1),
(26, 45, 'Kolkata, West Bengal, India', '', '22.572646', '88.36389499999996', 'Gluten Free', 47, 12, 'good', NULL, 4, 3, 2, 3, 2, 2, 3, '2017-12-27 01:13:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review_images`
--

CREATE TABLE `review_images` (
  `id` int(11) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_images`
--

INSERT INTO `review_images` (`id`, `review_id`, `image_name`) VALUES
(7, 3, '5a1514e083180.png'),
(8, 3, '5a1514e083250.png'),
(9, 1, '5a1516c45e48d.png'),
(10, 1, '5a1516c45e564.png'),
(11, 1, '5a1516c45e613.png'),
(18, 27, ''),
(19, 28, ''),
(20, 29, ''),
(21, 30, ''),
(22, 31, ''),
(23, 32, ''),
(24, 33, ''),
(25, 34, ''),
(26, 35, ''),
(27, 36, ''),
(28, 37, ''),
(29, 38, ''),
(30, 39, ''),
(31, 40, ''),
(32, 41, ''),
(33, 42, ''),
(34, 43, ''),
(35, 44, ''),
(36, 45, ''),
(37, 26, '5a4c7fca15230.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `service_tag_id` int(11) DEFAULT NULL,
  `service_feature_id` int(11) DEFAULT NULL,
  `description` text,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `provider_id`, `service_name`, `service_type_id`, `service_tag_id`, `service_feature_id`, `description`, `price`, `image`, `address`, `latitude`, `longitude`, `city_name`, `country`, `created`, `is_active`) VALUES
(5, 50, 'Car Surgeons', 1, 1, 1, 'Nice car service center.', NULL, '1512733967.jpeg', 'Sydney, New South Wales, Australia', '-33.8688197', '151.20929550000005', 'Sydney', 'Australia', '2018-01-24 07:52:57', 1),
(6, 50, 'The Car Clinic', 1, 1, 1, 'Power gym.win various award.', NULL, '1512732475.jpeg', 'Sydney Olympic Park, New South Wales, Australia', '-33.84801', '151.06488000000002', 'Sydney', 'Australia', '2018-02-13 05:41:47', 1),
(7, 50, 'Wax On Auto Detailing', 1, 1, 1, 'All tym masti.', NULL, '1512733939.jpeg', 'Sydney Road, Somerton, Victoria, Australia', '-37.6302591', '144.94903150000005', 'Sydney', 'Australia', '2018-01-03 06:52:33', 1),
(12, 47, 'Mountain Top Auto Shop', 1, 1, 1, 'Austelian resturent.', NULL, '1512735676.jpeg', 'Sydney, New South Wales, Australia', '-33.8688197', '151.20929550000005', 'Sydney', 'Australia', '2018-01-03 06:54:30', 1),
(14, 56, 'Rocket City Body Shop', 1, 1, 1, 'Nice gym fully air condition. All the equipment are present. Trainers are good.', NULL, '1514962233.jpg', 'Kolkata, West Bengal, India', '22.572646', '88.36389499999996', 'Kolkata', 'India', '2018-02-13 05:34:22', 1),
(15, 56, 'Gear service', 1, NULL, 1, 'safdasf', '111', '1515137116.jpg', 'Kolkata, West Bengal, India', '22.572646', '88.36389499999996', 'Kolkata', 'India', '2018-01-18 09:36:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_documents`
--

CREATE TABLE `service_provider_documents` (
  `id` int(11) NOT NULL,
  `serviceprovider_id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_documents`
--

INSERT INTO `service_provider_documents` (`id`, `serviceprovider_id`, `doc_name`, `status`) VALUES
(1, 48, '5a1404ac95e35.docx', 1),
(2, 49, '5a1432a514355.docx', 1),
(3, 50, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_features`
--

CREATE TABLE `service_provider_features` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_features`
--

INSERT INTO `service_provider_features` (`id`, `provider_id`, `service_id`, `feature_id`) VALUES
(43, 48, 10, 3),
(44, 48, 9, 3),
(45, 48, 8, 3),
(47, 41, 11, 1),
(48, 41, 4, 1),
(49, 41, 3, 1),
(70, 47, 12, 3),
(85, 50, 5, 3),
(87, 50, 6, 1),
(96, 56, 14, 5),
(98, 56, 15, 3),
(101, 50, 7, 1),
(102, 50, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_images`
--

CREATE TABLE `service_provider_images` (
  `id` int(11) NOT NULL,
  `serviceprovider_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_images`
--

INSERT INTO `service_provider_images` (`id`, `serviceprovider_id`, `image_name`, `status`) VALUES
(26, 2, '5a12a9eec156f.jpg', 1),
(27, 2, '5a12a9eec1627.jpg', 1),
(35, 51, '', 1),
(39, 0, '5a2e9e257a5fc.jpg', 1),
(40, 0, '5a2e9e257a685.jpg', 1),
(41, 0, '5a2e9ef912eec.jpg', 1),
(42, 0, '5a2e9ef912f7b.jpg', 1),
(43, 0, '5a2e9f34cdcf9.jpg', 1),
(59, 79, '5a4c7be725372.jpg', 1),
(60, 79, '5a4c7be7253e7.jpg', 1),
(61, 49, '5a4c7c2d41048.jpg', 1),
(62, 49, '5a4c7c2d410de.jpg', 1),
(63, 56, '5a4c7efbc6965.jpg', 1),
(64, 56, '5a4c7efbc6a06.jpg', 1),
(65, 50, '5a4c7f1477e10.jpg', 1),
(66, 48, '5a4c7f2dc4d5d.jpg', 1),
(67, 48, '5a4c7f2dc4df2.jpg', 1),
(68, 47, '5a4c7f489cf74.jpg', 1),
(69, 47, '5a4c7f489d00c.jpg', 1),
(70, 41, '5a4c7f6f96171.jpg', 1),
(71, 41, '5a4c7f6f961e3.jpg', 1),
(72, 41, '5a4c7f6f9623b.jpg', 1),
(73, 80, '5a4e3453318e1.jpg', 1),
(74, 81, '', 1),
(75, 82, '5a5cbb6eaeb43.JPG', 1),
(76, 83, '5a5cc45d0b848.png', 1),
(77, 84, '5a6051fa8333f.png', 1),
(78, 85, '5a6129f91638c.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_models`
--

CREATE TABLE `service_provider_models` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_models`
--

INSERT INTO `service_provider_models` (`id`, `provider_id`, `service_id`, `model_id`) VALUES
(41, 50, 5, 8),
(43, 50, 6, 5),
(52, 56, 14, 1),
(53, 56, 14, 9),
(54, 56, 14, 10),
(57, 56, 15, 1),
(58, 56, 15, 9),
(61, 50, 7, 11),
(62, 50, 7, 12);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_tags`
--

CREATE TABLE `service_provider_tags` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_tags`
--

INSERT INTO `service_provider_tags` (`id`, `provider_id`, `service_id`, `tag_id`) VALUES
(5, 49, 15, 2),
(6, 49, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_types`
--

CREATE TABLE `service_provider_types` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `min_price` float(10,2) NOT NULL,
  `max_price` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_types`
--

INSERT INTO `service_provider_types` (`id`, `provider_id`, `service_id`, `type_id`, `min_price`, `max_price`) VALUES
(12, 47, 12, 1, 200.00, 600.00),
(13, 47, 12, 3, 300.00, 1000.00),
(31, 50, 5, 1, 2000.00, 5000.00),
(33, 50, 6, 8, 200.00, 1500.00),
(40, 56, 14, 1, 0.00, 0.00),
(41, 56, 14, 15, 500.00, 1600.00),
(42, 56, 15, 1, 200.00, 500.00),
(43, 56, 15, 3, 500.00, 1000.00),
(44, 50, 7, 1, 2000.00, 2500.00);

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `description` text,
  `tag_id` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `icon`, `type_name`, `description`, `tag_id`, `status`) VALUES
(1, '1515145006.jpg', 'Drag and Tranny Repair', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(3, '1515144993.jpg', '4 Wheels Ac Repair', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(7, '1515144982.jpg', '4 Wheels servicing', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(8, '1515144970.jpg', 'Auto Repair', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(9, '1513775774.png', '2 Wheels Auto Repair', 'Wheel alignment and balancing for a pair of wheels of your choice.', NULL, 1),
(10, '1515144656.jpg', '4 Wheels Auto Repair', '4 Wheels Auto Repair done very carefully.', NULL, 1),
(12, '1515399268.jpeg', 'Oil change ', 'Engine oil change should generally be done at an interval of 6 months etc etc. ', NULL, 1),
(13, NULL, 'Test 1', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	 ', NULL, 1),
(14, NULL, 'test 2', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(15, NULL, 'test 3', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(16, NULL, 'test 4', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	', NULL, 1),
(30, NULL, 'test5', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 1),
(31, NULL, 'test6', 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_views`
--

CREATE TABLE `service_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `view_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_views`
--

INSERT INTO `service_views` (`id`, `user_id`, `service_id`, `view_date`) VALUES
(1, 55, 14, '2018-02-07'),
(2, 55, 12, '2018-02-07'),
(3, 55, 15, '2018-02-07'),
(4, 1, 15, '2018-02-23'),
(5, 1, 12, '2018-02-26'),
(6, 1, 14, '2018-02-22'),
(7, 1, 6, '2018-02-28'),
(8, 56, 15, '2018-02-19'),
(9, 56, 14, '2018-02-19'),
(10, 56, 12, '2018-02-19'),
(11, 56, 7, '2018-02-19'),
(12, 1, 0, '2018-02-22'),
(13, 1, 5, '2018-02-26'),
(14, 1, 7, '2018-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `site_title` varchar(255) NOT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_fax` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `video` varchar(255) NOT NULL,
  `site_favicon` varchar(255) NOT NULL,
  `site_meta_title` varchar(255) NOT NULL,
  `site_meta_key` varchar(255) NOT NULL,
  `site_meta_description` text NOT NULL,
  `site_meta_tags` text,
  `twitter_url` varchar(255) NOT NULL,
  `instagram_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `gplus_url` varchar(255) NOT NULL,
  `google_analytics` longtext NOT NULL,
  `sitemap` varchar(255) NOT NULL,
  `deliverycharges` text NOT NULL,
  `prescription_fee` text NOT NULL,
  `prescfee` float(10,2) NOT NULL,
  `uptoten` float(10,2) NOT NULL,
  `uptotwenty` float(10,2) NOT NULL,
  `uptofifty` float(10,2) NOT NULL,
  `uptohundred` float(10,2) NOT NULL,
  `abovehundred` float(10,2) NOT NULL,
  `bannerheading` varchar(255) NOT NULL,
  `bannerheading2` varchar(255) NOT NULL,
  `bannner_subtxt1` varchar(255) NOT NULL,
  `bannner_subtxt2` varchar(255) NOT NULL,
  `bannner_subtxt3` varchar(255) NOT NULL,
  `howit_heading1` varchar(255) NOT NULL,
  `howit_text1` text NOT NULL,
  `howit_heading2` varchar(200) NOT NULL,
  `howit_text2` text NOT NULL,
  `howit_heading3` varchar(200) NOT NULL,
  `howit_text3` text NOT NULL,
  `video_text` text NOT NULL,
  `home_videourl` text NOT NULL,
  `footer_text1` varchar(255) NOT NULL,
  `footer_logo` varchar(255) NOT NULL,
  `footer_logo_link` varchar(255) NOT NULL,
  `footer_logo2` varchar(255) NOT NULL,
  `footer_logo2_link` varchar(255) NOT NULL,
  `androaid_link` varchar(255) NOT NULL,
  `ios_link` varchar(255) NOT NULL,
  `is_stripe` tinyint(1) NOT NULL,
  `is_paypal` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_title`, `paypal_email`, `contact_email`, `contact_fax`, `contact_phone`, `site_logo`, `video`, `site_favicon`, `site_meta_title`, `site_meta_key`, `site_meta_description`, `site_meta_tags`, `twitter_url`, `instagram_url`, `youtube_url`, `facebook_url`, `gplus_url`, `google_analytics`, `sitemap`, `deliverycharges`, `prescription_fee`, `prescfee`, `uptoten`, `uptotwenty`, `uptofifty`, `uptohundred`, `abovehundred`, `bannerheading`, `bannerheading2`, `bannner_subtxt1`, `bannner_subtxt2`, `bannner_subtxt3`, `howit_heading1`, `howit_text1`, `howit_heading2`, `howit_text2`, `howit_heading3`, `howit_text3`, `video_text`, `home_videourl`, `footer_text1`, `footer_logo`, `footer_logo_link`, `footer_logo2`, `footer_logo2_link`, `androaid_link`, `ios_link`, `is_stripe`, `is_paypal`) VALUES
(1, 'Carvis', '', 'santanu@natitsolved.com', '', '1800 898 5652', 'logo.png', 'site_video.mp4', 'favicon.png', 'PoolRep', 'online treatments, low price, easy to getmedicine', 'Poolrep', '', '', 'https://www.instagram.com/', 'http://www.youtube.com', 'https://www.facebook.com/', '', '', '', '<p> UK delivery £2.90 per consultation via Royal Mail 24 Signed For (1-4 working days).</p>\r\n<p>Standard international delivery £5.90 flat rate via Royal Mail International Tracked & Signed (2-5 working days).</p>\r\n<p>Express international delivery £32.00 flat rate via DHL Express (2-8 days depending on destination, with tracking in transit). </p>', '<p>Medicinesbymailbox supplies medicine on prescription and charges a small prescription fee based on the order value of each prescription.Prescriptions are issued by our doctors online and sent electronically to our pharmacy.If you have your own private paper prescription please post to our pharmacy (details).Medicinesbymailbox prices are 25%–50% lower than other UK online clinics.</p>', 25.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Your Online Doctor and Pharmacy', 'Safer, easier, faster', 'No appointment – get your prescription online now', 'Discreet delivery by post', 'Safe, regulated care', 'Online Consulation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', 'Doctors Approval', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', 'Delivery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '<iframe width=\"333\" height=\"179\" src=\"https://www.youtube.com/embed/uhwnEKLSsPY\" frameborder=\"0\" allowfullscreen></iframe>', 'Carvis | All right reserved', 'footer_logo.jpg', 'https://www.google.co.in/?gfe_rd=cr&ei=-n3KWOKtDoXy8AfNwpLICA', 'footer_logo2.jpg', 'https://www.google.co.in/?gfe_rd=cr&ei=-n3KWOKtDoXy8AfNwpLICA', 'https://pc.androidlink.net/', 'https://developer.apple.com/', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `is_active`, `created`, `modified`) VALUES
(2, '1516604801.jpg', 1, '2017-12-04 06:33:54', '2018-01-22 07:06:41'),
(3, '1516604787.jpg', 1, '2017-12-04 06:37:39', '2018-01-22 07:06:27'),
(4, '1516630945.jpg', 1, '2018-01-22 07:06:51', '2018-01-22 14:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `status`) VALUES
(1, 'Gluten Free', 1),
(2, 'Vegeterian', 1),
(4, 'Macro-friendly', 1),
(5, 'Cool', 1),
(6, 'Jimja Favourite', 1);

-- --------------------------------------------------------

--
-- Table structure for table `timings`
--

CREATE TABLE `timings` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `from_time` varchar(100) NOT NULL,
  `to_time` varchar(100) NOT NULL,
  `is_active` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timings`
--

INSERT INTO `timings` (`id`, `company_id`, `day`, `from_time`, `to_time`, `is_active`) VALUES
(1, 25, 'Monday', '10:00am', '13:00pm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usefullinks`
--

CREATE TABLE `usefullinks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `add_date` datetime NOT NULL,
  `link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usefullinks`
--

INSERT INTO `usefullinks` (`id`, `title`, `add_date`, `link`) VALUES
(1, 'Google', '2017-08-29 12:26:46', 'https://www.google.co.in/?gfe_rd=cr&ei=Ul2lWcnIHITy8AeRiK-4Cg&gws_rd=ssl');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `working_days` text,
  `working_hours_from` varchar(255) DEFAULT NULL,
  `working_hours_to` varchar(255) DEFAULT NULL,
  `preference` varchar(255) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `service_type_id` varchar(100) DEFAULT NULL,
  `service_tag_id` varchar(255) DEFAULT NULL,
  `service_make_id` varchar(255) DEFAULT NULL,
  `service_model_id` varchar(255) DEFAULT NULL,
  `service_feature_id` varchar(255) DEFAULT NULL,
  `description` text,
  `pricing` text,
  `utype` int(11) NOT NULL DEFAULT '1' COMMENT 'Company = 2; User = 1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `is_mail_verified` int(11) NOT NULL DEFAULT '0',
  `pimg` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `check_by_admin` tinyint(2) NOT NULL DEFAULT '0',
  `check_verified` varchar(10) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `facebook_id` varchar(222) DEFAULT NULL,
  `google_id` varchar(222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `password`, `email`, `phone`, `gender`, `address`, `latitude`, `longitude`, `website`, `working_days`, `working_hours_from`, `working_hours_to`, `preference`, `interest`, `service_type_id`, `service_tag_id`, `service_make_id`, `service_model_id`, `service_feature_id`, `description`, `pricing`, `utype`, `created`, `modified`, `is_mail_verified`, `pimg`, `is_active`, `check_by_admin`, `check_verified`, `verified_date`, `facebook_id`, `google_id`) VALUES
(8, 'Bikash', '$2y$10$gOO/X9QVa9qxTnbtV3UOp.OgzOrurDOPKjzFCfQmIYZv66YtPq65e', 'bikash@mailinator.com', '0', '', 'London, United Kingdom', '51.5073509', '-0.12775829999998223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2017-09-07 10:01:49', '2018-01-03 06:02:55', 1, '1514959375.jpg', 1, 0, NULL, NULL, NULL, NULL),
(23, 'Test user', '$2y$10$Zf9ILwvDy3AT8ufAf3TeMO0XqlCdC0pTUgHwMjY4zuOvizFuI1.Wa', 't@gmail.com', '0', 'Male', 'New York, NY, United States', '40.7127753', '-74.0059728', NULL, NULL, NULL, NULL, '2', '2,3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2017-11-07 07:28:56', '2018-01-03 06:02:33', 1, '1514959353.jpg', 1, 0, NULL, NULL, NULL, NULL),
(42, 'Provider1', '$2y$10$aBMwIVfEfEhItiSaNN4NB.aRLrspJsi8beNZWJupUVp/IpbDsa7a6', 'p1@gmail.com', '9874563210', NULL, 'New York, NY, United States', '40.7127753', '-74.0059728', 'g.com', 'Monday,Tuesday,Wednesday,Thursday', '10am', '9pm', NULL, NULL, '1,7', NULL, NULL, NULL, NULL, 'test', 'test', 2, '2017-11-16 01:41:56', '2018-01-03 07:00:28', 1, '', 1, 1, 'N', '2017-11-20 10:10:20', NULL, NULL),
(45, 'sp test', '$2y$10$Shvcd.CMwbWrIcFNDQ0piu3cYkE2tgQohqVv/l5IoaWy07to17TCS', 'sp2@gmail.com', NULL, 'Male', 'New York, NY, United States', '40.7127753', '-74.0059728', NULL, NULL, NULL, NULL, '1,2', '2,3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2017-11-16 02:42:36', '2018-01-03 06:02:18', 1, '1514959338.jpg', 1, 0, NULL, NULL, NULL, NULL),
(47, 'Service Provider', NULL, 'gm@gmail.com', '9874563210', NULL, 'Kolkata, West Bengal, India', '22.572646', '88.36389499999996', 'gym.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '1hr', '11hr', NULL, NULL, '1,3,7,8', NULL, NULL, NULL, '1,3', '', '', 2, '2017-11-20 10:29:48', '2018-02-12 12:36:45', 1, '', 1, 1, 'Y', '2017-11-20 03:02:15', NULL, NULL),
(49, 'New Provider1', NULL, 'np1@gmail.com', '9874563210', NULL, 'Haridwar, Uttarakhand, India', '29.9456906', '78.1642478', 'gym.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday', '10am', '9pm', NULL, NULL, '1,3,7', NULL, NULL, NULL, '3', 'test', 'test', 2, '2017-11-21 02:05:27', '2018-01-03 06:46:07', 1, '', 1, 1, 'Y', '2018-01-15 03:11:21', NULL, NULL),
(50, 'New Tester', NULL, 'tes@gmail.com', '12343435', NULL, 'San Diego, CA, United States', '32.715738', '-117.16108380000003', 'wqw.com', 'Wednesday,Thursday,Friday,Saturday,Sunday', '1hr', '8hr', NULL, NULL, '1,7,8', NULL, '5,6', '11,12,5,6,8', '1,3', 'test.tes.tt.t..t..t.tt.t.t', '$$', 2, '2017-11-21 10:20:41', '2018-02-22 13:17:40', 1, '', 1, 1, 'Y', '2017-11-21 10:49:37', NULL, NULL),
(52, 'new', NULL, 'n@gmail.com', '9874563210', NULL, 'New Jersey, United States', '40.0583238', '-74.4056612', 'r.com', 'Tuesday,Wednesday', '10am', '9pm', NULL, NULL, '1,7', NULL, NULL, NULL, '3', 'test', 'test', 2, '2017-11-23 05:56:35', '2018-01-03 06:33:32', 1, '', 1, 1, 'N', '2018-01-15 03:11:45', NULL, NULL),
(55, 'spandan cool', '$2y$10$Qc3.N6mkVLKUus4c3qPdlu/gY74YRYZW7pqNQVoV91TAiu9DJGyUy', 'spandan@natitsolved.com', '9874563210', 'Male', 'New Town, West Bengal, India', '22.5977808', '88.47671679999996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2017-12-08 06:48:49', '2018-02-01 11:20:40', 1, '1514959319.jpg', 1, 0, NULL, NULL, NULL, NULL),
(56, 'Palash Nandi', '$2y$10$WAjVczQq64wfdwyW1qrcaeKeqyn6oroAqgb2OKWtiw4CCZKppgBJC', 'palash@natitsolved.com', '878756867', NULL, 'Kolkata, West Bengal, India', '22.572646', '88.36389499999996', 'fghfgh@gh.hjk', 'Monday,Tuesday,Wednesday,Thursday', '1hr', '10hr', NULL, NULL, '1,3,15', NULL, '1,3', '11,1', '3,5', 'Hi m Palash. we provide best car service in our area. We always maintain timely delivery. we work more than five years.', '56', 2, '2017-12-11 12:05:10', '2018-02-12 12:35:32', 1, '', 1, 1, 'Y', '2017-12-12 12:02:54', NULL, NULL),
(79, 'car service provider', NULL, 'ps@gmail.com', '9874563210', NULL, 'Kolkata, West Bengal, India', '22.572646', '88.36389499999996', 'psas.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '7am', '7pm', NULL, NULL, '1,3,7', NULL, '1', '1', '1', 'Nice shop for repair', 'cheap', 2, '2018-01-03 06:44:57', '2018-01-08 07:47:44', 1, '', 1, 1, 'Y', '2018-01-08 06:28:37', NULL, NULL),
(80, 'jdnfksdngkjdnfgh', NULL, 'fdgsdfh@mk.vdj', '52646464f', NULL, 'Ggantija, Xag?ra, Malta', '36.047526', '14.265901999999983', 'ghfg', 'Monday,Tuesday,Wednesday', '123r', 'fdghfd', NULL, NULL, '1,3', NULL, '1,3', NULL, '1', 'gfh', 'ghfdgh', 2, '2018-01-04 02:04:05', '2018-01-05 10:25:20', 1, '', 1, 1, 'N', '2018-01-15 03:11:40', NULL, NULL),
(81, 'Castrol rama', NULL, 'Castrolrama@gmail.com', '00981', NULL, 'Kuala Lumpur Federal Territory of Kuala Lumpur Malaysia', '3.139003', '101.68685499999992', 'www.castrolrama.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '08', '17', NULL, NULL, NULL, NULL, '1', NULL, '1', 'workshop servicing cars', '', 2, '2018-01-08 07:47:03', '2018-01-08 07:47:03', 1, '', 1, 1, 'Y', '2018-01-15 03:11:33', NULL, NULL),
(82, 'John\'s Auto Workshop', NULL, 'john@johnsworkshop.com', '+60122299761', NULL, '794 Massachusetts Avenue, Lexington, MA, United States', '42.430185', '-71.20801799999998', 'www.johnsworkshop.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '8a.m.', '8p.m.', NULL, NULL, NULL, NULL, '1,3,4,5', '1,9,5,6,8,2,10', '1,3,5', 'We offer cleaning and servicing of any vehicle of any make & model.', '$10,000', 2, '2018-01-15 02:32:17', '2018-01-15 15:10:44', 1, '', 1, 1, 'Y', '2018-01-15 03:11:27', NULL, NULL),
(83, 'Mike\'s Auto Workshop', NULL, 'mike@mikesworkshop.com', '+60122299761', NULL, '1235 Princes Highway, Heathmere, Victoria, Australia', '-38.19523969999999', '141.6158994', 'www.mikesworkshop.com', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '8a.m.', '8p.m.', NULL, NULL, NULL, NULL, '6', '11', '1', 'nil', 'nil', 2, '2018-01-15 03:10:22', '2018-01-15 03:10:22', 1, '', 1, 1, 'Y', '2018-01-15 03:11:04', NULL, NULL),
(85, 'Test', NULL, 'test@gmail.com', 'test', NULL, 'Testour, Beja, Tunisia', '36.54990000000001', '9.442266399999994', 'test', 'Monday,Tuesday,Wednesday,Thursday,Friday', '8', '8', NULL, NULL, '1,8,12,15', NULL, '1,7', '9,1,13', '3', 'test', NULL, 2, '2018-01-18 11:12:57', '2018-01-23 07:16:26', 1, '', 1, 1, 'Y', '2018-01-18 11:13:11', NULL, NULL),
(93, 'Santanu', '$2y$10$Hfv1HdX/XTA7jTjYVMBXFumeIq77Z2qJeNdN1r0Vhqyq.aDxHx5qq', 'santanu@natitsolved.com', '9874207080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-01-24 12:15:11', '2018-01-24 12:15:11', 1, '', 1, 0, NULL, NULL, NULL, NULL),
(94, 'Rahul Roy', '$2y$10$KRIVbjaVgSJQHWY5JPRjdOp0ZCB5cCd8jn4Sadvr84TYfiZxKZ/Ym', 'nits.santanu@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-01-24 12:20:13', '2018-01-24 12:20:13', 0, '', 1, 0, NULL, NULL, '1978555845754997', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applicants_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `key_no` int(11) NOT NULL,
  `remark` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `property_id`, `user_id`, `applicants_id`, `date`, `time`, `key_no`, `remark`) VALUES
(1, 9, 2, 0, '2017-10-11', '12:30:00', 0, 'vvvvvvvvvv'),
(2, 11, 2, 7, '2017-10-11', '12:30:00', 0, 'dddd'),
(3, 9, 2, 7, '2017-10-09', '01:00:00', 4, 'vvvvvvvvvvv'),
(4, 9, 2, 7, '2017-10-09', '01:00:00', 4, 'vvvvvvvvvvv'),
(5, 1, 1, 9, '2017-10-17', '02:00:00', 8, 'yyyy');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `visit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip_address`, `visit_date`) VALUES
(1, '192.168.1.1', '2018-03-20 05:27:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_commentmeta`
--
ALTER TABLE `blog_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `blog_links`
--
ALTER TABLE `blog_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `blog_options`
--
ALTER TABLE `blog_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `blog_postmeta`
--
ALTER TABLE `blog_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `blog_termmeta`
--
ALTER TABLE `blog_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `blog_terms`
--
ALTER TABLE `blog_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `blog_term_relationships`
--
ALTER TABLE `blog_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `blog_term_taxonomy`
--
ALTER TABLE `blog_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `blog_usermeta`
--
ALTER TABLE `blog_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `blog_users`
--
ALTER TABLE `blog_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_subscribers`
--
ALTER TABLE `email_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_texts`
--
ALTER TABLE `rating_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_types`
--
ALTER TABLE `rating_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_documents`
--
ALTER TABLE `service_provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_features`
--
ALTER TABLE `service_provider_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_images`
--
ALTER TABLE `service_provider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_models`
--
ALTER TABLE `service_provider_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_tags`
--
ALTER TABLE `service_provider_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_types`
--
ALTER TABLE `service_provider_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_views`
--
ALTER TABLE `service_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timings`
--
ALTER TABLE `timings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usefullinks`
--
ALTER TABLE `usefullinks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `blog_commentmeta`
--
ALTER TABLE `blog_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `blog_links`
--
ALTER TABLE `blog_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_options`
--
ALTER TABLE `blog_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;
--
-- AUTO_INCREMENT for table `blog_postmeta`
--
ALTER TABLE `blog_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `blog_termmeta`
--
ALTER TABLE `blog_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_terms`
--
ALTER TABLE `blog_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `blog_term_taxonomy`
--
ALTER TABLE `blog_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `blog_usermeta`
--
ALTER TABLE `blog_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `blog_users`
--
ALTER TABLE `blog_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `email_subscribers`
--
ALTER TABLE `email_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `rating_texts`
--
ALTER TABLE `rating_texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `rating_types`
--
ALTER TABLE `rating_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `service_provider_documents`
--
ALTER TABLE `service_provider_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `service_provider_features`
--
ALTER TABLE `service_provider_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `service_provider_images`
--
ALTER TABLE `service_provider_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `service_provider_models`
--
ALTER TABLE `service_provider_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `service_provider_tags`
--
ALTER TABLE `service_provider_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `service_provider_types`
--
ALTER TABLE `service_provider_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `service_views`
--
ALTER TABLE `service_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `timings`
--
ALTER TABLE `timings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usefullinks`
--
ALTER TABLE `usefullinks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

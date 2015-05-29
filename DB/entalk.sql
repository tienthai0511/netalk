/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : entalk

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-05-29 13:42:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `talkcommentmeta`
-- ----------------------------
DROP TABLE IF EXISTS `talkcommentmeta`;
CREATE TABLE `talkcommentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkcommentmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `talkcomments`
-- ----------------------------
DROP TABLE IF EXISTS `talkcomments`;
CREATE TABLE `talkcomments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkcomments
-- ----------------------------
INSERT INTO `talkcomments` VALUES ('1', '1', 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-05-29 01:27:25', '2015-05-29 01:27:25', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', '0', '1', '', '', '0', '0');
INSERT INTO `talkcomments` VALUES ('2', '1', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 01:38:40', '2015-05-29 01:38:40', 'thanks for sharing', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('3', '1', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 02:41:41', '2015-05-29 02:41:41', 'ád', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '2', '1');
INSERT INTO `talkcomments` VALUES ('4', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:44:41', '2015-05-29 04:44:41', 'comment phats', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('5', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:46:52', '2015-05-29 04:46:52', 'q', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('6', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:46:56', '2015-05-29 04:46:56', '34', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('7', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:49:03', '2015-05-29 04:49:03', 's', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('9', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:51:37', '2015-05-29 04:51:37', 'sdsd', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '7', '1');
INSERT INTO `talkcomments` VALUES ('10', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:53:50', '2015-05-29 04:53:50', 'ádasd', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '6', '1');
INSERT INTO `talkcomments` VALUES ('11', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 04:53:58', '2015-05-29 04:53:58', 'dfdfd', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '10', '1');
INSERT INTO `talkcomments` VALUES ('12', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 05:02:43', '2015-05-29 05:02:43', 'ê', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('13', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 05:02:49', '2015-05-29 05:02:49', 'rtrt', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '0', '1');
INSERT INTO `talkcomments` VALUES ('14', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 05:02:57', '2015-05-29 05:02:57', 'rrtrt', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '7', '1');
INSERT INTO `talkcomments` VALUES ('15', '17', 'thaivt', 'tienthai0511@gmail.com', '', '::1', '2015-05-29 05:03:04', '2015-05-29 05:03:04', 'điên mất thôi', '0', '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '', '14', '1');

-- ----------------------------
-- Table structure for `talklinks`
-- ----------------------------
DROP TABLE IF EXISTS `talklinks`;
CREATE TABLE `talklinks` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talklinks
-- ----------------------------

-- ----------------------------
-- Table structure for `talkoptions`
-- ----------------------------
DROP TABLE IF EXISTS `talkoptions`;
CREATE TABLE `talkoptions` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkoptions
-- ----------------------------
INSERT INTO `talkoptions` VALUES ('1', 'siteurl', 'http://localhost/talk', 'yes');
INSERT INTO `talkoptions` VALUES ('2', 'home', 'http://localhost/talk', 'yes');
INSERT INTO `talkoptions` VALUES ('3', 'blogname', 'Talk', 'yes');
INSERT INTO `talkoptions` VALUES ('4', 'blogdescription', 'Just another WordPress site', 'yes');
INSERT INTO `talkoptions` VALUES ('5', 'users_can_register', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('6', 'admin_email', 'tienthai0511@gmail.com', 'yes');
INSERT INTO `talkoptions` VALUES ('7', 'start_of_week', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('8', 'use_balanceTags', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('9', 'use_smilies', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('10', 'require_name_email', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('11', 'comments_notify', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('12', 'posts_per_rss', '10', 'yes');
INSERT INTO `talkoptions` VALUES ('13', 'rss_use_excerpt', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('14', 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `talkoptions` VALUES ('15', 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `talkoptions` VALUES ('16', 'mailserver_pass', 'password', 'yes');
INSERT INTO `talkoptions` VALUES ('17', 'mailserver_port', '110', 'yes');
INSERT INTO `talkoptions` VALUES ('18', 'default_category', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('19', 'default_comment_status', 'open', 'yes');
INSERT INTO `talkoptions` VALUES ('20', 'default_ping_status', 'open', 'yes');
INSERT INTO `talkoptions` VALUES ('21', 'default_pingback_flag', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('22', 'posts_per_page', '10', 'yes');
INSERT INTO `talkoptions` VALUES ('23', 'date_format', 'F j, Y', 'yes');
INSERT INTO `talkoptions` VALUES ('24', 'time_format', 'g:i a', 'yes');
INSERT INTO `talkoptions` VALUES ('25', 'links_updated_date_format', 'F j, Y g:i a', 'yes');
INSERT INTO `talkoptions` VALUES ('26', 'comment_moderation', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('27', 'moderation_notify', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('28', 'permalink_structure', '/%postname%/', 'yes');
INSERT INTO `talkoptions` VALUES ('29', 'gzipcompression', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('30', 'hack_file', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('31', 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `talkoptions` VALUES ('32', 'moderation_keys', '', 'no');
INSERT INTO `talkoptions` VALUES ('33', 'active_plugins', 'a:4:{i:0;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1;s:42:\"wordpress-social-login/wp-social-login.php\";i:2;s:27:\"wp-optimize/wp-optimize.php\";i:3;s:15:\"wpdiscuz/wc.php\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('34', 'category_base', '', 'yes');
INSERT INTO `talkoptions` VALUES ('35', 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `talkoptions` VALUES ('36', 'advanced_edit', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('37', 'comment_max_links', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('38', 'gmt_offset', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('39', 'default_email_category', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('40', 'recently_edited', '', 'no');
INSERT INTO `talkoptions` VALUES ('41', 'template', 'miomio', 'yes');
INSERT INTO `talkoptions` VALUES ('42', 'stylesheet', 'miomio', 'yes');
INSERT INTO `talkoptions` VALUES ('43', 'comment_whitelist', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('44', 'blacklist_keys', '', 'no');
INSERT INTO `talkoptions` VALUES ('45', 'comment_registration', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('46', 'html_type', 'text/html', 'yes');
INSERT INTO `talkoptions` VALUES ('47', 'use_trackback', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('48', 'default_role', 'subscriber', 'yes');
INSERT INTO `talkoptions` VALUES ('49', 'db_version', '31535', 'yes');
INSERT INTO `talkoptions` VALUES ('50', 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('51', 'upload_path', '', 'yes');
INSERT INTO `talkoptions` VALUES ('52', 'blog_public', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('53', 'default_link_category', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('54', 'show_on_front', 'posts', 'yes');
INSERT INTO `talkoptions` VALUES ('55', 'tag_base', '', 'yes');
INSERT INTO `talkoptions` VALUES ('56', 'show_avatars', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('57', 'avatar_rating', 'G', 'yes');
INSERT INTO `talkoptions` VALUES ('58', 'upload_url_path', '', 'yes');
INSERT INTO `talkoptions` VALUES ('59', 'thumbnail_size_w', '150', 'yes');
INSERT INTO `talkoptions` VALUES ('60', 'thumbnail_size_h', '150', 'yes');
INSERT INTO `talkoptions` VALUES ('61', 'thumbnail_crop', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('62', 'medium_size_w', '300', 'yes');
INSERT INTO `talkoptions` VALUES ('63', 'medium_size_h', '300', 'yes');
INSERT INTO `talkoptions` VALUES ('64', 'avatar_default', 'mystery', 'yes');
INSERT INTO `talkoptions` VALUES ('65', 'large_size_w', '1024', 'yes');
INSERT INTO `talkoptions` VALUES ('66', 'large_size_h', '1024', 'yes');
INSERT INTO `talkoptions` VALUES ('67', 'image_default_link_type', 'file', 'yes');
INSERT INTO `talkoptions` VALUES ('68', 'image_default_size', '', 'yes');
INSERT INTO `talkoptions` VALUES ('69', 'image_default_align', '', 'yes');
INSERT INTO `talkoptions` VALUES ('70', 'close_comments_for_old_posts', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('71', 'close_comments_days_old', '14', 'yes');
INSERT INTO `talkoptions` VALUES ('72', 'thread_comments', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('73', 'thread_comments_depth', '5', 'yes');
INSERT INTO `talkoptions` VALUES ('74', 'page_comments', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('75', 'comments_per_page', '50', 'yes');
INSERT INTO `talkoptions` VALUES ('76', 'default_comments_page', 'newest', 'yes');
INSERT INTO `talkoptions` VALUES ('77', 'comment_order', 'asc', 'yes');
INSERT INTO `talkoptions` VALUES ('78', 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `talkoptions` VALUES ('79', 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('80', 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('81', 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('82', 'uninstall_plugins', 'a:0:{}', 'no');
INSERT INTO `talkoptions` VALUES ('83', 'timezone_string', '', 'yes');
INSERT INTO `talkoptions` VALUES ('84', 'page_for_posts', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('85', 'page_on_front', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('86', 'default_post_format', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('87', 'link_manager_enabled', '0', 'yes');
INSERT INTO `talkoptions` VALUES ('88', 'initial_db_version', '31535', 'yes');
INSERT INTO `talkoptions` VALUES ('89', 'talkuser_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes');
INSERT INTO `talkoptions` VALUES ('90', 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('91', 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('92', 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('93', 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('94', 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('95', 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"right_sidebar\";a:9:{i:0;s:8:\"search-2\";i:1;s:19:\"ths_social_widget-2\";i:2;s:14:\"recent-posts-2\";i:3;s:18:\"ths_image_widget-2\";i:4;s:11:\"tag_cloud-2\";i:5;s:17:\"recent-comments-2\";i:6;s:10:\"archives-2\";i:7;s:12:\"categories-2\";i:8;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes');
INSERT INTO `talkoptions` VALUES ('97', 'cron', 'a:6:{i:1432884900;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1432906046;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1432949316;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1432949618;a:1:{s:14:\"redux_tracking\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1432949744;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes');
INSERT INTO `talkoptions` VALUES ('110', 'can_compress_scripts', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('129', 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('130', 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('131', 'widget_pages', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('133', 'widget_tag_cloud', 'a:3:{i:1;a:0:{}i:2;a:2:{s:5:\"title\";s:0:\"\";s:8:\"taxonomy\";s:8:\"post_tag\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('137', 'current_theme', 'Miomio', 'yes');
INSERT INTO `talkoptions` VALUES ('138', 'theme_mods_twentyfourteen', 'a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1432862940;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;s:9:\"sidebar-3\";N;}}}', 'yes');
INSERT INTO `talkoptions` VALUES ('139', 'theme_switched', '', 'yes');
INSERT INTO `talkoptions` VALUES ('142', 'theme_mods_twentythirteen', 'a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1432862964;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;}}}', 'yes');
INSERT INTO `talkoptions` VALUES ('144', 'theme_mods_miomio', 'a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:9:\"main-menu\";i:2;}}', 'yes');
INSERT INTO `talkoptions` VALUES ('145', 'redux-framework-tracking', 'a:3:{s:8:\"dev_mode\";b:0;s:4:\"hash\";s:32:\"5449542822d7fc7cf0236cf825b6f832\";s:14:\"allow_tracking\";s:2:\"no\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('146', 'global_theme_options', 'a:28:{s:8:\"last_tab\";s:1:\"0\";s:8:\"opt-logo\";a:5:{s:3:\"url\";s:79:\"http://localhost/talk/wp-content/uploads/2015/05/1419298845-358a2b73_resize.jpg\";s:2:\"id\";s:1:\"4\";s:6:\"height\";s:3:\"100\";s:5:\"width\";s:3:\"100\";s:9:\"thumbnail\";s:79:\"http://localhost/talk/wp-content/uploads/2015/05/1419298845-358a2b73_resize.jpg\";}s:11:\"opt-favicon\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:20:\"opt-switch-slideshow\";s:1:\"1\";s:20:\"opt-switch-copyright\";s:1:\"1\";s:13:\"opt-copyright\";s:9:\"Copyright\";s:14:\"opt-background\";a:4:{s:16:\"background-color\";s:7:\"#F1F1F1\";s:17:\"background-repeat\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:15:\"opt-color-theme\";s:7:\"#672d82\";s:16:\"opt-button-color\";s:7:\"#672d82\";s:22:\"opt-button-color-hover\";s:7:\"#672d82\";s:21:\"opt-menu-color-active\";s:7:\"#511C69\";s:20:\"opt-menu-color-hover\";s:7:\"#511C69\";s:17:\"opt-submenu-color\";s:7:\"#6A437C\";s:23:\"opt-submenu-color-hover\";s:7:\"#511C69\";s:14:\"opt-typography\";a:10:{s:11:\"font-family\";s:4:\"Abel\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:5:\"latin\";s:10:\"text-align\";s:0:\"\";s:9:\"font-size\";s:4:\"16px\";s:11:\"line-height\";s:4:\"24px\";s:5:\"color\";s:4:\"#333\";}s:6:\"opt-h1\";a:1:{s:9:\"font-size\";s:4:\"40px\";}s:6:\"opt-h2\";a:1:{s:9:\"font-size\";s:4:\"32px\";}s:6:\"opt-h3\";a:1:{s:9:\"font-size\";s:4:\"28px\";}s:6:\"opt-h4\";a:1:{s:9:\"font-size\";s:4:\"24px\";}s:6:\"opt-h5\";a:1:{s:9:\"font-size\";s:4:\"20px\";}s:6:\"opt-h6\";a:1:{s:9:\"font-size\";s:4:\"16px\";}s:14:\"opt-contact-sc\";s:46:\"[contact-form-7 id=\"6\" title=\"Contact form 1\"]\";s:12:\"opt-latitude\";s:9:\"41.321968\";s:13:\"opt-longitude\";s:8:\"19.82307\";s:14:\"opt-map-marker\";a:5:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:14:\"opt-custom-css\";s:0:\"\";s:13:\"opt-custom-js\";s:0:\"\";s:20:\"opt-google-analytics\";s:0:\"\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('147', 'global_theme_options-transients', 'a:3:{s:14:\"changed_values\";a:2:{s:8:\"last_tab\";s:0:\"\";s:14:\"opt-contact-sc\";s:0:\"\";}s:9:\"last_save\";i:1432863805;s:13:\"last_compiler\";i:1432863221;}', 'yes');
INSERT INTO `talkoptions` VALUES ('154', 'recently_activated', 'a:4:{s:47:\"simple-social-buttons/simple-social-buttons.php\";i:1432875744;s:55:\"ultimate-tag-cloud-widget/ultimate-tag-cloud-widget.php\";i:1432875738;s:69:\"simple-ajax-insert-comments-lite/simple-ajax-insert-comments-lite.php\";i:1432875734;s:43:\"wp-ajaxify-comments/wp-ajaxify-comments.php\";i:1432875120;}', 'yes');
INSERT INTO `talkoptions` VALUES ('155', 'wpcf7', 'a:1:{s:7:\"version\";s:5:\"4.1.2\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('165', 'widget_ths_social_widget', 'a:2:{i:2;a:6:{s:5:\"title\";s:6:\"Social\";s:8:\"facebook\";s:32:\"https://www.facebook.com/hoot.vn\";s:7:\"twitter\";s:0:\"\";s:7:\"youtube\";s:0:\"\";s:8:\"linkedin\";s:0:\"\";s:10:\"googleplus\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('166', 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes');
INSERT INTO `talkoptions` VALUES ('167', 'category_children', 'a:0:{}', 'yes');
INSERT INTO `talkoptions` VALUES ('171', 'widget_ths_image_widget', 'a:2:{i:2;a:5:{s:5:\"title\";s:0:\"\";s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";s:10:\"image_link\";s:0:\"\";s:9:\"image_uri\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('181', 'widget_utcw', 'a:2:{i:2;a:59:{s:8:\"strategy\";O:23:\"UTCW_PopularityStrategy\":0:{}s:5:\"order\";s:4:\"name\";s:14:\"tags_list_type\";s:7:\"exclude\";s:5:\"color\";s:4:\"none\";s:13:\"color_span_to\";s:0:\"\";s:15:\"color_span_from\";s:0:\"\";s:9:\"color_set\";a:0:{}s:8:\"taxonomy\";a:1:{i:0;s:8:\"post_tag\";}s:9:\"post_type\";a:1:{i:0;s:4:\"post\";}s:7:\"authors\";a:0:{}s:9:\"tags_list\";a:0:{}s:9:\"post_term\";a:0:{}s:9:\"size_from\";s:4:\"10px\";s:7:\"size_to\";s:4:\"30px\";s:3:\"max\";i:45;s:7:\"minimum\";i:1;s:8:\"days_old\";i:0;s:7:\"reverse\";b:1;s:14:\"case_sensitive\";b:1;s:19:\"post_term_query_var\";b:0;s:14:\"text_transform\";s:4:\"none\";s:14:\"link_underline\";s:7:\"default\";s:9:\"link_bold\";s:7:\"default\";s:11:\"link_italic\";s:7:\"default\";s:15:\"hover_underline\";s:7:\"default\";s:10:\"hover_bold\";s:7:\"default\";s:12:\"hover_italic\";s:7:\"default\";s:17:\"link_border_style\";s:4:\"none\";s:18:\"hover_border_style\";s:4:\"none\";s:9:\"alignment\";s:0:\"\";s:7:\"display\";s:6:\"inline\";s:10:\"title_type\";s:7:\"counter\";s:13:\"link_bg_color\";s:11:\"transparent\";s:14:\"hover_bg_color\";s:11:\"transparent\";s:17:\"link_border_color\";s:4:\"none\";s:11:\"hover_color\";s:7:\"default\";s:18:\"hover_border_color\";s:4:\"none\";s:14:\"letter_spacing\";s:6:\"normal\";s:12:\"word_spacing\";s:6:\"normal\";s:11:\"tag_spacing\";s:4:\"auto\";s:11:\"line_height\";s:7:\"inherit\";s:17:\"link_border_width\";s:3:\"0px\";s:18:\"hover_border_width\";s:3:\"0px\";s:5:\"title\";s:9:\"Tag Cloud\";s:9:\"separator\";s:1:\" \";s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:13:\"before_widget\";s:0:\"\";s:12:\"after_widget\";s:0:\"\";s:12:\"before_title\";s:0:\"\";s:11:\"after_title\";s:0:\"\";s:21:\"title_custom_template\";s:0:\"\";s:10:\"show_title\";b:1;s:10:\"show_links\";b:1;s:15:\"show_title_text\";b:1;s:15:\"show_post_count\";b:0;s:16:\"prevent_breaking\";b:0;s:19:\"avoid_theme_styling\";b:0;s:5:\"debug\";b:0;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('191', 'rewrite_rules', 'a:87:{s:10:\"project/?$\";s:27:\"index.php?post_type=project\";s:40:\"project/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=project&feed=$matches[1]\";s:35:\"project/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=project&feed=$matches[1]\";s:27:\"project/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=project&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?type=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:26:\"index.php?type=$matches[1]\";s:35:\"project/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"project/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"project/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"project/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"project/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"project/([^/]+)/trackback/?$\";s:34:\"index.php?project=$matches[1]&tb=1\";s:48:\"project/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?project=$matches[1]&feed=$matches[2]\";s:43:\"project/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?project=$matches[1]&feed=$matches[2]\";s:36:\"project/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&paged=$matches[2]\";s:43:\"project/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&cpage=$matches[2]\";s:28:\"project/([^/]+)(/[0-9]+)?/?$\";s:46:\"index.php?project=$matches[1]&page=$matches[2]\";s:24:\"project/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"project/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"project/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"project/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"project/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('194', 'wpac', 'a:17:{s:6:\"enable\";s:1:\"1\";s:14:\"textReloadPage\";s:30:\"Reloading page. Please wait…\";s:15:\"textPostComment\";s:36:\"Posting your comment. Please wait…\";s:19:\"textRefreshComments\";s:32:\"Loading comments. Please wait…\";s:20:\"textErrorTypeComment\";s:46:\"<strong>ERROR</strong>: please type a comment.\";s:23:\"textErrorCommentsClosed\";s:41:\"Sorry, comments are closed for this item.\";s:23:\"textErrorMustBeLoggedIn\";s:47:\"Sorry, you must be logged in to post a comment.\";s:28:\"textErrorInvalidEmailAddress\";s:70:\"<strong>ERROR</strong>: please fill the required fields (name, email).\";s:23:\"textErrorPostTooQuickly\";s:48:\"You are posting comments too quickly. Slow down.\";s:25:\"textErrorDuplicateComment\";s:74:\"Duplicate comment detected; it looks as though you’ve already said that!\";s:20:\"optimizeAjaxResponse\";s:1:\"1\";s:19:\"selectorCommentForm\";s:12:\"#commentform\";s:25:\"selectorCommentsContainer\";s:9:\"#comments\";s:26:\"selectorCommentPagingLinks\";s:27:\"#comments [class^=\'nav-\'] a\";s:20:\"selectorCommentLinks\";s:35:\"#comments a[href*=\"/comment-page-\"]\";s:24:\"selectorRespondContainer\";s:8:\"#respond\";s:22:\"selectorErrorContainer\";s:8:\"p:parent\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('199', 'wc_options', 's:1731:\"a:42:{s:13:\"wc_post_types\";a:1:{i:0;s:4:\"post\";}s:21:\"wc_comment_list_order\";s:4:\"desc\";s:27:\"wc_comment_list_update_type\";s:1:\"0\";s:28:\"wc_comment_list_update_timer\";s:2:\"30\";s:24:\"wc_comment_editable_time\";s:3:\"900\";s:22:\"wpdiscuz_redirect_page\";s:1:\"0\";s:20:\"wc_is_guest_can_vote\";s:1:\"1\";s:20:\"wc_load_all_comments\";i:0;s:27:\"wc_voting_buttons_show_hide\";i:0;s:26:\"wc_share_buttons_show_hide\";i:0;s:20:\"wc_captcha_show_hide\";i:0;s:19:\"wc_weburl_show_hide\";s:1:\"1\";s:24:\"wc_header_text_show_hide\";i:0;s:19:\"wc_avatar_show_hide\";i:0;s:26:\"wc_user_must_be_registered\";s:1:\"0\";s:25:\"wc_is_name_field_required\";s:1:\"1\";s:26:\"wc_is_email_field_required\";s:1:\"1\";s:30:\"wc_show_hide_loggedin_username\";s:1:\"1\";s:32:\"wc_reply_button_guests_show_hide\";i:0;s:33:\"wc_reply_button_members_show_hide\";i:0;s:26:\"wc_author_titles_show_hide\";i:0;s:16:\"wc_comment_count\";s:1:\"5\";s:21:\"wc_comments_max_depth\";s:1:\"3\";s:22:\"wc_simple_comment_date\";i:0;s:43:\"wc_comment_reply_checkboxes_default_checked\";i:0;s:29:\"wc_show_hide_comment_checkbox\";s:1:\"1\";s:31:\"wc_show_hide_all_reply_checkbox\";s:1:\"1\";s:27:\"wc_show_hide_reply_checkbox\";s:1:\"1\";s:41:\"wc_use_postmatic_for_comment_notification\";i:0;s:20:\"wc_comment_text_size\";s:4:\"14px\";s:16:\"wc_form_bg_color\";s:7:\"#f9f9f9\";s:19:\"wc_comment_bg_color\";s:7:\"#fefefe\";s:17:\"wc_reply_bg_color\";s:7:\"#f8f8f8\";s:21:\"wc_comment_text_color\";s:4:\"#555\";s:21:\"wc_author_title_color\";s:7:\"#00B38F\";s:19:\"wc_vote_reply_color\";s:7:\"#666666\";s:21:\"wc_input_border_color\";s:7:\"#d9d9d9\";s:30:\"wc_new_loaded_comment_bg_color\";s:16:\"rgb(255,250,214)\";s:13:\"wc_custom_css\";s:27:\".comments-area{width:auto;}\";s:25:\"wc_show_plugin_powerid_by\";s:1:\"1\";s:15:\"wc_is_use_po_mo\";i:0;s:26:\"wc_comment_text_max_length\";s:0:\"\";}\";', 'yes');
INSERT INTO `talkoptions` VALUES ('200', 'wc_plugin_version', '2.2.5', 'yes');
INSERT INTO `talkoptions` VALUES ('203', 'theme_mods_twentyfifteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1432879129;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:1:{i:0;s:11:\"tag_cloud-2\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes');
INSERT INTO `talkoptions` VALUES ('204', 'wsl_settings_welcome_panel_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('205', 'wsl_settings_redirect_url', 'http://localhost/talk', 'yes');
INSERT INTO `talkoptions` VALUES ('206', 'wsl_settings_force_redirect_url', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('207', 'wsl_settings_connect_with_label', 'Connect with:', 'yes');
INSERT INTO `talkoptions` VALUES ('208', 'wsl_settings_users_avatars', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('209', 'wsl_settings_use_popup', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('210', 'wsl_settings_widget_display', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('211', 'wsl_settings_authentication_widget_css', '.wp-social-login-connect-with {}\n.wp-social-login-provider-list {}\n.wp-social-login-provider-list a {}\n.wp-social-login-provider-list img {}\n.wsl_connect_with_provider {}', 'yes');
INSERT INTO `talkoptions` VALUES ('212', 'wsl_settings_bouncer_registration_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('213', 'wsl_settings_bouncer_authentication_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('214', 'wsl_settings_bouncer_profile_completion_require_email', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('215', 'wsl_settings_bouncer_profile_completion_change_username', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('216', 'wsl_settings_bouncer_new_users_moderation_level', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('217', 'wsl_settings_bouncer_new_users_membership_default_role', 'default', 'yes');
INSERT INTO `talkoptions` VALUES ('218', 'wsl_settings_bouncer_new_users_restrict_domain_enabled', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('219', 'wsl_settings_bouncer_new_users_restrict_domain_text_bounce', '<strong>This website is restricted to invited readers only.</strong><p>It doesn\'t look like you have been invited to access this site. If you think this is a mistake, you might want to contact the website owner and request an invitation.<p>', 'yes');
INSERT INTO `talkoptions` VALUES ('220', 'wsl_settings_bouncer_new_users_restrict_email_enabled', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('221', 'wsl_settings_bouncer_new_users_restrict_email_text_bounce', '<strong>This website is restricted to invited readers only.</strong><p>It doesn\'t look like you have been invited to access this site. If you think this is a mistake, you might want to contact the website owner and request an invitation.<p>', 'yes');
INSERT INTO `talkoptions` VALUES ('222', 'wsl_settings_bouncer_new_users_restrict_profile_enabled', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('223', 'wsl_settings_bouncer_new_users_restrict_profile_text_bounce', '<strong>This website is restricted to invited readers only.</strong><p>It doesn\'t look like you have been invited to access this site. If you think this is a mistake, you might want to contact the website owner and request an invitation.<p>', 'yes');
INSERT INTO `talkoptions` VALUES ('224', 'wsl_settings_contacts_import_facebook', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('225', 'wsl_settings_contacts_import_google', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('226', 'wsl_settings_contacts_import_twitter', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('227', 'wsl_settings_contacts_import_live', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('228', 'wsl_settings_contacts_import_linkedin', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('229', 'wsl_settings_buddypress_enable_mapping', '2', 'yes');
INSERT INTO `talkoptions` VALUES ('230', 'wsl_settings_buddypress_xprofile_map', '', 'yes');
INSERT INTO `talkoptions` VALUES ('231', 'wsl_settings_Facebook_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('232', 'wsl_settings_Google_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('233', 'wsl_settings_Twitter_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('234', 'wsl_components_core_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('235', 'wsl_components_networks_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('236', 'wsl_components_login-widget_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('237', 'wsl_components_bouncer_enabled', '1', 'yes');
INSERT INTO `talkoptions` VALUES ('239', 'wsl_settings_Facebook_app_scope', 'email, public_profile, user_friends', 'yes');
INSERT INTO `talkoptions` VALUES ('240', 'wsl_settings_Google_app_scope', 'profile https://www.googleapis.com/auth/plus.profile.emails.read', 'yes');
INSERT INTO `talkoptions` VALUES ('241', 'wsl_settings_GitHub_app_scope', 'user:email', 'yes');
INSERT INTO `talkoptions` VALUES ('247', 'wp-optimize-schedule', 'false', 'no');
INSERT INTO `talkoptions` VALUES ('248', 'wp-optimize-last-optimized', 'Never', 'no');
INSERT INTO `talkoptions` VALUES ('249', 'wp-optimize-schedule-type', 'wpo_weekly', 'no');
INSERT INTO `talkoptions` VALUES ('250', 'wp-optimize-retention-enabled', 'false', 'no');
INSERT INTO `talkoptions` VALUES ('251', 'wp-optimize-retention-period', '2', 'no');
INSERT INTO `talkoptions` VALUES ('252', 'wp-optimize-enable-admin-menu', 'false', 'no');
INSERT INTO `talkoptions` VALUES ('253', 'wp-optimize-email', 'true', 'no');
INSERT INTO `talkoptions` VALUES ('254', 'wp-optimize-total-cleaned', '0', 'no');
INSERT INTO `talkoptions` VALUES ('255', 'wp-optimize-auto', 'a:8:{s:9:\"revisions\";s:4:\"true\";s:6:\"drafts\";s:4:\"true\";s:5:\"spams\";s:4:\"true\";s:10:\"unapproved\";s:5:\"false\";s:9:\"transient\";s:5:\"false\";s:8:\"postmeta\";s:5:\"false\";s:4:\"tags\";s:5:\"false\";s:8:\"optimize\";s:4:\"true\";}', 'yes');
INSERT INTO `talkoptions` VALUES ('256', 'wp-optimize-settings', 'a:5:{s:14:\"user-revisions\";b:1;s:11:\"user-drafts\";b:1;s:10:\"user-spams\";b:1;s:15:\"user-unapproved\";b:1;s:13:\"user-optimize\";b:1;}', 'yes');
INSERT INTO `talkoptions` VALUES ('263', '_transient_timeout_feed_696c5cae47c2819ede33327da4ef81e5', '1432924881', 'no');
INSERT INTO `talkoptions` VALUES ('264', '_transient_feed_696c5cae47c2819ede33327da4ef81e5', 'a:4:{s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"feed\";a:1:{i:0;a:6:{s:4:\"data\";s:18:\"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\";s:7:\"attribs\";a:1:{s:36:\"http://www.w3.org/XML/1998/namespace\";a:1:{s:4:\"lang\";s:2:\"en\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"WP-Optimize\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"text\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"Jekyll\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:3:\"uri\";s:33:\"https://github.com/mojombo/jekyll\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:4:\"link\";a:2:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:20:\"application/atom+xml\";s:4:\"href\";s:43:\"http://wp-optimize.ruhanirabin.com/feed.xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}i:1;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:9:\"alternate\";s:4:\"type\";s:9:\"text/html\";s:4:\"href\";s:35:\"http://wp-optimize.ruhanirabin.com/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:7:\"updated\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-10-17T18:09:13+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:2:\"id\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"http://wp-optimize.ruhanirabin.com/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:6:\"author\";a:1:{i:0;a:6:{s:4:\"data\";s:10:\"\n  \n  \n  \n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:3:{s:4:\"name\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Ruhani Rabin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:3:\"uri\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"http://wp-optimize.ruhanirabin.com/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:5:\"email\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"get@email.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}}s:5:\"entry\";a:3:{i:0;a:6:{s:4:\"data\";s:22:\"\n  \n  \n  \n  \n  \n  \n  \n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"URGENT BugFix: 1.8.9.7\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:9:\"alternate\";s:4:\"type\";s:9:\"text/html\";s:4:\"href\";s:57:\"http://wp-optimize.ruhanirabin.com/urgent-bugfix-1-8-9-7/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:2:\"id\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"http://wp-optimize.ruhanirabin.com/urgent-bugfix-1-8-9-7\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:9:\"published\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-09-08T10:19:26+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:7:\"updated\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-09-08T10:19:26+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:6:\"author\";a:1:{i:0;a:6:{s:4:\"data\";s:18:\"\n    \n    \n    \n  \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:3:{s:4:\"name\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Ruhani Rabin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:3:\"uri\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"http://wp-optimize.ruhanirabin.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:5:\"email\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"get@email.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}}s:7:\"content\";a:1:{i:0;a:5:{s:4:\"data\";s:1496:\"<p>Just after releasing the previous update with new changes; I have noticed that the <strong>Disable/Enable trackback/comments buttons</strong> on the setting screen causing the <strong>AUTO SCHEDULE</strong> option to reset itself. </p>\n\n<p>In fact, executing any of the <strong>Disable/Enable trackback/comments buttons</strong> will disable the <strong>AUTO SCHEDULE</strong> option, ==you will still be able to enable it by clicking the checkbox==. </p>\n\n<p><img src=\"http://wp-optimize.ruhanirabin.com/images/enable-disable-trackback-comments-update2.png\" alt=\"Image\" /></p>\n\n<p><em>I’ve made the _necessary changes_ and re-organize the Settings Screen so this does not happen again. Refer to the new screen above.</em></p>\n\n<h2 id=\"how-does-the-new-screen-work\">How does the new screen work?</h2>\n<ol>\n  <li>If you want to disable or enable trackbacks and comments, select the dropdown list for each of them. </li>\n  <li>Press <strong>SAVE SETTINGS</strong>, it will enable or disable the corresponding feature such as Trackbacks and Comments.</li>\n  <li><strong>This only reflects the ==published posts==</strong>, the reason of doing that is - ==Drafts or unpublished post you may choose to enable comments or trackbacks, it is up to you.== </li>\n</ol>\n\n  <p><a href=\"http://wp-optimize.ruhanirabin.com/urgent-bugfix-1-8-9-7/\">URGENT BugFix: 1.8.9.7</a> was originally published by Ruhani Rabin at <a href=\"http://wp-optimize.ruhanirabin.com\">WP-Optimize</a> on September 08, 2014.</p>\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}i:1;a:6:{s:4:\"data\";s:22:\"\n  \n  \n  \n  \n  \n  \n  \n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Changes in v1.8.9.6\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:9:\"alternate\";s:4:\"type\";s:9:\"text/html\";s:4:\"href\";s:55:\"http://wp-optimize.ruhanirabin.com/changes-in-v1-8-9-6/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:2:\"id\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"http://wp-optimize.ruhanirabin.com/changes-in-v1-8-9-6\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:9:\"published\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-09-04T11:21:19+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:7:\"updated\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-09-04T11:21:19+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:6:\"author\";a:1:{i:0;a:6:{s:4:\"data\";s:18:\"\n    \n    \n    \n  \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:3:{s:4:\"name\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Ruhani Rabin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:3:\"uri\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"http://wp-optimize.ruhanirabin.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:5:\"email\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"get@email.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}}s:7:\"content\";a:1:{i:0;a:5:{s:4:\"data\";s:925:\"<h3 id=\"whats-changed\">What’s changed</h3>\n<p><img src=\"http://wp-optimize.ruhanirabin.com/images/enable-disable-trackbacks.png\" alt=\"Image\" /></p>\n\n<ol>\n  <li>There were few <strong>number formatting problem</strong> and detection of InnoDB table format. Charles Dee Rice solved the problems that I missed out. Thank you!</li>\n  <li>Now has the ability to batch <strong>enable/disable trackbacks and comments</strong> for <strong><em>all your published posts</em></strong>. Please remember this is a batch operation. If there is a post that was disabled but the rest of the other posts were enabled, the batch operation will reset it. </li>\n  <li>Other code optimizations and cleanup</li>\n</ol>\n\n  <p><a href=\"http://wp-optimize.ruhanirabin.com/changes-in-v1-8-9-6/\">Changes in v1.8.9.6</a> was originally published by Ruhani Rabin at <a href=\"http://wp-optimize.ruhanirabin.com\">WP-Optimize</a> on September 04, 2014.</p>\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}i:2;a:6:{s:4:\"data\";s:25:\"\n  \n  \n  \n  \n  \n  \n  \n  \n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"What\'s new in release v.1.8.9\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"rel\";s:9:\"alternate\";s:4:\"type\";s:9:\"text/html\";s:4:\"href\";s:72:\"http://wp-optimize.ruhanirabin.com/whats-new-in-release-v-dot-1-8-dot-9/\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:2:\"id\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"http://wp-optimize.ruhanirabin.com/whats-new-in-release-v-dot-1-8-dot-9\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:7:\"updated\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"2014-06-13 23:06:06 +0000T00:00:00-00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:9:\"published\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"2014-05-12T00:00:00+00:00\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:6:\"author\";a:1:{i:0;a:6:{s:4:\"data\";s:18:\"\n    \n    \n    \n  \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";s:5:\"child\";a:1:{s:27:\"http://www.w3.org/2005/Atom\";a:3:{s:4:\"name\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Ruhani Rabin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:3:\"uri\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"http://wp-optimize.ruhanirabin.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}s:5:\"email\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"get@email.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}}s:7:\"content\";a:1:{i:0;a:5:{s:4:\"data\";s:2514:\"<p>There are a lot of stuff that has been re-coded in this release. </p>\n\n<h3 id=\"most-notable-changes-are\">Most notable changes are:</h3>\n\n<ol>\n  <li>\n    <p>Persistent settings for main screen: Allows user to save the checkbox selection on the main screen so next time they do not need to select the items they use frequently. Red marked items could not be saved. <img src=\"http://wp-optimize.ruhanirabin.com/images/2014-05-12-1.png\" alt=\"Image\" /></p>\n  </li>\n  <li>\n    <p>Credits page has been re-organized with proper information and links. Now includes GitHub master branch commits.</p>\n  </li>\n  <li>\n    <p>Now cleans up redundant comment meta data and akismet left over data from comments meta data table. </p>\n  </li>\n  <li>\n    <p>Time settings according to the blog local time, so schedules and time display will show time properly. This would only work if the blog time has been set up properly</p>\n  </li>\n  <li>\n    <p>I have enabled mixed type tables optimization. So basically what will it do? It will enable you to run optimization if you have mixed of innoDB and MyISAM tables. But, it will skip the optimization commands on innoDB tables. Some tables may report wrong size, haven’t been able to find a proper workaround to this. </p>\n  </li>\n  <li>\n    <p>New table type column - this gives you an overlook of what types of tables you have on your database.  <img src=\"http://wp-optimize.ruhanirabin.com/images/table-type-display.png\" alt=\"Image\" /></p>\n  </li>\n  <li>\n    <p>InnoDB table type <strong>Overhead Size</strong>  are set to <strong>0 bytes</strong> because most of the time they report wrong overhead size.</p>\n  </li>\n  <li>\n    <p>Shows last blog post from GitHub Pages for WP-Optimize at the <strong>Status Log</strong></p>\n  </li>\n  <li>\n    <p><strong>Independent translation portal</strong> for Translators to live update translations before actual releases. So their translation at always in sync. <strong><a href=\"http://wp-optimize.ruhanirabin.com/translations/\">Read instructions</a></strong> <img src=\"http://wp-optimize.ruhanirabin.com/images/translations-interface.png\" alt=\"Image\" /></p>\n  </li>\n  <li>\n    <p>Updated SQL Queries to include backticks for better compatibilty with reserved names. </p>\n  </li>\n</ol>\n\n\n  <p><a href=\"http://wp-optimize.ruhanirabin.com/whats-new-in-release-v-dot-1-8-dot-9/\">What\'s new in release v.1.8.9</a> was originally published by Ruhani Rabin at <a href=\"http://wp-optimize.ruhanirabin.com\">WP-Optimize</a> on May 12, 2014.</p>\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:4:\"type\";s:4:\"html\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:2:\"en\";}}}}}}}}}}}}s:4:\"type\";i:512;s:7:\"headers\";a:18:{s:6:\"server\";s:10:\"GitHub.com\";s:12:\"content-type\";s:23:\"text/xml; charset=utf-8\";s:13:\"last-modified\";s:29:\"Fri, 17 Oct 2014 18:09:15 GMT\";s:27:\"access-control-allow-origin\";s:1:\"*\";s:7:\"expires\";s:29:\"Wed, 27 May 2015 04:19:27 GMT\";s:13:\"cache-control\";s:11:\"max-age=600\";s:16:\"content-encoding\";s:4:\"gzip\";s:14:\"content-length\";s:4:\"2660\";s:13:\"accept-ranges\";s:5:\"bytes\";s:4:\"date\";s:29:\"Fri, 29 May 2015 06:41:02 GMT\";s:3:\"via\";s:11:\"1.1 varnish\";s:3:\"age\";s:1:\"5\";s:10:\"connection\";s:5:\"close\";s:11:\"x-served-by\";s:17:\"cache-hkg6827-HKG\";s:7:\"x-cache\";s:3:\"HIT\";s:12:\"x-cache-hits\";s:2:\"43\";s:7:\"x-timer\";s:26:\"S1432881662.367789,VS0,VE0\";s:4:\"vary\";s:15:\"Accept-Encoding\";}s:5:\"build\";s:14:\"20130910210210\";}', 'no');
INSERT INTO `talkoptions` VALUES ('265', '_transient_timeout_feed_mod_696c5cae47c2819ede33327da4ef81e5', '1432924881', 'no');
INSERT INTO `talkoptions` VALUES ('266', '_transient_feed_mod_696c5cae47c2819ede33327da4ef81e5', '1432881681', 'no');
INSERT INTO `talkoptions` VALUES ('267', 'wp-optimize-current-cleaned', '0', 'yes');

-- ----------------------------
-- Table structure for `talkpostmeta`
-- ----------------------------
DROP TABLE IF EXISTS `talkpostmeta`;
CREATE TABLE `talkpostmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkpostmeta
-- ----------------------------
INSERT INTO `talkpostmeta` VALUES ('1', '2', '_wp_page_template', 'default');
INSERT INTO `talkpostmeta` VALUES ('2', '4', '_wp_attached_file', '2015/05/1419298845-358a2b73_resize.jpg');
INSERT INTO `talkpostmeta` VALUES ('3', '4', '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:100;s:6:\"height\";i:100;s:4:\"file\";s:38:\"2015/05/1419298845-358a2b73_resize.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `talkpostmeta` VALUES ('4', '5', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('5', '5', '_edit_lock', '1432863247:1');
INSERT INTO `talkpostmeta` VALUES ('6', '5', 'portfolio_link', '');
INSERT INTO `talkpostmeta` VALUES ('7', '5', 'project_skills', '');
INSERT INTO `talkpostmeta` VALUES ('8', '6', '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit \"Send\"]</p>');
INSERT INTO `talkpostmeta` VALUES ('9', '6', '_mail', 'a:8:{s:7:\"subject\";s:14:\"[your-subject]\";s:6:\"sender\";s:36:\"[your-name] <tienthai0511@gmail.com>\";s:4:\"body\";s:163:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Talk (http://localhost/talk)\";s:9:\"recipient\";s:22:\"tienthai0511@gmail.com\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}');
INSERT INTO `talkpostmeta` VALUES ('10', '6', '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:14:\"[your-subject]\";s:6:\"sender\";s:29:\"Talk <tienthai0511@gmail.com>\";s:4:\"body\";s:105:\"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Talk (http://localhost/talk)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:32:\"Reply-To: tienthai0511@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}');
INSERT INTO `talkpostmeta` VALUES ('11', '6', '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:43:\"Your message was sent successfully. Thanks.\";s:12:\"mail_sent_ng\";s:93:\"Failed to send your message. Please try later or contact the administrator by another method.\";s:16:\"validation_error\";s:74:\"Validation errors occurred. Please confirm the fields and submit it again.\";s:4:\"spam\";s:93:\"Failed to send your message. Please try later or contact the administrator by another method.\";s:12:\"accept_terms\";s:35:\"Please accept the terms to proceed.\";s:16:\"invalid_required\";s:34:\"Please fill in the required field.\";s:16:\"invalid_too_long\";s:23:\"This input is too long.\";s:17:\"invalid_too_short\";s:24:\"This input is too short.\";}');
INSERT INTO `talkpostmeta` VALUES ('12', '6', '_additional_settings', '');
INSERT INTO `talkpostmeta` VALUES ('13', '6', '_locale', 'en_US');
INSERT INTO `talkpostmeta` VALUES ('14', '1', '_edit_lock', '1432873033:1');
INSERT INTO `talkpostmeta` VALUES ('15', '7', '_wp_attached_file', '2015/05/100H-823x400.jpg');
INSERT INTO `talkpostmeta` VALUES ('16', '7', '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:823;s:6:\"height\";i:400;s:4:\"file\";s:24:\"2015/05/100H-823x400.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"100H-823x400-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"100H-823x400-300x146.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:146;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"blog\";a:4:{s:4:\"file\";s:24:\"100H-823x400-325x260.jpg\";s:5:\"width\";i:325;s:6:\"height\";i:260;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:7:\"project\";a:4:{s:4:\"file\";s:24:\"100H-823x400-276x207.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"single-project\";a:4:{s:4:\"file\";s:24:\"100H-823x400-476x357.jpg\";s:5:\"width\";i:476;s:6:\"height\";i:357;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `talkpostmeta` VALUES ('17', '1', '_thumbnail_id', '7');
INSERT INTO `talkpostmeta` VALUES ('18', '1', 'featured_post', '0');
INSERT INTO `talkpostmeta` VALUES ('19', '1', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('22', '10', '_menu_item_type', 'custom');
INSERT INTO `talkpostmeta` VALUES ('23', '10', '_menu_item_menu_item_parent', '0');
INSERT INTO `talkpostmeta` VALUES ('24', '10', '_menu_item_object_id', '10');
INSERT INTO `talkpostmeta` VALUES ('25', '10', '_menu_item_object', 'custom');
INSERT INTO `talkpostmeta` VALUES ('26', '10', '_menu_item_target', '');
INSERT INTO `talkpostmeta` VALUES ('27', '10', '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `talkpostmeta` VALUES ('28', '10', '_menu_item_xfn', '');
INSERT INTO `talkpostmeta` VALUES ('29', '10', '_menu_item_url', 'http://localhost/talk/');
INSERT INTO `talkpostmeta` VALUES ('31', '11', '_menu_item_type', 'post_type');
INSERT INTO `talkpostmeta` VALUES ('32', '11', '_menu_item_menu_item_parent', '0');
INSERT INTO `talkpostmeta` VALUES ('33', '11', '_menu_item_object_id', '2');
INSERT INTO `talkpostmeta` VALUES ('34', '11', '_menu_item_object', 'page');
INSERT INTO `talkpostmeta` VALUES ('35', '11', '_menu_item_target', '');
INSERT INTO `talkpostmeta` VALUES ('36', '11', '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}');
INSERT INTO `talkpostmeta` VALUES ('37', '11', '_menu_item_xfn', '');
INSERT INTO `talkpostmeta` VALUES ('38', '11', '_menu_item_url', '');
INSERT INTO `talkpostmeta` VALUES ('40', '12', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('41', '12', '_edit_lock', '1432864332:1');
INSERT INTO `talkpostmeta` VALUES ('42', '12', '_wp_page_template', 'contact.php');
INSERT INTO `talkpostmeta` VALUES ('43', '12', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('46', '1', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('47', '15', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('48', '15', '_edit_lock', '1432866109:1');
INSERT INTO `talkpostmeta` VALUES ('49', '15', '_thumbnail_id', '7');
INSERT INTO `talkpostmeta` VALUES ('52', '15', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('53', '15', 'featured_post', '0');
INSERT INTO `talkpostmeta` VALUES ('54', '17', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('55', '17', '_edit_lock', '1432874180:1');
INSERT INTO `talkpostmeta` VALUES ('56', '18', '_wp_attached_file', '2015/05/90H-823x400.jpg');
INSERT INTO `talkpostmeta` VALUES ('57', '18', '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:823;s:6:\"height\";i:400;s:4:\"file\";s:23:\"2015/05/90H-823x400.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"90H-823x400-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"90H-823x400-300x146.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:146;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"blog\";a:4:{s:4:\"file\";s:23:\"90H-823x400-325x260.jpg\";s:5:\"width\";i:325;s:6:\"height\";i:260;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:7:\"project\";a:4:{s:4:\"file\";s:23:\"90H-823x400-276x207.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"single-project\";a:4:{s:4:\"file\";s:23:\"90H-823x400-476x357.jpg\";s:5:\"width\";i:476;s:6:\"height\";i:357;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `talkpostmeta` VALUES ('58', '17', '_thumbnail_id', '7');
INSERT INTO `talkpostmeta` VALUES ('61', '17', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('62', '17', 'featured_post', '1');
INSERT INTO `talkpostmeta` VALUES ('63', '20', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('64', '20', '_edit_lock', '1432868759:1');
INSERT INTO `talkpostmeta` VALUES ('65', '21', '_wp_attached_file', '2015/05/134H-800x400.jpg');
INSERT INTO `talkpostmeta` VALUES ('66', '21', '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:400;s:4:\"file\";s:24:\"2015/05/134H-800x400.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"134H-800x400-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"134H-800x400-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"blog\";a:4:{s:4:\"file\";s:24:\"134H-800x400-325x260.jpg\";s:5:\"width\";i:325;s:6:\"height\";i:260;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"single-page\";a:4:{s:4:\"file\";s:24:\"134H-800x400-800x400.jpg\";s:5:\"width\";i:800;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:7:\"project\";a:4:{s:4:\"file\";s:24:\"134H-800x400-276x207.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"single-project\";a:4:{s:4:\"file\";s:24:\"134H-800x400-476x357.jpg\";s:5:\"width\";i:476;s:6:\"height\";i:357;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `talkpostmeta` VALUES ('67', '20', '_thumbnail_id', '21');
INSERT INTO `talkpostmeta` VALUES ('70', '20', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('71', '20', 'featured_post', '1');
INSERT INTO `talkpostmeta` VALUES ('72', '24', '_edit_last', '1');
INSERT INTO `talkpostmeta` VALUES ('73', '24', '_ssb_hide', 'false');
INSERT INTO `talkpostmeta` VALUES ('74', '24', 'featured_post', '0');
INSERT INTO `talkpostmeta` VALUES ('75', '24', '_edit_lock', '1432868736:1');
INSERT INTO `talkpostmeta` VALUES ('81', '24', '_oembed_f52c0d905f74510cb4878755cfc86548', '<iframe width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/75Shb4sEFYs?feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>');
INSERT INTO `talkpostmeta` VALUES ('82', '24', '_oembed_time_f52c0d905f74510cb4878755cfc86548', '1432866864');
INSERT INTO `talkpostmeta` VALUES ('89', '17', 'related_posts_post', '1,20');
INSERT INTO `talkpostmeta` VALUES ('100', '31', '_wp_attached_file', '2015/05/100H-823x4001.jpg');
INSERT INTO `talkpostmeta` VALUES ('101', '31', '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:823;s:6:\"height\";i:400;s:4:\"file\";s:25:\"2015/05/100H-823x4001.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"100H-823x4001-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"100H-823x4001-300x146.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:146;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:4:\"blog\";a:4:{s:4:\"file\";s:25:\"100H-823x4001-325x260.jpg\";s:5:\"width\";i:325;s:6:\"height\";i:260;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:7:\"project\";a:4:{s:4:\"file\";s:25:\"100H-823x4001-276x207.jpg\";s:5:\"width\";i:276;s:6:\"height\";i:207;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"single-project\";a:4:{s:4:\"file\";s:25:\"100H-823x4001-476x357.jpg\";s:5:\"width\";i:476;s:6:\"height\";i:357;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');

-- ----------------------------
-- Table structure for `talkposts`
-- ----------------------------
DROP TABLE IF EXISTS `talkposts`;
CREATE TABLE `talkposts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkposts
-- ----------------------------
INSERT INTO `talkposts` VALUES ('1', '1', '2015-05-29 01:27:25', '2015-05-29 01:27:25', 'Lorem ipsum dolor sit amet, cum tota illud semper ea, no consul elaboraret quaerendum mea, at mel elit melius. Ne mollis impetus integre mei, exerci aperiam percipit et vix. Dictas convenire mei cu, et utinam essent petentium vim. Eu paulo utinam mel, cu malis dissentiet sit. Eum te repudiare democritum delicatissimi, eum electram dignissim conceptam ad, eam nisl sale graece ex. Eius blandit scripserit ne eos, eam verear forensibus sadipscing ne, assum postea possim ne sed. Cibo adhuc tacimates ne cum.\r\n\r\nMenandri aliquando persequeris ad cum, ei pri omnis oratio discere, pro id quot tibique. Nam ei meis impetus, eos ad consulatu voluptatibus necessitatibus. Ne dolorem fabellas tincidunt mea, his elitr voluptaria contentiones in. Ei labore graeco atomorum vim.\r\n\r\nQuod nusquam ad usu. Viris munere probatus mel ut, in sumo deserunt nec. Nam cu dicta ridens qualisque. Purto mediocrem ad qui, voluptua definiebas pri eu, in simul feugait corpora has. Vitae impedit ius an, cu cum accumsan appetere erroribus. Qui at aperiri assentior liberavisse, ignota vidisse vim ex.\r\n\r\nAn probo viris facilis nam, voluptaria dissentiunt an ius. Periculis gloriatur in nam, illud tation dissentiet ei has. Falli partem has et, quem quaerendum an his. Modus aeterno impedit at sed, pro gloriatur liberavisse ex, vel etiam oratio ea. Summo delectus deterruisset ad quo, sit clita voluptatum moderatius eu, vim ea mollis tamquam. Ex ius nonumy tractatos honestatis.\r\n\r\nUsu at dolor corrumpit sadipscing, in eum appetere consetetur. Pro vivendo invenire ut, dico repudiare at eum, cu sea ludus eloquentiam. Graece intellegebat sea ei, cu nam dicta interesset. Harum malorum persecuti duo ne, pri ex omnis intellegam, no vix augue petentium signiferumque.', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-05-29 01:54:51', '2015-05-29 01:54:51', '', '0', 'http://localhost/talk/?p=1', '0', 'post', '', '3');
INSERT INTO `talkposts` VALUES ('2', '1', '2015-05-29 01:27:25', '2015-05-29 01:27:25', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/talk/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-05-29 01:27:25', '2015-05-29 01:27:25', '', '0', 'http://localhost/talk/?page_id=2', '0', 'page', '', '0');
INSERT INTO `talkposts` VALUES ('4', '1', '2015-05-29 01:33:38', '2015-05-29 01:33:38', '', '1419298845-358a2b73_resize', '', 'inherit', 'open', 'open', '', '1419298845-358a2b73_resize', '', '', '2015-05-29 01:33:38', '2015-05-29 01:33:38', '', '0', 'http://localhost/talk/wp-content/uploads/2015/05/1419298845-358a2b73_resize.jpg', '0', 'attachment', 'image/jpeg', '0');
INSERT INTO `talkposts` VALUES ('5', '1', '2015-05-29 01:35:52', '2015-05-29 01:35:52', 'asd', 'asd', '', 'publish', 'open', 'open', '', 'asd', '', '', '2015-05-29 01:35:52', '2015-05-29 01:35:52', '', '0', 'http://localhost/talk/?post_type=project&#038;p=5', '0', 'project', '', '0');
INSERT INTO `talkposts` VALUES ('6', '1', '2015-05-29 01:36:41', '2015-05-29 01:36:41', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit \"Send\"]</p>\n[your-subject]\n[your-name] <tienthai0511@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Talk (http://localhost/talk)\ntienthai0511@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nTalk <tienthai0511@gmail.com>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Talk (http://localhost/talk)\n[your-email]\nReply-To: tienthai0511@gmail.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Contact form 1', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2015-05-29 01:36:41', '2015-05-29 01:36:41', '', '0', 'http://localhost/talk/?post_type=wpcf7_contact_form&p=6', '0', 'wpcf7_contact_form', '', '0');
INSERT INTO `talkposts` VALUES ('7', '1', '2015-05-29 01:38:09', '2015-05-29 01:38:09', '', '100H-823x400', '', 'inherit', 'open', 'open', '', '100h-823x400', '', '', '2015-05-29 01:38:09', '2015-05-29 01:38:09', '', '1', 'http://localhost/talk/wp-content/uploads/2015/05/100H-823x400.jpg', '0', 'attachment', 'image/jpeg', '0');
INSERT INTO `talkposts` VALUES ('10', '1', '2015-05-29 01:49:48', '2015-05-29 01:49:48', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-05-29 01:49:48', '2015-05-29 01:49:48', '', '0', 'http://localhost/talk/?p=10', '1', 'nav_menu_item', '', '0');
INSERT INTO `talkposts` VALUES ('11', '1', '2015-05-29 01:49:48', '2015-05-29 01:49:48', ' ', '', '', 'publish', 'open', 'open', '', '11', '', '', '2015-05-29 01:49:48', '2015-05-29 01:49:48', '', '0', 'http://localhost/talk/?p=11', '2', 'nav_menu_item', '', '0');
INSERT INTO `talkposts` VALUES ('12', '1', '2015-05-29 01:51:50', '2015-05-29 01:51:50', '', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-05-29 01:51:50', '2015-05-29 01:51:50', '', '0', 'http://localhost/talk/?page_id=12', '0', 'page', '', '0');
INSERT INTO `talkposts` VALUES ('15', '1', '2015-05-29 02:22:27', '2015-05-29 02:22:27', 'slideshow', 'post 2', '', 'publish', 'open', 'open', '', 'post-2', '', '', '2015-05-29 02:22:27', '2015-05-29 02:22:27', '', '0', 'http://localhost/talk/?p=15', '0', 'post', '', '0');
INSERT INTO `talkposts` VALUES ('17', '1', '2015-05-29 02:24:34', '2015-05-29 02:24:34', 'Lorem ipsum dolor sit amet, unum perfecto hendrerit ut nam. Ea eos paulo repudiandae, ut perfecto philosophia quo, an graece hendrerit adipiscing eam. Pro ea impetus reprimique. Eu pro facilisi menandri, odio nisl an usu, liber debet veritus ea usu. Illum intellegam usu ut, putent tacimates perpetua nam id. Eos no dolor adipiscing theophrastus, elit adhuc no cum. Nibh commune has eu, molestiae eloquentiam qui id, duo eirmod sententiae id.\r\n\r\n[caption id=\"attachment_31\" align=\"aligncenter\" width=\"823\"]<a href=\"http://localhost/talk/wp-content/uploads/2015/05/100H-823x4001.jpg\"><img class=\"wp-image-31 size-full\" src=\"http://localhost/talk/wp-content/uploads/2015/05/100H-823x4001.jpg\" alt=\"100H-823x400\" width=\"823\" height=\"400\" /></a> test demo[/caption]\r\n\r\nId vel elitr mediocritatem. Mea eu dicit delectus elaboraret, porro antiopam no eum. Brute mnesarchum ad usu, pri an autem maiestatis definitiones. Aperiam debitis mnesarchum no cum, his vocent minimum accommodare ei, te ius commodo omnesque. Postulant eloquentiam an usu, ei solum volutpat sea. Et eum assum sanctus efficiendi, ea graeci putant omittantur vis.\r\n\r\nCum id commodo mediocrem, iusto legimus molestie eam in. Id eum fugit epicuri singulis, id urbanitas posidonium pri, pri in justo soluta eligendi. Cu conceptam forensibus usu, ex natum alienum quaerendum per. Mea harum sapientem contentiones ut.\r\n\r\nLaoreet reprimique mel no, ridens latine referrentur mea ad. Eum alii soleat mnesarchum et. Nam dicta admodum convenire no, iriure aperiri contentiones sea id. Et agam nibh ipsum per.\r\n\r\nVim minim graece id, sit ipsum phaedrum explicari ut. Eligendi mediocritatem te vix, brute scaevola id vel. Singulis efficiantur ut sit, in ius mucius utroque accumsan. Aliquid mentitum delectus ne vis, vim habemus gubergren ei. In eos purto errem comprehensam, cu platonem incorrupte cum, nec dolores qualisque ne. Ea cibo eripuit sit, vel sale postea quaeque at. Eum nisl rebum at, et nemore ocurreret quaerendum mei.', 'flat web design', '', 'publish', 'open', 'open', '', 'flat-web-design', '', '', '2015-05-29 04:30:10', '2015-05-29 04:30:10', '', '0', 'http://localhost/talk/?p=17', '0', 'post', '', '11');
INSERT INTO `talkposts` VALUES ('18', '1', '2015-05-29 02:24:28', '2015-05-29 02:24:28', '', '90H-823x400', '', 'inherit', 'open', 'open', '', '90h-823x400', '', '', '2015-05-29 02:24:28', '2015-05-29 02:24:28', '', '17', 'http://localhost/talk/wp-content/uploads/2015/05/90H-823x400.jpg', '0', 'attachment', 'image/jpeg', '0');
INSERT INTO `talkposts` VALUES ('20', '1', '2015-05-29 02:29:02', '2015-05-29 02:29:02', 'Lorem ipsum dolor sit amet, unum perfecto hendrerit ut nam. Ea eos paulo repudiandae, ut perfecto philosophia quo, an graece hendrerit adipiscing eam. Pro ea impetus reprimique. Eu pro facilisi menandri, odio nisl an usu, liber debet veritus ea usu. Illum intellegam usu ut, putent tacimates perpetua nam id. Eos no dolor adipiscing theophrastus, elit adhuc no cum. Nibh commune has eu, molestiae eloquentiam qui id, duo eirmod sententiae id.\r\n\r\nId vel elitr mediocritatem. Mea eu dicit delectus elaboraret, porro antiopam no eum. Brute mnesarchum ad usu, pri an autem maiestatis definitiones. Aperiam debitis mnesarchum no cum, his vocent minimum accommodare ei, te ius commodo omnesque. Postulant eloquentiam an usu, ei solum volutpat sea. Et eum assum sanctus efficiendi, ea graeci putant omittantur vis.\r\n\r\nCum id commodo mediocrem, iusto legimus molestie eam in. Id eum fugit epicuri singulis, id urbanitas posidonium pri, pri in justo soluta eligendi. Cu conceptam forensibus usu, ex natum alienum quaerendum per. Mea harum sapientem contentiones ut.\r\n\r\nLaoreet reprimique mel no, ridens latine referrentur mea ad. Eum alii soleat mnesarchum et. Nam dicta admodum convenire no, iriure aperiri contentiones sea id. Et agam nibh ipsum per.\r\n\r\nVim minim graece id, sit ipsum phaedrum explicari ut. Eligendi mediocritatem te vix, brute scaevola id vel. Singulis efficiantur ut sit, in ius mucius utroque accumsan. Aliquid mentitum delectus ne vis, vim habemus gubergren ei. In eos purto errem comprehensam, cu platonem incorrupte cum, nec dolores qualisque ne. Ea cibo eripuit sit, vel sale postea quaeque at. Eum nisl rebum at, et nemore ocurreret quaerendum mei.', 'before you design your web', '', 'publish', 'open', 'open', '', 'before-you-design-your-web', '', '', '2015-05-29 02:29:02', '2015-05-29 02:29:02', '', '0', 'http://localhost/talk/?p=20', '0', 'post', '', '0');
INSERT INTO `talkposts` VALUES ('21', '1', '2015-05-29 02:28:57', '2015-05-29 02:28:57', '', '134H-800x400', '', 'inherit', 'open', 'open', '', '134h-800x400', '', '', '2015-05-29 02:28:57', '2015-05-29 02:28:57', '', '20', 'http://localhost/talk/wp-content/uploads/2015/05/134H-800x400.jpg', '0', 'attachment', 'image/jpeg', '0');
INSERT INTO `talkposts` VALUES ('24', '1', '2015-05-29 02:31:36', '2015-05-29 02:31:36', '&nbsp;\r\n\r\n[embed]https://www.youtube.com/watch?v=75Shb4sEFYs[/embed]', 'video', '', 'publish', 'open', 'open', '', '24', '', '', '2015-05-29 02:34:44', '2015-05-29 02:34:44', '', '0', 'http://localhost/talk/?p=24', '0', 'post', '', '0');
INSERT INTO `talkposts` VALUES ('31', '1', '2015-05-29 04:27:22', '2015-05-29 04:27:22', '', '100H-823x400', '', 'inherit', 'open', 'open', '', '100h-823x400-2', '', '', '2015-05-29 04:27:22', '2015-05-29 04:27:22', '', '17', 'http://localhost/talk/wp-content/uploads/2015/05/100H-823x4001.jpg', '0', 'attachment', 'image/jpeg', '0');

-- ----------------------------
-- Table structure for `talkterms`
-- ----------------------------
DROP TABLE IF EXISTS `talkterms`;
CREATE TABLE `talkterms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkterms
-- ----------------------------
INSERT INTO `talkterms` VALUES ('1', 'Uncategorized', 'uncategorized', '0');
INSERT INTO `talkterms` VALUES ('2', 'main_menu', 'main_menu', '0');
INSERT INTO `talkterms` VALUES ('3', 'noname', 'noname', '0');
INSERT INTO `talkterms` VALUES ('4', 'action', 'action', '0');

-- ----------------------------
-- Table structure for `talkterm_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `talkterm_relationships`;
CREATE TABLE `talkterm_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkterm_relationships
-- ----------------------------
INSERT INTO `talkterm_relationships` VALUES ('1', '1', '0');
INSERT INTO `talkterm_relationships` VALUES ('1', '3', '0');
INSERT INTO `talkterm_relationships` VALUES ('1', '4', '0');
INSERT INTO `talkterm_relationships` VALUES ('10', '2', '0');
INSERT INTO `talkterm_relationships` VALUES ('11', '2', '0');
INSERT INTO `talkterm_relationships` VALUES ('15', '1', '0');
INSERT INTO `talkterm_relationships` VALUES ('17', '1', '0');
INSERT INTO `talkterm_relationships` VALUES ('17', '3', '0');
INSERT INTO `talkterm_relationships` VALUES ('17', '4', '0');
INSERT INTO `talkterm_relationships` VALUES ('20', '1', '0');
INSERT INTO `talkterm_relationships` VALUES ('24', '1', '0');

-- ----------------------------
-- Table structure for `talkterm_taxonomy`
-- ----------------------------
DROP TABLE IF EXISTS `talkterm_taxonomy`;
CREATE TABLE `talkterm_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkterm_taxonomy
-- ----------------------------
INSERT INTO `talkterm_taxonomy` VALUES ('1', '1', 'category', '', '0', '5');
INSERT INTO `talkterm_taxonomy` VALUES ('2', '2', 'nav_menu', '', '0', '2');
INSERT INTO `talkterm_taxonomy` VALUES ('3', '3', 'post_tag', '', '0', '2');
INSERT INTO `talkterm_taxonomy` VALUES ('4', '4', 'post_tag', '', '0', '2');

-- ----------------------------
-- Table structure for `talkusermeta`
-- ----------------------------
DROP TABLE IF EXISTS `talkusermeta`;
CREATE TABLE `talkusermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkusermeta
-- ----------------------------
INSERT INTO `talkusermeta` VALUES ('1', '1', 'nickname', 'thaivt');
INSERT INTO `talkusermeta` VALUES ('2', '1', 'first_name', '');
INSERT INTO `talkusermeta` VALUES ('3', '1', 'last_name', '');
INSERT INTO `talkusermeta` VALUES ('4', '1', 'description', '');
INSERT INTO `talkusermeta` VALUES ('5', '1', 'rich_editing', 'true');
INSERT INTO `talkusermeta` VALUES ('6', '1', 'comment_shortcuts', 'false');
INSERT INTO `talkusermeta` VALUES ('7', '1', 'admin_color', 'fresh');
INSERT INTO `talkusermeta` VALUES ('8', '1', 'use_ssl', '0');
INSERT INTO `talkusermeta` VALUES ('9', '1', 'show_admin_bar_front', 'true');
INSERT INTO `talkusermeta` VALUES ('10', '1', 'talkcapabilities', 'a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `talkusermeta` VALUES ('11', '1', 'talkuser_level', '10');
INSERT INTO `talkusermeta` VALUES ('12', '1', 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw');
INSERT INTO `talkusermeta` VALUES ('13', '1', 'show_welcome_panel', '1');
INSERT INTO `talkusermeta` VALUES ('14', '1', 'session_tokens', 'a:1:{s:64:\"2483319e7000d19d1230357a3712e536d2e350bca49ec502eeb6d7249d81a1e7\";a:4:{s:10:\"expiration\";i:1434072459;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:108:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36\";s:5:\"login\";i:1432862859;}}');
INSERT INTO `talkusermeta` VALUES ('15', '1', 'talkdashboard_quick_press_last_post_id', '3');
INSERT INTO `talkusermeta` VALUES ('16', '1', 'talkuser-settings', 'libraryContent=browse&editor=tinymce&cats=pop');
INSERT INTO `talkusermeta` VALUES ('17', '1', 'talkuser-settings-time', '1432873580');
INSERT INTO `talkusermeta` VALUES ('18', '1', 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `talkusermeta` VALUES ('19', '1', 'metaboxhidden_nav-menus', 'a:4:{i:0;s:8:\"add-post\";i:1;s:11:\"add-project\";i:2;s:12:\"add-post_tag\";i:3;s:8:\"add-type\";}');
INSERT INTO `talkusermeta` VALUES ('20', '1', 'closedpostboxes_post', 'a:0:{}');
INSERT INTO `talkusermeta` VALUES ('21', '1', 'metaboxhidden_post', 'a:6:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:16:\"commentstatusdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}');

-- ----------------------------
-- Table structure for `talkusers`
-- ----------------------------
DROP TABLE IF EXISTS `talkusers`;
CREATE TABLE `talkusers` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of talkusers
-- ----------------------------
INSERT INTO `talkusers` VALUES ('1', 'thaivt', '$P$BuV09WXBAZFLcCHG/5TSTy4Iz3R45N/', 'thaivt', 'tienthai0511@gmail.com', '', '2015-05-29 01:27:24', '', '0', 'thaivt');

-- ----------------------------
-- Table structure for `talkwc_comments_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `talkwc_comments_subscription`;
CREATE TABLE `talkwc_comments_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `subscribtion_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `subscribtion_type` varchar(255) NOT NULL,
  `activation_key` varchar(255) NOT NULL,
  `confirm` tinyint(4) DEFAULT '0',
  `subscription_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subscribtion_id` (`subscribtion_id`),
  KEY `post_id` (`post_id`),
  KEY `confirm` (`confirm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talkwc_comments_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for `talkwc_phrases`
-- ----------------------------
DROP TABLE IF EXISTS `talkwc_phrases`;
CREATE TABLE `talkwc_phrases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase_key` varchar(255) NOT NULL,
  `phrase_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phrase_key` (`phrase_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talkwc_phrases
-- ----------------------------

-- ----------------------------
-- Table structure for `talkwc_users_voted`
-- ----------------------------
DROP TABLE IF EXISTS `talkwc_users_voted`;
CREATE TABLE `talkwc_users_voted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `vote_type` int(11) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `vote_type` (`vote_type`),
  KEY `is_guest` (`is_guest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talkwc_users_voted
-- ----------------------------

-- ----------------------------
-- Table structure for `talkwsluserscontacts`
-- ----------------------------
DROP TABLE IF EXISTS `talkwsluserscontacts`;
CREATE TABLE `talkwsluserscontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of talkwsluserscontacts
-- ----------------------------

-- ----------------------------
-- Table structure for `talkwslusersprofiles`
-- ----------------------------
DROP TABLE IF EXISTS `talkwslusersprofiles`;
CREATE TABLE `talkwslusersprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `object_sha` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profileurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `websiteurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photourl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `displayname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` int(11) NOT NULL,
  `birthmonth` int(11) NOT NULL,
  `birthyear` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `emailverified` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of talkwslusersprofiles
-- ----------------------------

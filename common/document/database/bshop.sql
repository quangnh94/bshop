-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2016 at 05:38 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `id` varchar(200) NOT NULL,
  `password` varchar(64) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `authKey` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `password`, `created_at`, `updated_at`, `authKey`, `status`) VALUES
('quang.nh94@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1454572217, 1454572217, 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator_assigndata', 'quang.nh94@gmail.com', 1456481489),
('administrator_defineauth', 'quang.nh94@gmail.com', 1456481489),
('administrator_getigroup', 'quang.nh94@gmail.com', 1456481489),
('administrator_handle', 'quang.nh94@gmail.com', 1456481489),
('administrator_index', 'quang.nh94@gmail.com', 1456481489),
('administrator_item', 'quang.nh94@gmail.com', 1456481489),
('function_index', 'quang.nh94@gmail.com', 1456481489),
('home_index', 'quang.nh94@gmail.com', 1456481489),
('images_index', 'quang.nh94@gmail.com', 1456481489),
('images_test', 'quang.nh94@gmail.com', 1456481489),
('images_upload', 'quang.nh94@gmail.com', 1456481489),
('items_add', 'quang.nh94@gmail.com', 1456481489),
('items_createitem', 'quang.nh94@gmail.com', 1456481489),
('items_index', 'quang.nh94@gmail.com', 1456481489),
('items_update', 'quang.nh94@gmail.com', 1456481489),
('items_upload', 'quang.nh94@gmail.com', 1456481489);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL,
  `alias` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `group_name`, `created_at`, `updated_at`, `status`, `description`, `alias`) VALUES
(1, 'Hệ thống', 1456200930, 1456200930, 1, 'Quản lý hệ thống quản trị', ''),
(2, 'Sản phẩm và tin tức', 1456200966, 1456200966, 1, 'Nhóm quyền quản lý sản phẩm và tin tức', ''),
(3, 'Khách hàng', 1456201000, 1456201000, 1, 'Nhóm quyền quản lý khách hàng', '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `alias` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `group_id`, `alias`) VALUES
('administrator', 1, 'Hệ thống cập nhật', NULL, NULL, 1456202205, 1456202205, 1, 'Trùm phán quyết'),
('administrator_assigndata', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202272, 1456202272, 1, 'Cấp quyền người dùng'),
('administrator_defineauth', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202230, 1456202230, 1, 'Định nghĩa quyền'),
('administrator_getigroup', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202261, 1456202261, 1, 'Lấy nhóm quyền'),
('administrator_handle', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202206, 1456202206, 1, 'Xử lý nhóm quyền'),
('administrator_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202207, 1456202207, 1, 'Quản lý quyền định nghĩa'),
('administrator_item', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202247, 1456202247, 1, 'Lấy quyền định nghĩa'),
('function', 1, 'Hệ thống cập nhật', NULL, NULL, 1456202346, 1456202346, 1, 'Trùm cấp quyền'),
('function_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202346, 1456202346, 1, 'Quản lý quyền người dùng'),
('home', 1, 'Hệ thống cập nhật', NULL, NULL, 1456202297, 1456202297, 1, 'Trang chính thức hệ thống'),
('home_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1456202306, 1456202306, 1, 'Trang chủ'),
('images', 1, 'Hệ thống cập nhật', NULL, NULL, 1456374547, 1456374558, 2, 'Quản lý hình ảnh'),
('images_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1456374547, 1456374559, 2, 'Trùm quản lý hình ảnh'),
('images_test', 2, 'Hệ thống cập nhật', NULL, NULL, 1456462036, 1456462036, 2, 'TEsst'),
('images_upload', 2, 'Hệ thống cập nhật', NULL, NULL, 1456395043, 1456395043, 2, 'Tải hình ảnh lên server'),
('items', 1, 'Hệ thống cập nhật', NULL, NULL, 1456374548, 1456472061, 2, 'Quản lý sản phẩm'),
('items_add', 2, 'Hệ thống cập nhật', NULL, NULL, 1456374535, 1456472060, 2, 'Thêm sản phẩm'),
('items_createitem', 2, 'Hệ thống cập nhật', NULL, NULL, 1456472059, 1456472059, 2, 'Tạo sản phẩm '),
('items_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1456374535, 1456472061, 2, 'Trùm quản lý sản phẩm'),
('items_update', 2, 'Hệ thống cập nhật', NULL, NULL, 1456374535, 1456374560, 2, 'Sửa sản phẩm'),
('items_upload', 2, 'Hệ thống cập nhật', NULL, NULL, 1456481483, 1456481483, 2, 'Tải ảnh lên server');

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('administrator', 'administrator_assigndata'),
('administrator', 'administrator_defineauth'),
('administrator', 'administrator_getigroup'),
('administrator', 'administrator_handle'),
('administrator', 'administrator_index'),
('administrator', 'administrator_item'),
('function', 'function_index'),
('home', 'home_index'),
('images', 'images_index'),
('images', 'images_test'),
('images', 'images_upload'),
('items', 'items_add'),
('items', 'items_createitem'),
('items', 'items_index'),
('items', 'items_update'),
('items', 'items_upload');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories_items`
--

CREATE TABLE IF NOT EXISTS `categories_items` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `alias` varchar(500) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL,
  `images_router` varchar(800) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `type_object` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `images_router`, `created_at`, `updated_at`, `object_id`, `type_object`, `token`, `user_id`) VALUES
(1, '14565467241414hinh-nen-game-nu-chien-bonh-xinh-dep.jpg', 1456546724, 1456546724, 0, 'items', 'NnZ6SVczbHE5ekZQVlN0djBrZnpCTVhDcXo0Skh3', 'quang.nh94@gmail.com'),
(2, '145654675112715678_1686815644925120_742065308305425126_n.jpg', 1456546751, 1456546751, 0, 'items', 'dTgwVDFZUjJVVXBzZGJ3N0F1d3Y0NGd6aEM2Tmpu', 'quang.nh94@gmail.com'),
(3, '145654676012654338_10205064798972503_7126918206354877513_n.jpg', 1456546761, 1456546761, 0, 'items', 'UjlMM1Q1SFMxQUx5RDcwanhEMVE1RFdwODRrSDBv', 'quang.nh94@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(350) NOT NULL,
  `description` varchar(350) NOT NULL,
  `content` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `alias` varchar(500) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `root_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold_quantity` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL DEFAULT '0',
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items_properties`
--

CREATE TABLE IF NOT EXISTS `items_properties` (
  `id` int(11) NOT NULL,
  `property_name` varchar(250) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items_properties_value`
--

CREATE TABLE IF NOT EXISTS `items_properties_value` (
  `id` int(11) NOT NULL,
  `value_name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `categories_items`
--
ALTER TABLE `categories_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_properties`
--
ALTER TABLE `items_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_properties_value`
--
ALTER TABLE `items_properties_value`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categories_items`
--
ALTER TABLE `categories_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_properties`
--
ALTER TABLE `items_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items_properties_value`
--
ALTER TABLE `items_properties_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

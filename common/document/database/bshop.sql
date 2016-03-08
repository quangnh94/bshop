-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2016 at 11:20 AM
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
('administrator_assigndata', 'quang.nh94@gmail.com', 1457405287),
('administrator_defineauth', 'quang.nh94@gmail.com', 1457405287),
('administrator_getigroup', 'quang.nh94@gmail.com', 1457405287),
('administrator_handle', 'quang.nh94@gmail.com', 1457405287),
('administrator_index', 'quang.nh94@gmail.com', 1457405287),
('administrator_item', 'quang.nh94@gmail.com', 1457405287),
('function_index', 'quang.nh94@gmail.com', 1457405287),
('home_index', 'quang.nh94@gmail.com', 1457405287),
('image_get', 'quang.nh94@gmail.com', 1457405287),
('image_index', 'quang.nh94@gmail.com', 1457405287),
('image_remove', 'quang.nh94@gmail.com', 1457405287),
('image_upload', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_addnew', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_changeactive', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_changelink', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_getcate', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_index', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_new', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_remove', 'quang.nh94@gmail.com', 1457405287),
('itemcategory_update', 'quang.nh94@gmail.com', 1457405287),
('items_add', 'quang.nh94@gmail.com', 1457405287),
('items_index', 'quang.nh94@gmail.com', 1457405287),
('items_remove', 'quang.nh94@gmail.com', 1457405287),
('items_update', 'quang.nh94@gmail.com', 1457405287),
('items_upload', 'quang.nh94@gmail.com', 1457405287);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `group_name`, `created_at`, `updated_at`, `status`, `description`, `alias`) VALUES
(1, 'Hệ thống', 1456200930, 1456200930, 1, 'Quản lý hệ thống quản trị', ''),
(2, 'Sản phẩm', 1456200966, 1457404598, 1, 'Nhóm quyền quản lý sản phẩm', ''),
(3, 'Khách hàng', 1456201000, 1456201000, 1, 'Nhóm quyền quản lý khách hàng', ''),
(4, 'Hình ảnh ', 1457405034, 1457405034, 1, 'Quản trị hình ảnh', '');

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
('administrator', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404887, 1457404887, 1, 'Định nghĩa quyền'),
('administrator_assigndata', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Cấp quyền người dùng'),
('administrator_defineauth', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404888, 1457404888, 1, 'Quyền sản phẩm của bạn'),
('administrator_getigroup', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Lấy toàn bộ item quản trị'),
('administrator_handle', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404887, 1457404887, 1, 'Xử lý nhóm quyền'),
('administrator_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404888, 1457404888, 1, 'Quản lý trang định nghĩa'),
('administrator_item', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Các sản phẩm quản trị'),
('function', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404978, 1457404978, 1, 'Phân quyền quản trị'),
('function_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404978, 1457404978, 1, 'Phân quyền người dùng'),
('home', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404996, 1457404996, 1, 'Trang chủ'),
('home_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404997, 1457404997, 1, 'Trang chủ'),
('image', 1, 'Hệ thống cập nhật', NULL, NULL, 1457405100, 1457405100, 4, 'Quản trị hình ảnh'),
('image_get', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405104, 1457405104, 4, 'Lấy hình ảnh '),
('image_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405104, 1457405104, 4, 'Trang quản trị hình ảnh'),
('image_remove', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405105, 1457405105, 4, 'Xóa hình ảnh'),
('image_upload', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405105, 1457405105, 4, 'Tải hình ảnh lên server'),
('itemcategory', 1, 'Hệ thống cập nhật', NULL, NULL, 1457405185, 1457405185, 2, 'Danh mục sản phẩm'),
('itemcategory_addnew', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405186, 1457405186, 2, 'Thêm mới danh mục II'),
('itemcategory_changeactive', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405187, 1457405187, 2, 'Thay đổi trạng thái danh mục'),
('itemcategory_changelink', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405188, 1457405188, 2, 'Thay đổi đường dẫn'),
('itemcategory_getcate', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405188, 1457405188, 2, 'Lấy từng danh mục sản phẩm'),
('itemcategory_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405185, 1457405185, 2, 'Quản trị danh mục'),
('itemcategory_new', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405186, 1457405186, 2, 'Thêm mới danh mục'),
('itemcategory_remove', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405189, 1457405189, 2, 'Xóa danh mục'),
('itemcategory_update', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405186, 1457405186, 2, 'Cập nhật danh mục'),
('items', 1, 'Hệ thống cập nhật', NULL, NULL, 1457405255, 1457405255, 2, 'Quản trị sản phẩm'),
('items_add', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405256, 1457405256, 2, 'Thêm sản phẩm'),
('items_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405255, 1457405255, 2, 'Trang chủ quản trị sản phẩm'),
('items_remove', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405257, 1457405257, 2, 'Xóa sản phẩm'),
('items_update', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405256, 1457405256, 2, 'Sửa sản phẩm'),
('items_upload', 2, 'Hệ thống cập nhật', NULL, NULL, 1457405257, 1457405257, 2, 'Upload ảnh sản phẩm lên server');

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
('image', 'image_get'),
('image', 'image_index'),
('image', 'image_remove'),
('image', 'image_upload'),
('itemcategory', 'itemcategory_addnew'),
('itemcategory', 'itemcategory_changeactive'),
('itemcategory', 'itemcategory_changelink'),
('itemcategory', 'itemcategory_getcate'),
('itemcategory', 'itemcategory_index'),
('itemcategory', 'itemcategory_new'),
('itemcategory', 'itemcategory_remove'),
('itemcategory', 'itemcategory_update'),
('items', 'items_add'),
('items', 'items_index'),
('items', 'items_remove'),
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_items`
--

INSERT INTO `categories_items` (`id`, `category_name`, `alias`, `parent_id`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Đồ nam', 'do-nam', 0, 1457085734, 1457345907, 1),
(2, 'Quần nam', 'quan-nam', 1, 1457087007, 1457324630, 1),
(3, 'Đồ nữ', 'do-nu', 0, 1457323882, 1457323882, 1),
(5, 'Giày nữ', 'giay-nu', 3, 1457343917, 1457343931, 1),
(7, 'Giày thể thao nữ', 'giay-the-thao-nu', 5, 1457344245, 1457344245, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `images_router`, `created_at`, `updated_at`, `object_id`, `type_object`, `token`, `user_id`) VALUES
(1, '1457343205giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-1125b9_simg_d0daf0_800x1200_max.png', 1457343205, 1457343205, 0, 'items', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz', 'quang.nh94@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `description`, `content`, `created_at`, `updated_at`, `alias`, `active`, `category_id`, `root_price`, `sell_price`, `quantity`, `sold_quantity`, `user_id`, `token`) VALUES
(1, 'Giày thể thao nữ cổ cao- cực xinh - G-001', 'HUHU Fashion chuyên cung cấp Túi xách , Giầy thời trang.', '<p>\r\n\r\n</p><p>- Order hàng theo yêu cầu.</p><p>- Giao hàng toàn quốc (Miễn phí giao hàng nội thành hà nội).</p><p>- Địa chỉ : số 5, ngách 43/3 nguyễn ngọc nại, thanh xuân, hn.</p><p>- Liên hệ shop: 093 457 1168 - Ms Hường.</p><p>- Fanpage: <a target="_blank" rel="nofollow" href="https://www.facebook.com/huhufashion">https://www.facebook.com/huhufashion</a>.</p><p><img alt="Giy th thao n c cao- cc xinh 1" src="https://media3.scdn.vn/img1/2015/10_23/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-1125b9_simg_d0daf0_800x1200_max.png"><br><br><br><br><br><img alt="Giy th thao n c cao- cc xinh 2" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-11c518_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 3" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-9383da_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 4" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-26788c_simg_d0daf0_800x1200_max.png"></p><br>\r\n\r\n<br><p></p>', 1457343296, 1457343891, 'giay-the-thao-nu-co-cao-cuc-xinh-g-001', 1, 3, 350000, 320000, 50, 0, 'quang.nh94@gmail.com', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz');

-- --------------------------------------------------------

--
-- Table structure for table `items_properties`
--

CREATE TABLE IF NOT EXISTS `items_properties` (
  `id` int(11) NOT NULL,
  `property_name` varchar(250) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `property_value` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_properties`
--

INSERT INTO `items_properties` (`id`, `property_name`, `created_at`, `updated_at`, `active`, `item_id`, `parent_id`, `property_value`) VALUES
(1, 'color', 1457424286, 1457424286, 1, 1, 0, ''),
(3, 'size', 1457427511, 1457427511, 0, 1, 0, ''),
(14, 'test', 1457431085, 1457431586, 1, 1, 0, ''),
(15, 'test', 1457431595, 1457431595, 1, 1, 0, '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `categories_items`
--
ALTER TABLE `categories_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items_properties`
--
ALTER TABLE `items_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
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

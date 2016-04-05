-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2016 at 11:56 AM
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
('administrator_assigndata', 'quang.nh94@gmail.com', 1459393491),
('administrator_defineauth', 'quang.nh94@gmail.com', 1459393491),
('administrator_getigroup', 'quang.nh94@gmail.com', 1459393491),
('administrator_handle', 'quang.nh94@gmail.com', 1459393491),
('administrator_index', 'quang.nh94@gmail.com', 1459393491),
('administrator_item', 'quang.nh94@gmail.com', 1459393491),
('function_index', 'quang.nh94@gmail.com', 1459393491),
('home_index', 'quang.nh94@gmail.com', 1459393491),
('hotdeal_add', 'quang.nh94@gmail.com', 1459393491),
('hotdeal_index', 'quang.nh94@gmail.com', 1459393491),
('hotdeal_update', 'quang.nh94@gmail.com', 1459393491),
('image_get', 'quang.nh94@gmail.com', 1459393491),
('image_index', 'quang.nh94@gmail.com', 1459393491),
('image_remove', 'quang.nh94@gmail.com', 1459393491),
('image_upload', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_addnew', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_changeactive', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_changelink', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_getcate', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_index', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_new', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_remove', 'quang.nh94@gmail.com', 1459393491),
('itemcategory_update', 'quang.nh94@gmail.com', 1459393491),
('items_add', 'quang.nh94@gmail.com', 1459393491),
('items_index', 'quang.nh94@gmail.com', 1459393491),
('items_remove', 'quang.nh94@gmail.com', 1459393491),
('items_update', 'quang.nh94@gmail.com', 1459393491),
('items_upload', 'quang.nh94@gmail.com', 1459393491);

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
(1, 'Hệ thống', 1456200930, 1458525730, 1, 'Quản lý hệ thống quản trị', ''),
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
('administrator', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404887, 1458525852, 1, 'Định nghĩa quyền'),
('administrator_assigndata', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Cấp quyền người dùng'),
('administrator_defineauth', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404888, 1457404888, 1, 'Quyền sản phẩm của bạn'),
('administrator_getigroup', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Lấy toàn bộ item quản trị'),
('administrator_handle', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404887, 1458525706, 1, 'Xử lý nhóm quyền'),
('administrator_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404888, 1458525709, 1, 'Quản lý trang định nghĩa'),
('administrator_item', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404889, 1457404889, 1, 'Các sản phẩm quản trị'),
('function', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404978, 1457404978, 1, 'Phân quyền quản trị'),
('function_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404978, 1457404978, 1, 'Phân quyền người dùng'),
('home', 1, 'Hệ thống cập nhật', NULL, NULL, 1457404996, 1457404996, 1, 'Trang chủ'),
('home_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457404997, 1457404997, 1, 'Trang chủ'),
('hotdeal', 1, 'Hệ thống cập nhật', NULL, NULL, 1457496896, 1457496896, 2, 'Hotdeal box'),
('hotdeal_add', 2, 'Hệ thống cập nhật', NULL, NULL, 1457496864, 1457496898, 2, 'Thêm hot deal'),
('hotdeal_index', 2, 'Hệ thống cập nhật', NULL, NULL, 1457496863, 1457496898, 2, 'Trang chủ hotdeal'),
('hotdeal_update', 2, 'Hệ thống cập nhật', NULL, NULL, 1457496866, 1457496899, 2, 'Cập nhật hotdeal'),
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
('hotdeal', 'hotdeal_add'),
('hotdeal', 'hotdeal_index'),
('hotdeal', 'hotdeal_update'),
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
-- Table structure for table `hotdeal`
--

CREATE TABLE IF NOT EXISTS `hotdeal` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `items` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `alias` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hotdeal`
--

INSERT INTO `hotdeal` (`id`, `name`, `items`, `active`, `created_at`, `updated_at`, `alias`) VALUES
(2, 'Bán chạy', '4,2,3,6', 1, 1458831073, 1458831073, 'bestseller'),
(8, 'Sản phẩm mới', '17,8,9,10,11,12,13', 1, 1459827266, 1459827266, 'news'),
(9, 'Sản phẩm giảm giá', '1,2,3,4,5,6,7.8,9,11', 1, 1458874805, 1458874805, 'sale'),
(10, 'Sản phẩm HOT', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', 1, 1458874700, 1458874700, 'feature');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `images_router`, `created_at`, `updated_at`, `object_id`, `type_object`, `token`, `user_id`) VALUES
(1, '1457343205giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-1125b9_simg_d0daf0_800x1200_max.png', 1457343205, 1457343205, 0, 'items', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz', 'quang.nh94@gmail.com'),
(2, '1457498760dong-ho-nam-cao-cap-sk9058-1m4G3-1d83b1.jpg', 1457498760, 1457498760, 0, 'items', 'SVhnV1NhWHNLRDVoYW5mOXVPeWl4WEFwR2VxSktF', 'quang.nh94@gmail.com'),
(3, '1457498766dong-ho-nam-cao-cap-sk9058-1m4G3-f88b19.jpg', 1457498766, 1457498766, 0, 'items', 'SVhnV1NhWHNLRDVoYW5mOXVPeWl4WEFwR2VxSktF', 'quang.nh94@gmail.com'),
(4, '1457498883dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-3c39d9_simg_d0daf0_800x1200_max.jpg', 1457498883, 1457498883, 0, 'items', 'cDFPdHNTQnRvc3hKNUliWVE3RXF4RXhOdk1WaUF0', 'quang.nh94@gmail.com'),
(5, '1457498888dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-9a2b4e_simg_d0daf0_800x1200_max.jpg', 1457498888, 1457498888, 0, 'items', 'cDFPdHNTQnRvc3hKNUliWVE3RXF4RXhOdk1WaUF0', 'quang.nh94@gmail.com'),
(6, '1457499190dong-ho-julius-ju1005-nam-nau-1m4G3-e1073d.jpg', 1457499190, 1457499190, 0, 'items', 'MG9ZQkJzTkxCc1R2N0E2UEp6TGF4REp2N3VsakJt', 'quang.nh94@gmail.com'),
(7, '1457499198dong-ho-julius-ju1005-nam-nau-1m4G3-20e98a.jpg', 1457499198, 1457499198, 0, 'items', 'MG9ZQkJzTkxCc1R2N0E2UEp6TGF4REp2N3VsakJt', 'quang.nh94@gmail.com'),
(8, '1457517121ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-bff1d1_simg_d0daf0_800x1200_max.jpg', 1457517121, 1457517121, 0, 'items', 'ZnMyWnI3eFk2WG9DVWo2MTcyQ0xyc3BYNXJzY0xr', 'quang.nh94@gmail.com'),
(9, '1457517336dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg', 1457517336, 1457517336, 0, 'items', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB', 'quang.nh94@gmail.com'),
(13, '145818163515.jpg', 1458181635, 1458181635, 0, 'items', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB', 'quang.nh94@gmail.com'),
(14, '14581816381.jpg', 1458181638, 1458181638, 0, 'items', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB', 'quang.nh94@gmail.com'),
(15, '1458832329dam-cong-so-denim-tay-lo-1m4G3-29c317.jpg', 1458832329, 1458832329, 0, 'items', 'RUZhY1lWZ1JrZmhmT08xazJuUXk0OEJUdk9EUHNE', 'quang.nh94@gmail.com'),
(16, '1458832330dam-cong-so-denim-tay-lo-1m4G3-bea36e.jpg', 1458832330, 1458832330, 0, 'items', 'RUZhY1lWZ1JrZmhmT08xazJuUXk0OEJUdk9EUHNE', 'quang.nh94@gmail.com'),
(19, '1458832526ao-voan-kieu-cach-dieu-xinh-xan-it2155-1m4G3-8cb67e_simg_be5b9f_750x1105_max.png', 1458832526, 1458832526, 0, 'items', 'dDYwZE04VEVNMVhLTmdnSkZPcWtMOHdLVGNhSXF1', 'quang.nh94@gmail.com'),
(20, '1458832528ao-voan-kieu-cach-dieu-xinh-xan-it2155-1m4G3-479143_simg_057c6e_733x887_max.png', 1458832528, 1458832528, 0, 'items', 'dDYwZE04VEVNMVhLTmdnSkZPcWtMOHdLVGNhSXF1', 'quang.nh94@gmail.com'),
(21, '1458832869nike-dual-fusion-tr-6-chinh-hang-1m4G3-0dc9fa_simg_a42bc8_669x669_max.jpg', 1458832869, 1458832869, 0, 'items', 'Y0s3QzZIeVNKV3JzVHFtNFlDcFhNdmNQRnhNVXVI', 'quang.nh94@gmail.com'),
(22, '1458833810hang-nhap-ao-so-mi-ke-caro-noi-bat-sm102-1m4G3-65370a.png', 1458833810, 1458833810, 0, 'items', 'cEF1d1RMUUxTb0ZLSFUzR2JpQmhIMnBMNDU0UkZV', 'quang.nh94@gmail.com'),
(23, '1458833812hang-nhap-ao-so-mi-ke-caro-noi-bat-sm102-1m4G3-dbc119.png', 1458833812, 1458833812, 0, 'items', 'cEF1d1RMUUxTb0ZLSFUzR2JpQmhIMnBMNDU0UkZV', 'quang.nh94@gmail.com'),
(27, '1458834019xaaaa.jpg', 1458834019, 1458834019, 0, 'items', 'TVhDMVJpZW9xd1FmcGRjV2p1dmk0VXVHYkJsV0I4', 'quang.nh94@gmail.com'),
(28, '1458834023xxxx.jpg', 1458834023, 1458834023, 0, 'items', 'TVhDMVJpZW9xd1FmcGRjV2p1dmk0VXVHYkJsV0I4', 'quang.nh94@gmail.com'),
(29, '1458834113Ao_khoac_Ferrari__1_.jpg', 1458834113, 1458834113, 0, 'items', 'ZXRSdHFSN2xTWTRWamJhbFdqbzl1SWN0YmZ6VUpk', 'quang.nh94@gmail.com'),
(30, '14588341691.jpg', 1458834169, 1458834169, 0, 'items', 'SjJ1SEh4TDVBMWhPVHpmSXpNbjg1SlRVcDN3cDFP', 'quang.nh94@gmail.com'),
(31, '14588343958EO6AK_20du_202_20mau_20_1_.jpg', 1458834395, 1458834395, 0, 'items', 'cVY5Nnh6WnQ3T3ZhcHRETDdVUW50WDh6YllXdHNN', 'quang.nh94@gmail.com'),
(32, '14588344404.jpg', 1458834440, 1458834440, 0, 'items', 'dDNicmhqUWJaOXRDejhMNHVuVm5KdElVSndrdXY1', 'quang.nh94@gmail.com'),
(33, '14588345041 (1).jpg', 1458834504, 1458834504, 0, 'items', 'SEZxd3JXbHVvOG5TZ0IwTGdiYks4ZHBWNHpDVE55', 'quang.nh94@gmail.com'),
(34, '1459736986hang-nhap-cao-cap-giay-nu-cuc-chat-1m4G3-ccfe18_simg_d0daf0_800x1200_max.jpg', 1459736986, 1459736986, 0, 'items', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz', 'quang.nh94@gmail.com'),
(35, '1459741237hang-nhap-cao-cap-giay-nu-cuc-chat-1m4G3-09edaf_simg_d0daf0_800x1200_max.jpg', 1459741237, 1459741237, 0, 'items', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz', 'quang.nh94@gmail.com'),
(36, '1459826869giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-938a07_simg_d0daf0_800x1200_max.jpg', 1459826869, 1459826869, 0, 'items', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', 'quang.nh94@gmail.com'),
(37, '1459826873giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-8a7fd0_simg_d0daf0_800x1200_max.jpg', 1459826873, 1459826873, 0, 'items', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', 'quang.nh94@gmail.com'),
(38, '1459826878giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-6119c3_simg_d0daf0_800x1200_max.jpg', 1459826878, 1459826878, 0, 'items', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', 'quang.nh94@gmail.com'),
(39, '1459826882giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-4064e4_simg_d0daf0_800x1200_max.jpg', 1459826882, 1459826882, 0, 'items', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', 'quang.nh94@gmail.com'),
(40, '1459826886giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-d2d307_simg_d0daf0_800x1200_max.jpg', 1459826886, 1459826886, 0, 'items', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', 'quang.nh94@gmail.com'),
(41, '1459835871hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-6034b5_simg_d0daf0_800x1200_max.jpg', 1459835871, 1459835871, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com'),
(42, '1459835875hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-f90003_simg_d0daf0_800x1200_max.jpg', 1459835875, 1459835875, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com'),
(43, '1459835878hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-a3dc8f_simg_d0daf0_800x1200_max.jpg', 1459835878, 1459835878, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com'),
(44, '1459835884hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-7296bb_simg_d0daf0_800x1200_max.jpg', 1459835884, 1459835884, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com'),
(45, '1459835889hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-32fb5b_simg_d0daf0_800x1200_max.jpg', 1459835889, 1459835889, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com'),
(46, '1459835893hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-64aea6_simg_d0daf0_800x1200_max.jpg', 1459835893, 1459835893, 0, 'items', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', 'quang.nh94@gmail.com');

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
  `updated_at` int(11) DEFAULT NULL,
  `alias` varchar(500) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `root_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold_quantity` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL DEFAULT '0',
  `token` varchar(250) NOT NULL,
  `path` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `description`, `content`, `created_at`, `updated_at`, `alias`, `active`, `category_id`, `root_price`, `sell_price`, `quantity`, `sold_quantity`, `user_id`, `token`, `path`) VALUES
(1, 'Giày thể thao nữ cổ cao- cực xinh - G-001', 'HUHU Fashion chuyên cung cấp Túi xách , Giầy thời trang.', '<p>\r\n\r\n</p><p>- Order hàng theo yêu cầu.</p><p>- Giao hàng toàn quốc (Miễn phí giao hàng nội thành hà nội).</p><p>- Địa chỉ : số 5, ngách 43/3 nguyễn ngọc nại, thanh xuân, hn.</p><p>- Liên hệ shop: 093 457 1168 - Ms Hường.</p><p>- Fanpage: <a target="_blank" rel="nofollow" href="https://www.facebook.com/huhufashion">https://www.facebook.com/huhufashion</a>.</p><p><img alt="Giy th thao n c cao- cc xinh 1" src="https://media3.scdn.vn/img1/2015/10_23/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-1125b9_simg_d0daf0_800x1200_max.png"><br><br><br><br><br><img alt="Giy th thao n c cao- cc xinh 2" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-11c518_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 3" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-9383da_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 4" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-26788c_simg_d0daf0_800x1200_max.png"></p><br>\r\n\r\n<br><p></p>', 1457343296, 1459567476, 'giay-the-thao-nu-co-cao-cuc-xinh-g-001', 1, 3, 350000, 320000, 50, 0, 'quang.nh94@gmail.com', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz', '[3]'),
(2, 'Đồng Hồ nam Cao Cấp SK9058 - SK9058B', 'Đồng Hồ nam Cao Cấp SK9058 - SK9058B', '<p>\r\n\r\n</p><p><strong>Xem Thêm Sản Phẩm Khác : <a target="_blank" rel="nofollow" href="https://www.sendo.vn/shop/sieuthimini/san-pham/">https://www.sendo.vn/shop/sieuthimini/san-pham/</a></strong></p><p>SP Bảo Hành 6 Tháng</p><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho-nam.htm">Đồng Hồ Nam</a>&nbsp;Skmei <a target="_blank" rel="nofollow" href="https://www.sendo.vn/sk9058.htm">SK9058</a>&nbsp;Thiết kế Nam Tính-Mạnh Mẽ</p><p>Skmei là thương hiệu <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm">đồng hồ</a>&nbsp;chất lượng cao, thiết kế đẹp mắt, chế tác tinh xảo từng chi tiết nhưng giá bình dân</p><p>Đặc Điểm Nỗi Bật :</p><p>-Máy Và Pin Siêu Bền Nhập Khẩu từ Nhật Bản</p><p>-Mặt kính cao cấp</p><p>-Chịu nước tốt</p><p>-Dây Da cao cấp</p><div><div><div><p><img alt="ng H nam Cao Cp SK9058 1" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-1d83b1.jpg"></p><p><img alt="ng H nam Cao Cp SK9058 2" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-8628a9.jpg"></p><p><a target="_blank" rel="nofollow" href="http://ban.sendo.vn/product"><img alt="ng H nam Cao Cp SK9058 3" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-f88b19.jpg"></a><br></p><p><a target="_blank" rel="nofollow" href="http://ban.sendo.vn/product"><img alt="ng H nam Cao Cp SK9058 4" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-8c2644.png"></a><br></p><br><p>Chuyên Sỉ và Lẻ Đồng Hồ Thời Trang, Sản Phẩm Công Nghệ Với Tiêu Chí Rẻ Mà Chất</p><p>Địa chỉ:</p><p><strong>-90/29 Thành Thái, Q10 TPHCM</strong></p><p><strong>-14/1A Nguyễn Thị Thập-TP.Mỹ Tho-Tiền Giang</strong></p><p><strong>Mobile/Zalo :</strong><strong>&nbsp;0907939707 - Mr Trung</strong></p><br>\r\n\r\n</div></div></div><br><p></p>', 1457498771, 1459567476, 'dong-ho-nam-cao-cap-sk9058-sk9058b', 1, 1, 350000, 220000, 2, 0, 'quang.nh94@gmail.com', 'SVhnV1NhWHNLRDVoYW5mOXVPeWl4WEFwR2VxSktF', '[1]'),
(3, 'DH011 - Đồng hồ nam LAVANA Hàng loại I Da mềm - Nam tính, Cao cấp - DH011-1', 'DH011 - Đồng hồ nam LAVANA Hàng loại I Da mềm - Nam tính, Cao cấp - DH011-1', '<p>\r\n\r\n<p><strong><br></strong></p><p><strong><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 2" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-9a2b4e_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-9a2b4e_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 3" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-3c39d9_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-3c39d9_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 4" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-be34e3_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-be34e3_simg_d0daf0_800x1200_max.jpg"><br><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 5" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-f156af_simg_cdc28a_665-665-46-41_cropf_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-f156af_simg_cdc28a_665-665-46-41_cropf_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 6" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-8d4fb6_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-8d4fb6_simg_d0daf0_800x1200_max.jpg"></strong></p><br>\r\n\r\n<br></p>', 1457498891, 1459567476, 'dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-ti', 1, 1, 350000, 350000, 2, 0, 'quang.nh94@gmail.com', 'cDFPdHNTQnRvc3hKNUliWVE3RXF4RXhOdk1WaUF0', '[1]'),
(4, 'Đồng hồ Nam Curren Dây Da Màu Bò - CR8152 - CR8152', 'Đồng hồ Nam Curren Dây Da Màu Bò - CR8152 - CR8152', '<p>\r\n\r\n<h1><a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho-julius.htm">Đồng Hồ JULIUS</a>&nbsp;JU1005 NAM ( nâu)</h1><p>Với nam giới, nét đẹp mạnh mẽ và nam tính luôn luôn được ưu tiên hàng đầu. Để thể hiện được hết khí chất đó, người đàn ông không những phải chú ý phong thái mà cần quan tâm ngay từ trang phục với quần áo, giày dép, hay các loại phụ kiện như cravat, dây lưng, <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm" title="Link: https://www.sendo.vn/dong-ho.htm">đồng hồ</a>. Mang đến một mẫu đồng hồ với thiết kế mạnh mẽ, phóng khoáng, chiếcĐồng hồ nam Julius JU1005 của hãng Julius Hàn Quốc chắc chắn là sản phẩm các quý ông không thể bỏ qua.</p><h1><div><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 2" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e1073d.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e1073d.jpg"></a><br><br>Mang cấu tạo của một chiếc <strong>đồng hồ</strong>&nbsp;Quartz JULIUS HOME JU1005, chiếc đồng hồ nam này không chỉ có mặt xem giờ 12 số mà còn có biểu thị giờ 24 để xác định chính xác thời gian sáng hay chiều và phần xem ngày trong tháng. Đảm bảo chất lượng cho sản phẩm, toàn bộ phần máy cấu tạo đồng hồ đều được nhập khẩu từ Nhật Bản với kỹ thuật chế tác hiện đại. Thêm vào đó, để tăng khả năng chịu lực và chống chịu những tác động từ môi trường bên ngoài, mặt đồng hồ được bảo vệ bởi lớp kính khoáng trong suốt, dày dặn nhưng có độ rõ nét cao, chống được trày xước. Ngoài ra, Đồng hồ nam Julius JU1005 &nbsp;cũng có khả năng chống thấm nước ở mức 3ATM, cho phép rửa tay, đi mưa, rửa xe hoặc các công việc khác có mức độ tiếp xúc nước tương đương mà không cần phải tháo ra.<br><br><br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 3" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-20e98a.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-20e98a.jpg"></a><br>Cuộc sống ngày càng phát triển, nhu cầu của con người cũng không ngừng gia tăng, không còn dừng lại ở những nhu cầu cơ bản như “ăn no”, “mặc ấm” mà đã phát triển lên thành “ăn ngon”, “mặc đẹp”. Đáp lại nhu cầu “mặc đẹp” chính là sự bùng nổ của ngành công nghiệp thời trang. Từ thời trang cho nữ giới tới thời trang nam, đều có sự thay đổi chóng mặt và sự đa dạng không thể kể hết. Từ những món đồ cơ bản như quần, áo, giày dép cho đến những loại phụ kiện như trang sức, mũ nón, túi ví, dây lưng và<strong>đồng hồ</strong>. Ở phần dưới đây, Baza sẽ giới thiệu cho các bạn mẫuđồng hồ nam Julius JU1005 xuất xứ Hàn Quốc, chắc chắn sẽ đáp ứng được nhu cầu “mặc đẹp” của các quý ông.<a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 4" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-edf3c6.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-edf3c6.jpg"></a></p><p>Xét về cấu tạo cơ bản<strong>, </strong>đồng hồ nam Julius JU1005 có kết cấu “tròn trong vuông”, mặt đồng hồ tròn lồng trong vỏ vuông tạo dáng cong mềm mại, tạo nên một chỉnh thể độc đáo. Bề mặt của đồng hồ là kính khoáng cao cấp, có độ rõ nét cao và khả năng chống xước, luôn luôn nhìn rõ giờ bên trong. Toàn bộ phần vỏ và khóa của đồng hồ được làm từ chất liệu hợp kim thép không gỉ, được mạ IP chân không để luôn giữ được độ bóng, sáng và bền màu. Mức chống thấm nước của đồng hồ Julius JA388M là 3ATM (30m) cho phép người dùng rửa tay, đi mưa, rửa xe hay các việc có độ tiếp xúc nước tương đương mà không cần phải tháo khỏi tay.</p><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 5" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-36bcbe.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-36bcbe.jpg"></a><br>Không chỉ mang lại sự đa dạng về kiểu dáng, chiếc <strong>đồng hồ nam</strong>&nbsp;này cũng đáp ứng được nhiều phong cách khác nhau. Đồng hồ đen mạ bạc sẽ tôn thêm nét đẹp sang trọng và lịch lãm cho các quý ông, đồng hồ dây nâu mạ vàng lại là lựa chọn cho những quý ông theo phong cách cổ điển, các màu đỏ, trắng, kem sữa lại là dành riêng cho những anh chàng muốn thử sức mình với những xu hướng mới hay có gu thời trang trẻ trung, phá cách. Sự kết hợp giữa chiếc đồng hồ nam Julius JU1005 với các trang phục khác sẽ tạo nên vẻ đẹp hoàn hảo và nổi bật mà không ai có thể chối từ<a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 6" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-c33fa2.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-c33fa2.jpg"></a><br><strong>Nhãn hàng: </strong>Julius Home<br><br><strong>Chất liệu quai:</strong>&nbsp;Da cao cấp<br><br><strong>Chất liệu case: </strong>Thép không gỉ<br><br><strong>Chất liệu kính:</strong>&nbsp;Kính khoáng chịu nhiệt chống trầy tương đối 80% <br><br><strong>Kiểu mặt: </strong>Tròn<br><br><strong>Giới tính: </strong>Nam<br><br><strong>Kích thước mặt:</strong>&nbsp;4cm; dày 1.1 cm<br><br><strong>Kích thước quai:</strong>&nbsp;rộng: 2cm; Dài: 25cm<br><br><strong>Khối lượng: </strong>60g<br><br><strong>Chống nước: </strong>3ATM (30 mét nước) Chống thấm nước &nbsp;môi trường rửa tay, rửa mặt, bơi lội<br><br><strong>Bảo hành</strong>: 12 tháng, miễn phí vận chuyển bảo hành, hỗ trợ phí sửa đồng hồ 3 năm<br>- Đồng Hồ Thương hiệu thiết kế Hàn quốc JULIUS - CHống thấm nước 30m nước - Bảo hành 12 tháng - Dây da nam tính màu nâu <br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 7" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e854cc.jpg"></a><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 8" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-055b9f.jpg"></a><br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 9" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-5c093d.jpg"></a></p></div></h1>\r\n\r\n<br></p>', 1457499204, 1459567476, 'dong-ho-nam-curren-day-da-mau-bo-cr8152-cr8152', 1, 1, 520000, 266000, 15, 0, 'quang.nh94@gmail.com', 'MG9ZQkJzTkxCc1R2N0E2UEp6TGF4REp2N3VsakJt', '[1]'),
(5, 'Áo Vest nữ thời trang Hàn Quốc L12899 - L12899', 'Áo Vest nữ thời trang Hàn Quốc L12899 - L12899', '<p>\r\n\r\n</p><ul><li><p><strong>Hỗ trợ tư vấn đặt hàng qua zalo, viber, hoặc gọi trực tiếp: 0917399527</strong></p><p><strong>Miễn phí giao hàng với đơn hàng trên 500k trên toàn quốc</strong></p></li><li><strong>Áo khoác vest phối màu sành điệu</strong>&nbsp;khoác nổi bật với thiết kế form dài duyên dáng, phối màu hợp <a target="_blank" rel="nofollow" href="https://www.sendo.vn/thoi-trang.htm">thời trang</a>.</li><li>Thiết kế cổ cách điệu và túi giả phối màu cùng với nút bọc trắng,áo được may thêm cầu vai làm cho chiếc áo càng trở nên sang trọng hơn</li><li>Áo 2 túi mổ trước vừa tiện lợi cho việc cất giữ các phụ kiện nhỏ cũng như tạo thêm điểm nhấn cho sản phẩm.</li><li>Màu sắc thời trang được kết hợp với nhau tạo nên sự sang trọng cho sản phẩm</li><li>Chất liệu: Tuyết mưa.</li><li>Size: Freesize</li><li>Kích thước: (Chênh lệch: +/-2cm)</li><li>Dài 57cm, Vai 33cm, Tay 52cm (tính từ vai), Ngực 40cmx2, Eo: 31cmx2.</li><li><img alt="o Vest n thi trang Hn Quc L12899 1" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-bff1d1_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="o Vest n thi trang Hn Quc L12899 2" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-13e6da_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="o Vest n thi trang Hn Quc L12899 3" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-d28d8f_simg_d0daf0_800x1200_max.jpg"></li></ul><br>\r\n\r\n<br><p></p>', 1457517124, 1459567476, 'ao-vest-nu-thoi-trang-han-quoc-l12899-l12899', 1, 1, 270000, 189000, 10, 0, 'quang.nh94@gmail.com', 'ZnMyWnI3eFk2WG9DVWo2MTcyQ0xyc3BYNXJzY0xr', '[1]'),
(6, 'Đồng Hồ Nam DW Siêu Mỏng - DH10', 'Đồng Hồ Nam DW Siêu Mỏng - DH10', '<p>\r\n\r\n<p><br><strong>Đ</strong><strong>ồng Hồ Nam DW Siêu Mỏng</strong></p><p><strong>- Kích Thước : Nam 6 x 40mm, Nữ 6 x 30mm</strong></p><p><strong>- Dây Da Có 2 Màu : Nâu Và Đen</strong></p><p><strong><br></strong></p><p><strong>Ship Hàng Toàn Quốc</strong></p><p><strong>&nbsp; &nbsp; Hotline : 0917878783</strong></p><p><strong>&nbsp; &nbsp; &nbsp;</strong></p><p><strong>Bảo Hành 3 Tháng</strong></p><p><strong>* Các Bạn Có Thể Vào Đường Line Phía Dưới Xem Thêm Mẩu <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm">Đồng Hồ</a>&nbsp;Khác</strong></p><p><strong><a href="http://www.sendo.vn/shop/huynh-dong/">www.sendo.vn/shop/huynh-dong/</a></strong></p><p><strong><img alt="ng H Nam DW Siu Mng 1" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-737059_simg_40d51b_1015-1015-0-80_cropf_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-737059_simg_40d51b_1015-1015-0-80_cropf_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 2" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-75312f_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-75312f_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 3" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 4" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-0939d3_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-0939d3_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 5" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-f14ee9_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 6" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-ca381f_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 7" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-4f5e75_simg_d0daf0_800x1200_max.jpg"></strong></p><br>\r\n\r\n﻿<br></p>', 1457517340, 1459567476, 'dong-ho-nam-dw-sieu-mong-dh10', 1, 1, 260000, 130000, 2, 0, 'quang.nh94@gmail.com', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB', '[1]'),
(7, 'Đầm suông ren 2 lớp cổ yếm thắt nơ h2 cao cấp- Thiết kế', 'Đầm suông ren 2 lớp cổ yếm thắt nơ h2 cao cấp- Thiết kế', '<p>\r\n\r\n</p><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/shop/dollanhi/"><br>Click lick shop :www.sendo.vn/shop/dollanhi/</a></p><div><br></div><div><br></div><div>+ Phối hợp màu sắc dịu nhẹ, tinh tế và giúp tôn lên 3 vòng cho phái đẹp.</div><div><br></div><div>+ Thích hợp cho bạn nữ 42 đên 55kg tùy chiều cao.</div><div><br></div><div>&nbsp;Sie M 42 đến 49kg, Size L từ 49 đến 55kg<br></div><p>+ Giao hàng tận nơi</p><p>Tất cả bao trả nếu không y hình. Hàng nhâp, hình chụp thật<br></p><div>Chất liệu : Vải ren <a target="_blank" rel="nofollow" href="https://www.sendo.vn/cao-cap.htm">cao cấp</a><br></div><div><br></div><div>Màu sắc :đen, xanh, hồng, trắng</div><p><br></p><p>&nbsp;Hàng <a target="_blank" rel="nofollow" href="https://www.sendo.vn/cao-cap.htm">cao cấp</a>- Bao y hình 100%- đẹp từ đường may đến chất vải- Bao giá thấp nhất so với chất lượng &nbsp;</p><p><br></p><p><br></p><p><br></p><p>Hotline: 0932.143.133 ( viber, sms, call, zalo)</p><p><br></p><p><br></p><p><em><strong>Lưu ý</strong></em>&nbsp;: Quá trình vận chuyển có thể làm sản phẩm bị nhàu, rất mong quý khách hàng thông cảm. Bạn hãy</p><p><br></p><p>giặt ủi để cảm nhận giá trị sản phẩm của chúng tôi</p>\r\n\r\n<br><p></p>', 1458832334, 1459567476, 'dam-suong-ren-2-lop-co-yem-that-no-h2-cao-cap-thiet-ke', 1, 3, 430000, 330000, 15, 0, 'quang.nh94@gmail.com', 'RUZhY1lWZ1JrZmhmT08xazJuUXk0OEJUdk9EUHNE', '[3]'),
(8, 'Áo voan kiểu cách điệu xinh xắn IT2155 - IT2155  1 201', 'Áo voan kiểu cách điệu xinh xắn IT2155 - IT2155  1 201', '<p>\r\n\r\n</p><p>Những chiếc <em><strong><a target="_blank" rel="nofollow" href="https://www.sendo.vn/ao-voan-kieu.htm">Áo voan kiểu</a>&nbsp;<a target="_blank" rel="nofollow" href="https://www.sendo.vn/cach-dieu.htm">cách điệu</a>&nbsp;xinh xắn IT215</strong></em>&nbsp;luôn mang lại cho người mặc sự sang trọng, quyến rũ. Voan là chất liệu vải mỏng mịn làm làm các nàng có thẻ khoe được làn da trắng mịn của mình, nhưng vẫn rất kín đáo. Đây cũng chính là chất liệu, là nguồn cảm hứng để các NTK thời trang đưa ra những ý tưởng thiết kế những mẫu áo thời trang đẹp và quyến rũ nhất. Áo voan là một trong những kiểu áo thời trang xuân hè được các bạn nữ đón đợi. Để khởi động mùa thời trang xuân hè, <strong><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/ao-voan-kieu-cach-dieu-xinh-xan-it2155-2845847/">thời trang I</a>TEX</strong>&nbsp;sẽ giới thiệu đến bạn mẫu áo voan đẹp và mới nhất.</p><p><img width="750" alt="o voan kiu cch iu xinh xn IT2155 2" src="https://media3.scdn.vn/img1/2016/3_11/ao-voan-kieu-cach-dieu-xinh-xan-it2155-1m4G3-8cb67e_simg_be5b9f_750x1105_max.png" height="1105"></p>\r\n\r\n<br><p></p>', 1458832449, 1459567476, 'ao-voan-kieu-cach-dieu-xinh-xan-it2155-it2155-1-201', 1, 3, 295000, 215000, 15, 0, 'quang.nh94@gmail.com', 'cEF1d1RMUUxTb0ZLSFUzR2JpQmhIMnBMNDU0UkZV', '[3]'),
(9, 'Hàng Nhập - Áo sơ mi kẻ caro nổi bật SM102 - SM102', 'Hàng Nhập - Áo sơ mi kẻ caro nổi bật SM102 - SM102', '<p>\r\n\r\n</p><p>Hiện nay trên thị trường xuất hiện nhiều hàng nhái chất lượng kém như màu sắc, tối màu không giống hình, &nbsp;phần ren không đúng, không kèm theo phụ kiện... Tuy đăng bán cùng hình ảnh sản phẩm nhưng chất lượng mỗi Shop không giống nhau nên Shop mong quý khách hàng nên cân nhắc kỹ trước khi quyết định mua, " tiền nào của nấy " nhé. <a target="_blank" rel="nofollow" href="https://www.sendo.vn/shop/thoi-trang-han-quoc/"><strong>Đẹp online</strong></a>&nbsp;khuyến cáo quý khách nên cẩn trọng và hỏi rõ, đọc kỹ trước khi mua hàng.</p><p>ĐÂY LÀ HÀNG LOẠI 1 SHOP NHẬP TRỰC TIẾP ( KHÔNG QUA BẤT CỨ TRUNG GIAN NÀO ), không phải </p><p>hàng gia công tại Việt Nam nên các bạn có thể yên tâm về chất lượng sản phẩm của Shop nha.</p><p><strong>ĐẢM BẢO HÀNG GIỐNG HÌNH 100%, BAO ĐỔI HÀNG TRONG 7 NGÀY</strong></p><p><strong><a target="_blank" rel="nofollow" href="https://www.sendo.vn/ao-so-mi.htm">Áo sơ mi</a>&nbsp;kẻ caro nữ đẹp</strong>&nbsp;hè 2015 phong cách hàn quốc không bao giờ lỗi mốt luôn là xu hướng thời trang được yêu thích mỗi khi mùa hè đến mang đến cảm giác khỏe khoắn trẻ trung năng động cho những ngày nắng mùa hè. Áo sơ mi kẻ caro vài năm trở lại đây luôn là item được các tín đồ thời trang săn lùng nhiệt tình cho phong cách của mình, với một chiếc áo sơ mi các nàng có thể mix nhiều phong cách khác nhau cho ngày tới công sở hay dã ngoại đều rất phù hợp. Hơn nữa những đường kẻ caro phù hợp với hầu hết dáng người và màu da nên các nàng không cần lo lắng khi diện kiểu áo sơ mi này đâu.</p><p>- Chất liệu: 100% cotton</p><p>- Phong cách: Hàn Quốc trẻ trung, cá tinh</p><p>- Xuất xứ: Hong Kong</p><p>- 2 túi trước, xiết eo nữ tính</p><p><strong>Kích Thước</strong></p><p><strong><img alt="Hng Nhp - o s mi k caro ni bt SM102 2" src="https://media3.scdn.vn/img1/2015/7_24/hang-nhap-ao-so-mi-ke-caro-noi-bat-sm102-1m4G3-68fa4e.png"></strong></p><br>\r\n\r\n<br><p></p>', 1458832532, 1459567476, 'hang-nhap-ao-so-mi-ke-caro-noi-bat-sm102-sm102', 1, 3, 315000, 220000, 15, 0, 'quang.nh94@gmail.com', 'dDYwZE04VEVNMVhLTmdnSkZPcWtMOHdLVGNhSXF1', '[3]'),
(10, 'Nike Dual Fusion TR 6 Chính Hãng - gtn000261', 'Nike Dual Fusion TR 6 Chính Hãng - gtn000261', '<p>\r\n\r\n<p>Nike <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dual-fusion.htm">Dual Fusion</a>&nbsp;TR 6 <a target="_blank" rel="nofollow" href="https://www.sendo.vn/chinh-hang.htm">Chính Hãng</a>&nbsp;chất liệu cao cấp, nhẹ và bền bỉ - Công nghệ tiên tiến - Thiết kế ấn tượng <br></p><p><img width="547" alt="Nike Dual Fusion TR 6 Chnh Hng 1" src="https://media3.scdn.vn/img1/2015/11_19/nike-dual-fusion-tr-6-chinh-hang-1m4G3-b24906_simg_2e38e2_547x547_max.jpg" height="547" title="Image: https://media3.scdn.vn/img1/2015/11_19/nike-dual-fusion-tr-6-chinh-hang-1m4G3-b24906_simg_2e38e2_547x547_max.jpg"><img width="627" alt="Nike Dual Fusion TR 6 Chnh Hng 2" src="https://media3.scdn.vn/img1/2015/11_19/nike-dual-fusion-tr-6-chinh-hang-1m4G3-08bd71_simg_7ffb69_627x627_max.jpg" height="627"><img width="659" alt="Nike Dual Fusion TR 6 Chnh Hng 3" src="https://media3.scdn.vn/img1/2015/11_19/nike-dual-fusion-tr-6-chinh-hang-1m4G3-f047f5_simg_819322_659x659_max.jpg" height="659"><img width="669" alt="Nike Dual Fusion TR 6 Chnh Hng 4" src="https://media3.scdn.vn/img1/2015/11_19/nike-dual-fusion-tr-6-chinh-hang-1m4G3-0dc9fa_simg_a42bc8_669x669_max.jpg" height="669"></p>\r\n\r\n<br></p>', 1458833060, 1459567476, 'nike-dual-fusion-tr-6-chinh-hang-gtn000261', 1, 1, 0, 990000, 15, 0, 'quang.nh94@gmail.com', 'Y0s3QzZIeVNKV3JzVHFtNFlDcFhNdmNQRnhNVXVI', '[1]'),
(11, 'Áo sơ mi nữ sọc trụ BA59-HÀNG LOẠI 1', 'Áo sơ mi nữ sọc trụ BA59-HÀNG LOẠI 1', '<p>\r\n\r\n</p><h3>Áo sơ mi nữ sọc trụ BA59-HÀNG LOẠI 1</h3><h3><strong>Giá 165k - sale còn 149k khi mua 2 sản phẩm</strong></h3><h3>Thiết kế tinh tế với kiểu cổ trụ cách điệu, kẻ sọc xanh đen nổi bật, tay lỡ, trang phục phù hợp với gu ăn mặc dịu dàng nhưng không kém phần hiện đại của bạn gái.<br>Gam màu thời thượng có thể mix dễ dàng cùng các kiểu chân váy, quần âu công sở hoặc skinny jeans cá tính. Có thể sơ vin đóng thùng hoặc thả suông. Màu sắc: Sọc xanh đen như hình.<br>Chất liệu: Voan cát Hàn Quốc mềm mại, tạo dáng uyển chuyển, thướt tha đặc trưng của phái đẹp.<br>Size: M  (Vòng ngực: 80-86cm - Dài áo: 62cm -  Dài tay: 39cm)</h3><h3>Size L (Vòng ngực: 86-90cm - Dài áo: 65cm -  Dài tay: 39cm)</h3><h3>Cho bạn gái cảm giác thật thoải mái khi mặc, thấm hút mồ hôi tốt, không bị ẩm ướt mồ hôi khi mặc vào những ngày nóng.Phù hợp với nhiều hoàn cảnh: Đi làm, Đi học, Đi chơi, Dự tiệc…</h3><h3>Hàng loại 1 chất lượng đảm bảo y mô tả đường kim mũi chỉ sắc xảo, phân biệt với hàng nhái may theo mẫu hình.</h3><h3>&nbsp;</h3><p><img alt=""></p><p>&nbsp;</p><p><img alt=""></p><p>&nbsp;</p><p><img alt=""></p><p>&nbsp;</p><p><img alt=""></p><p>&nbsp;</p><p>&nbsp;</p><p><img alt=""></p>\r\n\r\n<br><p></p>', 1458834029, 1459567476, 'ao-so-mi-nu-soc-tru-ba59-hang-loai-1', 1, 3, 250000, 165000, 15, 0, 'quang.nh94@gmail.com', 'TVhDMVJpZW9xd1FmcGRjV2p1dmk0VXVHYkJsV0I4', '[3]'),
(12, 'MTL - Áo khoác dù Ferrari', 'MTL - Áo khoác dù Ferrari', '<p>\r\n\r\n</p><div><div><ul><li>Chất liệu: Dù cán cao cấp, không nhăn.</li><li>Kiểu dáng khỏe khoắn, năng động.</li><li>Kích thước: Free size dành cho nam dưới 70 kg</li></ul></div></div><div><div><div>Size<ul><li>Free size</li></ul>Màu sắc<ul><li>Xanh đen</li><li>Đỏ thẫm</li><li>Đen</li></ul></div><br>\r\n\r\n</div></div><br><p></p>', 1458834115, 1459567476, 'mtl-ao-khoac-du-ferrari', 1, 1, 0, 218000, 15, 0, 'quang.nh94@gmail.com', 'ZXRSdHFSN2xTWTRWamJhbFdqbzl1SWN0YmZ6VUpk', '[1]'),
(13, 'MTL - Áo dù phối màu Fashion', 'MTL - Áo dù phối màu Fashion', '<p>\r\n\r\n</p><ul><li>Chất liệu: Dù cán, bền, đẹp.</li><li>Màu sắc: Như hình</li><li>Kích thước: Free size (dành cho Nam dưới 68kg).</li><li>Kiểu dáng: Dây kéo, phối màu hài hòa.</li></ul>\r\n\r\n<br><p></p>', 1458834171, 1459567476, 'mtl-ao-du-phoi-mau-fashion', 1, 1, 0, 190000, 15, 0, 'quang.nh94@gmail.com', 'SjJ1SEh4TDVBMWhPVHpmSXpNbjg1SlRVcDN3cDFP', '[1]'),
(14, 'MTL - Áo khoác dù 2 màu', 'MTL - Áo khoác dù 2 màu', '<p>\r\n\r\n</p><ul><li>Chất liệu: Dù, bền, đẹp, có may lớp lót.</li><li>Form áo đẹp, nam tính.</li><li>Kích thước: Free size (dành cho nam dưới 70kg).</li><li>Màu sắc: Đỏ phối đen.</li></ul>\r\n\r\n<br><p></p>', 1458834397, 1459567476, 'mtl-ao-khoac-du-2-mau', 1, 1, 0, 195000, 15, 0, 'quang.nh94@gmail.com', 'cVY5Nnh6WnQ3T3ZhcHRETDdVUW50WDh6YllXdHNN', '[1]'),
(15, 'MTL - Áo khoác nam kaki TN', 'MTL - Áo khoác nam kaki TN', '<p>\r\n\r\n<ul><li>Chất liệu: Kaki 2 lớp, đẹp, bền.</li><li>Kiểu dáng: Áo tay dài, có nón, 2 túi 2 bên, dây kéo trong + nút bấm ngoài, phối màu hài hòa.</li><li>Kích thước: Free size (dành cho nam dưới 70kg).</li><li>Màu sắc: Xanh, Đỏ</li></ul>\r\n\r\n<br></p>', 1458834446, 1459567476, 'mtl-ao-khoac-nam-kaki-tn', 1, 1, 0, 215000, 15, 0, 'quang.nh94@gmail.com', 'dDNicmhqUWJaOXRDejhMNHVuVm5KdElVSndrdXY1', '[1]'),
(16, 'MTL - Áo khoác kaki mỏ neo', 'MTL - Áo khoác kaki mỏ neo', '<p>\r\n\r\n</p><ul><li>Chất liệu: Kaki 2 lớp, bền, đẹp, thấm hút mồ hôi tốt.</li><li>Kiểu dáng: Dây kéo, 2 túi 2 bên - Form áo đẹp, nam tính.</li><li>Kích thước: Free size (dành cho nam dưới 70kg).</li><li>Màu sắc: Xanh rêu, Vàng nâu</li></ul>\r\n\r\n<br><p></p>', 1458834506, 1459567476, 'mtl-ao-khoac-kaki-mo-neo', 1, 1, 0, 205000, 15, 0, 'quang.nh94@gmail.com', 'SEZxd3JXbHVvOG5TZ0IwTGdiYks4ZHBWNHpDVE55', '[1]'),
(17, 'Giày thể thao đế bằng 3 sọc vải GDNAGTTDE109TQ', 'Giày thể thao đế bằng 3 sọc vải GDNAGTTDE109TQ - GDNAGTTDE109TQ', '<p>\r\n\r\n</p><p><em><a target="_blank" rel="nofollow" href="https://www.sendo.vn/giay-the-thao.htm"><br>Giày thể thao</a>&nbsp;<a target="_blank" rel="nofollow" href="https://www.sendo.vn/de-bang.htm">đế bằng</a>&nbsp;3 sọc vải GDNAGTTDE109TQ</em></p><p>Màu sắc: Đen</p><p>Size : 35, 36, 37, 38</p><p>Chất liệu : Da lộn</p><p>Giày đế bằng cao 3cm, 3 sọc vải.</p><p><br></p><p>Phong cách Hàn Quốc năng động, trẻ trung.</p><p><br></p><p>Phù hợp với những cô nàng cá tính.</p><p><br></p><p><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 1" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-d2d307_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-d2d307_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 2" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-4064e4_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-4064e4_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 3" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-4f0a1e_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 4" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-6119c3_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 5" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-8a7fd0_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 6" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-938a07_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 7" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-6bd07e_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="Giy th thao  bng 3 sc vi GDNAGTTDE109TQ 8" src="https://media3.scdn.vn/img1/2016/2_13/giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq-1m4G3-ea39b1_simg_d0daf0_800x1200_max.jpg"><br></p>\r\n\r\n<br><p></p>', 1459826900, 1459839589, 'giay-the-thao-de-bang-3-soc-vai-gdnagttde109tq', 1, 7, 430000, 310000, 15, 0, 'quang.nh94@gmail.com', 'SlB1V0NxYW5YY2Rzc3U3aW05T3Vtd043R3IxTTNn', '[3,5,7]'),
(18, 'HÀNG NHẬP KHẨU : GIÀY THỜI TRANG ĐẾ ĐỘN GAS - GTT081', 'HÀNG NHẬP KHẨU : GIÀY THỜI TRANG ĐẾ ĐỘN GAS - GTT081', '<p>\r\n\r\n<br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 2" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-f90003_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 3" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-7296bb_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 4" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-32fb5b_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 5" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-64aea6_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 6" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-a3dc8f_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 7" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-6034b5_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="HNG NHP KHU  GIY THI TRANG  N GAS 8" src="https://media3.scdn.vn/img1/2016/3_9/hang-nhap-khau-giay-thoi-trang-de-don-gas-1m4G3-3f4099_simg_d0daf0_800x1200_max.jpg"><br>\r\n\r\n<br></p>', 1459835909, 1459835909, 'hang-nhap-khau-giay-thoi-trang-de-don-gas-gtt081', 1, 7, 335000, 335000, 10, 0, 'quang.nh94@gmail.com', 'SVVxejQ3b2kzTmYzeFZ6d1FXc1hRUHczUjRQM0pD', '[3,5,7]');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_properties`
--

INSERT INTO `items_properties` (`id`, `property_name`, `created_at`, `updated_at`, `active`, `item_id`, `parent_id`, `property_value`) VALUES
(1, 'size', 1459570336, 1459570336, 1, 4, 0, ''),
(2, 'color', 1459570347, 1459570347, 1, 4, 0, ''),
(3, 'size', 1459570535, 1459570535, 1, 1, 0, ''),
(4, 'color', 1459570544, 1459570544, 1, 1, 0, ''),
(5, '38', 1459570555, 1459570555, 1, 0, 3, ''),
(6, '39', 1459570562, 1459570562, 1, 0, 3, ''),
(7, '40', 1459570565, 1459570565, 1, 0, 3, ''),
(8, '41', 1459570569, 1459570569, 1, 0, 3, ''),
(9, '45', 1459570573, 1459570573, 0, 0, 3, ''),
(10, 'white', 1459570587, 1459570587, 1, 0, 4, ''),
(11, 'silver', 1459570619, 1459570619, 1, 0, 4, ''),
(12, 'black', 1459570624, 1459570624, 1, 0, 4, ''),
(13, 'size', 1459826917, 1459826917, 1, 17, 0, ''),
(14, 'color', 1459826922, 1459826922, 1, 17, 0, ''),
(15, '35', 1459826929, 1459826929, 1, 0, 13, ''),
(16, '36', 1459826934, 1459826934, 1, 0, 13, ''),
(17, '37', 1459826938, 1459826938, 1, 0, 13, ''),
(18, '38', 1459826941, 1459826941, 1, 0, 13, ''),
(19, '39', 1459826945, 1459826945, 1, 0, 13, ''),
(20, '40', 1459826951, 1459826951, 1, 0, 13, ''),
(21, 'white', 1459827125, 1459827125, 1, 0, 14, ''),
(22, 'red', 1459827132, 1459827132, 1, 0, 14, ''),
(24, 'yellow', 1459827162, 1459827162, 1, 0, 14, ''),
(25, 'blue', 1459827166, 1459827166, 1, 0, 14, ''),
(26, 'size', 1459839361, 1459839361, 1, 18, 0, ''),
(27, '36', 1459839367, 1459839367, 1, 0, 26, ''),
(28, '37', 1459839372, 1459839372, 1, 0, 26, ''),
(29, 'color', 1459839379, 1459839379, 1, 18, 0, ''),
(30, 'red', 1459839392, 1459839392, 1, 0, 29, ''),
(31, 'black', 1459839398, 1459839398, 1, 0, 29, '');

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

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL,
  `buyer_email` varchar(250) NOT NULL,
  `buyer_name` varchar(250) NOT NULL,
  `buyer_phone` varchar(11) NOT NULL,
  `buyer_address` varchar(250) NOT NULL,
  `receive_email` varchar(250) NOT NULL,
  `receive_name` varchar(250) NOT NULL,
  `receive_phone` varchar(11) NOT NULL,
  `receive_address` varchar(250) NOT NULL,
  `recive_district` varchar(250) NOT NULL,
  `remove_trade` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `remove` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `root_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `property` text NOT NULL COMMENT 'Thuộc tính sản phẩm , cái này lưu json'
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
-- Indexes for table `hotdeal`
--
ALTER TABLE `hotdeal`
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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`item_id`);

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
-- AUTO_INCREMENT for table `hotdeal`
--
ALTER TABLE `hotdeal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `items_properties`
--
ALTER TABLE `items_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `items_properties_value`
--
ALTER TABLE `items_properties_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
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

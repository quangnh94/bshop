-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2016 at 11:01 AM
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
-- Table structure for table `hotdeal`
--

CREATE TABLE IF NOT EXISTS `hotdeal` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `items` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hotdeal`
--

INSERT INTO `hotdeal` (`id`, `name`, `items`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Thời trang nữ', '1,5', 1, 1457498599, 1457498599),
(2, 'Đồng hồ', '4,2,3,6', 1, 1457510354, 1457510354);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
(9, '1457517336dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg', 1457517336, 1457517336, 0, 'items', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB', 'quang.nh94@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `description`, `content`, `created_at`, `updated_at`, `alias`, `active`, `category_id`, `root_price`, `sell_price`, `quantity`, `sold_quantity`, `user_id`, `token`) VALUES
(1, 'Giày thể thao nữ cổ cao- cực xinh - G-001', 'HUHU Fashion chuyên cung cấp Túi xách , Giầy thời trang.', '<p>\r\n\r\n</p><p>- Order hàng theo yêu cầu.</p><p>- Giao hàng toàn quốc (Miễn phí giao hàng nội thành hà nội).</p><p>- Địa chỉ : số 5, ngách 43/3 nguyễn ngọc nại, thanh xuân, hn.</p><p>- Liên hệ shop: 093 457 1168 - Ms Hường.</p><p>- Fanpage: <a target="_blank" rel="nofollow" href="https://www.facebook.com/huhufashion">https://www.facebook.com/huhufashion</a>.</p><p><img alt="Giy th thao n c cao- cc xinh 1" src="https://media3.scdn.vn/img1/2015/10_23/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-1125b9_simg_d0daf0_800x1200_max.png"><br><br><br><br><br><img alt="Giy th thao n c cao- cc xinh 2" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-11c518_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 3" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-9383da_simg_d0daf0_800x1200_max.png"><br><br><img alt="Giy th thao n c cao- cc xinh 4" src="https://media3.scdn.vn/img1/2015/11_1/giay-the-thao-nu-co-cao-cuc-xinh-1m4G3-26788c_simg_d0daf0_800x1200_max.png"></p><br>\r\n\r\n<br><p></p>', 1457343296, 1457343891, 'giay-the-thao-nu-co-cao-cuc-xinh-g-001', 1, 3, 350000, 320000, 50, 0, 'quang.nh94@gmail.com', 'bDlVUWFTdjdibzNlZ0U3VEs4UGpzTkxkSzcxT3Qz'),
(2, 'Đồng Hồ nam Cao Cấp SK9058 - SK9058B', 'Đồng Hồ nam Cao Cấp SK9058 - SK9058B', '<p>\r\n\r\n</p><p><strong>Xem Thêm Sản Phẩm Khác : <a target="_blank" rel="nofollow" href="https://www.sendo.vn/shop/sieuthimini/san-pham/">https://www.sendo.vn/shop/sieuthimini/san-pham/</a></strong></p><p>SP Bảo Hành 6 Tháng</p><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho-nam.htm">Đồng Hồ Nam</a>&nbsp;Skmei <a target="_blank" rel="nofollow" href="https://www.sendo.vn/sk9058.htm">SK9058</a>&nbsp;Thiết kế Nam Tính-Mạnh Mẽ</p><p>Skmei là thương hiệu <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm">đồng hồ</a>&nbsp;chất lượng cao, thiết kế đẹp mắt, chế tác tinh xảo từng chi tiết nhưng giá bình dân</p><p>Đặc Điểm Nỗi Bật :</p><p>-Máy Và Pin Siêu Bền Nhập Khẩu từ Nhật Bản</p><p>-Mặt kính cao cấp</p><p>-Chịu nước tốt</p><p>-Dây Da cao cấp</p><div><div><div><p><img alt="ng H nam Cao Cp SK9058 1" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-1d83b1.jpg"></p><p><img alt="ng H nam Cao Cp SK9058 2" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-8628a9.jpg"></p><p><a target="_blank" rel="nofollow" href="http://ban.sendo.vn/product"><img alt="ng H nam Cao Cp SK9058 3" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-f88b19.jpg"></a><br></p><p><a target="_blank" rel="nofollow" href="http://ban.sendo.vn/product"><img alt="ng H nam Cao Cp SK9058 4" src="https://media3.scdn.vn/img1/2015/7_31/dong-ho-nam-cao-cap-sk9058-1m4G3-8c2644.png"></a><br></p><br><p>Chuyên Sỉ và Lẻ Đồng Hồ Thời Trang, Sản Phẩm Công Nghệ Với Tiêu Chí Rẻ Mà Chất</p><p>Địa chỉ:</p><p><strong>-90/29 Thành Thái, Q10 TPHCM</strong></p><p><strong>-14/1A Nguyễn Thị Thập-TP.Mỹ Tho-Tiền Giang</strong></p><p><strong>Mobile/Zalo :</strong><strong>&nbsp;0907939707 - Mr Trung</strong></p><br>\r\n\r\n</div></div></div><br><p></p>', 1457498771, 1457498771, 'dong-ho-nam-cao-cap-sk9058-sk9058b', 1, 1, 350000, 220000, 2, 0, 'quang.nh94@gmail.com', 'SVhnV1NhWHNLRDVoYW5mOXVPeWl4WEFwR2VxSktF'),
(3, 'DH011 - Đồng hồ nam LAVANA Hàng loại I Da mềm - Nam tính, Cao cấp - DH011-1', 'DH011 - Đồng hồ nam LAVANA Hàng loại I Da mềm - Nam tính, Cao cấp - DH011-1', '<p>\r\n\r\n<p><strong><br></strong></p><p><strong><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 2" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-9a2b4e_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-9a2b4e_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 3" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-3c39d9_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-3c39d9_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 4" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-be34e3_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-be34e3_simg_d0daf0_800x1200_max.jpg"><br><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 5" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-f156af_simg_cdc28a_665-665-46-41_cropf_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-f156af_simg_cdc28a_665-665-46-41_cropf_simg_d0daf0_800x1200_max.jpg"><img alt="DH011 - ng h nam LAVANA Hng loi I Da mm - Nam tinh Cao cp 6" src="https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-8d4fb6_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2015/10_16/dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-tinh-cao-cap-1m4G3-8d4fb6_simg_d0daf0_800x1200_max.jpg"></strong></p><br>\r\n\r\n<br></p>', 1457498891, 1457498891, 'dh011-dong-ho-nam-lavana-hang-loai-i-da-mem-nam-ti', 1, 1, 350000, 350000, 2, 0, 'quang.nh94@gmail.com', 'cDFPdHNTQnRvc3hKNUliWVE3RXF4RXhOdk1WaUF0'),
(4, 'Đồng hồ Nam Curren Dây Da Màu Bò - CR8152 - CR8152', 'Đồng hồ Nam Curren Dây Da Màu Bò - CR8152 - CR8152', '<p>\r\n\r\n<h1><a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho-julius.htm">Đồng Hồ JULIUS</a>&nbsp;JU1005 NAM ( nâu)</h1><p>Với nam giới, nét đẹp mạnh mẽ và nam tính luôn luôn được ưu tiên hàng đầu. Để thể hiện được hết khí chất đó, người đàn ông không những phải chú ý phong thái mà cần quan tâm ngay từ trang phục với quần áo, giày dép, hay các loại phụ kiện như cravat, dây lưng, <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm" title="Link: https://www.sendo.vn/dong-ho.htm">đồng hồ</a>. Mang đến một mẫu đồng hồ với thiết kế mạnh mẽ, phóng khoáng, chiếcĐồng hồ nam Julius JU1005 của hãng Julius Hàn Quốc chắc chắn là sản phẩm các quý ông không thể bỏ qua.</p><h1><div><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 2" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e1073d.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e1073d.jpg"></a><br><br>Mang cấu tạo của một chiếc <strong>đồng hồ</strong>&nbsp;Quartz JULIUS HOME JU1005, chiếc đồng hồ nam này không chỉ có mặt xem giờ 12 số mà còn có biểu thị giờ 24 để xác định chính xác thời gian sáng hay chiều và phần xem ngày trong tháng. Đảm bảo chất lượng cho sản phẩm, toàn bộ phần máy cấu tạo đồng hồ đều được nhập khẩu từ Nhật Bản với kỹ thuật chế tác hiện đại. Thêm vào đó, để tăng khả năng chịu lực và chống chịu những tác động từ môi trường bên ngoài, mặt đồng hồ được bảo vệ bởi lớp kính khoáng trong suốt, dày dặn nhưng có độ rõ nét cao, chống được trày xước. Ngoài ra, Đồng hồ nam Julius JU1005 &nbsp;cũng có khả năng chống thấm nước ở mức 3ATM, cho phép rửa tay, đi mưa, rửa xe hoặc các công việc khác có mức độ tiếp xúc nước tương đương mà không cần phải tháo ra.<br><br><br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 3" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-20e98a.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-20e98a.jpg"></a><br>Cuộc sống ngày càng phát triển, nhu cầu của con người cũng không ngừng gia tăng, không còn dừng lại ở những nhu cầu cơ bản như “ăn no”, “mặc ấm” mà đã phát triển lên thành “ăn ngon”, “mặc đẹp”. Đáp lại nhu cầu “mặc đẹp” chính là sự bùng nổ của ngành công nghiệp thời trang. Từ thời trang cho nữ giới tới thời trang nam, đều có sự thay đổi chóng mặt và sự đa dạng không thể kể hết. Từ những món đồ cơ bản như quần, áo, giày dép cho đến những loại phụ kiện như trang sức, mũ nón, túi ví, dây lưng và<strong>đồng hồ</strong>. Ở phần dưới đây, Baza sẽ giới thiệu cho các bạn mẫuđồng hồ nam Julius JU1005 xuất xứ Hàn Quốc, chắc chắn sẽ đáp ứng được nhu cầu “mặc đẹp” của các quý ông.<a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 4" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-edf3c6.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-edf3c6.jpg"></a></p><p>Xét về cấu tạo cơ bản<strong>, </strong>đồng hồ nam Julius JU1005 có kết cấu “tròn trong vuông”, mặt đồng hồ tròn lồng trong vỏ vuông tạo dáng cong mềm mại, tạo nên một chỉnh thể độc đáo. Bề mặt của đồng hồ là kính khoáng cao cấp, có độ rõ nét cao và khả năng chống xước, luôn luôn nhìn rõ giờ bên trong. Toàn bộ phần vỏ và khóa của đồng hồ được làm từ chất liệu hợp kim thép không gỉ, được mạ IP chân không để luôn giữ được độ bóng, sáng và bền màu. Mức chống thấm nước của đồng hồ Julius JA388M là 3ATM (30m) cho phép người dùng rửa tay, đi mưa, rửa xe hay các việc có độ tiếp xúc nước tương đương mà không cần phải tháo khỏi tay.</p><p><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 5" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-36bcbe.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-36bcbe.jpg"></a><br>Không chỉ mang lại sự đa dạng về kiểu dáng, chiếc <strong>đồng hồ nam</strong>&nbsp;này cũng đáp ứng được nhiều phong cách khác nhau. Đồng hồ đen mạ bạc sẽ tôn thêm nét đẹp sang trọng và lịch lãm cho các quý ông, đồng hồ dây nâu mạ vàng lại là lựa chọn cho những quý ông theo phong cách cổ điển, các màu đỏ, trắng, kem sữa lại là dành riêng cho những anh chàng muốn thử sức mình với những xu hướng mới hay có gu thời trang trẻ trung, phá cách. Sự kết hợp giữa chiếc đồng hồ nam Julius JU1005 với các trang phục khác sẽ tạo nên vẻ đẹp hoàn hảo và nổi bật mà không ai có thể chối từ<a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 6" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-c33fa2.jpg" title="Image: https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-c33fa2.jpg"></a><br><strong>Nhãn hàng: </strong>Julius Home<br><br><strong>Chất liệu quai:</strong>&nbsp;Da cao cấp<br><br><strong>Chất liệu case: </strong>Thép không gỉ<br><br><strong>Chất liệu kính:</strong>&nbsp;Kính khoáng chịu nhiệt chống trầy tương đối 80% <br><br><strong>Kiểu mặt: </strong>Tròn<br><br><strong>Giới tính: </strong>Nam<br><br><strong>Kích thước mặt:</strong>&nbsp;4cm; dày 1.1 cm<br><br><strong>Kích thước quai:</strong>&nbsp;rộng: 2cm; Dài: 25cm<br><br><strong>Khối lượng: </strong>60g<br><br><strong>Chống nước: </strong>3ATM (30 mét nước) Chống thấm nước &nbsp;môi trường rửa tay, rửa mặt, bơi lội<br><br><strong>Bảo hành</strong>: 12 tháng, miễn phí vận chuyển bảo hành, hỗ trợ phí sửa đồng hồ 3 năm<br>- Đồng Hồ Thương hiệu thiết kế Hàn quốc JULIUS - CHống thấm nước 30m nước - Bảo hành 12 tháng - Dây da nam tính màu nâu <br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 7" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-e854cc.jpg"></a><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 8" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-055b9f.jpg"></a><br><a target="_blank" rel="nofollow" href="https://www.sendo.vn/san-pham/dong-ho-julius-ju1005-nam-nau-2819891/"><img alt="ng H JULIUS JU1005 NAM nu 9" src="https://media3.scdn.vn/img1/2016/3_6/dong-ho-julius-ju1005-nam-nau-1m4G3-5c093d.jpg"></a></p></div></h1>\r\n\r\n<br></p>', 1457499204, 1457499204, 'dong-ho-nam-curren-day-da-mau-bo-cr8152-cr8152', 1, 1, 520000, 266000, 15, 0, 'quang.nh94@gmail.com', 'MG9ZQkJzTkxCc1R2N0E2UEp6TGF4REp2N3VsakJt'),
(5, 'Áo Vest nữ thời trang Hàn Quốc L12899 - L12899', 'Áo Vest nữ thời trang Hàn Quốc L12899 - L12899', '<p>\r\n\r\n</p><ul><li><p><strong>Hỗ trợ tư vấn đặt hàng qua zalo, viber, hoặc gọi trực tiếp: 0917399527</strong></p><p><strong>Miễn phí giao hàng với đơn hàng trên 500k trên toàn quốc</strong></p></li><li><strong>Áo khoác vest phối màu sành điệu</strong>&nbsp;khoác nổi bật với thiết kế form dài duyên dáng, phối màu hợp <a target="_blank" rel="nofollow" href="https://www.sendo.vn/thoi-trang.htm">thời trang</a>.</li><li>Thiết kế cổ cách điệu và túi giả phối màu cùng với nút bọc trắng,áo được may thêm cầu vai làm cho chiếc áo càng trở nên sang trọng hơn</li><li>Áo 2 túi mổ trước vừa tiện lợi cho việc cất giữ các phụ kiện nhỏ cũng như tạo thêm điểm nhấn cho sản phẩm.</li><li>Màu sắc thời trang được kết hợp với nhau tạo nên sự sang trọng cho sản phẩm</li><li>Chất liệu: Tuyết mưa.</li><li>Size: Freesize</li><li>Kích thước: (Chênh lệch: +/-2cm)</li><li>Dài 57cm, Vai 33cm, Tay 52cm (tính từ vai), Ngực 40cmx2, Eo: 31cmx2.</li><li><img alt="o Vest n thi trang Hn Quc L12899 1" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-bff1d1_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="o Vest n thi trang Hn Quc L12899 2" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-13e6da_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="o Vest n thi trang Hn Quc L12899 3" src="https://media3.scdn.vn/img1/2015/7_16/ao-vest-nu-thoi-trang-han-quoc-l12899-1m4G3-d28d8f_simg_d0daf0_800x1200_max.jpg"></li></ul><br>\r\n\r\n<br><p></p>', 1457517124, 1457517124, 'ao-vest-nu-thoi-trang-han-quoc-l12899-l12899', 1, 1, 270000, 189000, 10, 0, 'quang.nh94@gmail.com', 'ZnMyWnI3eFk2WG9DVWo2MTcyQ0xyc3BYNXJzY0xr'),
(6, 'Đồng Hồ Nam DW Siêu Mỏng - DH10', 'Đồng Hồ Nam DW Siêu Mỏng - DH10', '<p>\r\n\r\n<p><br><strong>Đ</strong><strong>ồng Hồ Nam DW Siêu Mỏng</strong></p><p><strong>- Kích Thước : Nam 6 x 40mm, Nữ 6 x 30mm</strong></p><p><strong>- Dây Da Có 2 Màu : Nâu Và Đen</strong></p><p><strong><br></strong></p><p><strong>Ship Hàng Toàn Quốc</strong></p><p><strong>&nbsp; &nbsp; Hotline : 0917878783</strong></p><p><strong>&nbsp; &nbsp; &nbsp;</strong></p><p><strong>Bảo Hành 3 Tháng</strong></p><p><strong>* Các Bạn Có Thể Vào Đường Line Phía Dưới Xem Thêm Mẩu <a target="_blank" rel="nofollow" href="https://www.sendo.vn/dong-ho.htm">Đồng Hồ</a>&nbsp;Khác</strong></p><p><strong><a href="http://www.sendo.vn/shop/huynh-dong/">www.sendo.vn/shop/huynh-dong/</a></strong></p><p><strong><img alt="ng H Nam DW Siu Mng 1" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-737059_simg_40d51b_1015-1015-0-80_cropf_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-737059_simg_40d51b_1015-1015-0-80_cropf_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 2" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-75312f_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-75312f_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 3" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-7a2098_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 4" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-0939d3_simg_d0daf0_800x1200_max.jpg" title="Image: https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-0939d3_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 5" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-f14ee9_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 6" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-ca381f_simg_d0daf0_800x1200_max.jpg"><br><br><img alt="ng H Nam DW Siu Mng 7" src="https://media3.scdn.vn/img1/2016/1_21/dong-ho-nam-dw-sieu-mong-1m4G3-4f5e75_simg_d0daf0_800x1200_max.jpg"></strong></p><br>\r\n\r\n﻿<br></p>', 1457517340, 1457517340, 'dong-ho-nam-dw-sieu-mong-dh10', 1, 1, 260000, 130000, 2, 0, 'quang.nh94@gmail.com', 'cm5Gc1hmOEFNRlNLRVpqM04yczVVYkpWZWY5YnRB');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_properties`
--

INSERT INTO `items_properties` (`id`, `property_name`, `created_at`, `updated_at`, `active`, `item_id`, `parent_id`, `property_value`) VALUES
(1, 'color', 1457424286, 1457424286, 1, 1, 0, ''),
(3, 'size', 1457427511, 1457494634, 1, 1, 0, ''),
(26, 'red', 1457494305, 1457494305, 1, 0, 1, ''),
(32, 'yellow', 1457494855, 1457494855, 1, 0, 1, ''),
(33, 'blue', 1457494969, 1457494976, 0, 0, 1, ''),
(34, '39', 1457494989, 1457494989, 1, 0, 3, ''),
(35, '40', 1457494993, 1457494993, 1, 0, 3, ''),
(36, '41', 1457494996, 1457494996, 1, 0, 3, ''),
(37, '42', 1457495000, 1457495000, 1, 0, 3, ''),
(38, '43', 1457495003, 1457495003, 1, 0, 3, '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `items_properties`
--
ALTER TABLE `items_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
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

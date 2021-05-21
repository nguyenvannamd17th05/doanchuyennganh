-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2021 at 06:11 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idcategory` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sort` int(2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `categoryid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `title`, `url`, `sort`, `status`, `categoryid`) VALUES
(2, 'Áo', 'ao', 1, 0, NULL),
(4, 'Áo dài tay', 'ao-dai-tay', 1, 0, 2),
(8, 'Quần', 'quan', NULL, 0, NULL),
(9, 'Giày', 'giay', NULL, 0, NULL),
(10, 'Quần jean', 'quan-jean', NULL, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `category_products`
--

CREATE TABLE `category_products` (
  `categoryid` int(5) NOT NULL,
  `productsid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_products`
--

INSERT INTO `category_products` (`categoryid`, `productsid`) VALUES
(2, 10),
(2, 11),
(2, 14),
(4, 12),
(10, 13);

-- --------------------------------------------------------

--
-- Table structure for table `colorproduct`
--

CREATE TABLE `colorproduct` (
  `idcolorproduct` int(10) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `productid` int(10) NOT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colorproduct`
--

INSERT INTO `colorproduct` (`idcolorproduct`, `title`, `color`, `productid`, `status`) VALUES
(12, 'Đen', NULL, 10, NULL),
(13, 'Trắng', NULL, 10, NULL),
(14, 'Rêu', NULL, 10, NULL),
(15, 'Xanh đen', NULL, 11, NULL),
(16, 'Xám', NULL, 12, NULL),
(17, 'Xanh biển', NULL, 13, NULL),
(18, 'vang', NULL, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discountcode`
--

CREATE TABLE `discountcode` (
  `iddiscountcode` int(5) NOT NULL,
  `code` varchar(10) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` date NOT NULL,
  `condition` float NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT 0,
  `amount` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `idimage` int(10) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `websiteinfoid` int(10) DEFAULT NULL,
  `colorproductid` int(10) DEFAULT NULL,
  `id_blog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`idimage`, `title`, `url`, `websiteinfoid`, `colorproductid`, `id_blog`) VALUES
(31, 'blog', 'aPXbfsg7T4_1621345835.jpg', NULL, NULL, 7),
(32, 'blog', 'vRZLS3SDVU_1621347515.jpg', NULL, NULL, 8),
(33, 'blog', 'J1jnjyFXOa_1621347830.jpg', NULL, NULL, 9),
(34, 'blog', 'emoafWnUKJ_1621348503.jpg', NULL, NULL, 10),
(35, 'product', 'G6lXz1Dfep_1621519993.jpg', NULL, 12, 0),
(36, 'product', 'gNYx3R51RX_1621520753.jpg', NULL, 13, 0),
(37, 'product', 'T8yVZS4YDi_1621520837.jpg', NULL, 14, 0),
(40, 'product', 'ph0NEYlt22_1621522035.jpg', NULL, 15, 0),
(41, 'product', 'O0r0cI2iCo_1621522968.jpg', NULL, 16, 0),
(42, 'product', 'dOe4Yd5GGv_1621523082.jpg', NULL, 17, 0),
(43, 'blog', 'g345XCkGKw_1621524219.jpg', NULL, NULL, 11),
(44, 'product', 'ab4brfrXHT_1621568013.jpg', NULL, 18, 0),
(45, 'product', 'i4XOpQ8Std_1621568014.jpg', NULL, 18, 0),
(46, 'product', 'aQnIkZj0pk_1621568014.jpg', NULL, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `idinvoice` int(10) NOT NULL,
  `totalmoney` bigint(19) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `discountcodeId` int(5) DEFAULT NULL,
  `userid` int(10) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `status` tinyint(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`idinvoice`, `totalmoney`, `date`, `discountcodeId`, `userid`, `address`, `phonenumber`, `status`) VALUES
(7, 7700000, '2021-05-20 22:13:15', NULL, 4, '45/18 Dương Bá Trạc phường 1, quận 8, tp Hồ Chí Minh', '0967128473', 4),
(8, 7700000, '2021-05-21 10:27:43', NULL, 6, '45/18 Dương Bá Trạc phường 1, quận 8, tp Hồ Chí Minh', '08888888', 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `idinvoicedetails` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT 0,
  `invoiceid` int(10) NOT NULL,
  `productinfoId` varchar(255) DEFAULT NULL,
  `productIdproduct` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedetails`
--

INSERT INTO `invoicedetails` (`idinvoicedetails`, `amount`, `invoiceid`, `productinfoId`, `productIdproduct`) VALUES
(10, 4, 7, 'POLO ASE / Xanh đen / L', 11),
(11, 11, 8, 'QUẦN JEAN M1QJN / Xanh biển / M', 13);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_18_091208_create_user_activations_table', 1),
(5, '2021_05_18_091536_alter_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` longtext NOT NULL,
  `date_create` date NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `date_create`, `id_user`, `description`) VALUES
(9, 'Thêm 48 ca Covid-19, đa số ở Bắc Giang', '<p>Như vậy h&ocirc;m nay Bộ Y tế c&ocirc;ng bố tổng cộng 152 ca nhiễm trong nước, 19 người khỏi. Tổng số ca nhiễm cộng đồng từ ng&agrave;y 27/4 đến nay l&agrave; 1.473, ghi nhận ở<a href=\"https://vnexpress.net/them-48-ca-covid-19-da-so-o-bac-giang-4280336-p2.html\">&nbsp;28 tỉnh th&agrave;nh</a>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>48 ca mới được ghi nhận từ số 4465-4512. Số ca nhiễm mới n&acirc;ng tổng số ca nhiễm ở Bắc Giang 507, Bắc Ninh 306, Điện Bi&ecirc;n 31, Th&aacute;i B&igrave;nh 16.</p>\r\n\r\n<p>Tại Bắc Ninh:</p>\r\n\r\n<p><strong>Ca 4465-4467, 4469-4478</strong>&nbsp;l&agrave; F1 li&ecirc;n quan đến ổ dịch x&atilde; M&atilde;o Điền, huyện Thuận Th&agrave;nh v&agrave; một c&ocirc;ng nh&acirc;n C&ocirc;ng ty Canon, đ&atilde; được c&aacute;ch ly trước đ&oacute;. Kết quả x&eacute;t nghiệm ng&agrave;y 17/5 c&aacute;c bệnh nh&acirc;n dương t&iacute;nh với nCoV.</p>\r\n\r\n<p>Tại Th&aacute;i B&igrave;nh:</p>\r\n\r\n<p><strong>Ca 4468,</strong>&nbsp;nữ, 44 tuổi, địa chỉ tại huyện Th&aacute;i Thụy, c&oacute; li&ecirc;n quan dịch tễ với ca 3042, đ&atilde; được c&aacute;ch ly trước đ&oacute;. Kết quả x&eacute;t nghiệm ng&agrave;y 18/5 dương t&iacute;nh với nCoV, bệnh nh&acirc;n điều trị tại Bệnh viện Đa khoa tỉnh Th&aacute;i B&igrave;nh.</p>\r\n\r\n<p>Tại Điện Bi&ecirc;n:</p>\r\n\r\n<p><strong>Ca 4479</strong>, nữ, 3 tuổi, địa chỉ tại huyện Nậm Pồ, l&agrave; F1 của ca 4378, đ&atilde; được c&aacute;ch ly, kết quả x&eacute;t nghiệm ng&agrave;y 18/5 dương t&iacute;nh với nCoV. Hiện bệnh nh&acirc;n điều trị tại Bệnh viện d&atilde; chiến th&agrave;nh phố Điện Bi&ecirc;n Phủ.</p>\r\n\r\n<p>Tại Bắc Giang:</p>\r\n\r\n<p><strong>Ca 4480-4512</strong>&nbsp;l&agrave; c&aacute;c F1 li&ecirc;n quan c&aacute;c khu c&ocirc;ng nghiệp Quang Ch&acirc;u, V&acirc;n Trung, Đ&igrave;nh Tr&aacute;m, đ&atilde; được c&aacute;ch ly trước đ&oacute;. Kết quả x&eacute;t nghiệm ng&agrave;y 17-18/5 c&aacute;c bệnh nh&acirc;n dương t&iacute;nh với nCoV.</p>\r\n\r\n<p>Tổng số người tiếp x&uacute;c gần v&agrave; nhập cảnh từ v&ugrave;ng dịch đang được theo d&otilde;i sức khỏe l&agrave; hơn 122.000, trong đ&oacute; c&aacute;ch ly tập trung tại bệnh viện l&agrave; hơn 2.200 c&aacute;ch ly tập trung tại cơ sở kh&aacute;c l&agrave; hơn 33.000, số c&ograve;n lại tại nh&agrave;, nơi lưu tr&uacute;.</p>\r\n\r\n<p>Theo Trung t&acirc;m Đ&aacute;p ứng khẩn cấp sự kiện y tế c&ocirc;ng cộng Việt Nam, thế giới ghi nhận hơn 163 triệu ca Covid-19, trong đ&oacute; gần 3,4 triệu người đ&atilde; tử vong. Đứng thứ nhất về số ca mắc l&agrave; Mỹ, sau đ&oacute; l&agrave; Ấn Độ v&agrave; Brazil.</p>', '2021-05-18', 1, 'Bộ Y tế tối 18/5 ghi nhận 48 ca dương tính nCoV đều ở khu phong tỏa, gồm tại Bắc Giang 33, Bắc Ninh 13, Điện Biên và Thái Bình mỗi nơi một.'),
(11, 'HỌA TIẾT KẺ SỌC VÀ SỰ TRỞ LẠI ĐÚNG THỜI ĐIỂM', '<p>Nếu những chuyến du lịch trở n&ecirc;n bất khả thi v&igrave; sự hạn chế của đại dịch, vậy th&igrave; h&atilde;y để họa tiết kẻ sọc đưa bạn đến gần hơn với c&aacute;c cảm hứng viễn du v&agrave; chinh phục.</p>\r\n\r\n<p>Họa tiết kẻ sọc được xem l&agrave; &ldquo;linh hồn&rdquo; của nhiều phong c&aacute;ch như Preppy hay Academia. Đặc biệt, họa tiết n&agrave;y thường chiếm ưu thế trong tủ quần &aacute;o của c&aacute;c t&iacute;n đồ theo&nbsp;<a href=\"https://www.elle.vn/xu-huong-phong-cach/minimalism-goi-y-phoi-do-dep-theo-phong-cach-toi-gian\" target=\"_blank\">chủ nghĩa tối giản</a>. Kh&ocirc;ng thể phủ nhận những đường kẻ song song n&agrave;y c&oacute; t&iacute;nh ứng dụng cao, mang lại nhiều lựa chọn cho người mặc trong mọi ho&agrave;n cảnh.</p>\r\n\r\n<p><img alt=\"đầm họa tiết kẻ sọc ngang\" src=\"https://www.elle.vn/wp-content/uploads/2021/05/17/435818/dam-hoa-tiet-ke-soc-ngang-sooyaaa__.jpg\" style=\"height:937px; width:750px\" /></p>\r\n\r\n<p>(Ảnh: @sooyaaa__)</p>\r\n\r\n<p>Với nguồn gốc từ đồng phục thủy thủ, họa tiết kẻ sọc mang &ldquo;hơi thở&rdquo; của biển chinh phục thời trang H&egrave; h&agrave;ng năm. Ngo&agrave;i &aacute;o sơ mi, những đường kẻ sọc mạnh mẽ được biến h&oacute;a tr&ecirc;n nhiều thiết kế nữ t&iacute;nh như ch&acirc;n v&aacute;y, đầm, jumpsuit,&hellip; Bất kể trong t&igrave;nh huống n&agrave;o, những m&oacute;n đồ kẻ sọc lu&ocirc;n l&agrave; lựa chọn an to&agrave;n cho bộ c&aacute;nh thời trang của bạn.</p>\r\n\r\n<h2>HỌA TIẾT KẺ SỌC TR&Ecirc;N S&Agrave;N DIỄN XU&Acirc;N &ndash; H&Egrave; 2021</h2>\r\n\r\n<p>Chanel l&agrave; nh&agrave; mốt đ&aacute;nh dấu cột mốc xuất hiện của họa tiết kẻ sọc trong l&agrave;ng thời trang với sự ra đời của chiếc &aacute;o thun tay d&agrave;i v&agrave;o đầu thế kỷ 20. Họa tiết n&agrave;y l&agrave; biểu tượng khẳng định t&iacute;nh độc lập v&agrave; niềm ki&ecirc;u h&atilde;nh của phụ nữ thời bấy giờ. Cho đến nay, những thiết kế kẻ sọc vẫn xuất hiện tr&ecirc;n s&agrave;n diễn của nhiều thương hiệu thời trang danh gi&aacute;.</p>\r\n\r\n<p><img alt=\"áo thun kẻ sọc Chanel\" src=\"https://www.elle.vn/wp-content/uploads/2021/05/17/435818/ao-thun-ke-soc-chanel-wikimedia-commons.jpg\" style=\"height:2522px; width:1920px\" /></p>\r\n\r\n<p>Chiếc &aacute;o thun kẻ sọc của Chanel đầu thế kỷ 20 (Ảnh: Wikimedia Commons)</p>\r\n\r\n<p>Ở tuần lễ thời trang Xu&acirc;n &ndash; H&egrave; 2021, c&aacute;c nh&agrave; thiết kế tinh tế t&aacute;i hiện họa tiết kẻ sọc ho&agrave;i cổ tr&ecirc;n nền trang phục hiện đại. Christian Dior v&agrave; Versace ứng dụng đường kẻ sọc với gam m&agrave;u n&oacute;ng bắt mắt, mang đậm cảm hứng thời trang H&egrave;. &Aacute;o sơ mi m&agrave;u trung t&iacute;nh của Max Mara v&agrave; Etro thể hiện n&eacute;t nam t&iacute;nh đặc trưng của họa tiết sọc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"họa tiết kẻ sọc trên sàn diễn christian dior và versace\" src=\"https://www.elle.vn/wp-content/uploads/2021/05/17/435818/hoa-tiet-ke-soc-tren-san-dien-christian-dior-va-versace.jpg\" style=\"height:800px; width:1066px\" /></p>\r\n\r\n<p>(Ảnh: Christian Dior v&agrave; Versace)</p>\r\n\r\n<p><img alt=\"họa tiết kẻ sọc trên sàn diễn etro và max mara\" src=\"https://www.elle.vn/wp-content/uploads/2021/05/17/435818/hoa-tiet-ke-soc-tren-san-dien-etro-va-maxmara.jpg\" style=\"height:800px; width:1066px\" /></p>\r\n\r\n<p>(Ảnh: Etro v&agrave; Max Mara)</p>\r\n\r\n<p>&nbsp;</p>', '2021-05-20', 2, 'Nếu những chuyến du lịch trở nên bất khả thi vì sự hạn chế của đại dịch, vậy thì hãy để họa tiết kẻ sọc đưa bạn đến gần hơn với các cảm hứng viễn du và chinh phục.');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idproduct` int(10) NOT NULL,
  `idproducer` varchar(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` bigint(19) DEFAULT NULL,
  `discount` bigint(19) DEFAULT NULL,
  `shortintroduction` varchar(255) DEFAULT NULL,
  `introduce` varbinary(2000) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idproduct`, `idproducer`, `title`, `price`, `discount`, `shortintroduction`, `introduce`, `url`, `status`) VALUES
(10, 'POLO', 'POLO BASIC', 320000, 0, 'Áo thun polo cotton trơn', 0x3c703e3c7374726f6e673ec490e1bab6432054264961637574653b4e4820264161637574653b4f20504f4c4f204348e1baa454204c49e1bb8655266e6273703b434f54544f4e266e6273703b5350414e4445583a3c2f7374726f6e673e3c2f703e0d0a0d0a3c756c3e0d0a093c6c693e3c656d3e3c7374726f6e673e2671756f743b56e1baa369266e6273703b436f74746f6e266e6273703b5370616e6465782671756f743b3c2f7374726f6e673e266e6273703b3c2f656d3e76e1bb9b69207468266167726176653b6e68207068e1baa76e20633c656d3e68e1bba96120c491e1babf6e266e6273703b39352520436f74746f6e3c2f656d3e266e6273703b63266f61637574653b2074266961637574653b6e68207468e1baa56d2068267561637574653b742074e1bb91742076266167726176653b206de1bb816d206de1baa1692076c6b0e1bba374207472e1bb99692e2053e1bbb120706861207472e1bb996e2076e1bb9b69203525266e6273703b3c656d3e5370616e646578266e6273703b3c2f656d3e6d616e6720c491e1babf6e266e6273703b74266961637574653b6e68206ec4836e673c656d3e266e6273703b636f2064266174696c64653b6e203420636869e1bb81753c2f656d3e266e6273703b6e2665636972633b6e2074e1baa16f20c491c6b0e1bba3632073e1bbb12074686fe1baa369206d266161637574653b69206b6869206de1bab7632c20266f636972633b6d206ce1baa5792063c6a1207468e1bb83206e67c6b0e1bb9d69206de1bab763207468656f206e6869e1bb81752068c6b0e1bb9b6e672c206b68266f636972633b6e672074e1baa16f2072612073e1bbb12067266f67726176653b2062266f61637574653b2e266e6273703b3c2f6c693e0d0a093c6c693ec490e1bab763206269e1bb87742c2076e1bb9b69206c6fe1baa169266e6273703b3c656d3e76e1baa36920636f74746f6e203420636869e1bb81753c2f656d3e266e6273703b73e1babd2064266167726176653b792064e1bab76e2076266167726176653b20266961637574653b74206e68c4836e2068c6a16e20636f74746f6e203220636869e1bb8175207468266f636972633b6e67207468c6b0e1bb9d6e672e3c2f6c693e0d0a093c6c693e54266961637574653b6e68206368e1baa5742076e1baa3692074682661636972633b6e20746869e1bb876e2076e1bb9b69206d266f636972633b69207472c6b0e1bb9d6e672c206b68266f636972633b6e6720672661636972633b79206b266961637574653b636820e1bba96e6720646120646f2063266f61637574653b207468266167726176653b6e68207068e1baa76e2074e1bbab2073e1bba3692062266f636972633b6e672074e1bbb1206e68692665636972633b6e2e3c2f6c693e0d0a093c6c693e44e1bb852064266167726176653b6e67206769e1bab7742c2072e1bbad612076266167726176653b2076e1bb872073696e682063266161637574653b632076e1babf742062e1baa96e2062266161637574653b6d2074722665636972633b6e2076e1baa3692e3c2f6c693e0d0a3c2f756c3e, 'polo-basic', 1),
(11, 'POLO', 'POLO ASE', 350000, 0, 'Một chiếc áo basic nhưng đầy tỉ mỉ ở chi tiết phối màu nhấn ngực cùng viền bo tinh tế sẽ là lựa chọn hoàn hảo để biến tấu ngay outfits đi làm đơn điệu của bạn.', 0x3c756c3e0d0a093c6c693e3c656d3e56e1baa36920435643266e6273703b3c2f656d3e76e1bb9b69207468266167726176653b6e68207068e1baa76e206368e1bba961206e6869e1bb817520436f74746f6e266e6273703b63266f61637574653b2074266961637574653b6e68207468e1baa56d2068267561637574653b742074e1bb91742076266167726176653b206de1bb816d206de1baa1692076c6b0e1bba374207472e1bb99692e2053e1bbb120706861207472e1bb996e2076e1bb9b6920506f6c79657374657220c491266174696c64653b266e6273703b7468e1bbab61206be1babf20c6b07520c49169e1bb836d2076e1bb8120c491e1bb992062e1bb816e2063e1bba7612076e1baa3692076266167726176653b206769e1bbaf20666f726d206c2661636972633b752068c6a16e2c206769e1bbaf2064266161637574653b6e672063686f207472616e67207068e1bba5632e3c2f6c693e0d0a093c6c693e436f206769266174696c64653b6e203420636869e1bb81752c2076266f636972633b2063267567726176653b6e672074686f266161637574653b3c6272202f3e0d0a096e67206d266161637574653b74206769267561637574653b70206769e1baa36d206e6869e1bb87742063e1bbb163206e68616e682e3c2f6c693e0d0a093c6c693e3c656d3e56e1baa369204356433c2f656d3e266e6273703b74682661636972633b6e20746869e1bb876e2076e1bb9b69206d266f636972633b69207472c6b0e1bb9d6e672c206b68266f636972633b6e6720672661636972633b79206b266961637574653b636820e1bba96e6720646120646f2063266f61637574653b207468266167726176653b6e68207068e1baa76e2074e1bbab2073e1bba3692062266f636972633b6e672074e1bbb1206e68692665636972633b6e2e3c2f6c693e0d0a093c6c693e44e1bb852064266167726176653b6e67206769e1bab7742c2072e1bbad612076266167726176653b2076e1bb872073696e682063266161637574653b632076e1babf742062e1baa96e2062266161637574653b6d2074722665636972633b6e2076e1baa3692e3c2f6c693e0d0a3c2f756c3e0d0a0d0a3c703e266e6273703b3c2f703e, 'polo-ase', 1),
(12, 'TOTO', 'Áo thun tay dài', 590000, 0, 'Áo thun tay dài cotton', NULL, 'ao-thun-tay-dai', 1),
(13, 'TOTO', 'QUẦN JEAN M1QJN', 700000, 59000, 'Quần jean kaki chính hãng', NULL, 'quan-jean-m1qjn', 1),
(14, 'f48f4', 'Ao thun vang den', 199999, 150000, 'kejfkef', 0x3c703e3c696d6720616c743d2222207372633d22687474703a2f2f6c6f63616c686f73742f646f616e63687579656e67616e682f7075626c69632f2e2f696d672f625f313632313536373933322e6a706722207374796c653d226865696768743a34303870783b2077696474683a363830707822202f3e3c2f703e, 'ao-thun-vang-den', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `idrate` int(10) DEFAULT NULL,
  `useriduser` int(10) NOT NULL,
  `productidproduct` int(10) NOT NULL,
  `rate` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `idreviews` int(10) NOT NULL,
  `comment` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `useriduser` int(10) NOT NULL,
  `productidproduct` int(10) NOT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'QUANLYNOIDUNG'),
(3, 'QUANLYTINTUC'),
(4, 'QUANLYDONHANG');

-- --------------------------------------------------------

--
-- Table structure for table `sizeproduct`
--

CREATE TABLE `sizeproduct` (
  `colorproductid` int(10) NOT NULL,
  `idcolorproduct` int(10) NOT NULL,
  `title` varchar(3) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizeproduct`
--

INSERT INTO `sizeproduct` (`colorproductid`, `idcolorproduct`, `title`, `amount`, `status`) VALUES
(12, 34, 'S', 0, NULL),
(12, 35, 'M', 0, NULL),
(12, 36, 'L', 0, NULL),
(13, 37, 'S', 0, NULL),
(13, 38, 'M', 0, NULL),
(13, 39, 'L', 0, NULL),
(14, 40, 'S', 0, NULL),
(14, 41, 'M', 0, NULL),
(14, 42, 'L', 0, NULL),
(15, 43, 'S', 0, NULL),
(15, 44, 'M', 0, NULL),
(15, 45, 'L', 0, NULL),
(16, 46, 'S', 0, NULL),
(16, 47, 'M', 0, NULL),
(16, 48, 'L', 0, NULL),
(17, 49, 'S', 0, NULL),
(17, 50, 'M', 0, NULL),
(17, 51, 'L', 0, NULL),
(18, 52, 'S', 5, NULL),
(18, 53, 'M', 0, NULL),
(18, 54, 'L', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `idsupplier` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

CREATE TABLE `supplier_product` (
  `supplieridsupplier` int(5) NOT NULL,
  `productidproduct` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `email` varchar(120) NOT NULL,
  `numberphone` char(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `authorities` tinyint(3) NOT NULL DEFAULT 0,
  `address` varchar(150) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `numberphone`, `name`, `password`, `point`, `authorities`, `address`, `status`, `id_role`, `active`) VALUES
(1, 'caubediza@gmail.com', NULL, 'Ndhuy', '$2y$10$oScCdjMyR4EUKKff3J9sCeBsUJRzEDEcP6HVAZ6TGAUeIQ/uw1I86', 0, 1, NULL, NULL, 2, 0),
(2, 'namnv.nvx@gmail.com', '0395996028', 'Nguyen Nam', '$2y$10$oScCdjMyR4EUKKff3J9sCeBsUJRzEDEcP6HVAZ6TGAUeIQ/uw1I86', 0, 1, '45 duong ba trac', 1, 3, 0),
(4, 'nam@gmail.com', NULL, 'Nam', '$2y$10$gVxY2NNSeyDn84itrjxjvOJXD5e.6IIdXj3kzGC3aRbYXrchrNilC', 0, 1, NULL, NULL, 1, 0),
(5, 'huy@gmail.com', NULL, 'Nguyễn Huy', '$2y$10$/wHeLMUo8rKf5KRxJV1BF.9F58yOYuv8DINbs7t5CyPKSLeW5ZM8S', 0, 1, NULL, NULL, 4, 0),
(6, 'caubediza1@gmail.com', NULL, 'Huy', '$2y$10$qQ9c.Yf/T8HyQJulNZ0a/Ox2kTqzc9pxL5NaSKRYey9rrUr376tmm', 0, 1, NULL, NULL, 4, 0),
(7, 'caubediza@gmail.com', NULL, 'Nam Nguyen', '$2y$10$ws.4ARd2uDP82zt7PX2/N.kVx4qaRoTQ0/kkRJRc3O34g66tG/bMC', 0, 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activations`
--

CREATE TABLE `user_activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_discountcode`
--

CREATE TABLE `user_discountcode` (
  `userid` int(10) NOT NULL,
  `discountcodeid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `websiteinfo`
--

CREATE TABLE `websiteinfo` (
  `idwebsiteinfo` int(10) NOT NULL,
  `infowebsite` varbinary(2000) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcategory`),
  ADD KEY `Many Category` (`categoryid`);

--
-- Indexes for table `category_products`
--
ALTER TABLE `category_products`
  ADD PRIMARY KEY (`categoryid`,`productsid`),
  ADD KEY `FKCategory_P515525` (`productsid`);

--
-- Indexes for table `colorproduct`
--
ALTER TABLE `colorproduct`
  ADD PRIMARY KEY (`idcolorproduct`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `discountcode`
--
ALTER TABLE `discountcode`
  ADD PRIMARY KEY (`iddiscountcode`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`idimage`),
  ADD KEY `FKImage569396` (`colorproductid`),
  ADD KEY `FKImage406152` (`websiteinfoid`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`idinvoice`),
  ADD KEY `FKInvoice970570` (`discountcodeId`),
  ADD KEY `FKInvoice706918` (`userid`);

--
-- Indexes for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`idinvoicedetails`),
  ADD KEY `FKInvoiceDet255398` (`invoiceid`),
  ADD KEY `FKInvoiceDet918443` (`productIdproduct`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD KEY `FKRate816636` (`useriduser`),
  ADD KEY `FKRate191619` (`productidproduct`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`idreviews`),
  ADD KEY `FKReviews85509` (`useriduser`),
  ADD KEY `FKReviews710526` (`productidproduct`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizeproduct`
--
ALTER TABLE `sizeproduct`
  ADD PRIMARY KEY (`idcolorproduct`),
  ADD KEY `FKSizeProduc734148` (`colorproductid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`idsupplier`);

--
-- Indexes for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`supplieridsupplier`,`productidproduct`),
  ADD KEY `FKSupplier_P264042` (`productidproduct`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_activations`
--
ALTER TABLE `user_activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_discountcode`
--
ALTER TABLE `user_discountcode`
  ADD PRIMARY KEY (`userid`,`discountcodeid`),
  ADD KEY `FKUser_Disco76321` (`discountcodeid`);

--
-- Indexes for table `websiteinfo`
--
ALTER TABLE `websiteinfo`
  ADD PRIMARY KEY (`idwebsiteinfo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idcategory` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `colorproduct`
--
ALTER TABLE `colorproduct`
  MODIFY `idcolorproduct` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `discountcode`
--
ALTER TABLE `discountcode`
  MODIFY `iddiscountcode` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `idimage` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `idinvoice` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `idinvoicedetails` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `idreviews` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sizeproduct`
--
ALTER TABLE `sizeproduct`
  MODIFY `idcolorproduct` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `idsupplier` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activations`
--
ALTER TABLE `user_activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websiteinfo`
--
ALTER TABLE `websiteinfo`
  MODIFY `idwebsiteinfo` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `Many Category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`idcategory`);

--
-- Constraints for table `category_products`
--
ALTER TABLE `category_products`
  ADD CONSTRAINT `category_products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`idcategory`),
  ADD CONSTRAINT `category_products_ibfk_2` FOREIGN KEY (`productsid`) REFERENCES `product` (`idproduct`) ON DELETE CASCADE;

--
-- Constraints for table `colorproduct`
--
ALTER TABLE `colorproduct`
  ADD CONSTRAINT `colorproduct_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`idproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FKImage406152` FOREIGN KEY (`websiteinfoid`) REFERENCES `websiteinfo` (`idwebsiteinfo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`colorproductid`) REFERENCES `colorproduct` (`idcolorproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FKInvoice706918` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKInvoice970570` FOREIGN KEY (`discountcodeId`) REFERENCES `discountcode` (`iddiscountcode`);

--
-- Constraints for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `FKInvoiceDet255398` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`idinvoice`),
  ADD CONSTRAINT `FKInvoiceDet918443` FOREIGN KEY (`productIdproduct`) REFERENCES `product` (`idproduct`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `FKRate191619` FOREIGN KEY (`productidproduct`) REFERENCES `product` (`idproduct`),
  ADD CONSTRAINT `FKRate816636` FOREIGN KEY (`useriduser`) REFERENCES `user` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FKReviews710526` FOREIGN KEY (`productidproduct`) REFERENCES `product` (`idproduct`),
  ADD CONSTRAINT `FKReviews85509` FOREIGN KEY (`useriduser`) REFERENCES `user` (`id`);

--
-- Constraints for table `sizeproduct`
--
ALTER TABLE `sizeproduct`
  ADD CONSTRAINT `FKSizeProduc734148` FOREIGN KEY (`colorproductid`) REFERENCES `colorproduct` (`idcolorproduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD CONSTRAINT `FKSupplier_P264042` FOREIGN KEY (`productidproduct`) REFERENCES `product` (`idproduct`),
  ADD CONSTRAINT `FKSupplier_P525768` FOREIGN KEY (`supplieridsupplier`) REFERENCES `supplier` (`idsupplier`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_discountcode`
--
ALTER TABLE `user_discountcode`
  ADD CONSTRAINT `FKUser_Disco601168` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKUser_Disco76321` FOREIGN KEY (`discountcodeid`) REFERENCES `discountcode` (`iddiscountcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

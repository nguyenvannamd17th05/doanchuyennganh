-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 17, 2020 at 10:07 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop7760`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `categoryid` int(5) DEFAULT NULL,
  PRIMARY KEY (`idcategory`),
  KEY `Many Category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `title`, `url`, `sort`, `status`, `categoryid`) VALUES
(2, 'Áo', 'ao', 1, 0, NULL),
(4, 'Áo dài tay', 'ao-dai-tay', 1, 0, 2),
(8, 'Quần', 'quan', NULL, 0, NULL),
(9, 'Giày', 'giay', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_products`
--

DROP TABLE IF EXISTS `category_products`;
CREATE TABLE IF NOT EXISTS `category_products` (
  `categoryid` int(5) NOT NULL,
  `productsid` int(10) NOT NULL,
  PRIMARY KEY (`categoryid`,`productsid`),
  KEY `FKCategory_P515525` (`productsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_products`
--

INSERT INTO `category_products` (`categoryid`, `productsid`) VALUES
(4, 1),
(2, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `colorproduct`
--

DROP TABLE IF EXISTS `colorproduct`;
CREATE TABLE IF NOT EXISTS `colorproduct` (
  `idcolorproduct` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productid` int(10) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idcolorproduct`),
  KEY `productid` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colorproduct`
--

INSERT INTO `colorproduct` (`idcolorproduct`, `title`, `color`, `productid`, `status`) VALUES
(1, 'Trắng Kem', NULL, 1, NULL),
(2, 'Màu đỏ hồng', NULL, 1, NULL),
(9, 'Đen', NULL, 7, NULL),
(10, 'trắng', NULL, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discountcode`
--

DROP TABLE IF EXISTS `discountcode`;
CREATE TABLE IF NOT EXISTS `discountcode` (
  `iddiscountcode` int(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` date NOT NULL,
  `condition` float NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '0',
  `amount` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`iddiscountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `idimage` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `websiteinfoid` int(10) DEFAULT NULL,
  `colorproductid` int(10) DEFAULT NULL,
  PRIMARY KEY (`idimage`),
  KEY `FKImage569396` (`colorproductid`),
  KEY `FKImage406152` (`websiteinfoid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`idimage`, `title`, `url`, `websiteinfoid`, `colorproductid`) VALUES
(1, 'product', '5gsqC86lMf_1606670276.webp', NULL, 1),
(2, 'product', '5PhYADxl6v_1606670276.webp', NULL, 1),
(3, 'product', 'pykqJ00yK5_1606670276.webp', NULL, 1),
(4, 'product', '84zleqGDFr_1606670276.webp', NULL, 1),
(16, 'product', '5T6y2xq2SP_1607925473.jpg', NULL, 2),
(17, 'product', 'TMJR6gwvAa_1607925473.jpg', NULL, 2),
(18, 'product', 'WfQSjksztl_1607925473.jpg', NULL, 2),
(19, 'product', 'YGDbNmQds9_1607925473.jpg', NULL, 2),
(20, 'product', 'YyrdnEFFud_1608198820.webp', NULL, 9),
(21, 'product', 'eAGYit9z2R_1608198820.webp', NULL, 9),
(22, 'product', 'f1aAu2f4jF_1608198820.webp', NULL, 9),
(23, 'product', 'K3AtBql2Vb_1608198820.webp', NULL, 9),
(24, 'product', 'GDtcnWzy7J_1608198899.jpg', NULL, 10),
(25, 'product', 'qVBupgO9WP_1608198899.webp', NULL, 10),
(26, 'product', 'zYxjQLtTOj_1608198899.jpg', NULL, 10),
(27, 'product', 'A5vkccmJy0_1608198899.jpg', NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `idinvoice` int(10) NOT NULL AUTO_INCREMENT,
  `totalmoney` bigint(19) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discountcodeId` int(5) DEFAULT NULL,
  `userid` int(10) NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phonenumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`idinvoice`),
  KEY `FKInvoice970570` (`discountcodeId`),
  KEY `FKInvoice706918` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`idinvoice`, `totalmoney`, `date`, `discountcodeId`, `userid`, `address`, `phonenumber`, `status`) VALUES
(2, 280000, '2020-12-01 22:39:51', NULL, 1, 'Đường số 9', '0334888408', 4),
(3, 280000, '2020-12-01 23:21:23', NULL, 1, 'Số 9 Đường Số 9 Phường 4 Quận 8 Thành Phố Hồ Chí Minh', '0334888408', 4),
(4, 280000, '2020-12-04 11:22:14', NULL, 1, 'DDaij cong ejt', '062265959', 1),
(5, 280000, '2020-12-15 14:14:28', NULL, 1, 'Số 9 Đường Số 9 Phường 4 Quận 8 Thành Phố Hồ Chí Minh', '0334888408', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
CREATE TABLE IF NOT EXISTS `invoicedetails` (
  `idinvoicedetails` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL DEFAULT '0',
  `invoiceid` int(10) NOT NULL,
  `productinfoId` varchar(255) DEFAULT NULL,
  `productIdproduct` int(10) NOT NULL,
  PRIMARY KEY (`idinvoicedetails`),
  KEY `FKInvoiceDet255398` (`invoiceid`),
  KEY `FKInvoiceDet918443` (`productIdproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedetails`
--

INSERT INTO `invoicedetails` (`idinvoicedetails`, `amount`, `invoiceid`, `productinfoId`, `productIdproduct`) VALUES
(1, 1, 2, 'Áo sơmi tay ngắn BSK printed / Màu đỏ hồng / M', 1),
(2, 6, 2, 'Áo sơmi tay ngắn BSK printed / Trắng Kem / M', 1),
(3, 1, 3, 'Áo sơmi tay ngắn BSK printed / Màu đỏ hồng / L', 1),
(4, 1, 3, 'Áo sơmi tay ngắn BSK printed / Trắng Kem / M', 1),
(5, 1, 3, 'Áo sơmi tay ngắn BSK printed / Màu đỏ hồng / S', 1),
(6, 10, 4, 'Áo sơmi tay ngắn BSK printed / Trắng Kem / M', 1),
(7, 10, 4, 'Áo sơmi tay ngắn BSK printed / Màu đỏ hồng / L', 1),
(8, 2, 5, 'Áo sơmi tay ngắn BSK printed / Màu đỏ hồng / M', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `idproduct` int(10) NOT NULL AUTO_INCREMENT,
  `idproducer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` bigint(19) DEFAULT NULL,
  `discount` bigint(19) DEFAULT NULL,
  `shortintroduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `introduce` varbinary(2000) DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idproduct`, `idproducer`, `title`, `price`, `discount`, `shortintroduction`, `introduce`, `url`, `status`) VALUES
(1, 'SMBK0002-03', 'Áo sơmi tay ngắn BSK printed', 280000, 0, 'Dòng printed shirts BSK 2020 vừa được lên kệ phục vụ ae ?? Thiết kế trẻ trung với chất vải nhẹ & mát.', 0x3c703e44266f67726176653b6e67207072696e746564207368697274732042534b20323032302076e1bbab6120c491c6b0e1bba363206c2665636972633b6e206be1bb87207068e1bba5632076e1bba5206165266e6273703b3c696d6720616c743d22f09f918cf09f8fbb22207372633d2268747470733a2f2f7374617469632e78782e666263646e2e6e65742f696d616765732f656d6f6a692e7068702f76392f7462362f312f31362f31663434635f31663366622e706e6722207374796c653d226865696768743a313670783b2077696474683a3136707822202f3e266e6273703b546869e1babf74206be1babf207472e1babb207472756e672076e1bb9b69206368e1baa5742076e1baa369206e68e1bab92026616d703b206d266161637574653b742e3c2f703e, 'ao-somi-tay-ngan-bsk-printed', 2),
(7, 'PLNO0011-01', 'Áo Polo NOMOUS ESSENTIALS Printed', 350000, 0, 'Lên kệ dòng polo cực chất của NOMOUS ESSENTIALS phục vụ ae nha ??\r\nThiết kế quá ưng ý của dòng polo trong mùa thu đông năm nay.\r\nChất vải cotton gai 100%, cực bền & mịn mát. Hàng full tem, tag, date 2020 ??', NULL, 'ao-polo-nomous-essentials-printed', 1),
(8, 'QJPB0015-01', 'Quần jeans P.B Skinny ripped', 500000, 0, 'Ripped skinny jeans P.B // dòng jeans màu sáng cực đẹp dành cho ae diện mùa cuối năm ??\r\n\r\nChất vải mềm mịn, 5% spandex siêu co giãn luôn ae mặc cực kì thoải mái.\r\n\r\nForm skinny.', NULL, 'quan-jeans-pb-skinny-ripped', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `idrate` int(10) DEFAULT NULL,
  `useriduser` int(10) NOT NULL,
  `productidproduct` int(10) NOT NULL,
  `rate` int(1) DEFAULT NULL,
  KEY `FKRate816636` (`useriduser`),
  KEY `FKRate191619` (`productidproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `idreviews` int(10) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date` datetime DEFAULT NULL,
  `useriduser` int(10) NOT NULL,
  `productidproduct` int(10) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idreviews`),
  KEY `FKReviews85509` (`useriduser`),
  KEY `FKReviews710526` (`productidproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sizeproduct`
--

DROP TABLE IF EXISTS `sizeproduct`;
CREATE TABLE IF NOT EXISTS `sizeproduct` (
  `colorproductid` int(10) NOT NULL,
  `idcolorproduct` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idcolorproduct`),
  KEY `FKSizeProduc734148` (`colorproductid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizeproduct`
--

INSERT INTO `sizeproduct` (`colorproductid`, `idcolorproduct`, `title`, `amount`, `status`) VALUES
(1, 1, 'S', 0, NULL),
(1, 2, 'M', 5, NULL),
(1, 3, 'L', 6, NULL),
(2, 4, 'S', 10, NULL),
(2, 5, 'M', 10, NULL),
(2, 6, 'L', 10, NULL),
(9, 25, 'S', 1, NULL),
(9, 26, 'M', 0, NULL),
(9, 27, 'L', 5, NULL),
(10, 28, 'S', 5, NULL),
(10, 29, 'M', 1, NULL),
(10, 30, 'L', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `idsupplier` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idsupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
CREATE TABLE IF NOT EXISTS `supplier_product` (
  `supplieridsupplier` int(5) NOT NULL,
  `productidproduct` int(10) NOT NULL,
  PRIMARY KEY (`supplieridsupplier`,`productidproduct`),
  KEY `FKSupplier_P264042` (`productidproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numberphone` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `authorities` tinyint(3) NOT NULL DEFAULT '0',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `numberphone`, `name`, `password`, `point`, `authorities`, `address`, `status`) VALUES
(1, 'caubediza@gmail.com', NULL, 'Ndhuy', '$2y$10$oScCdjMyR4EUKKff3J9sCeBsUJRzEDEcP6HVAZ6TGAUeIQ/uw1I86', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_discountcode`
--

DROP TABLE IF EXISTS `user_discountcode`;
CREATE TABLE IF NOT EXISTS `user_discountcode` (
  `userid` int(10) NOT NULL,
  `discountcodeid` int(5) NOT NULL,
  PRIMARY KEY (`userid`,`discountcodeid`),
  KEY `FKUser_Disco76321` (`discountcodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `websiteinfo`
--

DROP TABLE IF EXISTS `websiteinfo`;
CREATE TABLE IF NOT EXISTS `websiteinfo` (
  `idwebsiteinfo` int(10) NOT NULL AUTO_INCREMENT,
  `infowebsite` varbinary(2000) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idwebsiteinfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `category_products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`idcategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `category_products_ibfk_2` FOREIGN KEY (`productsid`) REFERENCES `product` (`idproduct`) ON DELETE CASCADE ON UPDATE RESTRICT;

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
-- Constraints for table `user_discountcode`
--
ALTER TABLE `user_discountcode`
  ADD CONSTRAINT `FKUser_Disco601168` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKUser_Disco76321` FOREIGN KEY (`discountcodeid`) REFERENCES `discountcode` (`iddiscountcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

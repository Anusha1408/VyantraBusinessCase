-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2020 at 05:49 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloth_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartinfo`
--

CREATE TABLE `cartinfo` (
  `cartId` int(11) NOT NULL,
  `cartDate` datetime DEFAULT NULL,
  `isOrder` int(11) NOT NULL,
  `userName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartinfo`
--

INSERT INTO `cartinfo` (`cartId`, `cartDate`, `isOrder`, `userName`) VALUES
(1, '2020-06-06 09:39:29', 1, 'amit'),
(2, '2020-07-06 20:45:53', 0, 'amit');

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `itemId` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`itemId`, `price`, `quantity`, `cartId`, `productId`) VALUES
(1, 2000, 1, 1, 29),
(2, 600, 1, 2, 24);

-- --------------------------------------------------------

--
-- Table structure for table `companyinfo`
--

CREATE TABLE `companyinfo` (
  `companyId` varchar(20) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyinfo`
--

INSERT INTO `companyinfo` (`companyId`, `companyName`, `description`) VALUES
('HM', 'H & M', 'H & M'),
('LB', 'Libaas', 'Libaas'),
('LF', 'Roadster', 'Roadster'),
('LS', 'Lifestyle', 'Lifestyle'),
('LV', 'Levis', 'Levis'),
('LZ', 'La Senza', 'La Senza'),
('MG', 'Mango', 'Mango'),
('MH', 'Mast & Harbour', 'Mast & Harbour'),
('MM', 'Madame', 'Madame'),
('PT', 'Pantaloons', 'Pantaloons'),
('S1', 'Shein', 'Shein'),
('TT', 'Tokyo Talkies', 'Tokyo Talkies'),
('VM', 'Vero Moda', 'Vero Moda'),
('WS', 'Westside', 'Westside'),
('ZV', 'Zivame', 'Zivame');

-- --------------------------------------------------------

--
-- Table structure for table `logininfo`
--

CREATE TABLE `logininfo` (
  `userName` varchar(100) NOT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `roleName` varchar(100) DEFAULT NULL,
  `securityAnswer` varchar(100) DEFAULT NULL,
  `securityQuestion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logininfo`
--

INSERT INTO `logininfo` (`userName`, `emailId`, `lastLogin`, `password`, `roleName`, `securityAnswer`, `securityQuestion`) VALUES
('admin', 'admin@clothstore.com', NULL, 'admin', 'admin', 'What is Your Last Name?', 'admin'),
('amit', 'amit@gmail.com', '2020-07-06 20:45:35', 'amit', 'user', 'amit', 'What is Your Middle Name?'),
('Anusha', 'anushakhurana1926@gmail.com', '2020-07-06 21:18:26', 'anusha', 'user', 'Khurana', 'What is Your Last Name?');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `detailId` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`detailId`, `price`, `quantity`, `orderId`, `productId`) VALUES
(1, 2000, 1, 1591461649321, 29);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

CREATE TABLE `orderinfo` (
  `orderId` bigint(20) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `orderStatus` varchar(100) DEFAULT NULL,
  `payment` longtext DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingDate` datetime DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`orderId`, `orderDate`, `orderStatus`, `payment`, `shippingAddress`, `shippingDate`, `cartId`, `userName`) VALUES
(1591461649321, '2020-06-06 09:40:49', NULL, NULL, 'Godown Yamuna Nagar', NULL, 1, 'amit');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `categoryId` varchar(20) NOT NULL,
  `categoryName` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`categoryId`, `categoryName`, `description`) VALUES
('DR', 'Dress', 'Dress'),
('ST', 'Suits', 'Suits'),
('WT', 'Western', 'Western');

-- --------------------------------------------------------

--
-- Table structure for table `productinfo`
--

CREATE TABLE `productinfo` (
  `productId` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` float NOT NULL,
  `productName` varchar(200) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `companyId` varchar(20) DEFAULT NULL,
  `subCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productinfo`
--

INSERT INTO `productinfo` (`productId`, `description`, `price`, `productName`, `quantity`, `companyId`, `subCategoryId`) VALUES
(1, 'Flaired striped dress', 1000, 'Flaired striped dress', 10, 'S1', 3),
(2, 'Women striped A-line dress', 700, 'Women striped A-line dress', 10, 'TT', 3),
(3, 'Women striped dress', 900, 'Women striped dress', 10, 'MH', 3),
(4, 'Women mustard V-neck top', 900, 'Women mustard V-neck top', 10, 'S1', 8),
(5, 'Stylish women top with frilled arms', 700, 'Stylish women top with frilled arms', 10, 'LF', 8),
(6, 'Printed top', 900, 'Printed top', 10, 'LS', 8),
(7, 'Printed top having cut sleeves', 600, 'Printed top having cut sleeves', 10, 'HM', 8),
(8, 'Women solid cropped trousers', 1800, 'Women solid cropped trousers', 10, 'WS', 10),
(9, 'Women tappered fit trousers', 1500, 'Women tappered fit trousers', 10, 'WS', 10),
(10, 'Women regular fit trousers', 1500, 'Women regular fit trousers', 10, 'MG', 10),
(11, 'Women Glittery Dress', 2999, 'Women Glittery Dress', 10, 'HM', 1),
(12, 'Glittery Sequined Dress', 3999, 'Glittery Sequined Dress', 10, 'HM', 1),
(13, 'Women Glittery Dress Design 1', 1999, 'Women Glittery Dress Design 1', 10, 'HM', 1),
(14, 'Super Skinny Jeans 1', 1200, 'Super Skinny Jeans 1', 10, 'LV', 6),
(16, 'Super Skinny Jeans 3', 1500, 'Super Skinny Jeans 3', 10, 'HM', 6),
(17, 'Super Skinny Jeans 2', 1500, 'Super Skinny Jeans 2', 10, 'MG', 6),
(18, 'Women Skinny Fit Jeans 1', 1000, 'Women Skinny Fit Jeans 1', 10, 'LF', 6),
(19, 'Women Skinny Fit Jeans 2', 800, 'Women Skinny Fit Jeans 2', 10, 'LF', 6),
(20, 'Women Slim Jeans', 1800, 'Women Slim Jeans', 10, 'VM', 6),
(21, 'Solid Basic Jumpsuit 1', 700, 'Solid Basic Jumpsuit 1', 10, 'S1', 5),
(22, 'Solid Basic Jumpsuit 2', 1400, 'Solid Basic Jumpsuit 2', 10, 'HM', 5),
(23, 'Solid Basic Jumpsuit 3', 1200, 'Solid Basic Jumpsuit 3', 10, 'LS', 5),
(24, 'Modern printed kurti 1', 600, 'Modern printed kurti 1', 10, 'LS', 7),
(25, 'Modern printed kurti 2', 1500, 'Modern printed kurti 2', 10, 'MG', 7),
(26, 'Modern printed kurti 3', 1500, 'Modern printed kurti 3', 10, 'LB', 7),
(27, 'Striped Night suit', 1200, 'Striped Night suit', 10, 'ZV', 4),
(28, 'Printed Night Suit 1', 1200, 'Printed Night Suit 1', 10, 'WS', 4),
(29, 'Printed Night Suit 2', 2000, 'Printed Night Suit 2', 10, 'LZ', 4),
(30, 'Women off-shoulder top', 600, 'Women off-shoulder top 1', 5, 'WS', 9),
(31, 'Women off-shoulder top 2', 1200, 'Women off-shoulder top 2', 10, 'LS', 9),
(32, 'Women off-shoulder top 3', 1500, 'Women off-shoulder top 3', 10, 'MM', 9),
(33, 'Polka Dot Dress', 999, 'Polka Dot Dress', 11, 'S1', 2),
(34, 'V-neck Polka Dot Dress', 1200, 'V-neck Polka Dot Dress', 11, 'PT', 2),
(35, 'Polka Dot Print Sheath Dress', 1199, 'Polka Dot Print Sheath Dress', 11, 'MH', 2);

-- --------------------------------------------------------

--
-- Table structure for table `productphoto`
--

CREATE TABLE `productphoto` (
  `photoId` int(11) NOT NULL,
  `extNam` varchar(50) DEFAULT NULL,
  `photoName` varchar(200) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productphoto`
--

INSERT INTO `productphoto` (`photoId`, `extNam`, `photoName`, `productId`) VALUES
(1, 'png', 'stripeddress1.png', 1),
(2, 'png', 'stripeddress2.png', 2),
(3, 'png', 'stripeddress3.png', 3),
(4, 'jpg', 'top2.jpg', 4),
(5, 'jpg', 'top3.jpg', 5),
(6, 'jpg', 'top4.jpg', 6),
(7, 'jpg', 'top5.jpg', 7),
(8, 'png', 'trouser1.png', 8),
(9, 'png', 'trouser2.png', 9),
(10, 'png', 'trouser3.png', 10),
(11, 'png', 'glitterydress.png', 11),
(12, 'png', 'glitterydress2.png', 12),
(13, 'png', 'glitterydress3.png', 13),
(14, 'jpg', 'jeans1.jpg', 14),
(15, 'jpeg', 'jeans2jpeg.jpeg', 17),
(16, 'jpg', 'jeans3.jpg', 16),
(17, 'png', 'jeans4.png', 18),
(18, 'png', 'jeans5.png', 19),
(19, 'png', 'jeans6.png', 20),
(20, 'png', 'jumpsuit1.png', 21),
(21, 'png', 'jumpsuit2.png', 22),
(22, 'png', 'jumpsuit3.png', 23),
(23, 'png', 'kurti1.png', 24),
(24, 'png', 'kurti2.png', 25),
(25, 'png', 'kurti3.png', 26),
(26, 'png', 'nightsuit.png', 27),
(27, 'png', 'nightsuit2.png', 28),
(28, 'png', 'nightsuit3.png', 29),
(29, 'png', 'offshouldertop.png', 30),
(30, 'png', 'offshouldertop1.png', 31),
(31, 'png', 'offshouldertop2.png', 32),
(32, 'png', 'polkadot1.png', 33),
(33, 'png', 'polkadot2.png', 34),
(34, 'png', 'polkadot3.png', 35);

-- --------------------------------------------------------

--
-- Table structure for table `productstock`
--

CREATE TABLE `productstock` (
  `stockId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stockDate` datetime DEFAULT NULL,
  `stockType` varchar(20) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productsubcategory`
--

CREATE TABLE `productsubcategory` (
  `subCategoryId` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `subCategoryName` varchar(100) DEFAULT NULL,
  `categoryId` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productsubcategory`
--

INSERT INTO `productsubcategory` (`subCategoryId`, `description`, `subCategoryName`, `categoryId`) VALUES
(1, 'Glittery Dress', 'Glittery Dress', 'DR'),
(2, 'Polkadot Dress', 'Polkadot Dress', 'DR'),
(3, 'Striped Dress', 'Striped Dress', 'DR'),
(4, 'Night Suits', 'Night Suits', 'ST'),
(5, 'Jump Suits', 'Jump Suits', 'ST'),
(6, 'Jeans', 'Jeans', 'WT'),
(7, 'Kurti', 'Kurti', 'ST'),
(8, 'Tops', 'Tops', 'WT'),
(9, 'Off Shoulder', 'Off Shoulder', 'WT'),
(10, 'Trousers', 'Trousers', 'WT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartinfo`
--
ALTER TABLE `cartinfo`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `FK4393E73A8C5C2D9` (`productId`),
  ADD KEY `FK4393E731875A317` (`cartId`);

--
-- Indexes for table `companyinfo`
--
ALTER TABLE `companyinfo`
  ADD PRIMARY KEY (`companyId`),
  ADD UNIQUE KEY `companyName` (`companyName`);

--
-- Indexes for table `logininfo`
--
ALTER TABLE `logininfo`
  ADD PRIMARY KEY (`userName`),
  ADD UNIQUE KEY `emailId` (`emailId`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`detailId`),
  ADD KEY `FK9BB12334A8C5C2D9` (`productId`),
  ADD KEY `FK9BB123346A6A40D7` (`orderId`);

--
-- Indexes for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `FK601628FC1875A317` (`cartId`),
  ADD KEY `FK601628FC5363B35F` (`userName`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `productinfo`
--
ALTER TABLE `productinfo`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `FKA7C3E1DCDDC7F75` (`companyId`),
  ADD KEY `FKA7C3E1DB5A61D36` (`subCategoryId`);

--
-- Indexes for table `productphoto`
--
ALTER TABLE `productphoto`
  ADD PRIMARY KEY (`photoId`),
  ADD KEY `FK456B92A3A8C5C2D9` (`productId`);

--
-- Indexes for table `productstock`
--
ALTER TABLE `productstock`
  ADD PRIMARY KEY (`stockId`),
  ADD KEY `FK459B4B87A8C5C2D9` (`productId`);

--
-- Indexes for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  ADD PRIMARY KEY (`subCategoryId`),
  ADD KEY `FKE97E1B0F5B396AF8` (`categoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartinfo`
--
ALTER TABLE `cartinfo`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `detailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productinfo`
--
ALTER TABLE `productinfo`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `productphoto`
--
ALTER TABLE `productphoto`
  MODIFY `photoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `productstock`
--
ALTER TABLE `productstock`
  MODIFY `stockId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  MODIFY `subCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FK4393E731875A317` FOREIGN KEY (`cartId`) REFERENCES `cartinfo` (`cartId`),
  ADD CONSTRAINT `FK4393E73A8C5C2D9` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`productId`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK9BB123346A6A40D7` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`orderId`),
  ADD CONSTRAINT `FK9BB12334A8C5C2D9` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`productId`);

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `FK601628FC1875A317` FOREIGN KEY (`cartId`) REFERENCES `cartinfo` (`cartId`),
  ADD CONSTRAINT `FK601628FC5363B35F` FOREIGN KEY (`userName`) REFERENCES `logininfo` (`userName`);

--
-- Constraints for table `productinfo`
--
ALTER TABLE `productinfo`
  ADD CONSTRAINT `FKA7C3E1DB5A61D36` FOREIGN KEY (`subCategoryId`) REFERENCES `productsubcategory` (`subCategoryId`),
  ADD CONSTRAINT `FKA7C3E1DCDDC7F75` FOREIGN KEY (`companyId`) REFERENCES `companyinfo` (`companyId`);

--
-- Constraints for table `productphoto`
--
ALTER TABLE `productphoto`
  ADD CONSTRAINT `FK456B92A3A8C5C2D9` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`productId`);

--
-- Constraints for table `productstock`
--
ALTER TABLE `productstock`
  ADD CONSTRAINT `FK459B4B87A8C5C2D9` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`productId`);

--
-- Constraints for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  ADD CONSTRAINT `FKE97E1B0F5B396AF8` FOREIGN KEY (`categoryId`) REFERENCES `productcategory` (`categoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

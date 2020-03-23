-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2020 at 03:36 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `json_feed_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feed_sample`
--

CREATE TABLE `tbl_feed_sample` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `webformatURL` varchar(400) NOT NULL,
  `likes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_feed_sample`
--

INSERT INTO `tbl_feed_sample` (`id`, `user`, `webformatURL`, `likes`) VALUES
(13, 'PRODUCTS # 1', 'https://www.carrotwatch.com/demo/wp-content/uploads/2017/02/Watch_01.jpg', '999'),
(14, 'PRODUCTS # 2', 'https://cf.shopee.co.th/file/7d8341b0c276541ea6217f4b954da26e', '999'),
(15, 'PRODUCTS # 3', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Swatch_Irony_Charcoal_Suit.jpg/1200px-Swatch_Irony_Charcoal_Suit.jpg', '999'),
(16, 'PRODUCTS # 4', 'https://i.pinimg.com/originals/0f/fe/b0/0ffeb09591540ad0fb82cde0b12299a2.jpg', '999'),
(17, 'PRODUCTS # 5', 'https://www.prodirectsoccer.com/ProductImages/Gallery_5/182119.jpg?impolicy=thumb&imwidth=512', '999'),
(18, 'PRODUCTS # 6', 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto/gueo3qthwrv8y5laemzs/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87%E0%B8%9C%E0%B8%B9%E0%B9%89-joyride-run-flyknit-sqfqGQ.jpg', '999'),
(19, 'PRODUCTS # 7', 'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/ktdfbujfbnpkdcfzubd4/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87%E0%B8%9C%E0%B8%B9%E0%B9%89-air-zoom-pegasus-35-DXK1Zj.jpg', '999'),
(20, 'PRODUCTS # 8', 'https://www.lepape.com/media/catalog/product/cache/1/image/1024x/9df78eab33525d08d6e5fb8d27136e95/9/4/942855-800_4.jpg', '999');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(400) CHARACTER SET utf8 NOT NULL,
  `password` text CHARACTER SET utf8 NOT NULL,
  `email` varchar(400) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `email`) VALUES
(4, 'we', '827ccb0eea8a706c4c34a16891f84e7b', '55555'),
(5, 'we1', '96e79218965eb72c92a549dd5a330112', '2222222');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(400) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `name`, `password`, `address`, `email`, `phone`) VALUES
(97, 'taweesaks', '1234', 'Bangpakong', 'tawee@gmail.com', '0873695050');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_query1`
-- (See below for the actual view)
--
CREATE TABLE `view_query1` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_query2`
-- (See below for the actual view)
--
CREATE TABLE `view_query2` (
);

-- --------------------------------------------------------

--
-- Structure for view `view_query1`
--
DROP TABLE IF EXISTS `view_query1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_query1`  AS  select `tbl_product`.`pid` AS `pid`,`tbl_product`.`product_name` AS `product_name`,`tbl_product`.`product_image` AS `product_image`,`tbl_order`.`token` AS `token`,`tbl_order`.`lat` AS `lat`,`tbl_order`.`lon` AS `lon`,`tbl_order`.`address_track` AS `address_track`,`tbl_order`.`uid` AS `uid` from (`tbl_product` join `tbl_order` on((`tbl_order`.`pid` = `tbl_product`.`pid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_query2`
--
DROP TABLE IF EXISTS `view_query2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_query2`  AS  select `tbl_product`.`pid` AS `pid`,`tbl_product`.`product_name` AS `product_name`,`tbl_order`.`token` AS `token` from (`tbl_product` join `tbl_order` on((`tbl_order`.`pid` = `tbl_product`.`pid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_feed_sample`
--
ALTER TABLE `tbl_feed_sample`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_feed_sample`
--
ALTER TABLE `tbl_feed_sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

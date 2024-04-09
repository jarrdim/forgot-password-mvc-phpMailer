-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2023 at 06:49 PM
-- Server version: 10.5.12-MariaDB-1
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AgriTech`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `active`, `date`, `slug`) VALUES
(1, 'crops', 1, '2023-03-13 10:55:44', 'crops'),
(4, 'livestock', 0, '2023-03-16 22:54:32', 'livestock'),
(5, 'aquaculture', 1, '2023-03-14 21:22:26', 'aquaculture'),
(6, 'Horticulture', 1, '2023-03-12 00:00:33', 'horticulture'),
(23, 'Farm Tools', 1, '2023-03-14 22:15:16', 'farm-tools'),
(24, 'Irrigation Equipments', 1, '2023-03-14 22:15:23', 'irrigation-equipments'),
(25, 'Livestock Equipments', 1, '2023-03-12 23:49:49', 'livestock-equipments'),
(26, 'Fertilizers', 1, '2023-03-12 23:49:30', 'fertilizers'),
(27, 'Agro-chemicals', 1, '2023-03-14 21:22:33', 'agro-chemicals'),
(28, 'Insecticides', 0, '2023-03-18 20:27:28', 'insecticides'),
(29, 'Seeds', 1, '2023-03-14 22:15:50', 'seeds'),
(30, 'Farming methods', 0, '2023-03-16 22:55:00', 'farming-methods'),
(31, 'Finame', 0, '2023-03-14 22:15:39', 'finame');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `disabled`) VALUES
(1, 'Kenya', 0);

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `regNo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `phone`, `email`, `address`, `regNo`) VALUES
(1, '0712345678', 'jackmutiso37@gmail.com', 'jj', 'inte'),
(23, '0745378674', 'muasamusa123@gmail.com', 'Ngong 111', 'inte');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `session_id` varchar(30) NOT NULL,
  `delivery_address` varchar(2024) NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `country` varchar(20) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `tax` double DEFAULT 0,
  `shipping` double NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_id`, `session_id`, `delivery_address`, `total`, `country`, `username`, `email`, `phone`, `state`, `tax`, `shipping`, `date`) VALUES
(1, '1', 54844229, 'fat1spfg2gio5kfjs66uvjpphe', 'kabarak rafiki', 3200, 'Kenya', 'Glady', 'jackmutiso37@gmail.com', '254745378674', 'Nakuru', 0, 0, '2023-03-21 00:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `description` varchar(700) NOT NULL,
  `amount` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `description`, `amount`, `total`) VALUES
(1, 54844229, 1, 1, 'new                    ', 200, 200),
(2, 54844229, 2, 1, 'yes ths is new product\r\n                    ', 3000, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `TransactionDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PhoneNumber` varchar(15) NOT NULL,
  `MpesaReceiptNumber` varchar(30) NOT NULL,
  `Amount` double(10,2) NOT NULL,
  `MerchantRequestID` varchar(50) NOT NULL,
  `CheckoutRequestID` varchar(50) NOT NULL,
  `ResultDesc` varchar(50) NOT NULL,
  `ResultCode` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `TransactionDate`, `PhoneNumber`, `MpesaReceiptNumber`, `Amount`, `MerchantRequestID`, `CheckoutRequestID`, `ResultDesc`, `ResultCode`, `order_id`) VALUES
(1, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(2, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(3, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(4, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(5, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(6, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(7, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(8, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(9, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(10, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(11, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '78624574'),
(12, '2023-03-19 07:33:52', '254745378674', 'RCJ46VH9K6', 1.00, '25719-103546334-1', 'ws_CO_19032023193331820745378674', 'The service request is processed successfully.', 0, '54844229');

-- --------------------------------------------------------

--
-- Table structure for table `permission_table`
--

CREATE TABLE `permission_table` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `disabled` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_table`
--

INSERT INTO `permission_table` (`id`, `role_id`, `permission`, `disabled`) VALUES
(1, 1, 'view_category', 1),
(2, 1, 'add_category', 1),
(3, 1, 'edit_category', 1),
(4, 1, 'delete_category', 1),
(5, 2, 'view_category', 1),
(6, 2, 'add_category', 1),
(7, 2, 'edit_category', 1),
(8, 2, 'delete_category', 1),
(9, 2, 'view_products', 1),
(10, 2, 'add_product', 1),
(11, 1, 'add_product', 1),
(12, 1, 'edit_product', 1),
(13, 1, 'delete_product', 1),
(14, 1, 'view_products', 1),
(15, 1, 'view_product', 1),
(16, 1, 'view_user', 1),
(17, 1, 'edit_role', 1),
(18, 1, 'view_role', 1),
(19, 1, 'add_role', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quality` varchar(255) NOT NULL,
  `description` varchar(700) NOT NULL,
  `features` varchar(700) NOT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `approved` int(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `product_name`, `price`, `quality`, `description`, `features`, `image`, `approved`, `date`) VALUES
(1, 1, '24', 'new', '200', '77', 'new                    ', 'new\r\n                    ', 'uploads/1679399016tutorial1.jpg', 0, '2023-03-21 00:43:36'),
(2, 1, '5', 'another', '3000', '2', 'yes ths is new product\r\n                    ', '\r\n         yes ths is new product           ', 'uploads/1679399060agritech-js.png', 0, '2023-03-21 00:44:20'),
(3, 4, '26', 'kkk', '9', '77', 'hssaaaaaaaaaaaaa\r\n                    ', 'saaaaaaaaaaaaaaaa\r\n                    ', 'uploads/1679539584tutorial2.jpg', 0, '2023-03-22 15:46:24'),
(4, 1, '29', 'Iphone 13', '1234', '200', 'hhhhhhh\r\n                    ', 'bbbbb\r\n                    ', 'uploads/1679539612tutorial1.jpg', 0, '2023-03-22 15:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `reset`
--

CREATE TABLE `reset` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `expire` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reset`
--

INSERT INTO `reset` (`id`, `email`, `code`, `expire`) VALUES
(1, 'jackmutiso37@gmail.com', '84579', 1678403027),
(2, 'jackmutiso37@gmail.com', '19418', 1678483175),
(3, 'jackmutiso37@gmail.com', '87108', 1678483216),
(4, 'cesur@gmail.com', '64024', 1678724109),
(5, 'jackmutiso37@gmail.com', '58088', 1679170138),
(6, 'jackmutiso37@gmail.com', '57989', 1679170172),
(7, 'jackmutiso37@gmail.com', '30138', 1679171358),
(8, 'jackmutiso37@gmail.com', '64844', 1679171382),
(9, 'jackmutiso37@gmail.com', '86088', 1679314758),
(10, 'jackmutiso37@gmail.com', '32391', 1679314764),
(11, 'jackmutiso37@gmail.com', '20324', 1679314771),
(12, 'jackmutiso37@gmail.com', '74231', 1679314804);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(40) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `disabled`) VALUES
(1, 'User', 1),
(2, 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `state`, `disabled`) VALUES
(1, 'Nakuru', 0),
(2, 'Nairobi', 0),
(3, 'Machakos', 0),
(4, 'Mombasa', 0),
(5, 'Meru', 0),
(6, 'Eldoret', 0),
(7, 'Thika', 0),
(8, 'Kitale', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(1) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `role`, `password`, `date`) VALUES
(1, 'Jack', 'jackmutiso37@gmail.com', 2, 'jack123', '2023-03-18 20:08:51'),
(3, 'Cesur', 'cesurelvis@gmail.com', 2, 'elvis123', '2023-03-23 11:16:45'),
(4, 'Stacy', 'stacia@gmail.com', 1, '12345', '2023-03-13 05:16:55'),
(6, 'Glady', 'kamaugladys@gmail.com', 1, '12345', '2023-03-18 09:10:50'),
(8, 'newone', 'new@gmail.com', 1, '12345', '2023-03-19 06:19:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_table`
--
ALTER TABLE `permission_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset`
--
ALTER TABLE `reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permission_table`
--
ALTER TABLE `permission_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reset`
--
ALTER TABLE `reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

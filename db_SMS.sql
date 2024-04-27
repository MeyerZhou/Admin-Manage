-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2024 at 07:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_thesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Manager_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_items`
--

CREATE TABLE `customer_order_items` (
  `Order_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Qty` int(11) NOT NULL,
  `Selling_Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Saler_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Total_Amount` float NOT NULL,
  `Deposit` float NOT NULL,
  `Order_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Order_Type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Order_Status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Order_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Amount` float NOT NULL,
  `Payment_Method` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `User_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SKU` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Primary_Category` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Secondary_Category` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Selling_Price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_import`
--

CREATE TABLE `product_import` (
  `Product_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Cost` float NOT NULL,
  `Qty` int(11) NOT NULL,
  `Sold` int(11) NOT NULL,
  `User_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `Branch` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Manager_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_keep_product`
--

CREATE TABLE `store_keep_product` (
  `Branch` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Onhand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Supervisor_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Permission` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Name`, `Username`, `Password`, `Tel`, `Email`, `Supervisor_id`, `Permission`) VALUES
('UID00000001', 'Admin', 'admin', 'admin', 'admin', NULL, 'UID00000001', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `Manager_id` (`Manager_id`);

--
-- Indexes for table `customer_order_items`
--
ALTER TABLE `customer_order_items`
  ADD PRIMARY KEY (`Order_id`,`Product_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_id`),
  ADD KEY `Customer_id` (`Customer_id`,`Saler_id`),
  ADD KEY `Saler_id` (`Saler_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Order_id` (`Order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`);

--
-- Indexes for table `product_import`
--
ALTER TABLE `product_import`
  ADD PRIMARY KEY (`Product_id`,`Date`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`Branch`),
  ADD KEY `Manager_id` (`Manager_id`);

--
-- Indexes for table `store_keep_product`
--
ALTER TABLE `store_keep_product`
  ADD PRIMARY KEY (`Branch`,`Product_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Supervisor_id` (`Supervisor_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `customer_order_items`
--
ALTER TABLE `customer_order_items`
  ADD CONSTRAINT `customer_order_items_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`),
  ADD CONSTRAINT `customer_order_items_ibfk_3` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Saler_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `product_import`
--
ALTER TABLE `product_import`
  ADD CONSTRAINT `product_import_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`),
  ADD CONSTRAINT `product_import_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `store_keep_product`
--
ALTER TABLE `store_keep_product`
  ADD CONSTRAINT `store_keep_product_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`),
  ADD CONSTRAINT `store_keep_product_ibfk_2` FOREIGN KEY (`Branch`) REFERENCES `store` (`Branch`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Supervisor_id`) REFERENCES `user` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

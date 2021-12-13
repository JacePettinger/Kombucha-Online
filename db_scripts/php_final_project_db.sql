-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2021 at 02:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_final_project_db`
--
CREATE DATABASE IF NOT EXISTS `php_final_project_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `php_final_project_db`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_first_four_kits` ()  SELECT * FROM products 
WHERE product_type = "Brew Kits"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_first_four_kombucha` ()  SELECT * FROM php_final_project_db.products
WHERE product_type = "Kombucha"
LIMIT 4$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_first_four_teas` ()  SELECT * FROM products 
WHERE product_type = "Teas"$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` int(11) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `product_price` float NOT NULL,
  `product_description` varchar(250) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `product_image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_ID`, `product_name`, `product_price`, `product_description`, `product_type`, `product_image`) VALUES
(1, 'Blackberry Lavender', 1, 'Delicately floral lavender kombucha paired with berries for flavor straight from the south of France.', 'Kombucha', 'product-one.jpg'),
(5, 'Peach Pie', 2, 'This Peach Pie Kombucha is sweet like pie, with the flavors of maple syrup and vanilla tying it all together. The kombucha flavor of late summer is here!', 'Kombucha', 'product2.jpg'),
(6, 'Ginger Peach Moscow Mule', 1, 'Flavored with juicy peaches and gut-healthy ginger kombucha, this is a delicious, easy-to-make cocktail or mocktail for summer!', 'Kombucha', 'product-three.jpg'),
(7, 'Blueberry Lemonade', 2, 'The blueberries’ sweet taste compliments the tartness of the lemonade and will be sure to impress your guests at a house party or your next BBQ!', 'Kombucha', 'product-four.jpeg'),
(8, 'Kombucha Culture & Starte', 15, '1 kombucha culture + 8 oz. starter liquid. Perfect for the equipped home brewer who needs a new culture.', 'Brew Kits', 'brewkit1.jpg'),
(9, 'Beginners Brewing Kit', 30, 'The Kombucha Brewing Kit includes all the essentials needed to start brewing and the kombucha culture and equipment you need to keep going.', 'Brew Kits', 'brewkit2.jpg'),
(10, 'Deluxe Kombucha Brewing K', 60, 'With this Deluxe Kombucha Brewing Kit you get everything you need to start brewing like a pro. This kit includes our 1 Gallon Kombucha Brewing Kit + six swing top bottles + bendable bottle brush + stainless steel funnel and strainer set.', 'Brew Kits', 'brewkit3.jpg'),
(11, 'Cover It Up', 20, 'Kombucha heat wrap with an adjustable hook-and-loop strap to snugly fit your brewing vessel and a four-setting temperature controller to always keep your brew in the ideal temperature range. Includes 3 Fitted Brew Jar Covers.', 'Brew Kits', 'brewkit4.jpg'),
(12, 'Black Tea', 1, 'Black tea is a true tea that comes from the Camellia sinensis plant. Black tea leaves are allowed to fully oxidize before being processed and dried, which makes the leaves dark brown and gives the tea its signature flavor profile. Black teas tend to ', 'Teas', 'black-tea.jpg'),
(13, 'Green Tea', 2, 'Green tea is made from unoxidized Camellia Sinensis leaves and is one of the least processed types of tea. For this reason, it contains the most antioxidants and beneficial polyphenols.', 'Teas', 'green-tea.jpg'),
(14, 'Oolong Tea', 2, 'Oolong is a traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting. Most oolong teas, especially those of fine quality, involve unique tea plant cultiv', 'Teas', 'oolong-tea.jpg'),
(15, 'White Tea', 2, 'White tea is harvested before the tea plant’s leaves open fully, when the young buds are still covered by fine white hairs, hence the name “white” tea.  These buds and unfurled leaves from the newest growth on the tea plant are handpicked and then qu', 'Teas', 'white-tea.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `zip` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `fname`, `lname`, `email`, `city`, `state`, `zip`, `address`, `password`) VALUES
(1, 'Test', 'User', 'test@email.com', 'cedar rapids', 'IA', 52404, '', '$2y$10$4QD/RprQtp0N109tx5SWuebemrI6zay9eG0DEvEvwSRnjB/BAlSxq'),
(2, 'Mark', 'B', 'mark@email.com', 'cedar rapids', 'IA', 52404, '123 kirkwood st', '$2y$10$4QD/RprQtp0N109tx5SWuebemrI6zay9eG0DEvEvwSRnjB/BAlSxq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

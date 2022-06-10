-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2022 at 01:34 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u773298480_shopera`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousal_images`
--

CREATE TABLE `carousal_images` (
  `ci_id` int(11) NOT NULL,
  `ci_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_priority` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousal_images`
--

INSERT INTO `carousal_images` (`ci_id`, `ci_name`, `ci_priority`) VALUES
(1, 'c1.jpg', 1),
(2, 'c2.jpg', 1),
(3, 'c3.png', 1),
(4, 'c4.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`c_id`, `u_id`, `p_id`, `qty`) VALUES
(130, 13, 147, 1),
(145, 23, 1, 1),
(173, 19, 1, 1),
(180, 19, 1, 1),
(181, 13, 1, 1),
(202, 1, 1, 1),
(206, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`, `category_parent_id`) VALUES
(1, 'Kitchenware', '1_icon.png', 0),
(2, 'Electronics', '2_icon.png', 0),
(3, 'Fashion', '3_icon.png', 0),
(4, 'Essentials', '4_icon.png', 0),
(5, 'Footware', '5_icon.png', 0),
(6, 'Cosmetics', '6_icon.png', 0),
(7, 'Others', '7_icon.png', 0),
(8, 'Gas Burner', '8_icon.png', 1),
(9, 'Mixer Grinder', '9_icon.png', 1),
(10, 'TV', '10_icon.png', 2),
(11, 'Mobile', '11_icon.png', 2),
(12, 'Earphone', '12_icon.png', 2),
(13, 'Earings', '13_icon.png', 3),
(14, 'Agarbatti', '14_icon.png', 7),
(15, 'Dhoopsticks', '15_icon.png', 7),
(16, 'Dhoop Cup', '16_icon.png', 7),
(17, 'Cooker', '17_icon.png', 1),
(18, 'Fry Pan', '18_icon.png', 1),
(19, 'Oven', '19_icon.png', 1),
(20, 'Dinner set', '20_icon.png', 1),
(21, 'Toaster', '21_icon.png', 1),
(22, 'Casaroles', '22_icon.png', 1),
(23, 'Blender', '23_icon.png', 1),
(24, 'Iron', '24_icon.png', 2),
(25, 'Utensils', '25_icon.png', 1),
(26, 'Thermos', '26_icon.png', 1),
(27, 'Crockery', '27_icon.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_pincode` int(11) NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `city_pincode`, `district`, `state`) VALUES
(1, 'Bilimora', 396321, 'Navsari', 'Gujarat');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `dp_id` int(11) NOT NULL,
  `dp_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp_join_datetime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending` int(11) NOT NULL,
  `completed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`dp_id`, `dp_name`, `dp_email`, `dp_number`, `dp_address`, `dp_join_datetime`, `pending`, `completed`) VALUES
(1, 'Harsh Patel', 'harshpatel18.ha@gmail.com', '22222', 'fgghh', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_details`
--

CREATE TABLE `delivery_details` (
  `d_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `d_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `f_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`f_id`, `u_id`, `p_id`) VALUES
(87, 23, 1),
(161, 1, 2),
(163, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `off_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `off_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_images`
--

CREATE TABLE `offer_images` (
  `oi_id` int(11) NOT NULL,
  `oi_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oi_priority` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_images`
--

INSERT INTO `offer_images` (`oi_id`, `oi_name`, `oi_priority`) VALUES
(1, 'o1.jpg', 5),
(2, 'o2.jpg', 4),
(3, 'o3.jpg', 3),
(4, 'o4.jpg', 2),
(5, 'o5.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_index`
--

CREATE TABLE `order_index` (
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `o_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `o_datetime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_address_line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_address_line2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_index`
--

INSERT INTO `order_index` (`o_id`, `u_id`, `o_status`, `o_datetime`, `o_amount`, `o_name`, `o_mobile_number`, `o_address_line1`, `o_address_line2`, `o_city`, `o_mode`) VALUES
(12, 1, 'false', '2021-05-04 19:24:59.139640', '13000', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(13, 1, 'false', '2021-05-08 19:59:54.010770', '13000', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(14, 1, 'false', '2021-05-08 20:13:22.325113', '13000', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(16, 1, 'false', '2021-05-10 16:19:04.000223', '18000', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(18, 1, 'false', '2021-05-27 20:00:47.421494', '0', 'Jenil Mahyavanshi', '6464646464646', 'hahqhqjq', 'hahqhqjq', 'Bilimora', 'homedelivery'),
(19, 1, 'false', '2021-05-30 15:31:20.687620', '0', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(20, 1, 'false', '2021-06-06 15:36:46.197078', '147540', 'Jenil Mahyavanshi', '6464646464646', 'NA', 'NA', 'NA', 'pickup'),
(21, 1, 'false', '2021-06-30 16:21:26.847430', '9915', 'Jenil Mahyavanshi', '6464646464646', '', '', '', 'homedelivery'),
(22, 1, 'false', '2021-07-08 13:34:59.386864', '9820', 'Jenil Mahyavanshi', '6464646464646', '', '', '', 'homedelivery'),
(23, 1, 'false', '2021-09-20 20:17:41.888138', '9820', 'Jenil Mahyavanshi', '6464646464646', '', '', '', 'homedelivery');

-- --------------------------------------------------------

--
-- Table structure for table `order_relation`
--

CREATE TABLE `order_relation` (
  `or_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_relation`
--

INSERT INTO `order_relation` (`or_id`, `o_id`, `p_id`, `s_id`, `quantity`) VALUES
(1, 12, 1, 1, 1),
(2, 12, 147, 1, 1),
(3, 13, 1, 1, 1),
(4, 13, 147, 1, 1),
(5, 14, 1, 1, 1),
(6, 14, 147, 1, 1),
(7, 16, 1, 1, 1),
(8, 16, 147, 1, 1),
(9, 16, 149, 1, 1),
(10, 18, 1, 1, 1),
(11, 18, 147, 1, 1),
(12, 19, 1, 1, 1),
(13, 19, 147, 1, 1),
(14, 20, 1, 1, 1),
(15, 20, 147, 1, 1),
(16, 20, 2, 1, 1),
(17, 21, 1, 1, 1),
(18, 21, 2, 1, 1),
(19, 21, 33, 5, 1),
(20, 22, 1, 1, 1),
(21, 22, 2, 1, 1),
(22, 23, 1, 1, 1),
(23, 23, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `p_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_category` int(11) NOT NULL,
  `cp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `s_id`, `p_name`, `p_category`, `cp`, `sp`, `p_description`) VALUES
(1, 1, 'Suryavansham Gas Stove Glass Top', 8, '7000', '4000', 'Glass Guarantee - 2 Years'),
(2, 1, 'Bajaj Food Factory FX11\r\n', 9, '7295', '5795', 'Warranty-5yrs\r\n600watt\r\n'),
(3, 1, 'Bajaj classic 750\r\n', 9, '5299\r\n', '3499', 'Warr-5yrs,750watt\r\n'),
(4, 1, 'Bajaj GX 3701 Mixer Grinder\r\n', 9, '5350\r\n', '3850', 'Warr-5yrs\r\n750watt\r\n'),
(5, 1, 'Bajaj Twister Mixer Grinder\r\n', 9, '5475\r\n', '3975', 'Warr-5yrs\r\n750watt\r\n'),
(6, 1, 'Maharaja Turbo dlx', 9, '4300', '3000', 'Warr-5yrs\r\n750watt'),
(7, 1, 'Prestige Elegant 750 V2\r\n', 9, '5495\r\n', '3995', 'Warr-5yrs\r\n750watt\r\n'),
(33, 5, 'Golden Monk Sai Darbar(110 gm)', 14, '75', '70', '110 gm Spiritual smell, white sticks Agarbatti.'),
(34, 5, 'Golden Monk Sai Shringar(110 gm)', 14, '75', '70', '110 gm kewda smell, White sticks Agarbatti.'),
(35, 5, 'Golden Monk Brut(130 gm)', 14, '75', '70', '130 gm perfume smell, white sticks Agarbatti.'),
(36, 5, 'Golden Monk berry(150 gm)', 14, '75', '70', '150 gm sweet smell,white sticks Agarbatti.'),
(37, 5, 'Golden Monk Pineapple(130 gm)', 14, '75', '70', '130 gm \r\nSweet smell, white sticks Agarbatti.'),
(38, 5, 'Golden Monk Strawberry(130 gm)', 14, '75', '70', '130 gm \r\nSweet smell, white sticks Agarbatti.'),
(39, 5, 'Golden Monk Fruitberry(130 gm)', 14, '75', '70', '130 gm,\r\nSweet smell, white sticks Agarbatti.'),
(40, 5, 'Golden Monk Moghra(150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell,White sticks Agarbatti.'),
(41, 5, 'Golden Monk Gulfam(Rose)', 14, '75', '70', '130 gm,\r\nSweet smell, white sticks Agarbatti.'),
(42, 5, 'Golden Monk Raatrani(150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell, white sticks Agarbatti.'),
(43, 5, 'Golden Monk Attarful (150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell,white sticks Agarbatti.'),
(44, 5, 'Golden Monk Love Wonder (150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell, White sticks Agarbatti.'),
(45, 5, 'Golden Monk Lily(150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell, White sticks Agarbatti.'),
(46, 5, 'Golden Monk Soan Champa(150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell, White sticks Agarbatti.'),
(47, 5, 'Golden Monk Black Pearl(130 gm)', 14, '75', '70', '130 gm,\r\nSweet smell, White sticks Agarbatti.'),
(48, 5, 'Golden Monk Cigar(130 gm)', 14, '75', '70', '130 gm,\r\nSweet smell, White sticks Agarbatti.'),
(49, 5, 'Golden Monk Purple(150 gm)', 14, '75', '70', '150 gm,\r\nSweet smell, White sticks Agarbatti.'),
(50, 5, 'Golden Monk Magical(130 gm)', 14, '75', '70', '130 gm,\r\nSweet smell, White sticks Agarbatti.'),
(51, 5, 'Golden Monk Mysore Sandal(110 gm)', 14, '65', '60', '110 gm,\r\nWhite sticks Agarbatti.'),
(52, 5, 'Golden Monk Utsav(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(53, 5, 'Golden Monk Freedom(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(54, 5, 'Golden Monk Rockstar(150 gm)', 14, '65', '60', '150 gm,\r\nWhite sticks Agarbatti.'),
(55, 5, 'Golden Monk Sanskar(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(56, 5, 'Golden Monk Pushpak(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(57, 5, 'Golden Monk Sonam(150 gm)', 14, '65', '60', '150 gm,\r\nWhite sticks Agarbatti.'),
(58, 5, 'Golden Monk Ariz(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(59, 5, 'Golden Monk Milan(130 gm)', 14, '65', '60', '130 gm,\r\nWhite sticks Agarbatti.'),
(60, 5, 'Golden Monk Aqua(150 gm)', 14, '65', '60', '150 gm,\r\nWhite sticks Agarbatti.'),
(61, 5, 'Golden Monk Raas (150 gm)', 14, '65', '60', '150 gm,\r\nWhite sticks Agarbatti.'),
(62, 5, 'Golden Monk Red-X(150 gm)', 14, '65', '60', '150 gm,\r\nWhite sticks Agarbatti.'),
(63, 5, 'Golden Monk Lavender(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(64, 5, 'Golden Monk Romance(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(65, 5, 'Golden Monk Intimate(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(66, 5, 'Golden Monk Champa(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(67, 5, 'Golden Monk Fresh Gulab(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(69, 5, 'Golden Monk Moghra(100 gm)', 14, '65', '60', '100 gm,\r\nBlacksticks Agarbatti.'),
(70, 5, 'Golden Monk Vrundavan(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(71, 5, 'Golden Monk Aroma(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(72, 5, 'Golden Monk Sai Darshan(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(73, 5, 'Golden Monk Goodtime(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(74, 5, 'Golden Monk Madhuri(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(75, 5, 'Golden Monk Deva(100 gm)', 14, '95', '90', '100 gm,\r\nWhitesticks Agarbatti.'),
(76, 5, 'Golden Monk Bhakti(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(77, 5, 'Golden Monk Salimar(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(78, 5, 'Golden Monk Divya(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(79, 5, 'Golden Monk Anmol(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(80, 5, 'Golden Monk Anant(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(81, 5, 'Golden Monk Akhand(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(82, 5, 'Golden Monk kanha(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(83, 5, 'Golden Monk Fresh(250 gm)', 14, '120', '100', '250 gm,\r\nwhitesticks Agarbatti.'),
(84, 5, 'Golden Monk Vandan', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(85, 5, 'Golden Monk Alokik', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(86, 5, 'Golden Monk Prathna', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(87, 5, 'Golden Monk Devta', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(88, 5, 'Golden Monk Kanha', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(89, 5, 'Golden Monk Astha', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(90, 5, 'Golden Monk Sirin', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(91, 5, 'Golden Monk Manthan', 14, '15', '15', '10 Sticks,\r\nDry Dhoop sticks.'),
(92, 5, 'Golden Monk Pooja', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(93, 5, 'Golden Monk Sai Shringar', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(94, 5, 'Golden Monk Pavitra', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(95, 5, 'Golden Monk Arpan', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(96, 5, 'Golden Monk Sai darbar', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(97, 5, 'Golden Monk Brut', 14, '55', '50', '20 Sticks,\r\nDry Dhoop sticks.'),
(98, 5, 'Golden Monk 1 Dozen Combo Agarbatti', 14, '180', '150', '1 pack contains 12 sticks agarbatti.'),
(99, 5, 'Golden Monk Pancham', 14, '75', '70', '5 in 1 dry sticks agarbatti.'),
(100, 5, 'Shah Sweet Rose(140 gm)', 14, '75', '70', '140 gm,\r\nAgarbatti.'),
(101, 5, 'Shah Sai Sugandh Agarbatti(140 gm)', 14, '75', '70', '140 gm,\r\nAgarbatti.'),
(102, 5, 'Shah Pavitra Bhakti Agarbatti(100 gm)', 14, '75', '70', '100 gm,\r\nAgarbatti.'),
(103, 5, 'Shah Premium Rose Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(104, 5, 'Shah Navkar Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(105, 5, 'Shah Pavitra Bhakti Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(106, 5, 'Shah Kesar Chandan Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(107, 5, 'Shah Golden Kasturi Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(108, 5, 'Shah Golden Oudh Dhoop Sticks(100 gm)', 15, '125', '120', '100 gm,\r\nDhoop Sticks.'),
(109, 5, 'Satya Milan Agarbatti(140 gm)', 14, '70', '70', '140 gm,\r\nAgarbatti.'),
(110, 5, 'Satya Subah Agarbatti (150 gm)', 14, '70', '70', '150 gm,\r\nAgarbatti.'),
(111, 5, 'Satya Chandan Agarbatti (140 gm)', 14, '70', '70', '100 gm,\r\nAgarbatti.'),
(112, 5, 'Satya Firaki Agarbatti (140 gm)', 14, '70', '70', '140 gm,\r\nAgarbatti.'),
(113, 5, 'Satya Fresh Rose Dhoopsticks(12 sticks)', 15, '25', '20', 'Dhoopsticks.'),
(114, 5, 'Satya Purple Jewel Dhoopsticks(20 sticks)', 15, '40', '40', 'Dhoopsticks.'),
(115, 5, 'Satya Vastu Srudhi Dhoopsticks(24 sticks)', 15, '30', '30', 'Dhoopsticks.'),
(116, 5, 'Satyan Mahakaal Dhoopsticks(24 sticks)', 15, '25', '25', 'Dhoopsticks.'),
(117, 5, 'Parivaar Tilak Agarbatti(130 gm)', 14, '65', '60', '130 gm,\r\nAgarbatti.'),
(118, 5, 'Parivaar Mogra Agarbatti (150 gm)', 14, '65', '60', '150 gm,\r\nAgarbatti.'),
(119, 5, 'Parivaar Dark Rose Agarbatti (150 gm)', 14, '65', '60', '150 gm,\r\nAgarbatti.'),
(120, 5, 'Parivaar Raatrani Agarbatti (150 gm)', 14, '65', '60', '150 gm,\r\nAgarbatti.'),
(121, 5, 'Parivaar Kasturi Agarbatti(150 gm)', 14, '65', '60', '150 gm,\r\nAgarbatti.'),
(122, 5, 'Parivaar Laabh Agarbatti (150 gm)', 14, '65', '60', '150 gm,\r\nAgarbatti.'),
(123, 5, 'Parivaar Shubh Agarbatti (140 gm)', 14, '65', '60', '140 gm,\r\nAgarbatti.'),
(124, 5, 'Janak Flora Agarbatti (200 gm)', 14, '80', '80', '200 gm,\r\nMasala Agarbatti.'),
(125, 5, 'Janak 555 Agarbatti(50 gm)', 14, '80', '80', '50 gm,\r\nMasala Agarbatti.'),
(126, 5, 'Janak Kesar Chandan Agarbatti (100 gm)', 14, '80', '80', '100 gm,\r\nMasala Agarbatti.'),
(127, 5, 'Janak Maharashi Agarbatti(50 gm)', 14, '110', '100', '50 gm,\r\nMasala Agarbatti.'),
(128, 5, 'Bimal Black Musk Agarbatti (130 gm)', 14, '70', '70', '130 gm,\r\nAgarbatti.'),
(129, 5, 'Bimal Fruit Agarbatti (130 gm)', 14, '65', '60', '130 gm,\r\nAgarbatti.'),
(130, 5, 'Bimal Shree Flora  Agarbatti (50 gm)', 14, '60', '60', '50 gm,\r\nMasala Agarbatti.'),
(131, 5, 'Kalpana Loban(135 gm)', 14, '70', '70', '135 gm,\r\nAgarbatti.'),
(132, 5, 'Kalpana GUgal Agarbatti (135 gm)', 14, '70', '70', '135 gm,\r\nAgarbatti.'),
(133, 5, 'Chamundeshwari Dhoopsticks(24 piece)', 15, '25', '25', '24 piece,\r\nDry Dhoopsticks.'),
(134, 5, 'Chamundeshwari Dhoopsticks (50 piece)', 15, '50', '50', '50 piece,\r\nDry Dhoopsticks.'),
(135, 5, 'Cycle 3 in 1 Agarbatti (110 gm)', 14, '50', '50', '110 gm,\r\ncycle Agarbatti.'),
(136, 5, 'Cycle  Heritage Agarbatti(110 gm)', 14, '50', '50', '110 gm,\r\nCycle Agarbatti.'),
(137, 5, 'Cycle Sandalum Agarbatti(109 gm)', 14, '50', '50', '109 gm,\r\nCycle Agarbatti.'),
(138, 5, 'Cycle  Woods Agarbatti(20 sticks)', 14, '75', '75', '20 sticks Cycle Agarbatti.'),
(139, 5, 'Cycle Yagna Agarbatti(14 sticks)', 14, '50', '50', '14 sticks Cycle Agarbatti.'),
(140, 5, 'Cycle ECO Agarbatti(192 gm)', 14, '100', '100', '192 gm,\r\nCycle Agarbatti.'),
(141, 5, 'Cycle Naivedya Dhoop Cup(12 Cups)', 16, '72', '70', '12 Dhoop Cups.'),
(142, 5, 'Ashika Dhoop Cup (15 cups)', 16, '110', '110', '15 Dhoop Cups.'),
(143, 5, 'Kapur Guggal Dhoop Cup (12 cups)', 16, '90', '90', '12 Dhoop cups.'),
(147, 1, 'Prestige glass top chula(3 burner)', 8, '12005', '9000', 'Avail the above discount on exchange offer.\r\nglass top Chula with 10 years guarantee of glass.'),
(148, 1, 'Prestige glass top chula(3 burner)', 8, '10095', '7500', 'Avail the above discount on exchange offer.\r\nglass guarantee of 7 years.'),
(149, 1, 'Glen Glass top gas burner(3 burner)', 8, '8495', '5000', 'Avail the above discount on exchange offer.\r\n3 burner gas chula with 2 years glass guarantee.'),
(150, 1, 'Butterfly Glass top gas burner(3 burner)', 8, '6995', '4000', 'Avail the above discount on exchange offer.\r\n3 burner gas Chula with 2 years glass guarantee.'),
(151, 1, 'Suryavansham Glass top gas burner(3 burner)', 8, '6995', '4000', 'Avail the above discount on exchange offer.\r\n3 burner gas CHula with 1 year glass guarantee.'),
(152, 1, 'Glass top printed gas burner(3 burner)', 8, '6995', '3000', 'Avail the above discount on exchange offer.\r\n3 burner printed gas Chula.No glass guarantee.'),
(153, 1, 'Glass top gas burner(3 burner)', 8, '5990', '2500', 'Avail the above discount on exchange offer.\r\nblain black 3 burner gas Burner with 2 year warrantee.'),
(154, 1, 'Glen S.S gas burner(3 burner)', 8, '6995', '4000', 'Avail the above discount on exchange offer.\r\n3 burner gas Chula with 1 year Warrantee.'),
(155, 1, 'Priti Gold S.S gas burner(3 Burner)', 8, '5995', '2995', 'Avail the above discount on exchange offer.\r\n3 burner gas Chula with 1 year warrantee.'),
(156, 1, 'Laxmi S.S gas burner(2 burner)', 8, '2695', '1500', 'Avail the above discount on exchange offer.\r\n2 burner gas chula with 1 year warrantee.'),
(157, 1, 'Laxmi S.S gas burner(Single burner)', 8, '995', '700', 'Avail the above discount on exchange offer.\r\nsingle burner gas Chula with 1 year warantee.'),
(158, 1, 'Bajaj mixer grinder', 9, '6450', '4500', 'Avail the above discount on exchange offer.\r\n750 Watt,4 jar mixer grinder.\r\n5 year warrantee.'),
(159, 1, 'Bajaj mixer grinder', 9, '5500', '4000', 'Avail the above discount on exchange offer.\r\n3 jar mixer grinder,750 Watt with 5 years warrantee.'),
(160, 1, 'Bajaj mixer grinder', 9, '5000', '3500', 'Avail the above discount on exchange offer.\r\n750 Watt,3 jar mixer with 5 years warrantee.'),
(161, 1, 'Prestige mixer grinder', 9, '5500', '4000', 'Avail the above discount on exchange offer.\r\n750 Watt,4 jar mixer grinder with 5 years warrantte.'),
(162, 1, 'Butterfly mixer grinder', 8, '5500', '4000', 'Avail the above discount on exchange offer.\r\n750 Watt,3 jar mixer with 5 years Warrantee.'),
(163, 1, 'Butterfly mixer grinder', 9, '5000', '3500', 'Avail the above discount on exchange offer.\r\n750 Watt,3 jar mixer with 5 years Warrantee.'),
(164, 1, 'Maharaja mixer', 9, '4300', '3000', 'Avail the above discount on exchange offer.\r\n750 Watt,3 jar mixer with 5 years Warrantee.'),
(165, 1, 'Barosi Mixer', 9, '4300', '3000', 'Avail the above discount on exchange offer.\r\n600 Watt,3 jar mixer with 2 years Warrantee.'),
(166, 1, 'Butterfly S.S cooker', 17, '', '', '40 % less,special scheme available.'),
(167, 1, 'Vinod S.S Cooker', 17, '', '', '22 % less,special scheme available.'),
(168, 1, 'Garuda S.S cooker', 17, '', '', '25 % less special scheme available.'),
(169, 1, 'U cook triply S.S cooker', 17, '', '', '20 % less special scheme available.'),
(170, 1, 'Vinod Blade Cooker', 17, '', '', '22 % less special scheme available.'),
(171, 1, 'Prestige Blade Cooker', 17, '', '', '22 % less special scheme available.'),
(172, 1, 'Aramax Blade Cooker', 17, '', '', '30 % less special scheme available.'),
(173, 1, 'Nirlep Non stick Tawa fry pan kadai', 18, '', '', '22 % less special scheme available.'),
(174, 1, 'Tefal non stick fry pan', 18, '', '', '20 % less special scheme available.\r\nfrance(imported)'),
(175, 1, 'Roxx Non stick fry pan', 18, '', '', '30 % discount (imported)'),
(176, 1, 'Wonderchef non stick fry pan', 18, '', '', 'special scheme available.'),
(177, 1, 'Wonderchef Nutriblend Mixer', 9, '', '', 'Mixer grinder.'),
(178, 1, 'Bajaj Oven.', 19, '', '', 'Oven.'),
(181, 1, 'Bajaj Microwave Oven', 19, '', '', 'Microwave Oven.'),
(182, 1, 'Dinner set Crockery', 20, '', '', 'Dinner set'),
(183, 1, 'Melamine crockery', 27, '', '', 'Crockery'),
(184, 1, 'Sandwich Toaster', 21, '', '', 'Sandwich Toaster'),
(185, 1, 'Casaroles', 22, '', '', 'Casaroles.'),
(186, 1, 'Blender', 23, '', '', 'Blender.'),
(187, 1, 'Iron', 24, '', '', 'Iron'),
(188, 1, 'Pop up Toaster', 21, '', '', 'Toaster.'),
(189, 1, 'Induction Chula', 8, '', '', 'Induction Chula.'),
(190, 1, 'Cup Socer', 27, '', '', 'Cup Socer.'),
(191, 1, 'Glass', 27, '', '', ''),
(192, 1, 'S.S Vasan', 25, '', '', 'Utensils.'),
(193, 1, 'Thermos', 26, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `p_id` int(11) NOT NULL,
  `p_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `i_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`p_id`, `p_image`, `i_id`) VALUES
(1, '1_1.png', 1),
(1, '1_2.png', 2),
(1, '1_3.png', 3),
(2, '2_1.png', 4),
(3, '3_1.png', 5),
(4, '4_1.png', 6),
(5, '5_1.png', 7),
(6, '6_1.png', 8),
(7, '7_1.png', 9),
(147, '147_1.png', 63),
(147, '147_2.png', 64),
(147, '147_3.png', 65),
(147, '147_4.png', 66),
(148, '148_1.png', 67),
(148, '148_2.png', 68),
(148, '148_3.png', 69),
(150, '150_1.png', 70),
(150, '150_2.png', 71),
(150, '150_3.png', 72),
(149, '149_1.png', 73),
(149, '149_2.png', 74),
(60, '60_1.png', 75),
(63, '63_1.png', 76),
(64, '64_1.png', 77),
(65, '65_1.png', 78),
(66, '66_1.png', 79),
(67, '67_1.png', 80),
(69, '69_1.png', 81),
(70, '70_1.png', 82),
(71, '71_1.png', 83),
(72, '72_1.png', 84),
(73, '73_1.png', 85),
(74, '74_1.png', 86),
(75, '75_1.png', 87),
(76, '76_1.png', 88),
(77, '77_1.png', 89),
(78, '78_1.png', 90),
(79, '79_1.png', 91),
(80, '80_1.png', 92),
(81, '81_1.png', 93),
(82, '82_1.png', 94),
(84, '84_1.png', 95),
(85, '85_1.png', 96),
(86, '86_1.png', 97),
(87, '87_1.png', 98),
(88, '88_1.png', 99),
(89, '89_1.png', 100),
(90, '90_1.png', 101),
(91, '91_1.png', 102),
(92, '92_1.png', 103),
(93, '93_1.png', 104),
(94, '94_1.png', 105),
(95, '95_1.png', 106),
(96, '96_1.png', 107),
(97, '97_1.png', 108);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `r_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`r_id`, `u_id`, `p_id`, `value`) VALUES
(17, 1, 60, '4'),
(18, 1, 1, '4'),
(20, 1, 2, '4'),
(21, 19, 147, '3'),
(22, 19, 1, '3'),
(23, 19, 131, '5'),
(24, 19, 148, '5'),
(25, 19, 3, '5');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_map_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `r_code` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signups` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`s_id`, `s_name`, `s_address`, `s_owner_name`, `s_description`, `s_number`, `s_email`, `s_image`, `s_map_link`, `r_code`, `signups`) VALUES
(1, 'Modi Kitchenware', 'Near Mr. Bake bakery,\r\nOPP. Panchal samaj Wadi,\r\nGoharbaug , Bilimora.', 'Deepak Modi', 'Kitchen Appliances and imported crockery.', '9825387411', 'deepakmodi18271@gmail.com', 's_1.jpg', 'https://www.google.com/maps/place/Modi+Kitchenware/@20.766676,72.9740084,17z/data=!3m1!4b1!4m5!3m4!1s0x3be0ef4dba4caaa5:0xcc77e30fb51f0292!8m2!3d20.766676!4d72.9761971', 'MDK001', 16),
(5, 'A-ONE PERFUMERY', 'OPP. Railway station', 'Saeedbhai Shaikh', 'Agarbatti, Attar, Perfumes, Mehndi, Airfreshner, Kapoor, Gugal, Sandal, Powder, Dhoopsticks, Rosewater.', '9979455595', 'saadshaikh1411@gmail.com', '', 'https://www.google.com/maps/place/A-One+Perfumery/@20.7664434,72.9693995,21z/data=!4m5!3m4!1s0x3be0efc84ad4f471:0xfc04bcf3d4d7f245!8m2!3d20.7664875!4d72.9693389', 'AOP002', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `u_code` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_email`, `u_name`, `u_mobile`, `u_address`, `u_code`) VALUES
(1, 'jenilmahy25@gmail.com', 'Jenil Mahyavanshi', '6464646464646', 'hjd', 0),
(12, 'hdmodi738@gmail.com', 'Hardik Modi', NULL, NULL, 0),
(13, 'harshpatelar@gmail.com', 'Harsh', NULL, NULL, 0),
(19, 'divsmistry30@gmail.com', 'Divyam', NULL, NULL, 0),
(20, 'divsmistry30@gmail.com', 'Divyam', NULL, NULL, 0),
(21, 'divsmistry30@gmail.com', 'Divyam', NULL, NULL, 0),
(22, 'cooljenil2510@gmail.com', 'Jenil', NULL, NULL, 0),
(23, 'nasitnikhil11@gmail.com', 'Nikhil Nasit', NULL, NULL, 0),
(24, '19itubs132@ddu.ac.in', 'Divyam', NULL, NULL, 0),
(25, '19itubs132@ddu.ac.in', 'Divyam', NULL, NULL, 0),
(26, '19itubs132@ddu.ac.in', 'Divyam', NULL, NULL, 0),
(27, 'bilimora01020304@gmail.com', 'Hardik Modi', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `ua_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variables`
--

CREATE TABLE `variables` (
  `variable_id` int(11) NOT NULL,
  `delivery_charges` int(11) NOT NULL,
  `support_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variables`
--

INSERT INTO `variables` (`variable_id`, `delivery_charges`, `support_mail`, `delivery_mail`) VALUES
(1, 25, 'support@shoperaweb.com', 'delivery@shoperaweb.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousal_images`
--
ALTER TABLE `carousal_images`
  ADD PRIMARY KEY (`ci_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `user_cart_foreign` (`u_id`),
  ADD KEY `product_cart_foreign` (`p_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`dp_id`);

--
-- Indexes for table `delivery_details`
--
ALTER TABLE `delivery_details`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `user_dd_foreign` (`u_id`),
  ADD KEY `oi_dd_foreign` (`o_id`),
  ADD KEY `delivery_dd_foreign` (`dp_id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `user_favourite_foreign` (`u_id`),
  ADD KEY `product_favourite_foreign` (`p_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`off_id`);

--
-- Indexes for table `offer_images`
--
ALTER TABLE `offer_images`
  ADD PRIMARY KEY (`oi_id`);

--
-- Indexes for table `order_index`
--
ALTER TABLE `order_index`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `user_oi_foreign` (`u_id`);

--
-- Indexes for table `order_relation`
--
ALTER TABLE `order_relation`
  ADD PRIMARY KEY (`or_id`),
  ADD KEY `oi_or_foreign` (`o_id`),
  ADD KEY `product_or_foreign` (`p_id`),
  ADD KEY `shop_or_foreign` (`s_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `product_shop_foreign` (`s_id`) USING BTREE,
  ADD KEY `product_category_foreign` (`p_category`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `product_pi_foreign` (`p_id`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `user_rate_foreign` (`u_id`),
  ADD KEY `product_rate_foreign` (`p_id`) USING BTREE;

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`ua_id`);

--
-- Indexes for table `variables`
--
ALTER TABLE `variables`
  ADD PRIMARY KEY (`variable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousal_images`
--
ALTER TABLE `carousal_images`
  MODIFY `ci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `dp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_details`
--
ALTER TABLE `delivery_details`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `off_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_images`
--
ALTER TABLE `offer_images`
  MODIFY `oi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_index`
--
ALTER TABLE `order_index`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_relation`
--
ALTER TABLE `order_relation`
  MODIFY `or_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `ua_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variables`
--
ALTER TABLE `variables`
  MODIFY `variable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product_cart_foreign` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `user_cart_foreign` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `delivery_details`
--
ALTER TABLE `delivery_details`
  ADD CONSTRAINT `delivery_dd_foreign` FOREIGN KEY (`dp_id`) REFERENCES `delivery` (`dp_id`),
  ADD CONSTRAINT `oi_dd_foreign` FOREIGN KEY (`o_id`) REFERENCES `order_index` (`o_id`),
  ADD CONSTRAINT `user_dd_foreign` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `product_favourite_foreign` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `user_favourite_foreign` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `order_index`
--
ALTER TABLE `order_index`
  ADD CONSTRAINT `user_oi_foreign` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `order_relation`
--
ALTER TABLE `order_relation`
  ADD CONSTRAINT `oi_or_foreign` FOREIGN KEY (`o_id`) REFERENCES `order_index` (`o_id`),
  ADD CONSTRAINT `product_or_foreign` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `shop_or_foreign` FOREIGN KEY (`s_id`) REFERENCES `shop` (`s_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_foreign` FOREIGN KEY (`p_category`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `product_shop_foreign` FOREIGN KEY (`s_id`) REFERENCES `shop` (`s_id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_pi_foreign` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `product_rate_foreign` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `user_rate_foreign` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

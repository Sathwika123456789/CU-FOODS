-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 01:57 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(0, 'admin_sathwika', 'd494465cd1fa1431cfdaed216a0c86c5b0ccb544');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_orders`
--

CREATE TABLE `custom_orders` (
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `req` varchar(500) NOT NULL,
  `suggestions` varchar(500) NOT NULL,
  `procedure1` varchar(1000) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custom_orders`
--

INSERT INTO `custom_orders` (`user_id`, `name`, `req`, `suggestions`, `procedure1`, `payment_status`) VALUES
(0, 'Paneer Biryani', ' 2 tbsp oil ....1 tsp ghee .... 2 bay leaf ....1 star anise ....1 pod black cardamom ....1 mace  ....2 pods cardamom ', ' Use fresh garam masala Deglaze the pot using the liquids from the vegetables to remove any browned bits from the sautéing of the onions.', 'Step 1 - Rinse and soak the rice in 2 cups of water for 20 minutes. Drain water after 20 mins. Set the Instant Pot to Sauté (more) mode and heat 1 tablespoon of ghee\r\n\r\nStep-2 : Add thinly sliced onions and cook for 5-7 minutes or until the onions are lightly caramelized. \r\n\r\nStep-3:Take half of the onions out and reserve them for garnish (photos 1 - 2). \r\n\r\nStep-4: Add remaining ghee, cumin seeds, cardamom, cloves, black pepper, and bay leaves. Cook for 30 seconds. ', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(0, 0, 'sdgg', 'as@gmail.com', '665', 'fsffdg'),
(0, 0, 'gdsgdgsgs', 'dasdad@gmail.com', '44566', 'rrwqrr');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(0, 0, 'ASISH VISHNU', '123-45-678', 'asish1@gmail.com', 'cash on delivery', '43324, gxgxd, ggdsg, dsgs, sdgg, dsdgsdg, gdg - 456455', 'Idli Karam (200 x 1) - Halwa (100 x 1) - ', 300, '2022-11-14', 'completed'),
(0, 0, 'ASISH VISHNU', '123-45-678', 'asish1@gmail.com', 'cash on delivery', '43324, gxgxd, ggdsg, dsgs, sdgg, dsdgsdg, gdg - 456455', 'Ginger pickle (with mango) (150 x 1) - ', 150, '2022-11-14', 'completed'),
(0, 0, 'ASISH VISHNU', '123-45-678', 'asish2@gmail.com', 'cash on delivery', '43324, gxgxd, ggdsg, dsgs, sdgg, dsdgsdg, gdg - 456455', 'Idli Karam (200 x 1) - ', 200, '2022-11-16', 'completed'),
(0, 0, 'ASISH VISHNU', '123-45-678', 'asish2@gmail.com', 'cash on delivery', '43324, gxgxd, ggdsg, dsgs, sdgg, dsdgsdg, gdg - 456455', 'Idli Karam (200 x 1) - Poli (100 x 1) - ', 300, '2022-11-18', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(0, 'Idli Karam', 'fast food', 200, 'Idli karam.jfif'),
(0, 'Ginger pickle (with mango)', 'main dish', 150, 'Ginger pickel (with mango).jpg'),
(0, 'Gongura Pickle', 'main dish', 150, 'Gongura Pickle.jpg'),
(0, 'Tomato pickle', 'main dish', 180, 'Tomato Pickle.jpg'),
(0, 'Poli', 'desserts', 100, 'poli.jpg'),
(0, 'Halwa', 'desserts', 100, 'halwa.jpg'),
(0, 'Murukulu', 'drinks', 300, 'chakli.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(0, 'ASISH VISHNU', 'asish2@gmail.com', '123-45-678', '836babddc66080e01d52b8272aa9461c69ee0496', '43324, gxgxd, ggdsg, dsgs, sdgg, dsdgsdg, gdg - 456455'),
(0, 'ASISH VISHNU', 'asish2@gmail.com', '234-45-123', '897f6ea057ba2572904cfa4cf787d6feca33c86d', ''),
(0, 'ASISH VISHNU', 'asish2@gmail.com', '675-89-123', '897f6ea057ba2572904cfa4cf787d6feca33c86d', ''),
(0, 'ASISH VISHNU', 'asish2@gmail.com', '123-45-897', 'cd90cce47ce57710f3979c7201f52d6b44dd5818', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

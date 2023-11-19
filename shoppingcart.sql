-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2023 at 09:51 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `products` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `address`, `phone`, `total_amount`, `order_date`, `products`) VALUES
(1, 'test', 'test', '0202020202', '0.00', '2023-11-18 21:56:03', ''),
(2, '', '', '', '99.98', '2023-11-18 21:56:12', 'a:2:{i:0;a:8:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:16:\"montre connecté\";s:4:\"desc\";s:218:\"<p>montre en acier inoxidable noir connecté</p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>connecté et fonctionne sous android.</li>\r\n<li>Ajustable.</li>\r\n<li>batterie avec une autonomie de 24h.</li>\r\n<li>légère et élégante</li>\r\n</ul>\";s:5:\"price\";s:5:\"29.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:2:\"10\";s:3:\"img\";s:9:\"watch.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:55:22\";}i:1;a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:14:\"appareil photo\";s:4:\"desc\";s:123:\"<p>appareil photo socon </p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>fait aussi des vidéos</li>\r\n<li>précisement de 120k pixels</li>\r\n</ul>\";s:5:\"price\";s:5:\"69.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:1:\"7\";s:3:\"img\";s:10:\"camera.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:42:04\";}}'),
(3, 'reter', 'jgrijgrj', '6461665644', '0.00', '2023-11-18 21:56:21', ''),
(4, '', '', '', '99.98', '2023-11-18 21:57:59', 'a:2:{i:0;a:8:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:16:\"montre connecté\";s:4:\"desc\";s:218:\"<p>montre en acier inoxidable noir connecté</p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>connecté et fonctionne sous android.</li>\r\n<li>Ajustable.</li>\r\n<li>batterie avec une autonomie de 24h.</li>\r\n<li>légère et élégante</li>\r\n</ul>\";s:5:\"price\";s:5:\"29.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:2:\"10\";s:3:\"img\";s:9:\"watch.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:55:22\";}i:1;a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:14:\"appareil photo\";s:4:\"desc\";s:123:\"<p>appareil photo socon </p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>fait aussi des vidéos</li>\r\n<li>précisement de 120k pixels</li>\r\n</ul>\";s:5:\"price\";s:5:\"69.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:1:\"7\";s:3:\"img\";s:10:\"camera.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:42:04\";}}'),
(5, 'grkgr', 'jgrjogrjo', '4565682222', '99.98', '2023-11-18 22:02:03', 'a:2:{i:0;a:8:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:16:\"montre connecté\";s:4:\"desc\";s:218:\"<p>montre en acier inoxidable noir connecté</p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>connecté et fonctionne sous android.</li>\r\n<li>Ajustable.</li>\r\n<li>batterie avec une autonomie de 24h.</li>\r\n<li>légère et élégante</li>\r\n</ul>\";s:5:\"price\";s:5:\"29.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:2:\"10\";s:3:\"img\";s:9:\"watch.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:55:22\";}i:1;a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:14:\"appareil photo\";s:4:\"desc\";s:123:\"<p>appareil photo socon </p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>fait aussi des vidéos</li>\r\n<li>précisement de 120k pixels</li>\r\n</ul>\";s:5:\"price\";s:5:\"69.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:1:\"7\";s:3:\"img\";s:10:\"camera.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:42:04\";}}'),
(6, 'grkgr', 'jgrjogrjo', '4565682222', '99.98', '2023-11-18 22:04:12', 'a:2:{i:0;a:8:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:16:\"montre connecté\";s:4:\"desc\";s:218:\"<p>montre en acier inoxidable noir connecté</p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>connecté et fonctionne sous android.</li>\r\n<li>Ajustable.</li>\r\n<li>batterie avec une autonomie de 24h.</li>\r\n<li>légère et élégante</li>\r\n</ul>\";s:5:\"price\";s:5:\"29.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:2:\"10\";s:3:\"img\";s:9:\"watch.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:55:22\";}i:1;a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:14:\"appareil photo\";s:4:\"desc\";s:123:\"<p>appareil photo socon </p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>fait aussi des vidéos</li>\r\n<li>précisement de 120k pixels</li>\r\n</ul>\";s:5:\"price\";s:5:\"69.99\";s:3:\"rrp\";s:4:\"0.00\";s:8:\"quantity\";s:1:\"7\";s:3:\"img\";s:10:\"camera.jpg\";s:10:\"date_added\";s:19:\"2019-03-13 17:42:04\";}}'),
(7, '', '', '', '0.00', '2023-11-19 01:42:04', ''),
(8, '', '', '', '0.00', '2023-11-19 16:33:32', ''),
(9, 'grgri', 'grojgrjooj', 'ojgrojgroj', '0.00', '2023-11-19 16:40:59', ''),
(10, '', '', '', '0.00', '2023-11-19 16:41:01', ''),
(11, 'hello', 'hello', '00000000', '0.00', '2023-11-19 16:42:03', ''),
(12, '', '', '', '0.00', '2023-11-19 16:42:06', ''),
(13, '', '', '', '0.00', '2023-11-19 16:42:07', ''),
(14, '', '', '', '0.00', '2023-11-19 16:42:08', ''),
(15, 'rogprjpgpjr', 'pjbprjgrjp', 'jpgprjgrj', '0.00', '2023-11-19 16:43:18', ''),
(16, 'rogprjpgpjr', 'pjbprjgrjp', 'jpgprjgrj', '0.00', '2023-11-19 16:48:21', ''),
(17, 'grkgrkp', 'jgprjgpj', 'pgprjrpgj', '0.00', '2023-11-19 16:48:32', ''),
(18, 'grkgrkp', 'jgprjgpj', 'pgprjrpgj', '0.00', '2023-11-19 16:49:19', ''),
(19, 'grkgrkp', 'jgprjgpj', 'pgprjrpgj', '0.00', '2023-11-19 16:49:26', ''),
(20, 'grkgrkp', 'jgprjgpj', 'pgprjrpgj', '0.00', '2023-11-19 16:55:24', ''),
(21, 'grogroj', 'jogorjgoj', 'jogrjogorj', '0.00', '2023-11-19 17:03:58', ''),
(22, 'grkgrk', 'kgpgpr', 'phthto', '0.00', '2023-11-19 17:05:46', ''),
(23, 'lhtpko', 'hotjjoht', 'dzda', '0.00', '2023-11-19 17:07:44', ''),
(24, '000000', '000000', '000000', '0.00', '2023-11-19 17:13:34', ''),
(25, '000000', '000000', '000000', '0.00', '2023-11-19 17:16:18', ''),
(26, '000000', '000000', '000000', '0.00', '2023-11-19 17:20:14', ''),
(27, '000000', '000000', '000000', '0.00', '2023-11-19 17:24:30', ''),
(28, '000000', '000000', '000000', '0.00', '2023-11-19 17:25:37', ''),
(29, '000000', '000000', '000000', '0.00', '2023-11-19 17:25:58', ''),
(30, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:26:08', ''),
(31, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:31:22', ''),
(32, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:34:01', ''),
(33, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:34:03', ''),
(34, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:34:07', ''),
(35, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:34:51', ''),
(36, 'productsDetails', 'productsDetails', 'productsDetails', '0.00', '2023-11-19 17:37:32', ''),
(37, 'tphtpk', 'pgpjhtjp', 'phtpjhtjpht', '0.00', '2023-11-19 17:39:05', ''),
(38, 'grpgprkakpgr', 'kpgrpkgpr', '48446464', '0.00', '2023-11-19 17:41:35', ''),
(39, 't\'jogrjo', 'jogrjogroj', 'grojgrjogro', '0.00', '2023-11-19 21:47:33', ''),
(40, 't\'jogrjo', 'jogrjogroj', 'grojgrjogro', '0.00', '2023-11-19 21:48:22', ''),
(41, 't\'jogrjo', 'jogrjogroj', 'grojgrjogro', '0.00', '2023-11-19 21:48:50', ''),
(42, 't\'jogrjo', 'jogrjogroj', 'grojgrjogro', '0.00', '2023-11-19 21:49:17', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'montre connecté', '<p>montre en acier inoxidable noir connecté</p>\n<h3>les +</h3>\n<ul>\n<li>connecté et fonctionne sous android.</li>\n<li>Ajustable.</li>\n<li>batterie avec une autonomie de 24h.</li>\n<li>légère et élégante</li>\n</ul>', '29.99', '0.00', 10, 'watch.jpg', '2019-03-13 17:55:22'),
(2, 'porte feuilles', '<p>Porte-feuilles en cuir noir biologique. </p>\n<h3>les +</h3>\n<ul>\n<li>Fait en cuir bio et végan</li>\n<li>16 interstices pour vos cartes</li>\n<li>design et élégant</li>\n</ul>', '14.99', '19.99', 34, 'wallet.jpg', '2019-03-13 18:52:49'),
(3, 'écouteurs', '<p>écouteurs filaire métallisés </p>\n<h3>les +</h3>\n<ul>\n<li>son 8d</li>\n<li>fonctionne sous android</li>\n<li>garanties pour 5 ans</li>\n</ul>', '19.99', '0.00', 23, 'headphones.jpg', '2019-03-13 18:47:56'),
(4, 'appareil photo', '<p>appareil photo socon</p>\r\n<h3>les +</h3>\r\n<ul>\r\n<li>fait aussi des vidéos</li>\r\n<li>précisement de 120k pixels</li>\r\n</ul>', '69.99', '0.00', 7, 'camera.jpg', '2019-03-13 17:42:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

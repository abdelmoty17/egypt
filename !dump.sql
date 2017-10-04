-- Server version: 5.7.13
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faucet`
--

-- --------------------------------------------------------

--
-- Table structure for table `bfs_actions`
--

CREATE TABLE IF NOT EXISTS `bfs_actions` (
  `a_id` int(10) unsigned NOT NULL,
  `a_type` varchar(255) NOT NULL,
  `a_ip` int(10) unsigned NOT NULL,
  `a_time` int(10) unsigned NOT NULL,
  `a_useragent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bfs_bans`
--

CREATE TABLE IF NOT EXISTS `bfs_bans` (
  `b_id` int(11) NOT NULL,
  `b_data` varchar(34) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bfs_blocks`
--

CREATE TABLE IF NOT EXISTS `bfs_blocks` (
  `b_id` int(10) unsigned NOT NULL,
  `block_page` enum('first','second','third') NOT NULL,
  `block_name` varchar(255) NOT NULL,
  `block_content` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bfs_blocks`
--

INSERT INTO `bfs_blocks` (`b_id`, `block_page`, `block_name`, `block_content`) VALUES
(1, 'first', 'bottom', '<img src="http://placehold.it/728x90?text=bottom">'),
(2, 'first', 'head', ''),
(3, 'first', 'left', '<img src="http://placehold.it/160x600?text=left">'),
(4, 'first', 'middle', '<img src="http://placehold.it/468x60?text=middle">'),
(5, 'first', 'right', '<img src="http://placehold.it/160x600?text=right">'),
(6, 'first', 'top', '<img src="http://placehold.it/300x250?text=top">\r\n<img src="http://placehold.it/300x250?text=top">'),
(7, 'second', 'bottom', '<img src="http://placehold.it/728x90">'),
(8, 'second', 'head', ''),
(9, 'second', 'left', '<img src="http://placehold.it/160x600?text=left">'),
(10, 'second', 'middle', '<img src="http://placehold.it/468x60?text=middle">'),
(11, 'second', 'right', '<img src="http://placehold.it/160x600?text=right">'),
(12, 'second', 'top', '<img src="http://placehold.it/300x250?text=top">\r\n<img src="http://placehold.it/300x250?text=top">'),
(13, 'third', 'bottom', '<img src="http://placehold.it/728x90">'),
(14, 'third', 'head', ''),
(15, 'third', 'left', '<img src="http://placehold.it/160x600?text=left">'),
(16, 'third', 'middle', '<img src="http://placehold.it/468x60?text=middle">'),
(17, 'third', 'right', '<img src="http://placehold.it/160x600?text=right">'),
(18, 'third', 'top', '<img src="http://placehold.it/300x250?text=top">\r\n<img src="http://placehold.it/300x250?text=top">');

-- --------------------------------------------------------

--
-- Table structure for table `bfs_jackpots`
--

CREATE TABLE IF NOT EXISTS `bfs_jackpots` (
  `j_id` int(10) unsigned NOT NULL,
  `j_address` varchar(34) NOT NULL,
  `j_amount` int(10) unsigned NOT NULL,
  `j_time` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bfs_payments`
--

CREATE TABLE IF NOT EXISTS `bfs_payments` (
  `p_id` int(10) unsigned NOT NULL,
  `p_referral` int(11) NOT NULL,
  `p_address` varchar(34) NOT NULL,
  `p_amount` int(10) unsigned NOT NULL,
  `p_ip` int(10) unsigned NOT NULL,
  `p_time` int(10) unsigned NOT NULL,
  `p_useragent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bfs_settings`
--

CREATE TABLE IF NOT EXISTS `bfs_settings` (
  `setting_key` varchar(255) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bfs_settings`
--

INSERT INTO `bfs_settings` (`setting_key`, `setting_value`) VALUES
('admin_login', 'admin'),
('admin_password', 'admin'),
('country_rules', '{"CN":"0.10","DE":"1.10","GB":"1.10","KZ":"0.80","RU":"0.80","UA":"0.80","US":"1.10","AP":"0.00"}'),
('faucetsystem_apikey', 'api_key'),
('footer', '<div class="container text-center" style="color: white">\nFooter code\n</div>                                        '),
('html_description', 'Free bitcoin'),
('html_keywords', 'bitcoin, satoshi, faucet'),
('html_title', 'Bitcoin faucet'),
('jackpot_amount', '1'),
('jackpot_chance', '10000'),
('jackpot_rate', '1'),
('jackpot_status', '1'),
('lag_bruteforce', '8'),
('money_reward', '{"5":"16.67","6":"41.67","7":"16.66","8":"8.33","9":"16.67"}'),
('os_iframe', '0'),
('os_lc', '1'),
('recaptcha_secretkey', '6Ldb0CATAAAHnw1Kv'),
('recaptcha_sitekey', '6Ldb0CATAA5mR7m5qhZ'),
('recaptcha_status', '1'),
('referral_commission', '12'),
('referral_status', '1'),
('solvemedia_ckey', 'q2623cjzKvMiixQsv71'),
('solvemedia_hkey', 'bo.B1rstxrvuZmwT2r8i'),
('solvemedia_status', '1'),
('solvemedia_vkey', 'WCBo.IVsM5Y4YSZ4'),
('system_bg', 'ticks.png'),
('system_color', '#ffffff'),
('system_template', 'default'),
('timer_first', '10'),
('timer_global', '10'),
('timer_second', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bfs_actions`
--
ALTER TABLE `bfs_actions`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `a_type` (`a_type`),
  ADD KEY `a_ip` (`a_ip`);

--
-- Indexes for table `bfs_bans`
--
ALTER TABLE `bfs_bans`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `b_data` (`b_data`) USING BTREE;

--
-- Indexes for table `bfs_blocks`
--
ALTER TABLE `bfs_blocks`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `block_page` (`block_page`);

--
-- Indexes for table `bfs_jackpots`
--
ALTER TABLE `bfs_jackpots`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `bfs_payments`
--
ALTER TABLE `bfs_payments`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `p_ip` (`p_ip`),
  ADD KEY `p_address` (`p_address`),
  ADD KEY `p_referral` (`p_referral`);

--
-- Indexes for table `bfs_settings`
--
ALTER TABLE `bfs_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bfs_actions`
--
ALTER TABLE `bfs_actions`
  MODIFY `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bfs_bans`
--
ALTER TABLE `bfs_bans`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bfs_blocks`
--
ALTER TABLE `bfs_blocks`
  MODIFY `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `bfs_jackpots`
--
ALTER TABLE `bfs_jackpots`
  MODIFY `j_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bfs_payments`
--
ALTER TABLE `bfs_payments`
  MODIFY `p_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

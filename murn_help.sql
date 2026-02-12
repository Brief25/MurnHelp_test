-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2025 at 10:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `murn_help`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `msg_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `messages` varchar(100) NOT NULL,
  `post_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`msg_id`, `name`, `email`, `subject`, `messages`, `post_at`) VALUES
(1, 'virendra', 'virendra@gmail.com', '', 'Test-1', '2025-08-23 01:42:17'),
(2, 'EVA', 'eva@gmail.com', '', 'Test-2', '2025-09-06 08:26:46'),
(3, 'EVA', 'thetaniya@proton.me', '', 'Final Test', '2025-09-06 10:27:51'),
(12, 'tghdf', 'near6533@gmail.com', '', 'fdgdgh', '2025-11-29 23:52:14'),
(13, 'Test', 'Test@gmail.com', 'Test', 'Test - 1', '2025-11-30 00:14:06'),
(14, 'virendra1', 'virendrakharez2455540005@gmail.com', 'Test-5', 'Test 5', '2025-12-01 05:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `crimsonsubscribers`
--

CREATE TABLE `crimsonsubscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crimsonsubscribers`
--

INSERT INTO `crimsonsubscribers` (`id`, `email`, `created_at`) VALUES
(1, 'near6533@gmail.com', '2025-12-01 05:49:59'),
(2, 'eva@gmail.com', '2025-12-01 05:53:06'),
(3, 'thetaniya@proton.me', '2025-12-01 05:57:39'),
(4, 'Test@gmail.com', '2025-12-01 06:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `sr_no` int(10) NOT NULL,
  `content_id` varchar(20) NOT NULL,
  `thumbnail_link` varchar(50) NOT NULL,
  `screenshot_link` varchar(50) NOT NULL,
  `content_link` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`sr_no`, `content_id`, `thumbnail_link`, `screenshot_link`, `content_link`, `status`) VALUES
(1, '7', 'https://ik.imagekit.io/th8xabiur/ca954a7becc4a6d27', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monochromesubscribers`
--

CREATE TABLE `monochromesubscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monochromesubscribers`
--

INSERT INTO `monochromesubscribers` (`id`, `email`, `created_at`) VALUES
(1, 'virendrakharez20005@gmail.com', '2025-12-01 06:21:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`msg_id`),
  ADD UNIQUE KEY `email` (`email`);
ALTER TABLE `comments` ADD FULLTEXT KEY `email_2` (`email`);

--
-- Indexes for table `crimsonsubscribers`
--
ALTER TABLE `crimsonsubscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `monochromesubscribers`
--
ALTER TABLE `monochromesubscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `crimsonsubscribers`
--
ALTER TABLE `crimsonsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `sr_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `monochromesubscribers`
--
ALTER TABLE `monochromesubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

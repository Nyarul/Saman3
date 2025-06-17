-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 09:29 AM
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
-- Database: `umt_transport_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `summons`
--

CREATE TABLE `summons` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `issued_by` int(11) NOT NULL,
  `violation_type` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` enum('issued','paid','appealed') DEFAULT 'issued',
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `summons`
--

INSERT INTO `summons` (`id`, `vehicle_id`, `issued_by`, `violation_type`, `location`, `amount`, `status`, `issued_at`, `paid_at`) VALUES
(1, 3, 2001, 'Speeding', 'ks', 50.00, 'appealed', '2025-06-12 07:04:11', NULL),
(2, 3, 2001, 'No Vehicle Sticker', 'pusat kuliah', 50.00, 'paid', '2025-06-12 07:05:14', NULL),
(4, 3, 2001, 'No Vehicle Sticker', 'pusat islam', 50.00, 'paid', '2025-06-12 07:57:38', NULL),
(5, 3, 2001, 'Speeding', 'dpn cu mart', 50.00, 'paid', '2025-06-12 10:12:12', NULL),
(6, 3, 2001, 'Illegal Parking', 'ks', 50.00, 'paid', '2025-06-12 15:21:29', NULL),
(7, 5, 2002, 'Speeding', 'dpn cu mart', 50.00, 'paid', '2025-06-12 15:41:38', NULL),
(8, 3, 2001, 'Speeding', 'dpn cu mart', 50.00, 'appealed', '2025-06-13 08:24:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `matric_no` varchar(20) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `role` enum('student','staff','admin') NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `matric_no`, `staff_id`, `role`, `password`, `full_name`, `email`, `phone`, `created_at`) VALUES
(2001, NULL, 'S01', 'staff', 'staf123', 'jamal', 'staf1@umt.edu.my', '088', '2025-06-11 16:19:07'),
(2002, NULL, 'S02', 'staff', 'staf123', 'ali imran', 'staf2@umt.edu.my', '0134627215', '2025-06-12 15:39:31'),
(10000001, NULL, 'A01', 'admin', 'admin123', 'mekwa', 'admin1@umt.edu.my', '010000000', '2025-06-11 15:49:33'),
(10000002, 's70741', NULL, 'student', '1234', 'sapek ', 'sapek@umt.edu.my', '0138820640', '2025-06-11 16:15:43'),
(10000004, 's70640', NULL, 'student', '1234', 'arif kamal', 'ayep@umt.edu.my', '0112233456', '2025-06-12 15:35:23'),
(10000008, NULL, 'A02', 'admin', 'admin123', 'amyrah', 'admin2@umt.edu.my', '0134627215', '2025-06-12 15:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `user_id`, `plate_number`, `model`, `created_at`) VALUES
(3, 10000002, 'TAB119', NULL, '2025-06-11 16:15:43'),
(5, 10000004, 'KFN180', NULL, '2025-06-12 15:35:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `summons`
--
ALTER TABLE `summons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `issued_by` (`issued_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `matric_no` (`matric_no`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_number` (`plate_number`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `summons`
--
ALTER TABLE `summons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000009;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `summons`
--
ALTER TABLE `summons`
  ADD CONSTRAINT `summons_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `summons_ibfk_2` FOREIGN KEY (`issued_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

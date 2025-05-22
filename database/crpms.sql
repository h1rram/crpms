-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 08:17 PM
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
-- Database: `crpms`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `PlateNumber` varchar(20) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `ManufacturingYear` int(11) DEFAULT NULL,
  `DriverPhone` varchar(20) DEFAULT NULL,
  `MechanicName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentNumber` int(11) NOT NULL,
  `AmountPaid` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `RecordNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicerecord`
--

CREATE TABLE `servicerecord` (
  `RecordNumber` int(11) NOT NULL,
  `ServiceDate` date NOT NULL,
  `PlateNumber` varchar(20) DEFAULT NULL,
  `ServiceCode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ServiceCode` varchar(20) NOT NULL,
  `ServiceName` varchar(100) NOT NULL,
  `ServicePrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ServiceCode`, `ServiceName`, `ServicePrice`) VALUES
('001', 'Engine Repair', 150000.00),
('002', 'Transmission Repair', 80000.00),
('003', 'Oil Change', 60000.00),
('004', 'Chain Replacement', 40000.00),
('005', 'Disc Replacement', 400000.00),
('006', 'Wheel Alignment', 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'user', '$2b$10$9cWp0yJVPt9uBHLeGpU86.VNy4YZuTYNGcRpe8QYRym00qoY/N0J6'),
(2, 'kizy', '$2b$10$iUK365.3cPxpFCjlfFOCd.Zt6KKFJgyEauAqtiExO1cmGTCLzAMcC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`PlateNumber`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentNumber`),
  ADD KEY `RecordNumber` (`RecordNumber`);

--
-- Indexes for table `servicerecord`
--
ALTER TABLE `servicerecord`
  ADD PRIMARY KEY (`RecordNumber`),
  ADD KEY `PlateNumber` (`PlateNumber`),
  ADD KEY `ServiceCode` (`ServiceCode`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceCode`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servicerecord`
--
ALTER TABLE `servicerecord`
  MODIFY `RecordNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`RecordNumber`) REFERENCES `servicerecord` (`RecordNumber`);

--
-- Constraints for table `servicerecord`
--
ALTER TABLE `servicerecord`
  ADD CONSTRAINT `servicerecord_ibfk_1` FOREIGN KEY (`PlateNumber`) REFERENCES `car` (`PlateNumber`),
  ADD CONSTRAINT `servicerecord_ibfk_2` FOREIGN KEY (`ServiceCode`) REFERENCES `services` (`ServiceCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

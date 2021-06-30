-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2021 at 05:00 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-boro`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `itemName` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `dateSup` date NOT NULL,
  `quantity` int(10) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `itemName`, `description`, `dateSup`, `quantity`, `balance`) VALUES
(1, 'Shuttlecock', 'Ezbuy Malaysia', '2021-06-02', 100, 78),
(2, 'Set of Petanque', 'Ubuy Malaysia', '2021-06-07', 20, 20),
(3, 'Bola Ping Pong', 'Tenryu (M) Sdn Bhd          ', '2021-06-22', 34, 3),
(4, 'Netball', 'Decathlon Malaysia', '2021-06-23', 30, 25);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `userid` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `mykad` varchar(50) NOT NULL,
  `notel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`userid`, `fullname`, `mykad`, `notel`, `email`, `username`, `password`, `lastlogin`) VALUES
(1, 'Fatin Nur Fadzilah', '980713-01-5816', '012-7762661', 'any@gmail.com', 'fatin', '12', '2021-06-22 04:19:34'),
(2, 'Khairuladha Misnan', '77777', '0192948812', 'khai.adha.rul@gmail.com', 'kirl.dha', '777', '2021-06-22 04:32:19'),
(3, 'Noor Shahira', '980630-11-5122', '0137741998', 'shahira@gmail.com', 'shahira', '12', '2021-06-22 04:32:21'),
(4, 'Syaza Nur Izzati', '980630-11-5424', '0148067823', 'syazanurizzati@gmail.com', 'syaza', '123', '2021-06-22 04:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `resID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `notel` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facilities` varchar(50) NOT NULL,
  `equipment` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(25) NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`resID`, `userid`, `fullname`, `notel`, `email`, `facilities`, `equipment`, `date`, `status`, `reason`) VALUES
(2, 1, 'fatin fadzilah', '012-7762661', 'any@gmail.com', 'Squash Court', 'Football Field', '2021-06-23', 'Reject', 'Facilities & Equipment Full Booking'),
(5, 1, 'fatin fadzilah', '012-7762661', 'any@gmail.com', 'Squash Court', 'Tennis Ball', '2021-06-25', 'Accept', 'Please come to office to pick up the equipment 1 day before the booking date'),
(6, 1, 'fatin fadzilah', '012-7762661', 'any@gmail.com', 'Badminton Court', 'Bicycle', '2021-06-24', 'Please', 'Please come to office to take receipt 1 day before the booking date'),
(8, 4, 'Syaza Nur Izzati', '0137741998', 'syazanurizzati@gmail.com', 'Netball Court', '', '2021-06-30', 'Accept', 'Please come to office to take receipt 1 day before the booking date'),
(9, 4, 'Syaza Nur Izzati', '0148067823', 'syazanurizzati@gmail.com', '', 'Table Tennis', '2021-07-10', 'Accept', 'Please come to office to pick up the equipment 1 day before the booking date'),
(10, 4, 'Syaza Nur Izzati', '0148067823', 'syazanurizzati@gmail.com', 'Netball Court', 'Tennis Ball', '2021-06-28', 'Reject', 'Facilities & Equipment Full Booking');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastlog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `username`, `password`, `lastlog`) VALUES
(1, 'fatin', '1234', '2021-06-18 20:22:24'),
(2, 'syaza', '1234', '2021-06-18 20:50:28'),
(3, 'adha', '123', '2021-06-19 23:37:21'),
(4, 'shira', '123', '2021-06-19 23:37:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`resID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `resID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

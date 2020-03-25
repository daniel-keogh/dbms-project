-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2020 at 10:46 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mulcahy_dental`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `booking_method` enum('online','post','phone','drop-in','follow-up') NOT NULL,
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `date`, `booking_method`, `cancelled`) VALUES
(1, 1, '2020-03-13 10:00:00', 'phone', 0),
(2, 2, '2020-03-13 13:00:00', 'phone', 0),
(3, 3, '2020-03-16 15:00:00', 'phone', 0),
(4, 4, '2020-03-16 17:00:00', 'post', 1),
(5, 5, '2020-03-17 10:00:00', 'online', 0),
(6, 6, '2020-03-17 11:00:00', 'drop-in', 0),
(7, 7, '2020-03-17 13:00:00', 'drop-in', 0),
(8, 8, '2020-03-17 15:00:00', 'drop-in', 1),
(9, 9, '2020-03-18 10:00:00', 'drop-in', 0),
(10, 10, '2020-04-06 10:00:00', 'drop-in', 0),
(11, 11, '2020-04-06 11:00:00', 'online', 0),
(12, 12, '2020-04-06 12:00:00', 'online', 0),
(13, 13, '2020-04-07 09:40:00', 'phone', 0),
(14, 14, '2020-04-13 10:00:00', 'post', 0),
(15, 15, '2020-04-13 11:00:00', 'online', 0),
(16, 16, '2020-04-13 15:00:00', 'phone', 0),
(17, 17, '2020-04-14 13:00:00', 'online', 0),
(18, 18, '2020-04-14 14:00:00', 'online', 0),
(19, 19, '2020-04-14 15:00:00', 'phone', 0),
(20, 20, '2020-04-15 09:00:00', 'phone', 0),
(21, 8, '2020-04-16 10:00:00', 'follow-up', 0),
(22, 9, '2020-04-16 11:00:00', 'follow-up', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_issued` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `type` enum('Appointment','Late Cancellation Fee') DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `appointment_id` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `date_issued`, `amount_due`, `appointment_id`, `type`) VALUES
(1, '2020-03-16', '100.00', 1, 'Appointment'),
(2, '2020-03-16', '25.00', 2, 'Appointment'),
(3, '2020-03-23', '75.00', 3, 'Appointment'),
(4, '2020-03-23', '100.00', 4, 'Late Cancellation Fee'),
(5, '2020-03-23', '25.00', 5, 'Appointment'),
(6, '2020-03-23', '75.00', 6, 'Appointment'),
(7, '2020-03-23', '100.00', 7, 'Appointment'),
(8, '2020-03-23', '200.00', 8, 'Late Cancellation Fee'),
(9, '2020-03-23', '75.00', 9, 'Appointment');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `amount_owed` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `dob`, `phone_no`, `email`, `amount_owed`, `last_update`) VALUES
(1, 'John Smith', '1986-09-13', '0877763497', 'jsmith@gmail.com', '150.00', '2020-03-25 22:43:14'),
(2, 'Conor Mahoney', '1973-03-06', '0862060791', 'cmahoney@outlook.com', '70.50', '2020-03-25 22:43:14'),
(3, 'Michael McDonnell', '1980-03-18', '0858127963', 'mmcdonnell@gmail.com', '0.00', '2020-03-25 22:43:14'),
(4, 'Brendan Shannon', '1970-03-02', '0832055117', 'bshannon@gmail.com', '50.00', '2020-03-25 22:43:14'),
(5, 'Ellen Malone', '1991-05-12', '0875872036', 'emalone@gmail.com', '0.00', '2020-03-25 22:43:14'),
(6, 'Carmel Flanagan', '1987-10-22', '0875904954', 'cflanagan@ymail.com', '0.00', '2020-03-25 22:43:14'),
(7, 'Maureen Gallagher', '1983-04-05', '0866041827', 'mgallagher@gmail.com', '130.00', '2020-03-25 22:43:14'),
(8, 'Kieran McEvoy', '1995-02-07', '0831608656', 'kmcevoy@outlook.com', '0.00', '2020-03-25 22:43:14'),
(9, 'Jacinta Quinlan', '1973-06-23', '0851843925', 'jquinlan@gmail.com', '300.00', '2020-03-25 22:43:14'),
(10, 'Rory McMillan', '1988-06-12', '0877826427', 'rmcmillan@outlook.com', '0.00', '2020-03-25 22:43:14'),
(11, 'Michael Curren', '1981-10-27', '0859471427', 'mcurran@gmail.com', '0.00', '2020-03-25 22:43:14'),
(12, 'Dervla Brennan', '1962-04-30', '0879048926', 'dbrennan@gmail.com', '75.00', '2020-03-25 22:43:14'),
(13, 'Margaret Joyce', '1991-03-22', '0872352674', 'mjoyce@gmail.com', '50.00', '2020-03-25 22:43:14'),
(14, 'Dermot Shannon', '1994-09-19', '0831974682', 'dshannon@outlook.com', '0.00', '2020-03-25 22:43:14'),
(15, 'Patricia Callaghan', '1978-06-22', '0868739053', 'pcallaghan@gmail.com', '20.75', '2020-03-25 22:43:14'),
(16, 'Keira Jackson', '1975-04-24', '087907432', 'kjackson@gmail.com', '75.00', '2020-03-25 22:43:14'),
(17, 'Patrick Harvey', '1991-12-18', '0872365692', 'pharvey@gmail.com', '50.00', '2020-03-25 22:43:14'),
(18, 'Joshua Pearson', '1969-07-29', '0831978264', 'jpearson@outlook.com', '0.00', '2020-03-25 22:43:14'),
(19, 'Ella Foster', '1990-11-12', '0858339743', 'efoster@gmail.com', '0.00', '2020-03-25 22:43:14'),
(20, 'Callum Murphy', '1991-01-02', '0857294212', 'cmurphy@gmail.com', '0.00', '2020-03-25 22:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `payment_method` enum('cash','card','cheque') NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `bill_id`, `payment_method`) VALUES
(1, 1, 'card'),
(2, 2, 'cash'),
(3, 3, 'card'),
(4, 4, 'cheque'),
(5, 5, 'card'),
(6, 6, 'cheque'),
(7, 7, 'card'),
(8, 8, 'cheque'),
(9, 9, 'card');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
CREATE TABLE IF NOT EXISTS `specialist` (
  `specialist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`specialist_id`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`specialist_id`, `name`, `address`, `phone_no`, `email`, `specialty`) VALUES
(1, 'ABC Dental', '123 Fake St., Oranmore, Co. Galway', '0919157266', 'abc@dental.ie', 'Orthodontics'),
(2, '123 Dental', '123 Fake St., Loughrea, Co. Galway', '0914238729', '123@dental.ie', 'Periodontics');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `xray` longblob,
  `xray_path` varchar(100) DEFAULT NULL,
  `follow_up` int(10) UNSIGNED DEFAULT NULL,
  `referral` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `follow_up` (`follow_up`),
  KEY `referral` (`referral`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`follow_up`) REFERENCES `appointment` (`appointment_id`),
  ADD CONSTRAINT `treatment_ibfk_3` FOREIGN KEY (`referral`) REFERENCES `specialist` (`specialist_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

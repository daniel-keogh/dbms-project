-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 22, 2020 at 09:33 PM
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
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `booking_method` enum('online','post','phone','drop-in') NOT NULL,
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `patient_id`, `date`, `booking_method`, `cancelled`) VALUES
(1, 9, '2020-03-12 15:00:00', 'online', 0),
(2, 7, '2020-03-13 11:00:00', 'post', 1),
(3, 5, '2020-03-14 09:40:00', 'phone', 0),
(4, 3, '2020-04-15 12:30:00', 'online', 0),
(5, 1, '2020-04-16 13:00:00', 'drop-in', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_issued` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `type` set('Appointment','Late Cancellation Fee') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `date_issued`, `amount_due`, `appointment_id`, `type`) VALUES
(1, '2020-03-12', '100.00', 1, 'Appointment'),
(2, '2020-03-13', '200.00', 2, 'Late Cancellation Fee'),
(3, '2020-03-14', '75.00', 3, 'Appointment');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `amount_owed` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `dob`, `phone_no`, `email`, `amount_owed`, `last_update`) VALUES
(1, 'John Smith', '1986-09-13', '(087) 7763497', 'jsmith@gmail.com', '150.00', '2019-12-18 13:10:00'),
(2, 'Conor Mahoney', '1973-03-06', '(086) 2060791', 'cmahoney@outlook.com', '70.50', '2020-02-01 15:15:00'),
(3, 'Michael McDonnell', '1980-03-18', '(085) 8127963', 'mmcdonnell@gmail.com', '0.00', '2015-04-10 12:00:00'),
(4, 'Brendan Shannon', '1970-03-02', '(083) 2055117', 'bshannon@gmail.com', '50.00', '2019-03-02 13:00:00'),
(5, 'Ellen Malone', '1991-05-12', '(087) 5872036', 'emalone@gmail.com', '0.00', '2018-07-18 12:00:00'),
(6, 'Carmel Flanagan', '1987-10-22', '(087) 5904954', 'cflanagan@ymail.com', '0.00', '2019-09-27 12:00:00'),
(7, 'Maureen Gallagher', '1983-04-05', '(086) 6041827', 'mgallagher@gmail.com', '130.00', '2020-01-21 13:00:00'),
(8, 'Kieran McEvoy', '1995-02-07', '(083) 1608656', 'kmcevoy@outlook.com', '0.00', '2017-03-08 13:00:00'),
(9, 'Jacinta Quinlan', '1973-06-23', '(085) 1843925', 'jquinlan@gmail.com', '300.00', '2019-10-22 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `payment_method` enum('cash','card','cheque') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_id` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `bill_id`, `payment_method`) VALUES
(1, 1, 'card'),
(2, 2, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
CREATE TABLE IF NOT EXISTS `specialist` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`id`, `name`, `address`, `phone_no`, `email`) VALUES
(1, 'ABC Dental', '123 Fake St., Oranmore, Co. Galway', '(091) 915 7266', 'abc@dental.ie');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `appointment_card` longblob NOT NULL,
  `appointment_card_path` varchar(50) NOT NULL,
  `image` longblob,
  `image_path` varchar(50) DEFAULT NULL,
  `follow_up` int(10) UNSIGNED DEFAULT NULL,
  `referral` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `follow_up` (`follow_up`),
  KEY `referral` (`referral`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`follow_up`) REFERENCES `appointment` (`id`),
  ADD CONSTRAINT `treatment_ibfk_3` FOREIGN KEY (`referral`) REFERENCES `specialist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

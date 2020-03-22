DROP DATABASE IF EXISTS `mulcahy_dental`;
CREATE DATABASE `mulcahy_dental`;
USE `mulcahy_dental`;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `booking_method` enum('online','post','phone','drop-in') NOT NULL,
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_issued` date NOT NULL,
  `amount_due` float NOT NULL,
  `appointment_id` int(10) NOT NULL,
  `type` set('Appointment', 'Late Cancellation Fee'),
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `amount_owed` float NOT NULL DEFAULT 0,
  `last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) NOT NULL,
  `payment_method` enum('cash','card','cheque') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` int(10) NOT NULL,
  `appointment_card` longblob NOT NULL,
  `appointment_card_path` varchar(50) NOT NULL,
  `image` longblob DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `follow_up` int(10) DEFAULT NULL,
  `referral` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) COLLATE utf8mb4_general_ci, ENGINE=InnoDB;

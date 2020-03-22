DROP DATABASE IF EXISTS `mulcahy_dental`;
CREATE DATABASE `mulcahy_dental`;
USE `mulcahy_dental`;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL UNIQUE,
  `email` varchar(50) NOT NULL UNIQUE,
  `amount_owed` decimal(10,2) NOT NULL DEFAULT 0,
  `last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `patient` VALUES 
(1, 'John Smith', '1986-09-13', '(087) 7763497', 'jsmith@gmail.com', '150.00', '2019-12-18 13:10:00'),
(2, 'Conor Mahoney', '1973-03-06', '(086) 2060791', 'cmahoney@outlook.com', '70.50', '2020-02-01 15:15:00'),
(3, 'Michael McDonnell', '1980-03-18', '(085) 8127963', 'mmcdonnell@gmail.com', '0.00', '2015-04-10 13:00:00'),
(4, 'Brendan Shannon', '1970-03-02', '(083) 2055117', 'bshannon@gmail.com', '50.00', '2019-03-02 13:00:00'),
(5, 'Ellen Malone', '1991-05-12', '(087) 5872036', 'emalone@gmail.com', '0.00', '2018-07-18 13:00:00'),
(6, 'Carmel Flanagan', '1987-10-22', '(087) 5904954', 'cflanagan@ymail.com', '0.00', '2019-09-27 13:00:00'),
(7, 'Maureen Gallagher', '1983-04-05', '(086) 6041827', 'mgallagher@gmail.com', '130.00', '2020-01-21 13:00:00'),
(8, 'Kieran McEvoy', '1995-02-07', '(083) 1608656', 'kmcevoy@outlook.com', '0.00', '2017-03-08 13:00:00'),
(9, 'Jacinta Quinlan', '1973-06-23', '(085) 1843925', 'jquinlan@gmail.com', '300.00', '2019-10-22 13:00:00');


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
  CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES `patient`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `appointment` VALUES
(1, 9, '2020-03-12 15:00:00', 'online', '0'),
(2, 7, '2020-03-13 11:00:00', 'post', '1'),
(3, 5, '2020-03-14 09:40:00', 'phone', '0'),
(4, 3, '2020-04-15 12:30:00', 'online', '0'),
(5, 1, '2020-04-16 13:00:00', 'drop-in', '0');


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
  `type` set('Appointment', 'Late Cancellation Fee'),
  PRIMARY KEY(`id`),
  CONSTRAINT FOREIGN KEY(`appointment_id`) REFERENCES `appointment`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `bill` VALUES
(1, '2020-03-12', 100, 1, 'Appointment'),
(2, '2020-03-13', 200, 2, 'Late Cancellation Fee'),
(3, '2020-03-14', 75, 3, 'Appointment');


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
  CONSTRAINT FOREIGN KEY(`bill_id`) REFERENCES `bill`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `payment` VALUES
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
  `address` varchar(100) NOT NULL UNIQUE,
  `phone_no` varchar(20) NOT NULL UNIQUE,
  `email` varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `specialist` VALUES
(1, "ABC Dental", "123 Fake St., Oranmore, Co. Galway", '(091) 915 7266', 'abc@dental.ie');


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
  `image` longblob DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `follow_up` int(10) UNSIGNED DEFAULT NULL,
  `referral` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FOREIGN KEY(`appointment_id`) REFERENCES `appointment`(`id`),
  CONSTRAINT FOREIGN KEY(`follow_up`) REFERENCES `appointment`(`id`),
  CONSTRAINT FOREIGN KEY(`referral`) REFERENCES `specialist`(`id`)
) COLLATE utf8mb4_general_ci, ENGINE=InnoDB;

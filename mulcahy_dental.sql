DROP DATABASE IF EXISTS `mulcahy_dental`;
CREATE DATABASE `mulcahy_dental` CHARACTER SET utf8mb4 COLLATE utf8mb4_GENERAL_CI;
USE `mulcahy_dental`;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` varchar(20) NOT NULL UNIQUE,
  `email` varchar(100) NOT NULL UNIQUE,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB;


INSERT INTO `patient` VALUES 
(1, 'John Smith', '1986-09-13', '0877763497', 'jsmith@gmail.com'),
(2, 'Conor Mahoney', '1973-03-06', '0862060791', 'cmahoney@outlook.com'),
(3, 'Michael McDonnell', '1980-03-18', '0858127963', 'mmcdonnell@gmail.com'),
(4, 'Brendan Shannon', '1970-03-02', '0832055117', 'bshannon@gmail.com'),
(5, 'Ellen Malone', '1991-05-12', '0875872036', 'emalone@gmail.com'),
(6, 'Carmel Flanagan', '1987-10-22', '0875904954', 'cflanagan@ymail.com'),
(7, 'Maureen Gallagher', '1983-04-05', '0866041827', 'mgallagher@gmail.com'),
(8, 'Kieran McEvoy', '1995-02-07', '0831608656', 'kmcevoy@outlook.com'),
(9, 'Jacinta Quinlan', '1973-06-23', '0851843925', 'jquinlan@gmail.com'),
(10, 'Rory McMillan', '1988-06-12', '0877826427', 'rmcmillan@outlook.com'),
(11, 'Michael Curren', '1981-10-27', '0859471427', 'mcurran@gmail.com'),
(12, 'Dervla Brennan', '1962-04-30', '0879048926', 'dbrennan@gmail.com'),
(13, 'Margaret Joyce', '1991-03-22', '0872352674', 'mjoyce@gmail.com'),
(14, 'Dermot Shannon', '1994-09-19', '0831974682', 'dshannon@outlook.com'),
(15, 'Patricia Callaghan', '1978-06-22', '0868739053', 'pcallaghan@gmail.com'),
(16, 'Keira Jackson', '1975-04-24', '087907432', 'kjackson@gmail.com'),
(17, 'Patrick Harvey', '1991-12-18', '0872365692', 'pharvey@gmail.com'),
(18, 'Joshua Pearson', '1969-07-29', '0831978264', 'jpearson@outlook.com'),
(19, 'Ella Foster', '1990-11-12', '0858339743', 'efoster@gmail.com'),
(20, 'Callum Murphy', '1991-01-02', '0857294212', 'cmurphy@gmail.com');


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
  CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES `patient`(`patient_id`)
) ENGINE=InnoDB;


INSERT INTO `appointment` VALUES

(1, 1, '2020-03-13 10:00:00', 'phone', '0'),
(2, 2, '2020-03-13 13:00:00', 'phone', '0'),
(3, 3, '2020-03-16 15:00:00', 'phone', '0'),
(4, 4, '2020-03-16 17:00:00', 'post', '1'),
(5, 5, '2020-03-17 10:00:00', 'online', '0'),
(6, 6, '2020-03-17 11:00:00', 'drop-in', '0'),
(7, 7, '2020-03-17 13:00:00', 'drop-in', '0'),
(8, 8, '2020-03-17 15:00:00', 'drop-in', '1'),
(9, 9, '2020-03-18 10:00:00', 'drop-in', '0'),
(10, 10, '2020-04-06 10:00:00', 'drop-in', '0'),
(11, 11, '2020-04-06 11:00:00', 'online', '0'),
(12, 12, '2020-04-06 12:00:00', 'online', '0'),
(13, 13, '2020-04-07 09:40:00', 'phone', '0'),
(14, 14, '2020-04-13 10:00:00', 'post', '0'),
(15, 15, '2020-04-13 11:00:00', 'online', '0'),
(16, 16, '2020-04-13 15:00:00', 'phone', '0'),
(17, 17, '2020-04-14 13:00:00', 'online', '0'),
(18, 18, '2020-04-14 14:00:00', 'online', '0'),
(19, 19, '2020-04-14 15:00:00', 'phone', '0'),
(20, 20, '2020-04-15 09:00:00', 'phone', '0');


-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_issued` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `type` enum('Appointment', 'Late Cancellation Fee'),
  PRIMARY KEY(`bill_id`),
  CONSTRAINT FOREIGN KEY(`patient_id`) REFERENCES `patient`(`patient_id`),
  CONSTRAINT FOREIGN KEY(`appointment_id`) REFERENCES `appointment`(`appointment_id`)
) ENGINE=InnoDB;


INSERT INTO `bill` VALUES
(1, '2020-03-16', '100.00', 1, 1, 'Appointment'),
(2, '2020-03-16', '100.00', 2, 2, 'Appointment'),
(3, '2020-03-23', '75.00', 3, 3, 'Appointment'),
(4, '2020-03-23', '50.00', 4, 4, 'Late Cancellation Fee'),
(5, '2020-03-23', '25.00', 5, 5, 'Appointment'),
(6, '2020-03-23', '75.00', 6, 6, 'Appointment'),
(7, '2020-03-23', '50.00', 7, 7, 'Appointment'),
(8, '2020-03-23', '75.00', 8, 8, 'Late Cancellation Fee'),
(9, '2020-03-23', '50.00', 9, 9, 'Appointment');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `amount_payed` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','card','cheque') NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT FOREIGN KEY(`bill_id`) REFERENCES `bill`(`bill_id`)
) ENGINE=InnoDB;


INSERT INTO `payment` VALUES
(1, 1, '25.00', 'cheque', '2020-03-17'),
(2, 2, '25.00', 'cheque', '2020-03-17'),
(3, 3, '75.00', 'card', '2020-03-17'),
(4, 4, '50.00', 'card', '2020-03-23'),
(5, 5, '25.00', 'card', '2020-03-23'),
(6, 6, '75.00', 'cheque', '2020-03-23'),
(7, 7, '50.00', 'card', '2020-03-23'),
(8, 8, '75.00', 'cash', '2020-03-23'),
(9, 9, '50.00', 'cheque', '2020-03-23'),
(10, 1, '25.00', 'cheque', '2020-03-24'),
(11, 2, '25.00', 'cheque', '2020-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
CREATE TABLE IF NOT EXISTS `specialist` (
  `specialist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL UNIQUE,
  `email` varchar(100) NOT NULL UNIQUE,
  `specialty` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`specialist_id`)
) ENGINE=InnoDB;


INSERT INTO `specialist` VALUES
(1, "ABC Dental", "123 Fake St., Oranmore, Co. Galway", '091915726', 'abc@dental.ie', 'Orthodontics'),
(2, "123 Dental", "123 Fake St., Loughrea, Co. Galway", '091423829', '123@dental.ie', 'Periodontics');


-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `xray` longblob DEFAULT NULL,
  `xray_path` varchar(100) DEFAULT NULL,
  `referral` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  CONSTRAINT FOREIGN KEY(`appointment_id`) REFERENCES `appointment`(`appointment_id`),
  CONSTRAINT FOREIGN KEY(`referral`) REFERENCES `specialist`(`specialist_id`)
) ENGINE=InnoDB;


INSERT INTO `treatment` VALUES
(1, 1, load_file('c:/xrays/app_1/xray.jpg'), '/xrays/app_1/xray.jpg', 1),
(2, 2, load_file('c:/xrays/app_2/xray.jpg'), '/xrays/app_2/xray.jpg', NULL),
(3, 3, load_file('c:/xrays/app_3/xray.jpg'), '/xrays/app_3/xray.jpg', 2),
(4, 4, load_file('c:/xrays/app_4/xray.jpg'), '/xrays/app_4/xray.jpg', NULL),
(5, 5, load_file('c:/xrays/app_5/xray.jpg'), '/xrays/app_5/xray.jpg', 1),
(6, 6, load_file('c:/xrays/app_6/xray.jpg'), '/xrays/app_6/xray.jpg', NULL),
(7, 7, load_file('c:/xrays/app_7/xray.jpg'), '/xrays/app_7/xray.jpg', 2),
(8, 8, load_file('c:/xrays/app_8/xray.jpg'), '/xrays/app_8/xray.jpg', NULL),
(9, 9, load_file('c:/xrays/app_9/xray.jpg'), '/xrays/app_9/xray.jpg', NULL);

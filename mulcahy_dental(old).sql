DROP DATABASE IF EXISTS `Mulcahy_Dental`;
SHOW DATABASES;
CREATE DATABASE `Mulcahy_Dental`;
USE `Mulcahy_Dental`;
SHOW TABLES;


DROP TABLE IF EXISTS `Appointments`;
CREATE TABLE `Appointments` (
    `ID` INT(10) NOT NULL AUTO_INCREMENT,
    `Date` DATETIME NOT NULL,
    `Booking` ENUM('On-line','Post','Phone','Drop-in') NOT NULL,
    `Cancelled` BOOLEAN NOT NULL DEFAULT 0,
    `Follow Up` DATETIME DEFAULT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB;


DROP TABLE IF EXISTS `Patient`;
CREATE TABLE `Patient` (
    `ID` INT(10) NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(40) NOT NULL,
    `DOB` DATE DEFAULT NULL,
    `Last Appointment` Date DEFAULT NULL,
    `Amt Owed` FLOAT DEFAULT 0,
    PRIMARY KEY (`ID`),
) ENGINE = InnoDB;


DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
    `ID` INT(10) NOT NULL AUTO_INCREMENT,
    `Amount` FLOAT DEFAULT 0,
    `Payment Type` ENUM ('Cash','Card','Cheque'),
    `Patient ID`,
    FOREIGN KEY (`Patient ID`) REFERENCES `Patient`(`ID`),
    PRIMARY KEY(`ID`)
) ENGINE = InnoDB;


DROP TABLE IF EXISTS `Bill`;
CREATE TABLE `Bill` (
    `ID` INT(10) NOT NULL AUTO_INCREMENT,
    `Date` DATE NOT NULL,
    `Amount` FLOAT NOT NULL,
    `Patient ID`,
    `Appointment ID`,
    FOREIGN KEY (`Patient ID`) REFERENCES `Patient`(`ID`),
    FOREIGN KEY (`Appointment ID`) REFERENCES `Appointment`(`ID`),
    PRIMARY KEY(`ID`)
) ENGINE = InnoDB;


-- DROP TABLE IF EXISTS `Specialist`;
-- CREATE TABLE `Specialist` (
    
-- ) ENGINE = InnoDB;


-- DROP TABLE IF EXISTS `Treatment`;
-- CREATE TABLE `Treatment` (
    
-- ) ENGINE = InnoDB;

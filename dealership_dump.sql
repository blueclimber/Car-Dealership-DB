CREATE DATABASE  IF NOT EXISTS `dealership` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dealership`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dealership
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (801,'121 Foo Road','Foo City','PA','84000'),(802,'17 My Road','My City','PA','95000'),(803,'1782 Place Road','Place City','PA','11000'),(804,'42 Dealership Place','Stanton','PA','98765'),(805,'77 Dealership Road','Place City','PA','11000'),(806,'1254 Dealership Parkway','Foo City','PA','84000'),(807,'27 4th Street','Foo City','PA','84000'),(808,'18 127th Ave','Stanton','PA','98765'),(809,'485 6th St #B','Place City','PA','11000');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address_id` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (100,1101,'James','Jameson',801,'777-777-7777','james@james.com'),(200,1101,'George','Georgeson',809,'999-999-9999','george@george.com'),(300,1103,'Molly','Mollyson',808,'101-101-1010','molly@molly.com'),(301,1103,'Harry','Mollyson',808,NULL,NULL),(302,1103,'Sally','Mollyson',808,'101-101-2000','sally@molly.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `supervisor_id` int DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) NOT NULL,
  `commission` decimal(5,2) DEFAULT NULL,
  `emp_status` varchar(50) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `ssn` varchar(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `hire_date` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_num` varchar(20) NOT NULL,
  `qtr_sales` decimal(10,2) DEFAULT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `address_id` (`address_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1101,'Foo','Johnson',NULL,'Sales',150000.00,500.00,'full-time',802,'111-11-1111','2000-05-12','2023-06-07','foo@foo.com','121-122-1212',5.00,1),(1102,'Chad','Smith',NULL,'Human Resources',120000.00,0.00,'part-time',801,'222-22-2222','2001-06-11','2023-06-07','my@my.com','232-232-2323',0.00,2),(1103,'Sally','Brown',1101,'Sales',160000.00,750.00,'full-time',803,'333-33-3333','2002-04-08','2020-08-08','place@place.com','343-345-3434',7.00,1),(1104,'Tom','Hanks',1102,'Human Resources',63000.00,0.00,'part-time',807,'123-35-5678','1987-03-17','2021-09-01','this@that.com','343-345-5555',0.00,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL,
  `address_id` int NOT NULL,
  `capacity` int DEFAULT NULL,
  `phone_num` varchar(20) NOT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `address_id` (`address_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,805,50,'444-44-4444',1102),(2,806,40,'555-55-5555',NULL),(3,804,30,'666-66-6666',1101);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdrive`
--

DROP TABLE IF EXISTS `testdrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testdrive` (
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `location_id` int NOT NULL,
  `vin` varchar(17) NOT NULL,
  PRIMARY KEY (`customer_id`,`date_time`,`vin`),
  KEY `employee_id` (`employee_id`),
  KEY `location_id` (`location_id`),
  KEY `vin` (`vin`),
  CONSTRAINT `testdrive_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `testdrive_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `testdrive_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `testdrive_ibfk_4` FOREIGN KEY (`vin`) REFERENCES `vehicle` (`vin`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdrive`
--

LOCK TABLES `testdrive` WRITE;
/*!40000 ALTER TABLE `testdrive` DISABLE KEYS */;
INSERT INTO `testdrive` VALUES (100,1101,'2024-03-15 14:30:00',1,'12345678901234567'),(200,1101,'2024-02-02 12:30:00',2,'22222222222222222'),(300,1103,'2024-05-05 05:30:00',3,'33333333333333333'),(301,1103,'2024-05-06 09:45:00',3,'33333333333333333'),(302,1103,'2024-05-06 11:45:00',3,'33333333333333333'),(302,1103,'2024-05-06 12:45:00',1,'12345678901234567');
/*!40000 ALTER TABLE `testdrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vin` varchar(17) NOT NULL,
  `vehicle_status` varchar(50) NOT NULL,
  `title_type` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `location_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `mileage` decimal(10,2) NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`vin`),
  KEY `location_id` (`location_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `vehicletype` (`type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('12345678901234567','test-drive','clear','red',1,50000.50,106777.88,18),('22222222222222222','sold','salvage','blue',2,40000.50,90000.00,19),('33333333333333333','on-lot','junk','green',3,2000.47,200000.12,20);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletype` (
  `type_id` int NOT NULL,
  `engine_type` varchar(50) DEFAULT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `trim` varchar(50) NOT NULL,
  `prod_year` int NOT NULL,
  `mpg` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (18,'V8','Ford','Bronco','Chrome',2008,15.70),(19,'V6','Honda','Accord','Paint',2010,16.70),(20,'V4','Hyundai','Kona','Clip-On',2018,30.70);
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 14:40:26

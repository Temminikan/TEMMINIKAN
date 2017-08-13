-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: marvell_db
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1244,'tina','tina'),(1245,'mark','mark/2'),(1246,'jack','jack');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cand`
--

DROP TABLE IF EXISTS `cand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cand` (
  `cand_ID` int(4) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_No` char(25) NOT NULL,
  `DOB` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `experience` varchar(45) NOT NULL,
  `courseOfStudy` varchar(255) NOT NULL,
  PRIMARY KEY (`cand_ID`),
  UNIQUE KEY `cand_ID_UNIQUE` (`cand_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cand`
--

LOCK TABLES `cand` WRITE;
/*!40000 ALTER TABLE `cand` DISABLE KEYS */;
INSERT INTO `cand` VALUES (1,'Nina','Dombrev ','Lagos','09092345678','1990-08-12','nina@gmail.com','Msc ','6 years','Marketing'),(2,'Theophile','John ','3,Allen,Ikeja','08093456789','1988-02-12','john@gmail.com','M.sc','2 years','Engineering'),(3,'Mobola','Tina ','Ikeja','0908890234','1990-09-24','no@yahoo.com','Bsc ','9 years','Accounting');
/*!40000 ALTER TABLE `cand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_details` (
  `candidate_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_Name` varchar(45) NOT NULL,
  `last_Name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_No` char(25) NOT NULL,
  `DOB` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `courseOfStudy` varchar(255) NOT NULL,
  PRIMARY KEY (`candidate_ID`),
  UNIQUE KEY `candidate_ID_UNIQUE` (`candidate_ID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES (3,'Theophile','John ','3,Allen,Ikeja','08093456789','1988-02-12','john@gmail.com','M.sc','2 years','Engineering'),(4,'Mobola','Tina ','Ikeja','0908890234','1990-09-24','no@yahoo.com','Bsc ','9 years','Accounting'),(5,'Nina','Dombrev ','Lagos','09092345678','1990-08-12','nina@gmail.com','Msc ','6 years','Marketing'),(6,'Oyinkansola','Popoola','Ikorodu','0904567893','1987-05-29','irene@yahoo.com','Phd','7 years','Software Developing');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `company_ID` int(4) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `skill_required` varchar(255) NOT NULL,
  `vacancy` varchar(255) NOT NULL,
  `salary` char(30) NOT NULL,
  PRIMARY KEY (`company_ID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1024,'nestlenig@yahoo.com','Nestle nig ','Abuja','Manufacturing','Engineer','100900'),(1025,'blackmarket@yahoo.com','Black Marketer insurance ','Abia','Insurance','Insurance Manager','70000'),(1026,'guinessnig@yahoo.com','Guiness nig ltd ','Ikeja','Transportation','Delivery guy','67000'),(1027,'cinema@gmail.com','Cinema house ','Lagos','Customer Service','Counter guy','25000'),(1028,'aptechmeridian@gmail.com','Aptech ','Ibadan','Tutoring','Lecturer','55500');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(255) NOT NULL,
  `No_Of_Candidates` int(11) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  UNIQUE KEY `Transaction_ID_UNIQUE` (`Transaction_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1280,'Niger house',45,7200000),(1281,'Nestle nig ',1,50450),(1282,'Guiness nig ltd ',2,67000),(1283,'Nestle nig ',4,201800),(1284,'Black Marketer insurance ',5,175000),(1285,'Cinema house ',1,12500),(1286,'Cinema house ',1,12500),(1287,'Cinema house ',2,25000),(1288,'Black Marketer insurance ',2,70000);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-20 14:01:53

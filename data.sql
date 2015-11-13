-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: recursiveinc
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Current Database: `recursiveinc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `recursiveinc` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `recursiveinc`;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `empid` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  KEY `empid` (`empid`),
  CONSTRAINT `administrators_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES ('EMP0897','ayushdas'),('EMP0899','qwerty');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `assetid` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `procuredon` varchar(20) DEFAULT NULL,
  `cosprice` decimal(10,0) DEFAULT NULL,
  `modelno` varchar(20) DEFAULT NULL,
  `macid` varchar(20) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `processor` varchar(20) DEFAULT NULL,
  `storage` int(11) DEFAULT NULL,
  PRIMARY KEY (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES ('ID123','laptop','14/10/1995',45000,'IPZZ876','IBN787878',4,'pentium4',500),('ID124','laptop','14/10/1995',45000,'IPZZ876','IBN787878',4,'pentium4',500);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetsgiven`
--

DROP TABLE IF EXISTS `assetsgiven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetsgiven` (
  `assetid` varchar(20) NOT NULL DEFAULT '',
  `empid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`assetid`),
  KEY `empid` (`empid`),
  CONSTRAINT `assetsgiven_ibfk_2` FOREIGN KEY (`assetid`) REFERENCES `assets` (`assetid`),
  CONSTRAINT `assetsgiven_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetsgiven`
--

LOCK TABLES `assetsgiven` WRITE;
/*!40000 ALTER TABLE `assetsgiven` DISABLE KEYS */;
INSERT INTO `assetsgiven` VALUES ('ID124','EMP0897');
/*!40000 ALTER TABLE `assetsgiven` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptno` varchar(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `head` varchar(20) DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`deptno`),
  KEY `head` (`head`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`head`) REFERENCES `employee` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1234','INFO TECH','EMP0897',78345);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `empid` varchar(20) NOT NULL,
  `empname` varchar(30) NOT NULL,
  `married` varchar(3) NOT NULL,
  `gender` varchar(3) NOT NULL,
  `acctno` varchar(30) NOT NULL,
  `neft` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `pancard` varchar(50) NOT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`empid`),
  KEY `deptno` (`deptno`),
  KEY `post` (`post`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`post`) REFERENCES `position` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('EMP0897','Ayush Das','N','M','SBIN1245',126785901,2147483647,'NIT Calicuts','789','14/09/1995','CEO','1234'),('EMP0899','Rohit Kumar','N','M','SBIN1245',126785901,2147483647,'NIT Calicut','789','14/09/1995','CEO','1234');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empprojects`
--

DROP TABLE IF EXISTS `empprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empprojects` (
  `empid` varchar(20) DEFAULT NULL,
  `projid` varchar(20) DEFAULT NULL,
  KEY `empid` (`empid`),
  KEY `projid` (`projid`),
  CONSTRAINT `empprojects_ibfk_2` FOREIGN KEY (`projid`) REFERENCES `project` (`projid`),
  CONSTRAINT `empprojects_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empprojects`
--

LOCK TABLES `empprojects` WRITE;
/*!40000 ALTER TABLE `empprojects` DISABLE KEYS */;
INSERT INTO `empprojects` VALUES ('EMP0897','PROJ786');
/*!40000 ALTER TABLE `empprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominee`
--

DROP TABLE IF EXISTS `nominee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominee` (
  `name` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `relation` varchar(20) DEFAULT NULL,
  `empid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`empid`),
  CONSTRAINT `nominee_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `employee` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominee`
--

LOCK TABLES `nominee` WRITE;
/*!40000 ALTER TABLE `nominee` DISABLE KEYS */;
INSERT INTO `nominee` VALUES ('Rohit Kumar','14/09/2010','M','Cousin','EMP0897');
/*!40000 ALTER TABLE `nominee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `type` varchar(20) NOT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES ('CEO',1224130);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projid` varchar(20) NOT NULL,
  `projname` varchar(20) DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT NULL,
  `started` varchar(20) DEFAULT NULL,
  `deadline` varchar(20) DEFAULT NULL,
  `client` varchar(20) DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL,
  `projecthead` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`projid`),
  KEY `projecthead` (`projecthead`),
  KEY `deptno` (`deptno`),
  CONSTRAINT `project_ibfk_4` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`projecthead`) REFERENCES `employee` (`empid`),
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('PROJ786','Database development',5600000,'28/10/2015','25/12/2016','NIT CALICUT','1234','EMP0897');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-01 14:59:47

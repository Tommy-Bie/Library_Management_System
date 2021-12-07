CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `书号` varchar(15) NOT NULL,
  `书名` varchar(30) NOT NULL,
  `作者` varchar(20) DEFAULT NULL,
  `类型` varchar(15) DEFAULT NULL,
  `价格` float DEFAULT NULL,
  `出版社` varchar(45) DEFAULT NULL,
  `摘要` varchar(50) DEFAULT NULL,
  `馆藏册数` int DEFAULT NULL,
  `在馆册数` int DEFAULT NULL,
  `书架号` varchar(15) DEFAULT NULL,
  `被借次数` int DEFAULT NULL,
  PRIMARY KEY (`书号`),
  KEY `书架号_idx` (`书架号`),
  CONSTRAINT `书架号` FOREIGN KEY (`书架号`) REFERENCES `bookshelfs` (`书架号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('1','测试','测试','测试',20,'测试','测试',10,10,'C01',0),('9781224512541','机器学习','测试','测试',8,'测试','测试',10,0,'C01',0),('9787040195835','数据库系统概论（第4版）','王珊、萨师煊','计算机技术',39,'高等教育出版社','全面阐述数据库系统的基础理论、基本技术和基本方法。',10,10,'C01',0),('9787040396614','线性代数','同济大学数学系','数学',22.2,'高等教育出版社',NULL,50,50,'M01',0),('9787107185069','标准日本语','唐磊、张国强','外语',63.9,'人民教育出版社','日语入门教材',20,20,'L01',0),('9787115279460','C++Primer Plus','Stephen Prata','计算机技术',99,'人民邮电出版社','经久不衰的C++畅销经典教程',20,20,'C01',0),('9787121204418','物理光学','梁铨廷','物理学',59.9,'中国工信出版集团','系统阐述经典与现代物理光学',5,5,'P01',0),('9787302423287','机器学习','周志华','计算机技术',88,'清华大学出版社','机器学习入门教材',5,5,'C01',0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelfs`
--

DROP TABLE IF EXISTS `bookshelfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelfs` (
  `书架号` varchar(10) NOT NULL,
  `书籍类型` varchar(45) NOT NULL,
  PRIMARY KEY (`书架号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelfs`
--

LOCK TABLES `bookshelfs` WRITE;
/*!40000 ALTER TABLE `bookshelfs` DISABLE KEYS */;
INSERT INTO `bookshelfs` VALUES ('C01','计算机技术'),('L01','外语'),('M01','数学'),('P01','物理学');
/*!40000 ALTER TABLE `bookshelfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `ID` varchar(15) NOT NULL,
  `书号` varchar(15) NOT NULL,
  `借书时间` date NOT NULL,
  PRIMARY KEY (`ID`,`书号`,`借书时间`),
  KEY `书号_idx` (`书号`),
  CONSTRAINT `ID` FOREIGN KEY (`ID`) REFERENCES `readers` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `书号` FOREIGN KEY (`书号`) REFERENCES `books` (`书号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `bookid` varchar(15) NOT NULL,
  `ID` varchar(15) NOT NULL,
  `time` date NOT NULL,
  `type` enum('borrow','return') NOT NULL,
  PRIMARY KEY (`bookid`,`ID`,`time`,`type`),
  KEY `readerid_idx` (`ID`),
  CONSTRAINT `bookid` FOREIGN KEY (`bookid`) REFERENCES `books` (`书号`),
  CONSTRAINT `readerid` FOREIGN KEY (`ID`) REFERENCES `readers` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginrecord`
--

DROP TABLE IF EXISTS `loginrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginrecord` (
  `ID` varchar(15) DEFAULT NULL,
  `time` date NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`time`,`number`),
  KEY `readerid_idx` (`ID`),
  CONSTRAINT `readerid2` FOREIGN KEY (`ID`) REFERENCES `readers` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginrecord`
--

LOCK TABLES `loginrecord` WRITE;
/*!40000 ALTER TABLE `loginrecord` DISABLE KEYS */;
INSERT INTO `loginrecord` VALUES ('20200001','2020-11-29',1);
/*!40000 ALTER TABLE `loginrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `ID` varchar(15) NOT NULL,
  `姓名` varchar(20) NOT NULL,
  `性别` enum('男','女') DEFAULT NULL,
  `单位` varchar(45) DEFAULT NULL,
  `读者类型` varchar(45) DEFAULT NULL,
  `可借册数` int DEFAULT NULL,
  `在借册数` int DEFAULT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `欠款` float DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES ('20200001','张三','男','研究生一队','研究生学员',20,0,'123456',0),('20200002','李四','男','研究生一队','研究生学员',20,0,'123456',0),('20200003','王五','男','学员十五队','本科学员',20,5,'123456',0),('20200004','张三','男','信息通信系','教员',30,0,'123456',0),('20200006','林俊杰','男','学员十五队','本科学员',20,0,'123456',0),('20200023','丁真','男','学员十五队','本科学员',20,0,'123456',0),('20200032','刘亦菲','男','学员十五队','本科学员',20,0,'123456',0);
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readertype`
--

DROP TABLE IF EXISTS `readertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readertype` (
  `读者类型` varchar(10) NOT NULL,
  `借书时间` int DEFAULT NULL,
  `最多在借册数` int DEFAULT NULL,
  PRIMARY KEY (`读者类型`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readertype`
--

LOCK TABLES `readertype` WRITE;
/*!40000 ALTER TABLE `readertype` DISABLE KEYS */;
INSERT INTO `readertype` VALUES ('教员',3,30),('本科学员',1,10),('研究生学员',2,20);
/*!40000 ALTER TABLE `readertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `ID` varchar(15) NOT NULL,
  `姓名` varchar(20) NOT NULL,
  `type` enum('图书管理员','系统管理员') NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`ID`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES ('00000001','迪丽热巴','图书管理员','123456'),('1','张三','图书管理员','1'),('1','1','系统管理员','1');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 12:34:23

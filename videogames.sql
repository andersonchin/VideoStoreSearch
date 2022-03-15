-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: videogame_store
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `videogame_store`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `videogame_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `videogame_store`;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Street_Number` int NOT NULL,
  `Street_Name` varchar(255) NOT NULL,
  `Suburb` varchar(255) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Postcode` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,10,'Palm Ave','Royal Park','SA',5014);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Features`
--

DROP TABLE IF EXISTS `Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Video_Game` int NOT NULL,
  `Feature` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Video_Game` (`Video_Game`),
  CONSTRAINT `Features_ibfk_1` FOREIGN KEY (`Video_Game`) REFERENCES `Video_Games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Features`
--

LOCK TABLES `Features` WRITE;
/*!40000 ALTER TABLE `Features` DISABLE KEYS */;
INSERT INTO `Features` VALUES (1,1,'Subtitles'),(2,1,'Multiplayer'),(3,3,'Multiplayer'),(4,4,'Multiplayer'),(5,2,'Multiplayer'),(6,5,'Battle Royale'),(7,5,'Multiplayer'),(8,2,'Singleplayer Story'),(9,3,'Singleplayer Story');
/*!40000 ALTER TABLE `Features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_History`
--

DROP TABLE IF EXISTS `Order_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_History` (
  `id` int NOT NULL AUTO_INCREMENT,
  `User` int NOT NULL,
  `Video_Game` int NOT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User` (`User`),
  KEY `Video_Games` (`Video_Game`),
  CONSTRAINT `Order_History_ibfk_1` FOREIGN KEY (`User`) REFERENCES `Users` (`id`),
  CONSTRAINT `Order_History_ibfk_2` FOREIGN KEY (`Video_Game`) REFERENCES `Video_Games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_History`
--

LOCK TABLES `Order_History` WRITE;
/*!40000 ALTER TABLE `Order_History` DISABLE KEYS */;
INSERT INTO `Order_History` VALUES (1,1,1,'2021-06-30 02:24:48');
/*!40000 ALTER TABLE `Order_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Address` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Address` (`Address`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`Address`) REFERENCES `Address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Bob','Vance','vance.refridgeration@gmail.com','f5bb0c8de146c67b44babbf4e6584cc0',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video_Games`
--

DROP TABLE IF EXISTS `Video_Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Video_Games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Genre` varchar(45) NOT NULL,
  `Platform` varchar(20) NOT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video_Games`
--

LOCK TABLES `Video_Games` WRITE;
/*!40000 ALTER TABLE `Video_Games` DISABLE KEYS */;
INSERT INTO `Video_Games` VALUES (1,'Battlefield 2042','FPS','Console',109.95),(2,'Rust','Survival','PC',59.95),(3,'Portal 2','Puzzle','PC',14.95),(4,'CS:GO','FPS','PC',14.95),(5,'PlayerUnkown\'s Battlegrounds','FPS','PC',49.95);
/*!40000 ALTER TABLE `Video_Games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30  6:40:39

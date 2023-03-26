CREATE DATABASE  IF NOT EXISTS `gdsc-ys-golden-time` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gdsc-ys-golden-time`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gdsc-ys-golden-time
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext COLLATE utf8mb3_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8mb3_unicode_ci,
  `overview` text COLLATE utf8mb3_unicode_ci,
  `symptoms` text COLLATE utf8mb3_unicode_ci,
  `causes` text COLLATE utf8mb3_unicode_ci,
  `manual` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'3123412fadsvavd','afsdaf','asdfasdfb','adfdf,dfdaf,asdfasdf,asdfasdf','asdfasdfasdf','[{ \"title\": \"afsdfd\",\"description\": \"asdf\",\"videoUrl\": \"sadfa4\"},{ \"title\": \"12e\",\"description\": \"htd\",\"videoUrl\": \"asdfasdf\"},{ \"title\": \"ddd\",\"description\": \"ddd\",\"videoUrl\": \"12442\"}]'),(2,'dddddd','123123','sadfasdf','11,33,22,34','adfasdfas','[{\"title\":\"ttttt\",\"description\":\"ddddd\",\"videoUrl\":\"vvvvv\"},{\"title\":\"ttttt\",\"description\":\"ddddd\",\"videoUrl\":\"vvvvv\"}]'),(3,'3fadsvsvdf','1312','adsfasd','v,22,11,4r4','mldavksl','[{\"title\":\"ttttt\",\"description\":\"ddddd\",\"videoUrl\":\"vvvvv\"},{\"title\":\"ttttt\",\"description\":\"ddddd\",\"videoUrl\":\"vvvvv\"}]');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subtitle` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` text COLLATE utf8mb3_unicode_ci,
  `case_ids` tinytext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'sample','sampleSub','sampleOver','1,2'),(2,'sample','sampleSub','sampleOver','1,3'),(3,'sample','sampleSub','sampleOver','1'),(4,'sample','sampleSub','sampleOver','1,2'),(5,'sample','sampleSub','sampleOver','1');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sos`
--

DROP TABLE IF EXISTS `sos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `patient_location` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rescuers_num` int NOT NULL DEFAULT '0',
  `closest_rescuer_location` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `arrived_rescuers_num` int NOT NULL DEFAULT '0',
  `time_sos` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_first_arrival` datetime DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sos`
--

LOCK TABLES `sos` WRITE;
/*!40000 ALTER TABLE `sos` DISABLE KEYS */;
INSERT INTO `sos` VALUES (16,1,'sampleLocation',3,NULL,0,'2023-03-07 22:19:17',NULL,0),(17,2,'sampleLocation',0,NULL,0,'2023-03-07 22:21:11',NULL,0),(18,3,'sampleLocation',0,NULL,0,'2023-03-08 20:33:39',NULL,0),(19,4,'40.6892027,-74.04421',0,'38.8890694,-77.03450',3,'2023-03-12 11:01:35','2023-03-15 01:15:53',1);
/*!40000 ALTER TABLE `sos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb3_unicode_ci NOT NULL,
  `birth_date` tinytext COLLATE utf8mb3_unicode_ci,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `blood_type` tinytext COLLATE utf8mb3_unicode_ci,
  `allergies` text COLLATE utf8mb3_unicode_ci,
  `medications` text COLLATE utf8mb3_unicode_ci,
  `medical_notes` text COLLATE utf8mb3_unicode_ci,
  `diseases` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sampleName','2001-01-01',177.2,70.2,'RH+A','sampleAllergies','sampleMedications','sampleNotes','1,2,3,4,5'),(2,'sampleName','2001-01-01',177.2,70.2,'RH+A','sampleAllergies','sampleMedications','sampleNotes','1,2,3,4,5'),(3,'newSampleName','2001-01-01',177.2,70.2,'RH+A','sampleAllergies','sampleMedications','sampleNotes','1,2,3,4,5'),(4,'newSampleName','2001-01-01',177.2,70.2,'RH+A','sampleAllergies','sampleMedications','sampleNotes','1,2,3,4,5');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gdsc-ys-golden-time'
--

--
-- Dumping routines for database 'gdsc-ys-golden-time'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 14:48:41

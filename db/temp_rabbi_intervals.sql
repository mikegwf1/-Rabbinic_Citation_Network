-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: temp
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `rabbi_intervals`
--

DROP TABLE IF EXISTS `rabbi_intervals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rabbi_intervals` (
  `ID` int(11) NOT NULL,
  `contains_questioned` int(11) DEFAULT NULL,
  `contains_target` int(11) DEFAULT NULL,
  `isRabbi1Questioned` int(11) DEFAULT NULL,
  `isRabbi2Questioned` int(11) DEFAULT NULL,
  `isRabbi1Target` int(11) DEFAULT NULL,
  `isRabbi2Target` int(11) DEFAULT NULL,
  `contains_name_of` int(11) DEFAULT NULL,
  `contains_quoter_in_span` int(11) DEFAULT NULL,
  `contains_quoter_before_span` int(11) DEFAULT NULL,
  `contains_questioner_in_span` int(11) DEFAULT NULL,
  `contains_questioner_before_span` int(11) DEFAULT NULL,
  `contains_spatial_in_span` int(11) DEFAULT NULL,
  `contains_spatial_before_span` int(11) DEFAULT NULL,
  `contains_action_in_span` int(11) DEFAULT NULL,
  `contains_action_before_span` int(11) DEFAULT NULL,
  `span_rabbis_text` varchar(500) DEFAULT NULL,
  `first_rabbi` varchar(100) DEFAULT NULL,
  `first_rabbi_no_prefix` varchar(100) DEFAULT NULL,
  `first_rabbi_after_link` varchar(100) DEFAULT NULL,
  `second_rabbi` varchar(100) DEFAULT NULL,
  `second_rabbi_no_prefix` varchar(100) DEFAULT NULL,
  `second_rabbi_after_link` varchar(100) DEFAULT NULL,
  `rabbis_after_link_alpha_order` varchar(200) DEFAULT NULL,
  `interval_text` varchar(500) DEFAULT NULL,
  `token_string` varchar(500) DEFAULT NULL,
  `numb_intervening_tokens` int(11) DEFAULT NULL,
  `masechet` varchar(100) DEFAULT NULL,
  `start_span` int(11) DEFAULT NULL,
  `end_span` int(11) DEFAULT NULL,
  `amud` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rabbi_intervals`
--

LOCK TABLES `rabbi_intervals` WRITE;
/*!40000 ALTER TABLE `rabbi_intervals` DISABLE KEYS */;
/*!40000 ALTER TABLE `rabbi_intervals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-18 13:34:04

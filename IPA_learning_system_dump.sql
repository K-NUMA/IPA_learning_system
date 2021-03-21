-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: IPA_learning_system
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `amquestioncategory`
--

DROP TABLE IF EXISTS `amquestioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amquestioncategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_theory` double NOT NULL,
  `business_st` double NOT NULL,
  `co_legal` double NOT NULL,
  `com_system` double NOT NULL,
  `develop_tech` double NOT NULL,
  `pm` double NOT NULL,
  `sm` double NOT NULL,
  `system_st` double NOT NULL,
  `tech_elements` double NOT NULL,
  `score_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKubsgd4gkpv4ygc5dvioo65e4` (`score_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amquestioncategory`
--

LOCK TABLES `amquestioncategory` WRITE;
/*!40000 ALTER TABLE `amquestioncategory` DISABLE KEYS */;
INSERT INTO `amquestioncategory` VALUES (2,0.82,0,0,1,0,0,0,0,0,5),(3,0.55,-1,-1,0,-1,-1,-1,-1,-1,6),(4,0.73,-1,-1,1,-1,-1,-1,-1,-1,7);
/*!40000 ALTER TABLE `amquestioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amquestions`
--

DROP TABLE IF EXISTS `amquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `contentImg` varchar(255) NOT NULL,
  `qs_number` int(11) NOT NULL,
  `qs_season` varchar(255) NOT NULL,
  `qs_year` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fmck5p4jraq66gohklljtkhoi` (`contentImg`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amquestions`
--

LOCK TABLES `amquestions` WRITE;
/*!40000 ALTER TABLE `amquestions` DISABLE KEYS */;
INSERT INTO `amquestions` VALUES (1,4,1,'FE_令和元年_秋期_問1.png',1,'秋期','令和元年'),(2,3,1,'FE_令和元年_秋期_問2.png',2,'秋期','令和元年'),(3,3,1,'FE_令和元年_秋期_問3.png',3,'秋期','令和元年'),(4,1,1,'FE_令和元年_秋期_問4.png',4,'秋期','令和元年'),(5,1,1,'FE_令和元年_秋期_問5.png',5,'秋期','令和元年'),(6,3,1,'FE_令和元年_秋期_問6.png',6,'秋期','令和元年'),(7,4,1,'FE_令和元年_秋期_問7.png',7,'秋期','令和元年'),(8,3,1,'FE_令和元年_秋期_問8.png',8,'秋期','令和元年'),(9,4,1,'FE_令和元年_秋期_問9.png',9,'秋期','令和元年'),(10,2,1,'FE_令和元年_秋期_問10.png',10,'秋期','令和元年'),(11,3,1,'FE_令和元年_秋期_問11.png',11,'秋期','令和元年'),(12,4,2,'FE_令和元年_秋期_問12.png',12,'秋期','令和元年'),(13,1,2,'FE_令和元年_秋期_問13.png',13,'秋期','令和元年'),(14,2,2,'FE_令和元年_秋期_問14.png',14,'秋期','令和元年'),(15,1,2,'FE_令和元年_秋期_問15.png',15,'秋期','令和元年'),(16,3,2,'FE_令和元年_秋期_問16.png',16,'秋期','令和元年'),(17,4,2,'FE_令和元年_秋期_問17.png',17,'秋期','令和元年'),(18,3,2,'FE_令和元年_秋期_問18.png',18,'秋期','令和元年'),(19,3,2,'FE_令和元年_秋期_問19.png',19,'秋期','令和元年'),(20,4,2,'FE_令和元年_秋期_問20.png',20,'秋期','令和元年'),(21,2,2,'FE_令和元年_秋期_問21.png',21,'秋期','令和元年'),(22,2,2,'FE_令和元年_秋期_問22.png',22,'秋期','令和元年'),(23,3,3,'FE_令和元年_秋期_問23.png',23,'秋期','令和元年'),(24,4,3,'FE_令和元年_秋期_問24.png',24,'秋期','令和元年'),(25,2,3,'FE_令和元年_秋期_問25.png',25,'秋期','令和元年'),(26,3,3,'FE_令和元年_秋期_問26.png',26,'秋期','令和元年'),(27,2,3,'FE_令和元年_秋期_問27.png',27,'秋期','令和元年'),(28,2,3,'FE_令和元年_秋期_問28.png',28,'秋期','令和元年'),(29,3,3,'FE_令和元年_秋期_問29.png',29,'秋期','令和元年'),(30,4,3,'FE_令和元年_秋期_問30.png',30,'秋期','令和元年'),(31,2,3,'FE_令和元年_秋期_問31.png',31,'秋期','令和元年'),(32,2,3,'FE_令和元年_秋期_問32.png',32,'秋期','令和元年'),(33,2,3,'FE_令和元年_秋期_問33.png',33,'秋期','令和元年'),(34,2,3,'FE_令和元年_秋期_問34.png',34,'秋期','令和元年'),(35,2,3,'FE_令和元年_秋期_問35.png',35,'秋期','令和元年'),(36,2,3,'FE_令和元年_秋期_問36.png',36,'秋期','令和元年'),(37,4,3,'FE_令和元年_秋期_問37.png',37,'秋期','令和元年'),(38,3,3,'FE_令和元年_秋期_問38.png',38,'秋期','令和元年'),(39,1,3,'FE_令和元年_秋期_問39.png',39,'秋期','令和元年'),(40,3,3,'FE_令和元年_秋期_問40.png',40,'秋期','令和元年'),(41,2,3,'FE_令和元年_秋期_問41.png',41,'秋期','令和元年'),(42,3,3,'FE_令和元年_秋期_問42.png',42,'秋期','令和元年'),(43,2,3,'FE_令和元年_秋期_問43.png',43,'秋期','令和元年'),(44,4,3,'FE_令和元年_秋期_問44.png',44,'秋期','令和元年');
/*!40000 ALTER TABLE `amquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amscores`
--

DROP TABLE IF EXISTS `amscores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amscores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anscount` int(11) NOT NULL,
  `anstime` date NOT NULL,
  `score` int(11) NOT NULL,
  `test_season` varchar(255) NOT NULL,
  `test_year` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5mth63wvq8dmw3roaa7wy9ji8` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amscores`
--

LOCK TABLES `amscores` WRITE;
/*!40000 ALTER TABLE `amscores` DISABLE KEYS */;
/*!40000 ALTER TABLE `amscores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlist`
--

DROP TABLE IF EXISTS `userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_flag` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_plfftc4avthm3ed4s5rape8gj` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlist`
--

LOCK TABLES `userlist` WRITE;
/*!40000 ALTER TABLE `userlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 12:36:25

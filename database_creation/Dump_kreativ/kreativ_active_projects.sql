-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: kreativ
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_projects`
--

DROP TABLE IF EXISTS `active_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `active_projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(32) NOT NULL,
  `project_status` int(11) DEFAULT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `artist_id` (`artist_id`),
  KEY `user_account_id` (`user_account_id`),
  KEY `recruiter_id` (`recruiter_id`),
  CONSTRAINT `active_projects_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  CONSTRAINT `active_projects_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`user_account_id`),
  CONSTRAINT `active_projects_ibfk_3` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiter` (`recruiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_projects`
--

LOCK TABLES `active_projects` WRITE;
/*!40000 ALTER TABLE `active_projects` DISABLE KEYS */;
INSERT INTO `active_projects` VALUES (1,'website design',50,12,1,1),(2,'photography',40,13,2,2),(3,'singing',30,14,3,3),(4,'acting',20,15,4,4);
/*!40000 ALTER TABLE `active_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-31 19:50:31

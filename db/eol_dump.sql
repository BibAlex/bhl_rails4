-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eol
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

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
-- Table structure for table `agent_roles`
--

DROP TABLE IF EXISTS `agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Identifies how agent is linked to data_object';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_roles`
--

LOCK TABLES `agent_roles` WRITE;
/*!40000 ALTER TABLE `agent_roles` DISABLE KEYS */;
INSERT INTO `agent_roles` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18);
/*!40000 ALTER TABLE `agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` text NOT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homepage` text NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `yahoo_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `full_name` (`full_name`(200))
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='Agents are content partners and used for object attribution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'IUCN',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:51','2014-12-08 10:18:51'),(2,'Catalogue of Life',NULL,NULL,NULL,'http://www.catalogueoflife.org/','',219000,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:52','2014-12-08 10:18:52'),(3,'National Center for Biotechnology Information',NULL,NULL,NULL,'http://www.ncbi.nlm.nih.gov/','',921800,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:52','2014-12-08 10:18:52'),(4,'Biology of Aging',NULL,NULL,NULL,'','',318700,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:52','2014-12-08 10:18:52'),(5,'Fiona Parisian',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:53','2014-12-08 10:18:53'),(6,'Spencer Bergstrom',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:54','2014-12-08 10:18:54'),(7,'GBIF',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:54','2014-12-08 10:18:54'),(8,'Camren Rhys',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:18:55','2014-12-08 10:18:55'),(9,'Ahmad Murphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:03','2014-12-08 10:19:03'),(10,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:07','2014-12-08 10:19:07'),(11,'Roxane Connelly',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:07','2014-12-08 10:19:07'),(12,'Mariana Runolfsson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:08','2014-12-08 10:19:08'),(13,'Joshuah Ernser',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:08','2014-12-08 10:19:08'),(14,'Antonia Nolan',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:12','2014-12-08 10:19:12'),(15,'Eugene Mosciski',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:12','2014-12-08 10:19:12'),(16,'Kaitlin Larkin',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:13','2014-12-08 10:19:13'),(17,'Otho Willms',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:14','2014-12-08 10:19:14'),(18,'Camila Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:15','2014-12-08 10:19:15'),(19,'Colt Stracke',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:15','2014-12-08 10:19:15'),(20,'Mathew Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:17','2014-12-08 10:19:17'),(21,'Electa Na',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:17','2014-12-08 10:19:17'),(22,'Damaris Torphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:19','2014-12-08 10:19:19'),(23,'Aidan Mills',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:19','2014-12-08 10:19:19'),(24,'Dora Pollich',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:22','2014-12-08 10:19:22'),(25,'Emmanuelle Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:24','2014-12-08 10:19:24'),(26,'Sam Hettinger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:24','2014-12-08 10:19:24'),(27,'Betty Okuneva',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:24','2014-12-08 10:19:24'),(28,'Reuben Olson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:24','2014-12-08 10:19:24'),(29,'Ashley West',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:25','2014-12-08 10:19:25'),(30,'Vicente Schowalter',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:25','2014-12-08 10:19:25'),(31,'Heber Hill',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:25','2014-12-08 10:19:25'),(32,'Maybell Schneider',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:25','2014-12-08 10:19:25'),(33,'Okey McCullough',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:29','2014-12-08 10:19:29'),(34,'Leonardo Schamberger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:29','2014-12-08 10:19:29'),(35,'Gerhard Bode',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:30','2014-12-08 10:19:30'),(36,'Cicero Stehr',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:30','2014-12-08 10:19:30'),(37,'Maritza Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:32','2014-12-08 10:19:32'),(38,'Alvah Wisozk',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:32','2014-12-08 10:19:32'),(39,'Wyatt Hansen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:32','2014-12-08 10:19:32'),(40,'Ming Spencer',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:32','2014-12-08 10:19:32'),(41,'Ralph Wiggum',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:36','2014-12-08 10:19:36'),(42,'Shane Eichmann',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:36','2014-12-08 10:19:36'),(43,'George Rolfson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:36','2014-12-08 10:19:36'),(44,'Chanel Keller',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:36','2014-12-08 10:19:36'),(45,'Rosalia Toy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:37','2014-12-08 10:19:37'),(46,'Admin User',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:37','2014-12-08 10:19:37'),(47,'Christie Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:38','2014-12-08 10:19:38'),(48,'Madelynn Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:38','2014-12-08 10:19:38'),(49,'Jeramie Botsford',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:40','2014-12-08 10:19:40'),(50,'test curator',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:40','2014-12-08 10:19:40'),(51,'Lavada Mann',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:40','2014-12-08 10:19:40'),(52,'Kailey Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:40','2014-12-08 10:19:40'),(53,'Herbert Senger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:41','2014-12-08 10:19:41'),(54,'Rolfe Luettgen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:41','2014-12-08 10:19:41'),(55,'Kali Lubowitz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:43','2014-12-08 10:19:43'),(56,'Jacky Welch',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:43','2014-12-08 10:19:43'),(57,'Marilie Harvey',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:45','2014-12-08 10:19:45'),(58,'Jon Schultz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:45','2014-12-08 10:19:45'),(59,'Rachel Keebler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:47','2014-12-08 10:19:47'),(60,'Scot Hudson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:47','2014-12-08 10:19:47'),(61,'Rhea Leffler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:49','2014-12-08 10:19:49'),(62,'Greta Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:49','2014-12-08 10:19:49'),(63,'Dameon Schmidt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:51','2014-12-08 10:19:51'),(64,'Rasheed Skiles',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:51','2014-12-08 10:19:51'),(65,'Bertrand Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:53','2014-12-08 10:19:53'),(66,'Seao Cummerata',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:53','2014-12-08 10:19:53'),(67,'Janif Stamm',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:54','2014-12-08 10:19:54'),(68,'Helmes Beier',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:54','2014-12-08 10:19:54'),(69,'Fionb Dickens',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:56','2014-12-08 10:19:56'),(70,'Spences Kulas',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:57','2014-12-08 10:19:57'),(71,'Camreo Franecki',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:58','2014-12-08 10:19:58'),(72,'Ahmae Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:19:58','2014-12-08 10:19:58'),(73,'Roxanf Padberg',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:01','2014-12-08 10:20:01'),(74,'Marianb Haley',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:01','2014-12-08 10:20:01'),(75,'Joshuai Gorczany',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:02','2014-12-08 10:20:02'),(76,'Antonib Hoeger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:02','2014-12-08 10:20:02'),(77,'Eugenf Cronio',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:05','2014-12-08 10:20:05'),(78,'Kaitlio Reinges',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:05','2014-12-08 10:20:05'),(79,'Othp Jacobt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:07','2014-12-08 10:20:07'),(80,'Camilb Cronb',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:07','2014-12-08 10:20:07'),(81,'Colu Parisiao',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:15','2014-12-08 10:20:15'),(82,'Mathex Bergstron',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:29','2014-12-08 10:20:29'),(83,'Electb Rhyt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-03 10:20:30','2014-12-08 10:20:30'),(84,'Amr Morad',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-10 07:42:32','0000-00-00 00:00:00'),(85,'AmrMorad',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-10 07:49:52','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_data_objects`
--

DROP TABLE IF EXISTS `agents_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with data objects in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_data_objects`
--

LOCK TABLES `agents_data_objects` WRITE;
/*!40000 ALTER TABLE `agents_data_objects` DISABLE KEYS */;
INSERT INTO `agents_data_objects` VALUES (2,2,1,0),(3,2,1,0),(4,2,1,0),(5,2,1,0),(6,2,1,0),(7,2,1,0),(8,2,1,0),(9,2,1,0),(10,2,1,0),(11,2,1,0),(12,2,1,0),(13,2,1,0),(14,2,1,0),(15,2,1,0),(16,2,1,0),(17,2,1,0),(18,2,1,0),(19,2,1,0),(20,2,1,0),(21,2,1,0),(22,2,1,0),(23,2,1,0),(24,2,1,0),(25,2,1,0),(26,2,1,0),(27,2,1,0),(28,2,1,0),(29,2,1,0),(30,2,1,0),(31,2,1,0),(32,2,1,0),(33,2,1,0),(34,2,1,0),(35,2,1,0),(36,2,1,0),(37,2,1,0),(38,2,1,0),(39,2,1,0),(40,2,1,0),(41,2,1,0),(42,2,1,0),(43,2,1,0),(44,2,1,0),(45,2,1,0),(46,2,1,0),(47,2,1,0),(48,2,1,0),(49,2,1,0),(50,2,1,0),(51,2,1,0),(52,2,1,0),(53,2,1,0),(54,2,1,0),(55,2,1,0),(56,2,1,0),(57,2,1,0),(58,2,1,0),(59,2,1,0),(60,2,1,0),(61,2,1,0),(62,2,1,0),(63,2,1,0),(64,2,1,0),(65,2,1,0),(66,2,1,0),(67,2,1,0),(68,2,1,0),(69,2,1,0),(70,2,1,0),(71,2,1,0),(72,2,1,0),(73,2,1,0),(74,2,1,0),(75,2,1,0),(76,2,1,0),(77,2,1,0),(78,2,1,0),(79,2,1,0),(80,2,1,0),(81,2,1,0),(82,2,1,0),(83,2,1,0),(84,2,1,0),(85,2,1,0),(86,2,1,0),(87,2,1,0),(88,2,1,0),(89,2,1,0),(92,10,1,0),(93,10,1,0),(94,10,1,0),(95,10,1,0),(96,10,1,0),(97,10,1,0),(98,10,1,0),(99,10,1,0),(100,10,1,0),(101,2,1,0),(102,2,1,0),(103,2,1,0),(104,2,1,0),(105,2,1,0),(106,2,1,0),(107,2,1,0),(108,2,1,0),(109,2,1,0),(110,2,1,0),(111,2,1,0),(112,2,1,0),(113,2,1,0),(114,2,1,0),(115,2,1,0),(116,2,1,0),(117,2,1,0),(118,2,1,0),(119,2,1,0),(120,2,1,0),(121,2,1,0),(122,2,1,0),(123,2,1,0),(124,2,1,0),(125,2,1,0),(126,2,1,0),(127,2,1,0),(128,2,1,0),(129,2,1,0),(130,2,1,0),(131,2,1,0),(132,2,1,0),(133,2,1,0),(134,2,1,0),(135,2,1,0),(136,2,1,0),(137,2,1,0),(138,2,1,0),(139,2,1,0),(140,2,1,0),(141,2,1,0),(142,2,1,0),(143,2,1,0),(144,2,1,0),(145,2,1,0),(146,2,1,0),(147,2,1,0),(148,2,1,0),(149,2,1,0),(150,2,1,0),(151,2,1,0),(152,2,1,0),(153,2,1,0),(154,2,1,0),(155,2,1,0),(156,2,1,0),(157,2,1,0),(158,2,1,0),(159,2,1,0),(160,2,1,0),(161,2,1,0),(162,2,1,0),(163,2,1,0),(164,2,1,0),(165,2,1,0),(166,2,1,0),(167,2,1,0),(168,2,1,0),(169,2,1,0),(170,2,1,0),(171,2,1,0),(172,2,1,0),(173,2,1,0),(174,2,1,0),(175,2,1,0),(176,2,1,0),(177,2,1,0),(178,2,1,0),(179,2,1,0),(180,2,1,0),(181,2,1,0),(182,2,1,0),(183,2,1,0),(184,2,1,0),(185,2,1,0),(186,2,1,0),(187,2,1,0),(188,2,1,0),(189,2,1,0),(190,2,1,0),(191,2,1,0),(192,2,1,0),(193,2,1,0),(194,2,1,0),(195,2,1,0),(196,2,1,0),(197,2,1,0),(198,2,1,0),(199,2,1,0),(200,2,1,0),(201,2,1,0),(202,2,1,0),(203,2,1,0),(204,2,1,0),(205,2,1,0),(206,2,1,0),(207,2,1,0),(208,2,1,0),(209,2,1,0),(210,2,1,0),(211,2,1,0),(212,2,1,0),(213,2,1,0),(214,2,1,0),(215,2,1,0),(216,2,1,0),(217,2,1,0),(218,2,1,0),(219,2,1,0),(220,2,1,0),(221,2,1,0),(222,2,1,0),(223,2,1,0),(224,2,1,0),(225,2,1,0),(226,2,1,0),(227,2,1,0),(228,2,1,0),(229,2,1,0),(230,2,1,0),(231,2,1,0),(232,2,1,0),(233,2,1,0),(234,2,1,0),(235,2,1,0);
/*!40000 ALTER TABLE `agents_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_hierarchy_entries`
--

DROP TABLE IF EXISTS `agents_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with hierarchy entries in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_hierarchy_entries`
--

LOCK TABLES `agents_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `agents_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_synonyms`
--

DROP TABLE IF EXISTS `agents_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_synonyms` (
  `synonym_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`synonym_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with synonyms in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_synonyms`
--

LOCK TABLES `agents_synonyms` WRITE;
/*!40000 ALTER TABLE `agents_synonyms` DISABLE KEYS */;
INSERT INTO `agents_synonyms` VALUES (1,1,4,1),(2,2,4,1),(3,1,4,1),(4,2,4,1),(5,1,4,1),(6,2,4,1),(7,1,4,1),(8,2,4,1),(9,1,4,1),(10,2,4,1),(11,1,4,1),(12,2,4,1),(13,1,4,1),(14,2,4,1),(15,2,4,1),(16,2,4,1),(17,2,4,1),(18,2,4,1),(19,2,4,1),(20,1,4,1),(21,2,4,1),(22,1,4,1),(23,1,4,1),(24,2,4,1),(25,2,4,1),(26,1,4,1),(27,1,4,1),(28,2,4,1),(29,2,4,1),(30,2,4,1),(31,1,4,1),(32,2,4,1),(33,1,4,1),(34,2,4,1),(35,1,4,1),(36,2,4,1),(37,1,4,1),(38,2,4,1),(39,1,4,1),(40,2,4,1),(41,1,4,1),(42,2,4,1),(43,1,4,1),(44,2,4,1),(45,1,4,1),(46,2,4,1),(47,1,4,1),(48,2,4,1),(49,1,4,1),(50,1,4,1),(51,2,4,1),(52,2,4,1),(53,2,4,1),(54,2,4,1),(55,2,4,1),(56,2,4,1),(57,2,4,1),(58,2,4,1),(59,2,4,1),(60,2,4,1),(61,1,4,1),(62,2,4,1),(63,1,4,1),(64,2,4,1),(65,1,4,1),(66,2,4,1),(67,1,4,1),(68,2,4,1),(69,1,4,1);
/*!40000 ALTER TABLE `agents_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Controlled list for determining the "expertise" of a data object';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
INSERT INTO `audiences` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences_data_objects`
--

DROP TABLE IF EXISTS `audiences_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `audience_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`audience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A data object can have zero to many target audiences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences_data_objects`
--

LOCK TABLES `audiences_data_objects` WRITE;
/*!40000 ALTER TABLE `audiences_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiences_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canonical_forms`
--

DROP TABLE IF EXISTS `canonical_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canonical_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(300) NOT NULL COMMENT 'a canonical form of a scientific name is the name parts without authorship, rank information, or anthing except the latinized name parts. These are for the most part algorithmically generated',
  `name_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(255)),
  KEY `index_canonical_forms_on_name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Every name string has one canonical form - a simplified version of the string';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonical_forms`
--

LOCK TABLES `canonical_forms` WRITE;
/*!40000 ALTER TABLE `canonical_forms` DISABLE KEYS */;
INSERT INTO `canonical_forms` VALUES (1,'Estasperioreseli etquidemis',NULL),(2,'Animalia',NULL),(3,'Animals',NULL),(4,'Autrecusandaees repudiandaeica',NULL),(5,'ravenous clover',NULL),(6,'Nihileri voluptasus',NULL),(7,'red suntus',NULL),(8,'Dignissimosii inutes',NULL),(9,'darning needle',NULL),(10,'Fugais utharumatus',NULL),(11,'tiger',NULL),(12,'Minuseli ullamens',NULL),(13,'Tiger moth',NULL),(14,'Dignissimosatus nobisosyne',NULL),(15,'Tiger lilly',NULL),(16,'Tiger water lilly',NULL),(17,'lilly of the tiger',NULL),(18,'Tiger flower',NULL),(19,'Tiger-stripe lilly',NULL),(20,'Tiger-eye lilly',NULL),(21,'Expeditaalia evenietelia',NULL),(22,'Earumeles beataeata',NULL),(23,'Culpaensis sapienteesi',NULL),(24,'frizzlebek',NULL),(25,'Utomnisesi sequialis',NULL),(26,'purple dust crab',NULL),(27,'Autaliquideri minimais',NULL),(28,'Autema officiaalius',NULL),(29,'Etconsequaturelia autenimalia',NULL),(30,'wumpus',NULL),(31,'wompus',NULL),(32,'wampus',NULL),(33,'Eukaryota',NULL),(34,'eukaryotes',NULL),(35,'Metazoa',NULL),(36,'opisthokonts',NULL),(37,'Quoautesi natuseri',NULL),(38,'cloud swallow',NULL),(39,'Voluptatumeri esseensis',NULL),(40,'spiny possom',NULL),(41,'Ameti maioresis',NULL),(42,'common desert mouse',NULL),(43,'Ipsamalius distinctioerox',NULL),(44,'fisher',NULL),(45,'Maximees veritatisatus',NULL),(46,'chartruse turtle',NULL),(47,'Molestiaeus rationealia',NULL),(48,'horny toad',NULL),(49,'Fugitens dolorealius',NULL),(50,'scarlet vermillion',NULL),(51,'Quisquamator sequieles',NULL),(52,'Mozart\'s nemesis',NULL),(53,'Bacteria',NULL),(54,'bugs',NULL),(55,'grime',NULL),(56,'critters',NULL),(57,'bakteria',NULL),(58,'die buggen',NULL),(59,'das greim',NULL),(60,'baseteir',NULL),(61,'le grimme',NULL),(62,'ler petit bugge',NULL),(63,'Essees eaqueata',NULL),(64,'quick brown fox',NULL),(65,'Animiens atdoloribuseron',NULL),(66,'painted horse',NULL),(67,'Adaliasii iurea',NULL),(68,'thirsty aphid',NULL),(69,'Nonnumquamerus numquamerus',NULL),(70,'bloody eel',NULL);
/*!40000 ALTER TABLE `canonical_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeable_object_types`
--

DROP TABLE IF EXISTS `changeable_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeable_object_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ch_object_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeable_object_types`
--

LOCK TABLES `changeable_object_types` WRITE;
/*!40000 ALTER TABLE `changeable_object_types` DISABLE KEYS */;
INSERT INTO `changeable_object_types` VALUES (1,'comment','2014-12-08 12:18:55','2014-12-08 12:18:55'),(2,'data_object','2014-12-08 12:18:55','2014-12-08 12:18:55'),(3,'synonym','2014-12-08 12:18:55','2014-12-08 12:18:55'),(4,'taxon_concept_name','2014-12-08 12:18:55','2014-12-08 12:18:55'),(5,'tag','2014-12-08 12:18:55','2014-12-08 12:18:55'),(6,'users_data_object','2014-12-08 12:18:55','2014-12-08 12:18:55'),(7,'hierarchy_entry','2014-12-08 12:18:55','2014-12-08 12:18:55'),(8,'curated_data_objects_hierarchy_entry','2014-12-08 12:18:55','2014-12-08 12:18:55'),(9,'data_objects_hierarchy_entry','2014-12-08 12:18:55','2014-12-08 12:18:55'),(10,'users_submitted_text','2014-12-08 12:18:55','2014-12-08 12:18:55'),(11,'curated_taxon_concept_preferred_entry','2014-12-08 12:18:55','2014-12-08 12:18:55'),(12,'taxon_concept','2014-12-08 12:18:55','2014-12-08 12:18:55'),(13,'classification_curation','2014-12-08 12:18:55','2014-12-08 12:18:55'),(14,'data_point_uri','2014-12-08 12:18:55','2014-12-08 12:18:55'),(15,'user_added_data','2014-12-08 12:18:55','2014-12-08 12:18:55');
/*!40000 ALTER TABLE `changeable_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_curations`
--

DROP TABLE IF EXISTS `classification_curations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_curations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exemplar_id` int(11) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `forced` tinyint(1) DEFAULT NULL,
  `error` varchar(256) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_curations`
--

LOCK TABLES `classification_curations` WRITE;
/*!40000 ALTER TABLE `classification_curations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_curations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items`
--

DROP TABLE IF EXISTS `collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `collected_item_type` varchar(32) DEFAULT NULL,
  `collected_item_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `annotation` text,
  `added_by_user_id` int(11) unsigned DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id_object_type_object_id` (`collection_id`,`collected_item_type`,`collected_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items`
--

LOCK TABLES `collection_items` WRITE;
/*!40000 ALTER TABLE `collection_items` DISABLE KEYS */;
INSERT INTO `collection_items` VALUES (1,'Test Data Object','DataObject',236,5709,'2014-12-08 12:20:15','2014-12-08 12:20:15',NULL,NULL,NULL);
/*!40000 ALTER TABLE `collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items_collection_jobs`
--

DROP TABLE IF EXISTS `collection_items_collection_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items_collection_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_item_id` int(11) NOT NULL,
  `collection_job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `join_index` (`collection_item_id`,`collection_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items_collection_jobs`
--

LOCK TABLES `collection_items_collection_jobs` WRITE;
/*!40000 ALTER TABLE `collection_items_collection_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_items_collection_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items_refs`
--

DROP TABLE IF EXISTS `collection_items_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items_refs` (
  `collection_item_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items_refs`
--

LOCK TABLES `collection_items_refs` WRITE;
/*!40000 ALTER TABLE `collection_items_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_items_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_jobs`
--

DROP TABLE IF EXISTS `collection_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `item_count` int(11) DEFAULT NULL,
  `all_items` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  `overwrite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_jobs`
--

LOCK TABLES `collection_jobs` WRITE;
/*!40000 ALTER TABLE `collection_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_jobs_collections`
--

DROP TABLE IF EXISTS `collection_jobs_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_jobs_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `collection_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_jobs_collections_index` (`collection_id`,`collection_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_jobs_collections`
--

LOCK TABLES `collection_jobs_collections` WRITE;
/*!40000 ALTER TABLE `collection_jobs_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_jobs_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types`
--

DROP TABLE IF EXISTS `collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `lft` smallint(5) unsigned DEFAULT NULL,
  `rgt` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types`
--

LOCK TABLES `collection_types` WRITE;
/*!40000 ALTER TABLE `collection_types` DISABLE KEYS */;
INSERT INTO `collection_types` VALUES (1,0,0,1),(2,0,2,3),(3,0,4,9),(4,3,5,6),(5,3,7,8),(6,0,10,17),(7,6,11,12),(8,6,13,14),(9,6,15,16),(10,0,18,19),(11,0,20,21);
/*!40000 ALTER TABLE `collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_collections`
--

DROP TABLE IF EXISTS `collection_types_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_collections` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `collection_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`collection_id`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_collections`
--

LOCK TABLES `collection_types_collections` WRITE;
/*!40000 ALTER TABLE `collection_types_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_types_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_hierarchies`
--

DROP TABLE IF EXISTS `collection_types_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_hierarchies` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `hierarchy_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`hierarchy_id`),
  KEY `collection_id` (`hierarchy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_hierarchies`
--

LOCK TABLES `collection_types_hierarchies` WRITE;
/*!40000 ALTER TABLE `collection_types_hierarchies` DISABLE KEYS */;
INSERT INTO `collection_types_hierarchies` VALUES (1,1),(2,1),(4,14),(9,14),(11,14),(7,15),(10,15);
/*!40000 ALTER TABLE `collection_types_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `special_collection_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `description` text,
  `sort_style_id` int(11) DEFAULT NULL,
  `relevance` tinyint(4) DEFAULT '1',
  `view_style_id` int(11) DEFAULT NULL,
  `show_references` tinyint(1) DEFAULT '1',
  `collection_items_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'Iucn Reinger\'s Watch List',2,1,'2014-12-08 12:18:52','2014-12-08 12:18:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(2,'Janie Jacobs\'s Watch List',2,1,'2014-12-08 12:18:52','2014-12-08 12:18:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(3,'Helmer Crona\'s Watch List',2,1,'2014-12-08 12:18:52','2014-12-08 12:18:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(4,'Ahmad Murphy\'s Watch List',2,1,'2014-12-08 12:19:03','2014-12-08 12:19:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5,'Roxane Connelly\'s Watch List',2,1,'2014-12-08 12:19:07','2014-12-08 12:19:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(6,'Mariana Runolfsson\'s Watch List',2,1,'2014-12-08 12:19:08','2014-12-08 12:19:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(7,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:08','2014-12-08 12:19:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(8,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:09','2014-12-08 12:19:09',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(9,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:10','2014-12-08 12:19:10',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(10,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:10','2014-12-08 12:19:10',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(11,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:11','2014-12-08 12:19:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(12,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:11','2014-12-08 12:19:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(13,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:11','2014-12-08 12:19:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(14,'Joshuah Ernser\'s Watch List',2,1,'2014-12-08 12:19:11','2014-12-08 12:19:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(15,'Antonia Nolan\'s Watch List',2,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(16,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(17,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(18,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(19,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(20,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(21,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(22,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(23,'Kaitlin Larkin\'s Watch List',2,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(24,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(25,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(26,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(27,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(28,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(29,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(30,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(31,'Otho Willms\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(32,'Camila Deckow\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(33,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(34,'Mariana Runolfsson\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(35,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(36,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:16','2014-12-08 12:19:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(37,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:16','2014-12-08 12:19:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(38,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:16','2014-12-08 12:19:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(39,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:16','2014-12-08 12:19:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(40,'Colt Stracke\'s Watch List',2,1,'2014-12-08 12:19:16','2014-12-08 12:19:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(41,'Mathew Deckow\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(42,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(43,'Mathew Deckow\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(44,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(45,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(46,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(47,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:18','2014-12-08 12:19:18',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(48,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:18','2014-12-08 12:19:18',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(49,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:18','2014-12-08 12:19:18',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(50,'Electa Na\'s Watch List',2,1,'2014-12-08 12:19:18','2014-12-08 12:19:18',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(51,'Damaris Torphy\'s Watch List',2,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(52,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(53,'Roxane Connelly\'s Watch List',2,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(54,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(55,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:20','2014-12-08 12:19:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(56,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:20','2014-12-08 12:19:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(57,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:20','2014-12-08 12:19:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(58,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(59,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(60,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(61,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(62,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(63,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:21','2014-12-08 12:19:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(64,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:22','2014-12-08 12:19:22',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(65,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:22','2014-12-08 12:19:22',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(66,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:22','2014-12-08 12:19:22',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(67,'Dora Pollich\'s Watch List',2,1,'2014-12-08 12:19:22','2014-12-08 12:19:22',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(68,'Emmanuelle Beatty\'s Watch List',2,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(69,'Sam Hettinger\'s Watch List',2,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(70,'Betty Okuneva\'s Watch List',2,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(71,'Reuben Olson\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(72,'Ashley West\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(73,'Vicente Schowalter\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(74,'Heber Hill\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(75,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(76,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(77,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:26','2014-12-08 12:19:26',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(78,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(79,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(80,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(81,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(82,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(83,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:27','2014-12-08 12:19:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(84,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:28','2014-12-08 12:19:28',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(85,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:28','2014-12-08 12:19:28',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(86,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:28','2014-12-08 12:19:28',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(87,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(88,'Maybell Schneider\'s Watch List',2,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(89,'Okey Mc Cullough\'s Watch List',2,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(90,'Leonardo Schamberger\'s Watch List',2,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(91,'Leonardo Schamberger\'s Watch List',2,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(92,'Leonardo Schamberger\'s Watch List',2,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(93,'Leonardo Schamberger\'s Watch List',2,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(94,'Gerhard Bode\'s Watch List',2,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(95,'Cicero Stehr\'s Watch List',2,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(96,'Maritza Kuhic\'s Watch List',2,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(97,'Maritza Kuhic\'s Watch List',2,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(98,'Wyatt Hansen\'s Watch List',2,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(99,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(100,'Mathew Deckow\'s Watch List',2,1,'2014-12-08 12:19:33','2014-12-08 12:19:33',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(101,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:33','2014-12-08 12:19:33',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(102,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:33','2014-12-08 12:19:33',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(103,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:34','2014-12-08 12:19:34',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(104,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:34','2014-12-08 12:19:34',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(105,'Ming Spencer\'s Watch List',2,1,'2014-12-08 12:19:34','2014-12-08 12:19:34',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(106,'Ralph Wiggum\'s Watch List',2,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(107,'Ralph Wiggum\'s Watch List',2,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(108,'Benton Corwin\'s Watch List',2,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(109,'Benton Corwin\'s Watch List',2,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(110,'Rosalia Toy\'s Watch List',2,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(111,'Admin User\'s Watch List',2,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(112,'Admin User\'s Watch List',2,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(113,'Christie Ankunding\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(114,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(115,'Roxane Connelly\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(116,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(117,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(118,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(119,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:39','2014-12-08 12:19:39',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(120,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:39','2014-12-08 12:19:39',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(121,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:39','2014-12-08 12:19:39',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(122,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:39','2014-12-08 12:19:39',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(123,'Jeramie Botsford\'s Watch List',2,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(124,'Test Curator\'s Watch List',2,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(125,'Duane Leuschke\'s Watch List',2,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(126,'Herbert Senger\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(127,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(128,'Rosalia Toy\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(129,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(130,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(131,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(132,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:42','2014-12-08 12:19:42',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(133,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:42','2014-12-08 12:19:42',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(134,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:42','2014-12-08 12:19:42',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(135,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:42','2014-12-08 12:19:42',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(136,'Kali Lubowitz\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(137,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(138,'Rosalia Toy\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(139,'Aidan Mills\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(140,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(141,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(142,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:44','2014-12-08 12:19:44',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(143,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:44','2014-12-08 12:19:44',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(144,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:44','2014-12-08 12:19:44',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(145,'Jacky Welch\'s Watch List',2,1,'2014-12-08 12:19:44','2014-12-08 12:19:44',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(146,'Marilie Harvey\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(147,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(148,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(149,'Christie Ankunding\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(150,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(151,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(152,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:46','2014-12-08 12:19:46',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(153,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:46','2014-12-08 12:19:46',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(154,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:46','2014-12-08 12:19:46',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(155,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(156,'Rachel Keebler\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(157,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(158,'Sam Hettinger\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(159,'Herbert Senger\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(160,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(161,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(162,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:48','2014-12-08 12:19:48',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(163,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:48','2014-12-08 12:19:48',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(164,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:48','2014-12-08 12:19:48',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(165,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:19:48','2014-12-08 12:19:48',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(166,'Rhea Leffler\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(167,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(168,'Rolfe Luettgen\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(169,'Eugene Mosciski\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(170,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(171,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(172,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:50','2014-12-08 12:19:50',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(173,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:50','2014-12-08 12:19:50',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(174,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:50','2014-12-08 12:19:50',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(175,'Greta Gleason\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(176,'Dameon Schmidt\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(177,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(178,'Dora Pollich\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(179,'Ashley West\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(180,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(181,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(182,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:52','2014-12-08 12:19:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(183,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:52','2014-12-08 12:19:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(184,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:52','2014-12-08 12:19:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(185,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:19:52','2014-12-08 12:19:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(186,'Bertrand Gleason\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(187,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(188,'Reuben Olson\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(189,'Leonardo Schamberger\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(190,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(191,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(192,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(193,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(194,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(195,'Seao Cummerata\'s Watch List',2,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(196,'Janif Stamm\'s Watch List',2,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(197,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(198,'Kali Lubowitz\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(199,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(200,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(201,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(202,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(203,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:56','2014-12-08 12:19:56',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(204,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:56','2014-12-08 12:19:56',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(205,'Helmes Beier\'s Watch List',2,1,'2014-12-08 12:19:56','2014-12-08 12:19:56',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(206,'Fionb Dickens\'s Watch List',2,1,'2014-12-08 12:19:56','2014-12-08 12:19:56',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(207,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(208,'Kali Lubowitz\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(209,'Emmanuelle Beatty\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(210,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(211,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(212,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(213,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(214,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(215,'Spences Kulas\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(216,'Camreo Franecki\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(217,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(218,'Rachel Keebler\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(219,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(220,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:59','2014-12-08 12:19:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(221,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:59','2014-12-08 12:19:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(222,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:59','2014-12-08 12:19:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(223,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:19:59','2014-12-08 12:19:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(224,'Ahmae Kuhic\'s Watch List',2,1,'2014-12-08 12:20:00','2014-12-08 12:20:00',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(225,'Roxanf Padberg\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(226,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(227,'Antonia Nolan\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(228,'Jon Schultz\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(229,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(230,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(231,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(232,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(233,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(234,'Marianb Haley\'s Watch List',2,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(235,'Joshuai Gorczany\'s Watch List',2,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(236,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(237,'Madelynn Beatty\'s Watch List',2,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(238,'Maritza Kuhic\'s Watch List',2,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(239,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(240,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(241,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(242,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:04','2014-12-08 12:20:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(243,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:04','2014-12-08 12:20:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(244,'Antonib Hoeger\'s Watch List',2,1,'2014-12-08 12:20:04','2014-12-08 12:20:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(245,'Eugenf Cronio\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(246,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(247,'Rasheed Skiles\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(248,'Duane Leuschke\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(249,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(250,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(251,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:06','2014-12-08 12:20:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(252,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:06','2014-12-08 12:20:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(253,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:06','2014-12-08 12:20:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(254,'Kaitlio Reinges\'s Watch List',2,1,'2014-12-08 12:20:06','2014-12-08 12:20:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(255,'Othp Jacobt\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(256,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(257,'Joshuai Gorczany\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(258,'Scot Hudson\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(259,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(260,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(261,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(262,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:08','2014-12-08 12:20:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(263,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:08','2014-12-08 12:20:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(264,'Camilb Cronb\'s Watch List',2,1,'2014-12-08 12:20:08','2014-12-08 12:20:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5709,'Cape Cod',NULL,1,'2014-12-08 12:20:15','2014-12-08 12:20:15',NULL,NULL,NULL,0,NULL,9,1,NULL,1,1),(5710,'Colu Parisiao\'s Watch List',2,1,'2014-12-08 12:20:15','2014-12-08 12:20:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5711,'Mathex Bergstron\'s Watch List',2,1,'2014-12-08 12:20:29','2014-12-08 12:20:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5712,'Electb Rhyt\'s Watch List',2,1,'2014-12-08 12:20:30','2014-12-08 12:20:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5713,'Amr Morad\'s Watch List',2,1,'2014-12-10 07:42:32','2014-12-10 07:42:32',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5714,'Amr Morad\'s Watch List',2,1,'2014-12-10 07:49:52','2014-12-10 07:49:52',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_communities`
--

DROP TABLE IF EXISTS `collections_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_communities` (
  `collection_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_communities`
--

LOCK TABLES `collections_communities` WRITE;
/*!40000 ALTER TABLE `collections_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `collection_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
INSERT INTO `collections_users` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,8),(16,9),(17,9),(18,9),(19,9),(20,9),(21,9),(22,9),(23,10),(24,11),(25,9),(26,11),(27,11),(28,11),(29,11),(30,11),(31,11),(32,12),(33,13),(34,6),(35,13),(36,13),(37,13),(38,13),(39,13),(40,13),(41,14),(42,15),(43,14),(44,9),(45,15),(46,15),(47,15),(48,15),(49,15),(50,15),(51,16),(52,17),(53,5),(54,17),(55,17),(56,17),(57,17),(58,17),(59,17),(60,17),(61,17),(62,17),(63,17),(64,17),(65,17),(66,17),(67,18),(68,19),(69,20),(70,21),(71,22),(72,23),(73,24),(74,25),(75,26),(76,26),(77,26),(78,26),(79,26),(80,26),(81,26),(82,26),(83,26),(84,26),(85,26),(86,26),(87,26),(88,26),(89,27),(90,28),(91,28),(92,28),(93,28),(94,29),(95,30),(96,31),(97,31),(98,32),(99,33),(100,14),(101,33),(102,33),(103,33),(104,33),(105,33),(106,34),(107,34),(108,35),(109,35),(110,36),(111,37),(112,37),(113,38),(114,39),(115,5),(116,39),(117,39),(118,39),(119,39),(120,39),(121,39),(122,39),(123,40),(124,41),(125,42),(126,43),(127,44),(128,36),(129,44),(130,44),(131,44),(132,44),(133,44),(134,44),(135,44),(136,45),(137,46),(138,36),(139,17),(140,46),(141,46),(142,46),(143,46),(144,46),(145,46),(146,47),(147,48),(148,9),(149,38),(150,48),(151,48),(152,48),(153,48),(154,48),(155,48),(156,49),(157,50),(158,20),(159,43),(160,50),(161,50),(162,50),(163,50),(164,50),(165,50),(166,51),(167,52),(168,44),(169,9),(170,52),(171,52),(172,52),(173,52),(174,52),(175,52),(176,53),(177,54),(178,18),(179,23),(180,54),(181,54),(182,54),(183,54),(184,54),(185,54),(186,55),(187,56),(188,22),(189,28),(190,56),(191,56),(192,56),(193,56),(194,56),(195,56),(196,57),(197,58),(198,45),(199,39),(200,58),(201,58),(202,58),(203,58),(204,58),(205,58),(206,59),(207,60),(208,45),(209,19),(210,60),(211,60),(212,60),(213,60),(214,60),(215,60),(216,61),(217,62),(218,49),(219,62),(220,62),(221,62),(222,62),(223,62),(224,62),(225,63),(226,64),(227,8),(228,48),(229,64),(230,64),(231,64),(232,64),(233,64),(234,64),(235,65),(236,66),(237,39),(238,31),(239,66),(240,66),(241,66),(242,66),(243,66),(244,66),(245,67),(246,68),(247,54),(248,42),(249,68),(250,68),(251,68),(252,68),(253,68),(254,68),(255,69),(256,70),(257,65),(258,50),(259,70),(260,70),(261,70),(262,70),(263,70),(264,70),(5710,71),(5709,71),(5711,72),(5712,73),(5713,74),(5714,75);
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `visible_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `from_curator` tinyint(1) NOT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `reply_to_type` varchar(32) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_comments_on_parent_id` (`parent_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,7,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:09','2014-12-08 12:19:09','2014-12-08 11:20:13',0,0,NULL,NULL,0),(2,1,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:10','2014-12-08 12:19:10','2014-12-08 10:20:13',0,0,NULL,NULL,0),(3,7,2,'DataObject','Doloribus aut ad inventore. Fuga aliquam dolores vel expedita ducimus. Excepturi est molestiae minima labore nesciunt. Distinctio quibusdam eius ipsum tempore.','2014-12-08 12:19:10','2014-12-08 12:19:10','2014-12-08 09:20:13',0,0,NULL,NULL,0),(4,7,3,'DataObject','Ut et voluptas eveniet unde iusto. Nam recusandae error. Omnis repellat at est quasi cum voluptatem. Voluptates rerum rerum. Vel odit inventore id incidunt eum error.','2014-12-08 12:19:10','2014-12-08 12:19:10','2014-12-08 08:20:13',0,0,NULL,NULL,0),(5,7,7,'DataObject','Unde qui earum et. Ut labore atque optio culpa. Eum reprehenderit necessitatibus et et velit rerum dolorem.','2014-12-08 12:19:11','2014-12-08 12:19:11','2014-12-08 07:20:13',0,0,NULL,NULL,0),(6,7,8,'DataObject','Odit blanditiis placeat cupiditate atque numquam veritatis consequatur. Voluptatem molestias a. Vitae distinctio dolore illum aut qui corporis. Quae odio enim nulla error quod sed. Magnam eveniet quod animi quas qui atque commodi.','2014-12-08 12:19:11','2014-12-08 12:19:11','2014-12-08 06:20:13',0,0,NULL,NULL,0),(7,7,9,'DataObject','Voluptatem unde nesciunt officiis. Est delectus porro voluptatem illum quia. Quisquam ipsam minus amet dolore corrupti. Quisquam quibusdam quis. Hic iure officia maxime dolor a nesciunt quia.','2014-12-08 12:19:11','2014-12-08 12:19:11','2014-12-08 05:20:13',0,0,NULL,NULL,0),(8,7,10,'DataObject','Aperiam quibusdam non deserunt aut voluptatum aut qui. Reiciendis cumque eligendi. Laborum sunt vero qui et voluptatem et.','2014-12-08 12:19:11','2014-12-08 12:19:11','2014-12-08 04:20:13',0,0,NULL,NULL,0),(9,1,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:12','2014-12-08 12:19:12','2014-12-08 03:20:13',0,0,NULL,NULL,0),(10,3,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:12','2014-12-08 12:19:12','2014-12-08 02:20:13',0,0,NULL,NULL,0),(11,9,11,'DataObject','Assumenda sed veritatis. Asperiores nihil minus culpa in. Quia iusto perferendis reiciendis optio. Odit adipisci laborum. Ut est cumque.','2014-12-08 12:19:12','2014-12-08 12:19:12','2014-12-08 01:20:13',0,0,NULL,NULL,0),(12,9,12,'DataObject','Quo debitis vel consequuntur. Ut pariatur harum deleniti est repellendus. Sapiente beatae velit cum.','2014-12-08 12:19:12','2014-12-08 12:19:12','2014-12-08 00:20:13',0,0,NULL,NULL,0),(13,9,16,'DataObject','Ut asperiores commodi quis dolores voluptas corporis. Vel numquam est eligendi. Dolorem architecto eum omnis perferendis beatae. Omnis aliquam eum excepturi ut esse.','2014-12-08 12:19:13','2014-12-08 12:19:13','2014-12-07 23:20:13',0,0,NULL,NULL,0),(14,9,17,'DataObject','Accusantium exercitationem voluptas qui. Quia dolorem eum culpa sint quas nostrum placeat. Facilis iusto et repudiandae veniam blanditiis debitis.','2014-12-08 12:19:13','2014-12-08 12:19:13','2014-12-07 22:20:13',0,0,NULL,NULL,0),(15,9,18,'DataObject','Quam aliquam dolorem at totam. Sint veritatis doloribus a molestiae. Et eos qui. Sed rerum dolorem quibusdam quas. Praesentium hic ea aut omnis.','2014-12-08 12:19:13','2014-12-08 12:19:13','2014-12-07 21:20:13',0,0,NULL,NULL,0),(16,9,19,'DataObject','Ut doloremque aliquid deserunt et quibusdam et est. Ut repellendus quae voluptas vero laudantium. Aperiam qui quas.','2014-12-08 12:19:13','2014-12-08 12:19:13','2014-12-07 20:20:13',0,0,NULL,NULL,0),(17,9,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:14','2014-12-08 12:19:14','2014-12-07 19:20:13',0,0,NULL,NULL,0),(18,4,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:14','2014-12-08 12:19:14','2014-12-07 18:20:13',0,0,NULL,NULL,0),(19,11,20,'DataObject','Molestiae nihil et vitae. Placeat omnis dolor ut suscipit ratione et aut. Id magnam nam sint porro praesentium iste.','2014-12-08 12:19:14','2014-12-08 12:19:14','2014-12-07 17:20:13',0,0,NULL,NULL,0),(20,11,21,'DataObject','Est aperiam rem culpa molestias aliquam omnis. Necessitatibus corporis dolor in nisi. Quo eligendi magni voluptatem architecto. Expedita iure id voluptatibus sint rerum veniam. Eos voluptas eaque sit est dolor architecto consequatur.','2014-12-08 12:19:14','2014-12-08 12:19:14','2014-12-07 16:20:13',0,0,NULL,NULL,0),(21,11,25,'DataObject','Corporis ipsam dolorem. Dolores velit in. Cumque officiis a. Blanditiis porro aut ex vitae optio. Nobis porro impedit rem culpa velit voluptatibus architecto.','2014-12-08 12:19:14','2014-12-08 12:19:14','2014-12-07 15:20:13',0,0,NULL,NULL,0),(22,11,26,'DataObject','Sed beatae consequatur. Ut rerum asperiores voluptatibus laudantium reiciendis eligendi voluptatem. Vero deserunt sit et quibusdam et numquam est.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 14:20:13',0,0,NULL,NULL,0),(23,11,27,'DataObject','Perferendis voluptatem consequuntur molestiae voluptates. Consequatur ex rerum. Aut qui laborum eaque aliquam sed esse. Officiis autem excepturi alias sint magnam qui. Ea nihil officia ipsa dolorem.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 13:20:13',0,0,NULL,NULL,0),(24,11,28,'DataObject','Nulla et placeat eum. Quia maxime culpa. Est et odit ut quae unde. Eos consectetur sint nulla debitis perferendis modi. Exercitationem mollitia omnis.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 12:20:13',0,0,NULL,NULL,0),(25,6,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 11:20:13',0,0,NULL,NULL,0),(26,3,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 10:20:13',0,0,NULL,NULL,0),(27,13,29,'DataObject','Quidem perferendis reiciendis rerum mollitia vero itaque. Nemo blanditiis animi. Hic illum maxime nobis. Error amet ut possimus quo facilis. Ex et inventore aut ratione.','2014-12-08 12:19:15','2014-12-08 12:19:15','2014-12-07 09:20:13',0,0,NULL,NULL,0),(28,13,30,'DataObject','Doloremque et dolorum nihil laborum. Praesentium doloribus numquam. Laborum maiores tempore soluta quo. Repudiandae sit omnis labore. Sed molestiae quam natus.','2014-12-08 12:19:16','2014-12-08 12:19:16','2014-12-07 08:20:13',0,0,NULL,NULL,0),(29,13,34,'DataObject','Fugit et voluptatem cum sit. Voluptas accusantium illo qui illum sunt dolor. Sit vero id recusandae tempora sit sed cumque. Eius ipsa sint provident omnis dolor.','2014-12-08 12:19:16','2014-12-08 12:19:16','2014-12-07 07:20:13',0,0,NULL,NULL,0),(30,13,35,'DataObject','Rerum dolor eum officia debitis labore sint. Facilis officia modi non quia alias. Velit minima maxime labore.','2014-12-08 12:19:16','2014-12-08 12:19:16','2014-12-07 06:20:13',0,0,NULL,NULL,0),(31,13,36,'DataObject','Officia necessitatibus hic iure aut. Non totam incidunt odit officiis non. Corporis ex corrupti consectetur aperiam aut magnam quibusdam. Eaque ipsum et pariatur natus. Veritatis suscipit et error nulla voluptas.','2014-12-08 12:19:16','2014-12-08 12:19:16','2014-12-07 05:20:13',0,0,NULL,NULL,0),(32,13,37,'DataObject','Dolorem in nesciunt. Harum eum repellat qui aperiam omnis nemo. Nihil ducimus eum aliquam autem rerum voluptatibus et. Libero ipsam voluptatem est et sit et.','2014-12-08 12:19:16','2014-12-08 12:19:16','2014-12-07 04:20:13',0,0,NULL,NULL,0),(33,14,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:17','2014-12-08 12:19:17','2014-12-07 03:20:13',0,0,NULL,NULL,0),(34,9,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:17','2014-12-08 12:19:17','2014-12-07 02:20:13',0,0,NULL,NULL,0),(35,15,38,'DataObject','Nisi id expedita minus perspiciatis cupiditate ipsa. Omnis fuga nam voluptatum iure repudiandae error. Consequuntur perspiciatis odit officiis ipsam repudiandae omnis. Nesciunt optio id ipsam eius. Maiores quia optio.','2014-12-08 12:19:17','2014-12-08 12:19:17','2014-12-07 01:20:13',0,0,NULL,NULL,0),(36,15,39,'DataObject','Qui suscipit nostrum debitis. Voluptas quos deleniti facere et sapiente quaerat. Eaque eum qui dolores vero explicabo quis.','2014-12-08 12:19:17','2014-12-08 12:19:17','2014-12-07 00:20:13',0,0,NULL,NULL,0),(37,15,43,'DataObject','Nam eius repellendus. Id tempora fuga sint repellendus rem magni. Dicta ullam porro earum.','2014-12-08 12:19:18','2014-12-08 12:19:18','2014-12-06 23:20:13',0,0,NULL,NULL,0),(38,15,44,'DataObject','Aut soluta fuga consectetur. Harum qui consequatur ex sit nihil. Laborum delectus unde eius voluptate praesentium minima qui.','2014-12-08 12:19:18','2014-12-08 12:19:18','2014-12-06 22:20:13',0,0,NULL,NULL,0),(39,15,45,'DataObject','Ducimus illo et suscipit eos quasi. Odit omnis quia. Quidem iusto nesciunt temporibus aperiam totam aspernatur aut. Sint sit autem non similique quia harum. Quia aperiam nihil eligendi.','2014-12-08 12:19:18','2014-12-08 12:19:18','2014-12-06 21:20:13',0,0,NULL,NULL,0),(40,15,46,'DataObject','Accusantium dolores sit molestiae nulla. Sit veniam praesentium sit consequatur omnis tempore. Reprehenderit officia molestiae blanditiis quod. Officia eaque modi eos non dolor et qui. Enim qui officia dolor consequatur voluptate tempora.','2014-12-08 12:19:18','2014-12-08 12:19:18','2014-12-06 20:20:13',0,0,NULL,NULL,0),(41,1,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 19:20:13',0,0,NULL,NULL,0),(42,5,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 18:20:13',0,0,NULL,NULL,0),(43,17,47,'DataObject','First comment','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 17:20:13',0,0,NULL,NULL,0),(44,17,47,'DataObject','Error asperiores delectus. Iste facilis eveniet molestiae. Dolores omnis molestiae sit sunt. Autem iure est consequatur autem voluptas quos.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 16:20:13',0,0,NULL,NULL,0),(45,17,47,'DataObject','Qui reprehenderit asperiores. Dignissimos vel cum mollitia blanditiis quibusdam iste. Et qui nisi eos.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 15:20:13',0,0,NULL,NULL,0),(46,17,47,'DataObject','Ipsum magnam dolorum explicabo doloremque deleniti quia ut. Assumenda illum dolores. Qui accusamus in. Ut doloribus at sit impedit quasi officia.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 14:20:13',0,0,NULL,NULL,0),(47,17,47,'DataObject','Illo necessitatibus vel quo similique velit totam. A aliquam ipsum ad perspiciatis provident nihil. Dolores nostrum et omnis inventore. Blanditiis maiores error ex corporis vel. Unde voluptas maxime iusto in qui nemo.','2014-12-08 12:19:19','2014-12-08 12:19:19','2014-12-06 13:20:13',0,0,NULL,NULL,0),(48,17,47,'DataObject','Aperiam sed eligendi eum. Aliquam nobis quisquam iusto nulla autem possimus vitae. Aut consectetur eos doloribus ut aperiam.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 12:20:13',0,0,NULL,NULL,0),(49,17,47,'DataObject','Voluptas et molestiae vitae. Praesentium aliquam sunt sequi. Maiores temporibus ut ipsa. Sed et sit impedit eum.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 11:20:13',0,0,NULL,NULL,0),(50,17,47,'DataObject','Est non dolorem. Cum et numquam ipsa nostrum. Pariatur nobis labore mollitia. Consequatur porro aliquid pariatur eos omnis ratione. Corporis voluptatem animi corrupti deserunt est.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 10:20:13',0,0,NULL,NULL,0),(51,17,47,'DataObject','Recusandae pariatur laborum voluptatum tempora et exercitationem explicabo. Nihil et et inventore aperiam veritatis. Ea voluptatem sapiente cumque in similique voluptatibus. Recusandae consequatur voluptatum dolorum natus. Labore ratione voluptate.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 09:20:13',0,0,NULL,NULL,0),(52,17,47,'DataObject','Autem expedita qui voluptatem tempora odio qui consequuntur. Nulla aliquid quia molestias autem sit tenetur. Officia eligendi eaque magnam neque omnis. Excepturi accusamus voluptatem ut sed repudiandae voluptatem.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 08:20:13',0,0,NULL,NULL,0),(53,17,47,'DataObject','Id ut ut. Voluptatem natus doloremque occaecati illo sunt sequi iusto. Eos ut quo earum quia. Impedit numquam sit corporis quisquam beatae facilis. Repellat repudiandae quaerat qui ea sint.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 07:20:13',0,0,NULL,NULL,0),(54,17,47,'DataObject','Doloribus occaecati aspernatur quia facilis esse. Voluptas sint qui id non quisquam culpa possimus. At voluptatem rerum dolorem voluptatem omnis quia.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 06:20:13',0,0,NULL,NULL,0),(55,17,48,'DataObject','Praesentium quisquam eos. Rerum quo officia incidunt non. Ad delectus molestiae totam et. Sit aut laboriosam voluptatibus fugit.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 05:20:13',0,0,NULL,NULL,0),(56,17,49,'DataObject','Labore sint ducimus assumenda quo sed adipisci sunt. Distinctio eos qui similique consequatur nostrum voluptatem. Nobis porro et eligendi occaecati quia aperiam in. Magni distinctio autem repellendus reiciendis quidem adipisci deleniti.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 04:20:13',0,0,NULL,NULL,0),(57,17,50,'DataObject','Quis odio ut asperiores nobis perspiciatis esse. A vel dolorum inventore est ipsum aut optio. Quia ut pariatur quaerat quo magni.','2014-12-08 12:19:20','2014-12-08 12:19:20','2014-12-06 03:20:13',0,0,NULL,NULL,0),(58,17,51,'DataObject','Maiores mollitia omnis. Quia dicta quia odio at sit vero. Voluptas aut voluptatem non nesciunt. Qui reiciendis iste aliquid asperiores eos eligendi. Nemo id at ea rem cumque consequatur commodi.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-06 02:20:13',0,0,NULL,NULL,0),(59,17,52,'DataObject','Laudantium similique consequatur quo consequatur. Perferendis eaque blanditiis quo distinctio. Commodi officiis nemo voluptatem veritatis quas quos soluta. Nihil maiores quas et nobis inventore dolorem. Provident odio error rem nobis quo.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-06 01:20:13',0,0,NULL,NULL,0),(60,17,53,'DataObject','Aut neque fugit enim et. Qui numquam assumenda nihil eveniet nam. Enim sed minus praesentium. Non ex tempore temporibus rerum natus iure voluptatum. Suscipit sit consequatur eos pariatur ratione est.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-06 00:20:13',0,0,NULL,NULL,0),(61,17,54,'DataObject','Quam omnis animi quo nisi at placeat quia. A perferendis voluptatibus architecto maxime. Corrupti consectetur illo maxime et. Quod necessitatibus cumque atque corrupti hic. Ipsa velit inventore eligendi omnis nobis.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-05 23:20:13',0,0,NULL,NULL,0),(62,17,55,'DataObject','Explicabo et sunt enim laudantium dolorum. Voluptatem laborum et est enim architecto minima nesciunt. Unde iure aliquid dolor. Tempora eum dolor nemo exercitationem aut.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-05 22:20:13',0,0,NULL,NULL,0),(63,17,59,'DataObject','Eos voluptatibus voluptatem dolorem accusamus molestiae ea. Molestias sint officiis soluta adipisci atque. Nam ducimus id numquam voluptatem rerum neque commodi. Sit repellat voluptatem. Sint accusamus non.','2014-12-08 12:19:21','2014-12-08 12:19:21','2014-12-05 21:20:13',0,0,NULL,NULL,0),(64,17,60,'DataObject','Atque nihil hic repellendus quia. Enim esse magni unde officiis. Iusto nostrum laudantium et. Eum quae sed.','2014-12-08 12:19:22','2014-12-08 12:19:22','2014-12-05 20:20:13',0,0,NULL,NULL,0),(65,17,61,'DataObject','Quaerat aut ut officia dolor. Et accusantium doloremque sint. Ab placeat velit quo ut ut. Et fugit tempore eos. Dolorem mollitia corporis nihil aliquam.','2014-12-08 12:19:22','2014-12-08 12:19:22','2014-12-05 19:20:13',0,0,NULL,NULL,0),(66,17,62,'DataObject','Iusto inventore assumenda perferendis. Veritatis inventore tempore fuga tenetur illum vel. Pariatur omnis provident aliquid et dolorem facilis. Veniam et deleniti veritatis sit nostrum corrupti atque.','2014-12-08 12:19:22','2014-12-08 12:19:22','2014-12-05 18:20:13',0,0,NULL,NULL,0),(67,18,47,'DataObject','Second comment','2014-12-08 12:19:22','2014-12-08 12:19:22','2014-12-05 17:20:13',0,0,NULL,NULL,0),(68,18,47,'DataObject','Third comment','2014-12-08 12:19:22','2014-12-08 12:19:22','2014-12-05 16:20:13',0,0,NULL,NULL,0),(69,18,47,'DataObject','Forth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 15:20:13',0,0,NULL,NULL,0),(70,18,47,'DataObject','Fifth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 14:20:13',0,0,NULL,NULL,0),(71,18,47,'DataObject','Sixth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 13:20:13',0,0,NULL,NULL,0),(72,18,47,'DataObject','Seventh comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 12:20:13',0,0,NULL,NULL,0),(73,18,47,'DataObject','Eighth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 11:20:13',0,0,NULL,NULL,0),(74,18,47,'DataObject','Nineth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 10:20:13',0,0,NULL,NULL,0),(75,18,47,'DataObject','Tenth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 09:20:13',0,0,NULL,NULL,0),(76,18,47,'DataObject','Eleventh comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 08:20:13',0,0,NULL,NULL,0),(77,18,47,'DataObject','Twelveth comment','2014-12-08 12:19:23','2014-12-08 12:19:23','2014-12-05 07:20:13',0,0,NULL,NULL,0),(78,26,66,'DataObject','Amet dolores velit. Excepturi quidem et porro sed vel. Quis aliquid quos.','2014-12-08 12:19:25','2014-12-08 12:19:25','2014-12-05 06:20:13',0,0,NULL,NULL,0),(79,26,66,'DataObject','Et nemo qui laborum dolores. Consequatur laboriosam veniam quis aut quidem modi doloremque. Illum et perferendis qui atque voluptatem. Quae vel ipsum quas unde et autem aut.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 05:20:13',0,0,NULL,NULL,0),(80,26,66,'DataObject','Omnis sed non ipsum facere. Ab quia id quisquam tenetur ullam eum. Cum amet reiciendis ut molestias. Eaque dolore quidem cupiditate. Ex quo est officiis aut omnis in.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 04:20:13',0,0,NULL,NULL,0),(81,26,66,'DataObject','Vitae deleniti nihil. Sit ab amet molestiae corrupti sed natus. Nulla nihil quasi quidem.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 03:20:13',0,0,NULL,NULL,0),(82,26,66,'DataObject','Explicabo accusamus aut dolores quisquam voluptatem maiores. In enim a rerum alias omnis. Soluta et est dolore. Aut omnis ea neque molestiae earum.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 02:20:13',0,0,NULL,NULL,0),(83,26,66,'DataObject','Iusto quia exercitationem. Velit et at et atque. Blanditiis hic magni ipsa corporis dolor tempore voluptatibus.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 01:20:13',0,0,NULL,NULL,0),(84,26,66,'DataObject','Aut harum quaerat. Ipsam sed aut qui consequatur perspiciatis harum fuga. Voluptatum autem deserunt nesciunt non eaque molestiae id. Et rerum iusto natus.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-05 00:20:13',0,0,NULL,NULL,0),(85,26,66,'DataObject','Ea odit facilis et. Necessitatibus enim voluptates aut qui sunt quia. Magni modi ipsam quidem pariatur. Veniam omnis non dolorem.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 23:20:13',0,0,NULL,NULL,0),(86,26,66,'DataObject','Similique eos delectus repellendus sint accusantium. Unde alias nesciunt. Et delectus iusto officia est.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 22:20:13',0,0,NULL,NULL,0),(87,26,66,'DataObject','Sed qui mollitia eos nesciunt. Tempora explicabo autem fugiat labore id qui. Dolores commodi fugit omnis totam.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 21:20:13',0,0,NULL,NULL,0),(88,26,66,'DataObject','Delectus porro veniam consequuntur. Rerum vitae laudantium non adipisci maiores. Corrupti cupiditate illo voluptas quia maxime. Commodi maxime ex voluptatum quo molestias quasi. Suscipit aut vel occaecati porro repudiandae ab.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 20:20:13',0,0,NULL,NULL,0),(89,26,66,'DataObject','Non vel dignissimos impedit quis nam similique recusandae. Aut ab eveniet quia blanditiis rerum praesentium. Unde beatae necessitatibus illum exercitationem non.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 19:20:13',0,0,NULL,NULL,0),(90,26,67,'DataObject','Sit nobis consequuntur et debitis. Id quam nam eveniet harum nesciunt. Impedit labore ipsum qui et dolor. Delectus sed aliquam iusto expedita suscipit in. Tempora ad suscipit maxime.','2014-12-08 12:19:26','2014-12-08 12:19:26','2014-12-04 18:20:13',0,0,NULL,NULL,0),(91,26,68,'DataObject','Aut dolore laudantium quaerat. Ipsa optio quam numquam deserunt eligendi id. Est ex quis occaecati voluptatibus aut. Quia alias atque molestias maxime facere incidunt aspernatur.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 17:20:13',0,0,NULL,NULL,0),(92,26,69,'DataObject','Deserunt aperiam magnam aspernatur debitis. Error facere hic eaque dolor earum eos quae. Facere fuga maxime earum et et odio corporis. Placeat qui repudiandae dolores velit tenetur praesentium. Deleniti cumque qui cupiditate sunt autem iste.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 16:20:13',0,0,NULL,NULL,0),(93,26,70,'DataObject','Voluptas et molestiae facilis. Ut occaecati aliquid voluptates. Qui laboriosam quas occaecati nobis similique sit. Aut sed dolores blanditiis quis. Facilis exercitationem repellat.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 15:20:13',0,0,NULL,NULL,0),(94,26,71,'DataObject','Maxime saepe commodi ipsum. Voluptatem non quia ipsum. Unde et nihil est quisquam nesciunt. Velit laborum dolor et fuga consequuntur reprehenderit quisquam.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 14:20:13',0,0,NULL,NULL,0),(95,26,72,'DataObject','In eligendi aut quidem deserunt et architecto et. Laudantium sunt aperiam. Nisi eum blanditiis vel quod quo.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 13:20:13',0,0,NULL,NULL,0),(96,26,73,'DataObject','Dolorem eligendi dignissimos. Velit qui tenetur et unde porro quas vitae. Dignissimos temporibus corrupti commodi accusantium explicabo quasi doloribus.','2014-12-08 12:19:27','2014-12-08 12:19:27','2014-12-04 12:20:13',0,0,NULL,NULL,0),(97,26,74,'DataObject','Vero id sunt et et. Enim veritatis rerum ut consequuntur fugit possimus. Perspiciatis eos omnis maxime consequuntur at et dolore.','2014-12-08 12:19:28','2014-12-08 12:19:28','2014-12-04 11:20:13',0,0,NULL,NULL,0),(98,26,78,'DataObject','Autem excepturi consequatur explicabo repudiandae. Magnam nihil sunt dicta dolore voluptate. Cum magnam ea dolore et fugiat. Perferendis laboriosam consequatur.','2014-12-08 12:19:28','2014-12-08 12:19:28','2014-12-04 10:20:13',0,0,NULL,NULL,0),(99,26,79,'DataObject','Hic dolore culpa. Perspiciatis nihil illum. Et cum voluptate esse. Ad nemo voluptatem aut quidem.','2014-12-08 12:19:28','2014-12-08 12:19:28','2014-12-04 09:20:13',0,0,NULL,NULL,0),(100,26,80,'DataObject','Qui fugiat nulla aspernatur distinctio nostrum. Dignissimos iste fugiat repellendus totam et qui. In nostrum repellat cupiditate debitis laboriosam itaque blanditiis. Dolor at minima ab ipsa et sint.','2014-12-08 12:19:29','2014-12-08 12:19:29','2014-12-04 08:20:13',0,0,NULL,NULL,0),(101,26,81,'DataObject','Quia ut praesentium quia deserunt eos et voluptatem. Et veniam placeat repudiandae at. Voluptas ipsa exercitationem sit nobis quia ut.','2014-12-08 12:19:29','2014-12-08 12:19:29','2014-12-04 07:20:13',0,0,NULL,NULL,0),(102,28,82,'DataObject','Veritatis et modi et commodi ut et voluptatum. Porro aut totam optio quibusdam. Sequi magnam ut sed quae.','2014-12-08 12:19:29','2014-12-08 12:19:29','2014-12-04 06:20:13',0,0,NULL,NULL,0),(103,28,88,'DataObject','Omnis quis ut ut aut. Dolor optio et est. Dolores odit sit vel quia corporis in. Voluptas aut modi. Nam et eius quia et quo.','2014-12-08 12:19:30','2014-12-08 12:19:30','2014-12-04 05:20:13',0,0,NULL,NULL,0),(104,28,89,'DataObject','Iste labore suscipit hic. Quod maiores error labore harum repellendus. Laborum voluptatem aspernatur dolorem quia. Magni iusto unde molestiae suscipit sit eos aut. Est facilis occaecati sunt.','2014-12-08 12:19:30','2014-12-08 12:19:30','2014-12-04 04:20:13',0,0,NULL,NULL,0),(105,1,88,'DataObject','this is a comment applied to the old overview','2014-12-08 12:19:31','2014-12-08 12:19:31','2014-12-04 03:20:13',0,0,NULL,NULL,0),(106,1,88,'DataObject','this is an invisible comment applied to the old overview',NULL,'2014-12-08 12:19:31','2014-12-04 02:20:13',0,0,NULL,NULL,0),(107,1,82,'DataObject','this is a comment applied to the old image','2014-12-08 12:19:31','2014-12-08 12:19:31','2014-12-04 01:20:13',0,0,NULL,NULL,0),(108,1,82,'DataObject','this is an invisible comment applied to the old image',NULL,'2014-12-08 12:19:31','2014-12-04 00:20:13',0,0,NULL,NULL,0),(109,1,90,'DataObject','brand new comment on the re-harvested overview','2014-12-08 12:19:31','2014-12-08 12:19:31','2014-12-03 23:20:13',0,0,NULL,NULL,0),(110,1,90,'DataObject','and an invisible comment on the re-harvested overview',NULL,'2014-12-08 12:19:31','2014-12-03 22:20:13',0,0,NULL,NULL,0),(111,1,91,'DataObject','lovely comment added after re-harvesting to the image','2014-12-08 12:19:32','2014-12-08 12:19:32','2014-12-03 21:20:13',0,0,NULL,NULL,0),(112,1,91,'DataObject','even wittier invisible comments on image after the harvest was redone.',NULL,'2014-12-08 12:19:32','2014-12-03 20:20:13',0,0,NULL,NULL,0),(113,14,18,'TaxonConcept','This is a witty comment on the Autaliquideri minimais taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:33','2014-12-08 12:19:33','2014-12-03 19:20:13',0,0,NULL,NULL,0),(114,33,92,'DataObject','In non et. Aspernatur eum quo quos. Neque expedita minima similique excepturi ut perspiciatis sed. Deserunt impedit corrupti corporis. Aut exercitationem velit numquam.','2014-12-08 12:19:33','2014-12-08 12:19:33','2014-12-03 18:20:13',0,0,NULL,NULL,0),(115,33,93,'DataObject','Sapiente et omnis. Aut non a odit saepe. Consectetur et perferendis ut consequatur sequi quae dignissimos.','2014-12-08 12:19:33','2014-12-08 12:19:33','2014-12-03 17:20:13',0,0,NULL,NULL,0),(116,33,97,'DataObject','Commodi nihil ut ipsa veritatis excepturi inventore necessitatibus. Nihil et ipsum molestiae. Consectetur ut perferendis est vel quasi perspiciatis ut. Unde sunt quasi aliquam nisi architecto nemo. Vitae nisi est repellat et excepturi temporibus.','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 16:20:13',0,0,NULL,NULL,0),(117,33,98,'DataObject','Ut ut necessitatibus voluptate. Non quia atque deserunt. Fuga harum omnis. Quas dolorem qui rerum voluptatem. Nam aliquid neque consequatur sit aut culpa et.','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 15:20:13',0,0,NULL,NULL,0),(118,33,99,'DataObject','Sunt quia dolores qui et quos. Laborum quia maiores in vel. Velit alias est voluptas libero neque. Ut eum officiis corrupti natus et.','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 14:20:13',0,0,NULL,NULL,0),(119,31,99,'DataObject','First comment','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 13:20:13',0,0,NULL,NULL,0),(120,31,99,'DataObject','Second comment','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 12:20:13',0,0,NULL,NULL,0),(121,31,99,'DataObject','Third comment','2014-12-08 12:19:34','2014-12-08 12:19:34','2014-12-03 11:20:13',0,0,NULL,NULL,0),(122,31,99,'DataObject','Forth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 10:20:13',0,0,NULL,NULL,0),(123,31,99,'DataObject','Fifth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 09:20:13',0,0,NULL,NULL,0),(124,31,99,'DataObject','Sixth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 08:20:13',0,0,NULL,NULL,0),(125,31,99,'DataObject','Seventh comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 07:20:13',0,0,NULL,NULL,0),(126,31,99,'DataObject','Eighth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 06:20:13',0,0,NULL,NULL,0),(127,31,99,'DataObject','Ninth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 05:20:13',0,0,NULL,NULL,0),(128,31,99,'DataObject','Tenth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 04:20:13',0,0,NULL,NULL,0),(129,31,99,'DataObject','Eleventh comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 03:20:13',0,0,NULL,NULL,0),(130,31,99,'DataObject','Twelfth comment','2014-12-08 12:19:35','2014-12-08 12:19:35','2014-12-03 02:20:13',0,0,NULL,NULL,0),(131,35,100,'DataObject','Expedita dolorem quia. Eos ipsum sed inventore. Qui dignissimos occaecati quisquam maiores quia id ullam. Fuga quisquam consectetur doloremque tempora.','2014-12-08 12:19:36','2014-12-08 12:19:36','2014-12-03 01:20:13',0,0,NULL,NULL,0),(132,5,20,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:38','2014-12-08 12:19:38','2014-12-03 00:20:13',0,0,NULL,NULL,0),(133,39,20,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:38','2014-12-08 12:19:38','2014-12-02 23:20:13',0,0,NULL,NULL,0),(134,39,101,'DataObject','Aut sunt quis labore est. Qui voluptate quisquam saepe animi qui quo rerum. Voluptatem est non omnis reiciendis.','2014-12-08 12:19:38','2014-12-08 12:19:38','2014-12-02 22:20:13',0,0,NULL,NULL,0),(135,39,102,'DataObject','Perspiciatis illum tenetur dolorem cum nulla laudantium incidunt. Ipsam hic mollitia rerum suscipit. Enim et atque culpa reprehenderit commodi voluptatum sint. Voluptatem asperiores et.','2014-12-08 12:19:38','2014-12-08 12:19:38','2014-12-02 21:20:14',0,0,NULL,NULL,0),(136,39,106,'DataObject','In autem consequatur perspiciatis modi. Sunt consequuntur commodi. Ipsum et numquam tempora libero repellendus odio sed.','2014-12-08 12:19:39','2014-12-08 12:19:39','2014-12-02 20:20:14',0,0,NULL,NULL,0),(137,39,107,'DataObject','Distinctio laudantium culpa voluptatibus veniam ratione. Est veniam ipsa quia. Dolor et doloremque quo adipisci eum. Et odit id. Ad aspernatur dolor.','2014-12-08 12:19:39','2014-12-08 12:19:39','2014-12-02 19:20:14',0,0,NULL,NULL,0),(138,39,108,'DataObject','Nam et pariatur. Recusandae vel beatae voluptatem sunt. Excepturi exercitationem pariatur occaecati. Tempora totam et molestiae asperiores perferendis.','2014-12-08 12:19:39','2014-12-08 12:19:39','2014-12-02 18:20:14',0,0,NULL,NULL,0),(139,39,109,'DataObject','Veniam optio consectetur velit alias rem. Vitae perspiciatis iusto fugit magni. Tempora quae mollitia veritatis doloribus odio sed. Quisquam et animi.','2014-12-08 12:19:39','2014-12-08 12:19:39','2014-12-02 17:20:14',0,0,NULL,NULL,0),(140,36,21,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:41','2014-12-08 12:19:41','2014-12-02 16:20:14',0,0,NULL,NULL,0),(141,44,21,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:41','2014-12-08 12:19:41','2014-12-02 15:20:14',0,0,NULL,NULL,0),(142,44,110,'DataObject','Mollitia quis nam ad qui. Accusantium sed qui. Id sequi rem perspiciatis fuga quo itaque. Fuga et repellat reiciendis accusamus et. Quia alias quo.','2014-12-08 12:19:41','2014-12-08 12:19:41','2014-12-02 14:20:14',0,0,NULL,NULL,0),(143,44,111,'DataObject','Eligendi eos alias culpa aut. Ut excepturi incidunt. Illum quibusdam est sapiente suscipit quia. Ea cupiditate non exercitationem saepe ad. Omnis consectetur nesciunt repellat enim.','2014-12-08 12:19:41','2014-12-08 12:19:41','2014-12-02 13:20:14',0,0,NULL,NULL,0),(144,44,115,'DataObject','Iusto praesentium deserunt corrupti non et. Sunt recusandae similique adipisci at neque. Ut ad eius minima quidem eveniet. Earum aliquid quis. Molestias explicabo earum.','2014-12-08 12:19:42','2014-12-08 12:19:42','2014-12-02 12:20:14',0,0,NULL,NULL,0),(145,44,116,'DataObject','Nulla est quos harum. Eveniet sit qui dolor occaecati. Rem fugiat placeat doloremque et eligendi ut aperiam.','2014-12-08 12:19:42','2014-12-08 12:19:42','2014-12-02 11:20:14',0,0,NULL,NULL,0),(146,44,117,'DataObject','Fugit excepturi nisi voluptas saepe nulla eum quas. Earum provident laboriosam cum explicabo. Sit sed dolorum sunt dignissimos tenetur quae. Pariatur odio dolore officiis maxime quo similique.','2014-12-08 12:19:42','2014-12-08 12:19:42','2014-12-02 10:20:14',0,0,NULL,NULL,0),(147,44,118,'DataObject','Sed pariatur et qui dicta. Maxime quia mollitia nostrum. Eaque quis et quod. Consequatur possimus aut blanditiis. Odit facilis ea possimus assumenda iste.','2014-12-08 12:19:42','2014-12-08 12:19:42','2014-12-02 09:20:14',0,0,NULL,NULL,0),(148,36,22,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:43','2014-12-08 12:19:43','2014-12-02 08:20:14',0,0,NULL,NULL,0),(149,17,22,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:43','2014-12-08 12:19:43','2014-12-02 07:20:14',0,0,NULL,NULL,0),(150,46,119,'DataObject','Officiis voluptatem est velit consequatur sed dolore quo. Nisi sequi quidem voluptas qui numquam. Minima ut veniam. Distinctio dolor itaque expedita neque.','2014-12-08 12:19:43','2014-12-08 12:19:43','2014-12-02 06:20:14',0,0,NULL,NULL,0),(151,46,120,'DataObject','Cum dignissimos dicta sapiente architecto in. Voluptatem nesciunt architecto. Voluptatem adipisci vitae.','2014-12-08 12:19:43','2014-12-08 12:19:43','2014-12-02 05:20:14',0,0,NULL,NULL,0),(152,46,124,'DataObject','Reiciendis et architecto distinctio provident rerum atque. Et amet sit explicabo consectetur ut aut soluta. Voluptate voluptas nemo aut quo id. Suscipit dolor assumenda nihil qui consequatur magnam. Nihil voluptas qui aut qui.','2014-12-08 12:19:44','2014-12-08 12:19:44','2014-12-02 04:20:14',0,0,NULL,NULL,0),(153,46,125,'DataObject','Odit recusandae rerum doloremque odio ad qui. Unde rerum qui voluptas et sit. A mollitia pariatur perspiciatis.','2014-12-08 12:19:44','2014-12-08 12:19:44','2014-12-02 03:20:14',0,0,NULL,NULL,0),(154,46,126,'DataObject','Hic sequi dignissimos dolore similique quod. Consequatur tempora deleniti eius non. Itaque est optio deleniti sapiente dolorum voluptatem.','2014-12-08 12:19:44','2014-12-08 12:19:44','2014-12-02 02:20:14',0,0,NULL,NULL,0),(155,46,127,'DataObject','Quasi ipsa nam amet sed sapiente sit est. Ratione possimus molestiae enim eveniet consectetur aut. Exercitationem quae praesentium non voluptates excepturi perspiciatis.','2014-12-08 12:19:44','2014-12-08 12:19:44','2014-12-02 01:20:14',0,0,NULL,NULL,0),(156,9,23,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:45','2014-12-08 12:19:45','2014-12-02 00:20:14',0,0,NULL,NULL,0),(157,38,23,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:45','2014-12-08 12:19:45','2014-12-01 23:20:14',0,0,NULL,NULL,0),(158,48,128,'DataObject','Magnam incidunt occaecati aliquam similique excepturi voluptatem et. Aspernatur beatae ut. Dolor placeat porro sunt et eius ratione iure. Et ducimus quo possimus exercitationem tempora.','2014-12-08 12:19:45','2014-12-08 12:19:45','2014-12-01 22:20:14',0,0,NULL,NULL,0),(159,48,129,'DataObject','Expedita facilis laborum necessitatibus aut. Dolor velit molestiae temporibus. Provident eos vel sunt et maiores rem.','2014-12-08 12:19:45','2014-12-08 12:19:45','2014-12-01 21:20:14',0,0,NULL,NULL,0),(160,48,133,'DataObject','Quisquam exercitationem in eveniet sed modi qui. Reprehenderit quos at sed quaerat. Velit occaecati ducimus nihil laboriosam sequi esse. Et vitae laudantium reprehenderit voluptatem pariatur quis.','2014-12-08 12:19:46','2014-12-08 12:19:46','2014-12-01 20:20:14',0,0,NULL,NULL,0),(161,48,134,'DataObject','Voluptatem est et est alias. Voluptatem aperiam incidunt. Illo eius modi quibusdam enim rerum sed.','2014-12-08 12:19:46','2014-12-08 12:19:46','2014-12-01 19:20:14',0,0,NULL,NULL,0),(162,48,135,'DataObject','Consequatur consequuntur nostrum provident eveniet eius cupiditate. Alias sapiente est rerum et aut at. Tenetur laudantium at ea temporibus suscipit nihil. Et incidunt explicabo sapiente. Labore maiores earum nobis culpa.','2014-12-08 12:19:46','2014-12-08 12:19:46','2014-12-01 18:20:14',0,0,NULL,NULL,0),(163,48,136,'DataObject','Et ea aut reprehenderit placeat deserunt quae repellat. Rem rerum animi qui et ipsa laudantium magnam. Eius ducimus iste laudantium beatae blanditiis. Molestiae culpa voluptatem soluta.','2014-12-08 12:19:47','2014-12-08 12:19:47','2014-12-01 17:20:14',0,0,NULL,NULL,0),(164,20,24,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:47','2014-12-08 12:19:47','2014-12-01 16:20:14',0,0,NULL,NULL,0),(165,43,24,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:47','2014-12-08 12:19:47','2014-12-01 15:20:14',0,0,NULL,NULL,0),(166,50,137,'DataObject','Quos eum accusamus. Laudantium sed et nobis quod accusantium corrupti earum. Et aliquam eius ratione quo enim. Et omnis rem tempore rerum consequatur esse ut.','2014-12-08 12:19:47','2014-12-08 12:19:47','2014-12-01 14:20:14',0,0,NULL,NULL,0),(167,50,138,'DataObject','Voluptatem eaque ut voluptatem vitae qui ut. Et at aut. Ut et non id sed. Natus rerum quas.','2014-12-08 12:19:47','2014-12-08 12:19:47','2014-12-01 13:20:14',0,0,NULL,NULL,0),(168,50,142,'DataObject','Et aperiam odit quam quis nemo. Rem velit repellendus et expedita modi. Quos cupiditate ut aspernatur aut reprehenderit expedita debitis. Voluptatem animi nostrum et dolorum voluptatem sed reiciendis. Quis voluptatem nihil.','2014-12-08 12:19:48','2014-12-08 12:19:48','2014-12-01 12:20:14',0,0,NULL,NULL,0),(169,50,143,'DataObject','Voluptatem tenetur voluptas. Doloremque dolor quia est amet saepe. Eos minima ab ut reiciendis a. Qui non qui. Id est harum quos.','2014-12-08 12:19:48','2014-12-08 12:19:48','2014-12-01 11:20:14',0,0,NULL,NULL,0),(170,50,144,'DataObject','Recusandae cum minima soluta dolorum sed nesciunt labore. Velit accusantium qui sit sapiente omnis. Ut perferendis ex.','2014-12-08 12:19:48','2014-12-08 12:19:48','2014-12-01 10:20:14',0,0,NULL,NULL,0),(171,50,145,'DataObject','Suscipit minus quis perspiciatis earum sit rerum. Id sunt velit. Tenetur ea corporis voluptas perferendis.','2014-12-08 12:19:48','2014-12-08 12:19:48','2014-12-01 09:20:14',0,0,NULL,NULL,0),(172,44,25,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:49','2014-12-08 12:19:49','2014-12-01 08:20:14',0,0,NULL,NULL,0),(173,9,25,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:49','2014-12-08 12:19:49','2014-12-01 07:20:14',0,0,NULL,NULL,0),(174,52,146,'DataObject','Similique expedita eveniet sint vero. Voluptas expedita qui doloribus. Et asperiores non rerum. Enim nulla et neque.','2014-12-08 12:19:49','2014-12-08 12:19:49','2014-12-01 06:20:14',0,0,NULL,NULL,0),(175,52,147,'DataObject','Quia eaque voluptas. Asperiores doloribus sed ipsa est et. Quia dolorem asperiores. Fugiat earum est. Asperiores optio debitis consequatur autem.','2014-12-08 12:19:49','2014-12-08 12:19:49','2014-12-01 05:20:14',0,0,NULL,NULL,0),(176,52,151,'DataObject','Possimus voluptatum voluptatem fugit id. Iure voluptatibus officia. Tenetur id dolores saepe rerum vitae ad. In et eos. Repellendus nam voluptas amet.','2014-12-08 12:19:50','2014-12-08 12:19:50','2014-12-01 04:20:14',0,0,NULL,NULL,0),(177,52,152,'DataObject','Nobis impedit ab qui veritatis maiores. Quia molestiae doloremque nemo et corporis. Omnis rem nulla non aperiam tempora vel culpa.','2014-12-08 12:19:50','2014-12-08 12:19:50','2014-12-01 03:20:14',0,0,NULL,NULL,0),(178,52,153,'DataObject','Exercitationem facilis accusantium sit ea laudantium beatae. Saepe soluta eligendi blanditiis dolorem recusandae. Quos est ipsa nihil sapiente adipisci.','2014-12-08 12:19:50','2014-12-08 12:19:50','2014-12-01 02:20:14',0,0,NULL,NULL,0),(179,52,154,'DataObject','Est qui iste et facere dolorem ab. Ad ut ut molestiae. Sequi adipisci suscipit. Qui quia nostrum et recusandae veritatis.','2014-12-08 12:19:50','2014-12-08 12:19:50','2014-12-01 01:20:14',0,0,NULL,NULL,0),(180,18,26,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:51','2014-12-08 12:19:51','2014-12-01 00:20:14',0,0,NULL,NULL,0),(181,23,26,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:51','2014-12-08 12:19:51','2014-11-30 23:20:14',0,0,NULL,NULL,0),(182,54,155,'DataObject','Fugit delectus eligendi a ducimus eaque. Fugiat alias autem corrupti dolore dolorem. Aliquam est aut reprehenderit magni ut. Labore et soluta perspiciatis et. Qui itaque suscipit quasi rerum.','2014-12-08 12:19:51','2014-12-08 12:19:51','2014-11-30 22:20:14',0,0,NULL,NULL,0),(183,54,156,'DataObject','Sed molestiae deserunt voluptas nam. Expedita voluptas consequatur ipsa itaque. Placeat incidunt exercitationem et eum in omnis iure. Sunt saepe quo modi omnis. Veniam dolore omnis quidem fugit.','2014-12-08 12:19:51','2014-12-08 12:19:51','2014-11-30 21:20:14',0,0,NULL,NULL,0),(184,54,160,'DataObject','Sed maiores labore et asperiores. Adipisci non dolore delectus sunt rerum. Qui suscipit quod praesentium. Voluptas dolores omnis.','2014-12-08 12:19:52','2014-12-08 12:19:52','2014-11-30 20:20:14',0,0,NULL,NULL,0),(185,54,161,'DataObject','Odio voluptatum iste molestiae. Corporis dolor et architecto cumque atque. Dolor praesentium minima omnis nihil rem est dolore. Qui sint quaerat quas.','2014-12-08 12:19:52','2014-12-08 12:19:52','2014-11-30 19:20:14',0,0,NULL,NULL,0),(186,54,162,'DataObject','Distinctio ea aliquid qui ut a fuga. Laborum veniam quod. Autem dolores iusto asperiores consectetur.','2014-12-08 12:19:52','2014-12-08 12:19:52','2014-11-30 18:20:14',0,0,NULL,NULL,0),(187,54,163,'DataObject','Tempora assumenda dolor culpa consequatur beatae nemo commodi. Aut sit eius. At ab illo perferendis tenetur neque. Vitae quae est sed praesentium nulla.','2014-12-08 12:19:52','2014-12-08 12:19:52','2014-11-30 17:20:14',0,0,NULL,NULL,0),(188,22,27,'TaxonConcept','This is a witty comment on the Molestiaeus rationealia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:53','2014-12-08 12:19:53','2014-11-30 16:20:14',0,0,NULL,NULL,0),(189,28,27,'TaxonConcept','This is a witty comment on the Molestiaeus rationealia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:53','2014-12-08 12:19:53','2014-11-30 15:20:14',0,0,NULL,NULL,0),(190,56,164,'DataObject','Excepturi in minima beatae. Quas velit est magnam molestias accusantium omnis. Asperiores dolore ipsa cupiditate. Ab sint laborum suscipit error ut et.','2014-12-08 12:19:53','2014-12-08 12:19:53','2014-11-30 14:20:14',0,0,NULL,NULL,0),(191,56,165,'DataObject','Maxime et ad exercitationem aut accusantium qui. Repellendus ut corrupti enim sint aut sequi. Omnis molestiae veritatis.','2014-12-08 12:19:53','2014-12-08 12:19:53','2014-11-30 13:20:14',0,0,NULL,NULL,0),(192,56,169,'DataObject','Laborum sit architecto explicabo voluptas. Temporibus non mollitia unde est sunt iste. Ullam qui sit voluptate corporis. Et sapiente sed officiis vero accusamus et quasi.','2014-12-08 12:19:54','2014-12-08 12:19:54','2014-11-30 12:20:14',0,0,NULL,NULL,0),(193,56,170,'DataObject','Molestias aut et. Vero aut consectetur. Et corrupti accusantium quidem commodi ea.','2014-12-08 12:19:54','2014-12-08 12:19:54','2014-11-30 11:20:14',0,0,NULL,NULL,0),(194,56,171,'DataObject','Omnis repellendus enim quae sed minima. Distinctio nobis ullam dolores laborum rem delectus. In quaerat in officiis sequi est. Eum vel dolorem incidunt eius non dolores occaecati.','2014-12-08 12:19:54','2014-12-08 12:19:54','2014-11-30 10:20:14',0,0,NULL,NULL,0),(195,56,172,'DataObject','Id odio fuga. Et deserunt optio voluptate. Et eveniet voluptatem.','2014-12-08 12:19:54','2014-12-08 12:19:54','2014-11-30 09:20:14',0,0,NULL,NULL,0),(196,45,28,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:55','2014-12-08 12:19:55','2014-11-30 08:20:14',0,0,NULL,NULL,0),(197,39,28,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:55','2014-12-08 12:19:55','2014-11-30 07:20:14',0,0,NULL,NULL,0),(198,58,173,'DataObject','Reprehenderit incidunt possimus dignissimos est iusto harum repellat. Corporis non expedita molestias animi ducimus. Et rerum est nihil. Nisi cupiditate adipisci libero praesentium laboriosam vel. Deserunt sapiente ut explicabo.','2014-12-08 12:19:55','2014-12-08 12:19:55','2014-11-30 06:20:14',0,0,NULL,NULL,0),(199,58,174,'DataObject','Ratione dolorem repudiandae animi sequi tempore eum quis. Beatae molestias corporis voluptatem. Dolore dolorem dignissimos deserunt voluptatem. Dolor tempore quidem omnis eligendi. Deleniti sint et quo dolores non.','2014-12-08 12:19:55','2014-12-08 12:19:55','2014-11-30 05:20:14',0,0,NULL,NULL,0),(200,58,178,'DataObject','Nesciunt saepe voluptatem. Quia provident suscipit culpa sapiente labore rerum. Suscipit non dolorem quae. Alias necessitatibus repellendus.','2014-12-08 12:19:55','2014-12-08 12:19:55','2014-11-30 04:20:14',0,0,NULL,NULL,0),(201,58,179,'DataObject','Est nam et. Quae magnam autem omnis. Ut qui autem error aspernatur est impedit. Suscipit sunt voluptates. Ipsa fuga voluptatem.','2014-12-08 12:19:56','2014-12-08 12:19:56','2014-11-30 03:20:14',0,0,NULL,NULL,0),(202,58,180,'DataObject','Unde iste eligendi iusto sed. Qui iure atque. Laudantium harum eos.','2014-12-08 12:19:56','2014-12-08 12:19:56','2014-11-30 02:20:14',0,0,NULL,NULL,0),(203,58,181,'DataObject','Laudantium qui ad cum. Facilis qui iste quo qui temporibus libero. Consectetur quo blanditiis.','2014-12-08 12:19:56','2014-12-08 12:19:56','2014-11-30 01:20:14',0,0,NULL,NULL,0),(204,45,29,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-30 00:20:14',0,0,NULL,NULL,0),(205,19,29,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-29 23:20:14',0,0,NULL,NULL,0),(206,60,182,'DataObject','Vel ab accusamus. Aliquid nesciunt quod praesentium totam rerum libero. Dolorem dolor laborum. Esse et qui labore sequi.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-29 22:20:14',0,0,NULL,NULL,0),(207,60,183,'DataObject','Beatae asperiores soluta et quisquam cum totam quia. Ut et laborum animi voluptatibus veniam. Minima nobis quasi autem deserunt esse. Molestias odio id. Sed autem ea iste rem voluptatibus.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-29 21:20:14',0,0,NULL,NULL,0),(208,60,187,'DataObject','Dolores odio eius. Ipsa porro voluptates quos soluta rerum. Velit porro repudiandae.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-29 20:20:14',0,0,NULL,NULL,0),(209,60,188,'DataObject','Est eum commodi nesciunt harum quis. Aliquid tempora sit in. Nam nesciunt dignissimos qui maxime voluptatem dolores. Laudantium officiis ut fugiat. Rerum vero quis voluptatem eos maxime qui.','2014-12-08 12:19:57','2014-12-08 12:19:57','2014-11-29 19:20:14',0,0,NULL,NULL,0),(210,60,189,'DataObject','Vel quidem deleniti porro reiciendis ullam ut quibusdam. Quia quod dolorum fuga harum eaque sequi eum. Et ipsa tempore eius qui. Sit aut veritatis. Eveniet sit nihil iure at deleniti et.','2014-12-08 12:19:58','2014-12-08 12:19:58','2014-11-29 18:20:14',0,0,NULL,NULL,0),(211,60,190,'DataObject','Placeat non repellat consequatur eos aut laboriosam incidunt. Nihil aut et error deleniti quidem. Ratione accusantium dolorem reiciendis tempore molestiae. Rerum aut similique placeat quo amet aut consequuntur.','2014-12-08 12:19:58','2014-12-08 12:19:58','2014-11-29 17:20:14',0,0,NULL,NULL,0),(212,49,30,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:58','2014-12-08 12:19:58','2014-11-29 16:20:14',0,0,NULL,NULL,0),(213,2,30,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:19:58','2014-12-08 12:19:58','2014-11-29 15:20:14',0,0,NULL,NULL,0),(214,62,191,'DataObject','Sit quisquam dolore rem inventore. Odit consequatur nam distinctio. Dolorem blanditiis quia ex assumenda. Ut voluptatibus ea.','2014-12-08 12:19:58','2014-12-08 12:19:58','2014-11-29 14:20:14',0,0,NULL,NULL,0),(215,62,192,'DataObject','Totam nobis eos. Ut quis ab. Repellendus iste odit iusto dicta praesentium sunt at. Nisi earum ducimus necessitatibus quas non qui. Aut voluptatem architecto laudantium.','2014-12-08 12:19:59','2014-12-08 12:19:59','2014-11-29 13:20:14',0,0,NULL,NULL,0),(216,62,196,'DataObject','Voluptas nobis quia eos vel. Odio architecto sed vitae laborum ducimus. Cum qui sapiente quaerat. Dolores aut expedita sit vel sit ipsa.','2014-12-08 12:19:59','2014-12-08 12:19:59','2014-11-29 12:20:14',0,0,NULL,NULL,0),(217,62,197,'DataObject','Sed quaerat rerum libero. Aut amet iusto nulla atque aut debitis. Soluta rerum in harum consequatur accusamus voluptatem. Quis iure est dolores quia.','2014-12-08 12:19:59','2014-12-08 12:19:59','2014-11-29 11:20:14',0,0,NULL,NULL,0),(218,62,198,'DataObject','Voluptatem error qui eligendi qui. Sunt ipsa aut ratione excepturi sit quisquam quo. Voluptas harum voluptatibus placeat ab sint sit dolorem. Expedita qui a temporibus sit aspernatur occaecati.','2014-12-08 12:19:59','2014-12-08 12:19:59','2014-11-29 10:20:14',0,0,NULL,NULL,0),(219,62,199,'DataObject','Mollitia natus atque ab sed et et illum. Voluptas dignissimos assumenda at quia. Ab consequuntur error est et. Et dicta placeat voluptate.','2014-12-08 12:20:00','2014-12-08 12:20:00','2014-11-29 09:20:14',0,0,NULL,NULL,0),(220,8,31,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:01','2014-12-08 12:20:01','2014-11-29 08:20:14',0,0,NULL,NULL,0),(221,48,31,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:01','2014-12-08 12:20:01','2014-11-29 07:20:14',0,0,NULL,NULL,0),(222,64,200,'DataObject','Sequi autem non dolores sunt non omnis nihil. Quia sed minus et. Quaerat blanditiis cum voluptatem. Nisi quae et repellat et.','2014-12-08 12:20:01','2014-12-08 12:20:01','2014-11-29 06:20:14',0,0,NULL,NULL,0),(223,64,201,'DataObject','Sed odit inventore non facere autem et. Cum qui fugit dolorum et. Dolores et nihil. Veritatis sit quidem eos qui fugiat. Assumenda et animi eligendi hic.','2014-12-08 12:20:01','2014-12-08 12:20:01','2014-11-29 05:20:14',0,0,NULL,NULL,0),(224,64,205,'DataObject','Enim dolores vitae consectetur rerum totam tempora sed. Aspernatur sed cupiditate laudantium alias. Perspiciatis veritatis eveniet. Quas fugit alias soluta est provident. In suscipit nemo ex cumque.','2014-12-08 12:20:01','2014-12-08 12:20:01','2014-11-29 04:20:14',0,0,NULL,NULL,0),(225,64,206,'DataObject','Quod voluptatibus quasi. Aliquam et explicabo et eaque. Illum aliquam eius quisquam itaque sit minus et. Deserunt quia enim non dolor alias culpa. Est enim omnis.','2014-12-08 12:20:02','2014-12-08 12:20:02','2014-11-29 03:20:14',0,0,NULL,NULL,0),(226,64,207,'DataObject','Et voluptatem sunt reiciendis aut. Aut eos vero qui pariatur occaecati architecto. Porro ut non. Consequatur qui nesciunt est rem qui.','2014-12-08 12:20:02','2014-12-08 12:20:02','2014-11-29 02:20:14',0,0,NULL,NULL,0),(227,64,208,'DataObject','Ut qui nisi. Maiores et et. Nulla sed doloremque numquam. Beatae temporibus aut vero ut ullam. Velit doloribus exercitationem natus et magni ducimus qui.','2014-12-08 12:20:02','2014-12-08 12:20:02','2014-11-29 01:20:14',0,0,NULL,NULL,0),(228,39,32,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:03','2014-12-08 12:20:03','2014-11-29 00:20:14',0,0,NULL,NULL,0),(229,31,32,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:03','2014-12-08 12:20:03','2014-11-28 23:20:14',0,0,NULL,NULL,0),(230,66,209,'DataObject','Sed illum praesentium voluptatem facere tempore. Eos minima repellat. Dicta natus delectus. Consequuntur minima voluptas.','2014-12-08 12:20:03','2014-12-08 12:20:03','2014-11-28 22:20:14',0,0,NULL,NULL,0),(231,66,210,'DataObject','Id in sed. Aut sed rerum iusto repellendus excepturi iure. Odio unde et. Atque nisi sed soluta officiis.','2014-12-08 12:20:03','2014-12-08 12:20:03','2014-11-28 21:20:14',0,0,NULL,NULL,0),(232,66,214,'DataObject','Impedit dolore ut ut suscipit. Ea exercitationem voluptates mollitia praesentium et saepe. Sed inventore autem qui ullam accusamus. Eos totam eligendi aut unde officia facilis dolores.','2014-12-08 12:20:03','2014-12-08 12:20:03','2014-11-28 20:20:14',0,0,NULL,NULL,0),(233,66,215,'DataObject','Consequatur sit accusantium. Nulla doloribus quia accusamus aut. Et quam error aut sint nesciunt eos. Sequi quia ut blanditiis velit non nisi. Quisquam perspiciatis id culpa rerum quas necessitatibus.','2014-12-08 12:20:04','2014-12-08 12:20:04','2014-11-28 19:20:14',0,0,NULL,NULL,0),(234,66,216,'DataObject','Eos itaque velit nostrum quis tempora totam. Incidunt id sit libero sit ea voluptatem aut. Itaque cumque sint aut omnis tempore facilis doloremque. Beatae officiis ut eveniet rerum. Rerum eos inventore quasi molestiae quod.','2014-12-08 12:20:04','2014-12-08 12:20:04','2014-11-28 18:20:14',0,0,NULL,NULL,0),(235,66,217,'DataObject','Est sint dolores voluptatem molestiae architecto. Doloremque eaque dolor et. Nesciunt molestiae eos autem suscipit iusto maxime. Eos voluptate sunt. Aut assumenda ex sed aut.','2014-12-08 12:20:04','2014-12-08 12:20:04','2014-11-28 17:20:14',0,0,NULL,NULL,0),(236,54,33,'TaxonConcept','This is a witty comment on the Adaliasii iurea taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:05','2014-12-08 12:20:05','2014-11-28 16:20:14',0,0,NULL,NULL,0),(237,42,33,'TaxonConcept','This is a witty comment on the Adaliasii iurea taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:05','2014-12-08 12:20:05','2014-11-28 15:20:14',0,0,NULL,NULL,0),(238,68,218,'DataObject','Neque nostrum sunt et vero eos placeat. Iste eos soluta iure amet aut. Autem fuga quia facere qui commodi id. Repellendus porro quo deserunt dolorem hic. Voluptas quia ratione quia sed.','2014-12-08 12:20:05','2014-12-08 12:20:05','2014-11-28 14:20:14',0,0,NULL,NULL,0),(239,68,219,'DataObject','Ullam illum et ea non nobis. Quia nostrum accusamus harum voluptatem itaque iure minima. Laudantium cumque consequatur minus deserunt voluptatem beatae enim. Ut deleniti facilis perspiciatis incidunt et.','2014-12-08 12:20:05','2014-12-08 12:20:05','2014-11-28 13:20:14',0,0,NULL,NULL,0),(240,68,223,'DataObject','Et quia eaque. Ullam consequatur aut eligendi odio ea maiores esse. Et voluptatem quae dolorum.','2014-12-08 12:20:06','2014-12-08 12:20:06','2014-11-28 12:20:14',0,0,NULL,NULL,0),(241,68,224,'DataObject','Quis saepe optio fuga ut. Temporibus eligendi quia numquam sed. Dolore eos dolorem magni culpa. Id eaque ad tempora occaecati et. Ea pariatur error natus inventore.','2014-12-08 12:20:06','2014-12-08 12:20:06','2014-11-28 11:20:14',0,0,NULL,NULL,0),(242,68,225,'DataObject','Omnis incidunt laboriosam officiis alias nisi quia. Quisquam aut ut aliquid temporibus aperiam. Quia vel recusandae officiis quisquam ratione qui.','2014-12-08 12:20:06','2014-12-08 12:20:06','2014-11-28 10:20:14',0,0,NULL,NULL,0),(243,68,226,'DataObject','Facere aut debitis atque. Enim quod officia beatae iste et placeat vero. Dolor quas quaerat voluptatem et. Sunt a labore amet ut sunt perferendis.','2014-12-08 12:20:06','2014-12-08 12:20:06','2014-11-28 09:20:14',0,0,NULL,NULL,0),(244,65,34,'TaxonConcept','This is a witty comment on the Nonnumquamerus numquamerus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:07','2014-12-08 12:20:07','2014-11-28 08:20:14',0,0,NULL,NULL,0),(245,50,34,'TaxonConcept','This is a witty comment on the Nonnumquamerus numquamerus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-12-08 12:20:07','2014-12-08 12:20:07','2014-11-28 07:20:14',0,0,NULL,NULL,0),(246,70,227,'DataObject','Aspernatur expedita illum. Incidunt molestiae maiores neque quo sit eos voluptas. Et ratione laborum. Consequuntur voluptate debitis. Ea asperiores culpa perferendis sint aut.','2014-12-08 12:20:07','2014-12-08 12:20:07','2014-11-28 06:20:14',0,0,NULL,NULL,0),(247,70,228,'DataObject','Fugit quod ipsum. Sint alias quo. Ut libero excepturi reprehenderit molestiae esse.','2014-12-08 12:20:07','2014-12-08 12:20:07','2014-11-28 05:20:14',0,0,NULL,NULL,0),(248,70,232,'DataObject','Sequi autem voluptas nobis. Doloremque dolores ut unde quia nostrum omnis. Animi quia cumque molestias nisi dignissimos ullam.','2014-12-08 12:20:07','2014-12-08 12:20:07','2014-11-28 04:20:14',0,0,NULL,NULL,0),(249,70,233,'DataObject','Et tenetur nesciunt voluptas reiciendis. Enim est blanditiis accusantium. Ab tenetur quibusdam.','2014-12-08 12:20:08','2014-12-08 12:20:08','2014-11-28 03:20:14',0,0,NULL,NULL,0),(250,70,234,'DataObject','Tempore sint quia magnam. Deleniti rerum et. Dolores sit eaque.','2014-12-08 12:20:08','2014-12-08 12:20:08','2014-11-28 02:20:14',0,0,NULL,NULL,0),(251,70,235,'DataObject','Vero beatae provident sed. Iusto dolores dolorum ea itaque. Voluptatum incidunt libero magni sequi et. Facilis et dolore aut asperiores.','2014-12-08 12:20:08','2014-12-08 12:20:08','2014-11-28 01:20:14',0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `published` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'EOL Curators','This is a special community intended for EOL curators to discuss matters related to curation on the Encylopedia of Life.','2014-12-08 12:18:51','2014-12-08 12:18:51',NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_roles`
--

DROP TABLE IF EXISTS `contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='For content partner agent_contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_roles`
--

LOCK TABLES `contact_roles` WRITE;
/*!40000 ALTER TABLE `contact_roles` DISABLE KEYS */;
INSERT INTO `contact_roles` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_subjects`
--

DROP TABLE IF EXISTS `contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_subjects`
--

LOCK TABLES `contact_subjects` WRITE;
/*!40000 ALTER TABLE `contact_subjects` DISABLE KEYS */;
INSERT INTO `contact_subjects` VALUES (1,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(2,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(3,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(4,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(5,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(6,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(7,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(8,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(9,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(10,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(11,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50'),(12,'junk@example.com',1,'2014-12-06 12:18:50','2014-12-08 12:18:50');
/*!40000 ALTER TABLE `contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comments` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `referred_page` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `taxon_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_page_archives`
--

DROP TABLE IF EXISTS `content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `content_section_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `original_creation_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_page_archives`
--

LOCK TABLES `content_page_archives` WRITE;
/*!40000 ALTER TABLE `content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_pages`
--

DROP TABLE IF EXISTS `content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_pages`
--

LOCK TABLES `content_pages` WRITE;
/*!40000 ALTER TABLE `content_pages` DISABLE KEYS */;
INSERT INTO `content_pages` VALUES (1,'Home',1,1,0,1,NULL),(2,'Who We Are',2,1,0,1,NULL),(3,'Working Groups',1,1,0,1,2),(4,'Working Group A',1,1,0,1,3),(5,'Working Group B',2,1,0,1,3),(6,'Working Group C',3,1,0,1,3),(7,'Working Group D',4,1,0,1,3),(8,'Working Group E',5,1,0,1,3),(9,'Contact Us',3,1,0,1,NULL),(10,'Screencasts',4,1,0,1,NULL),(11,'Press Releases',5,1,0,1,NULL),(12,'terms_of_use',6,1,0,1,NULL),(13,'curator_central',7,1,0,1,NULL);
/*!40000 ALTER TABLE `content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_agreements`
--

DROP TABLE IF EXISTS `content_partner_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `template` text NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '1',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `mou_url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `signed_on_date` datetime DEFAULT NULL,
  `signed_by` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_agreements`
--

LOCK TABLES `content_partner_agreements` WRITE;
/*!40000 ALTER TABLE `content_partner_agreements` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_partner_agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_contacts`
--

DROP TABLE IF EXISTS `content_partner_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `title` varchar(20) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `homepage` varchar(255) CHARACTER SET ascii NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(30) CHARACTER SET ascii NOT NULL,
  `address` text NOT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='For content partners, specifying people to contact (each one has an agent_contact_role)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_contacts`
--

LOCK TABLES `content_partner_contacts` WRITE;
/*!40000 ALTER TABLE `content_partner_contacts` DISABLE KEYS */;
INSERT INTO `content_partner_contacts` VALUES (1,1,1,'unique13string unique14string','Call me SIR','unique13string','unique14string','http://whatever.org','unique13string.unique14string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:18:52','2014-12-08 12:18:52'),(2,2,1,'unique15string unique16string','Call me SIR','unique15string','unique16string','http://whatever.org','unique15string.unique16string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:18:52','2014-12-08 12:18:52'),(3,4,1,'unique21string unique22string','Call me SIR','unique21string','unique22string','http://whatever.org','unique21string.unique22string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:19:07','2014-12-08 12:19:07'),(4,5,1,'unique23string unique24string','Call me SIR','unique23string','unique24string','http://whatever.org','unique23string.unique24string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:19:36','2014-12-08 12:19:36'),(5,6,1,'unique25string unique26string','Call me SIR','unique25string','unique26string','http://whatever.org','unique25string.unique26string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:19:36','2014-12-08 12:19:36'),(6,7,1,'unique27string unique28string','Call me SIR','unique27string','unique28string','http://whatever.org','unique27string.unique28string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-12-08 12:19:40','2014-12-08 12:19:40');
/*!40000 ALTER TABLE `content_partner_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_statuses`
--

DROP TABLE IF EXISTS `content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_statuses`
--

LOCK TABLES `content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `content_partner_statuses` DISABLE KEYS */;
INSERT INTO `content_partner_statuses` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partners`
--

DROP TABLE IF EXISTS `content_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(4) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `full_name` text,
  `display_name` varchar(255) DEFAULT NULL,
  `acronym` varchar(20) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `description_of_data` text,
  `description` text NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `admin_notes` text,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `stylesheet` varchar(255) DEFAULT NULL,
  `javascript` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partners`
--

LOCK TABLES `content_partners` WRITE;
/*!40000 ALTER TABLE `content_partners` DISABLE KEYS */;
INSERT INTO `content_partners` VALUES (1,1,1,'IUCN',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:18:52','2014-12-08 10:18:52',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(2,1,2,'Catalogue of Life',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:18:52','2014-12-08 10:18:52',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(3,1,3,'Biology of Aging',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:18:52','2014-12-08 10:18:52',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(4,1,5,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:19:07','2014-12-08 10:19:07',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(5,1,34,'Partner name',NULL,NULL,NULL,'Civil Protection!','description of the partner','','2014-12-03 10:19:36','2014-12-08 10:19:36',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(6,1,35,'Test ContenPartner',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:19:36','2014-12-08 10:19:36',1,NULL,NULL,NULL,NULL,0,NULL,NULL),(7,1,42,'NCBI',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-12-03 10:19:40','2014-12-08 10:19:40',1,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `content_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_table_items`
--

DROP TABLE IF EXISTS `content_table_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_table_items` (
  `content_table_id` int(11) NOT NULL,
  `toc_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_table_items`
--

LOCK TABLES `content_table_items` WRITE;
/*!40000 ALTER TABLE `content_table_items` DISABLE KEYS */;
INSERT INTO `content_table_items` VALUES (1,2,NULL,NULL),(1,19,NULL,NULL),(1,20,NULL,NULL),(1,4,NULL,NULL),(1,34,NULL,NULL),(1,22,NULL,NULL),(1,16,NULL,NULL),(1,8,NULL,NULL),(1,29,NULL,NULL),(1,25,NULL,NULL),(1,31,NULL,NULL),(1,10,NULL,NULL),(1,30,NULL,NULL),(1,33,NULL,NULL),(1,11,NULL,NULL),(1,36,NULL,NULL),(1,6,NULL,NULL),(1,1,NULL,NULL),(1,15,NULL,NULL),(1,28,NULL,NULL),(1,32,NULL,NULL),(1,35,NULL,NULL),(1,9,NULL,NULL),(2,2,NULL,NULL),(2,19,NULL,NULL),(2,20,NULL,NULL),(2,4,NULL,NULL),(2,34,NULL,NULL),(2,22,NULL,NULL),(2,16,NULL,NULL),(2,8,NULL,NULL),(2,29,NULL,NULL),(2,25,NULL,NULL),(2,31,NULL,NULL),(2,10,NULL,NULL),(2,30,NULL,NULL),(2,33,NULL,NULL),(2,11,NULL,NULL),(2,36,NULL,NULL),(2,6,NULL,NULL),(2,1,NULL,NULL),(2,15,NULL,NULL),(2,28,NULL,NULL),(2,32,NULL,NULL),(2,35,NULL,NULL),(2,9,NULL,NULL);
/*!40000 ALTER TABLE `content_table_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tables`
--

DROP TABLE IF EXISTS `content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tables`
--

LOCK TABLES `content_tables` WRITE;
/*!40000 ALTER TABLE `content_tables` DISABLE KEYS */;
INSERT INTO `content_tables` VALUES (2,'2014-12-08 12:20:08','2014-12-08 12:20:08');
/*!40000 ALTER TABLE `content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_uploads`
--

DROP TABLE IF EXISTS `content_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `link_name` varchar(70) DEFAULT NULL,
  `attachment_cache_url` bigint(20) DEFAULT NULL,
  `attachment_extension` varchar(10) DEFAULT NULL,
  `attachment_content_type` varchar(255) DEFAULT NULL,
  `attachment_file_name` varchar(255) DEFAULT NULL,
  `attachment_file_size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_uploads`
--

LOCK TABLES `content_uploads` WRITE;
/*!40000 ALTER TABLE `content_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `curated_data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_data_objects_hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `data_object_guid` varchar(32) NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_object_id` (`data_object_id`),
  KEY `data_object_id_hierarchy_entry_id` (`data_object_id`,`hierarchy_entry_id`),
  KEY `index_curated_data_objects_hierarchy_entries_on_data_object_guid` (`data_object_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_data_objects_hierarchy_entries`
--

LOCK TABLES `curated_data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `curated_hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `equivalent` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `hierarchy_entry_id_2` (`hierarchy_entry_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_hierarchy_entry_relationships`
--

LOCK TABLES `curated_hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_structured_data`
--

DROP TABLE IF EXISTS `curated_structured_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_structured_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_structured_data`
--

LOCK TABLES `curated_structured_data` WRITE;
/*!40000 ALTER TABLE `curated_structured_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_structured_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_taxon_concept_preferred_entries`
--

DROP TABLE IF EXISTS `curated_taxon_concept_preferred_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_taxon_concept_preferred_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_taxon_concept_preferred_entries`
--

LOCK TABLES `curated_taxon_concept_preferred_entries` WRITE;
/*!40000 ALTER TABLE `curated_taxon_concept_preferred_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_taxon_concept_preferred_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_activity_logs_untrust_reasons`
--

DROP TABLE IF EXISTS `curator_activity_logs_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_activity_logs_untrust_reasons` (
  `curator_activity_log_id` int(11) NOT NULL,
  `untrust_reason_id` int(11) NOT NULL,
  PRIMARY KEY (`curator_activity_log_id`,`untrust_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_activity_logs_untrust_reasons`
--

LOCK TABLES `curator_activity_logs_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_levels`
--

DROP TABLE IF EXISTS `curator_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `rating_weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_levels`
--

LOCK TABLES `curator_levels` WRITE;
/*!40000 ALTER TABLE `curator_levels` DISABLE KEYS */;
INSERT INTO `curator_levels` VALUES (1,'Master Curator',1),(2,'Full Curator',1),(3,'Assistant Curator',1);
/*!40000 ALTER TABLE `curator_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_data_object_tags`
--

DROP TABLE IF EXISTS `data_object_data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `data_object_tag_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_data_object_data_object_tags_1` (`data_object_guid`,`data_object_tag_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_data_object_tags`
--

LOCK TABLES `data_object_data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tags`
--

DROP TABLE IF EXISTS `data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `total_usage_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tags`
--

LOCK TABLES `data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_translations`
--

DROP TABLE IF EXISTS `data_object_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `original_data_object_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_object_id` (`data_object_id`),
  KEY `original_data_object_id` (`original_data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_translations`
--

LOCK TABLES `data_object_translations` WRITE;
/*!40000 ALTER TABLE `data_object_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects`
--

DROP TABLE IF EXISTS `data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'this guid is generated by EOL. A 32 character hexadecimal',
  `identifier` varchar(255) DEFAULT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `data_subtype_id` smallint(5) unsigned DEFAULT NULL,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `object_title` varchar(255) NOT NULL COMMENT 'a string title for the object. Generally not used for images',
  `language_id` smallint(5) unsigned NOT NULL,
  `metadata_language_id` smallint(5) unsigned DEFAULT NULL,
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(300) NOT NULL COMMENT 'a brief statement of the copyright protection for this object',
  `rights_holder` text NOT NULL COMMENT 'a string stating the owner of copyright for this object',
  `bibliographic_citation` text NOT NULL,
  `source_url` text COMMENT 'a url where users are to be redirected to learn more about this data object',
  `description` mediumtext NOT NULL,
  `description_linked` mediumtext,
  `object_url` text COMMENT 'recommended; the url which resolves to this data object. Generally used only for images, video, and other multimedia',
  `object_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the object. For example, a value may be 200902090812345 - that will be split by middleware into the parts 2009/02/09/08/12345 which represents the storage directory structure. The directory structure represents year/month/day/hour/unique_id',
  `thumbnail_url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; the url which resolves to a thumbnail representation of this object. Generally used only for images, video, and other multimedia',
  `thumbnail_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the thumbnail',
  `location` varchar(255) NOT NULL,
  `latitude` double NOT NULL COMMENT 'the latitude at which the object was first collected/captured. We have no standard way of represdenting this. Usually measured in decimal values, but could also be degrees',
  `longitude` double NOT NULL COMMENT 'the longitude at which the object was first collected/captured',
  `altitude` double NOT NULL COMMENT 'the altitude at which the object was first collected/captured',
  `object_created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was originally created. Information contained within the resource',
  `object_modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified. Information contained within the resource',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when the object was added to the EOL index',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified within the EOL index. This should pretty much always equal the created_at date, therefore is likely not necessary',
  `available_at` timestamp NULL DEFAULT NULL,
  `data_rating` float NOT NULL DEFAULT '2.5',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object is currently published',
  `curated` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object has ever been curated',
  `derived_from` text,
  `spatial_location` text,
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `index_data_objects_on_guid` (`guid`),
  KEY `index_data_objects_on_published` (`published`),
  KEY `created_at` (`created_at`),
  KEY `identifier` (`identifier`),
  KEY `object_url` (`object_url`(255)),
  KEY `index_data_objects_on_guid_and_language_id` (`guid`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects`
--

LOCK TABLES `data_objects` WRITE;
/*!40000 ALTER TABLE `data_objects` DISABLE KEYS */;
INSERT INTO `data_objects` VALUES (1,'8312ba790fe44f92806ca86db1226b78','',NULL,2,NULL,1,'',1,NULL,3,'Test rights statement','Test rights holder','','','Test Data Object',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:02','2014-12-06 10:19:02','2014-12-03 10:19:02','2014-12-08 09:20:12',NULL,2.5,1,0,NULL,NULL),(2,'8e2d9afb35df4cc2ba74b654edd64119','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et aut facilis deserunt ducimus dignissimos aliquid quia.',NULL,'',201111170140453,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 08:20:12',NULL,2.5,1,0,NULL,NULL),(3,'118f23927b9343ea855f74e7019fbf98','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Veniam quos doloribus sit consectetur.',NULL,'',201111021131069,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 07:20:12',NULL,2.5,1,0,NULL,NULL),(4,'fa36a770e5c64394983a7afc48ec11bf','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Magnam ullam sed vero.',NULL,'',200811131321659,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 06:20:12',NULL,2.5,1,0,NULL,NULL),(5,'6b447d580f1645f5970304d0dde7ebe4','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Amet et ipsa rerum aut.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 05:20:12',NULL,2.5,1,0,NULL,NULL),(6,'d374b4a0307247a78224cd9fbac043f1','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Quam ex consequatur qui consequatur reiciendis fugiat necessitatibus.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 04:20:12',NULL,2.5,1,0,NULL,NULL),(7,'dfb615508176468ab0d79d6ef1ec4fff','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:10','2014-12-06 10:19:10','2014-12-03 10:19:10','2014-12-08 03:20:12',NULL,2.5,1,0,NULL,NULL),(8,'c26ed1648e61456a9b9d7b65c8b5d337','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:11','2014-12-06 10:19:11','2014-12-03 10:19:11','2014-12-08 02:20:12',NULL,2.5,1,0,NULL,NULL),(9,'cf270973eedc4b03ab29bcca09da0601','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Sit nesciunt a minima ducimus. Harum quisquam libero natus quia ex iusto. Ab accusantium porro et quia. Dolor velit adipisci ab quae omnis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:11','2014-12-06 10:19:11','2014-12-03 10:19:11','2014-12-08 01:20:12',NULL,2.5,1,0,NULL,NULL),(10,'9b2b49d02cee47ba9c13b09284245177','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Facere eligendi iure modi voluptatem id. Perspiciatis possimus tenetur est sunt ullam. Deleniti dolorum voluptatibus culpa temporibus dolorem quo. Non numquam qui aut corporis nihil. Aut eos voluptatem voluptatem repellendus.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:11','2014-12-06 10:19:11','2014-12-03 10:19:11','2014-12-08 00:20:12',NULL,2.5,1,0,NULL,NULL),(11,'2ebca740e6254d96a5e45c0d66f4ee4a','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Quia aut voluptate dolor saepe quia beatae vero.',NULL,'',201111021106221,'',NULL,'',0,0,0,'2014-12-03 10:19:12','2014-12-06 10:19:12','2014-12-03 10:19:12','2014-12-07 23:20:12',NULL,2.5,1,0,NULL,NULL),(12,'f9fda235cb9945818ff0d7fd4d07cad3','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aliquam dolores omnis et quia voluptatem.',NULL,'',201205220000616,'',NULL,'',0,0,0,'2014-12-03 10:19:12','2014-12-06 10:19:12','2014-12-03 10:19:12','2014-12-07 22:20:12',NULL,2.5,1,0,NULL,NULL),(13,'aa813e381bbd4de18102da3471fbca86','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Necessitatibus quo voluptatem iste non qui ea et.',NULL,'',200811131394659,'',NULL,'',0,0,0,'2014-12-03 10:19:12','2014-12-06 10:19:12','2014-12-03 10:19:12','2014-12-07 21:20:12',NULL,2.5,1,0,NULL,NULL),(14,'aceb28e4b4fa43f787579e40812f3dd1','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ratione aut saepe voluptatem aspernatur.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 20:20:12',NULL,2.5,1,0,NULL,NULL),(15,'08812776ed274e3bb40e9c1805cc2802','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Eum sit quibusdam vel et reiciendis.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 19:20:12',NULL,2.5,1,0,NULL,NULL),(16,'c14edf7832d444e0ac5c45906426d72a','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 18:20:12',NULL,2.5,1,0,NULL,NULL),(17,'a2c1fec4d42549119f8c58f6542d314a','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 17:20:12',NULL,2.5,1,0,NULL,NULL),(18,'538d90c9c1944dd994cc8f3e69aa1044','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Facilis molestias accusantium omnis veritatis beatae inventore omnis. Voluptatem amet rerum dicta aut perferendis incidunt error. Velit sequi et distinctio esse totam ad.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 16:20:12',NULL,2.5,1,0,NULL,NULL),(19,'ddda5b506716465487f16ae4b0c04aac','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Distinctio unde laborum aut. Dicta quo quia odio eveniet suscipit. Doloribus dolores veritatis eveniet quisquam enim ut praesentium.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:13','2014-12-06 10:19:13','2014-12-03 10:19:13','2014-12-07 15:20:12',NULL,2.5,1,0,NULL,NULL),(20,'05db208c32d0463faf95de5e3f2edbef','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Non est autem qui.',NULL,'',201301212386289,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 14:20:12',NULL,2.5,1,0,NULL,NULL),(21,'f9609fa53a744239beef74ccd5227e47','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Velit quos amet aut eveniet.',NULL,'',201201030187595,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 13:20:12',NULL,2.5,1,0,NULL,NULL),(22,'8156b0b7dd624d70afbe62e26e45119a','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et illo adipisci quas magni atque.',NULL,'',200811131367814,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 12:20:12',NULL,2.5,1,0,NULL,NULL),(23,'2fce4f8279c949bb9b448a14deeb4583','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui nihil sed vel nam.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 11:20:12',NULL,2.5,1,0,NULL,NULL),(24,'36408c2c6d4444a4917975137b018276','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Quos eius molestiae eaque neque ipsa ut.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 10:20:12',NULL,2.5,1,0,NULL,NULL),(25,'9110b91a0e1147a09516b4b0f93b2050','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 09:20:12',NULL,2.5,1,0,NULL,NULL),(26,'226d52cdd6f142958039c2e2662a4bbf','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:14','2014-12-06 10:19:14','2014-12-03 10:19:14','2014-12-07 08:20:12',NULL,2.5,1,0,NULL,NULL),(27,'b91f314d075443908bae5a4218a88d79','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Magni soluta quia quo. Provident iste quae mollitia. Aperiam quo nisi asperiores tempora. Quis fugit animi et.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:15','2014-12-06 10:19:15','2014-12-03 10:19:15','2014-12-07 07:20:12',NULL,2.5,1,0,NULL,NULL),(28,'a36674acfdf441098887e0d3c4a78107','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Aliquam et rerum est illum. Eveniet nulla omnis modi qui impedit quia. Quaerat a recusandae ex odio non. Perspiciatis sint totam. Assumenda unde architecto quia perspiciatis repellat soluta.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:15','2014-12-06 10:19:15','2014-12-03 10:19:15','2014-12-07 06:20:12',NULL,2.5,1,0,NULL,NULL),(29,'e2d9b892ccf44423b26004a3e1bd89a8','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Eum enim voluptas molestiae officia eveniet repellendus ad eius.',NULL,'',201111012278143,'',NULL,'',0,0,0,'2014-12-03 10:19:15','2014-12-06 10:19:15','2014-12-03 10:19:15','2014-12-07 05:20:12',NULL,2.5,1,0,NULL,NULL),(30,'a7760a9e0a784a748dedb5d3b95a609b','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et reprehenderit dolore vero eveniet vel.',NULL,'',201111020864905,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-07 04:20:12',NULL,2.5,1,0,NULL,NULL),(31,'f171ca7f0e984e8193c956ca774246fa','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Expedita et amet odit dolor sed eveniet.',NULL,'',200811131351121,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-07 03:20:12',NULL,2.5,1,0,NULL,NULL),(32,'e134a68b2981487ea0970ec445ca21f6','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ex debitis eum qui quae nihil vitae illo.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-07 02:20:12',NULL,2.5,1,0,NULL,NULL),(33,'bd7a1c3ac58e42e5a31e37cd8f214471','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Aut aut quis animi laudantium ab.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-07 01:20:12',NULL,2.5,1,0,NULL,NULL),(34,'9e55c1debb5546b291e21035b640aae1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-07 00:20:12',NULL,2.5,1,0,NULL,NULL),(35,'e87b63ec05694900a3a8d101450343e5','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-06 23:20:12',NULL,2.5,1,0,NULL,NULL),(36,'0b7cf5542a0c4d04bc343c0a45d805cc','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Maiores id amet recusandae ullam. Voluptas quos earum praesentium. Ullam voluptas est culpa ut facere. Facere quos ad. Quo ducimus sequi quaerat aut labore amet.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-06 22:20:12',NULL,2.5,1,0,NULL,NULL),(37,'4ec8430356e84ec4b745a6c8fd4a5eaf','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Voluptas pariatur fuga amet quas. Voluptatem repudiandae provident eius aut dolorem. Expedita dolorem qui occaecati quas eveniet. Eaque voluptate perspiciatis. Iusto consequatur omnis recusandae laborum quibusdam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:16','2014-12-06 10:19:16','2014-12-03 10:19:16','2014-12-06 21:20:12',NULL,2.5,1,0,NULL,NULL),(38,'7214f9d9171d47cf8562e5f06d737d40','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Veritatis omnis odio cumque similique rerum a.',NULL,'',201204040068862,'',NULL,'',0,0,0,'2014-12-03 10:19:17','2014-12-06 10:19:17','2014-12-03 10:19:17','2014-12-06 20:20:12',NULL,2.5,1,0,NULL,NULL),(39,'59f2eeb53de44ae198fdc4d072ed582b','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Adipisci eos ut aperiam nihil ut qui.',NULL,'',201208120076649,'',NULL,'',0,0,0,'2014-12-03 10:19:17','2014-12-06 10:19:17','2014-12-03 10:19:17','2014-12-06 19:20:12',NULL,2.5,1,0,NULL,NULL),(40,'6e2a2a8fbaa14d308c15eee78e9a3631','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Doloremque distinctio voluptas quod dolor est eius.',NULL,'',200811131388288,'',NULL,'',0,0,0,'2014-12-03 10:19:17','2014-12-06 10:19:17','2014-12-03 10:19:17','2014-12-06 18:20:12',NULL,2.5,1,0,NULL,NULL),(41,'7c1ff531252b466ab567d808c6e6aa1c','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui dolorum laudantium unde rem voluptas sequi officiis.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 17:20:12',NULL,2.5,1,0,NULL,NULL),(42,'66a52eeb9ba047d5820c908aaa47b2c7','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Nihil ratione doloribus voluptate ipsa mollitia quis.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 16:20:12',NULL,2.5,1,0,NULL,NULL),(43,'8a2e58e24070418c9e44f84b65d1da08','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 15:20:12',NULL,2.5,1,0,NULL,NULL),(44,'9c8a5a3c6e7b4cc2bec6971bbb2f478d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 14:20:12',NULL,2.5,1,0,NULL,NULL),(45,'24aad9354b784b5c9cfa6568bc210dab','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Error adipisci aperiam et autem harum nulla. Omnis sit repellendus non voluptatem earum. Ut laborum repudiandae. Autem perspiciatis tenetur aliquid dolorem recusandae officiis maiores. Ratione id officia voluptatibus inventore.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 13:20:12',NULL,2.5,1,0,NULL,NULL),(46,'3d4e37c9baf04a6d8e725e48148e38f3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ut error commodi totam excepturi voluptatem quis. Voluptatem eos aut voluptates. Sed soluta expedita esse optio fugiat magnam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:18','2014-12-06 10:19:18','2014-12-03 10:19:18','2014-12-06 12:20:12',NULL,2.5,1,0,NULL,NULL),(47,'4454f52526384078975b954ee9e3ff2b','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Vel debitis aliquid sed veritatis.',NULL,'',201202050005388,'',NULL,'',0,0,0,'2014-12-03 10:19:19','2014-12-06 10:19:19','2014-12-03 10:19:19','2014-12-06 11:20:12',NULL,2.5,1,0,NULL,NULL),(48,'f77255a5549a40cdbf19f87255dd49eb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','inappropriate',NULL,'',201111011778717,'',NULL,'',0,0,0,'2014-12-03 10:19:20','2014-12-06 10:19:20','2014-12-03 10:19:20','2014-12-06 10:20:12',NULL,2.5,1,0,NULL,NULL),(49,'eb5bb2759d2a49da89f6b4bfe7afddf9','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','untrusted',NULL,'',201203220059150,'',NULL,'',0,0,0,'2014-12-03 10:19:20','2014-12-06 10:19:20','2014-12-03 10:19:20','2014-12-06 09:20:12',NULL,2.5,1,0,NULL,NULL),(50,'9836f60e212b4616a8ff371563adb65f','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','unknown',NULL,'',201212102306393,'',NULL,'',0,0,0,'2014-12-03 10:19:20','2014-12-06 10:19:20','2014-12-03 10:19:20','2014-12-06 08:20:12',NULL,2.5,1,0,NULL,NULL),(51,'849c106a48ad4a64827bdad8b03032b7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible',NULL,'',201111021567463,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 07:20:12',NULL,2.5,1,0,NULL,NULL),(52,'3ce2338cb0d145e9b12825e193c3279d','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview',NULL,'',201111020587617,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 06:20:12',NULL,2.5,1,0,NULL,NULL),(53,'5e5f52253d924f9588e009af198da807','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, unknown',NULL,'',201205210185638,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 05:20:12',NULL,2.5,1,0,NULL,NULL),(54,'1ea0419229b44e22b3c60fa3758a636a','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, untrusted',NULL,'',201111011190361,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 04:20:12',NULL,2.5,1,0,NULL,NULL),(55,'16967377ac9344c9b5132a32d58526e9','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview, unknown',NULL,'',201111011511951,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 03:20:12',NULL,2.5,1,0,NULL,NULL),(56,'8e47d505ab6c4bd28b14945f80e645f8','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sit consequatur dolorum praesentium.',NULL,'',200811131382797,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 02:20:12',NULL,2.5,1,0,NULL,NULL),(57,'8db068dcc12a4bbd8a321f1a471bc706','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Voluptatem voluptatem modi quo enim consequatur.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 01:20:12',NULL,2.5,1,0,NULL,NULL),(58,'a6dcf72f12bd45c29d6af1c6376dc48d','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Nam et consectetur laborum alias sapiente temporibus enim et.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-06 00:20:12',NULL,2.5,1,0,NULL,NULL),(59,'077f6f6005b249998ba346c973b2cda3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:21','2014-12-06 10:19:21','2014-12-03 10:19:21','2014-12-05 23:20:12',NULL,2.5,1,0,NULL,NULL),(60,'ed8fd0a721ca4572bc1d001b655581cb','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:22','2014-12-06 10:19:22','2014-12-03 10:19:22','2014-12-05 22:20:12',NULL,2.5,1,0,NULL,NULL),(61,'67ec38126da74f68816b16b3ba3282e0','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Aliquid unde natus numquam eaque inventore. Consectetur ex rerum velit magni nam. Maiores harum quod libero non omnis ipsam consectetur.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:22','2014-12-06 10:19:22','2014-12-03 10:19:22','2014-12-05 21:20:12',NULL,2.5,1,0,NULL,NULL),(62,'225a1c229e0643959f058922dc649163','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Dignissimos sunt vero. Maxime eaque velit qui. Harum porro vitae dicta fuga ex necessitatibus minima.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:22','2014-12-06 10:19:22','2014-12-03 10:19:22','2014-12-05 20:20:12',NULL,2.5,1,0,NULL,NULL),(63,'7906c2e9fa9d4e13a917466046027670','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Eius ea exercitationem laboriosam dolores.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-12-03 10:19:24','2014-12-06 10:19:24','2014-12-03 10:19:24','2014-12-05 19:20:12',NULL,2.5,1,0,NULL,NULL),(64,'27de7911616040d687b5ed6cf87c14f0','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Eligendi enim eius sunt pariatur sed et quos et.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2014-12-03 10:19:25','2014-12-06 10:19:25','2014-12-03 10:19:25','2014-12-05 18:20:12',NULL,2.5,1,0,NULL,NULL),(65,'b9050af5c654493ab0fec73731eeee79','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Excepturi veniam sed eius nostrum non eum eos pariatur.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2014-12-03 10:19:25','2014-12-06 10:19:25','2014-12-03 10:19:25','2014-12-05 17:20:12',NULL,2.5,1,0,NULL,NULL),(66,'8f99658efa4341bab6ebfd30c26b5c11','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aut itaque necessitatibus dicta sint.',NULL,'',201208172341618,'',NULL,'',0,0,0,'2014-12-03 10:19:25','2014-12-06 10:19:25','2014-12-03 10:19:25','2014-12-05 16:20:12',NULL,2.5,1,0,NULL,NULL),(67,'339d14c989ed42588a89e3a3b68d44a2','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','inappropriate',NULL,'',201111021299859,'',NULL,'',0,0,0,'2014-12-03 10:19:26','2014-12-06 10:19:26','2014-12-03 10:19:26','2014-12-05 15:20:12',NULL,2.5,1,0,NULL,NULL),(68,'fcaf18c3e0924937ad9049c15333e961','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','untrusted',NULL,'',201205150031711,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 14:20:12',NULL,2.5,1,0,NULL,NULL),(69,'cedb7de55edc407f836cf6aef511c8e7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','unknown',NULL,'',201112230179863,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 13:20:12',NULL,2.5,1,0,NULL,NULL),(70,'2e59de3a71e64a6fb89345927af20dcc','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible',NULL,'',201111012244809,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 12:20:12',NULL,2.5,1,0,NULL,NULL),(71,'6bb2661f44e541239844319fdcbbcd49','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview',NULL,'',201111011330372,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 11:20:12',NULL,2.5,1,0,NULL,NULL),(72,'6d5d3b0e729e42849d10a8fb67a0ef20','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, unknown',NULL,'',201212282365864,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 10:20:12',NULL,2.5,1,0,NULL,NULL),(73,'92e0f51b3b424c738a0ed8f9396d0981','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, untrusted',NULL,'',201111030123051,'',NULL,'',0,0,0,'2014-12-03 10:19:27','2014-12-06 10:19:27','2014-12-03 10:19:27','2014-12-05 09:20:12',NULL,2.5,1,0,NULL,NULL),(74,'03547de9d4694c37b815a4b0ae450dc9','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview, unknown',NULL,'',201111020413030,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 08:20:12',NULL,2.5,1,0,NULL,NULL),(75,'9f89c2f688a14ee59cb3057f58b706f0','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Voluptatem est voluptatem molestiae omnis ipsum consequatur voluptas nihil.',NULL,'',200811131390600,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 07:20:12',NULL,2.5,1,0,NULL,NULL),(76,'fc2f490e3eec40ca941dbf43c628f6f5','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Dignissimos facere illo porro amet.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 06:20:12',NULL,2.5,1,0,NULL,NULL),(77,'7247e00be8804cca87532a6ac75255b4','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Laudantium recusandae sed odio praesentium.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 05:20:12',NULL,2.5,1,0,NULL,NULL),(78,'1298d3688913465a8f930e3b072ba334','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 04:20:12',NULL,2.5,1,0,NULL,NULL),(79,'30f695d7f62344c78621f21b3f7b5ccc','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:28','2014-12-06 10:19:28','2014-12-03 10:19:28','2014-12-05 03:20:12',NULL,2.5,1,0,NULL,NULL),(80,'0f40acf67d32406c86f4a18aa37c48f5','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Veritatis magnam eos facere. Itaque quidem molestiae voluptatem voluptas consequatur omnis in. Deleniti sint id dolorem.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:29','2014-12-06 10:19:29','2014-12-03 10:19:29','2014-12-05 02:20:12',NULL,2.5,1,0,NULL,NULL),(81,'cd61756916f34b1eadee8bd66a5dfe81','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quod dignissimos consequuntur consequatur sed rerum esse aliquid. Quaerat est dicta. Voluptatem rerum quidem blanditiis quos laboriosam natus dolores. Odio omnis vitae rerum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:29','2014-12-06 10:19:29','2014-12-03 10:19:29','2014-12-05 01:20:12',NULL,2.5,1,0,NULL,NULL),(82,'1846dcc0ef2d44b39f836be7e6464d08','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','1st image description for re-harvest',NULL,'',201205300022426,'',NULL,'',0,0,0,'2014-12-03 10:19:29','2014-12-06 10:19:29','2014-12-03 10:19:29','2014-12-05 00:20:12',NULL,1,0,0,NULL,NULL),(83,'ef891bda640a4fb7b023e62d08f3af2a','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Officia similique sed quibusdam quos molestiae.',NULL,'',200811131333916,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 23:20:12',NULL,2.5,1,0,NULL,NULL),(84,'f03f570e5505457da45eb4efa6dcd60c','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Odio est assumenda ipsa.',NULL,'',200811131393000,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 22:20:12',NULL,2.5,1,0,NULL,NULL),(85,'6c0a16dbc2384105b94a7146e54369ba','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ad facere aut qui dolore.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 21:20:12',NULL,2.5,1,0,NULL,NULL),(86,'1b60afaf384e4c66aa6430adcf9a5dc7','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quibusdam quasi voluptas libero officiis nulla.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 20:20:12',NULL,2.5,1,0,NULL,NULL),(87,'0b68a7f187224867a4f38857978538e1','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Atque officia eius tenetur maxime.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 19:20:12',NULL,2.5,1,0,NULL,NULL),(88,'5c47665ac8074207847821b804049be2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 18:20:12',NULL,1,0,0,NULL,NULL),(89,'971feb5a768d411b9795a0ca32d0e11d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','description text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-03 10:19:30','2014-12-04 17:20:12',NULL,2.5,1,0,NULL,NULL),(90,'5c47665ac8074207847821b804049be2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:30','2014-12-06 10:19:30','2014-12-08 10:19:31','2014-12-04 16:20:12',NULL,1,1,0,NULL,NULL),(91,'1846dcc0ef2d44b39f836be7e6464d08','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','1st image description for re-harvest',NULL,'',201205300022426,'',NULL,'',0,0,0,'2014-12-03 10:19:29','2014-12-06 10:19:29','2014-12-08 10:19:31','2014-12-04 15:20:12',NULL,1,1,0,NULL,NULL),(92,'cc97a37bcd69478d9b67522807feaff0','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Sit hic similique culpa iusto.',NULL,'',201204050041265,'',NULL,'',0,0,0,'2014-12-03 10:19:33','2014-12-06 10:19:33','2014-12-03 10:19:33','2014-12-04 14:20:12',NULL,2.5,1,0,NULL,NULL),(93,'8ffb858f6b584a6d94c73d5db5647ba5','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Nisi officia sint ipsa similique neque.',NULL,'',201210012385079,'',NULL,'',0,0,0,'2014-12-03 10:19:33','2014-12-06 10:19:33','2014-12-03 10:19:33','2014-12-04 13:20:12',NULL,2.5,1,0,NULL,NULL),(94,'d8a24c2a4fa24b339d8326d17429e0c5','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Omnis nesciunt earum ut.',NULL,'',200811131347554,'',NULL,'',0,0,0,'2014-12-03 10:19:33','2014-12-06 10:19:33','2014-12-03 10:19:33','2014-12-04 12:20:12',NULL,2.5,1,0,NULL,NULL),(95,'6343a037376449cdaf2834d9e2725d63','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sunt nostrum ea nam qui fuga et quasi.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:33','2014-12-06 10:19:33','2014-12-03 10:19:33','2014-12-04 11:20:12',NULL,2.5,1,0,NULL,NULL),(96,'740d143110544e3f85e681553dfe6f95','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Laboriosam voluptatibus cupiditate sed.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-12-03 10:19:34','2014-12-06 10:19:34','2014-12-03 10:19:34','2014-12-04 10:20:12',NULL,2.5,1,0,NULL,NULL),(97,'8f48386e3c9c41afaf6a9faa8c0bdd85','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ad ipsa consequatur. Aperiam iusto reprehenderit ullam omnis inventore fugiat repudiandae. Officiis omnis tempora nobis dolore enim voluptas. Assumenda praesentium sequi quibusdam consequatur numquam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:34','2014-12-06 10:19:34','2014-12-03 10:19:34','2014-12-04 09:20:12',NULL,2.5,1,0,NULL,NULL),(98,'e141de817cc743a88fc1094cfad23f20','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Alias est libero. Omnis soluta consequatur. Aspernatur quibusdam ut. Animi cupiditate atque ut. Rerum repellendus qui ut.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:34','2014-12-06 10:19:34','2014-12-03 10:19:34','2014-12-04 08:20:13',NULL,2.5,1,0,NULL,NULL),(99,'25182f3d041b4b9f99594c3bd5824f81','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Fugiat rerum id ut veniam consequatur. Consequatur harum et. Qui quia aspernatur. Mollitia est ipsa quis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:34','2014-12-06 10:19:34','2014-12-03 10:19:34','2014-12-04 07:20:13',NULL,2.5,1,0,NULL,NULL),(100,'328fcfc48a23487d8c711eaea137cac0','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','This should only be seen by ContentPartner Our Testing Content Partner',NULL,'',201205150083147,'',NULL,'',0,0,0,'2014-12-03 10:19:36','2014-12-06 10:19:36','2014-12-03 10:19:36','2014-12-04 06:20:13',NULL,2.5,1,0,NULL,NULL),(101,'30305038053a4c4aa5f8b601b2ebc714','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aut dolore itaque eligendi voluptatibus et nisi consequatur vel.',NULL,'',201211260100253,'',NULL,'',0,0,0,'2014-12-03 10:19:38','2014-12-06 10:19:38','2014-12-03 10:19:38','2014-12-04 05:20:13',NULL,2.5,1,0,NULL,NULL),(102,'a47b025a46cb4a6d98dd3c5edc0b0a7c','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Distinctio et officia ab fuga similique.',NULL,'',201112100017714,'',NULL,'',0,0,0,'2014-12-03 10:19:38','2014-12-06 10:19:38','2014-12-03 10:19:38','2014-12-04 04:20:13',NULL,2.5,1,0,NULL,NULL),(103,'a464f823dfc84579a2033d9c18813d00','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sed aut error quibusdam qui doloribus molestiae.',NULL,'',200811131354820,'',NULL,'',0,0,0,'2014-12-03 10:19:38','2014-12-06 10:19:38','2014-12-03 10:19:38','2014-12-04 03:20:13',NULL,2.5,1,0,NULL,NULL),(104,'57fc37196acf4036b01be3a9e81fa676','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Eum delectus et nobis tempora laudantium.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:38','2014-12-06 10:19:38','2014-12-03 10:19:38','2014-12-04 02:20:13',NULL,2.5,1,0,NULL,NULL),(105,'f8714ef660e546abb3119fa3efd171f9','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Sed voluptatem neque dolorem quasi enim.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-12-03 10:19:39','2014-12-06 10:19:39','2014-12-03 10:19:39','2014-12-04 01:20:13',NULL,2.5,1,0,NULL,NULL),(106,'12dc05a76ebe4a5e8e04551443164ef7','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:39','2014-12-06 10:19:39','2014-12-03 10:19:39','2014-12-04 00:20:13',NULL,2.5,1,0,NULL,NULL),(107,'a8511f0bf87d4a1f847b85ded9ffab60','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:39','2014-12-06 10:19:39','2014-12-03 10:19:39','2014-12-03 23:20:13',NULL,2.5,1,0,NULL,NULL),(108,'009d4be2cf454407817aeca972c201d0','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Dolorem ut iusto sint eos. Sunt voluptatem quae dolores. Nisi ut aut vitae et tempore minima iusto. Aut ducimus animi praesentium inventore voluptas occaecati neque. Numquam et laborum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:39','2014-12-06 10:19:39','2014-12-03 10:19:39','2014-12-03 22:20:13',NULL,2.5,1,0,NULL,NULL),(109,'f9037bb0a0384b38b3d915b21237b73e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ut aut consequatur magni praesentium quaerat dicta dolore. Ut suscipit ut omnis aut beatae est. Et recusandae debitis totam error et iusto. Consequatur architecto provident.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:39','2014-12-06 10:19:39','2014-12-03 10:19:39','2014-12-03 21:20:13',NULL,2.5,1,0,NULL,NULL),(110,'1b0d094e859d44578a57e10843f33422','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Eum est aliquid qui reprehenderit possimus.',NULL,'',201209082397624,'',NULL,'',0,0,0,'2014-12-03 10:19:41','2014-12-06 10:19:41','2014-12-03 10:19:41','2014-12-03 20:20:13',NULL,2.5,1,0,NULL,NULL),(111,'3cb5c06b0c8e4d5db783e1705c515be9','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Non cupiditate provident itaque.',NULL,'',201111020312732,'',NULL,'',0,0,0,'2014-12-03 10:19:41','2014-12-06 10:19:41','2014-12-03 10:19:41','2014-12-03 19:20:13',NULL,2.5,1,0,NULL,NULL),(112,'0988dc27dac449dfb529a9b5d802b405','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Corrupti ut vel error et.',NULL,'',200811131391764,'',NULL,'',0,0,0,'2014-12-03 10:19:41','2014-12-06 10:19:41','2014-12-03 10:19:41','2014-12-03 18:20:13',NULL,2.5,1,0,NULL,NULL),(113,'38cf3f6685314594b07f2e62a6eafdea','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et commodi numquam animi itaque eligendi qui et.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:41','2014-12-06 10:19:41','2014-12-03 10:19:41','2014-12-03 17:20:13',NULL,2.5,1,0,NULL,NULL),(114,'84ae40f978e749ba88fad1da710b81d0','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Rerum perferendis qui nam dicta sed voluptatibus consequuntur eius.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-12-03 10:19:42','2014-12-06 10:19:42','2014-12-03 10:19:42','2014-12-03 16:20:13',NULL,2.5,1,0,NULL,NULL),(115,'c5e449cc04db49fa8be04804fa289cba','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:42','2014-12-06 10:19:42','2014-12-03 10:19:42','2014-12-03 15:20:13',NULL,2.5,1,0,NULL,NULL),(116,'3da73db5112d47da86a9d6f986d43592','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:42','2014-12-06 10:19:42','2014-12-03 10:19:42','2014-12-03 14:20:13',NULL,2.5,1,0,NULL,NULL),(117,'17ba3e968c71484fb0bbd89390d737e4','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quis velit occaecati. Consectetur occaecati asperiores laudantium aut incidunt molestias. Ratione placeat sed. Doloremque eveniet qui impedit incidunt dolor et. Eaque est dignissimos exercitationem consectetur sint ea.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:42','2014-12-06 10:19:42','2014-12-03 10:19:42','2014-12-03 13:20:13',NULL,2.5,1,0,NULL,NULL),(118,'2e05618e9f684113a752665d61d52844','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Magnam minima autem aut enim fuga. Sunt consequatur eos fugit commodi in id maiores. Iusto eum sit. Nihil id non eos necessitatibus.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:42','2014-12-06 10:19:42','2014-12-03 10:19:42','2014-12-03 12:20:13',NULL,2.5,1,0,NULL,NULL),(119,'a6231125fce341439f013713174f1790','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Non quibusdam quia voluptates occaecati.',NULL,'',201201250367476,'',NULL,'',0,0,0,'2014-12-03 10:19:43','2014-12-06 10:19:43','2014-12-03 10:19:43','2014-12-03 11:20:13',NULL,2.5,1,0,NULL,NULL),(120,'e18f9d7d741845428d5d666f59149c0c','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Quasi eligendi blanditiis numquam fugit nostrum.',NULL,'',201202010281247,'',NULL,'',0,0,0,'2014-12-03 10:19:43','2014-12-06 10:19:43','2014-12-03 10:19:43','2014-12-03 10:20:13',NULL,2.5,1,0,NULL,NULL),(121,'45515ec98a7646f89a5075d6134b5450','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Est nesciunt eum assumenda inventore iure.',NULL,'',200811131316882,'',NULL,'',0,0,0,'2014-12-03 10:19:43','2014-12-06 10:19:43','2014-12-03 10:19:43','2014-12-03 09:20:13',NULL,2.5,1,0,NULL,NULL),(122,'fc1ff91b100f4875a4e9d0fdae15a9b1','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sit laudantium dolores nesciunt consequuntur nihil ullam.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:43','2014-12-06 10:19:43','2014-12-03 10:19:43','2014-12-03 08:20:13',NULL,2.5,1,0,NULL,NULL),(123,'6ff5960df25847d59dcc3765f8127ef8','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Aspernatur maxime beatae excepturi.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-12-03 10:19:44','2014-12-06 10:19:44','2014-12-03 10:19:44','2014-12-03 07:20:13',NULL,2.5,1,0,NULL,NULL),(124,'0091b4445a92430ebd835b48960f0d75','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:44','2014-12-06 10:19:44','2014-12-03 10:19:44','2014-12-03 06:20:13',NULL,2.5,1,0,NULL,NULL),(125,'e68c239dc5774d16a074ed2cc5de1c12','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:44','2014-12-06 10:19:44','2014-12-03 10:19:44','2014-12-03 05:20:13',NULL,2.5,1,0,NULL,NULL),(126,'67809d08a9e94d8d9cc541d4f324a1b8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Et qui aliquid alias corrupti architecto illo. Et magni rerum qui ut autem aliquid aut. Labore dignissimos blanditiis dolorum aut ullam aliquam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:44','2014-12-06 10:19:44','2014-12-03 10:19:44','2014-12-03 04:20:13',NULL,2.5,1,0,NULL,NULL),(127,'2946865e7a6541368064777aca1f2c26','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Est nesciunt omnis. Doloribus non omnis. Laboriosam expedita ipsum iure.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:44','2014-12-06 10:19:44','2014-12-03 10:19:44','2014-12-03 03:20:13',NULL,2.5,1,0,NULL,NULL),(128,'c9b63a4796684068930691937de18d5a','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Eos neque et sed non doloribus.',NULL,'',201202230021720,'',NULL,'',0,0,0,'2014-12-03 10:19:45','2014-12-06 10:19:45','2014-12-03 10:19:45','2014-12-03 02:20:13',NULL,2.5,1,0,NULL,NULL),(129,'1affc69f5daa46fc9c28a1d4e399fa29','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Maiores saepe sapiente voluptas repellendus minima in nostrum asperiores.',NULL,'',201301230017775,'',NULL,'',0,0,0,'2014-12-03 10:19:45','2014-12-06 10:19:45','2014-12-03 10:19:45','2014-12-03 01:20:13',NULL,2.5,1,0,NULL,NULL),(130,'451dd407ae0849929fd742b2bdbd820f','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui in sequi suscipit aliquam dolorem.',NULL,'',200811131328300,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-03 00:20:13',NULL,2.5,1,0,NULL,NULL),(131,'d95974c36b2748a0bacc350af45064cb','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Architecto ex porro autem sed est iste quis.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-02 23:20:13',NULL,2.5,1,0,NULL,NULL),(132,'483003b22e4c40f290a06da67b3c8442','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Quia adipisci similique et soluta.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-02 22:20:13',NULL,2.5,1,0,NULL,NULL),(133,'e536c7f90ed34c62bb4c2cb0b7af7230','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-02 21:20:13',NULL,2.5,1,0,NULL,NULL),(134,'06145a8f6fbf491f9df49dea5bc390b4','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-02 20:20:13',NULL,2.5,1,0,NULL,NULL),(135,'9fc4819b18ec40bba99918c95e21bf8f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Nihil cupiditate suscipit voluptatum velit consequatur. Est magni nihil molestiae qui. Sint deleniti sed adipisci molestiae explicabo similique. Consequatur iste qui reiciendis nemo maxime.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:46','2014-12-06 10:19:46','2014-12-03 10:19:46','2014-12-02 19:20:13',NULL,2.5,1,0,NULL,NULL),(136,'b8a3040c305642298f2aca43d71a6bd0','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Fugit esse modi dolor consequuntur. Harum aliquam sed voluptatibus quas et et vitae. Quia voluptate aspernatur sed ad iste voluptatem nam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:47','2014-12-06 10:19:47','2014-12-03 10:19:47','2014-12-02 18:20:13',NULL,2.5,1,0,NULL,NULL),(137,'cb83fc6fb1194e429fb9279a9c325bab','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Praesentium alias recusandae consectetur est explicabo vitae ut.',NULL,'',201111011191042,'',NULL,'',0,0,0,'2014-12-03 10:19:47','2014-12-06 10:19:47','2014-12-03 10:19:47','2014-12-02 17:20:13',NULL,2.5,1,0,NULL,NULL),(138,'9a1d709d54a042b4af49f496a3cf741e','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aliquid nesciunt ipsum et vel amet.',NULL,'',201203290041772,'',NULL,'',0,0,0,'2014-12-03 10:19:47','2014-12-06 10:19:47','2014-12-03 10:19:47','2014-12-02 16:20:13',NULL,2.5,1,0,NULL,NULL),(139,'7d511992277748afae8339fa0092074f','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Dolor debitis voluptatem quo rerum ea.',NULL,'',200811131392039,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 15:20:13',NULL,2.5,1,0,NULL,NULL),(140,'cb316fa6e4da4ff6a13c68c6b559cdd6','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Pariatur et rerum omnis qui.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 14:20:13',NULL,2.5,1,0,NULL,NULL),(141,'b1c84b97b99b468d81c4fad53b09d550','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Qui neque occaecati ut error et eligendi molestias nam.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 13:20:13',NULL,2.5,1,0,NULL,NULL),(142,'3df5255505e94feebe14b20f425a61a3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 12:20:13',NULL,2.5,1,0,NULL,NULL),(143,'f733db1a52e34808b46da778ec2324fe','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 11:20:13',NULL,2.5,1,0,NULL,NULL),(144,'ba4fa3e6d4854b7d806b29cdbafa406a','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Natus sequi velit vel et. Nisi itaque quasi. Tempora vel iusto repellendus. Harum quasi cupiditate iste voluptate quis eum architecto.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 10:20:13',NULL,2.5,1,0,NULL,NULL),(145,'c740cf0796d04f5f9cdb178a5db572a9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quibusdam nesciunt reprehenderit. Modi nisi quos ducimus voluptates. Aliquid occaecati aut. Et distinctio deserunt ut occaecati ipsum. Aut adipisci quo tenetur sapiente quia repellendus.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:48','2014-12-06 10:19:48','2014-12-03 10:19:48','2014-12-02 09:20:13',NULL,2.5,1,0,NULL,NULL),(146,'46db69e40b1c4f7ca4f00ed87af1874b','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Voluptas omnis minima qui omnis veniam nulla amet.',NULL,'',201202010290745,'',NULL,'',0,0,0,'2014-12-03 10:19:49','2014-12-06 10:19:49','2014-12-03 10:19:49','2014-12-02 08:20:13',NULL,2.5,1,0,NULL,NULL),(147,'f10d40312849416e974df58a2f7e6677','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Unde adipisci voluptatibus sed et vero qui sit.',NULL,'',201201041249064,'',NULL,'',0,0,0,'2014-12-03 10:19:49','2014-12-06 10:19:49','2014-12-03 10:19:49','2014-12-02 07:20:13',NULL,2.5,1,0,NULL,NULL),(148,'386bf91a687240fd92027041e4b8f513','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Explicabo magnam esse cupiditate maiores consequuntur architecto repellendus ipsum.',NULL,'',200811131350808,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 06:20:13',NULL,2.5,1,0,NULL,NULL),(149,'780d29c4f3a84cfba8e33fe3c117aa8a','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui id assumenda odit reprehenderit possimus officia.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 05:20:13',NULL,2.5,1,0,NULL,NULL),(150,'2f6aa08a8d5b408faa624be4555c552b','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Quos omnis et ab.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 04:20:13',NULL,2.5,1,0,NULL,NULL),(151,'25b4dfaa576741408db7534ba811cb41','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 03:20:13',NULL,2.5,1,0,NULL,NULL),(152,'57e03e8094f34473b5cf350f18c5f2f9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 02:20:13',NULL,2.5,1,0,NULL,NULL),(153,'78713ce0f74c4a58b37ca7360c87f03b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Labore et magni non. Consequatur est voluptatem quia facilis. Expedita voluptate recusandae aut quis sapiente officia ullam.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 01:20:13',NULL,2.5,1,0,NULL,NULL),(154,'6600fc6b87af4e94a9132b9ed4802454','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Porro quam ipsam corporis aspernatur. Ratione sapiente consequatur autem dignissimos qui. Qui excepturi deleniti.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:50','2014-12-06 10:19:50','2014-12-03 10:19:50','2014-12-02 00:20:13',NULL,2.5,1,0,NULL,NULL),(155,'d2299adadc704e95bb290f77d3b515b1','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Molestiae error quisquam dolorum magnam qui unde.',NULL,'',201208062341539,'',NULL,'',0,0,0,'2014-12-03 10:19:51','2014-12-06 10:19:51','2014-12-03 10:19:51','2014-12-01 23:20:13',NULL,2.5,1,0,NULL,NULL),(156,'e29982587b8c413ea8d4c8b9807ca651','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Quia saepe voluptatem culpa consequuntur quibusdam ipsum tempora voluptatem.',NULL,'',201207020117313,'',NULL,'',0,0,0,'2014-12-03 10:19:51','2014-12-06 10:19:51','2014-12-03 10:19:51','2014-12-01 22:20:13',NULL,2.5,1,0,NULL,NULL),(157,'857dd32593c4461e8c9dc922c40571cc','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ad esse et expedita reiciendis fuga.',NULL,'',200811131333809,'',NULL,'',0,0,0,'2014-12-03 10:19:51','2014-12-06 10:19:51','2014-12-03 10:19:51','2014-12-01 21:20:13',NULL,2.5,1,0,NULL,NULL),(158,'222b39dcfba24d0bb7fa22624a397794','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sunt cupiditate maxime est molestiae.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:51','2014-12-06 10:19:51','2014-12-03 10:19:51','2014-12-01 20:20:13',NULL,2.5,1,0,NULL,NULL),(159,'ed1ce5e1a52549c8be49c095d53812b6','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Illo blanditiis consequatur aut sunt reprehenderit quod rerum deleniti.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2014-12-03 10:19:52','2014-12-06 10:19:52','2014-12-03 10:19:52','2014-12-01 19:20:13',NULL,2.5,1,0,NULL,NULL),(160,'a0c56372c30948e592c3ddf5caeeb970','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:52','2014-12-06 10:19:52','2014-12-03 10:19:52','2014-12-01 18:20:13',NULL,2.5,1,0,NULL,NULL),(161,'e916a12d7885481f90fa5009ed9a2291','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:52','2014-12-06 10:19:52','2014-12-03 10:19:52','2014-12-01 17:20:13',NULL,2.5,1,0,NULL,NULL),(162,'b8b1b701ceb34ca1a80a846490f0d4f9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Et eum molestias aperiam qui doloribus. Vel sit nulla consectetur. Non nihil sed. Laboriosam animi atque. Non numquam iste sint et quidem perferendis veritatis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:52','2014-12-06 10:19:52','2014-12-03 10:19:52','2014-12-01 16:20:13',NULL,2.5,1,0,NULL,NULL),(163,'ca1b916ece9b44b8b7d3884f89754ee0','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Sit enim beatae et ut autem officia distinctio. Sint occaecati eligendi ut neque sapiente. Est fuga rerum et earum expedita molestiae aut. Repellendus eveniet qui commodi qui doloribus earum. Minus ut est quibusdam ex.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:52','2014-12-06 10:19:52','2014-12-03 10:19:52','2014-12-01 15:20:13',NULL,2.5,1,0,NULL,NULL),(164,'e2880ffa99da44a5b69a12d1af79aadb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Inventore optio iste voluptatibus incidunt.',NULL,'',201206100250227,'',NULL,'',0,0,0,'2014-12-03 10:19:53','2014-12-06 10:19:53','2014-12-03 10:19:53','2014-12-01 14:20:13',NULL,2.5,1,0,NULL,NULL),(165,'ebf12a4a870b44dea2e35736fcabeeb6','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Autem fugit quia corrupti rerum aperiam est impedit doloribus.',NULL,'',201111012019618,'',NULL,'',0,0,0,'2014-12-03 10:19:53','2014-12-06 10:19:53','2014-12-03 10:19:53','2014-12-01 13:20:13',NULL,2.5,1,0,NULL,NULL),(166,'afa5db2732aa4e2e9246f16b4c64d4ab','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quis voluptas impedit voluptas.',NULL,'',200811131349975,'',NULL,'',0,0,0,'2014-12-03 10:19:53','2014-12-06 10:19:53','2014-12-03 10:19:53','2014-12-01 12:20:13',NULL,2.5,1,0,NULL,NULL),(167,'287d9e807dad49a9aebbafb457bd343f','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Accusamus veniam et qui omnis.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:53','2014-12-06 10:19:53','2014-12-03 10:19:53','2014-12-01 11:20:13',NULL,2.5,1,0,NULL,NULL),(168,'1a3c7a1bd0e843538d4c9211624c5b02','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Natus ut tenetur esse commodi.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2014-12-03 10:19:53','2014-12-06 10:19:53','2014-12-03 10:19:53','2014-12-01 10:20:13',NULL,2.5,1,0,NULL,NULL),(169,'84d2794656334ac79a2e326273347034','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Molestiaeus rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:54','2014-12-06 10:19:54','2014-12-03 10:19:54','2014-12-01 09:20:13',NULL,2.5,1,0,NULL,NULL),(170,'969e1f39cc3d444a898c51d3d01a4868','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Molestiaeus rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:54','2014-12-06 10:19:54','2014-12-03 10:19:54','2014-12-01 08:20:13',NULL,2.5,1,0,NULL,NULL),(171,'36dd2b096b3946bf8c0220288e497aa0','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Eum laboriosam aliquid. Dolor quis iusto. Dolores praesentium laboriosam recusandae aspernatur aliquid.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:54','2014-12-06 10:19:54','2014-12-03 10:19:54','2014-12-01 07:20:13',NULL,2.5,1,0,NULL,NULL),(172,'b83efc81f727491789960497300a0e2b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Officiis laborum est. Iusto odio ea. Quaerat accusamus eum aut voluptatem. Voluptates est eum officiis quis sapiente corrupti. Sint quisquam dolorum similique eos officiis qui.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:54','2014-12-06 10:19:54','2014-12-03 10:19:54','2014-12-01 06:20:13',NULL,2.5,1,0,NULL,NULL),(173,'6ef4e2dd4ee44af29d3ba0a45e3f4eb9','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Est quis facilis soluta autem impedit exercitationem qui.',NULL,'',201111021549802,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 05:20:13',NULL,2.5,1,0,NULL,NULL),(174,'06449f7d55874077b5605a9ae34270fc','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Dignissimos voluptatem reiciendis perferendis dolore nesciunt molestiae placeat.',NULL,'',201212282365133,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 04:20:13',NULL,2.5,1,0,NULL,NULL),(175,'37efe72139e441b1a2b86780fc2b062d','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Eum est vel voluptatem qui.',NULL,'',200811131317614,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 03:20:13',NULL,2.5,1,0,NULL,NULL),(176,'33e750e0b497492bb2ff62341eb66347','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sit saepe consequatur iure cumque.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 02:20:13',NULL,2.5,1,0,NULL,NULL),(177,'b200dbacc84f49278dd4680e0f01eced','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Facilis quia suscipit voluptate fuga provident aut reiciendis qui.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 01:20:13',NULL,2.5,1,0,NULL,NULL),(178,'5e55ee92642a4fb19721c7876629d419','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-12-01 00:20:13',NULL,2.5,1,0,NULL,NULL),(179,'bc15487575c74ddbae844104194d96af','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:55','2014-12-06 10:19:55','2014-12-03 10:19:55','2014-11-30 23:20:13',NULL,2.5,1,0,NULL,NULL),(180,'79d471163102477a999415388997e48b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Autem recusandae voluptas non id. Sed ipsa quasi repellat et quisquam occaecati. Dolorem nobis vitae eveniet est ratione facilis. Aspernatur non quia vel eaque earum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:56','2014-12-06 10:19:56','2014-12-03 10:19:56','2014-11-30 22:20:13',NULL,2.5,1,0,NULL,NULL),(181,'faa3aa3844984825aded75bb668a700e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Rerum aut tenetur rerum qui. Quas dolore sit. Quae repellendus quibusdam ea sequi quod ut ut.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:56','2014-12-06 10:19:56','2014-12-03 10:19:56','2014-11-30 21:20:13',NULL,2.5,1,0,NULL,NULL),(182,'eeb599cf0dab4a05b88d895fc7567a77','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Hic et natus soluta et omnis nulla libero eos.',NULL,'',201203270178402,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 20:20:13',NULL,2.5,1,0,NULL,NULL),(183,'3e2a24e3a5d4497a99b13c0bd37fb26a','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Hic dolor vitae enim saepe enim voluptatem voluptatem adipisci.',NULL,'',201111020456873,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 19:20:13',NULL,2.5,1,0,NULL,NULL),(184,'b998ee03cb084e4ca2cc8096db1a6ad8','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Non corrupti nihil debitis delectus adipisci quisquam eos odit.',NULL,'',200811131356003,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 18:20:13',NULL,2.5,1,0,NULL,NULL),(185,'83450bd9ae8f4b818ec8d802d2542cbb','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Adipisci eius totam suscipit officiis aut est excepturi.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 17:20:13',NULL,2.5,1,0,NULL,NULL),(186,'f1ee46dde9cc4bb1913523fc0d45c521','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Culpa reprehenderit fugiat aut aut.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 16:20:13',NULL,2.5,1,0,NULL,NULL),(187,'c84d7edddcbe48cfb785d67bb4f101ec','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 15:20:13',NULL,2.5,1,0,NULL,NULL),(188,'7d95f5721d6f4451b739e54dcddb1905','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:57','2014-12-06 10:19:57','2014-12-03 10:19:57','2014-11-30 14:20:13',NULL,2.5,1,0,NULL,NULL),(189,'724626c665c74d5abe6a87f9c1f4dce2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Similique voluptatum earum aliquam veritatis temporibus autem. Rem ea esse ipsam autem. Nihil culpa labore provident a quis molestiae. Ipsum similique et illum rerum eos ipsa. Odit ipsa rem natus nihil voluptas placeat voluptatibus.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:58','2014-12-06 10:19:58','2014-12-03 10:19:58','2014-11-30 13:20:13',NULL,2.5,1,0,NULL,NULL),(190,'51cbfe1fae4c4beb98bc9905fc164998','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Incidunt recusandae quo ullam est. Aperiam repudiandae aut eligendi. Reprehenderit ullam eius eligendi deserunt ratione assumenda corrupti. Ipsa quia vel. Distinctio mollitia sunt animi.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:58','2014-12-06 10:19:58','2014-12-03 10:19:58','2014-11-30 12:20:13',NULL,2.5,1,0,NULL,NULL),(191,'2e24e9720aaf4b46a2e4bacea8d083ce','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Veniam vitae recusandae assumenda voluptatem quia ea necessitatibus explicabo.',NULL,'',201111020680528,'',NULL,'',0,0,0,'2014-12-03 10:19:58','2014-12-06 10:19:58','2014-12-03 10:19:58','2014-11-30 11:20:13',NULL,2.5,1,0,NULL,NULL),(192,'e64946d42c3045179709d8371f2b5cfb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Sit similique cupiditate exercitationem numquam sit velit.',NULL,'',201111020677567,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 10:20:13',NULL,2.5,1,0,NULL,NULL),(193,'c81f81170fc14a32b65a8c36326d0695','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Voluptas dolor minus et.',NULL,'',200811131372942,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 09:20:13',NULL,2.5,1,0,NULL,NULL),(194,'e15d54428f4343028ca840e949ea0933','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Nostrum et quaerat hic assumenda.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 08:20:13',NULL,2.5,1,0,NULL,NULL),(195,'2701602b9d044708825a6395eb355935','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Et dolores voluptatum repudiandae eligendi accusantium officia eveniet totam.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 07:20:13',NULL,2.5,1,0,NULL,NULL),(196,'4d697d2639574421ace23ed50ae96bc8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 06:20:13',NULL,2.5,1,0,NULL,NULL),(197,'23ac4f47acb84a948e2c57a73cdab8be','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 05:20:13',NULL,2.5,1,0,NULL,NULL),(198,'af42a3fa76a64ef9afb9389dcf8d8045','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Accusantium voluptatem hic amet. Dolores quis voluptatem aut repudiandae. Omnis fugit dolores culpa accusamus cum numquam nulla. A similique repellendus unde beatae vel reiciendis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 04:20:13',NULL,2.5,1,0,NULL,NULL),(199,'f111521151bc4743b76c3acd84f0e14e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Recusandae occaecati nihil atque et vel fugit. Non eius asperiores. Velit non et maiores quia.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:19:59','2014-12-06 10:19:59','2014-12-03 10:19:59','2014-11-30 03:20:13',NULL,2.5,1,0,NULL,NULL),(200,'ca295a02e4c04bf48d92b7956ec3bfb1','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Modi aut neque nesciunt sit et magni.',NULL,'',201201290348969,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-30 02:20:13',NULL,2.5,1,0,NULL,NULL),(201,'b15ef771cfd148d29621416081eac3cc','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Placeat ut omnis quia.',NULL,'',201111240192495,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-30 01:20:13',NULL,2.5,1,0,NULL,NULL),(202,'2f01a752decb405ea83fe797c57a22c8','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Illo qui maxime est voluptatem.',NULL,'',200811131393363,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-30 00:20:13',NULL,2.5,1,0,NULL,NULL),(203,'d9de2d0f77314c21bfe2879464a4bdd9','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Adipisci cum ut culpa asperiores.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-29 23:20:13',NULL,2.5,1,0,NULL,NULL),(204,'ed01ac5084eb4835a118b0fca95be583','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Ut sit eos est libero eveniet dignissimos repellendus dolorum.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-29 22:20:13',NULL,2.5,1,0,NULL,NULL),(205,'9aa84d36e4a34e388dcfc250c2a152b1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:01','2014-12-06 10:20:01','2014-12-03 10:20:01','2014-11-29 21:20:13',NULL,2.5,1,0,NULL,NULL),(206,'54e27d96a4474de1bed6e676d9d42214','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:02','2014-12-06 10:20:02','2014-12-03 10:20:02','2014-11-29 20:20:13',NULL,2.5,1,0,NULL,NULL),(207,'b30872c1c46a448da82441a9c92692dd','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ea nemo accusantium voluptas consequuntur. Illum qui assumenda nulla quis. Eum libero reprehenderit recusandae. Corrupti est non aut. Inventore voluptas porro rem nemo.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:02','2014-12-06 10:20:02','2014-12-03 10:20:02','2014-11-29 19:20:13',NULL,2.5,1,0,NULL,NULL),(208,'e5bff58b743f4e20826fba074d000e8d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Qui soluta dolorum vel. Eius sint ut vel odit labore. Aut tempore rerum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:02','2014-12-06 10:20:02','2014-12-03 10:20:02','2014-11-29 18:20:13',NULL,2.5,1,0,NULL,NULL),(209,'f2437438cccd4e2d89c97ebede0f769d','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Eveniet qui ut voluptas ex in non nam rerum.',NULL,'',201206250194550,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 17:20:13',NULL,2.5,1,0,NULL,NULL),(210,'7e0f81208a7140af8a9404cbe5e8ec89','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Ipsum et qui deleniti eum nobis voluptatibus.',NULL,'',201201070101022,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 16:20:13',NULL,2.5,1,0,NULL,NULL),(211,'7e6b676994bf43ce860056be1c411221','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sint suscipit iusto et est.',NULL,'',200811131382901,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 15:20:13',NULL,2.5,1,0,NULL,NULL),(212,'3d28da8446f548139641643faccef990','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et officiis quo ullam dolor molestiae hic.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 14:20:13',NULL,2.5,1,0,NULL,NULL),(213,'e8fe05a1619045548c25f487a7d6e41b','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Ut inventore ut veniam molestiae.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 13:20:13',NULL,2.5,1,0,NULL,NULL),(214,'2b690545569f421bb372de8960951573','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:03','2014-12-06 10:20:03','2014-12-03 10:20:03','2014-11-29 12:20:13',NULL,2.5,1,0,NULL,NULL),(215,'2b0ca42c8ca945c58a85bb60455e15b7','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:04','2014-12-06 10:20:04','2014-12-03 10:20:04','2014-11-29 11:20:13',NULL,2.5,1,0,NULL,NULL),(216,'26cb37f0b4e7495b9d8afdd36330ce3f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Omnis officiis doloremque distinctio et consequatur. Aliquam ut saepe quos eaque eum est modi. Repellendus dolorem dolore fuga quod eos.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:04','2014-12-06 10:20:04','2014-12-03 10:20:04','2014-11-29 10:20:13',NULL,2.5,1,0,NULL,NULL),(217,'a8b994e543374c1b9f01e74463ae1943','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Illum et cumque. Et autem nobis dignissimos. Enim perspiciatis fugit ullam inventore. Delectus laudantium rerum. Dolores impedit odit et eveniet asperiores.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:04','2014-12-06 10:20:04','2014-12-03 10:20:04','2014-11-29 09:20:13',NULL,2.5,1,0,NULL,NULL),(218,'33076820449746edba41c79120f6e9b6','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et aspernatur accusantium temporibus quam.',NULL,'',201301070350990,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 08:20:13',NULL,2.5,1,0,NULL,NULL),(219,'30df2d93e4f7452fb141638d6f87ab6e','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aut ut quo atque perspiciatis nemo enim.',NULL,'',201205060097570,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 07:20:13',NULL,2.5,1,0,NULL,NULL),(220,'e0a66fdf570e4e92822438e380be07e9','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Rerum numquam recusandae nesciunt.',NULL,'',200811131355461,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 06:20:13',NULL,2.5,1,0,NULL,NULL),(221,'1433f9b5745f4944bb8ef3b1c3e7902c','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Rem et odit aspernatur inventore aperiam.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 05:20:13',NULL,2.5,1,0,NULL,NULL),(222,'a4e387d48c67499381f58c215295bf77','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Autem et praesentium aliquid et eos quos vel et.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 04:20:13',NULL,2.5,1,0,NULL,NULL),(223,'c7fca3af6ac64eb2a355f91e7b4e8e2c','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Adaliasii iurea</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:05','2014-12-06 10:20:05','2014-12-03 10:20:05','2014-11-29 03:20:13',NULL,2.5,1,0,NULL,NULL),(224,'054562c7c7494060b8afa4ba9991f79a','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Adaliasii iurea</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:06','2014-12-06 10:20:06','2014-12-03 10:20:06','2014-11-29 02:20:13',NULL,2.5,1,0,NULL,NULL),(225,'fb2f36cab17b47489575854f1dd8a1aa','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Praesentium et beatae minus asperiores iure dolorum. Atque impedit quia quia sit. Ducimus odit dolorem optio. Suscipit non odit repudiandae.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:06','2014-12-06 10:20:06','2014-12-03 10:20:06','2014-11-29 01:20:13',NULL,2.5,1,0,NULL,NULL),(226,'e97d456460d84f03a0922e5fe2746ab2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Totam vitae velit. Accusamus id optio dolorem temporibus consequatur. Et quia possimus rerum sed.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:06','2014-12-06 10:20:06','2014-12-03 10:20:06','2014-11-29 00:20:13',NULL,2.5,1,0,NULL,NULL),(227,'57644b63ec254fc993d17b9ae9639b7d','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Non exercitationem consequatur veniam maxime rerum esse ad totam.',NULL,'',201111021659647,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 23:20:13',NULL,2.5,1,0,NULL,NULL),(228,'e788193ea4a34f35bbba33443c4661b5','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Consequatur et omnis non aut.',NULL,'',201111210127467,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 22:20:13',NULL,2.5,1,0,NULL,NULL),(229,'f724a03f575547468d526244ca63c2a8','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Rerum qui sit architecto placeat molestiae.',NULL,'',200811131374742,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 21:20:13',NULL,2.5,1,0,NULL,NULL),(230,'fe5e6b4be4ef4549afd5f7c3ed6c98ca','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Tenetur suscipit nihil aliquam ipsum.',NULL,'',0,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 20:20:13',NULL,2.5,1,0,NULL,NULL),(231,'b93a3e6f7b00403fb140ec223e46e226','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Id inventore ex aut et ut.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 19:20:13',NULL,2.5,1,0,NULL,NULL),(232,'7d6214e30ed2448b8dc5b1e59dba84c2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Nonnumquamerus numquamerus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:07','2014-12-06 10:20:07','2014-12-03 10:20:07','2014-11-28 18:20:13',NULL,2.5,1,0,NULL,NULL),(233,'1b303bc042084beb97e4abf1da95cd01','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Nonnumquamerus numquamerus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:08','2014-12-06 10:20:08','2014-12-03 10:20:08','2014-11-28 17:20:13',NULL,2.5,1,0,NULL,NULL),(234,'30cab418da5f45d0bacd44ebe9d3a8eb','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Consequatur totam dolorem qui quas ut. Ea occaecati non eligendi aspernatur totam. Dolore et est aliquam architecto facere optio. Exercitationem sed in impedit officiis ab eligendi.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:08','2014-12-06 10:20:08','2014-12-03 10:20:08','2014-11-28 16:20:13',NULL,2.5,1,0,NULL,NULL),(235,'ae67a183e8d14601beaac66dbfeddd5e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Vero id nobis. Nostrum voluptas quia alias velit officiis eum. Tempore dicta unde harum facilis non.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:08','2014-12-06 10:20:08','2014-12-03 10:20:08','2014-11-28 15:20:13',NULL,2.5,1,0,NULL,NULL),(236,'12db83c6450240b993ef3cd698243517','',NULL,2,NULL,1,'',1,NULL,3,'Test rights statement','Test rights holder','','','Test Data Object',NULL,'',NULL,'',NULL,'',0,0,0,'2014-12-03 10:20:15','2014-12-06 10:20:15','2014-12-03 10:20:15','2014-12-05 10:20:15',NULL,2.5,1,0,NULL,NULL);
/*!40000 ALTER TABLE `data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_harvest_events`
--

DROP TABLE IF EXISTS `data_objects_harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_harvest_events` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`data_object_id`),
  KEY `index_data_objects_harvest_events_on_guid` (`guid`),
  KEY `index_data_objects_harvest_events_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_harvest_events`
--

LOCK TABLES `data_objects_harvest_events` WRITE;
/*!40000 ALTER TABLE `data_objects_harvest_events` DISABLE KEYS */;
INSERT INTO `data_objects_harvest_events` VALUES (2,2,'24c8e8bc37f2c01203303b0b0793bef0',1),(2,3,'ac720da05302d9ee8e5a2378b127dd9f',1),(2,4,'f23188309ba7a197eb69f988315d1c79',1),(2,5,'4f416ac281cb99db7e9af8ef5cae1ff8',1),(2,6,'83cdf7844ac03c266732fcd37dc2a0ba',1),(2,7,'c54ab8f3dd5f57f30cffa1e3a9a39954',1),(2,8,'38e720b9cb4253f1399f4e67b01e3de0',1),(2,9,'312f9320cbb8c7c0aa25cce7648477e1',1),(2,10,'7be3ca39daf44b7d2a6fa8e0a32310e4',1),(2,11,'88b21f0c58bf08a408733462760eb0a7',1),(2,12,'5b7209a3477d5ecfdcdd6d415b95c736',1),(2,13,'f9168630a31060aa8b90274e7e2213f1',1),(2,14,'0467d7ef8d42bdcbcd9ec3f7f9501e78',1),(2,15,'fda95df1fa68b789c639b147ae95805e',1),(2,16,'6e4d3c4a4f294ddde592ef3659df72a3',1),(2,17,'406705cceffee42d92d5eba7a5e03306',1),(2,18,'b238a270ef4c2fd7d504a63949d17e37',1),(2,19,'528a79d72078374221ba87ff9906d6c9',1),(2,20,'3814b7348bd96f39f67c4038f4c5bb85',1),(2,21,'cd46d4920a21cbebafbaef829d95a618',1),(2,22,'44a9ef6f4a634e0de465016c88497ca1',1),(2,23,'9fa30e316fbb48715cbdecb0fe0c91d6',1),(2,24,'ba76de6793511b9e728d4704261edcc7',1),(2,25,'135f16ee7f3b7580721cc3a663ff65b7',1),(2,26,'8b27b01df069878abf54072c88175ac4',1),(2,27,'bee8d3cf77c80ce8b3c69fb54b2b3a89',1),(2,28,'a4ee16d5d09a96853f96659548ff6947',1),(2,29,'74193ada385f2f3afea80bf04e7c3eec',1),(2,30,'a0ce7aa61c45d5dcddd5136a111f9b50',1),(2,31,'479651cea5ba49facdc50fabb89e165e',1),(2,32,'68aedd384040c76378d44f9427134567',1),(2,33,'b6ed22b6e33db1cb25aebec17ab2220e',1),(2,34,'6ac29265076130139f01f0f34620a61b',1),(2,35,'472e1af08ee18c170f4715ffb785cff8',1),(2,36,'57ddf51b583b586934867ada8bbcd010',1),(2,37,'8fecfacda0eb0d777c9aa788ea84ec83',1),(2,38,'9b9ae1396392ffa557553ca8886d59db',1),(2,39,'93733f52d68529844c532443d6937ff5',1),(2,40,'c10a991f4f8d40711ddbb8807bff6bbf',1),(2,41,'c77c8d26d48ffcb17df499bb564228f0',1),(2,42,'5f0a80f910110a35c3359e68ac19c1ea',1),(2,43,'8a2f14b9c9989cb1a666001606db26ac',1),(2,44,'519c53e768b4533feb578f815100e65d',1),(2,45,'084bec6d015b86c84ffef9a8470c654e',1),(2,46,'034dd033c7642a3b38304d80fca04598',1),(2,47,'b085e5ce5e7a1a90584b6eff157c92b1',1),(2,48,'64a7ce041178d327f48f3f512dd5d017',1),(2,49,'99dcc27e3958193972d3827e63fe5de6',1),(2,50,'5caf99b127187fb2ffecfd5460c9f70b',1),(2,51,'ba8dc416c24a8cd4e2c6cfa26a7a383f',1),(2,52,'6f165447ef14a36dd33dc74c47bf4229',1),(2,53,'c59dfcf44015e33abca444ef2896fb9f',1),(2,54,'1005a483fd8557d13d38d1e88a1e5324',1),(2,55,'c42380fcd90b87890d5bf7a292ab81a9',1),(2,56,'07a07e4aa81b2a32d2ead6fd0e960fad',1),(2,57,'dfa79094c0b1dcc57f91beb84548f655',1),(2,58,'f643970e412e90e68246b3d84c927e50',1),(2,59,'e3b7dac69e9a5c3d2315f54c575418f4',1),(2,60,'285270cdf7d0bb6ae85dde609561978b',1),(2,61,'de737892085b4a2d709c01ac8feb42bf',1),(2,62,'4f0d3a0416dd0bca525e288344ed8b10',1),(2,63,'6b71d1fbc3ea20a8df678092902b58bc',1),(2,64,'47cd319ca6065026f49b9ff3697be32b',1),(2,65,'1438301f79449b2b4fbcaf9f8b150c1d',1),(2,66,'396edbe4aaf4fb060c2ab69794094e66',1),(2,67,'8cc00acc42d801219ce52627487cf3f3',1),(2,68,'6bde8d0dbc3d5676a3c959b9530c2733',1),(2,69,'057e66ab3ad045906e71cbf150c35f19',1),(2,70,'7db4a0a39b36cf83a6c6dba93cc8cc4d',1),(2,71,'b85ab01916debee4946aa915a1d4fd6f',1),(2,72,'098650247504345fbd18103f299a9dad',1),(2,73,'f2140e31085a2dc690d80ca0c9ce6040',1),(2,74,'0a0c6f712f1eaf1263002f848ed3599b',1),(2,75,'22f26ef0a781bed9a8e2265822f0c6f1',1),(2,76,'8ad61c195e8844f417c30394def4e100',1),(2,77,'d27fc436aabd7aa30eced5b36124eff7',1),(2,78,'ed0965c4443da90682324f5a419b0e8a',1),(2,79,'60909a4072a59b6db00d215e571c3998',1),(2,80,'b6f0ad500fec18a109f7e2858106dcdc',1),(2,81,'58b2ebda4048af6860e62c940cd5f5fd',1),(2,82,'914a4178f235a5fb92a9dcae94625407',1),(2,83,'e224ad8a068cfa8d4ad5a287038a2745',1),(2,84,'e30a6860dfdaf225e4adec4bfeb74b93',1),(2,85,'79e7ca082bd75e55f74c87e587c56bbd',1),(2,86,'8f40ddff4df261886810a5c47f02a03f',1),(2,87,'2ca811330f22b2073964b487c1e764d3',1),(2,88,'571b83a3115425cc5e31983dcaaee6bd',1),(2,89,'59c24d3969f9e14a9130cdb2b9f42d3c',1),(2,101,'bbf9215507beeb467c1886fca6877f1d',1),(2,102,'9959c9506786e88608a476c1e96ba68b',1),(2,103,'ab5ae47dc06e994e5c0ace947bf5f39e',1),(2,104,'326d87e3ceee3954d99b095633651c60',1),(2,105,'cd7d147b75ccaf266673a55b5d711bba',1),(2,106,'d962c984601278f8c0bc60c5c7e9f9d9',1),(2,107,'92d28c800de1a1057448d0678fbf35ed',1),(2,108,'4fafcaa949755821ef55a11cbd38a461',1),(2,109,'aead39a23c9f90d4677e5255da3afdd1',1),(2,110,'643e24921eeb284e5648bdca37f7c949',1),(2,111,'ee7d6913a423eae25d6459e0e3126361',1),(2,112,'039652865eaeeb44443aff97c73e4799',1),(2,113,'7190e68d3c33bf2fd155a874207c94f8',1),(2,114,'ffd13a73caccf1d1c7d8c617c21f4b05',1),(2,115,'84d06c13e42c19a59d5308ed7ac7e217',1),(2,116,'a0b858ef197ff28973d4c6e0f227f0e7',1),(2,117,'16a3a33c045988229909bfdeb18e1db0',1),(2,118,'4d5f18a600bcd150bd29c92bf4fb3856',1),(2,119,'44062531207b9634aff872882d64f698',1),(2,120,'e572519483370185c33f01415ddc4189',1),(2,121,'dfd01a3f917f456403ad11af2e871b67',1),(2,122,'dd897c7149b061d002c24d80263ed240',1),(2,123,'fe229ed28f9a3261853c5e4740323994',1),(2,124,'015791705e6c0d48655e4af9847a2bf0',1),(2,125,'c4d6e6a444834b5e58f6c004f69cc9ec',1),(2,126,'ef89c7c6ca8c242bc60fd1d5132a8d19',1),(2,127,'58dbb5e2be619c0e62ed76bafcdddbb1',1),(2,128,'07059781e8e095284bba4099868fd893',1),(2,129,'74e04902889ebcfbe1ef2157c73593ac',1),(2,130,'70fde66092b2a5d69854a83db80d7c22',1),(2,131,'67b6581c6a7d6e1b50b4f97a128087a6',1),(2,132,'ccc589bd29331cd157ec570e19a20b16',1),(2,133,'99e5df118300e06298e165e5b5b0c974',1),(2,134,'5fc243465fbca2be22ce08508961c5e7',1),(2,135,'3bdfad7dc9550c1e930545e316c3a1ed',1),(2,136,'9e7434fb7b8a5b66dccac8604c910efc',1),(2,137,'0c97a53dfc1baa2b7b5facaeb8f2da91',1),(2,138,'a09004b418199b536e3f3224602ffe25',1),(2,139,'8bb2f30cd51f97ea1aa22e4543c2622d',1),(2,140,'bb75e9910d3c94bbc4d7201eddbca462',1),(2,141,'819b1ffee49fb35c217d1a7372f36186',1),(2,142,'305df4aef430a162b743e61f17a134f3',1),(2,143,'36578dc5389b26044c563858e54518a6',1),(2,144,'653dcf282ecdffa30cce5c4c0fec4f28',1),(2,145,'82d1098ee91d350f17a0ff574afa7e47',1),(2,146,'cadc21ee29ee94fd6c0667d19d497d0d',1),(2,147,'42e463451141b5719d240085b7617e2e',1),(2,148,'c605f6b816d04bc2632d0fc055d65fc4',1),(2,149,'08dcde09a1de8b49c7c6744c527e67b6',1),(2,150,'2c1c13582c0a62a99faa0640f461ee93',1),(2,151,'55cd9c3b3ef147213a030ba82a0fb50a',1),(2,152,'8bbfa11011178657e4f003ed18c13474',1),(2,153,'d42042ff240123545f893d9c39ea8f89',1),(2,154,'d2431e22af6b1775c544f848d3e2c12f',1),(2,155,'84900b047ce33a1d134307410ef52840',1),(2,156,'8f71a4bab3151aaaad7bd2b3efbcddb3',1),(2,157,'1bd33474fca8c0b305d08253c74b711e',1),(2,158,'bade4e89478e3cb85317b6e15a63de29',1),(2,159,'e85dfb818405a28464d7d1093f0afcba',1),(2,160,'dd41972f36e5b064600bdf5726ad629b',1),(2,161,'773b68346d9350ec74e914b79ede3a09',1),(2,162,'7a3398b4440e5b440aa7a0a77501f728',1),(2,163,'82d99b697ebaf1a136a4de99590fe61e',1),(2,164,'89bb6e6e4195f13082a4ba180604812d',1),(2,165,'efd5aaa2aa4f99795e6b287dad956168',1),(2,166,'f62ed1e63458e5c16a499f0b2d741bc1',1),(2,167,'70b716adfe0406ed92a8080e84efe8bc',1),(2,168,'1e24e56ffe96393fbf04c3c5bbe2ad2b',1),(2,169,'a5f8b749bd1474324a0ef434e93876e0',1),(2,170,'4f9560ccb8eb60c6bd730b5792c025f8',1),(2,171,'e9d8956b1459d663d0707180eab93a78',1),(2,172,'de2c5ecadc4f1d73bcf842953f3021dd',1),(2,173,'ddad9b435214edb92f1d60d181359101',1),(2,174,'a671550fd4f4ca5aaf1a38315ec7773f',1),(2,175,'56d5a628c427b4c63741e0970f36407c',1),(2,176,'5361647607c8e010ba372fa877e9c6fb',1),(2,177,'c35eb7808fa35a7791d7d908bfcff4b4',1),(2,178,'6694ae1025f6f0e24290dda4892d403f',1),(2,179,'502de0f6647e98dc61ab402af4b28e45',1),(2,180,'91eba567ae873cbb5c343a1d8aa9cdbe',1),(2,181,'14a7fd1ea04e3b18418a293500716b9d',1),(2,182,'f695374af133685d8db8bfa36891006a',1),(2,183,'695af0f3fd2f43da35f3a244390324b1',1),(2,184,'2f3a60ad296881e45197ca1854564e1f',1),(2,185,'a18861c84697dcad6be02604dcba728e',1),(2,186,'9d20b70b50fc79202bd54bbbb570863c',1),(2,187,'efcfe443e59851e94be8d270174f3044',1),(2,188,'f2c2402d20f500ac4a94b212b1760544',1),(2,189,'58120aff953b1abd3ab13137b8f3f4e5',1),(2,190,'55378309a8c0f3cbbcba01153b55f23b',1),(2,191,'58137ac47a6565e49d7b369e56115568',1),(2,192,'737a8826aa71edaa245d8c3cd1c213b5',1),(2,193,'06f04746ff06a7a76b42af0cb8bb46e8',1),(2,194,'94c005b1e7e19f48d014ded18974cfb1',1),(2,195,'76c9f9432f64e28d4273d98fb9ea1290',1),(2,196,'ffbeab4603e65239dfd0b56c98c31cb3',1),(2,197,'2f1d17c9f5cddcc39be1f33ec1b3b72c',1),(2,198,'206b4f69c5b345f37c66e66bad688df5',1),(2,199,'4aba385bf86ca4dd5d20d8ea2d477aba',1),(2,200,'de8946b0f7209530a2be28eb2f1746d8',1),(2,201,'10168f4ecf28a165603ca1abf99b15fe',1),(2,202,'d021f145a6e9c73d7da3c4c497181ae5',1),(2,203,'df292625f2d03b7d5dedf13b7a3e7e84',1),(2,204,'776c760244e85f16923d8bf91d17afd2',1),(2,205,'38e0efc820a0f29341eae86be3d8b210',1),(2,206,'04e71e954c6231f24b705ae63192c03f',1),(2,207,'52f0df6dea218487dc6bec607682eb87',1),(2,208,'980dd95e4b478dadbbc646baa0763f01',1),(2,209,'ad28cad25c7ee19a71687c93e815f359',1),(2,210,'7fbfdef910ad975e8209b7aca47320af',1),(2,211,'05abec86bfb9129d315213a0e09fee75',1),(2,212,'99c3b3c87e9d233bf926193226b99613',1),(2,213,'97abea6cb01bae6d10fedcabb3e17e36',1),(2,214,'a2d946d2ea6b477a70ae6618671daaa3',1),(2,215,'7e641da8e6563ec8869db190ae5175a0',1),(2,216,'37d3be5b79ca6c43245090798bb0c278',1),(2,217,'29629df246d6cce670ce3aa49e068f45',1),(2,218,'2c5f3c979d04fe2da22a5de67572f282',1),(2,219,'956017b405751c96e7bdf622c0fd588a',1),(2,220,'eba56453fa4ed41697ff979695e03f78',1),(2,221,'c15842a2b8e40e64c018a60c19d928b0',1),(2,222,'7d9027a71d94aa7e94795f3a79b4fa3f',1),(2,223,'585d44bb18abaaafb578337ea10c8774',1),(2,224,'91117abba890ca0962765f87a77839f3',1),(2,225,'ad171e9ae6f87401b905a2f091da994a',1),(2,226,'aa439638ab5fa04fa9831d4527e3c7b5',1),(2,227,'c44ce57307d4f1e4afc9f82ea6f66e3e',1),(2,228,'00060e90c32f94b7c7a7d24fa2f39873',1),(2,229,'59d7cb310928647679a5ffaf51a16eb1',1),(2,230,'3c36d42f887bbf2e9be2b590ba0c776b',1),(2,231,'6ac8084d383d346d680299fc9cd360b4',1),(2,232,'8a802af8f12e98f749e91e01936194a5',1),(2,233,'d05586e2dbffa509ed7e82d86bdd719b',1),(2,234,'13011b9d0599674b09832f5a73593d20',1),(2,235,'40b901bb34cbc865a29930835cbf1de6',1),(3,82,'914a4178f235a5fb92a9dcae94625407',1),(4,88,'571b83a3115425cc5e31983dcaaee6bd',1),(5,92,'5c97b33c11167894deb604a67fb73609',1),(5,93,'a780b7f833ad316e1f16290dd72e0aca',1),(5,94,'5a5aa9970c717e89a95c334b4e1b786d',1),(5,95,'adc35dfd86742473452ed8384c2e0865',1),(5,96,'90bd853199973ad9b83b3f8417cc4da2',1),(5,97,'0d767f0bd39e9c7d22d0f6c799754b8e',1),(5,98,'24885eacfb7ef927672eb27323d0765f',1),(5,99,'c2e5c4a54b06b6cdc2130287b4720179',1),(5,100,'44c5ebcfeace64b74ac5644b49239ded',1);
/*!40000 ALTER TABLE `data_objects_harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_hierarchy_entries`
--

LOCK TABLES `data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `data_objects_hierarchy_entries` VALUES (1,1,1,2),(2,2,1,2),(2,3,1,2),(2,4,1,2),(2,5,1,2),(2,6,1,2),(2,7,1,2),(2,8,1,2),(2,9,1,2),(2,10,1,2),(3,11,1,2),(3,12,1,2),(3,13,1,2),(3,14,1,2),(3,15,1,2),(3,16,1,2),(3,17,1,2),(3,18,1,2),(3,19,1,2),(4,20,1,2),(4,21,1,2),(4,22,1,2),(4,23,1,2),(4,24,1,2),(4,25,1,2),(4,26,1,2),(4,27,1,2),(4,28,1,2),(5,29,1,2),(5,30,1,2),(5,31,1,2),(5,32,1,2),(5,33,1,2),(5,34,1,2),(5,35,1,2),(5,36,1,2),(5,37,1,2),(6,38,1,2),(6,39,1,2),(6,40,1,2),(6,41,1,2),(6,42,1,2),(6,43,1,2),(6,44,1,2),(6,45,1,2),(6,46,1,2),(7,47,1,2),(7,48,4,2),(7,49,3,2),(7,50,2,2),(7,51,1,1),(7,52,1,3),(7,53,2,1),(7,54,3,1),(7,55,2,3),(7,56,1,2),(7,57,1,2),(7,58,1,2),(7,59,1,2),(7,60,1,2),(7,61,1,2),(7,62,1,2),(8,63,1,2),(9,64,1,2),(10,65,1,2),(11,66,1,2),(11,67,4,2),(11,68,3,2),(11,69,2,2),(11,70,1,1),(11,71,1,3),(11,72,2,1),(11,73,3,1),(11,74,2,3),(11,75,3,2),(11,76,3,2),(11,77,1,2),(11,78,1,2),(11,79,1,2),(11,80,1,2),(11,81,1,2),(12,82,1,2),(12,83,1,2),(12,84,2,2),(12,85,2,2),(12,86,3,2),(12,87,1,2),(12,88,1,2),(12,89,1,2),(12,90,1,2),(12,91,1,2),(13,92,1,2),(13,93,1,2),(13,94,1,2),(13,95,1,2),(13,96,1,2),(13,97,1,2),(13,98,1,2),(13,99,1,2),(14,100,2,3),(17,101,1,2),(17,102,1,2),(17,103,1,2),(17,104,1,2),(17,105,1,2),(17,106,1,2),(17,107,1,2),(17,108,1,2),(17,109,1,2),(24,110,1,2),(24,111,1,2),(24,112,1,2),(24,113,1,2),(24,114,1,2),(24,115,1,2),(24,116,1,2),(24,117,1,2),(24,118,1,2),(26,119,1,2),(26,120,1,2),(26,121,1,2),(26,122,1,2),(26,123,1,2),(26,124,1,2),(26,125,1,2),(26,126,1,2),(26,127,1,2),(27,128,1,2),(27,129,1,2),(27,130,1,2),(27,131,1,2),(27,132,1,2),(27,133,1,2),(27,134,1,2),(27,135,1,2),(27,136,1,2),(28,137,1,2),(28,138,1,2),(28,139,1,2),(28,140,1,2),(28,141,1,2),(28,142,1,2),(28,143,1,2),(28,144,1,2),(28,145,1,2),(29,146,1,2),(29,147,1,2),(29,148,1,2),(29,149,1,2),(29,150,1,2),(29,151,1,2),(29,152,1,2),(29,153,1,2),(29,154,1,2),(30,155,1,2),(30,156,1,2),(30,157,1,2),(30,158,1,2),(30,159,1,2),(30,160,1,2),(30,161,1,2),(30,162,1,2),(30,163,1,2),(31,164,1,2),(31,165,1,2),(31,166,1,2),(31,167,1,2),(31,168,1,2),(31,169,1,2),(31,170,1,2),(31,171,1,2),(31,172,1,2),(32,173,1,2),(32,174,1,2),(32,175,1,2),(32,176,1,2),(32,177,1,2),(32,178,1,2),(32,179,1,2),(32,180,1,2),(32,181,1,2),(33,182,1,2),(33,183,1,2),(33,184,1,2),(33,185,1,2),(33,186,1,2),(33,187,1,2),(33,188,1,2),(33,189,1,2),(33,190,1,2),(34,191,1,2),(34,192,1,2),(34,193,1,2),(34,194,1,2),(34,195,1,2),(34,196,1,2),(34,197,1,2),(34,198,1,2),(34,199,1,2),(35,200,1,2),(35,201,1,2),(35,202,1,2),(35,203,1,2),(35,204,1,2),(35,205,1,2),(35,206,1,2),(35,207,1,2),(35,208,1,2),(36,209,1,2),(36,210,1,2),(36,211,1,2),(36,212,1,2),(36,213,1,2),(36,214,1,2),(36,215,1,2),(36,216,1,2),(36,217,1,2),(37,218,1,2),(37,219,1,2),(37,220,1,2),(37,221,1,2),(37,222,1,2),(37,223,1,2),(37,224,1,2),(37,225,1,2),(37,226,1,2),(38,227,1,2),(38,228,1,2),(38,229,1,2),(38,230,1,2),(38,231,1,2),(38,232,1,2),(38,233,1,2),(38,234,1,2),(38,235,1,2);
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_info_items`
--

DROP TABLE IF EXISTS `data_objects_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_info_items` (
  `data_object_id` int(10) unsigned NOT NULL,
  `info_item_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`info_item_id`),
  KEY `info_item_id` (`info_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_info_items`
--

LOCK TABLES `data_objects_info_items` WRITE;
/*!40000 ALTER TABLE `data_objects_info_items` DISABLE KEYS */;
INSERT INTO `data_objects_info_items` VALUES (7,1),(16,1),(25,1),(34,1),(43,1),(59,1),(78,1),(88,1),(97,1),(98,1),(106,1),(115,1),(124,1),(133,1),(142,1),(151,1),(160,1),(169,1),(178,1),(187,1),(196,1),(205,1),(214,1),(223,1),(226,1),(232,1),(8,2),(17,2),(26,2),(35,2),(44,2),(60,2),(79,2),(89,2),(99,2),(107,2),(116,2),(125,2),(134,2),(143,2),(152,2),(161,2),(170,2),(179,2),(188,2),(197,2),(206,2),(215,2),(224,2),(233,2),(81,3),(99,3),(81,4),(8,5),(17,5),(26,5),(35,5),(44,5),(60,5),(79,5),(89,5),(99,5),(107,5),(116,5),(125,5),(134,5),(143,5),(152,5),(161,5),(170,5),(179,5),(188,5),(197,5),(206,5),(215,5),(224,5),(233,5),(8,6),(17,6),(26,6),(35,6),(44,6),(60,6),(79,6),(89,6),(99,6),(107,6),(116,6),(125,6),(134,6),(143,6),(152,6),(161,6),(170,6),(179,6),(188,6),(197,6),(206,6),(215,6),(224,6),(233,6),(8,7),(17,7),(26,7),(35,7),(44,7),(60,7),(79,7),(89,7),(99,7),(107,7),(116,7),(125,7),(134,7),(143,7),(152,7),(161,7),(170,7),(179,7),(188,7),(197,7),(206,7),(215,7),(224,7),(233,7),(118,8),(207,8),(8,10),(17,10),(26,10),(35,10),(44,10),(60,10),(79,10),(89,10),(99,10),(107,10),(116,10),(125,10),(134,10),(143,10),(152,10),(161,10),(170,10),(179,10),(188,10),(197,10),(206,10),(215,10),(224,10),(233,10),(108,11),(8,12),(17,12),(26,12),(35,12),(44,12),(60,12),(79,12),(89,12),(99,12),(107,12),(116,12),(125,12),(134,12),(143,12),(152,12),(161,12),(170,12),(179,12),(188,12),(197,12),(206,12),(215,12),(224,12),(233,12),(8,13),(17,13),(26,13),(35,13),(44,13),(60,13),(79,13),(89,13),(99,13),(107,13),(116,13),(125,13),(134,13),(143,13),(152,13),(161,13),(170,13),(179,13),(188,13),(197,13),(206,13),(215,13),(224,13),(233,13),(97,17);
/*!40000 ALTER TABLE `data_objects_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_link_types`
--

DROP TABLE IF EXISTS `data_objects_link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_link_types` (
  `data_object_id` int(10) unsigned NOT NULL,
  `link_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`),
  KEY `data_type_id` (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_link_types`
--

LOCK TABLES `data_objects_link_types` WRITE;
/*!40000 ALTER TABLE `data_objects_link_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_objects_link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_refs`
--

DROP TABLE IF EXISTS `data_objects_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_refs` (
  `data_object_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`ref_id`),
  KEY `do_id_ref_id` (`data_object_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_refs`
--

LOCK TABLES `data_objects_refs` WRITE;
/*!40000 ALTER TABLE `data_objects_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_objects_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_table_of_contents`
--

DROP TABLE IF EXISTS `data_objects_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_table_of_contents` (
  `data_object_id` int(10) unsigned NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`toc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_table_of_contents`
--

LOCK TABLES `data_objects_table_of_contents` WRITE;
/*!40000 ALTER TABLE `data_objects_table_of_contents` DISABLE KEYS */;
INSERT INTO `data_objects_table_of_contents` VALUES (7,1),(8,5),(9,47),(10,21),(16,1),(17,5),(18,30),(19,3),(25,1),(26,5),(27,40),(28,43),(34,1),(35,5),(36,22),(37,16),(43,1),(44,5),(45,14),(46,47),(59,1),(60,5),(61,50),(62,53),(78,1),(79,5),(80,43),(81,7),(88,1),(89,5),(90,1),(97,1),(98,1),(99,5),(106,1),(107,5),(108,9),(109,23),(115,1),(116,5),(117,4),(118,25),(124,1),(125,5),(126,16),(127,40),(133,1),(134,5),(135,46),(136,44),(142,1),(143,5),(144,46),(145,2),(151,1),(152,5),(153,15),(154,13),(160,1),(161,5),(162,58),(163,39),(169,1),(170,5),(171,43),(172,34),(178,1),(179,5),(180,4),(181,31),(187,1),(188,5),(189,33),(190,31),(196,1),(197,5),(198,22),(199,45),(205,1),(206,5),(207,25),(208,55),(214,1),(215,5),(216,4),(217,18),(223,1),(224,5),(225,32),(226,1),(232,1),(233,5),(234,4),(235,42);
/*!40000 ALTER TABLE `data_objects_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_taxon_concepts`
--

DROP TABLE IF EXISTS `data_objects_taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_taxon_concepts` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_taxon_concepts`
--

LOCK TABLES `data_objects_taxon_concepts` WRITE;
/*!40000 ALTER TABLE `data_objects_taxon_concepts` DISABLE KEYS */;
INSERT INTO `data_objects_taxon_concepts` VALUES (7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(12,47),(12,48),(12,49),(12,50),(12,51),(12,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60),(12,61),(12,62),(13,63),(14,64),(15,65),(16,66),(16,67),(16,68),(16,69),(16,70),(16,71),(16,72),(16,73),(16,74),(16,75),(16,76),(16,77),(16,78),(16,79),(16,80),(16,81),(17,82),(17,83),(17,84),(17,85),(17,86),(17,87),(17,88),(17,89),(17,90),(17,91),(18,92),(18,93),(18,94),(18,95),(18,96),(18,97),(18,98),(18,99),(18,100),(20,101),(20,102),(20,103),(20,104),(20,105),(20,106),(20,107),(20,108),(20,109),(21,110),(21,111),(21,112),(21,113),(21,114),(21,115),(21,116),(21,117),(21,118),(22,119),(22,120),(22,121),(22,122),(22,123),(22,124),(22,125),(22,126),(22,127),(23,128),(23,129),(23,130),(23,131),(23,132),(23,133),(23,134),(23,135),(23,136),(24,137),(24,138),(24,139),(24,140),(24,141),(24,142),(24,143),(24,144),(24,145),(25,146),(25,147),(25,148),(25,149),(25,150),(25,151),(25,152),(25,153),(25,154),(26,155),(26,156),(26,157),(26,158),(26,159),(26,160),(26,161),(26,162),(26,163),(27,164),(27,165),(27,166),(27,167),(27,168),(27,169),(27,170),(27,171),(27,172),(28,173),(28,174),(28,175),(28,176),(28,177),(28,178),(28,179),(28,180),(28,181),(29,182),(29,183),(29,184),(29,185),(29,186),(29,187),(29,188),(29,189),(29,190),(30,191),(30,192),(30,193),(30,194),(30,195),(30,196),(30,197),(30,198),(30,199),(31,200),(31,201),(31,202),(31,203),(31,204),(31,205),(31,206),(31,207),(31,208),(32,209),(32,210),(32,211),(32,212),(32,213),(32,214),(32,215),(32,216),(32,217),(33,218),(33,219),(33,220),(33,221),(33,222),(33,223),(33,224),(33,225),(33,226),(34,227),(34,228),(34,229),(34,230),(34,231),(34,232),(34,233),(34,234),(34,235);
/*!40000 ALTER TABLE `data_objects_taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_point_uris`
--

DROP TABLE IF EXISTS `data_point_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_point_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vetted_id` int(11) DEFAULT '1',
  `visibility_id` int(11) DEFAULT '2',
  `class_type` varchar(255) DEFAULT NULL,
  `predicate` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_added_data_id` int(11) DEFAULT NULL,
  `predicate_known_uri_id` int(11) DEFAULT NULL,
  `object_known_uri_id` int(11) DEFAULT NULL,
  `unit_of_measure_known_uri_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_point_uris_on_uri_and_taxon_concept_id` (`uri`,`taxon_concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_point_uris`
--

LOCK TABLES `data_point_uris` WRITE;
/*!40000 ALTER TABLE `data_point_uris` DISABLE KEYS */;
INSERT INTO `data_point_uris` VALUES (1,'http://eol.org/schema/resources/2/measurements/5e5a7650c8ac1204ad946cb3f96f21f0',11,'2014-12-10 08:29:07','2014-12-10 08:29:07',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/letter','1','http://purl.obolibrary.org/obo/UO_0000008',2,NULL,NULL,NULL,7),(2,'http://eol.org/schema/resources/2/measurements/82ee5ff7eccb80273a111268b1900cb7',11,'2014-12-10 08:29:07','2014-12-10 08:29:07',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/letter','10','http://purl.obolibrary.org/obo/UO_0000008',2,NULL,NULL,NULL,7),(3,'http://eol.org/schema/resources/1/measurements/f913ff531478114c17b8bbb5d1a135b1',11,'2014-12-10 08:33:06','2014-12-10 08:33:06',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/letter','5','http://purl.obolibrary.org/obo/UO_0000008',1,NULL,NULL,NULL,7),(4,'http://eol.org/schema/resources/1/measurements/de90bd621f688a78b9f4682e904675e3',11,'2014-12-10 08:33:06','2014-12-10 08:33:06',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/letter','15','http://purl.obolibrary.org/obo/UO_0000008',1,NULL,NULL,NULL,7),(5,'http://eol.org/schema/resources/1/measurements/a935bbd852e758b9a90299cff76b2a94',12,'2014-12-10 08:58:41','2014-12-10 08:58:41',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/animal','1','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(6,'http://eol.org/schema/resources/1/measurements/91139a31aa81ab62e4fff620c537ace7',12,'2014-12-10 08:58:41','2014-12-10 08:58:41',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/animal','10','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(7,'http://eol.org/schema/resources/2/measurements/2f6209267b25474c9c0c62806ae5a329',13,'2014-12-10 08:58:48','2014-12-10 08:58:48',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/human','50','http://purl.obolibrary.org/obo/UO_0000009',2,NULL,NULL,NULL,4),(8,'http://eol.org/schema/resources/2/measurements/d8dbf1f86737ea3baf3cdf714f7eb471',13,'2014-12-10 08:58:48','2014-12-10 08:58:48',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/human','100','http://purl.obolibrary.org/obo/UO_0000009',2,NULL,NULL,NULL,4),(9,'http://eol.org/schema/resources/1/measurements/a25b085afef1830521213a6717164152',13,'2014-12-10 08:58:48','2014-12-10 08:58:48',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/human','60','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(10,'http://eol.org/schema/resources/1/measurements/686867cde4dcc311f1279f462bf228ea',13,'2014-12-10 08:58:48','2014-12-10 08:58:48',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/human','120','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(11,'http://eol.org/schema/resources/1/measurements/84f24d2599f3175e5620bc10c65d89d0',14,'2014-12-10 08:58:56','2014-12-10 08:58:56',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Pen','1','http://purl.obolibrary.org/obo/UO_0000008',1,NULL,NULL,NULL,7),(12,'http://eol.org/schema/resources/1/measurements/095f7745b26d13d4c24ef83b57aed68d',14,'2014-12-10 08:58:56','2014-12-10 08:58:56',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Pen','2','http://purl.obolibrary.org/obo/UO_0000008',1,NULL,NULL,NULL,7),(13,'http://eol.org/schema/resources/2/measurements/e1c31121d7780ca8b0b01b51a297cb46',8,'2014-12-10 10:50:31','2014-12-10 10:50:31',1,2,'MeasurementOrFact','http://eol.org/length','15','http://purl.obolibrary.org/obo/UO_0000008',2,NULL,NULL,NULL,7),(14,'http://eol.org/schema/resources/2/measurements/74f601f595471f4d948807c5a418fc19',8,'2014-12-10 10:50:31','2014-12-10 10:50:31',1,2,'MeasurementOrFact','http://eol.org/length','15','http://purl.obolibrary.org/obo/UO_0000008',2,NULL,NULL,NULL,7),(15,'http://eol.org/schema/resources/2/measurements/37c0c9592c8c3aaac16312094f6c5edc',8,'2014-12-10 10:50:55','2014-12-10 10:50:55',1,2,'MeasurementOrFact','http://eol.org/length','30','http://purl.obolibrary.org/obo/UO_0000008',2,NULL,NULL,NULL,7),(16,'http://eol.org/schema/resources/1/measurements/c0bb1e8df6d096c4e01c71ba4f7ae849',8,'2014-12-11 11:56:18','2014-12-11 11:56:18',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','10','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(17,'http://eol.org/schema/resources/2/measurements/d257a4f7f7e26c4a1e2e9505051a6ac7',8,'2014-12-11 11:56:18','2014-12-11 11:56:18',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','20','http://purl.obolibrary.org/obo/UO_0000009',2,NULL,NULL,NULL,4),(18,'http://eol.org/schema/resources/1/measurements/bf053c93887ebf9fbf3274d5e6c4daa4',8,'2014-12-11 11:56:55','2014-12-11 11:56:55',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','15','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(19,'http://eol.org/schema/resources/2/measurements/78346cd42e68de5e6073c1080b197532',8,'2014-12-11 11:56:55','2014-12-11 11:56:55',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','25','http://purl.obolibrary.org/obo/UO_0000009',2,NULL,NULL,NULL,4),(20,'http://eol.org/schema/resources/1/measurements/8b8d15f8fb6ae93dbbc52b374011b6fa',8,'2014-12-11 12:24:30','2014-12-11 12:24:30',1,2,'MeasurementOrFact','http://purl.org/dc/terms/source','http://eol.org/schema/terms/male','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,17,15,4),(21,'http://eol.org/schema/resources/1/measurements/991d89b9d88eaac8597d114f3962bf15',8,'2014-12-11 12:24:31','2014-12-11 12:24:31',1,2,'MeasurementOrFact','http://purl.org/dc/terms/source','http://eol.org/schema/terms/female','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,17,16,4),(22,'http://eol.org/schema/resources/1/measurements/e1cc4f42c6be5aa18eef055f24be136e',15,'2014-12-11 12:51:01','2014-12-11 12:51:01',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','15','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(23,'http://eol.org/schema/resources/1/measurements/b4903c09195d8304f7a9af79a999aa74',15,'2014-12-11 12:51:01','2014-12-11 12:51:01',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','25','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(24,'http://eol.org/schema/resources/1/measurements/91bff26dbacc83d66074c42b51242404',16,'2014-12-11 13:32:14','2014-12-11 13:32:14',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','15','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(25,'http://eol.org/schema/resources/1/measurements/e9acaa12cffe2d6bbdaf7ae52571df04',16,'2014-12-11 13:32:14','2014-12-11 13:32:14',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','25','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(26,'http://eol.org/schema/resources/1/measurements/6b0542bb23dade601e798d99f43f0735',16,'2014-12-11 13:53:50','2014-12-11 13:53:50',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','15','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(27,'http://eol.org/schema/resources/1/measurements/2e2fcfe0c364e99493fbf69fdceb0a74',16,'2014-12-11 13:53:50','2014-12-11 13:53:50',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','25','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(28,'http://eol.org/schema/resources/1/measurements/8656ebbd45a9ca0ca39a2b1b9471b3a3',16,'2014-12-11 13:55:45','2014-12-11 13:55:45',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','35','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(29,'http://eol.org/schema/resources/1/measurements/c790171c2e9b1c033256972b62f8d7d5',16,'2014-12-11 13:55:45','2014-12-11 13:55:45',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','45','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(30,'http://eol.org/schema/resources/1/measurements/0e59cf7fba5a06007d1caf883671866b',8,'2014-12-11 14:06:35','2014-12-11 14:06:35',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','15','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(31,'http://eol.org/schema/resources/1/measurements/ffda0edcb8d19decb312761f5b0321b2',8,'2014-12-11 14:06:35','2014-12-11 14:06:35',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','25','http://purl.obolibrary.org/obo/UO_0000009',1,NULL,NULL,NULL,4),(32,'http://eol.org/schema/resources/5/measurements/fdaa622692daa9c2a2651c11d8e2b4e7',11,'2014-12-11 14:15:54','2014-12-11 14:15:54',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','5','http://purl.obolibrary.org/obo/UO_0000009',5,NULL,NULL,NULL,4),(33,'http://eol.org/schema/resources/5/measurements/8424031a4c9ec803cb7ff8f302a631f7',11,'2014-12-11 14:15:54','2014-12-11 14:15:54',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','50','http://purl.obolibrary.org/obo/UO_0000009',5,NULL,NULL,NULL,4),(34,'http://eol.org/schema/resources/4/measurements/cf9e7e0d8af35b16063db65dc1bba607',11,'2014-12-11 14:17:06','2014-12-11 14:17:06',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','1000','http://purl.obolibrary.org/obo/UO_0000021',4,NULL,NULL,NULL,3),(35,'http://eol.org/schema/resources/4/measurements/ee78ed8dfdbf6b3cb64e90bf41ee67d9',11,'2014-12-11 14:17:06','2014-12-11 14:17:06',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','10000','http://purl.obolibrary.org/obo/UO_0000021',4,NULL,NULL,NULL,3),(36,'http://eol.org/schema/resources/5/measurements/a56b263f993f58c9cd2d5b026ee40736',11,'2014-12-14 06:14:11','2014-12-14 06:14:11',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','1000',NULL,5,NULL,NULL,NULL,NULL),(37,'http://eol.org/schema/resources/5/measurements/a645d6385e5ed44685de5e03fbba18e3',11,'2014-12-14 06:14:11','2014-12-14 06:14:11',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','10',NULL,5,NULL,NULL,NULL,NULL),(38,'http://eol.org/schema/resources/5/measurements/a5552636dfb814ee48eaa6132d823b53',11,'2014-12-14 08:08:25','2014-12-14 08:08:25',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Human','10',NULL,5,NULL,NULL,NULL,NULL),(39,'http://eol.org/schema/resources/5/measurements/0a94639a7cb677c625148f95c32fbca9',11,'2014-12-14 08:08:25','2014-12-14 08:08:25',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Human','1000',NULL,5,NULL,NULL,NULL,NULL),(40,'http://eol.org/schema/resources/5/measurements/195acc45ecc3f3a115fa75b0c791a3de',11,'2014-12-14 08:10:12','2014-12-14 08:10:12',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Monkey','10',NULL,5,NULL,NULL,NULL,NULL),(41,'http://eol.org/schema/resources/5/measurements/028fc4a507b1b60810bc8bdd2af48a05',11,'2014-12-14 08:10:12','2014-12-14 08:10:12',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Monkey','100',NULL,5,NULL,NULL,NULL,NULL),(42,'http://eol.org/schema/resources/5/measurements/bbea4982afcb5cba7b95935c638e025f',11,'2014-12-15 08:14:13','2014-12-15 08:14:13',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Monkey','10',NULL,5,NULL,NULL,NULL,NULL),(43,'http://eol.org/schema/resources/5/measurements/de9d64e3f7bb713a33bb2a9736e7ff43',11,'2014-12-15 08:14:13','2014-12-15 08:14:13',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Monkey','100',NULL,5,NULL,NULL,NULL,NULL),(44,'http://eol.org/schema/resources/5/measurements/156f69e48d0e52f3c18da8ea638e2ba2',11,'2014-12-15 08:21:37','2014-12-15 08:21:37',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','100','http://purl.obolibrary.org/obo/UO_0000009',5,NULL,NULL,NULL,4),(45,'http://eol.org/schema/resources/5/measurements/b81bd58a1873f69ad20065670a7ff854',11,'2014-12-15 08:21:37','2014-12-15 08:21:37',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','10','http://purl.obolibrary.org/obo/UO_0000009',5,NULL,NULL,NULL,4),(46,'http://eol.org/schema/resources/5/measurements/d8c30448927420afb24c5bae87345d92',11,'2014-12-15 08:28:46','2014-12-15 08:28:46',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','1',NULL,5,NULL,NULL,NULL,NULL),(47,'http://eol.org/schema/resources/5/measurements/a907d3fe275f580678d5ee538c9e067a',11,'2014-12-15 08:28:46','2014-12-15 08:28:46',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','8',NULL,5,NULL,NULL,NULL,NULL),(48,'http://eol.org/schema/resources/5/measurements/bd7e67f1bdd6e9470beef7479d1c2835',11,'2014-12-15 08:30:05','2014-12-15 08:30:05',1,2,'MeasurementOrFact','http://en.wikipedia.org/wiki/Mass','8',NULL,5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `data_point_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_search_file_equivalents`
--

DROP TABLE IF EXISTS `data_search_file_equivalents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_search_file_equivalents` (
  `data_search_file_id` int(11) NOT NULL,
  `uri_id` int(11) NOT NULL,
  `is_attribute` tinyint(1) NOT NULL,
  UNIQUE KEY `data_search_file_and_uri` (`data_search_file_id`,`uri_id`),
  KEY `index_data_search_file_equivalents_on_data_search_file_id` (`data_search_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_search_file_equivalents`
--

LOCK TABLES `data_search_file_equivalents` WRITE;
/*!40000 ALTER TABLE `data_search_file_equivalents` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_search_file_equivalents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_search_files`
--

DROP TABLE IF EXISTS `data_search_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_search_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q` varchar(512) DEFAULT NULL,
  `uri` varchar(512) NOT NULL,
  `from` float DEFAULT NULL,
  `to` float DEFAULT NULL,
  `sort` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `known_uri_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hosted_file_url` varchar(255) DEFAULT NULL,
  `row_count` int(10) unsigned DEFAULT NULL,
  `unit_uri` varchar(255) DEFAULT NULL,
  `taxon_concept_id` int(10) unsigned DEFAULT NULL,
  `file_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_search_files_on_user_id` (`user_id`),
  KEY `index_data_search_files_on_known_uri_id` (`known_uri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_search_files`
--

LOCK TABLES `data_search_files` WRITE;
/*!40000 ALTER TABLE `data_search_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_search_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'http://purl.org/dc/dcmitype/Text'),(2,'http://purl.org/dc/dcmitype/StillImage'),(3,'http://purl.org/dc/dcmitype/Sound'),(4,'http://purl.org/dc/dcmitype/MovingImage'),(5,'GBIF Image'),(6,'YouTube'),(7,'Flash'),(8,'IUCN'),(9,'Map'),(10,'Link');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eol_statistics`
--

DROP TABLE IF EXISTS `eol_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eol_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `members_count` mediumint(9) DEFAULT NULL,
  `communities_count` mediumint(9) DEFAULT NULL,
  `collections_count` mediumint(9) DEFAULT NULL,
  `pages_count` int(11) DEFAULT NULL,
  `pages_with_content` int(11) DEFAULT NULL,
  `pages_with_text` int(11) DEFAULT NULL,
  `pages_with_image` int(11) DEFAULT NULL,
  `pages_with_map` mediumint(9) DEFAULT NULL,
  `pages_with_video` mediumint(9) DEFAULT NULL,
  `pages_with_sound` mediumint(9) DEFAULT NULL,
  `pages_without_text` mediumint(9) DEFAULT NULL,
  `pages_without_image` mediumint(9) DEFAULT NULL,
  `pages_with_image_no_text` mediumint(9) DEFAULT NULL,
  `pages_with_text_no_image` mediumint(9) DEFAULT NULL,
  `base_pages` int(11) DEFAULT NULL,
  `pages_with_at_least_a_trusted_object` int(11) DEFAULT NULL,
  `pages_with_at_least_a_curatorial_action` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links_no_text` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links_only` mediumint(9) DEFAULT NULL,
  `content_partners` mediumint(9) DEFAULT NULL,
  `content_partners_with_published_resources` mediumint(9) DEFAULT NULL,
  `content_partners_with_published_trusted_resources` mediumint(9) DEFAULT NULL,
  `published_resources` mediumint(9) DEFAULT NULL,
  `published_trusted_resources` mediumint(9) DEFAULT NULL,
  `published_unreviewed_resources` mediumint(9) DEFAULT NULL,
  `newly_published_resources_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `data_objects` int(11) DEFAULT NULL,
  `data_objects_texts` int(11) DEFAULT NULL,
  `data_objects_images` int(11) DEFAULT NULL,
  `data_objects_videos` mediumint(9) DEFAULT NULL,
  `data_objects_sounds` mediumint(9) DEFAULT NULL,
  `data_objects_maps` mediumint(9) DEFAULT NULL,
  `data_objects_trusted` int(11) DEFAULT NULL,
  `data_objects_unreviewed` int(11) DEFAULT NULL,
  `data_objects_untrusted` mediumint(9) DEFAULT NULL,
  `data_objects_trusted_or_unreviewed_but_hidden` mediumint(9) DEFAULT NULL,
  `udo_published` mediumint(9) DEFAULT NULL,
  `udo_published_by_curators` mediumint(9) DEFAULT NULL,
  `udo_published_by_non_curators` mediumint(9) DEFAULT NULL,
  `rich_pages` mediumint(9) DEFAULT NULL,
  `hotlist_pages` mediumint(9) DEFAULT NULL,
  `rich_hotlist_pages` mediumint(9) DEFAULT NULL,
  `redhotlist_pages` mediumint(9) DEFAULT NULL,
  `rich_redhotlist_pages` mediumint(9) DEFAULT NULL,
  `pages_with_score_10_to_39` mediumint(9) DEFAULT NULL,
  `pages_with_score_less_than_10` mediumint(9) DEFAULT NULL,
  `curators` mediumint(9) DEFAULT NULL,
  `curators_assistant` mediumint(9) DEFAULT NULL,
  `curators_full` mediumint(9) DEFAULT NULL,
  `curators_master` mediumint(9) DEFAULT NULL,
  `active_curators` mediumint(9) DEFAULT NULL,
  `pages_curated_by_active_curators` mediumint(9) DEFAULT NULL,
  `objects_curated_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `curator_actions_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `lifedesk_taxa` mediumint(9) DEFAULT NULL,
  `lifedesk_data_objects` mediumint(9) DEFAULT NULL,
  `marine_pages` mediumint(9) DEFAULT NULL,
  `marine_pages_in_col` mediumint(9) DEFAULT NULL,
  `marine_pages_with_objects` mediumint(9) DEFAULT NULL,
  `marine_pages_with_objects_vetted` mediumint(9) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '2014-12-08 12:18:35',
  `total_triples` int(10) unsigned DEFAULT NULL,
  `total_occurrences` int(10) unsigned DEFAULT NULL,
  `total_measurements` int(10) unsigned DEFAULT NULL,
  `total_associations` int(10) unsigned DEFAULT NULL,
  `total_measurement_types` int(10) unsigned DEFAULT NULL,
  `total_association_types` int(10) unsigned DEFAULT NULL,
  `total_taxa_with_data` int(10) unsigned DEFAULT NULL,
  `total_user_added_data` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eol_statistics`
--

LOCK TABLES `eol_statistics` WRITE;
/*!40000 ALTER TABLE `eol_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `eol_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exception_name` varchar(250) DEFAULT NULL,
  `backtrace` text,
  `url` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_error_logs_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_data_objects`
--

DROP TABLE IF EXISTS `feed_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_data_objects` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_data_objects`
--

LOCK TABLES `feed_data_objects` WRITE;
/*!40000 ALTER TABLE `feed_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item_types`
--

DROP TABLE IF EXISTS `feed_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item_types`
--

LOCK TABLES `feed_item_types` WRITE;
/*!40000 ALTER TABLE `feed_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_items`
--

DROP TABLE IF EXISTS `feed_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `feed_type` varchar(255) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `feed_item_type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_items`
--

LOCK TABLES `feed_items` WRITE;
/*!40000 ALTER TABLE `feed_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_categories`
--

DROP TABLE IF EXISTS `forum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `view_order` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_categories`
--

LOCK TABLES `forum_categories` WRITE;
/*!40000 ALTER TABLE `forum_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_topic_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_to_post_id` int(11) DEFAULT NULL,
  `edit_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topics`
--

DROP TABLE IF EXISTS `forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `number_of_posts` int(11) NOT NULL DEFAULT '0',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `first_post_id` int(11) DEFAULT NULL,
  `last_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topics`
--

LOCK TABLES `forum_topics` WRITE;
/*!40000 ALTER TABLE `forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `view_order` int(11) NOT NULL DEFAULT '0',
  `number_of_posts` int(11) NOT NULL DEFAULT '0',
  `number_of_topics` int(11) NOT NULL DEFAULT '0',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `last_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gbif_identifiers_with_maps`
--

DROP TABLE IF EXISTS `gbif_identifiers_with_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbif_identifiers_with_maps` (
  `gbif_taxon_id` int(11) NOT NULL,
  PRIMARY KEY (`gbif_taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbif_identifiers_with_maps`
--

LOCK TABLES `gbif_identifiers_with_maps` WRITE;
/*!40000 ALTER TABLE `gbif_identifiers_with_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `gbif_identifiers_with_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_terms`
--

DROP TABLE IF EXISTS `glossary_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) DEFAULT NULL,
  `definition` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_terms`
--

LOCK TABLES `glossary_terms` WRITE;
/*!40000 ALTER TABLE `glossary_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_page_stats`
--

DROP TABLE IF EXISTS `google_analytics_page_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_page_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `page_views` int(10) unsigned NOT NULL,
  `unique_page_views` int(10) unsigned NOT NULL,
  `time_on_page` time NOT NULL,
  KEY `month_year` (`month`,`year`),
  KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_page_stats`
--

LOCK TABLES `google_analytics_page_stats` WRITE;
/*!40000 ALTER TABLE `google_analytics_page_stats` DISABLE KEYS */;
INSERT INTO `google_analytics_page_stats` VALUES (16,2015,12,996,8,'00:00:04'),(16,2015,11,611,51,'00:39:01'),(16,2015,10,543,10,'00:58:03'),(16,2015,9,8,81,'00:59:24'),(16,2015,8,546,94,'00:19:44'),(16,2015,7,177,94,'00:38:16'),(16,2015,6,596,23,'00:37:46'),(16,2015,5,714,69,'00:33:31'),(16,2015,4,934,10,'00:46:38'),(16,2015,3,826,16,'00:02:39'),(16,2015,2,259,16,'00:47:03'),(16,2015,1,133,98,'00:38:32'),(16,2014,12,794,7,'00:44:35'),(16,2014,11,576,89,'00:02:17'),(16,2014,10,493,87,'00:44:27'),(16,2014,9,779,37,'00:51:13'),(16,2014,8,231,23,'00:13:08'),(16,2014,7,352,31,'00:44:04'),(16,2014,6,248,83,'00:50:44'),(16,2014,5,459,29,'00:01:27'),(16,2014,4,571,39,'00:44:46'),(16,2014,3,804,6,'00:05:12'),(16,2014,2,468,57,'00:07:37'),(16,2014,1,47,99,'00:49:56'),(16,2013,12,401,14,'00:36:28');
/*!40000 ALTER TABLE `google_analytics_page_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_summaries`
--

DROP TABLE IF EXISTS `google_analytics_partner_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_summaries` (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `unique_page_views` int(11) DEFAULT NULL,
  `page_views` int(11) DEFAULT NULL,
  `time_on_page` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_summaries`
--

LOCK TABLES `google_analytics_partner_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_summaries` VALUES (2013,12,2,280,93,150,1836,451.00),(2014,1,2,730,68,611,9018,740.00),(2014,2,2,136,51,920,7871,373.00),(2014,3,2,225,21,78,9688,830.00),(2014,4,2,953,75,453,6467,757.00),(2014,5,2,452,89,229,4555,144.00),(2014,6,2,281,10,513,5532,983.00),(2014,7,2,589,17,678,6575,52.00),(2014,8,2,13,41,353,5830,541.00),(2014,9,2,473,26,310,8737,550.00),(2014,10,2,438,24,730,3293,598.00),(2014,11,2,730,76,483,8025,752.00),(2014,12,2,620,12,980,946,528.00),(2015,1,2,502,50,652,7765,338.00),(2015,2,2,335,92,882,5307,317.00),(2015,3,2,494,80,183,8664,211.00),(2015,4,2,118,59,641,2378,235.00),(2015,5,2,752,95,947,7465,110.00),(2015,6,2,372,55,71,2970,755.00),(2015,7,2,717,87,237,259,501.00),(2015,8,2,410,70,674,8895,760.00),(2015,9,2,587,13,234,5978,360.00),(2015,10,2,593,33,446,1459,400.00),(2015,11,2,282,39,879,5022,547.00),(2015,12,2,423,2,159,3140,669.00);
/*!40000 ALTER TABLE `google_analytics_partner_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_taxa`
--

DROP TABLE IF EXISTS `google_analytics_partner_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_taxa` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  KEY `concept_user_month_year` (`taxon_concept_id`,`user_id`,`month`,`year`),
  KEY `user_month` (`user_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_taxa`
--

LOCK TABLES `google_analytics_partner_taxa` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_taxa` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_taxa` VALUES (16,2,2014,1),(16,2,2015,1),(16,2,2014,2),(16,2,2015,2),(16,2,2014,3),(16,2,2015,3),(16,2,2014,4),(16,2,2015,4),(16,2,2014,5),(16,2,2015,5),(16,2,2014,6),(16,2,2015,6),(16,2,2014,7),(16,2,2015,7),(16,2,2014,8),(16,2,2015,8),(16,2,2014,9),(16,2,2015,9),(16,2,2014,10),(16,2,2015,10),(16,2,2014,11),(16,2,2015,11),(16,2,2013,12),(16,2,2014,12),(16,2,2015,12);
/*!40000 ALTER TABLE `google_analytics_partner_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_summaries`
--

DROP TABLE IF EXISTS `google_analytics_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_summaries` (
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `visitors` int(11) DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `unique_pageviews` int(11) DEFAULT NULL,
  `ave_pages_per_visit` float DEFAULT NULL,
  `ave_time_on_site` time DEFAULT NULL,
  `ave_time_on_page` time DEFAULT NULL,
  `per_new_visits` float DEFAULT NULL,
  `bounce_rate` float DEFAULT NULL,
  `per_exit` float DEFAULT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `time_on_pages` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_summaries`
--

LOCK TABLES `google_analytics_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_summaries` VALUES (2013,12,959,86,3871,762,2.9,'00:03:37','00:40:39',4.4,2.5,7.6,718,61,921),(2014,1,836,44,813,698,5.8,'00:12:42','00:52:07',4.4,9.9,8.9,187,76,140),(2014,2,158,92,2187,674,0.8,'00:38:22','00:08:02',4,7,0.3,209,45,798),(2014,3,794,83,2523,922,1.6,'00:01:04','00:47:35',8.5,2.4,7.2,779,74,772),(2014,4,564,42,2542,406,8.4,'00:59:29','00:11:22',1.1,1.2,4,138,41,913),(2014,5,272,52,1444,123,3,'00:49:59','00:52:35',9.2,6.4,6.9,48,27,422),(2014,6,203,22,5016,596,7,'00:40:25','00:25:16',6,5.5,3.2,269,67,213),(2014,7,795,29,2270,856,5.4,'00:06:02','00:51:30',5.7,1.6,5.7,541,26,296),(2014,8,679,94,399,738,4.2,'00:23:47','00:38:37',3.3,7.5,7.6,496,34,17),(2014,9,800,43,2445,8,7.6,'00:56:14','00:22:40',7,2.4,5.9,909,84,152),(2014,10,839,56,1183,759,5.7,'00:23:22','00:44:12',0.1,9.9,2.9,441,6,942),(2014,11,497,40,3945,463,4.7,'00:12:05','00:39:27',6.8,2.8,6.2,188,32,269),(2014,12,715,27,9780,483,6.3,'00:34:56','00:10:00',0.9,6.3,4.3,805,18,492),(2015,1,542,83,897,445,9.3,'00:21:14','00:58:03',7.8,9.4,6.9,176,89,505),(2015,2,560,66,7464,100,8.5,'00:45:50','00:17:50',8.1,9.8,8.2,309,89,980),(2015,3,247,83,9481,697,5.4,'00:58:49','00:42:05',2.4,5.5,0.5,42,78,895),(2015,4,284,13,8523,806,1.1,'00:07:24','00:20:24',7.3,1.6,1,305,82,330),(2015,5,477,72,3882,746,3.5,'00:15:52','00:10:26',8.6,3.4,0.4,713,52,936),(2015,6,214,18,1455,855,1.5,'00:33:31','00:06:06',7.5,7.2,1.8,512,3,274),(2015,7,684,20,4978,948,3.6,'00:14:16','00:45:13',7.9,3.3,6.5,491,43,915),(2015,8,995,26,7707,150,2.1,'00:30:15','00:50:43',5.4,8.9,9.3,903,9,506),(2015,9,801,54,2869,285,8.5,'00:36:24','00:50:12',8.2,2.8,0.5,664,6,943),(2015,10,298,43,310,272,8.1,'00:00:10','00:19:48',6.4,1.9,6.8,500,82,25),(2015,11,233,40,5824,272,8.7,'00:48:19','00:21:51',9.5,5.1,8.2,600,39,827),(2015,12,264,45,380,281,2.6,'00:23:03','00:39:21',3.5,5.2,8.8,803,83,506);
/*!40000 ALTER TABLE `google_analytics_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events`
--

DROP TABLE IF EXISTS `harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(10) unsigned NOT NULL,
  `began_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events`
--

LOCK TABLES `harvest_events` WRITE;
/*!40000 ALTER TABLE `harvest_events` DISABLE KEYS */;
INSERT INTO `harvest_events` VALUES (1,2,'2014-12-08 05:18:56','2014-12-08 06:18:56','2014-12-08 07:18:56',0),(2,3,'2014-12-08 05:19:07','2014-12-08 06:19:07','2014-12-08 07:19:07',0),(3,3,'2014-12-08 05:19:31','2014-12-08 06:19:31','2014-12-08 07:19:31',0),(4,3,'2014-12-08 05:19:31','2014-12-08 06:19:31','2014-12-08 07:19:31',0),(5,4,'2014-12-08 05:19:32','2014-12-08 06:19:32','2014-12-08 07:19:32',0),(6,5,'2014-12-08 05:19:36','2014-12-08 06:19:36','2014-12-08 07:19:36',0);
/*!40000 ALTER TABLE `harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events_hierarchy_entries`
--

DROP TABLE IF EXISTS `harvest_events_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events_hierarchy_entries` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`hierarchy_entry_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events_hierarchy_entries`
--

LOCK TABLES `harvest_events_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `harvest_events_hierarchy_entries` VALUES (2,2,'',4),(2,3,'',5),(2,4,'',6),(2,5,'',7),(2,6,'',8),(2,7,'',9),(2,8,'',10),(2,9,'',11),(2,10,'',12),(2,11,'',13),(2,12,'',14),(2,17,'',16),(2,24,'',17),(2,26,'',18),(2,27,'',19),(2,28,'',20),(2,29,'',21),(2,30,'',22),(2,31,'',23),(2,32,'',24),(2,33,'',25),(2,34,'',26),(2,35,'',27),(2,36,'',28),(2,37,'',29),(2,38,'',30),(5,13,'',15);
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_process_logs`
--

DROP TABLE IF EXISTS `harvest_process_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_process_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(255) DEFAULT NULL,
  `began_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_process_logs`
--

LOCK TABLES `harvest_process_logs` WRITE;
/*!40000 ALTER TABLE `harvest_process_logs` DISABLE KEYS */;
INSERT INTO `harvest_process_logs` VALUES (1,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(2,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(3,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(4,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(5,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(6,'Update Downloadable Resources','2015-07-15 19:22:30','2015-07-15 19:22:30'),(7,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(8,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(9,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(10,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(11,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(12,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(13,'Update Downloadable Resources','2015-07-15 19:22:31','2015-07-15 19:22:31'),(14,'Update Downloadable Resources','2015-07-15 19:22:32','2015-07-15 19:22:32'),(15,'Update Downloadable Resources','2015-07-15 19:22:32','2015-07-15 19:22:32'),(16,'Update Downloadable Resources','2015-07-15 19:22:32','2015-07-15 19:22:32'),(17,'Update Connector Resources','2015-07-15 19:22:32','2015-07-15 19:22:32'),(18,'Update Connector Resources','2015-07-15 19:22:32','2015-07-15 19:22:33'),(19,'Update Connector Resources','2015-07-15 19:22:33','2015-07-15 19:22:33'),(20,'Update Connector Resources','2015-07-15 19:22:33','2015-07-15 19:22:33'),(21,'Update Connector Resources','2015-07-15 19:22:33','2015-07-15 19:22:33'),(22,'Update Connector Resources','2015-07-15 19:22:34','2015-07-15 19:22:34'),(23,'Update Connector Resources','2015-07-15 19:22:34','2015-07-15 19:22:34'),(24,'Update Connector Resources','2015-07-15 19:22:34','2015-07-15 19:22:34'),(25,'Update Connector Resources','2015-07-15 19:22:34','2015-07-15 19:22:35'),(26,'Update Connector Resources','2015-07-15 19:22:35','2015-07-15 19:22:35'),(27,'Update Connector Resources','2015-07-15 19:22:35','2015-07-15 19:22:35'),(28,'Update Connector Resources','2015-07-15 19:22:35','2015-07-15 19:22:35'),(29,'Update Connector Resources','2015-07-15 19:22:36','2015-07-15 19:22:36'),(30,'Update Connector Resources','2015-07-15 19:22:36','2015-07-15 19:22:36'),(31,'Update Connector Resources','2015-07-15 19:22:36','2015-07-15 19:22:36'),(32,'Update Connector Resources','2015-07-15 19:22:36','2015-07-15 19:22:37');
/*!40000 ALTER TABLE `harvest_process_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies`
--

DROP TABLE IF EXISTS `hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL COMMENT 'recommended; our internal id of the source agent responsible for the entire hierarchy',
  `label` varchar(255) NOT NULL COMMENT 'recommended; succinct title for the hierarchy (e.g. Catalogue of Life: Annual Checklist 2009)',
  `descriptive_label` varchar(255) DEFAULT NULL,
  `description` text NOT NULL COMMENT 'not required; a more verbose description describing the hierarchy. Could be a paragraph describing what it is and what it contains',
  `indexed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'required; the date which we created and indexed the hierarchy',
  `hierarchy_group_id` int(10) unsigned NOT NULL COMMENT 'not required; there is no hierarchy_groups table, but this field was meant to identify hierarchies of the same source so they can be verioned and older versions retained but not presented',
  `hierarchy_group_version` tinyint(3) unsigned NOT NULL COMMENT 'not required; this is mean to uniquely identify hierarchies within the same group. This version number has been an internal incrementing value',
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; a link back to a web page describing this hierarchy',
  `outlink_uri` varchar(255) DEFAULT NULL,
  `ping_host_url` varchar(255) DEFAULT NULL,
  `browsable` int(11) DEFAULT NULL,
  `complete` tinyint(3) unsigned DEFAULT '1',
  `request_publish` tinyint(1) DEFAULT '0',
  `hierarchy_entries_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='A container for hierarchy_entries. These are usually taxonomic hierarchies, but can be general collections of assertions about taxa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies`
--

LOCK TABLES `hierarchies` WRITE;
/*!40000 ALTER TABLE `hierarchies` DISABLE KEYS */;
INSERT INTO `hierarchies` VALUES (1,4,'LigerCat',NULL,'LigerCat Biomedical Terms Tag Cloud','2014-12-08 05:18:52',0,0,'http://ligercat.ubio.org','http://ligercat.ubio.org/eol/%%ID%%.cloud',NULL,0,1,0,0),(2,5,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-12-08 05:18:53',0,0,'',NULL,NULL,0,1,0,0),(3,2,'Species 2000 & ITIS Catalogue of Life: May 2012',NULL,'','2014-12-08 05:18:54',0,0,'',NULL,NULL,1,1,0,0),(4,2,'Species 2000 & ITIS Catalogue of Life: Annual Checklist 2007',NULL,'','2014-12-08 05:18:54',0,0,'',NULL,NULL,0,1,0,0),(5,6,'Encyclopedia of Life Contributors',NULL,'','2014-12-08 05:18:54',0,0,'',NULL,NULL,0,1,0,0),(6,3,'NCBI Taxonomy',NULL,'','2014-12-08 05:18:54',101,2,'',NULL,NULL,1,1,0,0),(7,7,'GBIF Nub Taxonomy',NULL,'','2014-12-08 05:18:54',0,0,'',NULL,NULL,0,1,0,0),(8,8,'IUCN',NULL,'','2014-12-08 05:18:55',0,0,'',NULL,NULL,0,1,0,0),(9,10,'GBIF Nub Taxonomy',NULL,'','2014-12-08 05:19:07',0,0,'',NULL,NULL,0,1,0,0),(10,38,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-12-08 05:19:32',0,0,'',NULL,NULL,0,1,0,0),(11,43,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-12-08 05:19:36',0,0,'',NULL,NULL,0,1,0,0),(12,42,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-12-08 05:19:36',0,0,'',NULL,NULL,0,1,0,0),(13,44,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-12-08 05:19:36',0,0,'',NULL,NULL,0,1,0,0),(14,51,'AntWeb',NULL,'Currently AntWeb contains information on the ant faunas of several areas in the Nearctic and Malagasy biogeographic regions, and global coverage of all ant genera.','2014-12-08 05:19:40',0,0,'http://www.antweb.org/','http://www.antweb.org/specimen.do?name=%%ID%%',NULL,0,1,0,0),(15,52,'National Center for Biotechnology Information',NULL,'Established in 1988 as a national resource for molecular biology information, NCBI creates public databases, conducts research in computational biology, develops software tools for analyzing genome data, and disseminates biomedical information - all for the better understanding of molecular processes affecting human health and disease','2014-12-08 05:19:40',0,0,'http://www.ncbi.nlm.nih.gov/','http://www.ncbi.nlm.nih.gov/sites/entrez?Db=genomeprj&cmd=ShowDetailView&TermToSearch=%%ID%%',NULL,0,1,0,0);
/*!40000 ALTER TABLE `hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies_content`
--

DROP TABLE IF EXISTS `hierarchies_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies_content` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summarizes the data types available to a given hierarchy entry. Also lists its content level and the data_object_id of the first displayed image.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies_content`
--

LOCK TABLES `hierarchies_content` WRITE;
/*!40000 ALTER TABLE `hierarchies_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchies_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries`
--

DROP TABLE IF EXISTS `hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `identifier` varchar(255) NOT NULL COMMENT 'recommended; a unique id from the provider for this node',
  `source_url` text,
  `name_id` int(10) unsigned NOT NULL COMMENT 'recommended; the name string for this node. It is possible that nodes have no names, but most of the time they will',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'recommended; the parent_id references the hierarchy_entry_id of the parent of this node. Used to create trees. Root nodes will have a partent_id of 0',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'required; the id of the container hierarchy',
  `rank_id` smallint(5) unsigned NOT NULL COMMENT 'recommended; when available, this is the id of the rank string which defines the taxonomic rank of the node',
  `ancestry` varchar(500) CHARACTER SET ascii NOT NULL COMMENT 'not required; perhaps now obsolete. Used to store the materialized path of this node''s ancestors',
  `lft` int(10) unsigned NOT NULL COMMENT 'required; the left value of this node within the hierarchy''s nested set',
  `rgt` int(10) unsigned NOT NULL COMMENT 'required; the right value of this node within the hierarchy''s nested set',
  `depth` tinyint(3) unsigned NOT NULL COMMENT 'recommended; the depth of this node in within the hierarchy''s tree',
  `taxon_concept_id` int(10) unsigned NOT NULL COMMENT 'required; the id of the taxon_concept described by this hierarchy_entry',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxon_remarks` text,
  PRIMARY KEY (`id`),
  KEY `name_id` (`name_id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`),
  KEY `taxon_concept_id` (`taxon_concept_id`),
  KEY `vetted_id` (`vetted_id`),
  KEY `visibility_id` (`visibility_id`),
  KEY `published` (`published`),
  KEY `identifier` (`identifier`),
  KEY `hierarchy_parent` (`hierarchy_id`,`parent_id`),
  KEY `concept_published_visible` (`taxon_concept_id`,`published`,`visibility_id`),
  KEY `index_hierarchy_entries_on_hierarchy_id_and_taxon_concept_id` (`hierarchy_id`,`taxon_concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries`
--

LOCK TABLES `hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries` DISABLE KEYS */;
INSERT INTO `hierarchy_entries` VALUES (1,'419bfba4e7384bbcb57bbe0092ea6b9e','','',1,0,3,184,'',1,2,2,1,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(2,'f8dc27a3852240c9b920ac8fe934af33','','',2,0,3,1,'',3,24,0,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(3,'03d6c7c9339a4f8798b010e85b54cbc9','','',4,2,3,0,'',4,23,2,8,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(4,'692ce6a4db4140728be68526b75d6fa1','','',6,3,3,0,'',5,22,3,9,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(5,'73573a70ec8744779e5167f79c7cecaa','','',8,4,3,0,'',6,21,4,10,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(6,'e072d788b84e48e8b73b3c5fcc1d3566','','',10,0,3,0,'',7,20,5,11,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(7,'02bc67325c8044c78b48c2efd114b4e0','','',12,6,3,0,'',8,9,6,12,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(8,'fa5c1537740e41949b2c4aae06f1e179','','',14,6,3,0,'',10,11,6,13,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(9,'ee8dfd7f5c9a45ab9f4a670b988b68e3','','',21,6,3,0,'',12,13,6,14,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(10,'e33eb262ec8d4793a89ea26ce9d549e4','','',22,6,3,0,'',14,15,6,15,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(11,'daa0fe0633ff46da89a2ef0aa1b5ce0e','','',23,6,3,0,'',16,17,6,16,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(12,'240819481f7a42e9b50293549ac162c7','','',25,6,3,0,'',18,19,6,17,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(13,'79a64a50406442df890bf1c458fbfc52','','',27,0,3,0,'',25,26,6,18,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(14,'4471cbed870448518230f3f1b21b1e56','','',28,0,12,0,'',1,2,0,18,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(15,'4481047e45fa4cdbb9700987f9707538','13810203','',28,0,9,0,'',1,2,0,18,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(16,'1a3956025d01422a8ac806f92d7d9cfd','','',29,0,13,184,'',1,2,2,19,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(17,'dc25a753c97d4fee97ae6ae600e814cd','','',30,0,3,0,'',27,28,6,20,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(18,'d2d530399b0b4281843343dd3c0bc87e','20','',30,0,2,184,'',1,2,2,20,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(19,'cd0cc5797ef0464a82db43668c927940','casent0129891','',2,0,14,184,'',1,2,2,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(20,'4590746a018b40d4a781cb75072a55a1','casent0496198','',2,0,14,184,'',3,4,2,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(21,'a65bf26103ac49b483c30cdf5b6d5005','casent0179524','',2,0,14,184,'',5,6,2,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(22,'8e0b5cc6cd804fcb8a23e74923cbced8','13646','',2,0,15,184,'',1,2,2,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:18:25',NULL),(23,'fa490c4c6937414491ae806fa47a5819','9551','',2,0,15,184,'',3,4,2,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(24,'a8c0b012a8fa4af28e2202695afca63e','','',34,0,6,20,'',1,20,0,21,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(25,'dfdb8aab8a9b4b8b9818e2b54754e68a','33154','',36,24,6,1,'',2,19,0,7,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(26,'43f8f620051d4a0e8303970e84e20c9b','','',38,25,6,0,'',3,4,1,22,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(27,'df1462d1c5bc4a37bbf75ad8380304c2','','',40,25,6,0,'',5,18,1,23,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(28,'8a5e5dbb8f8e47d684e730bb5fde37be','','',42,27,6,0,'',6,7,2,24,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(29,'21754c3d60c14b98aa5542bb68f4a74d','','',44,27,6,0,'',8,17,2,25,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(30,'caf75b6d757149d7b3b7623561ef3aa0','','',46,29,6,0,'',9,10,3,26,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(31,'c6f56e30cb834237bbcdbe2beffe224e','','',48,29,6,0,'',11,16,3,27,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(32,'f44f0073620f49df8f7d52d309cbbcf2','','',50,31,6,0,'',12,13,4,28,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(33,'8d3e87c144e447978ca460621f33d309','','',52,31,6,0,'',14,15,4,29,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(34,'b0909d007df2410bbcf82ae51b21fb75','','',54,0,6,20,'',21,30,0,30,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(35,'240b21b3ea57439cb86dbcf1619f7430','','',66,34,6,0,'',22,29,1,31,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(36,'54e87b10084f451d954d7f2157e05abd','','',68,35,6,0,'',23,28,2,32,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(37,'0524bbbea2eb4cc2ab32c20c78518e0c','','',70,36,6,0,'',24,27,3,33,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL),(38,'60338293a9a04528b4c8f697555f9717','','',72,37,6,0,'',25,26,4,34,1,1,2,'2014-12-08 10:18:25','2014-12-08 10:20:10',NULL);
/*!40000 ALTER TABLE `hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_flattened`
--

DROP TABLE IF EXISTS `hierarchy_entries_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_flattened` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_flattened`
--

LOCK TABLES `hierarchy_entries_flattened` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_flattened` DISABLE KEYS */;
INSERT INTO `hierarchy_entries_flattened` VALUES (3,2),(4,2),(4,3),(5,2),(5,3),(5,4),(6,2),(6,3),(6,4),(6,5),(7,2),(7,3),(7,4),(7,5),(7,6),(8,2),(8,3),(8,4),(8,5),(8,6),(9,2),(9,3),(9,4),(9,5),(9,6),(10,2),(10,3),(10,4),(10,5),(10,6),(11,2),(11,3),(11,4),(11,5),(11,6),(12,2),(12,3),(12,4),(12,5),(12,6),(25,24),(26,24),(26,25),(27,24),(27,25),(28,24),(28,25),(28,27),(29,24),(29,25),(29,27),(30,24),(30,25),(30,27),(30,29),(31,24),(31,25),(31,27),(31,29),(32,24),(32,25),(32,27),(32,29),(32,31),(33,24),(33,25),(33,27),(33,29),(33,31),(35,34),(36,34),(36,35),(37,34),(37,35),(37,36),(38,34),(38,35),(38,36),(38,37);
/*!40000 ALTER TABLE `hierarchy_entries_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_refs`
--

DROP TABLE IF EXISTS `hierarchy_entries_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_refs` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_refs`
--

LOCK TABLES `hierarchy_entries_refs` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entries_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_moves`
--

DROP TABLE IF EXISTS `hierarchy_entry_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_moves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hierarchy_entry_id` int(11) NOT NULL,
  `classification_curation_id` int(11) NOT NULL,
  `error` varchar(256) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_and_curation_index` (`hierarchy_entry_id`,`classification_curation_id`),
  KEY `index_hierarchy_entry_moves_on_hierarchy_entry_id` (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_moves`
--

LOCK TABLES `hierarchy_entry_moves` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_moves` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `score` double NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_relationships`
--

LOCK TABLES `hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_stats`
--

DROP TABLE IF EXISTS `hierarchy_entry_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_stats` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  `all_text_trusted` mediumint(8) unsigned NOT NULL,
  `all_text_untrusted` mediumint(8) unsigned NOT NULL,
  `have_text` mediumint(8) unsigned NOT NULL,
  `all_image_trusted` mediumint(8) unsigned NOT NULL,
  `all_image_untrusted` mediumint(8) unsigned NOT NULL,
  `have_images` mediumint(8) unsigned NOT NULL,
  `all_bhl` int(10) unsigned NOT NULL,
  `total_children` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_stats`
--

LOCK TABLES `hierarchy_entry_stats` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_reindexings`
--

DROP TABLE IF EXISTS `hierarchy_reindexings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_reindexings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hierarchy_id` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_reindexings`
--

LOCK TABLES `hierarchy_reindexings` WRITE;
/*!40000 ALTER TABLE `hierarchy_reindexings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_reindexings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_sizes`
--

DROP TABLE IF EXISTS `image_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `crop_x_pct` decimal(5,2) DEFAULT NULL,
  `crop_y_pct` decimal(5,2) DEFAULT NULL,
  `crop_width_pct` decimal(5,2) DEFAULT NULL,
  `crop_height_pct` decimal(5,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_sizes_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_sizes`
--

LOCK TABLES `image_sizes` WRITE;
/*!40000 ALTER TABLE `image_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_items`
--

DROP TABLE IF EXISTS `info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_items` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_items`
--

LOCK TABLES `info_items` WRITE;
/*!40000 ALTER TABLE `info_items` DISABLE KEYS */;
INSERT INTO `info_items` VALUES (1,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TaxonBiology',1),(2,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#GeneralDescription',5),(3,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Distribution',7),(4,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Habitat',7),(5,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Morphology',5),(6,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Conservation',5),(7,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Uses',5),(8,'http://www.eol.org/voc/table_of_contents#Education',25),(9,'http://www.eol.org/voc/table_of_contents#EducationResources',27),(10,'http://www.eol.org/voc/table_of_contents#IdentificationResources',5),(11,'http://www.eol.org/voc/table_of_contents#Wikipedia',9),(12,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#DiagnosticDescription',5),(13,'http://eol.org/schema/eol_info_items.xml#Taxonomy',5),(14,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Associations',0),(15,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Behaviour',0),(16,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#ConservationStatus',0),(17,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cyclicity',0),(18,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cytology',0),(19,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#DiagnosticDescription',0),(20,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Diseases',0),(21,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Dispersal',0),(22,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Evolution',0),(23,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Genetics',0),(24,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Growth',0),(25,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Legislation',0),(26,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeCycle',0),(27,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeExpectancy',0),(28,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LookAlikes',0),(29,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Management',0),(30,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Migration',0),(31,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#MolecularBiology',0),(32,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Physiology',0),(33,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#PopulationBiology',0),(34,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Procedures',0),(35,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Reproduction',0),(36,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#RiskStatement',0),(37,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Size',0),(38,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Threats',0),(39,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Trends',0),(40,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TrophicStrategy',0);
/*!40000 ALTER TABLE `info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_sponsors`
--

DROP TABLE IF EXISTS `institutional_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_sponsors`
--

LOCK TABLES `institutional_sponsors` WRITE;
/*!40000 ALTER TABLE `institutional_sponsors` DISABLE KEYS */;
INSERT INTO `institutional_sponsors` VALUES (1,'Atlas of Living Australia','http://eol.org/content/partner_logos/ala.jpg','http://www.ala.org.au/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52'),(2,'Bibliotheca Alexandrina','http://eol.org/content/partner_logos/bib_alex.jpg','http://www.bibalex.org/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52'),(3,'CONABIO','http://eol.org/content/partner_logos/conabio.jpg','http://www.conabio.gob.mx/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52'),(4,'Harvard University','http://eol.org/content/partner_logos/mcz.jpg','http://www.harvard.edu/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52'),(5,'Marine Biological Laboratory','http://eol.org/content/partner_logos/mbl.jpg','http://www.mbl.edu/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52'),(6,'Smithsonian Institution','http://eol.org/content/partner_logos/nmnh.jpg','http://www.si.edu/',1,'2015-05-21 13:42:52','2015-05-21 13:42:52');
/*!40000 ALTER TABLE `institutional_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pages`
--

DROP TABLE IF EXISTS `item_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_item_id` int(10) unsigned NOT NULL,
  `year` varchar(20) NOT NULL,
  `volume` varchar(20) NOT NULL,
  `issue` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  `page_type` varchar(20) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The publication items have many pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pages`
--

LOCK TABLES `item_pages` WRITE;
/*!40000 ALTER TABLE `item_pages` DISABLE KEYS */;
INSERT INTO `item_pages` VALUES (1,1,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(2,2,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(3,3,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(4,4,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(5,5,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(6,6,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(7,7,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(8,8,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(9,9,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(10,10,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(11,11,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(12,12,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(13,13,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(14,14,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(15,15,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(16,16,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(17,17,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(18,18,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(19,19,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(20,20,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(21,21,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(22,22,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(23,23,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(24,24,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(25,25,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(26,26,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(27,27,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(28,28,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(29,29,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(30,30,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(31,31,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(32,32,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(33,33,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(34,34,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(35,35,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(36,36,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(37,37,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(38,38,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(39,39,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(40,40,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(41,41,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(42,42,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(43,43,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(44,44,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(45,45,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(46,46,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(47,47,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(48,48,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(49,49,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(50,50,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(51,51,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(52,52,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(53,53,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(54,54,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(55,55,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(56,56,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(57,57,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(58,58,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(59,59,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(60,60,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(61,61,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(62,62,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(63,63,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(64,64,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(65,65,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(66,66,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(67,67,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(68,68,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(69,69,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting','');
/*!40000 ALTER TABLE `item_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uri_relationships`
--

DROP TABLE IF EXISTS `known_uri_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uri_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_known_uri_id` int(11) NOT NULL,
  `to_known_uri_id` int(11) NOT NULL,
  `relationship_uri` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_to_unique` (`from_known_uri_id`,`to_known_uri_id`,`relationship_uri`),
  KEY `to_known_uri_id` (`to_known_uri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uri_relationships`
--

LOCK TABLES `known_uri_relationships` WRITE;
/*!40000 ALTER TABLE `known_uri_relationships` DISABLE KEYS */;
INSERT INTO `known_uri_relationships` VALUES (1,1,2,'http://eol.org/schema/allowedValue','2014-12-08 12:19:00','2014-12-08 12:19:00'),(2,1,3,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(3,1,4,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(4,1,5,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(5,1,6,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(6,1,7,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(7,1,8,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(8,1,9,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(9,1,10,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(10,1,11,'http://eol.org/schema/allowedValue','2014-12-08 12:19:01','2014-12-08 12:19:01'),(11,1,12,'http://eol.org/schema/allowedValue','2014-12-08 12:19:02','2014-12-08 12:19:02'),(12,1,13,'http://eol.org/schema/allowedValue','2014-12-08 12:19:02','2014-12-08 12:19:02'),(13,14,15,'http://eol.org/schema/allowedValue','2014-12-08 12:19:02','2014-12-08 12:19:02'),(14,14,16,'http://eol.org/schema/allowedValue','2014-12-08 12:19:02','2014-12-08 12:19:02');
/*!40000 ALTER TABLE `known_uri_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uris`
--

DROP TABLE IF EXISTS `known_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(2000) NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `exclude_from_exemplars` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `uri_type_id` int(11) NOT NULL DEFAULT '1',
  `ontology_information_url` varchar(255) DEFAULT NULL,
  `ontology_source_url` varchar(255) DEFAULT NULL,
  `group_by_clade` tinyint(1) DEFAULT NULL,
  `clade_exemplar` tinyint(1) DEFAULT NULL,
  `exemplar_for_same_as` tinyint(1) DEFAULT NULL,
  `value_is_text` tinyint(1) DEFAULT '0',
  `hide_from_glossary` tinyint(1) DEFAULT '0',
  `value_is_verbatim` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `by_uri` (`uri`(250))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uris`
--

LOCK TABLES `known_uris` WRITE;
/*!40000 ALTER TABLE `known_uris` DISABLE KEYS */;
INSERT INTO `known_uris` VALUES (1,'http://rs.tdwg.org/dwc/terms/measurementUnit',1,2,'2014-12-08 12:19:00','2014-12-08 12:19:00',0,1,4,NULL,NULL,NULL,NULL,NULL,0,0,0),(2,'http://purl.obolibrary.org/obo/UO_0000022',1,2,'2014-12-08 12:19:00','2014-12-08 12:19:00',0,3,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(3,'http://purl.obolibrary.org/obo/UO_0000021',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,2,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(4,'http://purl.obolibrary.org/obo/UO_0000009',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,1,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(5,'http://purl.obolibrary.org/obo/UO_0000016',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,3,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(6,'http://purl.obolibrary.org/obo/UO_0000015',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,2,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(7,'http://purl.obolibrary.org/obo/UO_0000008',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,1,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(8,'http://purl.obolibrary.org/obo/UO_0000012',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,2,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(9,'http://purl.obolibrary.org/obo/UO_0000027',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,1,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(10,'http://purl.obolibrary.org/obo/UO_0000033',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,2,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(11,'http://purl.obolibrary.org/obo/UO_0000036',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,1,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(12,'http://eol.org/schema/terms/onetenthdegreescelsius',1,2,'2014-12-08 12:19:01','2014-12-08 12:19:01',0,12,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(13,'http://eol.org/schema/terms/log10gram',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,13,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(14,'http://rs.tdwg.org/dwc/terms/sex',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,14,4,NULL,NULL,NULL,NULL,NULL,0,0,0),(15,'http://eol.org/schema/terms/male',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,15,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(16,'http://eol.org/schema/terms/female',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,16,3,NULL,NULL,NULL,NULL,NULL,0,0,0),(17,'http://purl.org/dc/terms/source',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,17,4,NULL,NULL,NULL,NULL,NULL,0,0,0),(18,'http://purl.org/dc/terms/license',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,18,4,NULL,NULL,NULL,NULL,NULL,0,0,0),(19,'http://purl.org/dc/terms/bibliographicCitation',1,2,'2014-12-08 12:19:02','2014-12-08 12:19:02',0,19,4,NULL,NULL,NULL,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `known_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uris_toc_items`
--

DROP TABLE IF EXISTS `known_uris_toc_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uris_toc_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `known_uri_id` int(11) NOT NULL,
  `toc_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uris_toc_items`
--

LOCK TABLES `known_uris_toc_items` WRITE;
/*!40000 ALTER TABLE `known_uris_toc_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `known_uris_toc_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_groups`
--

DROP TABLE IF EXISTS `language_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `representative_language_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_groups`
--

LOCK TABLES `language_groups` WRITE;
/*!40000 ALTER TABLE `language_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `iso_639_1` varchar(12) NOT NULL,
  `iso_639_2` varchar(12) NOT NULL,
  `iso_639_3` varchar(12) NOT NULL,
  `source_form` varchar(100) NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '1',
  `activated_on` timestamp NULL DEFAULT NULL,
  `language_group_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iso_639_1` (`iso_639_1`),
  KEY `iso_639_2` (`iso_639_2`),
  KEY `iso_639_3` (`iso_639_3`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','eng','eng','English',1,'2014-12-06 10:18:49',NULL),(2,'fr','fre','','Français',1,'2014-12-07 10:18:54',NULL),(3,'es','spa','','Español',2,'2014-12-07 10:18:54',NULL),(4,'ar','','','العربية',3,'2014-12-07 10:18:54',NULL),(5,'','','','Scientific Name',4,NULL,NULL),(6,'','','','Unknown',5,NULL,NULL),(7,'de','','','',65,'2014-12-07 10:20:00',NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `source_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `version` varchar(6) CHARACTER SET ascii NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `show_to_content_partners` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `source_url` (`source_url`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'public domain','http://creativecommons.org/licenses/publicdomain/','1','',1),(2,'all rights reserved','','1','',0),(3,'cc-by 3.0','http://creativecommons.org/licenses/by/3.0/','1','cc_by_small.png',1),(4,'cc-by-sa 3.0','http://creativecommons.org/licenses/by-sa/3.0/','1','cc_by_sa_small.png',1),(5,'cc-by-nc 3.0','http://creativecommons.org/licenses/by-nc/3.0/','1','cc_by_nc_small.png',1),(6,'cc-by-nc-sa 3.0','http://creativecommons.org/licenses/by-nc-sa/3.0/','1','cc_by_nc_sa_small.png',1),(7,'cc-zero 1.0','http://creativecommons.org/publicdomain/zero/1.0/','1','cc_zero_small.png',1),(8,'no known copyright restrictions','http://www.flickr.com/commons/usage/','1','',1),(9,'not applicable','','1','',0);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_types`
--

DROP TABLE IF EXISTS `link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_types`
--

LOCK TABLES `link_types` WRITE;
/*!40000 ALTER TABLE `link_types` DISABLE KEYS */;
INSERT INTO `link_types` VALUES (1,'2014-12-08 12:18:54','2014-12-08 12:18:54'),(2,'2014-12-08 12:18:54','2014-12-08 12:18:54'),(3,'2014-12-08 12:18:54','2014-12-08 12:18:54'),(4,'2014-12-08 12:18:54','2014-12-08 12:18:54'),(5,'2014-12-08 12:18:54','2014-12-08 12:18:54'),(6,'2014-12-08 12:18:54','2014-12-08 12:18:54');
/*!40000 ALTER TABLE `link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `manager` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,7,1,'2014-12-08 12:19:09','2014-12-08 12:19:09',NULL),(2,9,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL),(3,11,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL),(4,13,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL),(5,15,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL),(6,17,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL),(7,20,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL),(8,22,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL),(9,24,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL),(10,26,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL),(11,28,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL),(12,30,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL),(13,33,1,'2014-12-08 12:19:33','2014-12-08 12:19:33',NULL),(14,37,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL),(15,39,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL),(16,41,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL),(17,44,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL),(18,46,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL),(19,48,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL),(20,50,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL),(21,52,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL),(22,54,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL),(23,56,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL),(24,58,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL),(25,60,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL),(26,62,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL),(27,64,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL),(28,66,1,'2014-12-08 12:20:03','2014-12-08 12:20:03',NULL),(29,68,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL),(30,70,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mime_types`
--

DROP TABLE IF EXISTS `mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Type of data object. Controlled list used in the EOL schema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mime_types`
--

LOCK TABLES `mime_types` WRITE;
/*!40000 ALTER TABLE `mime_types` DISABLE KEYS */;
INSERT INTO `mime_types` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21);
/*!40000 ALTER TABLE `mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_languages`
--

DROP TABLE IF EXISTS `name_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_languages` (
  `name_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'required; the language of the string. ''Scientific name'' is a language',
  `parent_name_id` int(10) unsigned NOT NULL COMMENT 'not required; associated a common name or surrogate with its proper scientific name',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'not required; identifies if the common names is preferred for the given scientific name in the given language',
  PRIMARY KEY (`name_id`,`language_id`,`parent_name_id`),
  KEY `parent_name_id` (`parent_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used mainly to identify which names are scientific names, and to link up common names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_languages`
--

LOCK TABLES `name_languages` WRITE;
/*!40000 ALTER TABLE `name_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `name_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namebank_id` int(10) unsigned NOT NULL COMMENT 'required; this identifies the uBio NameBank id for this string so that we can stay in sync. Many newer names will have this set to 0 as it is unknown if the name is in NameBank',
  `string` varchar(300) NOT NULL COMMENT 'the actual name. This is unique - every unique sequence of characters has one and only one name_id (we should probably add a unique index to this field)',
  `clean_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'there is a one to one reltaionship between a name string and a clean name. The clean name takes the string and lowercases it (uncluding diacriticals), removes leading/trailing whitespace, removes some punctuation (periods and more), and pads remaining pun',
  `italicized` varchar(300) NOT NULL COMMENT 'required; this includes html <i> tags in the proper place to display the string in its italicized form. Generally only species and subspecific names are italizied. Usually algorithmically generated',
  `italicized_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; if an editor verifies the italicized form is correct, or corrects it, this should be set to 1 so it is not algorithmically replaced if we change the algorithm',
  `canonical_form_id` int(10) unsigned NOT NULL COMMENT 'required; every name string has a canonical form',
  `ranked_canonical_form_id` int(10) unsigned DEFAULT NULL,
  `canonical_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; same as with italicized form, if an editor verifies the canonical form we want to maintin their edits if we were to redo the canonical form algorithm',
  PRIMARY KEY (`id`),
  KEY `canonical_form_id` (`canonical_form_id`),
  KEY `clean_name` (`clean_name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='Represents the name of a taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,0,'Nesciunterox autrerumalis','nesciunterox autrerumalis','<i>Nesciunterox autrerumalis</i>',1,1,NULL,1),(2,0,'Animalia Linn.','animalia linn','<i>Animalia</i> Linn.',1,2,2,1),(3,0,'Animals','animals','<i>Animals</i>',0,3,NULL,0),(4,0,'Autrecusandaees repudiandaeica Linnaeus','autrecusandaees repudiandaeica linnaeus','<i>Autrecusandaees repudiandaeica</i> Linnaeus',1,4,4,1),(5,0,'ravenous clover','ravenous clover','<i>ravenous clover</i>',0,5,NULL,0),(6,0,'Nihileri voluptasus G. D\'Amore','nihileri voluptasus g d\'amore','<i>Nihileri voluptasus</i> G. D\'Amore',1,6,6,1),(7,0,'red suntus','red suntus','<i>red suntus</i>',0,7,NULL,0),(8,0,'Dignissimosii inutes R. Bergstrom','dignissimosii inutes r bergstrom','<i>Dignissimosii inutes</i> R. Bergstrom',1,8,8,1),(9,0,'darning needle','darning needle','<i>darning needle</i>',0,9,NULL,0),(10,0,'Fugais utharumatus L.','fugais utharumatus l','<i>Fugais utharumatus</i> L.',1,10,10,1),(11,0,'tiger','tiger','<i>tiger</i>',0,11,NULL,0),(12,0,'Minuseli ullamens Linn','minuseli ullamens linn','<i>Minuseli ullamens</i> Linn',1,12,12,1),(13,0,'Tiger moth','tiger moth','<i>Tiger moth</i>',0,13,NULL,0),(14,0,'Dignissimosatus nobisosyne R. Cartwright','dignissimosatus nobisosyne r cartwright','<i>Dignissimosatus nobisosyne</i> R. Cartwright',1,14,14,1),(15,0,'Tiger lilly','tiger lilly','<i>Tiger lilly</i>',0,15,NULL,0),(16,0,'Tiger water lilly','tiger water lilly','<i>Tiger water lilly</i>',0,16,NULL,0),(17,0,'lilly of the tiger','lilly of the tiger','<i>lilly of the tiger</i>',0,17,NULL,0),(18,0,'Tiger flower','tiger flower','<i>Tiger flower</i>',0,18,NULL,0),(19,0,'Tiger-stripe lilly','tiger - stripe lilly','<i>Tiger-stripe lilly</i>',0,19,NULL,0),(20,0,'Tiger-eye lilly','tiger - eye lilly','<i>Tiger-eye lilly</i>',0,20,NULL,0),(21,0,'Expeditaalia evenietelia L.','expeditaalia evenietelia l','<i>Expeditaalia evenietelia</i> L.',1,21,21,1),(22,0,'Earumeles beataeata Linn.','earumeles beataeata linn','<i>Earumeles beataeata</i> Linn.',1,22,22,1),(23,0,'Culpaensis sapienteesi Linnaeus','culpaensis sapienteesi linnaeus','<i>Culpaensis sapienteesi</i> Linnaeus',1,23,23,1),(24,0,'frizzlebek','frizzlebek','<i>frizzlebek</i>',0,24,NULL,0),(25,0,'Utomnisesi sequialis N. Upton','utomnisesi sequialis n upton','<i>Utomnisesi sequialis</i> N. Upton',1,25,25,1),(26,0,'purple dust crab','purple dust crab','<i>purple dust crab</i>',0,26,NULL,0),(27,0,'Autaliquideri minimais L. Carroll','autaliquideri minimais l carroll','<i>Autaliquideri minimais</i> L. Carroll',1,27,27,1),(28,0,'Beataeelia etnemoiae','beataeelia etnemoiae','<i>Beataeelia etnemoiae</i>',1,27,NULL,1),(29,0,'Autemalius utsimiliqueesi','autemalius utsimiliqueesi','<i>Autemalius utsimiliqueesi</i>',1,28,NULL,1),(30,0,'Etconsequaturelia autenimalia M. Port','etconsequaturelia autenimalia m port','<i>Etconsequaturelia autenimalia</i> M. Port',1,29,29,1),(31,0,'wumpus','wumpus','<i>wumpus</i>',0,30,NULL,0),(32,0,'wompus','wompus','<i>wompus</i>',0,31,NULL,0),(33,0,'wampus','wampus','<i>wampus</i>',0,32,NULL,0),(34,0,'Eukaryota S. Posford','eukaryota s posford','<i>Eukaryota</i> S. Posford',1,33,33,1),(35,0,'eukaryotes','eukaryotes','<i>eukaryotes</i>',0,34,NULL,0),(36,0,'Metazoa','metazoa','<i>Metazoa</i>',1,35,NULL,1),(37,0,'opisthokonts','opisthokonts','<i>opisthokonts</i>',1,36,NULL,1),(38,0,'Quoautesi natuseri Posford & Ram','quoautesi natuseri posford & ram','<i>Quoautesi natuseri</i> Posford & Ram',1,37,37,1),(39,0,'cloud swallow','cloud swallow','<i>cloud swallow</i>',0,38,NULL,0),(40,0,'Voluptatumeri esseensis L.','voluptatumeri esseensis l','<i>Voluptatumeri esseensis</i> L.',1,39,39,1),(41,0,'spiny possom','spiny possom','<i>spiny possom</i>',0,40,NULL,0),(42,0,'Ameti maioresis Linnaeus','ameti maioresis linnaeus','<i>Ameti maioresis</i> Linnaeus',1,41,41,1),(43,0,'common desert mouse','common desert mouse','<i>common desert mouse</i>',0,42,NULL,0),(44,0,'Ipsamalius distinctioerox','ipsamalius distinctioerox','<i>Ipsamalius distinctioerox</i>',1,43,43,1),(45,0,'fisher','fisher','<i>fisher</i>',0,44,NULL,0),(46,0,'Maximees veritatisatus P. Leary','maximees veritatisatus p leary','<i>Maximees veritatisatus</i> P. Leary',1,45,45,1),(47,0,'chartruse turtle','chartruse turtle','<i>chartruse turtle</i>',0,46,NULL,0),(48,0,'Molestiaeus rationealia Padderson','molestiaeus rationealia padderson','<i>Molestiaeus rationealia</i> Padderson',1,47,47,1),(49,0,'horny toad','horny toad','<i>horny toad</i>',0,48,NULL,0),(50,0,'Fugitens dolorealius Linnaeus','fugitens dolorealius linnaeus','<i>Fugitens dolorealius</i> Linnaeus',1,49,49,1),(51,0,'scarlet vermillion','scarlet vermillion','<i>scarlet vermillion</i>',0,50,NULL,0),(52,0,'Quisquamator sequieles L.','quisquamator sequieles l','<i>Quisquamator sequieles</i> L.',1,51,51,1),(53,0,'Mozart\'s nemesis','mozart\'s nemesis','<i>Mozart\'s nemesis</i>',0,52,NULL,0),(54,0,'Bacteria M. Mayer','bacteria m mayer','<i>Bacteria</i> M. Mayer',1,53,53,1),(55,0,'bacteria','bacteria','<i>bacteria</i>',0,53,NULL,0),(56,0,'bugs','bugs','<i>bugs</i>',0,54,NULL,0),(57,0,'grime','grime','<i>grime</i>',0,55,NULL,0),(58,0,'critters','critters','<i>critters</i>',0,56,NULL,0),(59,0,'bakteria','bakteria','<i>bakteria</i>',0,57,NULL,0),(60,0,'die buggen','die buggen','<i>die buggen</i>',0,58,NULL,0),(61,0,'das greim','das greim','<i>das greim</i>',0,59,NULL,0),(62,0,'baseteir','baseteir','<i>baseteir</i>',0,60,NULL,0),(63,0,'le grimme','le grimme','<i>le grimme</i>',0,61,NULL,0),(64,0,'ler petit bugge','ler petit bugge','<i>ler petit bugge</i>',0,62,NULL,0),(65,0,'microbia','microbia','microbia',1,53,NULL,1),(66,0,'Essees eaqueata L.','essees eaqueata l','<i>Essees eaqueata</i> L.',1,63,63,1),(67,0,'quick brown fox','quick brown fox','<i>quick brown fox</i>',0,64,NULL,0),(68,0,'Animiens atdoloribuseron Linn.','animiens atdoloribuseron linn','<i>Animiens atdoloribuseron</i> Linn.',1,65,65,1),(69,0,'painted horse','painted horse','<i>painted horse</i>',0,66,NULL,0),(70,0,'Adaliasii iurea Linnaeus','adaliasii iurea linnaeus','<i>Adaliasii iurea</i> Linnaeus',1,67,67,1),(71,0,'thirsty aphid','thirsty aphid','<i>thirsty aphid</i>',0,68,NULL,0),(72,0,'Nonnumquamerus numquamerus G. D\'Amore','nonnumquamerus numquamerus g d\'amore','<i>Nonnumquamerus numquamerus</i> G. D\'Amore',1,69,69,1),(73,0,'bloody eel','bloody eel','<i>bloody eel</i>',0,70,NULL,0);
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `activated_on` datetime DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_items`
--

LOCK TABLES `news_items` WRITE;
/*!40000 ALTER TABLE `news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_emailer_settings`
--

DROP TABLE IF EXISTS `notification_emailer_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_emailer_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_daily_emails_sent` datetime DEFAULT NULL,
  `last_weekly_emails_sent` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_emailer_settings`
--

LOCK TABLES `notification_emailer_settings` WRITE;
/*!40000 ALTER TABLE `notification_emailer_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_emailer_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_frequencies`
--

DROP TABLE IF EXISTS `notification_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_frequencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_frequencies`
--

LOCK TABLES `notification_frequencies` WRITE;
/*!40000 ALTER TABLE `notification_frequencies` DISABLE KEYS */;
INSERT INTO `notification_frequencies` VALUES (1,'never'),(2,'newsfeed only'),(3,'weekly'),(4,'daily digest'),(5,'send immediately');
/*!40000 ALTER TABLE `notification_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reply_to_comment` int(11) DEFAULT '5',
  `comment_on_my_profile` int(11) DEFAULT '5',
  `comment_on_my_contribution` int(11) DEFAULT '5',
  `comment_on_my_collection` int(11) DEFAULT '5',
  `comment_on_my_community` int(11) DEFAULT '5',
  `made_me_a_manager` int(11) DEFAULT '5',
  `member_joined_my_community` int(11) DEFAULT '5',
  `comment_on_my_watched_item` int(11) DEFAULT '2',
  `curation_on_my_watched_item` int(11) DEFAULT '2',
  `new_data_on_my_watched_item` int(11) DEFAULT '2',
  `changes_to_my_watched_collection` int(11) DEFAULT '2',
  `changes_to_my_watched_community` int(11) DEFAULT '2',
  `member_joined_my_watched_community` int(11) DEFAULT '2',
  `member_left_my_community` int(11) DEFAULT '2',
  `new_manager_in_my_community` int(11) DEFAULT '2',
  `i_am_being_watched` int(11) DEFAULT '2',
  `eol_newsletter` tinyint(1) DEFAULT '1',
  `last_notification_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:18:52','2014-12-08 12:18:52'),(2,2,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:18:52','2014-12-08 12:18:52'),(3,3,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:18:52','2014-12-08 12:18:52'),(4,4,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:03','2014-12-08 12:19:03'),(5,5,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:07','2014-12-08 12:19:07'),(6,6,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:08','2014-12-08 12:19:08'),(7,7,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:08','2014-12-08 12:19:08'),(8,8,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:12','2014-12-08 12:19:12'),(9,9,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:12','2014-12-08 12:19:12'),(10,10,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:13','2014-12-08 12:19:13'),(11,11,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:14','2014-12-08 12:19:14'),(12,12,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:15','2014-12-08 12:19:15'),(13,13,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:15','2014-12-08 12:19:15'),(14,14,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:17','2014-12-08 12:19:17'),(15,15,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:17','2014-12-08 12:19:17'),(16,16,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:19','2014-12-08 12:19:19'),(17,17,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:19','2014-12-08 12:19:19'),(18,18,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:22','2014-12-08 12:19:22'),(19,19,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:24','2014-12-08 12:19:24'),(20,20,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:24','2014-12-08 12:19:24'),(21,21,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:24','2014-12-08 12:19:24'),(22,22,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:24','2014-12-08 12:19:24'),(23,23,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:25','2014-12-08 12:19:25'),(24,24,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:25','2014-12-08 12:19:25'),(25,25,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:25','2014-12-08 12:19:25'),(26,26,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:25','2014-12-08 12:19:25'),(27,27,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:29','2014-12-08 12:19:29'),(28,28,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:29','2014-12-08 12:19:29'),(29,29,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:30','2014-12-08 12:19:30'),(30,30,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:30','2014-12-08 12:19:30'),(31,31,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:32','2014-12-08 12:19:32'),(32,32,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:32','2014-12-08 12:19:32'),(33,33,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:32','2014-12-08 12:19:32'),(34,34,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:36','2014-12-08 12:19:36'),(35,35,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:36','2014-12-08 12:19:36'),(36,36,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:37','2014-12-08 12:19:37'),(37,37,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:37','2014-12-08 12:19:37'),(38,38,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:38','2014-12-08 12:19:38'),(39,39,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:38','2014-12-08 12:19:38'),(40,40,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:40','2014-12-08 12:19:40'),(41,41,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:40','2014-12-08 12:19:40'),(42,42,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:40','2014-12-08 12:19:40'),(43,43,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:41','2014-12-08 12:19:41'),(44,44,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:41','2014-12-08 12:19:41'),(45,45,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:43','2014-12-08 12:19:43'),(46,46,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:43','2014-12-08 12:19:43'),(47,47,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:45','2014-12-08 12:19:45'),(48,48,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:45','2014-12-08 12:19:45'),(49,49,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:47','2014-12-08 12:19:47'),(50,50,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:47','2014-12-08 12:19:47'),(51,51,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:49','2014-12-08 12:19:49'),(52,52,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:49','2014-12-08 12:19:49'),(53,53,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:51','2014-12-08 12:19:51'),(54,54,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:51','2014-12-08 12:19:51'),(55,55,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:53','2014-12-08 12:19:53'),(56,56,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:53','2014-12-08 12:19:53'),(57,57,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:54','2014-12-08 12:19:54'),(58,58,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:55','2014-12-08 12:19:55'),(59,59,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:56','2014-12-08 12:19:56'),(60,60,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:57','2014-12-08 12:19:57'),(61,61,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:58','2014-12-08 12:19:58'),(62,62,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:19:58','2014-12-08 12:19:58'),(63,63,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:01','2014-12-08 12:20:01'),(64,64,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:01','2014-12-08 12:20:01'),(65,65,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:02','2014-12-08 12:20:02'),(66,66,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:02','2014-12-08 12:20:02'),(67,67,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:05','2014-12-08 12:20:05'),(68,68,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:05','2014-12-08 12:20:05'),(69,69,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:07','2014-12-08 12:20:07'),(70,70,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:07','2014-12-08 12:20:07'),(71,71,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:15','2014-12-08 12:20:15'),(72,72,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:29','2014-12-08 12:20:29'),(73,73,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-08 12:20:30','2014-12-08 12:20:30'),(74,74,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-10 07:42:32','2014-12-10 07:42:32'),(75,75,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-12-10 07:49:52','2014-12-10 07:49:52');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_authentications`
--

DROP TABLE IF EXISTS `open_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_guid` (`provider`,`guid`),
  UNIQUE KEY `user_id_provider` (`user_id`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_authentications`
--

LOCK TABLES `open_authentications` WRITE;
/*!40000 ALTER TABLE `open_authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_names`
--

DROP TABLE IF EXISTS `page_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_names` (
  `item_page_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name_id`,`item_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Links name strings to BHL page identifiers. Many names on a given page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_names`
--

LOCK TABLES `page_names` WRITE;
/*!40000 ALTER TABLE `page_names` DISABLE KEYS */;
INSERT INTO `page_names` VALUES (1,2),(2,2),(3,2),(4,4),(5,4),(6,4),(7,6),(8,6),(9,6),(10,8),(11,8),(12,8),(13,10),(14,10),(15,10),(16,12),(17,12),(18,12),(19,21),(20,21),(21,21),(22,27),(23,27),(24,27),(25,30),(26,30),(27,30),(28,34),(29,34),(30,34),(31,38),(32,38),(33,38),(34,40),(35,40),(36,40),(37,42),(38,42),(39,42),(40,44),(41,44),(42,44),(43,46),(44,46),(45,46),(46,48),(47,48),(48,48),(49,50),(50,50),(51,50),(52,52),(53,52),(54,52),(55,54),(56,54),(57,54),(58,66),(59,66),(60,66),(61,68),(62,68),(63,68),(64,70),(65,70),(66,70),(67,72),(68,72),(69,72);
/*!40000 ALTER TABLE `page_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_dataobjects`
--

DROP TABLE IF EXISTS `page_stats_dataobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_dataobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` varchar(1) DEFAULT 'n',
  `taxa_count` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_unknown_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_vetted_unknown_published_visible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_visible_uniqueGuid` longtext,
  `a_vetted_unknown_published_notVisible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_notVisible_uniqueGuid` longtext,
  `user_submitted_text` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_dataobjects`
--

LOCK TABLES `page_stats_dataobjects` WRITE;
/*!40000 ALTER TABLE `page_stats_dataobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_dataobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_marine`
--

DROP TABLE IF EXISTS `page_stats_marine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_marine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '0',
  `names_from_xml` int(11) DEFAULT NULL,
  `names_in_eol` int(11) DEFAULT NULL,
  `marine_pages` int(11) DEFAULT NULL,
  `pages_with_objects` int(11) DEFAULT NULL,
  `pages_with_vetted_objects` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_marine`
--

LOCK TABLES `page_stats_marine` WRITE;
/*!40000 ALTER TABLE `page_stats_marine` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_marine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_taxa`
--

DROP TABLE IF EXISTS `page_stats_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxa_count` int(11) DEFAULT NULL,
  `taxa_text` int(11) DEFAULT NULL,
  `taxa_images` int(11) DEFAULT NULL,
  `taxa_text_images` int(11) DEFAULT NULL,
  `taxa_BHL_no_text` int(11) DEFAULT NULL,
  `taxa_links_no_text` int(11) DEFAULT NULL,
  `taxa_images_no_text` int(11) DEFAULT NULL,
  `taxa_text_no_images` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj` int(11) DEFAULT NULL,
  `no_vet_obj2` int(11) DEFAULT NULL,
  `with_BHL` int(11) DEFAULT NULL,
  `vetted_not_published` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_inCol` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_notinCol` int(11) DEFAULT NULL,
  `pages_incol` int(11) DEFAULT NULL,
  `pages_not_incol` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lifedesk_taxa` int(11) DEFAULT NULL,
  `lifedesk_dataobject` int(11) DEFAULT NULL,
  `data_objects_count_per_category` text,
  `content_partners_count_per_category` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_taxa`
--

LOCK TABLES `page_stats_taxa` WRITE;
/*!40000 ALTER TABLE `page_stats_taxa` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_notifications`
--

DROP TABLE IF EXISTS `pending_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `notification_frequency_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(64) DEFAULT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pending_notifications_on_user_id` (`user_id`),
  KEY `index_pending_notifications_on_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_notifications`
--

LOCK TABLES `pending_notifications` WRITE;
/*!40000 ALTER TABLE `pending_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,'2014-12-08 12:19:00','2014-12-08 12:19:37'),(2,0,'2014-12-08 12:19:00','2014-12-08 12:19:00'),(3,2,'2014-12-08 12:19:00','2014-12-08 12:20:29'),(4,0,'2014-12-08 12:19:00','2014-12-08 12:19:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_permissions_users_on_permission_id_and_user_id` (`permission_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
INSERT INTO `permissions_users` VALUES (1,37,1,'2014-12-08 12:19:37','2014-12-08 12:19:37'),(2,37,3,'2014-12-08 12:19:37','2014-12-08 12:19:37'),(3,72,3,'2014-12-08 12:20:29','2014-12-08 12:20:29'),(4,75,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,75,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,75,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,75,4,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_titles`
--

DROP TABLE IF EXISTS `publication_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marc_bib_id` varchar(40) NOT NULL,
  `marc_leader` varchar(40) NOT NULL,
  `title` varchar(300) NOT NULL,
  `short_title` varchar(300) NOT NULL,
  `details` varchar(300) NOT NULL,
  `call_number` varchar(40) NOT NULL,
  `start_year` varchar(10) NOT NULL,
  `end_year` varchar(10) NOT NULL,
  `language` varchar(10) NOT NULL,
  `author` varchar(150) NOT NULL,
  `abbreviation` varchar(150) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The main publications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_titles`
--

LOCK TABLES `publication_titles` WRITE;
/*!40000 ALTER TABLE `publication_titles` DISABLE KEYS */;
INSERT INTO `publication_titles` VALUES (1,'','','Great Big Journal of Fun','Publication','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st'),(2,'','','The Journal You Cannot Afford','Publication','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st');
/*!40000 ALTER TABLE `publication_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `random_hierarchy_images`
--

DROP TABLE IF EXISTS `random_hierarchy_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `random_hierarchy_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `hierarchy_entry_id` int(11) DEFAULT NULL,
  `hierarchy_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `hierarchy_id` (`hierarchy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `random_hierarchy_images`
--

LOCK TABLES `random_hierarchy_images` WRITE;
/*!40000 ALTER TABLE `random_hierarchy_images` DISABLE KEYS */;
INSERT INTO `random_hierarchy_images` VALUES (30,2,2,3,7,'<i>Autvoluptatesus temporaalis</i> Factory TestFramework'),(31,11,3,3,8,'<i>Excepturialia omnisa</i> Factory TestFramework'),(32,20,4,3,9,'<i>Estveroalia nihilata</i> Factory TestFramework'),(33,29,5,3,10,'<i>Quiincidunta culpaelia</i> Factory TestFramework'),(34,38,6,3,11,'<i>Providentalia estquaeratens</i> Factory TestFramework'),(35,47,7,3,12,'<i>Placeatalia uteosensis</i> Factory TestFramework'),(36,66,11,3,16,'<i>Ipsaensis architectoalius</i> Factory TestFramework'),(37,82,12,3,17,'<i>Deserunterox facererox</i> Factory TestFramework'),(38,92,13,3,18,'<i>Suntalia estsitalius</i> Factory TestFramework'),(39,101,17,3,20,'<i>Aliasosyne quiadipisciatus</i> Factory TestFramework'),(40,110,24,6,21,'<i>Illoica exexplicaboalia</i> Factory TestFramework'),(41,119,26,6,22,'<i>Laboriosamerus quisis</i> Factory TestFramework'),(42,128,27,6,23,'<i>Optiois molestiasalia</i> Factory TestFramework'),(43,137,28,6,24,'<i>Ipsuma animius</i> Factory TestFramework'),(44,146,29,6,25,'<i>Quiserox eligendii</i> Factory TestFramework'),(45,155,30,6,26,'<i>Eteaiae nullais</i> Factory TestFramework'),(46,164,31,6,27,'<i>Quibusdameli estculpaatut</i> Factory TestFramework'),(47,173,32,6,28,'<i>Estasperioreseli etquidemit</i> Factory TestFramework'),(48,182,33,6,29,'<i>Nesciunterox autrerumalit</i> Factory TestFramework'),(49,191,34,6,30,'<i>Voluptasalius optioerut</i> Factory TestFramework'),(50,200,35,6,31,'<i>Remrerumeron auteterut</i> Factory TestFramework'),(51,209,36,6,32,'<i>Veritatises idofficiisiaf</i> Factory TestFramework'),(52,218,37,6,33,'<i>Accusamusalis pariaturb</i> Factory TestFramework'),(53,227,38,6,34,'<i>Voluptateseri doloremosynf</i> Factory TestFramework');
/*!40000 ALTER TABLE `random_hierarchy_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_group_id` smallint(6) NOT NULL COMMENT 'not required; there is no rank_groups table. This is used to group (reconcile) different strings for the same rank',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Stores taxonomic ranks (ex: phylum, order, class, family...). Used in hierarchy_entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifier_types`
--

DROP TABLE IF EXISTS `ref_identifier_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifier_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifier_types`
--

LOCK TABLES `ref_identifier_types` WRITE;
/*!40000 ALTER TABLE `ref_identifier_types` DISABLE KEYS */;
INSERT INTO `ref_identifier_types` VALUES (3,'bici'),(4,'coden'),(2,'doi'),(5,'eissn'),(6,'handle'),(7,'isbn'),(8,'issn'),(9,'lsid'),(10,'oclc'),(11,'sici'),(1,'url'),(12,'urn');
/*!40000 ALTER TABLE `ref_identifier_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifiers`
--

DROP TABLE IF EXISTS `ref_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifiers` (
  `ref_id` int(10) unsigned NOT NULL,
  `ref_identifier_type_id` smallint(5) unsigned NOT NULL,
  `identifier` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`ref_id`,`ref_identifier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifiers`
--

LOCK TABLES `ref_identifiers` WRITE;
/*!40000 ALTER TABLE `ref_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_reference` text NOT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `editors` varchar(255) DEFAULT NULL,
  `publication_created_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `page_start` varchar(50) DEFAULT NULL,
  `page_end` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL,
  `user_submitted` tinyint(1) NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `full_reference` (`full_reference`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores reference full strings. References are linked to data objects and taxa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_contributions`
--

DROP TABLE IF EXISTS `resource_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `data_point_uri_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `hierarchy_entry_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `data_object_type` int(11) DEFAULT NULL,
  `predicate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resource_contributions_on_resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_contributions`
--

LOCK TABLES `resource_contributions` WRITE;
/*!40000 ALTER TABLE `resource_contributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_statuses`
--

DROP TABLE IF EXISTS `resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='The status of the resource in harvesting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_statuses`
--

LOCK TABLES `resource_statuses` WRITE;
/*!40000 ALTER TABLE `resource_statuses` DISABLE KEYS */;
INSERT INTO `resource_statuses` VALUES (1,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(2,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(3,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(4,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(5,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(6,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(7,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(8,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(9,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(10,'2014-12-08 12:19:06','2014-12-08 12:19:06'),(11,'2014-12-08 12:19:06','2014-12-08 12:19:06');
/*!40000 ALTER TABLE `resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `accesspoint_url` varchar(255) DEFAULT NULL COMMENT 'recommended; the url where the resource can be accessed. Not used when the resource is a file which was uploaded',
  `metadata_url` varchar(255) DEFAULT NULL,
  `dwc_archive_url` varchar(255) DEFAULT NULL,
  `service_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'recommended; if accesspoint_url is defined, this will indicate what kind of protocal can be expected to be found there. (this is perhaps misued right now)',
  `service_version` varchar(255) DEFAULT NULL,
  `resource_set_code` varchar(255) DEFAULT NULL COMMENT 'not required; if the resource contains several subsets (such as DiGIR providers) theis indicates the set we are to harvest',
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL COMMENT 'not required; the default language of the contents of the resource',
  `subject` varchar(255) NOT NULL,
  `bibliographic_citation` varchar(400) DEFAULT NULL COMMENT 'not required; the default bibliographic citation for all data objects whithin the resource',
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(400) DEFAULT NULL,
  `rights_holder` varchar(255) DEFAULT NULL,
  `refresh_period_hours` smallint(5) unsigned DEFAULT NULL COMMENT 'recommended; if the resource is to be harvested regularly, this field indicates how frequent the updates are',
  `resource_modified_at` datetime DEFAULT NULL,
  `resource_created_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` datetime DEFAULT NULL COMMENT 'required; this field is updated each time the resource is harvested',
  `dataset_file_name` varchar(255) DEFAULT NULL,
  `dataset_content_type` varchar(255) DEFAULT NULL,
  `dataset_file_size` int(11) DEFAULT NULL,
  `resource_status_id` int(11) DEFAULT NULL,
  `auto_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; indicates whether the resource is to be published immediately after harvesting',
  `vetted` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text,
  `hierarchy_id` int(10) unsigned DEFAULT NULL,
  `dwc_hierarchy_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `preview_collection_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dataset_license_id` int(11) DEFAULT NULL,
  `dataset_rights_holder` varchar(255) DEFAULT NULL,
  `dataset_rights_statement` varchar(400) DEFAULT NULL,
  `dataset_source_url` varchar(255) DEFAULT NULL,
  `dataset_hosted_url` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `pause` tinyint(1) DEFAULT NULL,
  `last_harvest_seconds` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`),
  KEY `content_partner_id` (`content_partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Content parters supply resource files which contain data objects and taxa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,3,'LigerCat resource','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-12-06 12:18:25','2014-12-08 10:18:53',NULL,NULL,NULL,NULL,NULL,0,0,NULL,2,NULL,NULL,NULL,'2014-12-08 10:18:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'Initial IUCN Import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-12-06 12:18:25','2014-12-08 10:18:56',NULL,NULL,NULL,NULL,NULL,0,0,NULL,8,NULL,NULL,NULL,'2014-12-08 10:18:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2,'Bootstrapper','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-12-06 12:18:25','2014-12-08 10:19:07',NULL,NULL,NULL,NULL,8,0,1,NULL,NULL,NULL,NULL,NULL,'2014-12-08 10:19:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,'Test Framework Import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-12-06 12:18:25','2014-12-08 10:19:32',NULL,NULL,NULL,NULL,8,0,0,NULL,10,NULL,NULL,NULL,'2014-12-08 10:19:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,6,'Test ContentPartner import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-12-06 12:18:25','2014-12-08 10:19:36',NULL,NULL,NULL,NULL,8,0,1,NULL,11,NULL,NULL,NULL,'2014-12-08 10:19:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090115212906'),('20090115213411'),('20120103141320'),('20120110075736'),('20120110103907'),('20120111211217'),('20120112191907'),('20120112200143'),('20120117213105'),('20120120205849'),('20120131212129'),('20120206154220'),('20120207203935'),('20120208221609'),('20120210202432'),('20120222032338'),('20120223204740'),('20120229152123'),('20120229170021'),('20120301041857'),('20120307204553'),('20120313030838'),('20120315225035'),('20120322050318'),('20120322201426'),('20120322203550'),('20120328143839'),('20120409142449'),('20120411135611'),('20120416134434'),('20120416205738'),('20120424162745'),('20120425185543'),('20120502204941'),('20120508144927'),('20120509164521'),('20120511145911'),('20120523132153'),('20120524195141'),('20120606174130'),('20120612185023'),('20120620180925'),('20120621170001'),('20120702161131'),('20120711180628'),('20120711191923'),('20120717195215'),('20120723173028'),('20120725174440'),('20120726181117'),('20120803133442'),('20120822130345'),('20120824212655'),('20120831194556'),('20120913212558'),('20120921163501'),('20121017193823'),('20121024195217'),('20121214213208'),('20121214213210'),('20121226211903'),('20130114173940'),('20130122175125'),('20130131151206'),('20130213150346'),('20130218224336'),('20130221155225'),('20130312205157'),('20130314154506'),('20130316220630'),('20130405164819'),('20130409183346'),('20130417184926'),('20130507192132'),('20130513160049'),('20130514165519'),('20130516163352'),('20130616133515'),('20130616133666'),('20130621154953'),('20130625164819'),('20130705175328'),('20130716181945'),('20130719150708'),('20130814154004'),('20130821135151'),('20130822141249'),('20130822212627'),('20130828134735'),('20130903164208'),('20131003131947'),('20131007005920'),('20131015172505'),('20131016162919'),('20131017205031'),('20131018135212'),('20131114214249'),('20131127153518'),('20131220005325'),('20131223163226'),('20140107210209'),('20140123190941'),('20140207155052'),('20140522190414'),('20140821173749'),('20140822182026'),('20140909183902'),('20140911145939'),('20141021111725'),('20150308125938'),('20150309142130'),('20150312211931'),('20150318072934'),('20150319073652'),('20150319130928'),('20150326082752'),('20150326114830'),('20150401094258'),('20150402074201'),('20150406061656'),('20150408095232'),('20150419132623'),('20150505130603');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_suggestions`
--

DROP TABLE IF EXISTS `search_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL DEFAULT '',
  `language_label` varchar(255) NOT NULL DEFAULT 'en',
  `taxon_id` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `content_notes` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_suggestions`
--

LOCK TABLES `search_suggestions` WRITE;
/*!40000 ALTER TABLE `search_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_types` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='What type of protocol the content partners are exposing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
/*!40000 ALTER TABLE `service_types` DISABLE KEYS */;
INSERT INTO `service_types` VALUES (1);
/*!40000 ALTER TABLE `service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_options`
--

DROP TABLE IF EXISTS `site_configuration_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_site_configuration_options_on_parameter` (`parameter`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_options`
--

LOCK TABLES `site_configuration_options` WRITE;
/*!40000 ALTER TABLE `site_configuration_options` DISABLE KEYS */;
INSERT INTO `site_configuration_options` VALUES (1,'email_actions_to_curators','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(2,'email_actions_to_curators_address','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(3,'global_site_warning','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(4,'all_users_can_see_data','false','2014-12-08 12:18:49','2014-12-08 12:18:49'),(5,'reference_parsing_enabled','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(6,'reference_parser_pid','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(7,'reference_parser_endpoint','','2014-12-08 12:18:49','2014-12-08 12:18:49'),(8,'notification_error_user_id','','2014-12-08 12:18:49','2014-12-08 12:18:49');
/*!40000 ALTER TABLE `site_configuration_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sort_styles`
--

DROP TABLE IF EXISTS `sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_styles`
--

LOCK TABLES `sort_styles` WRITE;
/*!40000 ALTER TABLE `sort_styles` DISABLE KEYS */;
INSERT INTO `sort_styles` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_collections`
--

DROP TABLE IF EXISTS `special_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_collections`
--

LOCK TABLES `special_collections` WRITE;
/*!40000 ALTER TABLE `special_collections` DISABLE KEYS */;
INSERT INTO `special_collections` VALUES (1,'Focus'),(2,'Watch');
/*!40000 ALTER TABLE `special_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Generic status table designed to be used in several places. Now only used in harvest_event tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_id` varchar(255) DEFAULT NULL,
  `user_response` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responses`
--

LOCK TABLES `survey_responses` WRITE;
/*!40000 ALTER TABLE `survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonym_relations`
--

DROP TABLE IF EXISTS `synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_relations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonym_relations`
--

LOCK TABLES `synonym_relations` WRITE;
/*!40000 ALTER TABLE `synonym_relations` DISABLE KEYS */;
INSERT INTO `synonym_relations` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49);
/*!40000 ALTER TABLE `synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_id` int(10) unsigned NOT NULL,
  `synonym_relation_id` tinyint(3) unsigned NOT NULL COMMENT 'the relationship this synonym has with the preferred name for this node',
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'generally only set when the synonym is a common name',
  `hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'associated node in the hierarchy',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'set to 1 if this is a common name and is the preferred common name for the node in its language',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'this is redundant as it can be found via the synonym''s hierarchy_entry. I think its here for legacy reasons, but we can probably get rid of it',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `taxon_remarks` text,
  `identifier` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_names` (`name_id`,`synonym_relation_id`,`language_id`,`hierarchy_entry_id`,`hierarchy_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used to assigned taxonomic synonyms and common names to hierarchy entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (1,2,1,5,2,1,5,2,1,NULL,NULL),(2,3,2,1,2,1,5,2,1,NULL,NULL),(3,4,1,5,3,1,5,2,1,NULL,NULL),(4,5,2,1,3,1,5,2,1,NULL,NULL),(5,6,1,5,4,1,5,2,1,NULL,NULL),(6,7,2,1,4,1,5,2,1,NULL,NULL),(7,8,1,5,5,1,5,2,1,NULL,NULL),(8,9,2,1,5,1,5,2,1,NULL,NULL),(9,10,1,5,6,1,5,2,1,NULL,NULL),(10,11,2,1,6,1,5,2,1,NULL,NULL),(11,12,1,5,7,1,5,2,1,NULL,NULL),(12,13,2,1,7,1,5,2,1,NULL,NULL),(13,14,1,5,8,1,5,2,1,NULL,NULL),(14,15,2,1,8,1,5,2,1,NULL,NULL),(15,16,2,1,8,0,5,2,1,NULL,NULL),(16,17,2,1,8,0,5,2,1,NULL,NULL),(17,18,2,1,8,0,5,2,1,NULL,NULL),(18,19,2,1,8,0,5,2,1,NULL,NULL),(19,20,2,1,8,0,5,2,1,NULL,NULL),(20,21,1,5,9,1,5,2,1,NULL,NULL),(21,11,2,1,9,1,5,2,1,NULL,NULL),(22,22,1,5,10,1,5,2,1,NULL,NULL),(23,23,1,5,11,1,5,2,1,NULL,NULL),(24,24,2,1,11,1,5,2,1,NULL,NULL),(25,26,2,1,12,1,5,2,1,NULL,NULL),(26,25,1,5,12,1,5,2,1,NULL,NULL),(27,27,1,5,13,1,5,2,1,NULL,NULL),(28,31,2,1,17,1,5,2,1,NULL,NULL),(29,32,2,1,17,0,5,2,1,NULL,NULL),(30,33,2,1,17,0,5,2,1,NULL,NULL),(31,30,1,5,17,1,5,2,1,NULL,NULL),(32,35,2,1,24,1,5,2,1,NULL,NULL),(33,34,1,5,24,1,5,2,1,NULL,NULL),(34,39,2,1,26,1,5,2,1,NULL,NULL),(35,38,1,5,26,1,5,2,1,NULL,NULL),(36,41,2,1,27,1,5,2,1,NULL,NULL),(37,40,1,5,27,1,5,2,1,NULL,NULL),(38,43,2,1,28,1,5,2,1,NULL,NULL),(39,42,1,5,28,1,5,2,1,NULL,NULL),(40,45,2,1,29,1,5,2,1,NULL,NULL),(41,44,1,5,29,1,5,2,1,NULL,NULL),(42,47,2,1,30,1,5,2,1,NULL,NULL),(43,46,1,5,30,1,5,2,1,NULL,NULL),(44,49,2,1,31,1,5,2,1,NULL,NULL),(45,48,1,5,31,1,5,2,1,NULL,NULL),(46,51,2,1,32,1,5,2,1,NULL,NULL),(47,50,1,5,32,1,5,2,1,NULL,NULL),(48,53,2,1,33,1,5,2,1,NULL,NULL),(49,52,1,5,33,1,5,2,1,NULL,NULL),(50,54,1,5,34,1,5,2,1,NULL,NULL),(51,55,2,1,34,1,5,2,1,NULL,NULL),(52,56,2,1,34,0,5,2,1,NULL,NULL),(53,57,2,1,34,0,5,2,1,NULL,NULL),(54,58,2,1,34,0,5,2,1,NULL,NULL),(55,59,2,7,34,1,5,2,1,NULL,NULL),(56,60,2,7,34,0,5,2,1,NULL,NULL),(57,61,2,7,34,0,5,2,1,NULL,NULL),(58,62,2,2,34,1,5,2,1,NULL,NULL),(59,63,2,2,34,0,5,2,1,NULL,NULL),(60,64,2,2,34,0,5,2,1,NULL,NULL),(61,65,1,5,34,0,5,2,1,NULL,NULL),(62,67,2,1,35,1,5,2,1,NULL,NULL),(63,66,1,5,35,1,5,2,1,NULL,NULL),(64,69,2,1,36,1,5,2,1,NULL,NULL),(65,68,1,5,36,1,5,2,1,NULL,NULL),(66,71,2,1,37,1,5,2,1,NULL,NULL),(67,70,1,5,37,1,5,2,1,NULL,NULL),(68,73,2,1,38,1,5,2,1,NULL,NULL),(69,72,1,5,38,1,5,2,1,NULL,NULL);
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_of_contents`
--

DROP TABLE IF EXISTS `table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_of_contents` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL COMMENT 'refers to the parent taxon_of_contents id. Our table of content is only two levels deep',
  `view_order` smallint(5) unsigned DEFAULT '0' COMMENT 'used to organize the view of the table of contents on the species page in order of priority, not alphabetically',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_of_contents`
--

LOCK TABLES `table_of_contents` WRITE;
/*!40000 ALTER TABLE `table_of_contents` DISABLE KEYS */;
INSERT INTO `table_of_contents` VALUES (1,0,1),(2,1,2),(3,5,39),(4,0,3),(5,0,4),(6,5,5),(7,0,6),(8,7,7),(9,0,8),(10,5,9),(11,0,50),(12,11,51),(13,11,52),(14,11,53),(15,0,57),(16,15,58),(17,0,61),(18,0,62),(19,0,70),(20,19,71),(21,0,58),(22,18,65),(23,18,66),(24,18,67),(25,0,68),(26,25,69),(27,25,70),(28,5,41),(29,0,77),(30,0,78),(31,0,57),(32,0,80),(33,5,43),(34,0,56),(35,0,83),(36,0,84),(37,0,85),(38,0,59),(39,5,40),(40,5,42),(41,5,44),(42,5,45),(43,5,46),(44,5,47),(45,5,48),(46,5,49),(47,5,50),(48,5,51),(49,5,52),(50,5,53),(51,0,55),(52,38,60),(53,38,61),(54,38,62),(55,38,63),(56,38,64),(57,38,65),(58,38,66),(59,0,65);
/*!40000 ALTER TABLE `table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_classifications_locks`
--

DROP TABLE IF EXISTS `taxon_classifications_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_classifications_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_classifications_locks`
--

LOCK TABLES `taxon_classifications_locks` WRITE;
/*!40000 ALTER TABLE `taxon_classifications_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_classifications_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_content`
--

DROP TABLE IF EXISTS `taxon_concept_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_content` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_content`
--

LOCK TABLES `taxon_concept_content` WRITE;
/*!40000 ALTER TABLE `taxon_concept_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_exemplar_articles`
--

DROP TABLE IF EXISTS `taxon_concept_exemplar_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_exemplar_articles` (
  `taxon_concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_exemplar_articles`
--

LOCK TABLES `taxon_concept_exemplar_articles` WRITE;
/*!40000 ALTER TABLE `taxon_concept_exemplar_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_exemplar_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_exemplar_images`
--

DROP TABLE IF EXISTS `taxon_concept_exemplar_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_exemplar_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_exemplar_images`
--

LOCK TABLES `taxon_concept_exemplar_images` WRITE;
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` DISABLE KEYS */;
INSERT INTO `taxon_concept_exemplar_images` VALUES (7,2),(8,11),(9,20),(10,29),(11,38),(12,47),(16,66),(18,92),(20,101),(21,110),(22,119),(23,128),(24,137),(25,146),(26,155),(27,164),(28,173),(29,182),(30,191),(31,200),(32,209),(33,218),(34,227);
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_metrics`
--

DROP TABLE IF EXISTS `taxon_concept_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_metrics` (
  `taxon_concept_id` int(11) NOT NULL DEFAULT '0',
  `image_total` mediumint(9) DEFAULT NULL,
  `image_trusted` mediumint(9) DEFAULT NULL,
  `image_untrusted` mediumint(9) DEFAULT NULL,
  `image_unreviewed` mediumint(9) DEFAULT NULL,
  `image_total_words` mediumint(9) DEFAULT NULL,
  `image_trusted_words` mediumint(9) DEFAULT NULL,
  `image_untrusted_words` mediumint(9) DEFAULT NULL,
  `image_unreviewed_words` mediumint(9) DEFAULT NULL,
  `text_total` mediumint(9) DEFAULT NULL,
  `text_trusted` mediumint(9) DEFAULT NULL,
  `text_untrusted` mediumint(9) DEFAULT NULL,
  `text_unreviewed` mediumint(9) DEFAULT NULL,
  `text_total_words` mediumint(9) DEFAULT NULL,
  `text_trusted_words` mediumint(9) DEFAULT NULL,
  `text_untrusted_words` mediumint(9) DEFAULT NULL,
  `text_unreviewed_words` mediumint(9) DEFAULT NULL,
  `video_total` mediumint(9) DEFAULT NULL,
  `video_trusted` mediumint(9) DEFAULT NULL,
  `video_untrusted` mediumint(9) DEFAULT NULL,
  `video_unreviewed` mediumint(9) DEFAULT NULL,
  `video_total_words` mediumint(9) DEFAULT NULL,
  `video_trusted_words` mediumint(9) DEFAULT NULL,
  `video_untrusted_words` mediumint(9) DEFAULT NULL,
  `video_unreviewed_words` mediumint(9) DEFAULT NULL,
  `sound_total` mediumint(9) DEFAULT NULL,
  `sound_trusted` mediumint(9) DEFAULT NULL,
  `sound_untrusted` mediumint(9) DEFAULT NULL,
  `sound_unreviewed` mediumint(9) DEFAULT NULL,
  `sound_total_words` mediumint(9) DEFAULT NULL,
  `sound_trusted_words` mediumint(9) DEFAULT NULL,
  `sound_untrusted_words` mediumint(9) DEFAULT NULL,
  `sound_unreviewed_words` mediumint(9) DEFAULT NULL,
  `flash_total` mediumint(9) DEFAULT NULL,
  `flash_trusted` mediumint(9) DEFAULT NULL,
  `flash_untrusted` mediumint(9) DEFAULT NULL,
  `flash_unreviewed` mediumint(9) DEFAULT NULL,
  `flash_total_words` mediumint(9) DEFAULT NULL,
  `flash_trusted_words` mediumint(9) DEFAULT NULL,
  `flash_untrusted_words` mediumint(9) DEFAULT NULL,
  `flash_unreviewed_words` mediumint(9) DEFAULT NULL,
  `youtube_total` mediumint(9) DEFAULT NULL,
  `youtube_trusted` mediumint(9) DEFAULT NULL,
  `youtube_untrusted` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed` mediumint(9) DEFAULT NULL,
  `youtube_total_words` mediumint(9) DEFAULT NULL,
  `youtube_trusted_words` mediumint(9) DEFAULT NULL,
  `youtube_untrusted_words` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed_words` mediumint(9) DEFAULT NULL,
  `iucn_total` tinyint(3) DEFAULT NULL,
  `iucn_trusted` tinyint(3) DEFAULT NULL,
  `iucn_untrusted` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed` tinyint(3) DEFAULT NULL,
  `iucn_total_words` tinyint(3) DEFAULT NULL,
  `iucn_trusted_words` tinyint(3) DEFAULT NULL,
  `iucn_untrusted_words` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed_words` tinyint(3) DEFAULT NULL,
  `data_object_references` smallint(6) DEFAULT NULL,
  `info_items` smallint(6) DEFAULT NULL,
  `BHL_publications` smallint(6) DEFAULT NULL,
  `content_partners` smallint(6) DEFAULT NULL,
  `outlinks` smallint(6) DEFAULT NULL,
  `has_GBIF_map` tinyint(1) DEFAULT NULL,
  `has_biomedical_terms` tinyint(1) DEFAULT NULL,
  `user_submitted_text` smallint(6) DEFAULT NULL,
  `submitted_text_providers` smallint(6) DEFAULT NULL,
  `common_names` smallint(6) DEFAULT NULL,
  `common_name_providers` smallint(6) DEFAULT NULL,
  `synonyms` smallint(6) DEFAULT NULL,
  `synonym_providers` smallint(6) DEFAULT NULL,
  `page_views` mediumint(9) DEFAULT NULL,
  `unique_page_views` mediumint(9) DEFAULT NULL,
  `richness_score` float DEFAULT NULL,
  `map_total` mediumint(9) DEFAULT NULL,
  `map_trusted` mediumint(9) DEFAULT NULL,
  `map_untrusted` mediumint(9) DEFAULT NULL,
  `map_unreviewed` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_metrics`
--

LOCK TABLES `taxon_concept_metrics` WRITE;
/*!40000 ALTER TABLE `taxon_concept_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_names`
--

DROP TABLE IF EXISTS `taxon_concept_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_names` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  `source_hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'recommended; if the name came from a certain hierarchy entry or its associated synonyms, the id of the entry will be listed here. This can be used to track down the source or attribution for a given name',
  `language_id` int(10) unsigned NOT NULL,
  `vern` tinyint(3) unsigned NOT NULL COMMENT 'boolean; if this is a common name, set this field to 1',
  `preferred` tinyint(3) unsigned NOT NULL,
  `synonym_id` int(11) NOT NULL DEFAULT '0',
  `vetted_id` int(11) DEFAULT '0',
  PRIMARY KEY (`taxon_concept_id`,`name_id`,`source_hierarchy_entry_id`,`language_id`,`synonym_id`),
  KEY `vern` (`vern`),
  KEY `name_id` (`name_id`),
  KEY `source_hierarchy_entry_id` (`source_hierarchy_entry_id`),
  KEY `index_taxon_concept_names_on_synonym_id` (`synonym_id`),
  KEY `index_for_load_common_names_in_bulk` (`taxon_concept_id`,`name_id`,`source_hierarchy_entry_id`,`language_id`,`vern`,`preferred`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_names`
--

LOCK TABLES `taxon_concept_names` WRITE;
/*!40000 ALTER TABLE `taxon_concept_names` DISABLE KEYS */;
INSERT INTO `taxon_concept_names` VALUES (7,2,2,5,0,1,1,2),(7,3,2,1,1,1,2,2),(7,36,25,5,0,1,0,1),(7,37,25,1,1,1,0,1),(8,4,3,5,0,1,3,2),(8,5,3,1,1,1,4,2),(9,6,4,5,0,1,5,2),(9,7,4,1,1,1,6,2),(10,8,5,5,0,1,7,2),(10,9,5,1,1,1,8,2),(11,10,6,5,0,1,9,2),(11,11,6,1,1,1,10,2),(12,12,7,5,0,1,11,2),(12,13,7,1,1,1,12,2),(13,14,8,5,0,1,13,2),(13,15,8,1,1,1,14,2),(13,16,8,1,1,0,15,2),(13,17,8,1,1,0,16,2),(13,18,8,1,1,0,17,2),(13,19,8,1,1,0,18,2),(13,20,8,1,1,0,19,2),(14,11,9,1,1,1,21,2),(14,21,9,5,0,1,20,2),(15,22,10,5,0,1,22,2),(16,23,11,5,0,1,23,2),(16,24,11,1,1,1,24,2),(17,25,12,5,0,1,26,2),(17,26,12,1,1,1,25,2),(18,27,13,5,0,1,27,2),(20,30,17,5,0,1,31,2),(20,31,17,1,1,1,28,2),(20,32,17,1,1,0,29,2),(20,33,17,1,1,0,30,2),(21,34,24,5,0,1,33,2),(21,35,24,1,1,1,32,2),(22,38,26,5,0,1,35,2),(22,39,26,1,1,1,34,2),(23,40,27,5,0,1,37,2),(23,41,27,1,1,1,36,2),(24,42,28,5,0,1,39,2),(24,43,28,1,1,1,38,2),(25,44,29,5,0,1,41,2),(25,45,29,1,1,1,40,2),(26,46,30,5,0,1,43,2),(26,47,30,1,1,1,42,2),(27,48,31,5,0,1,45,2),(27,49,31,1,1,1,44,2),(28,50,32,5,0,1,47,2),(28,51,32,1,1,1,46,2),(29,52,33,5,0,1,49,2),(29,53,33,1,1,1,48,2),(30,54,34,5,0,1,50,2),(30,55,34,1,1,1,51,2),(30,56,34,1,1,0,52,2),(30,57,34,1,1,0,53,2),(30,58,34,1,1,0,54,2),(30,59,34,7,1,1,55,2),(30,60,34,7,1,0,56,2),(30,61,34,7,1,0,57,2),(30,62,34,2,1,1,58,2),(30,63,34,2,1,0,59,2),(30,64,34,2,1,0,60,2),(30,65,34,5,0,0,61,2),(31,66,35,5,0,1,63,2),(31,67,35,1,1,1,62,2),(32,68,36,5,0,1,65,2),(32,69,36,1,1,1,64,2),(33,70,37,5,0,1,67,2),(33,71,37,1,1,1,66,2),(34,72,38,5,0,1,69,2),(34,73,38,1,1,1,68,2);
/*!40000 ALTER TABLE `taxon_concept_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_preferred_entries`
--

DROP TABLE IF EXISTS `taxon_concept_preferred_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_preferred_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_preferred_entries`
--

LOCK TABLES `taxon_concept_preferred_entries` WRITE;
/*!40000 ALTER TABLE `taxon_concept_preferred_entries` DISABLE KEYS */;
INSERT INTO `taxon_concept_preferred_entries` VALUES (40,7,2,'2015-05-19 10:58:16'),(41,8,3,'2015-05-19 10:58:16'),(39,9,4,'2015-05-19 10:58:16'),(34,10,5,'2015-05-19 10:58:15'),(35,11,6,'2015-05-19 10:58:15'),(37,12,7,'2015-05-19 10:58:15'),(7,13,8,'2014-12-08 10:19:24'),(8,14,9,'2014-12-08 10:19:24'),(9,15,10,'2014-12-08 10:19:25'),(33,16,11,'2015-05-19 10:58:15'),(11,17,12,'2014-12-08 10:19:29'),(43,18,13,'2015-05-19 10:58:16'),(36,20,17,'2015-05-19 10:58:15'),(38,21,24,'2015-05-19 10:58:16'),(42,22,26,'2015-05-19 10:58:16'),(67,23,27,'2015-05-21 11:58:27'),(66,24,28,'2015-05-21 11:58:27'),(68,25,29,'2015-05-21 11:58:27'),(69,26,30,'2015-05-21 11:58:27'),(52,27,31,'2015-05-21 11:44:46'),(53,28,32,'2015-05-21 11:44:46'),(54,29,33,'2015-05-21 11:44:46'),(29,30,34,'2015-05-19 06:48:39'),(55,31,35,'2015-05-21 11:44:46'),(60,32,36,'2015-05-21 11:51:43'),(65,33,37,'2015-05-21 11:54:31'),(27,34,38,'2014-12-08 10:20:07');
/*!40000 ALTER TABLE `taxon_concept_preferred_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_stats`
--

DROP TABLE IF EXISTS `taxon_concept_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_stats`
--

LOCK TABLES `taxon_concept_stats` WRITE;
/*!40000 ALTER TABLE `taxon_concept_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts`
--

DROP TABLE IF EXISTS `taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supercedure_id` int(10) unsigned NOT NULL COMMENT 'if concepts are at first thought to be distinct, there will be two concepts with two different ids. When they are confirmed to be the same one will be superceded by the other, and that replacement is kept track of so that older URLs can be redirected to the proper ids',
  `split_from` int(10) unsigned NOT NULL,
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from untrusted resources and are left untrusted until the resources become trusted',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from resource left unpublished until the resource becomes published',
  PRIMARY KEY (`id`),
  KEY `supercedure_id` (`supercedure_id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='This table is poorly named. Used to group similar hierarchy entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts`
--

LOCK TABLES `taxon_concepts` WRITE;
/*!40000 ALTER TABLE `taxon_concepts` DISABLE KEYS */;
INSERT INTO `taxon_concepts` VALUES (1,0,0,0,1),(7,0,0,1,1),(8,0,0,1,1),(9,0,0,1,1),(10,0,0,1,1),(11,0,0,1,1),(12,0,0,1,1),(13,0,0,3,1),(14,0,0,2,1),(15,0,0,1,1),(16,0,0,1,1),(17,0,0,1,1),(18,0,0,1,1),(19,0,0,0,1),(20,0,0,1,1),(21,0,0,1,1),(22,0,0,1,1),(23,0,0,1,1),(24,0,0,1,1),(25,0,0,1,1),(26,0,0,1,1),(27,0,0,1,1),(28,0,0,1,1),(29,0,0,1,1),(30,0,0,1,1),(31,0,0,1,1),(32,0,0,1,1),(33,0,0,1,1),(34,0,0,1,1);
/*!40000 ALTER TABLE `taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts_flattened`
--

DROP TABLE IF EXISTS `taxon_concepts_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts_flattened` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts_flattened`
--

LOCK TABLES `taxon_concepts_flattened` WRITE;
/*!40000 ALTER TABLE `taxon_concepts_flattened` DISABLE KEYS */;
INSERT INTO `taxon_concepts_flattened` VALUES (7,21),(8,0),(9,7),(9,8),(10,7),(10,8),(10,9),(12,11),(13,11),(14,11),(15,11),(16,11),(17,11),(22,7),(22,21),(23,7),(23,21),(24,7),(24,21),(24,23),(25,7),(25,21),(25,23),(26,7),(26,21),(26,23),(26,25),(27,7),(27,21),(27,23),(27,25),(28,7),(28,21),(28,23),(28,25),(28,27),(29,7),(29,21),(29,23),(29,25),(29,27),(31,30),(32,30),(32,31),(33,30),(33,31),(33,32),(34,30),(34,31),(34,32),(34,33);
/*!40000 ALTER TABLE `taxon_concepts_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_data_exemplars`
--

DROP TABLE IF EXISTS `taxon_data_exemplars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_data_exemplars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `data_point_uri_id` int(11) DEFAULT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_taxon_data_exemplars_on_taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_data_exemplars`
--

LOCK TABLES `taxon_data_exemplars` WRITE;
/*!40000 ALTER TABLE `taxon_data_exemplars` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_data_exemplars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_items`
--

DROP TABLE IF EXISTS `title_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publication_title_id` int(10) unsigned NOT NULL,
  `bar_code` varchar(50) NOT NULL,
  `marc_item_id` varchar(50) NOT NULL,
  `call_number` varchar(100) NOT NULL,
  `volume_info` varchar(100) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'url for the description page for this item',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Publications can have different volumes, versions, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_items`
--

LOCK TABLES `title_items` WRITE;
/*!40000 ALTER TABLE `title_items` DISABLE KEYS */;
INSERT INTO `title_items` VALUES (1,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(2,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(3,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(4,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(5,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(6,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(7,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(8,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(9,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(10,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(11,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(12,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(13,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(14,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(15,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(16,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(17,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(18,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(19,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(20,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(21,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(22,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(23,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(24,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(25,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(26,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(27,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(28,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(29,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(30,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(31,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(32,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(33,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(34,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(35,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(36,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(37,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(38,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(39,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(40,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(41,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(42,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(43,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(44,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(45,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(46,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(47,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(48,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(49,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(50,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(51,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(52,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(53,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(54,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(55,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(56,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(57,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(58,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(59,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(60,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(61,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(62,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(63,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(64,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(65,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(66,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(67,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(68,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(69,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting');
/*!40000 ALTER TABLE `title_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_concept_images`
--

DROP TABLE IF EXISTS `top_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_concept_images`
--

LOCK TABLES `top_concept_images` WRITE;
/*!40000 ALTER TABLE `top_concept_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_images`
--

DROP TABLE IF EXISTS `top_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierarchy entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_images`
--

LOCK TABLES `top_images` WRITE;
/*!40000 ALTER TABLE `top_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_species_images`
--

DROP TABLE IF EXISTS `top_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierarchy entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_species_images`
--

LOCK TABLES `top_species_images` WRITE;
/*!40000 ALTER TABLE `top_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_concept_images`
--

DROP TABLE IF EXISTS `top_unpublished_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_concept_images`
--

LOCK TABLES `top_unpublished_concept_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_concept_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_images`
--

DROP TABLE IF EXISTS `top_unpublished_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for curators and content partners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_images`
--

LOCK TABLES `top_unpublished_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_species_images`
--

DROP TABLE IF EXISTS `top_unpublished_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for curators and content partners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_species_images`
--

LOCK TABLES `top_unpublished_species_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_agent_roles`
--

DROP TABLE IF EXISTS `translated_agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_agent_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_role_id` (`agent_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_agent_roles`
--

LOCK TABLES `translated_agent_roles` WRITE;
/*!40000 ALTER TABLE `translated_agent_roles` DISABLE KEYS */;
INSERT INTO `translated_agent_roles` VALUES (1,1,1,'Author',NULL),(2,2,1,'Source',NULL),(3,3,1,'Source Database',NULL),(4,4,1,'Contributor',NULL),(5,5,1,'Photographer',NULL),(6,6,1,'Editor',NULL),(7,7,1,'provider',NULL),(8,8,1,'Animator',NULL),(9,9,1,'Compiler',NULL),(10,10,1,'Composer',NULL),(11,11,1,'Creator',NULL),(12,12,1,'Director',NULL),(13,13,1,'Illustrator',NULL),(14,14,1,'Project',NULL),(15,15,1,'Publisher',NULL),(16,16,1,'Recorder',NULL),(17,17,1,'Contact Person',NULL),(18,18,1,'writer',NULL);
/*!40000 ALTER TABLE `translated_agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_audiences`
--

DROP TABLE IF EXISTS `translated_audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_id` (`audience_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_audiences`
--

LOCK TABLES `translated_audiences` WRITE;
/*!40000 ALTER TABLE `translated_audiences` DISABLE KEYS */;
INSERT INTO `translated_audiences` VALUES (1,1,1,'Children',NULL),(2,2,1,'Expert users',NULL),(3,3,1,'General public',NULL);
/*!40000 ALTER TABLE `translated_audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_collection_types`
--

DROP TABLE IF EXISTS `translated_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_collection_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_type_id` (`collection_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_collection_types`
--

LOCK TABLES `translated_collection_types` WRITE;
/*!40000 ALTER TABLE `translated_collection_types` DISABLE KEYS */;
INSERT INTO `translated_collection_types` VALUES (1,1,1,'Links',NULL),(2,2,1,'Literature',NULL),(3,3,1,'Images',NULL),(4,4,1,'Specimen',NULL),(5,5,1,'Natural',NULL),(6,6,1,'Species Pages',NULL),(7,7,1,'Molecular',NULL),(8,8,1,'Novice',NULL),(9,9,1,'Expert',NULL),(10,10,1,'Marine',NULL),(11,11,1,'Bugs',NULL);
/*!40000 ALTER TABLE `translated_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_roles`
--

DROP TABLE IF EXISTS `translated_contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_contact_role_id` (`contact_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_roles`
--

LOCK TABLES `translated_contact_roles` WRITE;
/*!40000 ALTER TABLE `translated_contact_roles` DISABLE KEYS */;
INSERT INTO `translated_contact_roles` VALUES (1,1,1,'Primary Contact',NULL),(2,2,1,'Administrative Contact',NULL),(3,3,1,'Technical Contact',NULL);
/*!40000 ALTER TABLE `translated_contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_subjects`
--

DROP TABLE IF EXISTS `translated_contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `phonetic_action_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_subject_id` (`contact_subject_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_subjects`
--

LOCK TABLES `translated_contact_subjects` WRITE;
/*!40000 ALTER TABLE `translated_contact_subjects` DISABLE KEYS */;
INSERT INTO `translated_contact_subjects` VALUES (1,1,1,'Membership and registration',NULL),(2,2,1,'Terms of use and licensing',NULL),(3,3,1,'Learning and education',NULL),(4,4,1,'Become a content partner',NULL),(5,5,1,'Content partner support',NULL),(6,6,1,'Curator support',NULL),(7,7,1,'Make a correction (spelling and grammar, images, information)',NULL),(8,8,1,'Contribute images, videos or sounds',NULL),(9,9,1,'Media requests (interviews, press inquiries, logo requests)',NULL),(10,10,1,'Make a financial donation',NULL),(11,11,1,'Technical questions (problems with search, website functionality)',NULL),(12,12,1,'General feedback',NULL);
/*!40000 ALTER TABLE `translated_contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_page_archives`
--

DROP TABLE IF EXISTS `translated_content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translated_content_page_id` int(11) DEFAULT NULL,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `original_creation_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_page_archives`
--

LOCK TABLES `translated_content_page_archives` WRITE;
/*!40000 ALTER TABLE `translated_content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_pages`
--

DROP TABLE IF EXISTS `translated_content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active_translation` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_page_id` (`content_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_pages`
--

LOCK TABLES `translated_content_pages` WRITE;
/*!40000 ALTER TABLE `translated_content_pages` DISABLE KEYS */;
INSERT INTO `translated_content_pages` VALUES (1,1,1,'Home','<h3>This is Left Content in a Home</h3>','<h1>Main Content for Home ROCKS!</h1>','keywords for Home','description for Home','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(2,2,1,'Who We Are','<h3>This is Left Content in a Who We Are</h3>','<h1>Main Content for Who We Are ROCKS!</h1>','keywords for Who We Are','description for Who We Are','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(3,3,1,'Working Groups','<h3>This is Left Content in a Working Groups</h3>','<h1>Main Content for Working Groups ROCKS!</h1>','keywords for Working Groups','description for Working Groups','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(4,4,1,'Working Group A','<h3>This is Left Content in a Working Group A</h3>','<h1>Main Content for Working Group A ROCKS!</h1>','keywords for Working Group A','description for Working Group A','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(5,5,1,'Working Group B','<h3>This is Left Content in a Working Group B</h3>','<h1>Main Content for Working Group B ROCKS!</h1>','keywords for Working Group B','description for Working Group B','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(6,6,1,'Working Group C','<h3>This is Left Content in a Working Group C</h3>','<h1>Main Content for Working Group C ROCKS!</h1>','keywords for Working Group C','description for Working Group C','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(7,7,1,'Working Group D','<h3>This is Left Content in a Working Group D</h3>','<h1>Main Content for Working Group D ROCKS!</h1>','keywords for Working Group D','description for Working Group D','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(8,8,1,'Working Group E','<h3>This is Left Content in a Working Group E</h3>','<h1>Main Content for Working Group E ROCKS!</h1>','keywords for Working Group E','description for Working Group E','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(9,9,1,'Contact Us','<h3>This is Left Content in a Contact Us</h3>','<h1>Main Content for Contact Us ROCKS!</h1>','keywords for Contact Us','description for Contact Us','2014-12-08 12:18:49','2014-12-08 12:18:49',1),(10,10,1,'Screencasts','<h3>This is Left Content in a Screencasts</h3>','<h1>Main Content for Screencasts ROCKS!</h1>','keywords for Screencasts','description for Screencasts','2014-12-08 12:18:50','2014-12-08 12:18:50',1),(11,11,1,'Press Releases','<h3>This is Left Content in a Press Releases</h3>','<h1>Main Content for Press Releases ROCKS!</h1>','keywords for Press Releases','description for Press Releases','2014-12-08 12:18:50','2014-12-08 12:18:50',1),(12,12,1,'Terms of Use','<h3>This is Left Content in a Terms of Use</h3>','<h1>Main Content for Terms of Use ROCKS!</h1>','keywords for Terms of Use','description for Terms of Use','2014-12-08 12:18:50','2014-12-08 12:18:50',1),(13,13,1,'Curator central','','<h1>Main Content for Curator central ROCKS!</h1>','keywords for Curator central','description for Curator central','2014-12-08 12:19:40','2014-12-08 12:19:40',1);
/*!40000 ALTER TABLE `translated_content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_partner_statuses`
--

DROP TABLE IF EXISTS `translated_content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_partner_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_status_id` (`content_partner_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_partner_statuses`
--

LOCK TABLES `translated_content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `translated_content_partner_statuses` DISABLE KEYS */;
INSERT INTO `translated_content_partner_statuses` VALUES (1,1,1,'Active',NULL),(2,2,1,'Inactive',NULL),(3,3,1,'Archived',NULL),(4,4,1,'Pending',NULL);
/*!40000 ALTER TABLE `translated_content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_tables`
--

DROP TABLE IF EXISTS `translated_content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_table_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_tables`
--

LOCK TABLES `translated_content_tables` WRITE;
/*!40000 ALTER TABLE `translated_content_tables` DISABLE KEYS */;
INSERT INTO `translated_content_tables` VALUES (1,1,1,'Details',''),(2,2,1,'Details','');
/*!40000 ALTER TABLE `translated_content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_data_types`
--

DROP TABLE IF EXISTS `translated_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_data_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_type_id` (`data_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_data_types`
--

LOCK TABLES `translated_data_types` WRITE;
/*!40000 ALTER TABLE `translated_data_types` DISABLE KEYS */;
INSERT INTO `translated_data_types` VALUES (1,1,1,'Text',NULL),(2,2,1,'Image',NULL),(3,3,1,'Sound',NULL),(4,4,1,'Video',NULL),(5,5,1,'GBIF Image',NULL),(6,6,1,'YouTube',NULL),(7,7,1,'Flash',NULL),(8,8,1,'IUCN',NULL),(9,9,1,'Map',NULL),(10,10,1,'Link',NULL);
/*!40000 ALTER TABLE `translated_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_info_items`
--

DROP TABLE IF EXISTS `translated_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_info_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_item_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `info_item_id` (`info_item_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_info_items`
--

LOCK TABLES `translated_info_items` WRITE;
/*!40000 ALTER TABLE `translated_info_items` DISABLE KEYS */;
INSERT INTO `translated_info_items` VALUES (1,1,1,'TaxonBiology',NULL),(2,2,1,'GeneralDescription',NULL),(3,3,1,'Distribution',NULL),(4,4,1,'Habitat',NULL),(5,5,1,'Morphology',NULL),(6,6,1,'Conservation',NULL),(7,7,1,'Uses',NULL),(8,8,1,'Education',NULL),(9,9,1,'Education Resources',NULL),(10,10,1,'IdentificationResources',NULL),(11,11,1,'Wikipedia',NULL),(12,12,1,'Diagnostic Description',NULL),(13,13,1,'Taxonomy',NULL),(14,14,1,'Associations',NULL),(15,15,1,'Behaviour',NULL),(16,16,1,'ConservationStatus',NULL),(17,17,1,'Cyclicity',NULL),(18,18,1,'Cytology',NULL),(19,19,1,'DiagnosticDescription',NULL),(20,20,1,'Diseases',NULL),(21,21,1,'Dispersal',NULL),(22,22,1,'Evolution',NULL),(23,23,1,'Genetics',NULL),(24,24,1,'Growth',NULL),(25,25,1,'Legislation',NULL),(26,26,1,'LifeCycle',NULL),(27,27,1,'LifeExpectancy',NULL),(28,28,1,'LookAlikes',NULL),(29,29,1,'Management',NULL),(30,30,1,'Migration',NULL),(31,31,1,'MolecularBiology',NULL),(32,32,1,'Physiology',NULL),(33,33,1,'PopulationBiology',NULL),(34,34,1,'Procedures',NULL),(35,35,1,'Reproduction',NULL),(36,36,1,'RiskStatement',NULL),(37,37,1,'Size',NULL),(38,38,1,'Threats',NULL),(39,39,1,'Trends',NULL),(40,40,1,'TrophicStrategy',NULL);
/*!40000 ALTER TABLE `translated_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_known_uris`
--

DROP TABLE IF EXISTS `translated_known_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_known_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `known_uri_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `definition` text,
  `comment` text,
  `attribution` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `by_language` (`known_uri_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_known_uris`
--

LOCK TABLES `translated_known_uris` WRITE;
/*!40000 ALTER TABLE `translated_known_uris` DISABLE KEYS */;
INSERT INTO `translated_known_uris` VALUES (1,1,1,'Unit of Measure',NULL,NULL,NULL),(2,2,1,'milligrams',NULL,NULL,NULL),(3,3,1,'grams',NULL,NULL,NULL),(4,4,1,'kilograms',NULL,NULL,NULL),(5,5,1,'millimeters',NULL,NULL,NULL),(6,6,1,'centimeters',NULL,NULL,NULL),(7,7,1,'meters',NULL,NULL,NULL),(8,8,1,'kelvin',NULL,NULL,NULL),(9,9,1,'degrees Celsius',NULL,NULL,NULL),(10,10,1,'days',NULL,NULL,NULL),(11,11,1,'years',NULL,NULL,NULL),(12,12,1,'0.1°C',NULL,NULL,NULL),(13,13,1,'Log10 grams',NULL,NULL,NULL),(14,14,1,'Sex',NULL,NULL,NULL),(15,15,1,'male',NULL,NULL,NULL),(16,16,1,'female',NULL,NULL,NULL),(17,17,1,'Source',NULL,NULL,NULL),(18,18,1,'License',NULL,NULL,NULL),(19,19,1,'Reference',NULL,NULL,NULL);
/*!40000 ALTER TABLE `translated_known_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_languages`
--

DROP TABLE IF EXISTS `translated_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_language_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `original_language_id` (`original_language_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_languages`
--

LOCK TABLES `translated_languages` WRITE;
/*!40000 ALTER TABLE `translated_languages` DISABLE KEYS */;
INSERT INTO `translated_languages` VALUES (1,1,1,'English',NULL),(2,2,1,'French',NULL),(3,3,1,'Spanish',NULL),(4,4,1,'Arabic',NULL),(5,5,1,'Scientific Name',NULL),(6,6,1,'Unknown',NULL),(7,7,1,'German',NULL);
/*!40000 ALTER TABLE `translated_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_licenses`
--

DROP TABLE IF EXISTS `translated_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `description` varchar(400) NOT NULL,
  `phonetic_description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_id` (`license_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_licenses`
--

LOCK TABLES `translated_licenses` WRITE;
/*!40000 ALTER TABLE `translated_licenses` DISABLE KEYS */;
INSERT INTO `translated_licenses` VALUES (1,1,1,'No rights reserved',NULL),(2,2,1,'&#169; All rights reserved',NULL),(3,3,1,'Some rights reserved',NULL),(4,4,1,'Some rights reserved',NULL),(5,5,1,'Some rights reserved',NULL),(6,6,1,'Some rights reserved',NULL),(7,7,1,'Public Domain',NULL),(8,8,1,'No known copyright restrictions',NULL),(9,9,1,'License not applicable',NULL);
/*!40000 ALTER TABLE `translated_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_link_types`
--

DROP TABLE IF EXISTS `translated_link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_link_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_type_id` (`link_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_link_types`
--

LOCK TABLES `translated_link_types` WRITE;
/*!40000 ALTER TABLE `translated_link_types` DISABLE KEYS */;
INSERT INTO `translated_link_types` VALUES (1,1,1,'Blog',NULL),(2,2,1,'News',NULL),(3,3,1,'Organization',NULL),(4,4,1,'Paper',NULL),(5,5,1,'Multimedia',NULL),(6,6,1,'Citizen Science',NULL);
/*!40000 ALTER TABLE `translated_link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_mime_types`
--

DROP TABLE IF EXISTS `translated_mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_mime_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mime_type_id` (`mime_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_mime_types`
--

LOCK TABLES `translated_mime_types` WRITE;
/*!40000 ALTER TABLE `translated_mime_types` DISABLE KEYS */;
INSERT INTO `translated_mime_types` VALUES (1,1,1,'image/jpeg',NULL),(2,2,1,'audio/mpeg',NULL),(3,3,1,'text/html',NULL),(4,4,1,'text/plain',NULL),(5,5,1,'video/x-flv',NULL),(6,6,1,'video/quicktime',NULL),(7,7,1,'audio/x-wav',NULL),(8,8,1,'video/mp4',NULL),(9,9,1,'video/mpeg',NULL),(10,10,1,'audio/x-ms-wma',NULL),(11,11,1,'audio/x-pn-realaudio',NULL),(12,12,1,'audio/x-realaudio',NULL),(13,13,1,'image/bmp',NULL),(14,14,1,'image/gif',NULL),(15,15,1,'image/png',NULL),(16,16,1,'image/svg+xml',NULL),(17,17,1,'image/tiff',NULL),(18,18,1,'text/richtext',NULL),(19,19,1,'text/rtf',NULL),(20,20,1,'text/xml',NULL),(21,21,1,'video/x-ms-wmv',NULL);
/*!40000 ALTER TABLE `translated_mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_news_items`
--

DROP TABLE IF EXISTS `translated_news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_item_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `body` text NOT NULL,
  `title` varchar(255) DEFAULT '',
  `active_translation` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_item_id` (`news_item_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_news_items`
--

LOCK TABLES `translated_news_items` WRITE;
/*!40000 ALTER TABLE `translated_news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_permissions`
--

DROP TABLE IF EXISTS `translated_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_translated_permissions_on_permission_id_and_language_id` (`permission_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_permissions`
--

LOCK TABLES `translated_permissions` WRITE;
/*!40000 ALTER TABLE `translated_permissions` DISABLE KEYS */;
INSERT INTO `translated_permissions` VALUES (1,'edit permissions',1,1),(2,'beta test',1,2),(3,'see data',1,3),(4,'edit cms',1,4);
/*!40000 ALTER TABLE `translated_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_ranks`
--

DROP TABLE IF EXISTS `translated_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank_id` (`rank_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_ranks`
--

LOCK TABLES `translated_ranks` WRITE;
/*!40000 ALTER TABLE `translated_ranks` DISABLE KEYS */;
INSERT INTO `translated_ranks` VALUES (1,1,1,'kingdom',NULL),(2,2,1,'phylum',NULL),(3,3,1,'order',NULL),(4,4,1,'class',NULL),(5,5,1,'family',NULL),(6,6,1,'genus',NULL),(7,7,1,'species',NULL),(8,8,1,'subspecies',NULL),(9,9,1,'infraspecies',NULL),(10,10,1,'variety',NULL),(11,11,1,'form',NULL),(12,20,1,'superkingdom',NULL);
/*!40000 ALTER TABLE `translated_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_resource_statuses`
--

DROP TABLE IF EXISTS `translated_resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_status_id` int(11) NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_status_id` (`resource_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_resource_statuses`
--

LOCK TABLES `translated_resource_statuses` WRITE;
/*!40000 ALTER TABLE `translated_resource_statuses` DISABLE KEYS */;
INSERT INTO `translated_resource_statuses` VALUES (1,1,1,'Uploading',NULL),(2,2,1,'Uploaded',NULL),(3,3,1,'Upload Failed',NULL),(4,4,1,'Moved to Content Server',NULL),(5,5,1,'Validated',NULL),(6,6,1,'Validation Failed',NULL),(7,7,1,'Being Processed',NULL),(8,8,1,'Processed',NULL),(9,9,1,'Processing Failed',NULL),(10,10,1,'Force Harvest',NULL),(11,11,1,'Published',NULL);
/*!40000 ALTER TABLE `translated_resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_service_types`
--

DROP TABLE IF EXISTS `translated_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_type_id` (`service_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_service_types`
--

LOCK TABLES `translated_service_types` WRITE;
/*!40000 ALTER TABLE `translated_service_types` DISABLE KEYS */;
INSERT INTO `translated_service_types` VALUES (1,1,1,'EOL Transfer Schema',NULL);
/*!40000 ALTER TABLE `translated_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_sort_styles`
--

DROP TABLE IF EXISTS `translated_sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `sort_style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_sort_styles`
--

LOCK TABLES `translated_sort_styles` WRITE;
/*!40000 ALTER TABLE `translated_sort_styles` DISABLE KEYS */;
INSERT INTO `translated_sort_styles` VALUES (1,'Recently Added',1,1),(2,'Oldest',1,2),(3,'Alphabetical',1,3),(4,'Reverse Alphabetical',1,4),(5,'Richness',1,5),(6,'Rating',1,6),(7,'Sort Field',1,7),(8,'Reverse Sort Field',1,8);
/*!40000 ALTER TABLE `translated_sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_statuses`
--

DROP TABLE IF EXISTS `translated_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_id` (`status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_statuses`
--

LOCK TABLES `translated_statuses` WRITE;
/*!40000 ALTER TABLE `translated_statuses` DISABLE KEYS */;
INSERT INTO `translated_statuses` VALUES (1,1,1,'Inserted',NULL),(2,2,1,'Unchanged',NULL),(3,3,1,'Updated',NULL);
/*!40000 ALTER TABLE `translated_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_synonym_relations`
--

DROP TABLE IF EXISTS `translated_synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_synonym_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `synonym_relation_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `synonym_relation_id` (`synonym_relation_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_synonym_relations`
--

LOCK TABLES `translated_synonym_relations` WRITE;
/*!40000 ALTER TABLE `translated_synonym_relations` DISABLE KEYS */;
INSERT INTO `translated_synonym_relations` VALUES (1,1,1,'synonym',NULL),(2,2,1,'common name',NULL),(3,3,1,'genbank common name',NULL),(4,4,1,'acronym',NULL),(5,5,1,'anamorph',NULL),(6,6,1,'blast name',NULL),(7,7,1,'equivalent name',NULL),(8,8,1,'genbank acronym',NULL),(9,9,1,'genbank anamorph',NULL),(10,10,1,'genbank synonym',NULL),(11,11,1,'in-part',NULL),(12,12,1,'includes',NULL),(13,13,1,'misnomer',NULL),(14,14,1,'misspelling',NULL),(15,15,1,'teleomorph',NULL),(16,16,1,'ambiguous synonym',NULL),(17,17,1,'misapplied name',NULL),(18,18,1,'provisionally accepted name',NULL),(19,19,1,'accepted name',NULL),(20,20,1,'database artifact',NULL),(21,21,1,'other, see comments',NULL),(22,22,1,'orthographic variant (misspelling)',NULL),(23,23,1,'misapplied',NULL),(24,24,1,'rejected name',NULL),(25,25,1,'homonym (illegitimate)',NULL),(26,26,1,'pro parte',NULL),(27,27,1,'superfluous renaming (illegitimate)',NULL),(28,28,1,'nomen oblitum',NULL),(29,29,1,'junior synonym',NULL),(30,30,1,'unavailable, database artifact',NULL),(31,31,1,'unnecessary replacement',NULL),(32,32,1,'subsequent name/combination',NULL),(33,33,1,'unavailable, literature misspelling',NULL),(34,34,1,'original name/combination',NULL),(35,35,1,'unavailable, incorrect orig. spelling',NULL),(36,36,1,'junior homonym',NULL),(37,37,1,'homonym & junior synonym',NULL),(38,38,1,'unavailable, suppressed by ruling',NULL),(39,39,1,'unjustified emendation',NULL),(40,40,1,'unavailable, other',NULL),(41,41,1,'unavailable, nomen nudum',NULL),(42,42,1,'nomen dubium',NULL),(43,43,1,'invalidly published, other',NULL),(44,44,1,'invalidly published, nomen nudum',NULL),(45,45,1,'basionym',NULL),(46,46,1,'heterotypic synonym',NULL),(47,47,1,'homotypic synonym',NULL),(48,48,1,'unavailable name',NULL),(49,49,1,'valid name',NULL);
/*!40000 ALTER TABLE `translated_synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_table_of_contents`
--

DROP TABLE IF EXISTS `translated_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_table_of_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_of_contents_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_of_contents_id` (`table_of_contents_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_table_of_contents`
--

LOCK TABLES `translated_table_of_contents` WRITE;
/*!40000 ALTER TABLE `translated_table_of_contents` DISABLE KEYS */;
INSERT INTO `translated_table_of_contents` VALUES (1,1,1,'Overview',NULL),(2,2,1,'Brief Summary',NULL),(3,3,1,'Brief Description',NULL),(4,4,1,'Comprehensive Description',NULL),(5,5,1,'Description',NULL),(6,6,1,'Nucleotide Sequences',NULL),(7,7,1,'Ecology and Distribution',NULL),(8,8,1,'Distribution',NULL),(9,9,1,'Wikipedia',NULL),(10,10,1,'Identification Resources',NULL),(11,11,1,'Names and Taxonomy',NULL),(12,12,1,'Related Names',NULL),(13,13,1,'Synonyms',NULL),(14,14,1,'Common Names',NULL),(15,15,1,'Page Statistics',NULL),(16,16,1,'Content Summary',NULL),(17,17,1,'Biodiversity Heritage Library',NULL),(18,18,1,'References and More Information',NULL),(19,19,1,'Citizen Science',NULL),(20,20,1,'Citizen Science Links',NULL),(21,21,1,'Literature References',NULL),(22,22,1,'Content Partners',NULL),(23,23,1,'Biomedical Terms',NULL),(24,24,1,'Search the Web',NULL),(25,25,1,'Education',NULL),(26,26,1,'Education Links',NULL),(27,27,1,'Education Resources',NULL),(28,28,1,'Physical Description',NULL),(29,29,1,'Ecology',NULL),(30,30,1,'Life History and Behavior',NULL),(31,31,1,'Evolution and Systematics',NULL),(32,32,1,'Physiology and Cell Biology',NULL),(33,33,1,'Molecular Biology and Genetics',NULL),(34,34,1,'Conservation',NULL),(35,35,1,'Relevance to Humans and Ecosystems',NULL),(36,36,1,'Notes',NULL),(37,37,1,'Database and Repository Coverage',NULL),(38,38,1,'Relevance',NULL),(39,39,1,'Diagnosis of genus and species',NULL),(40,40,1,'Formal Description',NULL),(41,41,1,'Phenology',NULL),(42,42,1,'Life History',NULL),(43,43,1,'Geographical Distribution',NULL),(44,44,1,'Etymology',NULL),(45,45,1,'Adult Characteristics',NULL),(46,46,1,'Comparison with Similar Species',NULL),(47,47,1,'Host, Oviposition, and Larval Feeding Habits',NULL),(48,48,1,'Type',NULL),(49,49,1,'Characteristics',NULL),(50,50,1,'General Description',NULL),(51,51,1,'Reproductive Behavior',NULL),(52,52,1,'Harmful Blooms',NULL),(53,53,1,'Relation to Humans',NULL),(54,54,1,'Toxicity, Symptoms and Treatment',NULL),(55,55,1,'Cultivation',NULL),(56,56,1,'Culture',NULL),(57,57,1,'Ethnobotany',NULL),(58,58,1,'Suppliers',NULL);
/*!40000 ALTER TABLE `translated_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_untrust_reasons`
--

DROP TABLE IF EXISTS `translated_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `untrust_reason_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `untrust_reason_id` (`untrust_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_untrust_reasons`
--

LOCK TABLES `translated_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `translated_untrust_reasons` DISABLE KEYS */;
INSERT INTO `translated_untrust_reasons` VALUES (1,1,1,'misidentified',NULL),(2,2,1,'incorrect/misleading',NULL),(3,3,1,'low quality',NULL),(4,4,1,'duplicate',NULL);
/*!40000 ALTER TABLE `translated_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_uri_types`
--

DROP TABLE IF EXISTS `translated_uri_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_uri_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `uri_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_uri_types`
--

LOCK TABLES `translated_uri_types` WRITE;
/*!40000 ALTER TABLE `translated_uri_types` DISABLE KEYS */;
INSERT INTO `translated_uri_types` VALUES (1,'measurement',1,1),(2,'association',2,1),(3,'value',3,1),(4,'metadata',4,1),(5,'Unit of Measure',5,1);
/*!40000 ALTER TABLE `translated_uri_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_user_identities`
--

DROP TABLE IF EXISTS `translated_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_user_identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_identity_id` (`user_identity_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_user_identities`
--

LOCK TABLES `translated_user_identities` WRITE;
/*!40000 ALTER TABLE `translated_user_identities` DISABLE KEYS */;
INSERT INTO `translated_user_identities` VALUES (1,1,1,'an enthusiast'),(2,2,1,'a student'),(3,3,1,'an educator'),(4,4,1,'a citizen scientist'),(5,5,1,'a professional scientist');
/*!40000 ALTER TABLE `translated_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_vetted`
--

DROP TABLE IF EXISTS `translated_vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vetted_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vetted_id` (`vetted_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_vetted`
--

LOCK TABLES `translated_vetted` WRITE;
/*!40000 ALTER TABLE `translated_vetted` DISABLE KEYS */;
INSERT INTO `translated_vetted` VALUES (1,1,1,'Trusted',NULL),(2,2,1,'Unknown',NULL),(3,3,1,'Untrusted',NULL),(4,4,1,'Inappropriate',NULL);
/*!40000 ALTER TABLE `translated_vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_view_styles`
--

DROP TABLE IF EXISTS `translated_view_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_view_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `view_style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_view_styles`
--

LOCK TABLES `translated_view_styles` WRITE;
/*!40000 ALTER TABLE `translated_view_styles` DISABLE KEYS */;
INSERT INTO `translated_view_styles` VALUES (1,'List',1,1),(2,'Gallery',1,2),(3,'Annotated',1,3);
/*!40000 ALTER TABLE `translated_view_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_visibilities`
--

DROP TABLE IF EXISTS `translated_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visibility_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visibility_id` (`visibility_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_visibilities`
--

LOCK TABLES `translated_visibilities` WRITE;
/*!40000 ALTER TABLE `translated_visibilities` DISABLE KEYS */;
INSERT INTO `translated_visibilities` VALUES (1,1,1,'Invisible',NULL),(2,2,1,'Visible',NULL),(3,3,1,'Preview',NULL);
/*!40000 ALTER TABLE `translated_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_visitors`
--

DROP TABLE IF EXISTS `unique_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_visitors`
--

LOCK TABLES `unique_visitors` WRITE;
/*!40000 ALTER TABLE `unique_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `unique_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untrust_reasons`
--

DROP TABLE IF EXISTS `untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `class_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untrust_reasons`
--

LOCK TABLES `untrust_reasons` WRITE;
/*!40000 ALTER TABLE `untrust_reasons` DISABLE KEYS */;
INSERT INTO `untrust_reasons` VALUES (1,'2014-12-08 12:18:25','2014-12-08 12:18:58','misidentified'),(2,'2014-12-08 12:18:25','2014-12-08 12:18:58','incorrect'),(3,'2014-12-08 12:18:25','2014-12-08 12:18:58','poor'),(4,'2014-12-08 12:18:25','2014-12-08 12:18:58','duplicate');
/*!40000 ALTER TABLE `untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uri_types`
--

DROP TABLE IF EXISTS `uri_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uri_types`
--

LOCK TABLES `uri_types` WRITE;
/*!40000 ALTER TABLE `uri_types` DISABLE KEYS */;
INSERT INTO `uri_types` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `uri_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_added_data`
--

DROP TABLE IF EXISTS `user_added_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_added_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject_type` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `vetted_id` int(11) DEFAULT '1',
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_added_data`
--

LOCK TABLES `user_added_data` WRITE;
/*!40000 ALTER TABLE `user_added_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_added_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_added_data_metadata`
--

DROP TABLE IF EXISTS `user_added_data_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_added_data_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_added_data_id` int(11) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_added_data_id` (`user_added_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_added_data_metadata`
--

LOCK TABLES `user_added_data_metadata` WRITE;
/*!40000 ALTER TABLE `user_added_data_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_added_data_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_identities`
--

DROP TABLE IF EXISTS `user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_identities` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sort_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_identities`
--

LOCK TABLES `user_identities` WRITE;
/*!40000 ALTER TABLE `user_identities` DISABLE KEYS */;
INSERT INTO `user_identities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areas_of_interest` varchar(255) DEFAULT NULL,
  `heard_of_eol` varchar(128) DEFAULT NULL,
  `interested_in_contributing` tinyint(1) DEFAULT NULL,
  `interested_in_curating` tinyint(1) DEFAULT NULL,
  `interested_in_advisory_forum` tinyint(1) DEFAULT NULL,
  `show_information` tinyint(1) DEFAULT NULL,
  `age_range` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_primary_role_id` int(11) DEFAULT NULL,
  `interested_in_development` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_primary_roles`
--

DROP TABLE IF EXISTS `user_primary_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_primary_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_primary_roles`
--

LOCK TABLES `user_primary_roles` WRITE;
/*!40000 ALTER TABLE `user_primary_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_primary_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_ip` varchar(24) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `hashed_password` varchar(32) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` text,
  `curator_approved` tinyint(1) NOT NULL DEFAULT '0',
  `curator_verdict_by_id` int(11) DEFAULT NULL,
  `curator_verdict_at` datetime DEFAULT NULL,
  `credentials` text NOT NULL,
  `validation_code` varchar(255) DEFAULT '',
  `failed_login_attempts` int(11) DEFAULT '0',
  `curator_scope` text NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `recover_account_token` char(40) DEFAULT NULL,
  `recover_account_token_expires_at` datetime DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  `api_key` char(40) DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `tag_line` varchar(255) DEFAULT NULL,
  `agreed_with_terms` tinyint(1) DEFAULT NULL,
  `bio` text,
  `curator_level_id` int(11) DEFAULT NULL,
  `requested_curator_level_id` int(11) DEFAULT NULL,
  `requested_curator_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `last_notification_at` datetime DEFAULT '2014-12-01 12:18:35',
  `last_message_at` datetime DEFAULT '2014-12-01 12:18:35',
  `disable_email_notifications` tinyint(1) DEFAULT '0',
  `news_in_preferred_language` tinyint(1) DEFAULT '0',
  `number_of_forum_posts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_agent_id` (`agent_id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `index_users_on_created_at` (`created_at`),
  KEY `index_users_on_api_key` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'123.45.67.17','bob1@smith.com','IUCN','Reinger',NULL,'i_reinger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:18:51','2014-12-08 12:18:51',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,1,24,NULL,NULL,NULL,201210030069362,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(2,'123.45.67.12','bob2@smith.com','Janie','Jacobs',NULL,'j_jacobs','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:18:52','2014-12-08 12:18:52',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,2,24,NULL,NULL,NULL,201204220191542,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(3,'123.45.67.12','bob3@smith.com','Helmer','Crona',NULL,'h_crona','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:18:52','2014-12-08 12:18:52',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,4,24,NULL,NULL,NULL,318700,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(4,'123.45.67.18','bob4@smith.com','Ahmad','Murphy',NULL,'foundation_already_loaded','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:03','2014-12-08 12:19:03',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,9,24,NULL,NULL,NULL,201202040069888,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(5,'123.45.67.11','bob5@smith.com','Roxane','Connelly',NULL,'r_connelly','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:07','2014-12-08 12:19:07',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,10,24,NULL,NULL,NULL,201111020692069,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(6,'123.45.67.19','bob6@smith.com','Mariana','Runolfsson',NULL,'m_runolfsson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:08','2014-12-08 12:19:08',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,12,24,NULL,NULL,NULL,201207302359794,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(7,'123.45.67.10','bob7@smith.com','Joshuah','Ernser',NULL,'j_ernser','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:08','2014-12-08 12:19:09',NULL,1,6,'2014-12-06 12:19:08','Curator','',0,'scope',NULL,NULL,NULL,NULL,13,24,NULL,NULL,NULL,201301170225666,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(8,'123.45.67.12','bob8@smith.com','Antonia','Nolan',NULL,'a_nolan','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,14,24,NULL,NULL,NULL,201202110214753,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(9,'123.45.67.18','bob9@smith.com','Eugene','Mosciski',NULL,'e_mosciski','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:12','2014-12-08 12:19:12',NULL,1,8,'2014-12-06 12:19:12','Curator','',0,'scope',NULL,NULL,NULL,NULL,15,24,NULL,NULL,NULL,201201080155483,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(10,'123.45.67.19','bob10@smith.com','Kaitlin','Larkin',NULL,'k_larkin','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:13','2014-12-08 12:19:13',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,16,24,NULL,NULL,NULL,201111021252396,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(11,'123.45.67.14','bob11@smith.com','Otho','Willms',NULL,'o_willms','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:14','2014-12-08 12:19:14',NULL,1,10,'2014-12-06 12:19:14','Curator','',0,'scope',NULL,NULL,NULL,NULL,17,24,NULL,NULL,NULL,201112090080634,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(12,'123.45.67.11','bob12@smith.com','Camila','Deckow',NULL,'c_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,18,24,NULL,NULL,NULL,201111021244952,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(13,'123.45.67.13','bob13@smith.com','Colt','Stracke',NULL,'c_stracke','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:15','2014-12-08 12:19:15',NULL,1,12,'2014-12-06 12:19:15','Curator','',0,'scope',NULL,NULL,NULL,NULL,19,24,NULL,NULL,NULL,201204250072439,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(14,'123.45.67.10','bob14@smith.com','Mathew','Deckow',NULL,'m_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,20,24,NULL,NULL,NULL,201111021075853,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(15,'123.45.67.11','bob15@smith.com','Electa','Na',NULL,'e_na','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:17','2014-12-08 12:19:17',NULL,1,14,'2014-12-06 12:19:17','Curator','',0,'scope',NULL,NULL,NULL,NULL,21,24,NULL,NULL,NULL,201111011563090,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(16,'123.45.67.12','bob16@smith.com','Damaris','Torphy',NULL,'d_torphy','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,22,24,NULL,NULL,NULL,201202160129393,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(17,'123.45.67.10','bob17@smith.com','Aidan','Mills',NULL,'a_mills','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:19','2014-12-08 12:19:19',NULL,1,16,'2014-12-06 12:19:19','Curator','',0,'scope',NULL,NULL,NULL,NULL,23,24,NULL,NULL,NULL,201206220152592,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(18,'123.45.67.11','bob17@smith.com','Dora','Pollich',NULL,'d_pollich','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:22','2014-12-08 12:19:22',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,24,24,NULL,NULL,NULL,201112270143930,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(19,'123.45.67.18','bob18@smith.com','Emmanuelle','Beatty',NULL,'e_beatty','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,25,24,NULL,NULL,NULL,201111012383579,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(20,'123.45.67.10','bob19@smith.com','Sam','Hettinger',NULL,'s_hettinger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,1,19,'2014-12-06 12:19:24','Curator','',0,'scope',NULL,NULL,NULL,NULL,26,24,NULL,NULL,NULL,201207260783649,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(21,'123.45.67.19','bob20@smith.com','Betty','Okuneva',NULL,'b_okuneva','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:24','2014-12-08 12:19:24',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,27,24,NULL,NULL,NULL,201111012169032,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(22,'123.45.67.17','bob21@smith.com','Reuben','Olson',NULL,'r_olson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:24','2014-12-08 12:19:25',NULL,1,21,'2014-12-06 12:19:24','Curator','',0,'scope',NULL,NULL,NULL,NULL,28,24,NULL,NULL,NULL,201111011158648,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(23,'123.45.67.11','bob22@smith.com','Ashley','West',NULL,'a_west','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,29,24,NULL,NULL,NULL,201111020612441,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(24,'123.45.67.11','bob23@smith.com','Vicente','Schowalter',NULL,'v_schowalter','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,1,23,'2014-12-06 12:19:25','Curator','',0,'scope',NULL,NULL,NULL,NULL,30,24,NULL,NULL,NULL,201211270043984,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(25,'123.45.67.14','bob24@smith.com','Heber','Hill',NULL,'h_hill','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,31,24,NULL,NULL,NULL,201111021029613,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(26,'123.45.67.13','bob25@smith.com','Maybell','Schneider',NULL,'m_schneider','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:25','2014-12-08 12:19:25',NULL,1,25,'2014-12-06 12:19:25','Curator','',0,'scope',NULL,NULL,NULL,NULL,32,24,NULL,NULL,NULL,201209022352216,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(27,'123.45.67.10','bob26@smith.com','Okey','McCullough',NULL,'o_mccullough','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,33,24,NULL,NULL,NULL,201111011344479,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(28,'123.45.67.10','bob27@smith.com','Leonardo','Schamberger',NULL,'l_schamberge','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:29','2014-12-08 12:19:29',NULL,1,27,'2014-12-06 12:19:29','Curator','',0,'scope',NULL,NULL,NULL,NULL,34,24,NULL,NULL,NULL,201111011679845,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(29,'123.45.67.10','bob28@smith.com','Gerhard','Bode',NULL,'g_bode','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,35,24,NULL,NULL,NULL,201111300968085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(30,'123.45.67.10','bob29@smith.com','Cicero','Stehr',NULL,'curator_for_tc','5f4dcc3b5aa765d61d8327deb882cf99',1,1,'2014-12-08 12:19:30','2014-12-08 12:19:30',NULL,1,29,'2014-12-06 12:19:30','Curator','',0,'scope',NULL,NULL,NULL,NULL,36,24,NULL,NULL,NULL,201205100347094,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(31,'123.45.67.10','bob30@smith.com','Maritza','Kuhic',NULL,'m_kuhic','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,37,24,NULL,NULL,NULL,201209112315713,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(32,'123.45.67.19','bob31@smith.com','Wyatt','Hansen',NULL,'w_hansen','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:32','2014-12-08 12:19:32',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,39,24,NULL,NULL,NULL,201203120007511,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(33,'123.45.67.11','bob32@smith.com','Ming','Spencer',NULL,'m_spencer','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:32','2014-12-08 12:19:33',NULL,1,32,'2014-12-06 12:19:32','Curator','',0,'scope',NULL,NULL,NULL,NULL,40,24,NULL,NULL,NULL,201207070051807,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(34,'123.45.67.10','bob33@smith.com','Ralph','Wiggum',NULL,'testcp','f5ec1938b346bf01dc3be259aa270dfa',1,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,41,24,NULL,NULL,NULL,201211040848246,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(35,'123.45.67.12','bob34@smith.com','Benton','Corwin',NULL,'test_cp','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:36','2014-12-08 12:19:36',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,42,24,NULL,NULL,NULL,201203290044598,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(36,'123.45.67.12','bob35@smith.com','Rosalia','Toy',NULL,'r_toy','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,45,24,NULL,NULL,NULL,201211280051661,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(37,'123.45.67.16','bob36@smith.com','Admin','User',NULL,'admin','21232f297a57a5a743894a0e4a801fc3',1,1,'2014-12-08 12:19:37','2014-12-08 12:19:37',NULL,1,36,'2014-12-06 12:19:37','Curator','',0,'scope',NULL,NULL,NULL,NULL,46,24,NULL,NULL,NULL,201111020821391,NULL,NULL,0,NULL,1,NULL,1,NULL,NULL,1,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(38,'123.45.67.18','bob37@smith.com','Christie','Ankunding',NULL,'c_ankunding','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,47,24,NULL,NULL,NULL,201111012194996,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(39,'123.45.67.14','bob38@smith.com','Madelynn','Beatty',NULL,'m_beatty','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:38','2014-12-08 12:19:38',NULL,1,38,'2014-12-06 12:19:38','Curator','',0,'scope',NULL,NULL,NULL,NULL,48,24,NULL,NULL,NULL,201202260041221,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(40,'123.45.67.17','bob39@smith.com','Jeramie','Botsford',NULL,'j_botsford','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,49,24,NULL,NULL,NULL,201207170007419,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(41,'123.45.67.11','bob40@smith.com','test','curator',NULL,'test_curator','5f4dcc3b5aa765d61d8327deb882cf99',1,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,1,40,'2014-12-06 12:19:40','Curator','',0,'scope',NULL,NULL,NULL,NULL,50,24,NULL,NULL,NULL,201211040827144,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(42,'123.45.67.14','bob41@smith.com','Duane','Leuschke',NULL,'d_leuschke','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:40','2014-12-08 12:19:40',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,3,24,NULL,NULL,NULL,201201250295337,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(43,'123.45.67.10','bob42@smith.com','Herbert','Senger',NULL,'h_senger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,53,24,NULL,NULL,NULL,201112300194339,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(44,'123.45.67.10','bob43@smith.com','Rolfe','Luettgen',NULL,'r_luettgen','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:41','2014-12-08 12:19:41',NULL,1,43,'2014-12-06 12:19:41','Curator','',0,'scope',NULL,NULL,NULL,NULL,54,24,NULL,NULL,NULL,201204200147552,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(45,'123.45.67.14','bob44@smith.com','Kali','Lubowitz',NULL,'k_lubowitz','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,55,24,NULL,NULL,NULL,201206210040082,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(46,'123.45.67.12','bob45@smith.com','Jacky','Welch',NULL,'j_welch','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:43','2014-12-08 12:19:43',NULL,1,45,'2014-12-06 12:19:43','Curator','',0,'scope',NULL,NULL,NULL,NULL,56,24,NULL,NULL,NULL,201111012185408,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(47,'123.45.67.12','bob46@smith.com','Marilie','Harvey',NULL,'m_harvey','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,57,24,NULL,NULL,NULL,201301040017859,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(48,'123.45.67.11','bob47@smith.com','Jon','Schultz',NULL,'j_schultz','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:45','2014-12-08 12:19:45',NULL,1,47,'2014-12-06 12:19:45','Curator','',0,'scope',NULL,NULL,NULL,NULL,58,24,NULL,NULL,NULL,201111011984102,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(49,'123.45.67.14','bob48@smith.com','Rachel','Keebler',NULL,'r_keebler','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,59,24,NULL,NULL,NULL,201111021286828,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(50,'123.45.67.18','bob49@smith.com','Scot','Hudson',NULL,'s_hudson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:47','2014-12-08 12:19:47',NULL,1,49,'2014-12-06 12:19:47','Curator','',0,'scope',NULL,NULL,NULL,NULL,60,24,NULL,NULL,NULL,201201250380510,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(51,'123.45.67.10','bob50@smith.com','Rhea','Leffler',NULL,'r_leffler','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,61,24,NULL,NULL,NULL,201209252381279,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(52,'123.45.67.12','bob51@smith.com','Greta','Gleason',NULL,'g_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:49','2014-12-08 12:19:49',NULL,1,51,'2014-12-06 12:19:49','Curator','',0,'scope',NULL,NULL,NULL,NULL,62,24,NULL,NULL,NULL,201205310077602,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(53,'123.45.67.15','bob52@smith.com','Dameon','Schmidt',NULL,'d_schmidt','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,63,24,NULL,NULL,NULL,201111012233905,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(54,'123.45.67.18','bob53@smith.com','Rasheed','Skiles',NULL,'r_skiles','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:51','2014-12-08 12:19:51',NULL,1,53,'2014-12-06 12:19:51','Curator','',0,'scope',NULL,NULL,NULL,NULL,64,24,NULL,NULL,NULL,201111011892631,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(55,'123.45.67.19','bob54@smith.com','Bertrand','Gleason',NULL,'b_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,65,24,NULL,NULL,NULL,201203290090064,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(56,'123.45.67.14','bob55@smith.com','Seao','Cummerata',NULL,'s_cummerata','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:53','2014-12-08 12:19:53',NULL,1,55,'2014-12-06 12:19:53','Curator','',0,'scope',NULL,NULL,NULL,NULL,66,24,NULL,NULL,NULL,201209172384084,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(57,'123.45.67.17','bob56@smith.com','Janif','Stamm',NULL,'j_stamm','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:54','2014-12-08 12:19:54',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,67,24,NULL,NULL,NULL,201204150016376,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(58,'123.45.67.12','bob57@smith.com','Helmes','Beier',NULL,'h_beier','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:55','2014-12-08 12:19:55',NULL,1,57,'2014-12-06 12:19:54','Curator','',0,'scope',NULL,NULL,NULL,NULL,68,24,NULL,NULL,NULL,201202260034012,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(59,'123.45.67.12','bob58@smith.com','Fionb','Dickens',NULL,'f_dickens','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:56','2014-12-08 12:19:56',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,69,24,NULL,NULL,NULL,201111012266993,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(60,'123.45.67.12','bob59@smith.com','Spences','Kulas',NULL,'s_kulas','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:57','2014-12-08 12:19:57',NULL,1,59,'2014-12-06 12:19:57','Curator','',0,'scope',NULL,NULL,NULL,NULL,70,24,NULL,NULL,NULL,201112220171145,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(61,'123.45.67.19','bob60@smith.com','Camreo','Franecki',NULL,'c_franecki','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,71,24,NULL,NULL,NULL,201111011632931,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(62,'123.45.67.12','bob61@smith.com','Ahmae','Kuhic',NULL,'a_kuhic','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:19:58','2014-12-08 12:19:58',NULL,1,61,'2014-12-06 12:19:58','Curator','',0,'scope',NULL,NULL,NULL,NULL,72,24,NULL,NULL,NULL,201203270131349,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(63,'123.45.67.10','bob62@smith.com','Roxanf','Padberg',NULL,'r_padberg','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,73,24,NULL,NULL,NULL,201111020255217,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(64,'123.45.67.17','bob63@smith.com','Marianb','Haley',NULL,'m_haley','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:01','2014-12-08 12:20:01',NULL,1,63,'2014-12-06 12:20:01','Curator','',0,'scope',NULL,NULL,NULL,NULL,74,24,NULL,NULL,NULL,201205050025674,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(65,'123.45.67.12','bob64@smith.com','Joshuai','Gorczany',NULL,'j_gorczany','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,75,24,NULL,NULL,NULL,201111020299829,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(66,'123.45.67.14','bob65@smith.com','Antonib','Hoeger',NULL,'a_hoeger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:02','2014-12-08 12:20:02',NULL,1,65,'2014-12-06 12:20:02','Curator','',0,'scope',NULL,NULL,NULL,NULL,76,24,NULL,NULL,NULL,201302041061045,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(67,'123.45.67.16','bob66@smith.com','Eugenf','Cronio',NULL,'e_cronio','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,77,24,NULL,NULL,NULL,201111020073931,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(68,'123.45.67.14','bob67@smith.com','Kaitlio','Reinges',NULL,'k_reinges','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:05','2014-12-08 12:20:05',NULL,1,67,'2014-12-06 12:20:05','Curator','',0,'scope',NULL,NULL,NULL,NULL,78,24,NULL,NULL,NULL,201111020541857,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(69,'123.45.67.17','bob68@smith.com','Othp','Jacobt',NULL,'o_jacobt','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,79,24,NULL,NULL,NULL,201111020722713,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(70,'123.45.67.17','bob69@smith.com','Camilb','Cronb',NULL,'c_cronb','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:07','2014-12-08 12:20:07',NULL,1,69,'2014-12-06 12:20:07','Curator','',0,'scope',NULL,NULL,NULL,NULL,80,24,NULL,NULL,NULL,201112090037380,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(71,'123.45.67.16','bob70@smith.com','Colu','Parisiao',NULL,'c_parisiao','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:15','2014-12-08 12:20:15',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,81,24,NULL,NULL,NULL,201111011130833,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(72,'123.45.67.14','bob71@smith.com','Mathex','Bergstron',NULL,'datamama','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:29','2014-12-08 12:20:29',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,82,24,NULL,NULL,NULL,201205310020621,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(73,'123.45.67.11','bob72@smith.com','Electb','Rhyt',NULL,'bootstrap_already_loaded','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-12-08 12:20:30','2014-12-08 12:20:30',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,83,24,NULL,NULL,NULL,201201050110344,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-12-01 07:48:36','2014-12-01 07:48:36',0,0,NULL),(75,'127.0.0.1','amr.morad@bibalex.org',NULL,NULL,NULL,'AmrMorad','c53e479b03b3220d3d56da88c4cace20',1,1,'2014-12-10 07:49:52','2014-12-10 07:49:52',NULL,0,NULL,NULL,'','3b93b42b7ad1a44e6bb5a6a78dca9aa118be1ad4',0,'','d051631bd965f917008ffd0e037f2feb','2014-12-24 07:50:24',NULL,NULL,85,24,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,0,'2014-12-01 12:18:35','2014-12-01 12:18:35',0,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects`
--

DROP TABLE IF EXISTS `users_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_data_objects_on_data_object_id` (`data_object_id`),
  KEY `index_users_data_objects_on_taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects`
--

LOCK TABLES `users_data_objects` WRITE;
/*!40000 ALTER TABLE `users_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects_ratings`
--

DROP TABLE IF EXISTS `users_data_objects_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_data_objects_ratings_1` (`data_object_guid`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects_ratings`
--

LOCK TABLES `users_data_objects_ratings` WRITE;
/*!40000 ALTER TABLE `users_data_objects_ratings` DISABLE KEYS */;
INSERT INTO `users_data_objects_ratings` VALUES (1,30,NULL,1,'5c47665ac8074207847821b804049be2','2014-12-08 12:19:31','2014-12-08 12:19:31',1),(2,30,NULL,1,'1846dcc0ef2d44b39f836be7e6464d08','2014-12-08 12:19:31','2014-12-08 12:19:31',1);
/*!40000 ALTER TABLE `users_data_objects_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_identities`
--

DROP TABLE IF EXISTS `users_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_identities` (
  `user_id` int(10) unsigned NOT NULL,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_identities`
--

LOCK TABLES `users_user_identities` WRITE;
/*!40000 ALTER TABLE `users_user_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vetted`
--

DROP TABLE IF EXISTS `vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `view_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Vetted statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vetted`
--

LOCK TABLES `vetted` WRITE;
/*!40000 ALTER TABLE `vetted` DISABLE KEYS */;
INSERT INTO `vetted` VALUES (1,'2014-12-08 12:18:58','2014-12-08 12:18:58',1),(2,'2014-12-08 12:18:58','2014-12-08 12:18:58',2),(3,'2014-12-08 12:18:58','2014-12-08 12:18:58',3),(4,'2014-12-08 12:18:58','2014-12-08 12:18:58',4);
/*!40000 ALTER TABLE `vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_styles`
--

DROP TABLE IF EXISTS `view_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_items_per_page` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_styles`
--

LOCK TABLES `view_styles` WRITE;
/*!40000 ALTER TABLE `view_styles` DISABLE KEYS */;
INSERT INTO `view_styles` VALUES (1,NULL),(2,NULL),(3,NULL);
/*!40000 ALTER TABLE `view_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibilities`
--

DROP TABLE IF EXISTS `visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibilities`
--

LOCK TABLES `visibilities` WRITE;
/*!40000 ALTER TABLE `visibilities` DISABLE KEYS */;
INSERT INTO `visibilities` VALUES (1,'2014-12-08 12:18:58','2014-12-08 12:18:58'),(2,'2014-12-08 12:18:58','2014-12-08 12:18:58'),(3,'2014-12-08 12:18:59','2014-12-08 12:18:59');
/*!40000 ALTER TABLE `visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whats_this`
--

DROP TABLE IF EXISTS `whats_this`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whats_this` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whats_this`
--

LOCK TABLES `whats_this` WRITE;
/*!40000 ALTER TABLE `whats_this` DISABLE KEYS */;
/*!40000 ALTER TABLE `whats_this` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikipedia_queue`
--

DROP TABLE IF EXISTS `wikipedia_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipedia_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` timestamp NULL DEFAULT NULL,
  `harvest_succeeded` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipedia_queue`
--

LOCK TABLES `wikipedia_queue` WRITE;
/*!40000 ALTER TABLE `wikipedia_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipedia_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worklist_ignored_data_objects`
--

DROP TABLE IF EXISTS `worklist_ignored_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklist_ignored_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_worklist_ignored_data_objects_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklist_ignored_data_objects`
--

LOCK TABLES `worklist_ignored_data_objects` WRITE;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-01 13:28:38

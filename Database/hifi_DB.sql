-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hifishop
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `hifi_category`
--

DROP TABLE IF EXISTS `hifi_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(28) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_category`
--

LOCK TABLES `hifi_category` WRITE;
/*!40000 ALTER TABLE `hifi_category` DISABLE KEYS */;
INSERT INTO `hifi_category` VALUES (1,'Cd-afspillere'),(5,'Effektforstærkere'),(4,'Forforstærkere'),(6,'Højtalere'),(3,'Int. Forstærkere'),(2,'Pladespillere');
/*!40000 ALTER TABLE `hifi_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_contactmessages`
--

DROP TABLE IF EXISTS `hifi_contactmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_contactmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(64) NOT NULL,
  `email` varchar(192) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `message` text NOT NULL,
  `submitDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_contactmessages`
--

LOCK TABLES `hifi_contactmessages` WRITE;
/*!40000 ALTER TABLE `hifi_contactmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `hifi_contactmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_manufacturers`
--

DROP TABLE IF EXISTS `hifi_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufactureName` varchar(48) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`manufactureName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_manufacturers`
--

LOCK TABLES `hifi_manufacturers` WRITE;
/*!40000 ALTER TABLE `hifi_manufacturers` DISABLE KEYS */;
INSERT INTO `hifi_manufacturers` VALUES (6,'Boesendorfer'),(1,'Creek'),(2,'Exsposure'),(3,'Harbeth'),(7,'Jolida'),(4,'Manley'),(8,'Parasound'),(5,'Pro_ject');
/*!40000 ALTER TABLE `hifi_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_menu`
--

DROP TABLE IF EXISTS `hifi_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `menupath` varchar(45) DEFAULT NULL,
  `isVisible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_menu`
--

LOCK TABLES `hifi_menu` WRITE;
/*!40000 ALTER TABLE `hifi_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `hifi_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_news`
--

DROP TABLE IF EXISTS `hifi_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `pictureId` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pictureId_idx` (`pictureId`),
  CONSTRAINT `fk_pictureId` FOREIGN KEY (`pictureId`) REFERENCES `hifi_pictures` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_news`
--

LOCK TABLES `hifi_news` WRITE;
/*!40000 ALTER TABLE `hifi_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `hifi_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_pictures`
--

DROP TABLE IF EXISTS `hifi_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(256) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_pictures`
--

LOCK TABLES `hifi_pictures` WRITE;
/*!40000 ALTER TABLE `hifi_pictures` DISABLE KEYS */;
INSERT INTO `hifi_pictures` VALUES (1,'noProduct.png','2017-03-07 12:02:13','noProduct.png'),(5,'Creek_OBH_22_Passive_Preamp.jpg','2017-03-07 12:02:11','Creek_OBH_22_Passive_Preamp.jpg'),(6,'Exp_2010S_CD.gif','2017-03-07 12:02:12','Exp_2010S_CD.gif'),(7,'Manley_Stingray.jpg','2017-03-07 12:02:12','Manley_Stingray.jpg'),(8,'Pro_ject_Debut_3_bl.jpg','2017-03-07 12:02:12','Pro_ject_Debut_3_bl.jpg'),(9,'Pro_ject_Debut_III_red_1.jpg','2017-03-07 12:02:12','Pro_ject_Debut_III_red_1.jpg'),(10,'Pro_ject_Debut_III_yellow_1.jpg','2017-03-07 12:02:12','Pro_ject_Debut_III_yellow_1.jpg'),(11,'Pro_ject_rpm10.jpg','2017-03-07 12:02:12','Pro_ject_rpm10.jpg'),(12,'Pro_ject_rpm_5.jpg','2017-03-07 12:02:12','Pro_ject_rpm_5.jpg'),(13,'Project_prebox.jpg','2017-03-07 12:02:12','Project_prebox.jpg'),(14,'boesendorfer_vcs_wall.gif','2017-03-07 12:02:12','boesendorfer_vcs_wall.gif'),(15,'creek_Destiny_CD.jpg','2017-03-07 12:02:12','creek_Destiny_CD.jpg'),(16,'creek_a50I.jpg','2017-03-07 12:02:12','creek_a50I.jpg'),(17,'creek_classic.jpg','2017-03-07 12:02:12','creek_classic.jpg'),(18,'creek_classic5350SE.jpg','2017-03-07 12:02:12','creek_classic5350SE.jpg'),(19,'creek_classic_cd.jpg','2017-03-07 12:02:12','creek_classic_cd.jpg'),(20,'creek_destinyamp.jpg','2017-03-07 12:02:12','creek_destinyamp.jpg'),(21,'creek_evo_cd.jpg','2017-03-07 12:02:12','creek_evo_cd.jpg'),(22,'epos_m5.gif','2017-03-07 12:02:12','epos_m5.gif'),(23,'exposure_2010S.jpg','2017-03-07 12:02:12','exposure_2010S.jpg'),(24,'harbeth_hl7es2.jpg','2017-03-07 12:02:12','harbeth_hl7es2.jpg'),(25,'harbeth_monitor30.jpg','2017-03-07 12:02:12','harbeth_monitor30.jpg'),(26,'harbeth_p3es2.jpg','2017-03-07 12:02:12','harbeth_p3es2.jpg'),(27,'jolida_JD102b.jpg','2017-03-07 12:02:13','jolida_JD102b.jpg'),(28,'jolida_JD202a.jpg','2017-03-07 12:02:13','jolida_JD202a.jpg'),(29,'jolida_JD300b.jpg','2017-03-07 12:02:13','jolida_JD300b.jpg'),(30,'jolida_JD302b.jpg','2017-03-07 12:02:13','jolida_JD302b.jpg'),(31,'manley_mahi.jpg','2017-03-07 12:02:13','manley_mahi.jpg'),(32,'manley_neoclassic300b.jpg','2017-03-07 12:02:13','manley_neoclassic300b.jpg'),(33,'manley_snapper.jpg','2017-03-07 12:02:13','manley_snapper.jpg'),(35,'parasound_classic7100.jpg','2017-03-07 12:02:13','parasound_classic7100.jpg'),(36,'parasound_d200.jpg','2017-03-07 12:02:13','parasound_d200.jpg'),(37,'parasound_haloa23.jpg','2017-03-07 12:02:13','parasound_haloa23.jpg'),(38,'parasound_halod3.jpg','2017-03-07 12:02:13','parasound_halod3.jpg'),(39,'parasound_halop3.jpg','2017-03-07 12:02:13','parasound_halop3.jpg');
/*!40000 ALTER TABLE `hifi_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_products`
--

DROP TABLE IF EXISTS `hifi_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `productTitle` varchar(48) NOT NULL,
  `productDetails` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `manufacturerId` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productPicture` int(11) NOT NULL DEFAULT '1',
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_category_idx` (`categoryId`),
  KEY `fk_productPicture_idx` (`productPicture`),
  KEY `fk_manufactor_idx` (`manufacturerId`),
  CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES `hifi_category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_manufactor` FOREIGN KEY (`manufacturerId`) REFERENCES `hifi_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_productPicture` FOREIGN KEY (`productPicture`) REFERENCES `hifi_pictures` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_products`
--

LOCK TABLES `hifi_products` WRITE;
/*!40000 ALTER TABLE `hifi_products` DISABLE KEYS */;
INSERT INTO `hifi_products` VALUES (1,'Evolution CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.',5495.00,1,'2017-03-07 08:55:32',21,1),(2,'Classic CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.',9995.00,1,'2017-03-07 08:55:32',19,1),(3,'2010 S CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.',6995.00,2,'2017-03-07 08:55:32',6,1),(4,'Debut 3 Blue','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 14:58:54',8,2);
/*!40000 ALTER TABLE `hifi_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-07 15:07:15

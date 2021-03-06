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
-- Table structure for table `hifi_brands`
--

DROP TABLE IF EXISTS `hifi_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_brands` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(48) NOT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `name_UNIQUE` (`brandName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_brands`
--

LOCK TABLES `hifi_brands` WRITE;
/*!40000 ALTER TABLE `hifi_brands` DISABLE KEYS */;
INSERT INTO `hifi_brands` VALUES (6,'Boesendorfer'),(1,'Creek'),(9,'Epos'),(2,'Exsposure'),(3,'Harbeth'),(0,'Intet Brand'),(7,'Jolida'),(4,'Manley'),(8,'Parasound'),(5,'Project');
/*!40000 ALTER TABLE `hifi_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_category`
--

DROP TABLE IF EXISTS `hifi_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_category` (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(28) CHARACTER SET latin1 NOT NULL,
  `categoryActive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catId`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_category`
--

LOCK TABLES `hifi_category` WRITE;
/*!40000 ALTER TABLE `hifi_category` DISABLE KEYS */;
INSERT INTO `hifi_category` VALUES (0,'Ingen kategori',0),(1,'Cd-afspillere',1),(2,'Pladespillere',1),(3,'Int. Forstærkere',1),(4,'Forforstærkere',1),(5,'Effektforstærkere',1),(6,'Højtalere',1),(7,'DVD-afspillere',0),(8,'Rørforstærkere',0);
/*!40000 ALTER TABLE `hifi_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_contactmessages`
--

DROP TABLE IF EXISTS `hifi_contactmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_contactmessages` (
  `cmId` int(11) NOT NULL AUTO_INCREMENT,
  `cmFullname` varchar(64) NOT NULL,
  `cmEmail` varchar(192) NOT NULL,
  `cmSubject` varchar(64) NOT NULL,
  `cmMessage` text NOT NULL,
  `cmSubmitDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cmAnswerDate` datetime DEFAULT NULL,
  `cmIsOpened` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_contactmessages`
--

LOCK TABLES `hifi_contactmessages` WRITE;
/*!40000 ALTER TABLE `hifi_contactmessages` DISABLE KEYS */;
INSERT INTO `hifi_contactmessages` VALUES (1,'Test bRuger','test@test.dk','Test','Dett er en test fra kontakt','2017-03-08 15:04:14',NULL,0),(2,'test bruger','test@test.dk','jkhkjhkjh098098098','sÃ¦flksÃ¦ldfksdÃ¦flksdÃ¦flksÃ¦dfk','2017-03-09 08:35:28',NULL,0),(3,'test','test@test.dk','poipoipo098098','sdklfjsdklfjsdklfjsldkfjsldkfj\r\n','2017-03-09 08:36:00',NULL,0),(4,'test','test@test.dk','test7897897','sdfkljsdflksjdflkjslkdjfl','2017-03-09 08:38:02',NULL,0);
/*!40000 ALTER TABLE `hifi_contactmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_imageslider`
--

DROP TABLE IF EXISTS `hifi_imageslider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_imageslider` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sliderTitle` varchar(45) NOT NULL,
  `sliderContent` text NOT NULL,
  `sliderLink` varchar(255) NOT NULL DEFAULT '#',
  `SliderImageId` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_sliderImgId_idx` (`SliderImageId`),
  CONSTRAINT `fk_sliderImgId` FOREIGN KEY (`SliderImageId`) REFERENCES `hifi_pictures` (`pictureId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_imageslider`
--

LOCK TABLES `hifi_imageslider` WRITE;
/*!40000 ALTER TABLE `hifi_imageslider` DISABLE KEYS */;
INSERT INTO `hifi_imageslider` VALUES (1,'Parasound Classic','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.','#',43),(2,'Parasound Classic','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.','#',44),(3,'Parasound Classic','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.','#',45),(4,'Test','Dette er en test','#',42);
/*!40000 ALTER TABLE `hifi_imageslider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_maincontent`
--

DROP TABLE IF EXISTS `hifi_maincontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_maincontent` (
  `mcId` int(11) NOT NULL AUTO_INCREMENT,
  `mcHeading` varchar(45) NOT NULL,
  `mcSubHeading` varchar(45) NOT NULL,
  `mcContent` text NOT NULL,
  `mcPictureId` int(11) DEFAULT NULL,
  `mcCreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mcId`),
  KEY `fk_mcImgId_idx` (`mcPictureId`),
  CONSTRAINT `fk_mcImgId` FOREIGN KEY (`mcPictureId`) REFERENCES `hifi_pictures` (`pictureId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_maincontent`
--

LOCK TABLES `hifi_maincontent` WRITE;
/*!40000 ALTER TABLE `hifi_maincontent` DISABLE KEYS */;
INSERT INTO `hifi_maincontent` VALUES (2,'Lorem ipsum. ','dolor sit amet.','Consectetur adipiscing elit. Nunc sollicitudin ligula ut faucibus congue. Etiam arcu nibh, venenatis non ligula vel, consequat euismod eros. Vestibulum in aliquet leo. Maecenas ut lacinia justo. Duis sagittis imperdiet tellus a vulputate. Duis scelerisque nunc tortor.',46,'2017-03-08 15:41:08');
/*!40000 ALTER TABLE `hifi_maincontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_menu`
--

DROP TABLE IF EXISTS `hifi_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_menu` (
  `menuId` int(11) NOT NULL,
  `MenuTitle` varchar(45) NOT NULL,
  `menupath` varchar(45) DEFAULT NULL,
  `menuVisible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menuId`)
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
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(45) NOT NULL,
  `newsContent` text NOT NULL,
  `newsPictureId` int(11) NOT NULL,
  `newsAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nid`),
  KEY `fk_newsImg_idx` (`newsPictureId`),
  CONSTRAINT `fk_newsImg` FOREIGN KEY (`newsPictureId`) REFERENCES `hifi_pictures` (`pictureId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_news`
--

LOCK TABLES `hifi_news` WRITE;
/*!40000 ALTER TABLE `hifi_news` DISABLE KEYS */;
INSERT INTO `hifi_news` VALUES (11,'Overskrift','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit',42,'2017-03-08 11:45:39'),(12,'Overskrift','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit',42,'2017-03-08 11:45:39'),(13,'Overskrift','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit',42,'2017-03-08 11:45:39'),(14,'Overskrift','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, soluta, eligendi doloribus sunt minus amet sit debitis repellat. Consectetur, culpa itaque odio similique suscipit',42,'2017-03-08 11:45:39');
/*!40000 ALTER TABLE `hifi_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_pictures`
--

DROP TABLE IF EXISTS `hifi_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_pictures` (
  `pictureId` int(11) NOT NULL AUTO_INCREMENT,
  `pictureFilename` varchar(256) NOT NULL,
  `pictureAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pictureTitle` varchar(128) NOT NULL,
  `pictureIsProduct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pictureId`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_pictures`
--

LOCK TABLES `hifi_pictures` WRITE;
/*!40000 ALTER TABLE `hifi_pictures` DISABLE KEYS */;
INSERT INTO `hifi_pictures` VALUES (0,'avatar.png','2017-03-15 14:40:51','Profil billede',0),(1,'noProduct.png','2017-03-07 12:02:13','noProduct.png',1),(5,'Creek_OBH_22_Passive_Preamp.jpg','2017-03-07 12:02:11','Creek_OBH_22_Passive_Preamp.jpg',1),(6,'Exp_2010S_CD.gif','2017-03-07 12:02:12','Exp_2010S_CD.gif',1),(7,'Manley_Stingray.jpg','2017-03-07 12:02:12','Manley_Stingray.jpg',1),(8,'Pro_ject_Debut_3_bl.jpg','2017-03-07 12:02:12','Pro_ject_Debut_3_bl.jpg',1),(9,'Pro_ject_Debut_III_red_1.jpg','2017-03-07 12:02:12','Pro_ject_Debut_III_red_1.jpg',1),(10,'Pro_ject_Debut_III_yellow_1.jpg','2017-03-07 12:02:12','Pro_ject_Debut_III_yellow_1.jpg',1),(11,'Pro_ject_rpm10.jpg','2017-03-07 12:02:12','Pro_ject_rpm10.jpg',1),(12,'Pro_ject_rpm_5.jpg','2017-03-07 12:02:12','Pro_ject_rpm_5.jpg',1),(13,'Project_prebox.jpg','2017-03-07 12:02:12','Project_prebox.jpg',1),(14,'boesendorfer_vcs_wall.gif','2017-03-07 12:02:12','boesendorfer_vcs_wall.gif',1),(15,'creek_Destiny_CD.jpg','2017-03-07 12:02:12','creek_Destiny_CD.jpg',1),(16,'creek_a50I.jpg','2017-03-07 12:02:12','creek_a50I.jpg',1),(17,'creek_classic.jpg','2017-03-07 12:02:12','creek_classic.jpg',1),(18,'creek_classic5350SE.jpg','2017-03-07 12:02:12','creek_classic5350SE.jpg',1),(19,'creek_classic_cd.jpg','2017-03-07 12:02:12','creek_classic_cd.jpg',1),(20,'creek_destinyamp.jpg','2017-03-07 12:02:12','creek_destinyamp.jpg',1),(21,'creek_evo_cd.jpg','2017-03-07 12:02:12','creek_evo_cd.jpg',1),(22,'epos_m5.gif','2017-03-07 12:02:12','epos_m5.gif',1),(23,'exposure_2010S.jpg','2017-03-07 12:02:12','exposure_2010S.jpg',1),(24,'harbeth_hl7es2.jpg','2017-03-07 12:02:12','harbeth_hl7es2.jpg',1),(25,'harbeth_monitor30.jpg','2017-03-07 12:02:12','harbeth_monitor30.jpg',1),(26,'harbeth_p3es2.jpg','2017-03-07 12:02:12','harbeth_p3es2.jpg',1),(27,'jolida_JD102b.jpg','2017-03-07 12:02:13','jolida_JD102b.jpg',1),(28,'jolida_JD202a.jpg','2017-03-07 12:02:13','jolida_JD202a.jpg',1),(29,'jolida_JD300b.jpg','2017-03-07 12:02:13','jolida_JD300b.jpg',1),(30,'jolida_JD302b.jpg','2017-03-07 12:02:13','jolida_JD302b.jpg',1),(31,'manley_mahi.jpg','2017-03-07 12:02:13','manley_mahi.jpg',1),(32,'manley_neoclassic300b.jpg','2017-03-07 12:02:13','manley_neoclassic300b.jpg',1),(33,'manley_snapper.jpg','2017-03-07 12:02:13','manley_snapper.jpg',1),(35,'parasound_classic7100.jpg','2017-03-07 12:02:13','parasound_classic7100.jpg',1),(36,'parasound_d200.jpg','2017-03-07 12:02:13','parasound_d200.jpg',1),(37,'parasound_haloa23.jpg','2017-03-07 12:02:13','parasound_haloa23.jpg',1),(38,'parasound_halod3.jpg','2017-03-07 12:02:13','parasound_halod3.jpg',1),(39,'parasound_halop3.jpg','2017-03-07 12:02:13','parasound_halop3.jpg',1),(40,'manley_snapper_effekt.jpg','2017-03-07 17:45:56','manley_snapper_effekt.jpg',1),(41,'jolida_JD502b.jpg','2017-03-07 18:02:54','jolida_JD502b.jpg',1),(42,'placeholder.png','2017-03-08 11:44:20','Placeholder',0),(43,'slide1.jpg','2017-03-08 19:30:12','Slider billede 1',0),(44,'slide2.jpg','2017-03-08 19:30:12','Slider billede 2',0),(45,'slide3.jpg','2017-03-08 19:30:12','Slider billede 3',0),(46,'forside.jpg','2017-03-08 19:53:26','Forside billede',0);
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
  `productPrice` decimal(8,2) NOT NULL,
  `productBrandId` int(11) DEFAULT NULL,
  `productAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productPicture` int(11) NOT NULL DEFAULT '1',
  `productCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_productPictureId_idx` (`productPicture`),
  KEY `fk_categoryId_idx` (`productCategoryId`),
  KEY `fk_brandId_idx` (`productBrandId`),
  CONSTRAINT `fk_brandId` FOREIGN KEY (`productBrandId`) REFERENCES `hifi_brands` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoryId` FOREIGN KEY (`productCategoryId`) REFERENCES `hifi_category` (`catId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productPictureId` FOREIGN KEY (`productPicture`) REFERENCES `hifi_pictures` (`pictureId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_products`
--

LOCK TABLES `hifi_products` WRITE;
/*!40000 ALTER TABLE `hifi_products` DISABLE KEYS */;
INSERT INTO `hifi_products` VALUES (1,'Evolution CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.                                                                                                ',5495.00,1,'2017-03-07 08:55:32',21,1),(2,'Classic CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.',9995.00,1,'2017-03-07 08:55:32',19,1),(3,'2010 S CD','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat.',6995.00,2,'2017-03-07 08:55:32',6,1),(4,'Debut 3 Blue','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 14:58:54',8,2),(5,'Destiny CD','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:24:30',15,1),(6,'Classic','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:27:27',17,7),(7,'2010S','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,2,'2017-03-07 17:28:00',23,7),(8,'D200','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,8,'2017-03-07 17:28:33',36,7),(9,'Halod3','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,8,'2017-03-07 17:29:13',38,7),(10,'Mahi','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,4,'2017-03-07 17:29:44',31,5),(11,'Neo Classic 300B','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,4,'2017-03-07 17:30:24',32,5),(12,'Snapper','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,4,'2017-03-07 17:31:00',40,5),(13,'Haloa23','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,8,'2017-03-07 17:32:00',37,5),(14,'OBH 22 - Passive Preamp','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:33:18',5,4),(15,'Classic 7100','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,8,'2017-03-07 17:33:54',35,4),(16,'Halop3','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,8,'2017-03-07 17:34:18',39,4),(17,'Prebox','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 17:35:55',13,4),(18,'VCS Wall','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,6,'2017-03-07 17:37:26',14,6),(19,'M5','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,9,'2017-03-07 17:38:44',22,6),(20,'HL7ES2','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,3,'2017-03-07 17:39:52',24,6),(21,'Monitor 30','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,3,'2017-03-07 17:40:21',25,6),(22,'P3ES2','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,3,'2017-03-07 17:40:44',26,6),(23,'A50I','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:41:21',16,3),(24,'Classic 5350SE','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:41:59',18,3),(25,'Destiny Amp','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,1,'2017-03-07 17:42:26',20,3),(27,'Snapper','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,4,'2017-03-07 17:47:05',33,3),(28,'Stingray','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,4,'2017-03-07 17:47:44',7,3),(29,'Debut III RED','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 17:51:28',9,2),(30,'Debut III Yellow','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 17:51:52',10,2),(31,'RPM 5','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 17:52:10',12,2),(32,'RPM 10','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,5,'2017-03-07 17:52:30',11,2),(33,'JD102b','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,7,'2017-03-07 17:56:50',27,8),(34,'JD202a','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,7,'2017-03-07 17:57:11',28,8),(35,'JD300b','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,7,'2017-03-07 17:57:34',29,8),(36,'JD302b','            bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,7,'2017-03-07 17:57:58',30,8),(37,'JD502b','bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat\r\n        ',9999.00,7,'2017-03-07 18:03:45',41,8);
/*!40000 ALTER TABLE `hifi_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_shopsettings`
--

DROP TABLE IF EXISTS `hifi_shopsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_shopsettings` (
  `setId` int(11) NOT NULL AUTO_INCREMENT,
  `shopTitle` varchar(64) NOT NULL DEFAULT 'HiFi Netbutikken',
  `shopBase` varchar(128) NOT NULL,
  `shopForceSsl` tinyint(1) NOT NULL DEFAULT '0',
  `ShopDescription` varchar(64) NOT NULL DEFAULT 'Velkommen',
  `shopAdrStreet` varchar(45) NOT NULL,
  `shopAdrZip` int(4) NOT NULL,
  `shopAdrCity` varchar(45) NOT NULL,
  `shopTelephone` varchar(16) NOT NULL,
  `shopFax` varchar(16) NOT NULL,
  `shopEmail` varchar(64) NOT NULL,
  `shopFooter` varchar(192) NOT NULL,
  PRIMARY KEY (`setId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_shopsettings`
--

LOCK TABLES `hifi_shopsettings` WRITE;
/*!40000 ALTER TABLE `hifi_shopsettings` DISABLE KEYS */;
INSERT INTO `hifi_shopsettings` VALUES (1,'Hi-fi Netbutikken','',0,'Velkommen','Byvej 25',4000,'bykÃ¸bing','45 45 45 45','45 45 45 45','post@hifi-netbutikken.dk','');
/*!40000 ALTER TABLE `hifi_shopsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_userroles`
--

DROP TABLE IF EXISTS `hifi_userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_userroles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_userroles`
--

LOCK TABLES `hifi_userroles` WRITE;
/*!40000 ALTER TABLE `hifi_userroles` DISABLE KEYS */;
INSERT INTO `hifi_userroles` VALUES (1,'Administrator'),(2,'Manager'),(3,'User');
/*!40000 ALTER TABLE `hifi_userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hifi_users`
--

DROP TABLE IF EXISTS `hifi_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hifi_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `userEmail` varchar(128) NOT NULL,
  `userFirstname` varchar(20) DEFAULT NULL,
  `userLastname` varchar(20) DEFAULT NULL,
  `userRole` int(11) NOT NULL DEFAULT '3',
  `userImage` int(11) NOT NULL DEFAULT '0',
  `userDateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`username`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`),
  KEY `fk_userRoleId_idx` (`userRole`),
  KEY `fk_userImage_idx` (`userImage`),
  CONSTRAINT `fk_userImage` FOREIGN KEY (`userImage`) REFERENCES `hifi_pictures` (`pictureId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRoleId` FOREIGN KEY (`userRole`) REFERENCES `hifi_userroles` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hifi_users`
--

LOCK TABLES `hifi_users` WRITE;
/*!40000 ALTER TABLE `hifi_users` DISABLE KEYS */;
INSERT INTO `hifi_users` VALUES (2,'admin','$2y$10$g3h.CyzccUy8AZjw2XY5Oem1BPnkLMawDkrMeq2/2GKLPrawq3fDu','admin@butik.hifi',NULL,NULL,3,0,'2017-03-15 17:49:01');
/*!40000 ALTER TABLE `hifi_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-16 13:18:20

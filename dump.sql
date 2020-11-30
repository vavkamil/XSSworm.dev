CREATE DATABASE  IF NOT EXISTS `xssworm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `xssworm`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: xssworm
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `user_id` int DEFAULT NULL,
  `victim_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `messages` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `color_UNIQUE` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'@vavkamil','null','white',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victims`
--

DROP TABLE IF EXISTS `victims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(7) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victims`
--

LOCK TABLES `victims` WRITE;
/*!40000 ALTER TABLE `victims` DISABLE KEYS */;
INSERT INTO `victims` VALUES (1,'white',''),(2,'white',''),(3,'white',''),(4,'white',''),(5,'white',''),(6,'white',''),(7,'white',''),(8,'white',''),(9,'white',''),(10,'white',''),(11,'white',''),(12,'white',''),(13,'white',''),(14,'white',''),(15,'white',''),(16,'white',''),(17,'white',''),(18,'white',''),(19,'white',''),(20,'white',''),(21,'white',''),(22,'white',''),(23,'white',''),(24,'white',''),(25,'white',''),(26,'white',''),(27,'white',''),(28,'white',''),(29,'white',''),(30,'white',''),(31,'white',''),(32,'white',''),(33,'white',''),(34,'white',''),(35,'white',''),(36,'white',''),(37,'white',''),(38,'white',''),(39,'white',''),(40,'white',''),(41,'white',''),(42,'white',''),(43,'white',''),(44,'white',''),(45,'white',''),(46,'white',''),(47,'white',''),(48,'white',''),(49,'white',''),(50,'white',''),(51,'white',''),(52,'white',''),(53,'white',''),(54,'white',''),(55,'white',''),(56,'white',''),(57,'white',''),(58,'white',''),(59,'white',''),(60,'white',''),(61,'white',''),(62,'white',''),(63,'white',''),(64,'white',''),(65,'white',''),(66,'white',''),(67,'white',''),(68,'white',''),(69,'white',''),(70,'white',''),(71,'white',''),(72,'white',''),(73,'white',''),(74,'white',''),(75,'white',''),(76,'white',''),(77,'white',''),(78,'white',''),(79,'white',''),(80,'white',''),(81,'white',''),(82,'white',''),(83,'white',''),(84,'white',''),(85,'white',''),(86,'white',''),(87,'white',''),(88,'white',''),(89,'white',''),(90,'white',''),(91,'white',''),(92,'white',''),(93,'white',''),(94,'white',''),(95,'white',''),(96,'white',''),(97,'white',''),(98,'white',''),(99,'white',''),(100,'white',''),(101,'white',''),(102,'white',''),(103,'white',''),(104,'white',''),(105,'white',''),(106,'white',''),(107,'white',''),(108,'white',''),(109,'white',''),(110,'white',''),(111,'white',''),(112,'white',''),(113,'white',''),(114,'white',''),(115,'white',''),(116,'white',''),(117,'white',''),(118,'white',''),(119,'white',''),(120,'white',''),(121,'white',''),(122,'white',''),(123,'white',''),(124,'white',''),(125,'white',''),(126,'white',''),(127,'white',''),(128,'white',''),(129,'white',''),(130,'white',''),(131,'white',''),(132,'white',''),(133,'white',''),(134,'white',''),(135,'white',''),(136,'white',''),(137,'white',''),(138,'white',''),(139,'white',''),(140,'white',''),(141,'white',''),(142,'white',''),(143,'white',''),(144,'white',''),(145,'white',''),(146,'white',''),(147,'white',''),(148,'white',''),(149,'white',''),(150,'white',''),(151,'white',''),(152,'white',''),(153,'white',''),(154,'white',''),(155,'white',''),(156,'white',''),(157,'white',''),(158,'white',''),(159,'white',''),(160,'white',''),(161,'white',''),(162,'white',''),(163,'white',''),(164,'white',''),(165,'white',''),(166,'white',''),(167,'white',''),(168,'white',''),(169,'white',''),(170,'white',''),(171,'white',''),(172,'white',''),(173,'white',''),(174,'white',''),(175,'white',''),(176,'white',''),(177,'white',''),(178,'white',''),(179,'white',''),(180,'white',''),(181,'white',''),(182,'white',''),(183,'white',''),(184,'white',''),(185,'white',''),(186,'white',''),(187,'white',''),(188,'white',''),(189,'white',''),(190,'white',''),(191,'white',''),(192,'white',''),(193,'white',''),(194,'white',''),(195,'white',''),(196,'white',''),(197,'white',''),(198,'white',''),(199,'white',''),(200,'white',''),(201,'white',''),(202,'white',''),(203,'white',''),(204,'white',''),(205,'white',''),(206,'white',''),(207,'white',''),(208,'white',''),(209,'white',''),(210,'white',''),(211,'white',''),(212,'white',''),(213,'white',''),(214,'white',''),(215,'white',''),(216,'white',''),(217,'white',''),(218,'white',''),(219,'white',''),(220,'white',''),(221,'white',''),(222,'white',''),(223,'white',''),(224,'white',''),(225,'white',''),(226,'white',''),(227,'white',''),(228,'white',''),(229,'white',''),(230,'white',''),(231,'white',''),(232,'white',''),(233,'white',''),(234,'white',''),(235,'white',''),(236,'white',''),(237,'white',''),(238,'white',''),(239,'white',''),(240,'white',''),(241,'white',''),(242,'white',''),(243,'white',''),(244,'white',''),(245,'white',''),(246,'white',''),(247,'white',''),(248,'white',''),(249,'white',''),(250,'white',''),(251,'white',''),(252,'white',''),(253,'white',''),(254,'white',''),(255,'white',''),(256,'white',''),(257,'white',''),(258,'white',''),(259,'white',''),(260,'white',''),(261,'white',''),(262,'white',''),(263,'white',''),(264,'white',''),(265,'white',''),(266,'white',''),(267,'white',''),(268,'white',''),(269,'white',''),(270,'white',''),(271,'white',''),(272,'white',''),(273,'white',''),(274,'white',''),(275,'white',''),(276,'white',''),(277,'white',''),(278,'white',''),(279,'white',''),(280,'white',''),(281,'white',''),(282,'white',''),(283,'white',''),(284,'white',''),(285,'white',''),(286,'white',''),(287,'white',''),(288,'white',''),(289,'white',''),(290,'white',''),(291,'white',''),(292,'white',''),(293,'white',''),(294,'white',''),(295,'white',''),(296,'white',''),(297,'white',''),(298,'white',''),(299,'white',''),(300,'white',''),(301,'white',''),(302,'white',''),(303,'white',''),(304,'white',''),(305,'white',''),(306,'white',''),(307,'white',''),(308,'white',''),(309,'white',''),(310,'white',''),(311,'white',''),(312,'white',''),(313,'white',''),(314,'white',''),(315,'white',''),(316,'white',''),(317,'white',''),(318,'white',''),(319,'white',''),(320,'white',''),(321,'white',''),(322,'white',''),(323,'white',''),(324,'white',''),(325,'white',''),(326,'white',''),(327,'white',''),(328,'white',''),(329,'white',''),(330,'white',''),(331,'white',''),(332,'white',''),(333,'white',''),(334,'white',''),(335,'white',''),(336,'white',''),(337,'white',''),(338,'white',''),(339,'white',''),(340,'white',''),(341,'white',''),(342,'white',''),(343,'white',''),(344,'white',''),(345,'white',''),(346,'white',''),(347,'white',''),(348,'white',''),(349,'white',''),(350,'white',''),(351,'white',''),(352,'white',''),(353,'white',''),(354,'white',''),(355,'white',''),(356,'white',''),(357,'white',''),(358,'white',''),(359,'white',''),(360,'white',''),(361,'white',''),(362,'white',''),(363,'white',''),(364,'white',''),(365,'white',''),(366,'white',''),(367,'white',''),(368,'white',''),(369,'white',''),(370,'white',''),(371,'white',''),(372,'white',''),(373,'white',''),(374,'white',''),(375,'white',''),(376,'white',''),(377,'white',''),(378,'white',''),(379,'white',''),(380,'white',''),(381,'white',''),(382,'white',''),(383,'white',''),(384,'white',''),(385,'white',''),(386,'white',''),(387,'white',''),(388,'white',''),(389,'white',''),(390,'white',''),(391,'white',''),(392,'white',''),(393,'white',''),(394,'white',''),(395,'white',''),(396,'white',''),(397,'white',''),(398,'white',''),(399,'white',''),(400,'white',''),(401,'white',''),(402,'white',''),(403,'white',''),(404,'white',''),(405,'white',''),(406,'white',''),(407,'white',''),(408,'white',''),(409,'white',''),(410,'white',''),(411,'white',''),(412,'white',''),(413,'white',''),(414,'white',''),(415,'white',''),(416,'white',''),(417,'white',''),(418,'white',''),(419,'white',''),(420,'white',''),(421,'white',''),(422,'white',''),(423,'white',''),(424,'white',''),(425,'white',''),(426,'white',''),(427,'white',''),(428,'white',''),(429,'white',''),(430,'white',''),(431,'white',''),(432,'white',''),(433,'white',''),(434,'white',''),(435,'white',''),(436,'white',''),(437,'white',''),(438,'white',''),(439,'white',''),(440,'white',''),(441,'white',''),(442,'white',''),(443,'white',''),(444,'white',''),(445,'white',''),(446,'white',''),(447,'white',''),(448,'white',''),(449,'white',''),(450,'white',''),(451,'white',''),(452,'white',''),(453,'white',''),(454,'white',''),(455,'white',''),(456,'white',''),(457,'white',''),(458,'white',''),(459,'white',''),(460,'white',''),(461,'white',''),(462,'white',''),(463,'white',''),(464,'white',''),(465,'white',''),(466,'white',''),(467,'white',''),(468,'white',''),(469,'white',''),(470,'white',''),(471,'white',''),(472,'white',''),(473,'white',''),(474,'white',''),(475,'white',''),(476,'white',''),(477,'white',''),(478,'white',''),(479,'white',''),(480,'white',''),(481,'white',''),(482,'white',''),(483,'white',''),(484,'white',''),(485,'white',''),(486,'white',''),(487,'white',''),(488,'white',''),(489,'white',''),(490,'white',''),(491,'white',''),(492,'white',''),(493,'white',''),(494,'white',''),(495,'white',''),(496,'white',''),(497,'white',''),(498,'white',''),(499,'white',''),(500,'white',''),(501,'white',''),(502,'white',''),(503,'white',''),(504,'white',''),(505,'white',''),(506,'white',''),(507,'white',''),(508,'white',''),(509,'white',''),(510,'white',''),(511,'white',''),(512,'white',''),(513,'white',''),(514,'white',''),(515,'white',''),(516,'white',''),(517,'white',''),(518,'white',''),(519,'white',''),(520,'white',''),(521,'white',''),(522,'white',''),(523,'white',''),(524,'white',''),(525,'white',''),(526,'white',''),(527,'white',''),(528,'white',''),(529,'white',''),(530,'white',''),(531,'white',''),(532,'white',''),(533,'white',''),(534,'white',''),(535,'white',''),(536,'white',''),(537,'white',''),(538,'white',''),(539,'white',''),(540,'white',''),(541,'white',''),(542,'white',''),(543,'white',''),(544,'white',''),(545,'white',''),(546,'white',''),(547,'white',''),(548,'white',''),(549,'white',''),(550,'white',''),(551,'white',''),(552,'white',''),(553,'white',''),(554,'white',''),(555,'white',''),(556,'white',''),(557,'white',''),(558,'white',''),(559,'white',''),(560,'white',''),(561,'white',''),(562,'white',''),(563,'white',''),(564,'white',''),(565,'white',''),(566,'white',''),(567,'white',''),(568,'white',''),(569,'white',''),(570,'white',''),(571,'white',''),(572,'white',''),(573,'white',''),(574,'white',''),(575,'white',''),(576,'white',''),(577,'white',''),(578,'white',''),(579,'white',''),(580,'white',''),(581,'white',''),(582,'white',''),(583,'white',''),(584,'white',''),(585,'white',''),(586,'white',''),(587,'white',''),(588,'white',''),(589,'white',''),(590,'white',''),(591,'white',''),(592,'white',''),(593,'white',''),(594,'white',''),(595,'white',''),(596,'white',''),(597,'white',''),(598,'white',''),(599,'white',''),(600,'white',''),(601,'white',''),(602,'white',''),(603,'white',''),(604,'white',''),(605,'white',''),(606,'white',''),(607,'white',''),(608,'white',''),(609,'white',''),(610,'white',''),(611,'white',''),(612,'white',''),(613,'white',''),(614,'white',''),(615,'white',''),(616,'white',''),(617,'white',''),(618,'white',''),(619,'white',''),(620,'white',''),(621,'white',''),(622,'white',''),(623,'white',''),(624,'white',''),(625,'white',''),(626,'white',''),(627,'white',''),(628,'white',''),(629,'white',''),(630,'white',''),(631,'white',''),(632,'white',''),(633,'white',''),(634,'white',''),(635,'white',''),(636,'white',''),(637,'white',''),(638,'white',''),(639,'white',''),(640,'white',''),(641,'white',''),(642,'white',''),(643,'white',''),(644,'white',''),(645,'white',''),(646,'white',''),(647,'white',''),(648,'white',''),(649,'white',''),(650,'white',''),(651,'white',''),(652,'white',''),(653,'white',''),(654,'white',''),(655,'white',''),(656,'white',''),(657,'white',''),(658,'white',''),(659,'white',''),(660,'white',''),(661,'white',''),(662,'white',''),(663,'white',''),(664,'white',''),(665,'white',''),(666,'white',''),(667,'white',''),(668,'white',''),(669,'white',''),(670,'white',''),(671,'white',''),(672,'white',''),(673,'white',''),(674,'white',''),(675,'white',''),(676,'white',''),(677,'white',''),(678,'white',''),(679,'white',''),(680,'white',''),(681,'white',''),(682,'white',''),(683,'white',''),(684,'white',''),(685,'white',''),(686,'white',''),(687,'white',''),(688,'white',''),(689,'white',''),(690,'white',''),(691,'white',''),(692,'white',''),(693,'white',''),(694,'white',''),(695,'white',''),(696,'white',''),(697,'white',''),(698,'white',''),(699,'white',''),(700,'white',''),(701,'white',''),(702,'white',''),(703,'white',''),(704,'white',''),(705,'white',''),(706,'white',''),(707,'white',''),(708,'white',''),(709,'white',''),(710,'white',''),(711,'white',''),(712,'white',''),(713,'white',''),(714,'white',''),(715,'white',''),(716,'white',''),(717,'white',''),(718,'white',''),(719,'white',''),(720,'white',''),(721,'white',''),(722,'white',''),(723,'white',''),(724,'white',''),(725,'white',''),(726,'white',''),(727,'white',''),(728,'white',''),(729,'white',''),(730,'white',''),(731,'white',''),(732,'white',''),(733,'white',''),(734,'white',''),(735,'white',''),(736,'white',''),(737,'white',''),(738,'white',''),(739,'white',''),(740,'white',''),(741,'white',''),(742,'white',''),(743,'white',''),(744,'white',''),(745,'white',''),(746,'white',''),(747,'white',''),(748,'white',''),(749,'white',''),(750,'white',''),(751,'white',''),(752,'white',''),(753,'white',''),(754,'white',''),(755,'white',''),(756,'white',''),(757,'white',''),(758,'white',''),(759,'white',''),(760,'white',''),(761,'white',''),(762,'white',''),(763,'white',''),(764,'white',''),(765,'white',''),(766,'white',''),(767,'white',''),(768,'white',''),(769,'white',''),(770,'white',''),(771,'white',''),(772,'white',''),(773,'white',''),(774,'white',''),(775,'white',''),(776,'white',''),(777,'white',''),(778,'white',''),(779,'white',''),(780,'white',''),(781,'white',''),(782,'white',''),(783,'white',''),(784,'white',''),(785,'white',''),(786,'white',''),(787,'white',''),(788,'white',''),(789,'white',''),(790,'white',''),(791,'white',''),(792,'white',''),(793,'white',''),(794,'white',''),(795,'white',''),(796,'white',''),(797,'white',''),(798,'white',''),(799,'white',''),(800,'white',''),(801,'white',''),(802,'white',''),(803,'white',''),(804,'white',''),(805,'white',''),(806,'white',''),(807,'white',''),(808,'white',''),(809,'white',''),(810,'white',''),(811,'white',''),(812,'white',''),(813,'white',''),(814,'white',''),(815,'white',''),(816,'white',''),(817,'white',''),(818,'white',''),(819,'white',''),(820,'white',''),(821,'white',''),(822,'white',''),(823,'white',''),(824,'white',''),(825,'white',''),(826,'white',''),(827,'white',''),(828,'white',''),(829,'white',''),(830,'white',''),(831,'white',''),(832,'white',''),(833,'white',''),(834,'white',''),(835,'white',''),(836,'white',''),(837,'white',''),(838,'white',''),(839,'white',''),(840,'white',''),(841,'white',''),(842,'white',''),(843,'white',''),(844,'white',''),(845,'white',''),(846,'white',''),(847,'white',''),(848,'white',''),(849,'white',''),(850,'white',''),(851,'white',''),(852,'white',''),(853,'white',''),(854,'white',''),(855,'white',''),(856,'white',''),(857,'white',''),(858,'white',''),(859,'white',''),(860,'white',''),(861,'white',''),(862,'white',''),(863,'white',''),(864,'white',''),(865,'white',''),(866,'white',''),(867,'white',''),(868,'white',''),(869,'white',''),(870,'white',''),(871,'white',''),(872,'white',''),(873,'white',''),(874,'white',''),(875,'white',''),(876,'white',''),(877,'white',''),(878,'white',''),(879,'white',''),(880,'white',''),(881,'white',''),(882,'white',''),(883,'white',''),(884,'white',''),(885,'white',''),(886,'white',''),(887,'white',''),(888,'white',''),(889,'white',''),(890,'white',''),(891,'white',''),(892,'white',''),(893,'white',''),(894,'white',''),(895,'white',''),(896,'white',''),(897,'white',''),(898,'white',''),(899,'white',''),(900,'white',''),(901,'white',''),(902,'white',''),(903,'white',''),(904,'white',''),(905,'white',''),(906,'white',''),(907,'white',''),(908,'white',''),(909,'white',''),(910,'white',''),(911,'white',''),(912,'white',''),(913,'white',''),(914,'white',''),(915,'white',''),(916,'white',''),(917,'white',''),(918,'white',''),(919,'white',''),(920,'white',''),(921,'white',''),(922,'white',''),(923,'white',''),(924,'white',''),(925,'white',''),(926,'white',''),(927,'white',''),(928,'white',''),(929,'white',''),(930,'white',''),(931,'white',''),(932,'white',''),(933,'white',''),(934,'white',''),(935,'white',''),(936,'white',''),(937,'white',''),(938,'white',''),(939,'white',''),(940,'white',''),(941,'white',''),(942,'white',''),(943,'white',''),(944,'white',''),(945,'white',''),(946,'white',''),(947,'white',''),(948,'white',''),(949,'white',''),(950,'white',''),(951,'white',''),(952,'white',''),(953,'white',''),(954,'white',''),(955,'white',''),(956,'white',''),(957,'white',''),(958,'white',''),(959,'white',''),(960,'white',''),(961,'white',''),(962,'white',''),(963,'white',''),(964,'white',''),(965,'white',''),(966,'white',''),(967,'white',''),(968,'white',''),(969,'white',''),(970,'white',''),(971,'white',''),(972,'white',''),(973,'white',''),(974,'white',''),(975,'white',''),(976,'white',''),(977,'white',''),(978,'white',''),(979,'white',''),(980,'white',''),(981,'white',''),(982,'white',''),(983,'white',''),(984,'white',''),(985,'white',''),(986,'white',''),(987,'white',''),(988,'white',''),(989,'white',''),(990,'white',''),(991,'white',''),(992,'white',''),(993,'white',''),(994,'white',''),(995,'white',''),(996,'white',''),(997,'white',''),(998,'white',''),(999,'white',''),(1000,'white','');
/*!40000 ALTER TABLE `victims` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-30 10:36:15

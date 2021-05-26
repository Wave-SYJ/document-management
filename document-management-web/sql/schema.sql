CREATE DATABASE  IF NOT EXISTS `doc_manage` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `doc_manage`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: doc_manage
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
-- Table structure for table `dm_announcement`
--

DROP TABLE IF EXISTS `dm_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_announcement` (
  `id` char(32) NOT NULL,
  `content` text,
  `publisher_id` char(32) DEFAULT NULL,
  `publish_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_announcement_id_uindex` (`id`),
  KEY `dm_announcement_dm_user_id_fk` (`publisher_id`),
  CONSTRAINT `dm_announcement_dm_user_id_fk` FOREIGN KEY (`publisher_id`) REFERENCES `dm_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_announcement`
--

LOCK TABLES `dm_announcement` WRITE;
/*!40000 ALTER TABLE `dm_announcement` DISABLE KEYS */;
INSERT INTO `dm_announcement` VALUES ('75bb5b546ee04891b6bf4f0c21f3f9ce','fawefaw','6c057421ba164e82b77e5bc631c327e2','2021-05-23 22:43:35'),('89ea56e53523481ab358d882011c74ee','啊分为氛围案发','6c057421ba164e82b77e5bc631c327e2','2021-05-23 22:43:48');
/*!40000 ALTER TABLE `dm_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_collection`
--

DROP TABLE IF EXISTS `dm_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_collection` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `paper_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_collection_id_uindex` (`id`),
  KEY `dm_collection_dm_paper_id_fk` (`paper_id`),
  KEY `dm_collection_dm_user_id_fk` (`user_id`),
  CONSTRAINT `dm_collection_dm_paper_id_fk` FOREIGN KEY (`paper_id`) REFERENCES `dm_paper` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_collection_dm_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_collection`
--

LOCK TABLES `dm_collection` WRITE;
/*!40000 ALTER TABLE `dm_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_comment`
--

DROP TABLE IF EXISTS `dm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_comment` (
  `id` char(32) NOT NULL,
  `author_id` char(32) NOT NULL,
  `content` text NOT NULL,
  `publish_time` datetime NOT NULL,
  `attach_id` char(32) NOT NULL,
  `attach_type` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_comment_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_comment`
--

LOCK TABLES `dm_comment` WRITE;
/*!40000 ALTER TABLE `dm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_entry`
--

DROP TABLE IF EXISTS `dm_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_entry` (
  `id` char(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_entry_id_uindex` (`id`),
  UNIQUE KEY `dm_entry_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_entry`
--

LOCK TABLES `dm_entry` WRITE;
/*!40000 ALTER TABLE `dm_entry` DISABLE KEYS */;
INSERT INTO `dm_entry` VALUES ('8a6f35ce8244431dbea6fb8837abc477','fw','fweafawef'),('9a47bc5e293d4849b23a03e1161617a3','人工智能','人工智能（Artificial Intelligence），英文缩写为AI。它是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。\n人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。人工智能从诞生以来，理论和技术日益成熟，应用领域也不断扩大，可以设想，未来人工智能带来的科技产品，将会是人类智慧的“容器”。人工智能可以对人的意识、思维的信息过程的模拟。人工智能不是人的智能，但能像人那样思考、也可能超过人的智能。\n人工智能是一门极富挑战性的科学，从事这项工作的人必须懂得计算机知识，心理学和哲学。人工智能是包括十分广泛的科学，它由不同的领域组成，如机器学习，计算机视觉等等，总的说来，人工智能研究的一个主要目标是使机器能够胜任一些通常需要人类智能才能完成的复杂工作。但不同的时代、不同的人对这种“复杂工作”的理解是不同的。 2017年12月，人工智能入选“2017年度中国媒体十大流行语”。'),('c6f7f1bd5f054e5387fccaac0c090e91','awefaw','awfew'),('ef0f34d469cc46ba87852a4410917bc1','测试一下','你好\r\n\r\n我不好');
/*!40000 ALTER TABLE `dm_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_entry_journal`
--

DROP TABLE IF EXISTS `dm_entry_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_entry_journal` (
  `id` char(32) NOT NULL,
  `entry_id` char(32) NOT NULL,
  `journal_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_entry_journal_id_uindex` (`id`),
  KEY `dm_entry_journal_dm_entry_id_fk` (`entry_id`),
  KEY `dm_entry_journal_dm_journal_id_fk` (`journal_id`),
  CONSTRAINT `dm_entry_journal_dm_entry_id_fk` FOREIGN KEY (`entry_id`) REFERENCES `dm_entry` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_entry_journal_dm_journal_id_fk` FOREIGN KEY (`journal_id`) REFERENCES `dm_journal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_entry_journal`
--

LOCK TABLES `dm_entry_journal` WRITE;
/*!40000 ALTER TABLE `dm_entry_journal` DISABLE KEYS */;
INSERT INTO `dm_entry_journal` VALUES ('2b6b0358cd6e4984b4f18139ceb8ae6d','8a6f35ce8244431dbea6fb8837abc477','5ead3f41381b47568149c4678478a351'),('6b0bd36ea25547bf9a746929239c0491','8a6f35ce8244431dbea6fb8837abc477','4929e37286a1456c9541f6941b0e8965');
/*!40000 ALTER TABLE `dm_entry_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_entry_paper`
--

DROP TABLE IF EXISTS `dm_entry_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_entry_paper` (
  `id` char(32) NOT NULL,
  `entry_id` char(32) NOT NULL,
  `paper_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_entry_paper_id_uindex` (`id`),
  KEY `dm_entry_paper_dm_entry_id_fk` (`entry_id`),
  KEY `dm_entry_paper_dm_paper_id_fk` (`paper_id`),
  CONSTRAINT `dm_entry_paper_dm_entry_id_fk` FOREIGN KEY (`entry_id`) REFERENCES `dm_entry` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_entry_paper_dm_paper_id_fk` FOREIGN KEY (`paper_id`) REFERENCES `dm_paper` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_entry_paper`
--

LOCK TABLES `dm_entry_paper` WRITE;
/*!40000 ALTER TABLE `dm_entry_paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_entry_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_journal`
--

DROP TABLE IF EXISTS `dm_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_journal` (
  `id` char(32) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `organizer_office` varchar(64) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `issn` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_journal_id_uindex` (`id`),
  UNIQUE KEY `dm_journal_title_uindex` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_journal`
--

LOCK TABLES `dm_journal` WRITE;
/*!40000 ALTER TABLE `dm_journal` DISABLE KEYS */;
INSERT INTO `dm_journal` VALUES ('12800d5bcd6a4c43abe7c3c08be5d842','软件工程','东南大学','eafewf','英语','32'),('4929e37286a1456c9541f6941b0e8965','人工智','中国电子信息产业发展研究院','https://www.wanfangdata.com.cn/images/PeriodicalImages/dzkxjs/dzkxjs.jpg','','1005-7059'),('4c9c3d3abf9b48f8b78b7f3cce9f9349','模式识别与人工智能','中国自动化','https://www.wanfangdata.com.cn/images/PeriodicalImages/mssbyrgzn/mssbyrgzn.jpg','','1003-6059'),('5ead3f41381b47568149c4678478a351','aewfwe','awfwe','waf','awef','wefwef');
/*!40000 ALTER TABLE `dm_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_paper`
--

DROP TABLE IF EXISTS `dm_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_paper` (
  `id` char(32) NOT NULL,
  `abstract` text,
  `title` varchar(64) DEFAULT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `author_office` varchar(128) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `journal_id` char(32) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_id_uindex` (`id`),
  KEY `dm_paper_dm_journal_id_fk` (`journal_id`),
  CONSTRAINT `dm_paper_dm_journal_id_fk` FOREIGN KEY (`journal_id`) REFERENCES `dm_journal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_paper`
--

LOCK TABLES `dm_paper` WRITE;
/*!40000 ALTER TABLE `dm_paper` DISABLE KEYS */;
INSERT INTO `dm_paper` VALUES ('00d618e3d4484d6cb1608a7dfb20a421','oHQOS','oHQOS','oHQOS','oHQOS','oHQOS','AAA',NULL,'2021-05-15 00:00:00'),('00d67f4a075e4577afe301acde406566','84Yv2','84Yv2','84Yv2','84Yv2','84Yv2',NULL,NULL,'2021-05-15 01:42:46'),('01552e5f219f49ae8a01386cd08c8431','KRm7N','KRm7N','KRm7N','KRm7N','KRm7N',NULL,NULL,'2021-05-15 01:42:46'),('0211c2a0ceab4812b8630b13ac026dd5','7VmZ9','7VmZ9','7VmZ9','7VmZ9','7VmZ9','','4929e37286a1456c9541f6941b0e8965','2021-05-15 00:00:00'),('037ac1fa80704b0cb73ae55f492ca9a5','yWwko','yWwko','yWwko','yWwko','yWwko',NULL,NULL,'2021-05-15 01:42:45'),('08b12ea5e9774bc6b164fb16c71a5bc3','t4jJ7','t4jJ7','t4jJ7','t4jJ7','t4jJ7',NULL,NULL,'2021-05-15 01:42:46'),('0af5919f51d540dea7fd77f94a35d0c9','jCIOG','jCIOG','jCIOG','jCIOG','jCIOG','fwaefw',NULL,'2021-05-15 00:00:00'),('0bada86097014d7e9204c44f06e17c26','prC2U','prC2U','prC2U','prC2U','prC2U',NULL,NULL,'2021-05-15 01:42:45'),('0e5aa117008444ea9574120b6800731d','axaAn','axaAn','axaAn','axaAn','axaAn',NULL,NULL,'2021-05-15 01:42:45'),('0f0a62bf047a4dee9b94da3c03f2f3af','C9wEt','C9wEt','C9wEt','C9wEt','C9wEt',NULL,NULL,'2021-05-15 01:42:45'),('0f6faa7899a4426ca947eae6fbb530a4','2rQyO','2rQyO','2rQyO','2rQyO','2rQyO',NULL,NULL,'2021-05-15 01:42:45'),('12673e7890fa49d7b79be7cad821c85d','U2tv3','U2tv3','U2tv3','U2tv3','U2tv3',NULL,NULL,'2021-05-15 01:42:45'),('12bbb7bc3e5d4610b38e1c49f1d7b125','gE5Ux','gE5Ux','gE5Ux','gE5Ux','gE5Ux',NULL,NULL,'2021-05-15 01:42:45'),('161fcb17325a49338687d7245b0d7872','NiDD4','NiDD4','NiDD4','NiDD4','NiDD4',NULL,NULL,'2021-05-15 01:42:46'),('18121096a3f84ef29f84af3145c1789f','kdGqP','kdGqP','kdGqP','kdGqP','kdGqP',NULL,NULL,'2021-05-15 01:42:46'),('1a9b2c027ae14db699c49bda23327dcb','Nr9il','Nr9il','Nr9il','Nr9il','Nr9il',NULL,NULL,'2021-05-15 01:42:46'),('1e03502ea301445b9647570945862cf4','CnEO3','CnEO3','CnEO3','CnEO3','CnEO3',NULL,NULL,'2021-05-15 01:42:46'),('1f1636e52b694a39bc8d4995ebd5a7b8','WeCxj','WeCxj','WeCxj','WeCxj','WeCxj',NULL,NULL,'2021-05-15 01:42:45'),('1f49d03a5a9040779d49540484d6f6e6','hDgC9','hDgC9','hDgC9','hDgC9','hDgC9',NULL,NULL,'2021-05-15 01:42:45'),('21ea7f0bd0684994826cb493c227476f','G8Qbz','G8Qbz','G8Qbz','G8Qbz','G8Qbz',NULL,NULL,'2021-05-15 01:42:46'),('25ba10f324bf44809d6896ce09cafffc','GtbtG','GtbtG','GtbtG','GtbtG','GtbtG',NULL,NULL,'2021-05-15 01:42:45'),('28af5141108940f296b27f50a7802c9b','25UGq','25UGq','25UGq','25UGq','25UGq',NULL,NULL,'2021-05-15 01:42:45'),('29122429f2954bafa84f31b13ce68169','AgVh0','AgVh0','AgVh0','AgVh0','AgVh0',NULL,NULL,'2021-05-15 01:42:45'),('2d2dc94654fd4b06b2c16e9b387b11fc','fLOIP','fLOIP','fLOIP','fLOIP','fLOIP',NULL,NULL,'2021-05-15 01:42:45'),('2d6a64e0717b472aab5ba8d253b2cad3','gbSMT','gbSMT','gbSMT','gbSMT','gbSMT',NULL,NULL,'2021-05-15 01:42:45'),('2ddefdbb99804e9aa1baaa7ef1c4387b','4sa0m','4sa0m','4sa0m','4sa0m','4sa0m',NULL,NULL,'2021-05-15 01:42:46'),('2eff41e9120d430792471593f97e5ae5','feawfweaf','aaa','awefawef','fawef','fawefwaef','aewf',NULL,NULL),('3195b47573f44413b3f4f2f5c0bb059a','PupoM','PupoM','PupoM','PupoM','PupoM',NULL,NULL,'2021-05-15 01:42:46'),('319dfcc29dcc46bb83cf3da13c0f0515','AgxBk','AgxBk','AgxBk','AgxBk','AgxBk',NULL,NULL,'2021-05-15 01:42:45'),('31c0c0010478465f9d7ca7012a505797','41Ebd','41Ebd','41Ebd','41Ebd','41Ebd',NULL,NULL,'2021-05-15 01:42:46'),('31dae8b2e5504ced8bbbb3d15598a969','KeDYb','KeDYb','KeDYb','KeDYb','KeDYb',NULL,NULL,'2021-05-15 01:42:45'),('34fb2830358c45c0b37e824ab721b1f5','HFt9N','HFt9N','HFt9N','HFt9N','HFt9N',NULL,NULL,'2021-05-15 01:42:45'),('3514823774ff4cfcac63f35ad7c18534','fawef','aaaa','afwef','waef','waef',NULL,NULL,'2021-05-12 00:00:00'),('3939c593c0134d73afc7e8e683ecf0ba','Y7CUF','Y7CUF','Y7CUF','Y7CUF','Y7CUF',NULL,NULL,'2021-05-15 01:42:45'),('398a227367a046cf935a6582144d0db9','N943g','N943g','N943g','N943g','N943g',NULL,NULL,'2021-05-15 01:42:45'),('3ba86e0a55dc420eb3f769ab9ede29c2','f9U2g','f9U2g','f9U2g','f9U2g','f9U2g',NULL,NULL,'2021-05-15 01:42:45'),('3dd63813c8e5408ab2c66fa93a226d16','ykXi8','ykXi8','ykXi8','ykXi8','ykXi8',NULL,NULL,'2021-05-15 01:42:45'),('3eeb58a8aa874d4081d634f667ee2071','Hheaq','Hheaq','Hheaq','Hheaq','Hheaq',NULL,NULL,'2021-05-15 01:42:46'),('3f5b4e98d298476a9b08fd624305f4c5','w5h27','w5h27','w5h27','w5h27','w5h27',NULL,NULL,'2021-05-15 01:42:45'),('3f9e288c1e2e4d05ae67ba4c3b52d1f3','IgOnI','IgOnI','IgOnI','IgOnI','IgOnI',NULL,NULL,'2021-05-15 01:42:46'),('443b8be1bf5348c6a2baaca6652d8515','aewfa','w','awef','wfawef','aewf',NULL,NULL,'2021-05-11 00:00:00'),('45bf8d5c40aa4802b21788e694afd26d','wafeew','aaaa','awefaw','awfawef','waefw',NULL,NULL,'2021-05-05 00:00:00'),('474d24d8f54d4bdeaacd75a2d10e9da7','h9vP4','h9vP4','h9vP4','h9vP4','h9vP4',NULL,NULL,'2021-05-15 01:42:46'),('48198b11178c4e1cb32bf6cc2609db66','40ilo','40ilo','40ilo','40ilo','40ilo',NULL,NULL,'2021-05-15 01:42:45'),('4c2273e498ab43f4881a878a5979e3cb','RUnLh','RUnLh','RUnLh','RUnLh','RUnLh',NULL,NULL,'2021-05-15 01:42:45'),('54fabd2d0b9e4c0fba6536898d7f3024','3Xi1E','3Xi1E','3Xi1E','3Xi1E','3Xi1E',NULL,NULL,'2021-05-15 01:42:46'),('56826555c9e34facaed6bb6d68c61bc3','WBnn2','WBnn2','WBnn2','WBnn2','WBnn2',NULL,NULL,'2021-05-15 01:42:45'),('56aa4d363ae8477b9fe4478213dd6683','KtoUe','KtoUe','KtoUe','KtoUe','KtoUe',NULL,NULL,'2021-05-15 01:42:45'),('59203449938144c8a8f01d390959b3da','ZYL9U','ZYL9U','ZYL9U','ZYL9U','ZYL9U',NULL,NULL,'2021-05-15 01:42:46'),('59c8cd66f3e2429198ce63f9f67c6428','XTn1T','XTn1T','XTn1T','XTn1T','XTn1T',NULL,NULL,'2021-05-15 01:42:45'),('5a66284eb458485ea05c62c35d2f9bc1','IXiLG','IXiLG','IXiLG','IXiLG','IXiLG',NULL,NULL,'2021-05-15 01:42:45'),('5a939858ab8a421b89d8056241d17fea','摘要','你好','关键字','作者','单位',NULL,'4929e37286a1456c9541f6941b0e8965','2021-05-14 00:00:00'),('5b4da9129d3e45b3bf341765198462d5','DwsaG','DwsaG','DwsaG','DwsaG','DwsaG',NULL,NULL,'2021-05-15 01:42:46'),('5eee26dba27842b0a6a6eacefca400c9','RNsMo','RNsMo','RNsMo','RNsMo','RNsMo',NULL,NULL,'2021-05-15 01:42:45'),('62a3466c49cd45429c956b2d0e0d8691','34Opd','34Opd','34Opd','34Opd','34Opd',NULL,NULL,'2021-05-15 01:42:46'),('63167865ee6a4cf1be544a68aa8875f7','caqHO','caqHO','caqHO','caqHO','caqHO',NULL,NULL,'2021-05-15 01:42:45'),('63e58c5043f64c61a57c3e97036424b9','awfe','fewf','wefewaf','wef','waef',NULL,'4929e37286a1456c9541f6941b0e8965','2021-05-12 00:00:00'),('66795e0d83ec4d3ea16802b659320d46','u2ble','u2ble','u2ble','u2ble','u2ble',NULL,NULL,'2021-05-15 01:42:46'),('68986be8131c46ca8a74b01e8a36a257','vXcQf','vXcQf','vXcQf','vXcQf','vXcQf',NULL,NULL,'2021-05-15 01:42:46'),('6c1737483568425da49532fec3d3a89f','1DWZA','1DWZA','1DWZA','1DWZA','1DWZA',NULL,NULL,'2021-05-15 01:42:45'),('6c9ff7481bf74c6db4be787f0e6db26f','B7KmT','B7KmT','B7KmT','B7KmT','B7KmT',NULL,NULL,'2021-05-15 01:42:45'),('6f970985c5c24305923a039e6f5ad6fc','ewaf','ceafe','faew','aewf','aewf',NULL,NULL,NULL),('7956df4a4ca446e6a02c10b426a5d781','ePSMV','ePSMV','ePSMV','ePSMV','ePSMV',NULL,NULL,'2021-05-15 01:42:45'),('7af16430de7646f990b43de2e5562f16','摘要','测试一下','关键字','测试一下作者','单位',NULL,NULL,'2021-05-27 00:00:00'),('7d4111c5a8fd457f877d4f57415c4421','3oxhF','3oxhF','3oxhF','3oxhF','3oxhF',NULL,NULL,'2021-05-15 01:42:45'),('7ea2e5a7127043609b9ad435840c17b1','wDtRy','wDtRy','wDtRy','wDtRy','wDtRy',NULL,NULL,'2021-05-15 01:42:45'),('7f20e89b6297450aa3b56e59e9998918','','HHHHfawefwafeaw','HHHHfawefwafeaw','HHHHfawefwafeaw','',NULL,NULL,NULL),('83d91b69912d42cfbcb1c7c84ad90d41','Ohbpf','Ohbpf','Ohbpf','Ohbpf','Ohbpf',NULL,NULL,'2021-05-15 01:42:46'),('84613e7bc5154ebcadc4077bd5f96235','PyDro','PyDro','PyDro','PyDro','PyDro',NULL,NULL,'2021-05-15 01:42:45'),('8ac7d777d4e94a299da276624b406a15','tiEaU','tiEaU','tiEaU','tiEaU','tiEaU',NULL,NULL,'2021-05-15 01:42:46'),('8f84c9f3cd7942cf8ac62acc6b6b3873','PN7Fp','PN7Fp','PN7Fp','PN7Fp','PN7Fp',NULL,NULL,'2021-05-15 01:42:45'),('92a506f0298e46f0a3d4bec32dfbee80','tpJAO','tpJAO','tpJAO','tpJAO','tpJAO',NULL,NULL,'2021-05-15 01:42:45'),('94e44af8d439412da12115f4a361da82','9vksV','9vksV','9vksV','9vksV','9vksV',NULL,NULL,'2021-05-15 01:42:45'),('953e229fa0dc4ca5982a33e0d6aa1868','faewf','wef','awfe','aw','aewf',NULL,NULL,'2021-05-11 00:00:00'),('971c89f4375d495a93a1032e23a97a69','QiOqE','QiOqE','QiOqE','QiOqE','QiOqE',NULL,NULL,'2021-05-15 01:42:45'),('9c3d34d2bdf048399535e4dc87ece847','3YZb5','3YZb5','3YZb5','3YZb5','3YZb5',NULL,NULL,'2021-05-15 01:42:45'),('9fcef3c49e614899b9b39138928069bc','rqeZv','rqeZv','rqeZv','rqeZv','rqeZv',NULL,NULL,'2021-05-15 01:42:46'),('a0e4a702142440e7943694b4208be8ee','6wXwK','6wXwK','6wXwK','6wXwK','6wXwK',NULL,NULL,'2021-05-15 01:42:45'),('a17803c39f254701a6af033bc0fe51ff','medbR','medbR','medbR','medbR','medbR',NULL,NULL,'2021-05-15 01:42:45'),('a1b17f0e637e433185c15ee2bd12b5c4','wMbLg','wMbLg','wMbLg','wMbLg','wMbLg',NULL,NULL,'2021-05-15 01:42:45'),('a2ad297317e94efbb0bf78c001ead5a7','yX1BY','yX1BY','yX1BY','yX1BY','yX1BY',NULL,NULL,'2021-05-15 01:42:45'),('af0aa554786b41f0a6ef5d2279a735e0','XKdju','XKdju','XKdju','XKdju','XKdju',NULL,NULL,'2021-05-15 01:42:46'),('b4760f093a2f4e35960c33b27793fe65','dD6tJ','dD6tJ','dD6tJ','dD6tJ','dD6tJ',NULL,NULL,'2021-05-15 01:42:46'),('b9b019ffffef441daa96e2e46be90d53','pqhxq','pqhxq','pqhxq','pqhxq','pqhxq',NULL,NULL,'2021-05-15 01:42:45'),('c1fced1943534d5980a5ab59950658ba','CINb9','CINb9','CINb9','CINb9','CINb9',NULL,NULL,'2021-05-15 01:42:46'),('c2a1ccac6b204aa9be073ec4260469de','Lk0cf','Lk0cf','Lk0cf','Lk0cf','Lk0cf',NULL,NULL,'2021-05-15 01:42:45'),('c2f7852f429941409ae07a0c7d869483','VUavh','VUavh','VUavh','VUavh','VUavh',NULL,NULL,'2021-05-15 01:42:42'),('c81c5ba86c604cba8744261d3630b2af','5SUiE','5SUiE','5SUiE','5SUiE','5SUiE',NULL,NULL,'2021-05-15 01:42:46'),('cb530813d84d4296b8c1bda234f6469f','2WX56','2WX56','2WX56','2WX56','2WX56',NULL,NULL,'2021-05-15 01:42:46'),('cbcec416ade948c7ad63b5f745c462b9','yjxR6','yjxR6','yjxR6','yjxR6','yjxR6',NULL,NULL,'2021-05-15 01:42:45'),('ce50fdb544764af3b85bd6f60a9d0c46','m41Q1','m41Q1','m41Q1','m41Q1','m41Q1',NULL,NULL,'2021-05-15 01:42:45'),('cea402516cd24b3496cf2c96020d5939','O7QJH','O7QJH','O7QJH','O7QJH','O7QJH',NULL,NULL,'2021-05-15 01:42:45'),('cf6e6aa7bd2c42f0a247b6dc2f3966ad','oUOiX','oUOiX','oUOiX','oUOiX','oUOiX',NULL,NULL,'2021-05-15 01:42:45'),('d1dedc6972c84d469d1838315d45591b','FK1Ez','FK1Ez','FK1Ez','FK1Ez','FK1Ez',NULL,NULL,'2021-05-15 01:42:45'),('d251b643822e463ab3c03850deb5754f','PM2rJ','PM2rJ','PM2rJ','PM2rJ','PM2rJ',NULL,NULL,'2021-05-15 01:42:46'),('d6809c5961ba400b8269106bc2b20df0','BsKRr','BsKRr','BsKRr','BsKRr','BsKRr',NULL,NULL,'2021-05-15 01:42:45'),('dd3f580a9b4f4db3a452dab8c608079f','HMKwV','HMKwV','HMKwV','HMKwV','HMKwV',NULL,NULL,'2021-05-15 01:42:45'),('e01126d030654fba9ceb8e5af2029041','DCz63','DCz63','DCz63','DCz63','DCz63',NULL,NULL,'2021-05-15 01:42:45'),('e6161923bef14200973832d6bf2cb7f8','Gc8tv','Gc8tv','Gc8tv','Gc8tv','Gc8tv',NULL,NULL,'2021-05-15 01:42:45'),('e6362664c8304475a25b6f6a245d1bce','OoiGp','OoiGp','OoiGp','OoiGp','OoiGp',NULL,NULL,'2021-05-15 01:42:46'),('e637f9fb548841328e2183f3641ee10c','jnBS8','jnBS8','jnBS8','jnBS8','jnBS8',NULL,NULL,'2021-05-15 01:42:45'),('e794a18ca0c94f4889342d539beeff97','WzplF','WzplF','WzplF','WzplF','WzplF',NULL,NULL,'2021-05-15 01:42:46'),('e7cf3557c8884b79acde5a0d65d1332c','xSQsr','xSQsr','xSQsr','xSQsr','xSQsr',NULL,NULL,'2021-05-15 01:42:45'),('ea02c02ec67a4f11b56b497a223f167c','5bsZG','5bsZG','5bsZG','5bsZG','5bsZG',NULL,NULL,'2021-05-15 01:42:45'),('edd79d562d8440678c52378b1d386240','FLMMV','FLMMV','FLMMV','FLMMV','FLMMV',NULL,NULL,'2021-05-15 01:42:46'),('ee9e2a51551e46abb89bd58328f90f50','9emmG','9emmG','9emmG','9emmG','9emmG',NULL,NULL,'2021-05-15 01:42:46'),('ef9940df18a2415ab7aa1f1cf3722076','TEBBf','TEBBf','TEBBf','TEBBf','TEBBf',NULL,NULL,'2021-05-15 01:42:45'),('f89299a5eecc49c498cb523fb3d81897','8uEXr','8uEXr','8uEXr','8uEXr','8uEXr',NULL,NULL,'2021-05-15 01:42:45'),('fd8c938f933945128e61cc2d41509c52','WkVJl','WkVJl','WkVJl','WkVJl','WkVJl',NULL,NULL,'2021-05-15 01:42:46'),('feb28dee5ee44732ad5b1d56d8ae6b94','fR4pY','fR4pY','fR4pY','fR4pY','fR4pY',NULL,NULL,'2021-05-15 01:42:45');
/*!40000 ALTER TABLE `dm_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_role`
--

DROP TABLE IF EXISTS `dm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_role` (
  `id` char(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_role_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_role`
--

LOCK TABLES `dm_role` WRITE;
/*!40000 ALTER TABLE `dm_role` DISABLE KEYS */;
INSERT INTO `dm_role` VALUES ('063b904c9f3211ebae1700155db07c91','ROLE_SYSTEM_ADMIN','系统管理员'),('06402d619f3211ebae1700155db07c91','ROLE_USER_ADMIN','用户管理员'),('0652d4a59f3211ebae1700155db07c91','ROLE_DOCUMENT_ADMIN','文献管理员');
/*!40000 ALTER TABLE `dm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_subscription`
--

DROP TABLE IF EXISTS `dm_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_subscription` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `journal_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_subscription_id_uindex` (`id`),
  KEY `dm_subscription_dm_journal_id_fk` (`journal_id`),
  KEY `dm_subscription_dm_user_id_fk` (`user_id`),
  CONSTRAINT `dm_subscription_dm_journal_id_fk` FOREIGN KEY (`journal_id`) REFERENCES `dm_journal` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_subscription_dm_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_subscription`
--

LOCK TABLES `dm_subscription` WRITE;
/*!40000 ALTER TABLE `dm_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user`
--

DROP TABLE IF EXISTS `dm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_user` (
  `id` char(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_user_username_uindex` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user`
--

LOCK TABLES `dm_user` WRITE;
/*!40000 ALTER TABLE `dm_user` DISABLE KEYS */;
INSERT INTO `dm_user` VALUES ('0367ebda0f6f4f79aa03c29c9e226b83','w4pGd','$2a$10$bEQPRYLC.PxNAYGPaB.BhODOn9DRTgFFd6qTYGHdCyA1LnJp57iYW'),('04472e77a4cc45ccb72e840f16cd559b','dHEhH','$2a$10$I6mRjBiQqvvJ4TPJJFXUNeoiDaBQcs5fm4gI26crZFTuZf59i.lz6'),('05436445c167493b93cac11ecfc8ff48','SHhay','$2a$10$Pl1SJi8jOuNFaJ5bmS/zK.yfPpvH/zSmSAgDAczmh0/75pCL7iqQ6'),('0807bcf334224339b1825e9c25c589ce','HS16s','$2a$10$4Mxy9basXYIEvt4pWQBodOFWnG1iLLLMfwyeU5WF1jUVzTfiIMeF6'),('08dd096556d84ebe80a712abeaed480c','3bSew','$2a$10$DPFf7Zv8ce2Sbql5Y//gher0cwGJFVFjBkRqlv06d0VgznmCqeK9G'),('0c15a812e7df4651af16e0a876b7a2e6','98qT2','$2a$10$MdtyQXXUPviXhgFQt4Rk7uMpff3EjToO6MlYAucwGf0uZla.ffH8C'),('0c56857491644555a260af57ddd31dec','jmxU5','$2a$10$JQRZHyR1SBPel3LPB8ioq.8p66BRfc82M6Kxb0YiadeACXM/JF3WK'),('0debac7b47b54974995e13f526959444','uEvF9','$2a$10$xjDhtUiQPYKl9AqM3Yn9TOrlfja7vsoXuAPEB0h8XcryVicQsQcqy'),('0e36212f16e645faa5e487b0d4b8a103','DuGPx','$2a$10$z3u4YM9f/zO9sFhzkBCT.O0mnEVOSCsxeII4u72i8Gnl0lbqzh/Me'),('145b0c3e227d46f4a61d05cf4bd2c104','Ozmm9','$2a$10$QhtReq0RB3Luh4frL56RmubUsurD7DbETf9l3XvZVEH6UlTAYAbtS'),('160daf6a9c5f4148b2f665f2ca36eb11','PjfvQ','$2a$10$e6Rds.GJBh/9ZCh/BFjkyuX6fY3LFVzeaU/2vGgOI8sroodZAGTEm'),('1640c88f487d4aea82be67e41df86a3a','SdC5P','$2a$10$86tU9DXyNmRVrhuaeouu3O6Rt2/ocdYFjZZ6uBmqY3FLsHnq3RWf.'),('1a045a958032446b97c4ee80262da6e6','JJePY','$2a$10$suSGrPsC3h2D.hc/QxhrNOZJ7NMU4ORJYjiCTaCTH5yjU.zoZ4p6m'),('25bf550662b54ee8aa3c8fbfee4cff0a','Ei0W5','$2a$10$Z6qz8ozGcH4wQQaXEjkF3eQxd8dLzXEDS7QiDLwAXhWNGf/2dfTVe'),('288a693f96954b6d96bc02507eecd090','jiVO9','$2a$10$u/Gw9tTvR9LEizjKPNYOb.WhnWCma0xQOuAa9HN967j60Sc7Tkv52'),('28faaf1e7638426098641265375f734d','VRnAU','$2a$10$qdeu9LQfANRArdwNDoXoHu15Cy1XSxXQUxKFunUd3ga0ZEG03GXV2'),('29390639c2a944a5b060433f9e0369ea','BGvUe','$2a$10$rq1Pz46iUJdZLEGXu4.0s.QV16mfPPPUHjjngXRJDRMBH02qcnWvq'),('2a3d6cc6cda44b27b82fe3aa86e0e0ea','ZVPNS','$2a$10$VjTLp8sZ3mryrS4hxgJu9OfdvA10Hn/n1l3tPly.nIraqMqeikl2W'),('2b0bac497e014fdd861801cf434040f7','6tXUy','$2a$10$1Nkw2eX27X5.5ot2tmRgXuIisoH226cVvGA6lWieGximsCDnOvz22'),('2c2d9fd978b240bc97c1749444d03e6c','boJC6','$2a$10$RYfJbJaZkmoXrGFD5leAjOyDXCL9HTyGOgWs5fdepQS5drluaReui'),('2cbc92ec74e34b7ab417adffe5f89bad','WGx03','$2a$10$ljSKjA4ZZozUB8Ga5B892uRugf69PfA05ASojGMABooau/6c3znF6'),('2da076bf0b3b4b149c39c90d131ed0d0','MgE19','$2a$10$GZ3Km9pHUOdJbIb3cqdOveXe3nkLjNdM21u5LlHGrX0gAueTgVVT.'),('322c1170e469472a8913305bb938bcbc','gJXko','$2a$10$Sc/wr0Oq0FlVDD38.liR6.xLQXTFKZhVFYjdpifdOF0o51I.Pesv2'),('3b5c9a9afcf348928cdec8fb93bb97df','23uu1','$2a$10$tYe7EgIANYqwMIxJNq3qtubTQx2ey51/Vx8K6HtQn/0mnMH3M.Maa'),('3bcfbc7216794913b8c1ed6867080838','aHdnG','$2a$10$/gWk5C23AI5jMXlDVlAlWeSO./dd/ZMltNNPH.ENw6IjpOzKdZ2QO'),('3bd87794b0d54d33ba9789dab1e697ba','sDWfL','$2a$10$BAN.1idbV/4Kobj4IxPI4.H7vfRwwf0Pp/RgIdXyfdpZ9.jFv3Ib2'),('3c1d684118dd47a3b7b5262ef2512c17','bETSA','$2a$10$tsHtMvZIsTBWN/UKyV.4aeVzJugzSNS3DsNFa0enp0UjdNa2b2EMe'),('3c4bfa4b139f44f1af0822ba6f920f00','tCHFF','$2a$10$hW8MxTUejN.jv5/.zgcckuWrtJIwO3qGFamQA1O8akw5eUjG4enOC'),('3c5c2799520048fe8f47ab51f1bd6b5d','KpM0C','$2a$10$gqxYR4kyVUuqKiaV0UrU8.6ivyADAkt30Tk4Wk5mJDPp2evLjsMu.'),('41044a45b05b4948878deda39f01687d','NF3wZ','$2a$10$aERpzYjoeUZvpslbGxuF4.bgF9Vxq/XVILG7m68Oe0srtYF/rmHy2'),('43d3a28a36ce48f5adb2f4cb5c293b0c','OLUW4','$2a$10$Tw6T9/YVzdPXtcVmxVaTsuuLNDLmXZvJWe8Hq9FbawCTZpi9wgl4i'),('46aa893305fb4fdebe7cdba14ce27e5e','gc60t','$2a$10$h/pP0vP5ABFESjPmOHWIzu/6QwzCmoWECGBhdC7AX1bc0aFr/BBOG'),('4ae0ef75605a4db9ae76740113bcef8a','bhKvy','$2a$10$aNoJrd7jYIa9Nf3gODkU/O3Pnhflti4mMMP/RIsCoUuBV0BZRmzcO'),('4d01807dff4b420991520efafa843d9e','bXiQg','$2a$10$Aq5HAaA3MKqWLeMyPfHxC.ziD8OlTvATEESLPMDGu4P5fpr1Ke/1S'),('50426849883f4e40bf63f9bc5195c74d','LcyFh','$2a$10$rzKaKh5TBlrP688JfrWd0.UeyRDZ77tqPT/wz9pO8548Zit6MIwVm'),('51278e00b3b74cd9a00e737ca991e89b','GwMNq','$2a$10$0ZYXHHgjh3K2NsCjH1wVeO1l7tbYtYpNFHTEPoUlOr9iShqFoAUM2'),('5ae3971e208f4a4aa23650d35dfd60c2','a4Dah','$2a$10$8idueGQ2qHVHGXh6R.Kw1eqmso1MygT.oo3eu3VIVtm3YtCzhKPpu'),('6209fc3fb0644b939f1affdab3cbfa08','9f3AV','$2a$10$VSZuIk.KSlp6ukBMgTu2DOFSt/DzVR7kjlLUwa62SV7gAP6kLoobu'),('6703bdacec184f4b9ae3e9c3e9ca0514','H1z6m','$2a$10$/.FIq01PNw.VNmM/IFgIweQ5jk3qHmtkUupWe1iHWpbmUGW2cqmYS'),('6c057421ba164e82b77e5bc631c327e2','admin','$2a$10$.jvdzfyVjfxyycUp5IXOAOrnLqsz08i1WJ/WQcItiOTkWH/pU69YK'),('6c880c1dbad6419cacb241708ba8060e','Kn75Q','$2a$10$xJ6y37qOW98r6IChRUef0O7qCU5j78fVA4tb9GDnOqhV.yfvHaWBi'),('6fdc1c51228645c8be540b1d722b8100','phPmM','$2a$10$U8Q5B49mg9jnAqne7jy8WeK05IFBs1Qj2OIoJzRWf78CmqUgeDubW'),('727c3e6e61fc470b8a9367818eae8efc','k6Ivx','$2a$10$kR.RsDabOWLyHzIRg0SosuqEmDkJBv4xX8H0nU73bqPk0lOc8ke7y'),('75e5cca008c24406b7370c219f48bdcb','e357m','$2a$10$B8Oq6jAHzDa1qKY.E2HJ..n2pg49S9DZZiHWYiQJ4HmucDds4hrKG'),('77c4bb786bda438490f95ba025ab86ca','MTOOY','$2a$10$5Ftuzcl4wIXeJTEBTFfqHeVMtvFUW2cq1AY0bS4CJFHafLo.x4UyG'),('79649d6e22644724bb6b5086d1e1a186','Eco27','$2a$10$CZs09yG7vh8DGXzCzHJDIeym8aHH8gs9WNiD.cn06B2JC48DvItUC'),('7997dd6e97fd4a71a4b9c49afc4cb35d','NSI0s','$2a$10$Cmcj7KdlSc0fYLXrVmU6K.4sLFCmGGszrdT.WGQxNORxhkzEU/CFS'),('7df73c62ad7c4fc7abc7e034a13b8685','kG7JI','$2a$10$HvhDPirWqx9Gmincyfy62uznUShvPj3nvMlte7IkA98d5LfHdz/Qi'),('7fa159566ddb4762b504fbbcaacafab9','qw90C','$2a$10$.im4Bj.qG9FwgSX3OE5npeV7e6foDcLTGFHqOnyLt0FrrK7ycM97i'),('800094494d6948ca9053ff788fefa2a0','ekdwP','$2a$10$CHggu4SJZc6PKnN/LnuEEul.9VC1.vXQ8x7GMb6a0MHQwUY3Ebcvi'),('83d566c0676e4bc68d42092d814b4f9d','ZNRxC','$2a$10$oPlP4F.BKdjOnGsDfUGSzew5HwS5Efl86El8gEnpCPBnlXaFbfq5i'),('848b2f845ce94080a45fd7311ad250a0','ltzUr','$2a$10$Iy0Wp1not6PPQ3Gc3eBpDOwPRG06sqhqVdTsqAwGadX4z2voSXdBG'),('860765f1e8a34436b7c26456ce0d7624','rMXDl','$2a$10$BKIMEESfGZ4I3dMrXFx7Pe5Xv9YpS6Mjd4y69//9QrbxFFezxXS6K'),('86a14c9286304012af82e771d9a2310e','3Gx0y','$2a$10$aNZgv2P/rMp.PlK6vvxosOfQ4/6nrBHsNtQaWvC2lEIRYDpwNm84.'),('8b2b88712f964c27b395e26c7b2e25ac','rDABP','$2a$10$6E/sq3PK2CsKp6yUlSRHjO2fzIB/YCcn7Vld7N3rZWM0NVKOdpBPe'),('8c88e47a20ff45d3be460b0415def8ea','S7Mdk','$2a$10$c7GqFmUk97F.QrqpAJu2Cu33x6icZWfglfFEBf6F3DEOMlhwmL/Ou'),('8c95fb5a47a3486bb38c0163f70b43de','I1fa6','$2a$10$Kvy8hWynm3DPHeQcoZS30OZafHD7UzypwQvcg5iXJB6.Ogk2cHTsm'),('8fcbafb9c6a543e8860445b1e0c903a6','nTfxF','$2a$10$KMmzfkDL3IuGdw6k5pFfZu7FXL48cebb9hMuWdrSat49FIeq0AI/m'),('9757493f30a54fe1a989c3fe1bd44b7c','AEDfW','$2a$10$Mp.s/SGTXc7ZfAxWZ0tSD.tAuufAFjdLlGfXNrQBCjYvrtD3ifez6'),('9be8fa816f4049ea8e6e594d743b38f7','xS1Is','$2a$10$9hHs.Jb.xFmgBVBFkATrFeXZggNiNg0AzxHtIfQXwHihHBJIOwkme'),('9c09c615860140159e017170ea31982e','0cXSg','$2a$10$p3k1mZco0TYFP7pCyZ3zJ.6tMaZMn4yUsG8fDrVKzrxn9wTQIJS3S'),('9c7293f8c54a4f5ca0b472303a042987','UkN6k','$2a$10$F0fLlBD/sMaGQywfa1gZ6u52gS2Ou0bspWvEf6YmJfvlI83FyMFnO'),('9c80bdf9162b4ad5a4ea8446c9a0ca72','OSeQm','$2a$10$RcddKeitRixYpiE.uvm22eubor8.UfL5ac1H.p9u65MDbt7uYpLDy'),('9d797c80ce9d488fb034e9ed98a0281a','pIViT','$2a$10$1DhF1VPMUogLJsnGoOsB6OhGQ0RLJurdawmgDuJ46SWwLVcUL7HJm'),('9d96114ff04f47fb9b3bfd8ffa317592','6Q6n7','$2a$10$xgLspiWHs6X9mYThSODF5.FcW/snY1FUDxbZhh6NFE2036Q/C8pdm'),('a52ff455ba874cb0b70a931912d78d80','vy7nZ','$2a$10$HBz4eKL4cZHDIjhDwG84zuJZbD1r8SzQGrXG8iIlIeN.LTI/IMnxW'),('a5d6abd14a3e4a48a7560d50bb955afc','iOcgM','$2a$10$pnoR6UbN7vezUKJtdtFWeuOk8oZqNswsljwnk6Lu6K2SrhtPaTCNW'),('a75856d3c7e64cee916f1ceb58480230','cYyWx','$2a$10$xH7Ejon1sl1sGb/V8TWW/eFIjpSRjR0/lX2y.iAG1ftAKts2PbeUC'),('acf70cf3355e4f9195278cae674f8247','N9IfQ','$2a$10$gMmH4UB6/ygTnEBN.FFVUeOzaxche7GO01S2yuIQWklQ1HT9FZVpu'),('ad9c0b06e8d34edbbfc596b97df29697','DIY0q','$2a$10$MnxtYb4dlDGnwNn6wAg.Gu9Yx5NCTuFrjFvRg368WIcaIn6p5glBK'),('af0c4c3de6ac461ca139c1be880dc661','bPnOe','$2a$10$SzEqVarhLLrAurVWNCROIeit.YGv8pZPHt/89d6qznzT9VfoXbKOe'),('b0f0d06f5fe146028368fc2a3d3079b2','ThoCh','$2a$10$FfPljobeCFogM6FrI4H8mOqXDFKcj70tJ96yKLiYLMUlgzZft./vi'),('b136166e1c67465e935655ed2f520abb','az1kA','$2a$10$QnwIOK7T/ubcIsvLsMcY1enk43J12q/DZmbxn7s0QNmN0nuE1rcWe'),('b1f388af4dbe49588f718d824040ad97','ZmaYZ','$2a$10$zsq/pXQFVnGTqz.5tkjMuOD5GWrQTTJmS1jR2axWTMbMl7lMhi6PK'),('bb0616e674ce406e8e073eb65f98d7b9','w1bE4','$2a$10$dnRJs42ZBuK4vt.pUGM/f.TYuSDnGRuE8vZIVvrCCEQmktS6gFsnG'),('bbc21ae7261e43fd9ec9ee4912949e32','uQGUt','$2a$10$kVDsnbPMi1S6AHHqf2jYquvyZxTuIxgsPcb/XTYIqrHCudGgcUDii'),('c02ecc329fed4040aa330a2f1050ee35','rVrYm','$2a$10$1RlrxjDLnygdU4SWpJ243u7LxY4xeKViF1U96GNdJvsyx.ZutHo1O'),('c254a1f22e494aa9b38404d1d329e3ad','9rJCC','$2a$10$F5n.FalTIhbrwC1sljIXPuuJLEbVaeMscgdDMt8u.5EMUkNRoxWOK'),('c3cfba783ee4452caedb50521852abcf','EYVE2','$2a$10$Nv8ISPOhpVyuli7fojEWVuk.cFh1I93BGn.7iXCwp0QcUMHX228Ci'),('c4119ce52aa5495288630e17943be5b6','Wc0JZ','$2a$10$AYyISdctKiu9ze/xXb3Blu5q1SZ6ow2THX77BU2F1NsFddOMi0uxO'),('c578d6ca91754f5abd866f4c7427cb14','bxpJ1','$2a$10$XQkZDDqe2AKMVN8BVoZOrungrtsbl9CEVbVZMneAENxY72zXYizOO'),('c5f966ab8de2421da4fb58447f342209','9WRt3','$2a$10$Fn6HiDBftEdtQGO/igJVPOuZutJmfhiosSkpuAAwuhh4V8gHAamU2'),('cdadc65eef6244f2851ab04f09cf904e','CQgjy','$2a$10$MSO5dtR./SD1gzb2pvRJHeyBe.q3iTN4k51sYvsuMShSuF9ocOJAS'),('cf64588933fa4394952cf56e9115711f','EXX79','$2a$10$T.iW23mIHQPpKttxF1Wv9uLiIqUngcdLF7CMRocQllvkIoS6p2z2C'),('cf6a78effa88432fb75db8f519f3ec7c','4kTCl','$2a$10$eSLEhbq8sQlbq0KUKwgMy.nKrlQZUG3xrNVPmvSmkGRppuk6uOyi2'),('d1f51afab4054ad193d51663b4ee6596','j6bEe','$2a$10$3qWw7RpCPLXtzjsH2/2uW.6j14nnHtDlncmiCJvKNHy7MAOe3qBe2'),('d48ead05334d4294be4dd784e865c45e','ueAhU','$2a$10$NlK5uGWJIlOsca8Wzrq/Ge5oAPjhAeZbav5lpdMG6KH8QPFWvzae2'),('d5588e1708734a98b04df903c6d7c854','t1JuZ','$2a$10$jvUnhcZ7cPAWNG9Vc0RGHuCo59ABQzU.0i8t4yQjGvgTlqST7TRtS'),('d773d775444044988fa8a974112de412','m30Hy','$2a$10$PQeOtXV9xXxAZ9o1gJT6POWUxsRvj1DOr08Ayohi5R.GXJ0BOs1V2'),('e4a684e8740e403d978530a30b5822b7','e0pWE','$2a$10$4KTudTy0c5WzxIavLZFryeEUeHuntCMX9SNJAi95rzPWSitIi1fLC'),('e9ecb100dc64489cb14888d8c628ea4d','SWKLJ','$2a$10$1beOxeX3vUtjb9AJxFEeEORGbTq6ExdepdsFZRxnFTI0pjtTvM2fu'),('e9f9fb47b4ec44bb962ba31a8e1ccf32','KApT1','$2a$10$/h.bm0fSy8cLrZWUEPAD1ulqY0JPL/47PrBMGWyf64nlT1MAR4/YC'),('eb6658cead374accb1c0b9dac0b1f067','trEAM','$2a$10$vZsqkdEx6Ljzc.ifXWSkyudFg2NfVNG1wit/v//JSolsfZ03062bK'),('ebe783b582f24c4d91d98f226df94169','HKve2','$2a$10$gs/TQn8Lm8I06yxj.jcXAeYQZMePNNyVHqbObTGEf2hc9qp8pFFxK'),('edca09debf82407ea48b0b70cba34048','Nw1oO','$2a$10$ZnnTVsgyxU3Dgx27kNkiy.C38lDWWVTBD/WyOMHlnirzVFNwenZtK'),('eec1e9e539654f09896ed1f26f5954d0','KNDBm','$2a$10$PfhD0BSsCppFjkpAo.cRa.7vHasRn35PmbtyIY5VW2X0lAWwtMqE6'),('f09ccace855943faa644a2e96a5f297b','Mmqa0','$2a$10$jI7Ud6bJa8itswPy49NJXuBcOJ8B2NvcVOawqD8K3h8jLF9cw6vIS'),('f8aadef789cb40a5948cf69950ce6103','bFbvy','$2a$10$jObx1CVPTdY2/OPXKsadTuunlCwLtB9wUSGfC8dHWKm9ywNgKwjAy'),('fd4b6d2497c14582bba9c74e2b645add','0PVML','$2a$10$BDapxlzK5fcPCktwM2vpUuO3KWzFfAQlLTHEmpy/vTljMAPyCg9bG'),('fe63a48dc99847af89336a2c5b9687e3','JKJlo','$2a$10$It51vuO7DedX0PGMG3yPA.ydXruu0bIglMFbtRRsmxE/Gr7QLneyi'),('ffab621520cf48f2a106ed967e617862','yls2k','$2a$10$mAvrxYnBh0oCeVJE17jB9eI9nKrjLHbWSFktlZSOyS4ZZqOg4n6La');
/*!40000 ALTER TABLE `dm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_role`
--

DROP TABLE IF EXISTS `dm_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_user_role` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_user_role_dm_role_id_fk` (`role_id`),
  KEY `dm_user_role_dm_user_id_fk` (`user_id`),
  CONSTRAINT `dm_user_role_dm_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `dm_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dm_user_role_dm_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_role`
--

LOCK TABLES `dm_user_role` WRITE;
/*!40000 ALTER TABLE `dm_user_role` DISABLE KEYS */;
INSERT INTO `dm_user_role` VALUES ('001fecaebdf811ebba1a00155d9f87b9','05436445c167493b93cac11ecfc8ff48','06402d619f3211ebae1700155db07c91'),('44efaf3fc1bb434db81811ef51078cf9','6c057421ba164e82b77e5bc631c327e2','0652d4a59f3211ebae1700155db07c91'),('48cd8d2beb404488b1cd2838c81d4a0c','6c057421ba164e82b77e5bc631c327e2','063b904c9f3211ebae1700155db07c91'),('5ad1852cbdf711ebba1a00155d9f87b9','08dd096556d84ebe80a712abeaed480c','06402d619f3211ebae1700155db07c91'),('8e3ed656d58949db9f31bd6ab9d1fa4c','6c057421ba164e82b77e5bc631c327e2','06402d619f3211ebae1700155db07c91'),('8fda1472bdfb11ebba1a00155d9f87b9','0807bcf334224339b1825e9c25c589ce','0652d4a59f3211ebae1700155db07c91'),('90aed48dbdfb11ebba1a00155d9f87b9','04472e77a4cc45ccb72e840f16cd559b','0652d4a59f3211ebae1700155db07c91'),('92f929a6bdfb11ebba1a00155d9f87b9','0c15a812e7df4651af16e0a876b7a2e6','0652d4a59f3211ebae1700155db07c91'),('92f9bd73bdfb11ebba1a00155d9f87b9','0c15a812e7df4651af16e0a876b7a2e6','063b904c9f3211ebae1700155db07c91'),('92f9bf18bdfb11ebba1a00155d9f87b9','0c15a812e7df4651af16e0a876b7a2e6','06402d619f3211ebae1700155db07c91'),('93f96e32bdfb11ebba1a00155d9f87b9','0c56857491644555a260af57ddd31dec','0652d4a59f3211ebae1700155db07c91'),('93fa2280bdfb11ebba1a00155d9f87b9','0c56857491644555a260af57ddd31dec','06402d619f3211ebae1700155db07c91'),('949a992dbdfb11ebba1a00155d9f87b9','0debac7b47b54974995e13f526959444','06402d619f3211ebae1700155db07c91'),('957a5c01bdfb11ebba1a00155d9f87b9','0e36212f16e645faa5e487b0d4b8a103','06402d619f3211ebae1700155db07c91'),('962ef4f4bdfb11ebba1a00155d9f87b9','145b0c3e227d46f4a61d05cf4bd2c104','0652d4a59f3211ebae1700155db07c91'),('9a3f606dbdfb11ebba1a00155d9f87b9','29390639c2a944a5b060433f9e0369ea','0652d4a59f3211ebae1700155db07c91'),('fdd46dc5bdf711ebba1a00155d9f87b9','0367ebda0f6f4f79aa03c29c9e226b83','0652d4a59f3211ebae1700155db07c91');
/*!40000 ALTER TABLE `dm_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` VALUES ('admin','hvXQj1Nm/LnNLTIHs5aDVw==','ACChP4EDqCdOCnb7TNkVvw==','2021-05-26 11:09:30'),('ZbAiX','ofNre9FFVDTsH0pbmzvYWA==','ab8/689gGBWJcK86DqVxYg==','2021-05-04 12:18:21'),('ahUjB','qToXJZVKPlLmqw018+eeMQ==','L1kirA+Fv3aFP7vjuyGs2A==','2021-05-23 06:49:16'),('4pQUO','seIDwZ8HBePWO43dpt/ojw==','vDKRtFtMy2mPl2owbkDW0g==','2021-05-15 01:15:02');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 19:17:59

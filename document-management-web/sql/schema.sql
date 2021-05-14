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
/*!40000 ALTER TABLE `dm_announcement` ENABLE KEYS */;
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
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_entry_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_entry`
--

LOCK TABLES `dm_entry` WRITE;
/*!40000 ALTER TABLE `dm_entry` DISABLE KEYS */;
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
-- Table structure for table `dm_invite_code`
--

DROP TABLE IF EXISTS `dm_invite_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dm_invite_code` (
  `id` char(32) NOT NULL,
  `code` varchar(16) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_invite_code_code_uindex` (`code`),
  UNIQUE KEY `dm_invite_code_id_uindex` (`id`),
  KEY `dm_invite_code_dm_user_id_fk` (`user_id`),
  CONSTRAINT `dm_invite_code_dm_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_invite_code`
--

LOCK TABLES `dm_invite_code` WRITE;
/*!40000 ALTER TABLE `dm_invite_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_invite_code` ENABLE KEYS */;
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
  `image` blob,
  `language` varchar(32) DEFAULT NULL,
  `issn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dm_journal_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_journal`
--

LOCK TABLES `dm_journal` WRITE;
/*!40000 ALTER TABLE `dm_journal` DISABLE KEYS */;
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
INSERT INTO `dm_user` VALUES ('1ce95b2c68284a91a1e59c7c39624228','gDTVf','$2a$10$wQIe5NkQ9TgK5WRrBURo8.XOdqCCekgPQmmeFW.RGDWYh5KIInonG'),('1e09cdd889dd47f195327c3c47f58e87','ahUjB','$2a$10$22ZdLyDCZYS78jPZv3wiU.F5r3iEvEPxaftu6GDsBiQuc9YpQYxxy'),('2002b7794cab42aa966ad6442c75f0df','tYzOk','$2a$10$b9TPWyi6npX4jYsfSNUp5OQGiiJnWKl.Ab.3Qp726hRUfBaSJEH2C'),('21c5646bf7224938b3ff6bd068a31618','dBCgi','$2a$10$pcL9s.UPtm.tgz0jRO0hV.1sYzmqISTaclHnXL6GUI1uPybiHGcvi'),('21cd378dff9945ed8f9a092c4f7067d6','PaZCr','$2a$10$6Z6oHepJ.eAnKQDu0EL2HOiAGjQhNxMAkg0.JFVdtLvnVdM963AOy'),('22f716812c2641d7982b915fd669d39e','ql1w4','$2a$10$TwvMy5yID0vZi39eKCWyeOUapGSu17PLCedgFVN9mX.yDCLVGk4Hu'),('24706ab454b543909c9ff99e13d64fb9','Fxpor','$2a$10$80oW7xkiJ/1rhkbscQQMLOe1T5LtBFT4RTSGdtYiIQizlfEGR8YpS'),('2bdef1e0177645109e68818db54bffc0','i2jQ7','$2a$10$A56Dugw66fnGUFusA573hushkvbOp3zGio7GJS4ozAm/gLlznDh3C'),('328c8a759ca24ff8a7544c66ee8222e5','aqiUT','$2a$10$Bic3TbTS5HOdpD9IUsujw.cpTM318yi6FBF449dLOqnZG5b42awRu'),('360bf37925604e1e97981dfdac610354','pPcEM','$2a$10$jSpEJnZkJ4v38/TwS8SQ1O9C6s8mpumkynLnp4IsF2h0ltaU34rIi'),('3b704ccce98d4200995821bdebf69ac2','V3FnX','$2a$10$l.UiKLTl/iay/Pm5wyuboOnL8ytmFqe9pSOqi4vSfXMscGJPlxEiW'),('3c1986c2344c440f8165a5cd09edcdb5','n8Y7b','$2a$10$48GqACNkfMdXksHXMmRJuuicQuaBsZYQqGbbWecBJ9I6NEmFaYihq'),('3d5d9f98a1d8419d9cecfc609f6ff1fc','6ssJj','$2a$10$qmZgcCL9dS0wUhp9J.exS.8P5KxH/QNEY1YQsCQ9MeVbhVJ.MjFlK'),('3e321490502841538718f6460e35e239','6TsFi','$2a$10$RBdJdPEsO/xmxvK17trlOOIgpreevOOFRm6cuNd0p2En8EjzAhw9K'),('419a4b5a578849f6a4f8e84b03c0f297','O3sTb','$2a$10$YKMhzyLJJ4EY3pUcQfdSUejKY0wzqYuAIcn1Li8TAfavqFb1cqb/.'),('449fe40230b345aca97394bc7305cfb0','kwP4j','$2a$10$119SIu.OPBBIRYPo2vWfCuIbQb3D/QciFkBXLmlIsIJpD/xhE.WCK'),('4bed18c1535a441588ea9df84158fa7e','ggsmm','$2a$10$EqNo4lfvkN7YBH3RkVrytunzgf5maLPn6pP9KvofpKndrGvhK97YS'),('4cea43e332664a728c923f45a74c2175','K1UmO','$2a$10$ErEsFMtpbb.FkJEMuGgqceyrioBFikIPBqMtfCvtdcU4IqlryFHDa'),('4d0f5376713945a3b035b1a774e6923f','kzBmv','$2a$10$J4qPdSRBmEGEaXVvstjjreIhiIuNgoZXhr89wjzkyXKjrz6tuapde'),('4ef5fd3f1e9242d69c18bc959aa4ec69','evNJI','$2a$10$U1Zk7EUHXAGQdVqvmO7vqud0X8zqX3JK37vMbaEr4wyIuYN88/sX6'),('5124c2691ce44137807cfb72a44ab3c6','hcwxe','$2a$10$kqffa7/KH.yH1PsPIsKYE.5VvlXbWFrJqpteNDa65xwJHlWQSiCVy'),('59c7c4fbcc0949b9a9b67e37f2ef7520','42yZG','$2a$10$H.2YpsM9lTUed4vR1oW0K.ehBjdLFwTxDatrKDIlvLuxo53peBAPO'),('5a9c954d91a542feb38c891cbd245ae8','i23Cp','$2a$10$p88EdT196/obIb0v.neHsu5kkXSD.tgBqx1tknHGGpBV.vyNf0iOS'),('5d403266a6c34a239bce5c220c713895','tXsdJ','$2a$10$1ymXoEoWER.8WeioxNF0qO.H5sKs.8Q0O4HJLT0/DnXDUqJwRXj6a'),('67de12dea6ba4b0a81581cb88df9e915','e3YuL','$2a$10$rV3e1SBd/53M14p5zvh0ZOV9yTti4CgFCxUxlUHiFZJQKeXV9xSX.'),('684adc681afa4fcd80dca3be71cd5f22','1GKby','$2a$10$3MRqRkZ2YV8gkH7Hk5SqqO.Xgo5XDfa0i0g4NXYJt0gcru5PtI/lK'),('6b26c7602979454c8e46fc1683e23c91','om9J2','$2a$10$0OL2o4GpwQ3GOdsXHrFbxuWowYzcSf0wc6pG84awK.hmaHp1NFhay'),('70393356784b40339cb7b3c080c3e374','OPEPt','$2a$10$iFWrM4loaeicAMsOT3my4OYlZLLU0gpXNHHdOsXDCvHWeEPPpk0DK'),('746a092a2a364682b6d9071bc1f89ca7','v2DKm','$2a$10$vexp7nuej3pHwz0DG8uhS.nMlEyBcn6itEK6sSdjPuwd.nBZ3YwJi'),('7703f890d9b44e189f994c66ab91b4bc','phiNY','$2a$10$V4vowO.xaJmJBk6gRrJHmOe6FCe6.cG2Rie8U342hRfcAkF9TPSUy'),('81b5a09a2941463ab5e72ccc72633a68','4pQUO','$2a$10$tWaD4sXBgz8dNTu4HaGA7OO790c8CTQ2XUgkC40hBgo9hjjsWLsn.'),('83754679830f412ca4ac553122160e0f','2oaIL','$2a$10$ECBg.XRQ.mFGZ9.D7ssBtuaHHNa0OeOSnykt04eSQPnIncvHe7Fnu'),('83bbeb131fc247d2ab5607e8f5797f01','LU45r','$2a$10$0FOv8mqkDZy9GQBW0ORTzu/AgD0K6E.JdqqrHdemd.sXABAHQGjOG'),('8a25b8d0ce0b4bfea528d133944e5637','BmJ5t','$2a$10$.Nod6Lo40SCRzDlCktzrFOvIpuNXoE23qWa03lYzlB8THTKLeLpeK'),('8cde8c711bf2414e83a678affe49c55c','gANiI','$2a$10$C5kBK6KHcKOeIYSKT6Q/neO90p5rJsPx/NKqhhijMQ1dUV4s8Co2i'),('8eed5d06e65a4c74b05291743c91cb6d','JqtBs','$2a$10$elFFX2IA5839AxPzeBx6VeEabt60nB7NUzDAloHE3Hp4O6I6amUD.'),('931043cc93ae492c8ebb157336f837a1','3m17y','$2a$10$wxOwbsr6St6nOCbOMzgk8OjQScyy6pK4cSjxjyydiNE/zqgV1VAwe'),('93393444df5341349894a2c9944482f9','P6Xxf','$2a$10$fXBUMTAystUJhDT7Q527XeRUcMwmBXJyw9J9EdBMbQPcwzwXNRRi6'),('95b5d23779324aae92a8a7cb0c68e9c6','MA50J','$2a$10$fuQHNAVdwpZNeSjCs4pA7uH3xarJMHLAnrDQxWMUKRQWaJhb2Rn/m'),('95c1f4fe053a477ca0dbf66dc2fc923f','Rok5Q','$2a$10$88qE/kdtPiAblZO6c4K00OyDqpisQoLwFHUdE8dNBMrdq4jUGjDuu'),('964c3fa03fa04aad8a9877242435ddc5','lHM4f','$2a$10$XpcKQ1EOVFpJEgP8jroYEugwXFdBYJrVoJh9sJUbVlNKqPNqnGVpi'),('978e86f74b7447e195a758c6034fd014','hyfJ6','$2a$10$NyW6dfjcJtwJZLqU3HpUCuLnARz8Zb9Znczeq96gze9I3QH4pHSIu'),('9c104f97fc63452da11ec1cfbb9d2589','arque','$2a$10$pwhYjqOUR1z6NjKiWJ3ipOa1cOkT6dbj./4UiuJGF3Qp5dQcfp6DK'),('9df0bab89176443b88e7ba83b9f5e31d','waDYf','$2a$10$hFpnQ/NuETT7X3UP23xo..vRtK7tiZCxelM4mG92xYuMVMhSysD5.'),('a31d945d72f94523bdc2c86f6370a5c9','HB6Du','$2a$10$Dt5ji7cdTH269y8MFU7LO.g7e7k5GoPaFhFEpXWtbF6VekRoNUWQq'),('a4b48a84999e4203b98074439161ed8a','5WRvF','$2a$10$z9O0HcbafBG7S68Pv9y1UePgDYGCnswfA3BRGhVWVaf6sWeyN4Ooe'),('a4b799d96f2845e6a06541aa30ec8190','YfqtJ','$2a$10$VO.cNLiyyfsTuBtM5onmwO4mTvBZy.ly4FkZTCAv.Yu3YnefLL7nK'),('a5d8aa364362496eb8dad7c7766f161f','kHHc7','$2a$10$.ZxUi0ah3yI4pzN5tAoARO5RIP4ayGdQpcWO925BzWvZhfrPDrTtO'),('a9a0dda4e55d4b72989ac12b16d5683b','1DmC3','$2a$10$p8UvHQZluTXCn.yLsvidVO6dAi79STbYc68QzS8/.5x6teo66enqG'),('a9d0b459d625411d94447fbc42d457f6','pRj7K','$2a$10$AAgzw44CCD9ZzY9YcbIK/eFuus8xEHkZrvVEHt.CKPrYf8WEzBqVq'),('b082a552cc8b42f6bb1c32ee3b692a63','LX8QR','$2a$10$eT0122UeBvS3Yqa.WKzoI.gyIJ7IQ1lUiGNpEjXOBfThjBU985unm'),('b0a80418ce3f42b4b37aebe3f0d07731','vOLqv','$2a$10$4YXbVytmGPNoZ8SMrDftluT7oAY1hu2lAkEozWeE7WFdFvWGRgxMC'),('b0efbf975ab246678b230a4cd1a72b76','Qavp2','$2a$10$7q94YWn8xeeHqYCIaE/IkOCxwpvFdvd2Q0xHjkOsv1QNQNDoYKVXe'),('b297689f2f944d549ccde9ce28760f2e','G006Z','$2a$10$XtuAyOFAgLL0sQy6lJKeWeDmsbWfbnJ52GJjG5DGtfjSs/t7ZZORi'),('b4483eaaf3474dba86da600e4cb7b7cc','QUsGa','$2a$10$u1K0CAFjJeTBg63M9UcrQe2FR8f2AHt9au/2DExR4cgDTm5emz.5C'),('b68f01ae0adc4a0e8fd188b2084610e7','oEHNv','$2a$10$quJBuft7JD1gjnn4lHtWneUA2RL1mA7s0/pyuapGgW03KNCxjxE9y'),('b6db1ab910b844a2a3c0ef9c118588e8','Z13ve','$2a$10$cXjH/gouWei.SW9dFp1dvO8C20kobokcUttahlxq5QHhNu95eFuPu'),('b70b98d9a5234b6795b03f6e89d2f9f4','NrkRg','$2a$10$lF/uY9tK/pVjpvA.BBGsweimo14ZlJr1inkjijDbKzLbkec0lh4/G'),('b761b8bc868047a59df9c207ea6a2ff9','YepU0','$2a$10$LsViokKX9DMnBi3BqqdtXOvdSuzREVym.HvYeJZMz71sh2DLefBqy'),('b9ed96e1118d4ccea4afad65b4089394','AF0Ef','$2a$10$fYcxrybuQXqCpRxUfDVAM.a1VhNy1zmETVK1n1CtrUywnadrB6l5q'),('ba1c2b8920214d95b8b4ab9660a42f35','3D6x6','$2a$10$AsUpoAhlNlq6.OQW9izbB.GEP43rJp3mRFSKBF5jdy3MwjjVMf5am'),('c0d6c4b737d144f3a6e8830066b2bb17','SONf1','$2a$10$HQ9FlDMuOhq5AJPanqVr2.GFOCiDn9pYE5iNz783fAawsKWA8ClAS'),('c15f1f77fc494fff9f4ca3cfb253e134','lvYrP','$2a$10$4qAuQzx2me0Zb1wyc8/PieIgFIU1Wxnio3jwClDtfBT7h1biDcyL.'),('c176a724249a428581aa5c0cc11f54e2','haP6E','$2a$10$uFGETVcfA5C8F6G8Uj4nBeGKjcXjco9.mtXmL85nixaE6faDXrvxO'),('c2d1b38af3eb4b4baec2f81414b51a1e','ZNM8w','$2a$10$rsl6uaE92bm.Lr2Dd02.y.GFixzQYfqsTqpNVKgAFCCfXISAcvpv6'),('c2ef98756d5141cfb29a02ec4a799fa4','eldgx','$2a$10$wJf0fcmmpC5wyGXnL85PuOMxo.gkFNFqUpcn9K.DptC6UQux3A8F.'),('c7e3c7019d0547e6bfa5d6cd77532d9a','w6Ppj','$2a$10$MGLb2gOxqLG.eIzigV2nMuxdKrM.3SaOm12PH.jXnZBL3IQ/7rCoa'),('cbeff69b4c624bf0857460ced796402f','62ac7','$2a$10$2njX/49G5iTADNCinIUpMemF7j9.CrApgJ1Nc0fb0yAjoV94hzC8K'),('cd3e43ac1afc4cbab99cf6df3a42a406','FUhOS','$2a$10$WQ1HA4C4eNhvWkdFmbzfpe4NMcGm.tWke4bkbE.oLeLSOlbbiYUvK'),('cf2d6868751a4d7dbd2c2c663acdb358','vmIJy','$2a$10$MCQF/AjwzzBSaTboIJBjPOWH7S8kcckEB9vxz9domGU2iwb0y4bla'),('d63fce87a9ed4305a5111acd1f8156ca','oTPxx','$2a$10$Wj.r7Iryaaw.e8NeHX95CePNDfZHtTPbwCKYnOiVltYwgwGnuMuzu'),('d7c33f214d32400c9099eb86c7374a70','a85JD','$2a$10$dJPDBnV3E4iJUEM1PhKIo.RDNNb0pMCSuU9XCJVzXg8qO1jNxzs8a'),('d91647e20f5840e0a25f5e99e9895c76','qlRFS','$2a$10$QIQOg74tYmjjON9SfTEgJ.D8BaAi5NmDqOdoc9AkIz1/Ww9E3t4QK'),('d950e7e8691e42aabdb2fa8a74e1c39c','9gIbT','$2a$10$kwcyE59d27na60IuweZc1etnT3ib5G11hqFNICrsmHSnGCqPgD5dO'),('d9cbb1a6dcb943d69e2783fd6f7267cb','jLK8o','$2a$10$novrsltko1CnWfYO4TXQ0.azRYzSKJct7mjs5bjrB5bs3z6il8wo6'),('da008ee9499a471a95365d45990f5536','8tABf','$2a$10$a4ahtjrvzxHNIqPul.f3uumDB5bwK8SNQgJI3GbH/HORP.Ek/ueMq'),('dca90f41f05042dab1b62c09a97dd715','PmcN3','$2a$10$HaOOqiu2c3ctdUtPcZp7Q.kDRnGYMB3iPRgNloUi8rvyIIAHB0jW.'),('e2991487b9cf44b1b64f5111cb4c26ba','iUTfc','$2a$10$jMVnS.ZwbrXIXp2ZCM7Ja.I4/wC6exx2UpR2AtK1sNWJiaEngf8Ye');
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
INSERT INTO `dm_user_role` VALUES ('6934f1adacc511eb985e00155d29ef63','d950e7e8691e42aabdb2fa8a74e1c39c','0652d4a59f3211ebae1700155db07c91'),('6934f5c1acc511eb985e00155d29ef63','d950e7e8691e42aabdb2fa8a74e1c39c','063b904c9f3211ebae1700155db07c91'),('698bd6d5acc511eb985e00155d29ef63','360bf37925604e1e97981dfdac610354','0652d4a59f3211ebae1700155db07c91'),('6b2d4fceacc511eb985e00155d29ef63','1ce95b2c68284a91a1e59c7c39624228','0652d4a59f3211ebae1700155db07c91'),('6b2d52bbacc511eb985e00155d29ef63','1ce95b2c68284a91a1e59c7c39624228','063b904c9f3211ebae1700155db07c91'),('6b2d53c7acc511eb985e00155d29ef63','1ce95b2c68284a91a1e59c7c39624228','06402d619f3211ebae1700155db07c91'),('6b50bc18acc511eb985e00155d29ef63','b0efbf975ab246678b230a4cd1a72b76','063b904c9f3211ebae1700155db07c91'),('6b50bff5acc511eb985e00155d29ef63','b0efbf975ab246678b230a4cd1a72b76','06402d619f3211ebae1700155db07c91'),('6b8457f6acc511eb985e00155d29ef63','67de12dea6ba4b0a81581cb88df9e915','0652d4a59f3211ebae1700155db07c91'),('6b91a5a1acc511eb985e00155d29ef63','da008ee9499a471a95365d45990f5536','063b904c9f3211ebae1700155db07c91'),('6b91ac4eacc511eb985e00155d29ef63','da008ee9499a471a95365d45990f5536','06402d619f3211ebae1700155db07c91'),('6b9e215bacc511eb985e00155d29ef63','449fe40230b345aca97394bc7305cfb0','063b904c9f3211ebae1700155db07c91'),('6bcd91b3acc511eb985e00155d29ef63','419a4b5a578849f6a4f8e84b03c0f297','06402d619f3211ebae1700155db07c91'),('6bd91e19acc511eb985e00155d29ef63','59c7c4fbcc0949b9a9b67e37f2ef7520','06402d619f3211ebae1700155db07c91'),('6be4e3b5acc511eb985e00155d29ef63','3d5d9f98a1d8419d9cecfc609f6ff1fc','0652d4a59f3211ebae1700155db07c91'),('6bf0c383acc511eb985e00155d29ef63','c176a724249a428581aa5c0cc11f54e2','0652d4a59f3211ebae1700155db07c91'),('6c14f2cbacc511eb985e00155d29ef63','d9cbb1a6dcb943d69e2783fd6f7267cb','0652d4a59f3211ebae1700155db07c91'),('6c14f5e1acc511eb985e00155d29ef63','d9cbb1a6dcb943d69e2783fd6f7267cb','06402d619f3211ebae1700155db07c91'),('6c37d2e1acc511eb985e00155d29ef63','b0a80418ce3f42b4b37aebe3f0d07731','063b904c9f3211ebae1700155db07c91'),('6c43d7dbacc511eb985e00155d29ef63','b6db1ab910b844a2a3c0ef9c118588e8','0652d4a59f3211ebae1700155db07c91'),('6c50d088acc511eb985e00155d29ef63','cf2d6868751a4d7dbd2c2c663acdb358','063b904c9f3211ebae1700155db07c91'),('6c50d929acc511eb985e00155d29ef63','cf2d6868751a4d7dbd2c2c663acdb358','06402d619f3211ebae1700155db07c91'),('6c5e90fcacc511eb985e00155d29ef63','2bdef1e0177645109e68818db54bffc0','06402d619f3211ebae1700155db07c91'),('6c6a88b3acc511eb985e00155d29ef63','a4b48a84999e4203b98074439161ed8a','06402d619f3211ebae1700155db07c91'),('6c76e840acc511eb985e00155d29ef63','c2d1b38af3eb4b4baec2f81414b51a1e','0652d4a59f3211ebae1700155db07c91'),('6c76eb2dacc511eb985e00155d29ef63','c2d1b38af3eb4b4baec2f81414b51a1e','063b904c9f3211ebae1700155db07c91'),('6ca731c4acc511eb985e00155d29ef63','c15f1f77fc494fff9f4ca3cfb253e134','063b904c9f3211ebae1700155db07c91'),('6ca736c8acc511eb985e00155d29ef63','c15f1f77fc494fff9f4ca3cfb253e134','06402d619f3211ebae1700155db07c91'),('6cbf1e92acc511eb985e00155d29ef63','d91647e20f5840e0a25f5e99e9895c76','0652d4a59f3211ebae1700155db07c91'),('6cbf2161acc511eb985e00155d29ef63','d91647e20f5840e0a25f5e99e9895c76','063b904c9f3211ebae1700155db07c91'),('6ccb2525acc511eb985e00155d29ef63','c2ef98756d5141cfb29a02ec4a799fa4','0652d4a59f3211ebae1700155db07c91'),('6cee6a43acc511eb985e00155d29ef63','5124c2691ce44137807cfb72a44ab3c6','063b904c9f3211ebae1700155db07c91'),('6cee6d1cacc511eb985e00155d29ef63','5124c2691ce44137807cfb72a44ab3c6','06402d619f3211ebae1700155db07c91'),('6cfa5f47acc511eb985e00155d29ef63','2002b7794cab42aa966ad6442c75f0df','0652d4a59f3211ebae1700155db07c91'),('6cfa6284acc511eb985e00155d29ef63','2002b7794cab42aa966ad6442c75f0df','06402d619f3211ebae1700155db07c91'),('6d0617b5acc511eb985e00155d29ef63','b68f01ae0adc4a0e8fd188b2084610e7','06402d619f3211ebae1700155db07c91'),('6d1d35d6acc511eb985e00155d29ef63','a5d8aa364362496eb8dad7c7766f161f','063b904c9f3211ebae1700155db07c91'),('6d28a500acc511eb985e00155d29ef63','8cde8c711bf2414e83a678affe49c55c','06402d619f3211ebae1700155db07c91'),('6d349ed0acc511eb985e00155d29ef63','b9ed96e1118d4ccea4afad65b4089394','063b904c9f3211ebae1700155db07c91'),('6d34a289acc511eb985e00155d29ef63','b9ed96e1118d4ccea4afad65b4089394','06402d619f3211ebae1700155db07c91'),('6d40a0baacc511eb985e00155d29ef63','6b26c7602979454c8e46fc1683e23c91','0652d4a59f3211ebae1700155db07c91'),('6d40a3a2acc511eb985e00155d29ef63','6b26c7602979454c8e46fc1683e23c91','063b904c9f3211ebae1700155db07c91'),('6d4c43d4acc511eb985e00155d29ef63','cbeff69b4c624bf0857460ced796402f','0652d4a59f3211ebae1700155db07c91'),('6d4c46eeacc511eb985e00155d29ef63','cbeff69b4c624bf0857460ced796402f','06402d619f3211ebae1700155db07c91'),('6d644a3facc511eb985e00155d29ef63','d63fce87a9ed4305a5111acd1f8156ca','06402d619f3211ebae1700155db07c91'),('6d7049cfacc511eb985e00155d29ef63','dca90f41f05042dab1b62c09a97dd715','063b904c9f3211ebae1700155db07c91'),('6d704cc1acc511eb985e00155d29ef63','dca90f41f05042dab1b62c09a97dd715','06402d619f3211ebae1700155db07c91'),('6d9fc2efacc511eb985e00155d29ef63','c0d6c4b737d144f3a6e8830066b2bb17','0652d4a59f3211ebae1700155db07c91'),('6d9fc66cacc511eb985e00155d29ef63','c0d6c4b737d144f3a6e8830066b2bb17','063b904c9f3211ebae1700155db07c91'),('6dab888cacc511eb985e00155d29ef63','22f716812c2641d7982b915fd669d39e','063b904c9f3211ebae1700155db07c91'),('6db6d817acc511eb985e00155d29ef63','9c104f97fc63452da11ec1cfbb9d2589','063b904c9f3211ebae1700155db07c91'),('6dd039a8acc511eb985e00155d29ef63','4cea43e332664a728c923f45a74c2175','06402d619f3211ebae1700155db07c91'),('6ddc65e9acc511eb985e00155d29ef63','684adc681afa4fcd80dca3be71cd5f22','0652d4a59f3211ebae1700155db07c91'),('6df44897acc511eb985e00155d29ef63','b297689f2f944d549ccde9ce28760f2e','06402d619f3211ebae1700155db07c91'),('6dfff6a6acc511eb985e00155d29ef63','e2991487b9cf44b1b64f5111cb4c26ba','063b904c9f3211ebae1700155db07c91'),('6dfffa14acc511eb985e00155d29ef63','e2991487b9cf44b1b64f5111cb4c26ba','06402d619f3211ebae1700155db07c91'),('6e17759dacc511eb985e00155d29ef63','81b5a09a2941463ab5e72ccc72633a68','0652d4a59f3211ebae1700155db07c91'),('6e17788dacc511eb985e00155d29ef63','81b5a09a2941463ab5e72ccc72633a68','06402d619f3211ebae1700155db07c91'),('6e2f2126acc511eb985e00155d29ef63','93393444df5341349894a2c9944482f9','0652d4a59f3211ebae1700155db07c91'),('6e46854dacc511eb985e00155d29ef63','978e86f74b7447e195a758c6034fd014','0652d4a59f3211ebae1700155db07c91'),('6e46883eacc511eb985e00155d29ef63','978e86f74b7447e195a758c6034fd014','063b904c9f3211ebae1700155db07c91'),('6e520c8facc511eb985e00155d29ef63','328c8a759ca24ff8a7544c66ee8222e5','0652d4a59f3211ebae1700155db07c91'),('6e5211e4acc511eb985e00155d29ef63','328c8a759ca24ff8a7544c66ee8222e5','063b904c9f3211ebae1700155db07c91'),('6e5db071acc511eb985e00155d29ef63','a9d0b459d625411d94447fbc42d457f6','0652d4a59f3211ebae1700155db07c91'),('6e5db505acc511eb985e00155d29ef63','a9d0b459d625411d94447fbc42d457f6','063b904c9f3211ebae1700155db07c91'),('6e5db746acc511eb985e00155d29ef63','a9d0b459d625411d94447fbc42d457f6','06402d619f3211ebae1700155db07c91'),('6e7500ceacc511eb985e00155d29ef63','21cd378dff9945ed8f9a092c4f7067d6','06402d619f3211ebae1700155db07c91'),('6e8163bfacc511eb985e00155d29ef63','a4b799d96f2845e6a06541aa30ec8190','0652d4a59f3211ebae1700155db07c91'),('6e9c0b7cacc511eb985e00155d29ef63','4ef5fd3f1e9242d69c18bc959aa4ec69','063b904c9f3211ebae1700155db07c91'),('6eb7682eacc511eb985e00155d29ef63','24706ab454b543909c9ff99e13d64fb9','0652d4a59f3211ebae1700155db07c91'),('6eb76bddacc511eb985e00155d29ef63','24706ab454b543909c9ff99e13d64fb9','063b904c9f3211ebae1700155db07c91'),('6eb76d20acc511eb985e00155d29ef63','24706ab454b543909c9ff99e13d64fb9','06402d619f3211ebae1700155db07c91'),('6ec39e59acc511eb985e00155d29ef63','3b704ccce98d4200995821bdebf69ac2','0652d4a59f3211ebae1700155db07c91'),('6ec3a360acc511eb985e00155d29ef63','3b704ccce98d4200995821bdebf69ac2','063b904c9f3211ebae1700155db07c91'),('6ecfe0e0acc511eb985e00155d29ef63','3c1986c2344c440f8165a5cd09edcdb5','0652d4a59f3211ebae1700155db07c91'),('6edc2f90acc511eb985e00155d29ef63','b082a552cc8b42f6bb1c32ee3b692a63','063b904c9f3211ebae1700155db07c91'),('6ee80eb9acc511eb985e00155d29ef63','8a25b8d0ce0b4bfea528d133944e5637','063b904c9f3211ebae1700155db07c91'),('6ef3f46cacc511eb985e00155d29ef63','b4483eaaf3474dba86da600e4cb7b7cc','0652d4a59f3211ebae1700155db07c91'),('6ef3f84facc511eb985e00155d29ef63','b4483eaaf3474dba86da600e4cb7b7cc','063b904c9f3211ebae1700155db07c91'),('6effa896acc511eb985e00155d29ef63','95c1f4fe053a477ca0dbf66dc2fc923f','0652d4a59f3211ebae1700155db07c91'),('6f23399facc511eb985e00155d29ef63','5d403266a6c34a239bce5c220c713895','0652d4a59f3211ebae1700155db07c91'),('6f233e7dacc511eb985e00155d29ef63','5d403266a6c34a239bce5c220c713895','063b904c9f3211ebae1700155db07c91'),('6f2f56ffacc511eb985e00155d29ef63','7703f890d9b44e189f994c66ab91b4bc','063b904c9f3211ebae1700155db07c91'),('6f2f5a32acc511eb985e00155d29ef63','7703f890d9b44e189f994c66ab91b4bc','06402d619f3211ebae1700155db07c91'),('6f3c0df9acc511eb985e00155d29ef63','8eed5d06e65a4c74b05291743c91cb6d','0652d4a59f3211ebae1700155db07c91'),('6f3c12daacc511eb985e00155d29ef63','8eed5d06e65a4c74b05291743c91cb6d','06402d619f3211ebae1700155db07c91'),('6f483983acc511eb985e00155d29ef63','a31d945d72f94523bdc2c86f6370a5c9','063b904c9f3211ebae1700155db07c91'),('6f54ec88acc511eb985e00155d29ef63','cd3e43ac1afc4cbab99cf6df3a42a406','063b904c9f3211ebae1700155db07c91'),('6f54efdeacc511eb985e00155d29ef63','cd3e43ac1afc4cbab99cf6df3a42a406','06402d619f3211ebae1700155db07c91'),('6f60fac4acc511eb985e00155d29ef63','4d0f5376713945a3b035b1a774e6923f','0652d4a59f3211ebae1700155db07c91'),('6f60fdb7acc511eb985e00155d29ef63','4d0f5376713945a3b035b1a774e6923f','063b904c9f3211ebae1700155db07c91'),('6f6c9197acc511eb985e00155d29ef63','d7c33f214d32400c9099eb86c7374a70','0652d4a59f3211ebae1700155db07c91'),('6f7888abacc511eb985e00155d29ef63','3e321490502841538718f6460e35e239','0652d4a59f3211ebae1700155db07c91'),('6f788b65acc511eb985e00155d29ef63','3e321490502841538718f6460e35e239','063b904c9f3211ebae1700155db07c91'),('6f9035acacc511eb985e00155d29ef63','746a092a2a364682b6d9071bc1f89ca7','0652d4a59f3211ebae1700155db07c91'),('6f9c40b8acc511eb985e00155d29ef63','b70b98d9a5234b6795b03f6e89d2f9f4','0652d4a59f3211ebae1700155db07c91'),('6fb3c6c0acc511eb985e00155d29ef63','ba1c2b8920214d95b8b4ab9660a42f35','063b904c9f3211ebae1700155db07c91');
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
INSERT INTO `persistent_logins` VALUES ('ZbAiX','ofNre9FFVDTsH0pbmzvYWA==','ab8/689gGBWJcK86DqVxYg==','2021-05-04 12:18:21'),('gDTVf','RKG7sbDHhiwtg5VTWazYhQ==','IO7DCNpFi+mG371SwmdU9g==','2021-05-09 11:59:21');
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

-- Dump completed on 2021-05-14 23:05:47

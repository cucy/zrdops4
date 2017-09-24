-- MySQL dump 10.13  Distrib 5.6.37, for macos10.12 (x86_64)
--
-- Host: localhost    Database: opsweb4
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add product',1,'add_product'),(2,'Can change product',1,'change_product'),(3,'Can delete product',1,'delete_product'),(4,'Can add zabbix host',2,'add_zabbixhost'),(5,'Can change zabbix host',2,'change_zabbixhost'),(6,'Can delete zabbix host',2,'delete_zabbixhost'),(7,'Can add server',3,'add_server'),(8,'Can change server',3,'change_server'),(9,'Can delete server',3,'delete_server'),(10,'Can add idc',4,'add_idc'),(11,'Can change idc',4,'change_idc'),(12,'Can delete idc',4,'delete_idc'),(13,'Can add status',5,'add_status'),(14,'Can change status',5,'change_status'),(15,'Can delete status',5,'delete_status'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add group',7,'add_group'),(20,'Can change group',7,'change_group'),(21,'Can delete group',7,'delete_group'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add permission',9,'add_permission'),(26,'Can change permission',9,'change_permission'),(27,'Can delete permission',9,'delete_permission'),(28,'Can add content type',10,'add_contenttype'),(29,'Can change content type',10,'change_contenttype'),(30,'Can delete content type',10,'delete_contenttype'),(31,'Can add session',11,'add_session'),(32,'Can change session',11,'change_session'),(33,'Can delete session',11,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$iAxxvnpu4lDn$dFU2o1j93QXNoxrhiJWhomAXbpgPd3cfVtdU/z5V6UY=','2017-09-23 15:43:18.608279',1,'admin','','','292016176@qq.com',1,1,'2017-09-23 08:43:32.287754'),(2,'pbkdf2_sha256$36000$PjS1OLBzP1Fe$RFqOjS/qgIJn4qokXS+xiO+LdWf5ys3cu858C4vFEfM=',NULL,0,'zrd0','','','zrdemail0@zrd.com',0,1,'2017-09-23 14:54:36.510654'),(3,'pbkdf2_sha256$36000$VeaAtTnKVCYN$Go9u6C+Cdc7qzesxLlVRUnwFj0AJSbZcFRo5rX3MhUo=',NULL,0,'zrd1','','','zrdemail1@zrd.com',0,1,'2017-09-23 14:54:36.569628'),(4,'pbkdf2_sha256$36000$HtJavNVQHyNG$bw7TExfUNOsacgxB5Nu6vvCsUmxDXeVvpfrUni53JDg=',NULL,0,'zrd2','','','zrdemail2@zrd.com',0,1,'2017-09-23 14:54:36.607135'),(5,'pbkdf2_sha256$36000$qnQ6d8eFMdrJ$d0dAqBqg4jhmTifCDxWdtg9IDcp24fHKNHLh1KQTlHc=',NULL,0,'zrd3','','','zrdemail3@zrd.com',0,1,'2017-09-23 14:54:36.646928'),(6,'pbkdf2_sha256$36000$tWR8Vahza9W8$tiZzagD1umFjM9F4kZ57ILorlM+NUIMHmagi/xPLWbk=',NULL,0,'zrd4','','','zrdemail4@zrd.com',0,1,'2017-09-23 14:54:36.686978'),(7,'pbkdf2_sha256$36000$wws9EJyfywo8$qhnql5lJi9tk7dtnZJcLb09XWMg2CKg0tVpVgYCotKU=',NULL,0,'zrd5','','','zrdemail5@zrd.com',0,1,'2017-09-23 14:54:36.729092'),(8,'pbkdf2_sha256$36000$MbU9Xw1DGVPA$m1dqcVZWYKwlLOuGri39A1KOuFM7y/3hfwoz+R/aShQ=',NULL,0,'zrd6','','','zrdemail6@zrd.com',0,1,'2017-09-23 14:54:36.771727'),(9,'pbkdf2_sha256$36000$UV7LFOmD9POK$XwhqTxQK3d4MD+C8gmrZn6+oLQCKRVcMkEwLo0pl3bg=',NULL,0,'zrd7','','','zrdemail7@zrd.com',0,1,'2017-09-23 14:54:36.814269'),(10,'pbkdf2_sha256$36000$tcyAWxOL7nB4$+jD7HC/SEzKVClnc/lDSNx5EH9w/9vo2txYiAvWu5Ig=',NULL,0,'zrd8','','','zrdemail8@zrd.com',0,1,'2017-09-23 14:54:36.856220'),(11,'pbkdf2_sha256$36000$0QnxUyLjbIk1$jpkr8whbLDwQmCg7aA6kXFMqWtmxWkXz8d0TbSZCZys=',NULL,0,'zrd9','','','zrdemail9@zrd.com',0,1,'2017-09-23 14:54:36.895290'),(12,'pbkdf2_sha256$36000$2wDiLx4zKDTH$rI4Ts8f4t2dIPwlKeVdKNwfCqKWW/VWbFlc2w8YQpnQ=',NULL,0,'zrd10','','','zrdemail10@zrd.com',0,1,'2017-09-23 14:54:36.934672'),(13,'pbkdf2_sha256$36000$MyFgqbn3m4ft$TPar+CZLwKhl9JcI4Osu3jSMnvqxods/rkIZC0OdHng=',NULL,0,'zrd11','','','zrdemail11@zrd.com',0,1,'2017-09-23 14:54:36.972676'),(14,'pbkdf2_sha256$36000$ODguKKrc1mY0$qDW5eODNkJfG6DwGQsfgTD6m/ku1eUMgij+aucSDGJM=',NULL,0,'zrd12','','','zrdemail12@zrd.com',0,1,'2017-09-23 14:54:37.011763'),(15,'pbkdf2_sha256$36000$My3XcYjjRsbV$+qjPK4qhGBdYG1sK4bi3BP8F36BMn2yUYmvAn/bGXEU=',NULL,0,'zrd13','','','zrdemail13@zrd.com',0,1,'2017-09-23 14:54:37.049528'),(16,'pbkdf2_sha256$36000$ObNxAdIwmAlJ$f33pkzAmEeS2bjAtmh/9kORHwQiMa+AxD+7ZYqFBa3Q=',NULL,0,'zrd14','','','zrdemail14@zrd.com',0,1,'2017-09-23 14:54:37.086709'),(17,'pbkdf2_sha256$36000$OhyKdKXQ93B9$w47U3tHCm50YuHtru5dd2+5KJ8SUT3Osym8JnyRMd0c=',NULL,0,'zrd15','','','zrdemail15@zrd.com',0,1,'2017-09-23 14:54:37.125401'),(18,'pbkdf2_sha256$36000$GRdeQ14LSbx1$jbWL8MDpY3fv1fehDMZtmTb9ocIAjblt2+TM/ggsnhQ=',NULL,0,'zrd16','','','zrdemail16@zrd.com',0,1,'2017-09-23 14:54:37.163237'),(19,'pbkdf2_sha256$36000$6jKEfW83M9iT$s7Hq4HjSSqWFzVTZJQ1GfGrLl2VUK1NFF68pOjTZ5u8=',NULL,0,'zrd17','','','zrdemail17@zrd.com',0,1,'2017-09-23 14:54:37.201546'),(20,'pbkdf2_sha256$36000$P300PGNbFDag$b9902Zbb+/d0cGTwDgDTBvZpuP1vKn4ISxwtUQjTO2Y=',NULL,0,'zrd18','','','zrdemail18@zrd.com',0,1,'2017-09-23 14:54:37.244677'),(21,'pbkdf2_sha256$36000$W7lQ2lNqL7RJ$Csc0PqNteRHSRsL3P9XZvAqjf7r5G4iiumqIBC1yGbg=',NULL,0,'zrd19','','','zrdemail19@zrd.com',0,1,'2017-09-23 14:54:37.287514'),(22,'pbkdf2_sha256$36000$d5CPwD84iRaF$reK08fEyGLiEkD40q23jH/1+WUfmoLVk7hAzcLQZFIc=',NULL,0,'zrd20','','','zrdemail20@zrd.com',0,1,'2017-09-23 14:54:37.325562'),(23,'pbkdf2_sha256$36000$3lWFdUDSvnxP$WHJ0QAa1kJ76+6y/WW8FfPINgs9dL8Fdd+pboLLEYu8=',NULL,0,'zrd21','','','zrdemail21@zrd.com',0,1,'2017-09-23 14:54:37.367597'),(24,'pbkdf2_sha256$36000$HLetacLXr5jt$OzKtLfy7A6gLWJ0PdDE9xpddl1ZCQS1J4y528ffKpX0=',NULL,0,'zrd22','','','zrdemail22@zrd.com',0,1,'2017-09-23 14:54:37.405769'),(25,'pbkdf2_sha256$36000$D1xW4q9xMiOU$pvFXGKOLNuEiJ5zsowrHBwFN17kHlsbS3FMCuiZrONA=',NULL,0,'zrd23','','','zrdemail23@zrd.com',0,1,'2017-09-23 14:54:37.443921'),(26,'pbkdf2_sha256$36000$XkapHbGIqprK$rtpoNLsYOrhSIrIk7l5kMSkSSSnxZPzmiyGt7TMggRg=',NULL,0,'zrd24','','','zrdemail24@zrd.com',0,1,'2017-09-23 14:54:37.482434'),(27,'pbkdf2_sha256$36000$khoGTEMaWqmc$XzIyMAR6hWPdnjVvHSPbDE2oItoEkYVRCI3nwLvQsLs=',NULL,0,'zrd25','','','zrdemail25@zrd.com',0,1,'2017-09-23 14:54:37.521033'),(28,'pbkdf2_sha256$36000$UCoXu57vZLtW$xn4SzlsDEwQMcnWcLL95n3E2a/2fJZVto56T04nQSs4=',NULL,0,'zrd26','','','zrdemail26@zrd.com',0,1,'2017-09-23 14:54:37.560861'),(29,'pbkdf2_sha256$36000$ksqrZQYtDWR7$wLYnVzWH+cC/DJNcdeVHfxcw82gC+SQBzRZZFfBkxmk=',NULL,0,'zrd27','','','zrdemail27@zrd.com',0,1,'2017-09-23 14:54:37.599905'),(30,'pbkdf2_sha256$36000$MvtK1BOlwWEf$LQDAwmMt5kvwwVlzzsCWkpvfFB9sy8EaLTDG6AUgUeI=',NULL,0,'zrd28','','','zrdemail28@zrd.com',0,1,'2017-09-23 14:54:37.639732'),(31,'pbkdf2_sha256$36000$eUVKq6p5iN6z$UUO3UtgoLwH6iKQ/+GK2ePPf8JNnB6kUl4xf3W9Xy+8=',NULL,0,'zrd29','','','zrdemail29@zrd.com',0,1,'2017-09-23 14:54:37.676106'),(32,'pbkdf2_sha256$36000$2TDZGUH2hgNN$Kt+vp7mEWTeGXWkL3Qj4OTN2+ExihxbNmPtQ8HNHpfM=',NULL,0,'zrd30','','','zrdemail30@zrd.com',0,1,'2017-09-23 14:54:37.713579'),(33,'pbkdf2_sha256$36000$0fTllPyUZt8n$/YpcObTl9BaHJSBPKfj7ds9durEwDoofdsvwCtZazQ8=',NULL,0,'zrd31','','','zrdemail31@zrd.com',0,1,'2017-09-23 14:54:37.752275'),(34,'pbkdf2_sha256$36000$xCnt65RCXraQ$BQpu0E07YvKEPLko5AqdRNPefdxtm1ka2eRS04YzIWQ=',NULL,0,'zrd32','','','zrdemail32@zrd.com',0,1,'2017-09-23 14:54:37.789225'),(35,'pbkdf2_sha256$36000$xI4WA1s7wcF6$1j1N9pgveRIQZG6KAqCwhOb8GcwqJ9dk+FEE0XfWXmo=',NULL,0,'zrd33','','','zrdemail33@zrd.com',0,1,'2017-09-23 14:54:37.828915'),(36,'pbkdf2_sha256$36000$Irw7TexTzXng$sU2bWaZaMnpuY3P93NnwyMZcCRHOIGzqyICT0c2mUVc=',NULL,0,'zrd34','','','zrdemail34@zrd.com',0,1,'2017-09-23 14:54:37.866889'),(37,'pbkdf2_sha256$36000$9oK9CNBKnrhC$OrMMsHgxlF0b33rwWzpgftHfu35CBEnsSTswCtMfS3c=',NULL,0,'zrd35','','','zrdemail35@zrd.com',0,1,'2017-09-23 14:54:37.903736'),(38,'pbkdf2_sha256$36000$xI17Oqxb3eEo$rVYcN+z8iTXeY4GF7F+4mTknSVu/5HhE2dGSQHKiPGw=',NULL,0,'zrd36','','','zrdemail36@zrd.com',0,1,'2017-09-23 14:54:37.943422'),(39,'pbkdf2_sha256$36000$SgjhAUQ8m3lB$X663CpSmEkowohXqMuKQvxjsOs3fBDnNl0JJVU3fOyk=',NULL,0,'zrd37','','','zrdemail37@zrd.com',0,1,'2017-09-23 14:54:37.982620'),(40,'pbkdf2_sha256$36000$PBPc5KY1hJip$Cauy71epqKAJ7SzlfMPNlPTwl0cLhl/wJLmYRabxqbQ=',NULL,0,'zrd38','','','zrdemail38@zrd.com',0,1,'2017-09-23 14:54:38.021158'),(41,'pbkdf2_sha256$36000$MTGQL0PeHhyx$yPBYchcP/y+0k+ZBnB27Yo36QiLPjgX+ZIkIXtnuz1o=',NULL,0,'zrd39','','','zrdemail39@zrd.com',0,1,'2017-09-23 14:54:38.063553'),(42,'pbkdf2_sha256$36000$XEk1Nz8Iwaus$M2rnvQr2PMay5ktG4+TjRIlvH8Up0ohBwLZEFsF1Wco=',NULL,0,'zrd40','','','zrdemail40@zrd.com',0,1,'2017-09-23 14:54:38.106287'),(43,'pbkdf2_sha256$36000$bsuWmA6jJU5e$hrHUNF4Vv7Qp+JvsqVOcnzOHM+XKxWPyG1Mb942k+GY=',NULL,0,'zrd41','','','zrdemail41@zrd.com',0,1,'2017-09-23 14:54:38.146207'),(44,'pbkdf2_sha256$36000$gR9qzAtgoJ95$KGolPp3VzKE1li68y53A4shzIO+jEDTj5jy3yV0gRLY=',NULL,0,'zrd42','','','zrdemail42@zrd.com',0,1,'2017-09-23 14:54:38.184037'),(45,'pbkdf2_sha256$36000$4cBGtYisHBZC$u63kNVzXj7e33Ohq2Fb/msc/iqPexo0WND9YR/GycrM=',NULL,0,'zrd43','','','zrdemail43@zrd.com',0,1,'2017-09-23 14:54:38.223381'),(46,'pbkdf2_sha256$36000$57wwLMKqvUGd$INEzOdXJzeI/FcnQUzRy6CyYS1dJvy8uDrPoO1HGCbg=',NULL,0,'zrd44','','','zrdemail44@zrd.com',0,1,'2017-09-23 14:54:38.260848'),(47,'pbkdf2_sha256$36000$eDCs0ssl96Ru$hWRoehz7kCCemEZXvcgtFUROydvLCQcc7ZQqAoC2bkE=',NULL,0,'zrd45','','','zrdemail45@zrd.com',0,1,'2017-09-23 14:54:38.298128'),(48,'pbkdf2_sha256$36000$2bIrdl3aF5Xd$T7SxCu9WEhB+UE69km/K/QERDDXMlCf3f9Nob2nlL1E=',NULL,0,'zrd46','','','zrdemail46@zrd.com',0,1,'2017-09-23 14:54:38.336681'),(49,'pbkdf2_sha256$36000$Ho1knrT439Yy$ZPZ423HvCd4yTqrA76cDZCV7SgCi4v6g8cHHkcR2YuE=',NULL,0,'zrd47','','','zrdemail47@zrd.com',0,1,'2017-09-23 14:54:38.372829'),(50,'pbkdf2_sha256$36000$fJXunGOrLhaY$Ps9I4XUNGjZS2YBpyndsmJzfqd8ShKm9aogaTFp7jfY=',NULL,0,'zrd48','','','zrdemail48@zrd.com',0,1,'2017-09-23 14:54:38.410497'),(51,'pbkdf2_sha256$36000$v9ac8hKLzjkW$gzT5r9LNdkQUmKw8rXr8CPao+HNOkqpNoFTHZpGYYEI=',NULL,0,'zrd49','','','zrdemail49@zrd.com',0,1,'2017-09-23 14:54:38.447938'),(52,'pbkdf2_sha256$36000$737MMAEwU3p7$GBhP/I4YXYqUNFs+xJCZ+yYvJZUF9S4lZFtuN39k4kY=',NULL,0,'zrd50','','','zrdemail50@zrd.com',0,1,'2017-09-23 14:54:38.487313'),(53,'pbkdf2_sha256$36000$xCQaIo9bmQwn$UQ0+td1JgKSoVm8WeXSU43LjZyAstccpUoAYUZyhO2M=',NULL,0,'zrd51','','','zrdemail51@zrd.com',0,1,'2017-09-23 14:54:38.526321'),(54,'pbkdf2_sha256$36000$8EkuNnyO2iCy$JJi9xzZ1ltPyp3roeZaDt6AoWJTBmV5BVqhN9N2Nw44=',NULL,0,'zrd52','','','zrdemail52@zrd.com',0,1,'2017-09-23 14:54:38.569562'),(55,'pbkdf2_sha256$36000$J3vkTg9M3LXp$wytpRXeDWmr2GZ+pAArxTzBmnh9hBvlDgN0V0gMJhVI=',NULL,0,'zrd53','','','zrdemail53@zrd.com',0,1,'2017-09-23 14:54:38.608341'),(56,'pbkdf2_sha256$36000$TiFmuznXDiAk$E+inZ13Yj5j6qjN4zatLuuNuzHbmzIT2jW0qjM9cikA=',NULL,0,'zrd54','','','zrdemail54@zrd.com',0,1,'2017-09-23 14:54:38.646027'),(57,'pbkdf2_sha256$36000$QZ8ClHpJv6Ah$ryum9xtrVyocu7lkYRnUcoVfo9vH5RfYW43kBAheSKU=',NULL,0,'zrd55','','','zrdemail55@zrd.com',0,1,'2017-09-23 14:54:38.683324'),(58,'pbkdf2_sha256$36000$ILOwTa3or4IP$+ji3EXbEkzv/CT2+C53J/snMlC73sKrKXP1R3FIdwHo=',NULL,0,'zrd56','','','zrdemail56@zrd.com',0,1,'2017-09-23 14:54:38.719605'),(59,'pbkdf2_sha256$36000$6kc43tc3jc5l$WyDqz+2+qu2nTDQLEyebi4vzbU0QTAPh2HRK1LgH1jE=',NULL,0,'zrd57','','','zrdemail57@zrd.com',0,1,'2017-09-23 14:54:38.757589'),(60,'pbkdf2_sha256$36000$yuBKWqIcMSy0$Ox/rdPLK1W5m8PHeTjWaugxvT8597Uj9xUPBdhAR+pg=',NULL,0,'zrd58','','','zrdemail58@zrd.com',0,1,'2017-09-23 14:54:38.802102'),(61,'pbkdf2_sha256$36000$XcnqYN61AadS$MEeQzENumikjsqC3AD6/NkuzVaQBpgBXLdCnGBMDKOA=',NULL,0,'zrd59','','','zrdemail59@zrd.com',0,1,'2017-09-23 14:54:38.840714'),(62,'pbkdf2_sha256$36000$2WKCqXuSjufH$DSx15BIS7aLkh+uAnzfnqekyFsIzrdN4Qdgn/RbPc2g=',NULL,0,'zrd60','','','zrdemail60@zrd.com',0,1,'2017-09-23 14:54:38.877934'),(63,'pbkdf2_sha256$36000$JDZrvsEwkO7Y$dfAb3IVLgIKDUSzlKYQ6OsBzqPpWJx+r3bCcxbgVygQ=',NULL,0,'zrd61','','','zrdemail61@zrd.com',0,1,'2017-09-23 14:54:38.914499'),(64,'pbkdf2_sha256$36000$989eSxqM0Rvg$TEXjYuYvWIsNfQnZhE/ns46w7KK5hcHhy54vZJWHuW0=',NULL,0,'zrd62','','','zrdemail62@zrd.com',0,1,'2017-09-23 14:54:38.953822'),(65,'pbkdf2_sha256$36000$qhBIxEyt1JAk$09EQbQ9+ukSylrbuRu/4VSaLTcbfybsoxAV9H+QHoiU=',NULL,0,'zrd63','','','zrdemail63@zrd.com',0,1,'2017-09-23 14:54:38.992730'),(66,'pbkdf2_sha256$36000$nuYQHKa6ExMU$svLjJqfTfawOb6jn7myWOzRP87DJVhpD405Cw3CFAyQ=',NULL,0,'zrd64','','','zrdemail64@zrd.com',0,1,'2017-09-23 14:54:39.030837'),(67,'pbkdf2_sha256$36000$kkZehK6qTNtl$DajGH49aPaq2UwtGYO01MSs505ZCL5w2fOATz9mu508=',NULL,0,'zrd65','','','zrdemail65@zrd.com',0,1,'2017-09-23 14:54:39.066205'),(68,'pbkdf2_sha256$36000$c1lGVGLjzikV$PU2mw+grt+6GXs02ftfGvj0bCL+uXEbiRhgKYSNFIaQ=',NULL,0,'zrd66','','','zrdemail66@zrd.com',0,1,'2017-09-23 14:54:39.104029'),(69,'pbkdf2_sha256$36000$UXwZKtkuETO5$CUn//tQ63Z3RXVZMckmhbedruikKSc83zCkxpGhiOTk=',NULL,0,'zrd67','','','zrdemail67@zrd.com',0,1,'2017-09-23 14:54:39.142907'),(70,'pbkdf2_sha256$36000$VsRKIHx2vuOW$aJb20TsPrVBAncWgj2LjhJWM3+QAId3cpwYek9PpmWc=',NULL,0,'zrd68','','','zrdemail68@zrd.com',0,1,'2017-09-23 14:54:39.178489'),(71,'pbkdf2_sha256$36000$yTg397RKI6Iw$tzwesfYUA3FAXgKWP3TCuw+yUU2mwBhJccjcwjHdZMc=',NULL,0,'zrd69','','','zrdemail69@zrd.com',0,1,'2017-09-23 14:54:39.215056'),(72,'pbkdf2_sha256$36000$ZKna19NGTrUg$hPg9xZDpN1mILAMn8Byi+GPYkJuN9FuZGyP6O9PwH+U=',NULL,0,'zrd70','','','zrdemail70@zrd.com',0,1,'2017-09-23 14:54:39.252589'),(73,'pbkdf2_sha256$36000$lnhKVPuJgT2M$qAC9iyWVoIE2s5Vc0H0TCcX1zAdF9wcIKMqX5rqAjQA=',NULL,0,'zrd71','','','zrdemail71@zrd.com',0,1,'2017-09-23 14:54:39.294877'),(74,'pbkdf2_sha256$36000$jdrCQPtPbWcP$KIAv9YCgW/otuS6KW8eB+YmvPc7bjcVOVg+kcHJ2bYk=',NULL,0,'zrd72','','','zrdemail72@zrd.com',0,1,'2017-09-23 14:54:39.332069'),(75,'pbkdf2_sha256$36000$tMfn4DHXlHNi$yjyUUtiDKjGq72Ty2ILzUF3KiMBiHBazRgi8S3C/BOI=',NULL,0,'zrd73','','','zrdemail73@zrd.com',0,1,'2017-09-23 14:54:39.368561'),(76,'pbkdf2_sha256$36000$YgCyVwOGUs7O$zh+rr8778YzjE69zTu4j+eB3AD/2AUEYLF79lmloA4U=',NULL,0,'zrd74','','','zrdemail74@zrd.com',0,1,'2017-09-23 14:54:39.406364'),(77,'pbkdf2_sha256$36000$6OOzm0pDJUWj$zk5FDbd7ZF6strnoHk5ulDUIK3HNGQrp9yvfTCyMA5Q=',NULL,0,'zrd75','','','zrdemail75@zrd.com',0,1,'2017-09-23 14:54:39.444300'),(78,'pbkdf2_sha256$36000$jrR8rvyc0ROE$EFhAObMA9gd/WTLshu3fRzbwYIMFP18yWZa/YTSTobw=',NULL,0,'zrd76','','','zrdemail76@zrd.com',0,1,'2017-09-23 14:54:39.480218'),(79,'pbkdf2_sha256$36000$3PdxRd48aYxD$djlyyJdqO2nvcMIL2dJmBTPomXpaw45oRuOAbjD3TE0=',NULL,0,'zrd77','','','zrdemail77@zrd.com',0,1,'2017-09-23 14:54:39.517802'),(80,'pbkdf2_sha256$36000$eGAPhN1Q1nxJ$69bHWkF1RX1QrGy+N7scPy380VNT7M6jGJ8OVdSsUmg=',NULL,0,'zrd78','','','zrdemail78@zrd.com',0,1,'2017-09-23 14:54:39.557760'),(81,'pbkdf2_sha256$36000$cdDV2nK1sUzZ$mOKcPRr4GZL9gfEqtL9W3nUfSeXBKyMdsk37hLa0dcI=',NULL,0,'zrd79','','','zrdemail79@zrd.com',0,1,'2017-09-23 14:54:39.596079'),(82,'pbkdf2_sha256$36000$RXXeDQ1OXj8Y$kqOXOwStWwGx9rfb4sgB+mRX8NXBusRwREaDLZCvp8M=',NULL,0,'zrd80','','','zrdemail80@zrd.com',0,1,'2017-09-23 14:54:39.635651'),(83,'pbkdf2_sha256$36000$NEMwTnr6iFHP$SEX/04O6HoL9haKgX8/HWzmJOG3qm03CRqyLG1v9/vU=',NULL,0,'zrd81','','','zrdemail81@zrd.com',0,1,'2017-09-23 14:54:39.674199'),(84,'pbkdf2_sha256$36000$p3JJCzXzMTbz$AirtLSsJHQPAnTcwKVPY19CHMkf8XEYwEuUGouaq2MY=',NULL,0,'zrd82','','','zrdemail82@zrd.com',0,1,'2017-09-23 14:54:39.711489'),(85,'pbkdf2_sha256$36000$iy11iGEORzla$eZOzgPtJtdTeuONrPPi0ekDrwuilPVgxNR83ogTufF8=',NULL,0,'zrd83','','','zrdemail83@zrd.com',0,1,'2017-09-23 14:54:39.753683'),(86,'pbkdf2_sha256$36000$TDUTOI8H8nVF$wGrLFAi8IiIAacMLr1U+nCoivyLtVeFY8bzg6EPBSZQ=',NULL,0,'zrd84','','','zrdemail84@zrd.com',0,1,'2017-09-23 14:54:39.796882'),(87,'pbkdf2_sha256$36000$sRmvenZwivKm$6UyTLyZ5LLA085rNiUIWXL1CU1dGIqOZk0IJc1BFOHU=',NULL,0,'zrd85','','','zrdemail85@zrd.com',0,1,'2017-09-23 14:54:39.834262'),(88,'pbkdf2_sha256$36000$qHDIng2yqk5s$MvlsWvEuzjY3u0ivFxjTVy7RDfkUWL07D5lCYmKB02c=',NULL,0,'zrd86','','','zrdemail86@zrd.com',0,1,'2017-09-23 14:54:39.870169'),(89,'pbkdf2_sha256$36000$Ifw1xZ1m4CrS$tvjWCQ73d6xf0tjC5O8J0mmiEDo/tYg7T5RTrrBbdQY=',NULL,0,'zrd87','','','zrdemail87@zrd.com',0,1,'2017-09-23 14:54:39.908238'),(90,'pbkdf2_sha256$36000$9iqFqRfmTXJ6$FFBQpGmZhVbPa2xYuqVqHwy3LjOoNXDcGpjwPLMbuhg=',NULL,0,'zrd88','','','zrdemail88@zrd.com',0,1,'2017-09-23 14:54:39.945510'),(91,'pbkdf2_sha256$36000$dx3AvmQZGNn8$jLkrrGFifcXXIOqbQ2EUIdklC/YXoefbglgxAugmPmQ=',NULL,0,'zrd89','','','zrdemail89@zrd.com',0,1,'2017-09-23 14:54:39.985399'),(92,'pbkdf2_sha256$36000$VdQ13lv2pB35$hSUoh+OkfrHODeYT1pghXI4nq0eLoGLh/ka+XG+/MW0=',NULL,0,'zrd90','','','zrdemail90@zrd.com',0,1,'2017-09-23 14:54:40.023579'),(93,'pbkdf2_sha256$36000$Jo3o5z9slSP7$A7lVZ6rjSrYWpJLfVZlKwcdHRTqRlkMYT15J8d+RIec=',NULL,0,'zrd91','','','zrdemail91@zrd.com',0,1,'2017-09-23 14:54:40.061477'),(94,'pbkdf2_sha256$36000$BghesoF2AYiH$vtrw9mANeI5OJJIdZ13PpuNedwIPJ/CCVYdnsYVdsxk=',NULL,0,'zrd92','','','zrdemail92@zrd.com',0,1,'2017-09-23 14:54:40.099616'),(95,'pbkdf2_sha256$36000$iciIVPRfTZZ3$D3nuIGy54em+tOc9P0P7ZF+oJAmTLkToKc6bFjH30BA=',NULL,0,'zrd93','','','zrdemail93@zrd.com',0,1,'2017-09-23 14:54:40.136334'),(96,'pbkdf2_sha256$36000$nbjcjVvNC7PR$5NJ6QuwmegEBtSP+dj+6DExD0oAmOeDuHOFc2Vp0RnE=',NULL,0,'zrd94','','','zrdemail94@zrd.com',0,1,'2017-09-23 14:54:40.171030'),(97,'pbkdf2_sha256$36000$37saPNAGeiJu$AKnZXIkOa1/LUTRHynM/EonKqQaF2ptcW7AcDtZg+Oo=',NULL,0,'zrd95','','','zrdemail95@zrd.com',0,1,'2017-09-23 14:54:40.209492'),(98,'pbkdf2_sha256$36000$uZ1xqwNCSB8q$jOlTa7JXuwmfr6k0XQgJxhfBzfNiCB5VR0Q+tsB1PNw=',NULL,0,'zrd96','','','zrdemail96@zrd.com',0,1,'2017-09-23 14:54:40.247100'),(99,'pbkdf2_sha256$36000$7bDaYvNLYNeg$Y+D4DG3ed79dzjEnPR5fzvqSYvEedzxT0ZSXRjXs7v8=',NULL,0,'zrd97','','','zrdemail97@zrd.com',0,1,'2017-09-23 14:54:40.285969'),(100,'pbkdf2_sha256$36000$9oZVpuC7Lm2I$5MGzlZmyybRKhpdMz+zjAOtjN6O+QrbJ58qNvhNV9fA=',NULL,0,'zrd98','','','zrdemail98@zrd.com',0,1,'2017-09-23 14:54:40.323877'),(101,'pbkdf2_sha256$36000$CDzjvoH0dnrN$f3h+L5Ut94RU3w0yyQz0hPQeITE4IBSbOIX/VvjI5b8=',NULL,0,'zrd99','','','zrdemail99@zrd.com',0,1,'2017-09-23 14:54:40.360941'),(102,'pbkdf2_sha256$36000$hHy2yensiK9L$xL2bujPKUNdzBKz/m2RQzzgoH4z3Sg1X/bFe6Om/nqw=',NULL,0,'zrd100','','','zrdemail100@zrd.com',0,1,'2017-09-23 14:54:40.397740'),(103,'pbkdf2_sha256$36000$vJ02l8J3Lmkt$Mg+zZEpBqo+jDJQ7OFZ6SgEnMLM4Upwq7CGeC1SabTk=',NULL,0,'zrd101','','','zrdemail101@zrd.com',0,1,'2017-09-23 14:54:40.434120'),(104,'pbkdf2_sha256$36000$SViEpHOmUPWg$6ev/6WXfKnX7bYvaGRitxwHH24ONJObq+VR/4IksK+k=',NULL,0,'zrd102','','','zrdemail102@zrd.com',0,1,'2017-09-23 14:54:40.470037'),(105,'pbkdf2_sha256$36000$wX0Geq6SXSVk$FVyKy2Xna6BVazzl/VOEwWKZqTgaIJ7UiPmjvxF3qfY=',NULL,0,'zrd103','','','zrdemail103@zrd.com',0,1,'2017-09-23 14:54:40.508078'),(106,'pbkdf2_sha256$36000$mh1qmqB6bJsV$D908252O9e8cj76G78lERmXJyyMS1Eugct1LJR0kPsk=',NULL,0,'zrd104','','','zrdemail104@zrd.com',0,1,'2017-09-23 14:54:40.544112'),(107,'pbkdf2_sha256$36000$gBxZ3d3Pmybo$ylvcjxFCcS5NQtnLFkt9xVX/mSEFYf/pqQMcaB3sbms=',NULL,0,'zrd105','','','zrdemail105@zrd.com',0,1,'2017-09-23 14:54:40.582476'),(108,'pbkdf2_sha256$36000$w5PkTOkwWUJ5$UqloJn/9rBydChCDg1L++Xj4+J9hR3uupYbIRecBb+E=',NULL,0,'zrd106','','','zrdemail106@zrd.com',0,1,'2017-09-23 14:54:40.661338'),(109,'pbkdf2_sha256$36000$ulPxHhFIxgL8$imqnnF6D02HXq5ldrL4mfMXuYmODFfKqk2kA0IL2qBk=',NULL,0,'zrd107','','','zrdemail107@zrd.com',0,1,'2017-09-23 14:54:40.701703'),(110,'pbkdf2_sha256$36000$1COBvaMaEbtf$JwdAY6xSV6fimyDU8CcsX+rgl6hsKuwjyM0AyKtxpxE=',NULL,0,'zrd108','','','zrdemail108@zrd.com',0,1,'2017-09-23 14:54:40.743980'),(111,'pbkdf2_sha256$36000$ZvrfpfctBEnz$DF2khtFdYntMAIH6CKqDeJmJkmFndceMbR2a4aZgw48=',NULL,0,'zrd109','','','zrdemail109@zrd.com',0,1,'2017-09-23 14:54:40.783044'),(112,'pbkdf2_sha256$36000$YEr4FXgStLgU$bTB0Tc9VNLDGxHx2LcBntwoRC00uZmRtK7M+D33olc8=',NULL,0,'zrd110','','','zrdemail110@zrd.com',0,1,'2017-09-23 14:54:40.819724'),(113,'pbkdf2_sha256$36000$2p8nLHIpDWh8$k7aHD69c/11F02grVqjdJmL9mDGVNc2oAnRFGaFjxPg=',NULL,0,'zrd111','','','zrdemail111@zrd.com',0,1,'2017-09-23 14:54:40.856473'),(114,'pbkdf2_sha256$36000$dZLNWmtCNvBa$+J95W64sc8PVp67HNouULsit2UjXFLTuIWM0yOpfiWw=',NULL,0,'zrd112','','','zrdemail112@zrd.com',0,1,'2017-09-23 14:54:40.892968'),(115,'pbkdf2_sha256$36000$4jE6bvR6VCAt$vKQ663YyVasyWNUFKdXjrq3ojeNk8Hx1F/Xnmgh/0bE=',NULL,0,'zrd113','','','zrdemail113@zrd.com',0,1,'2017-09-23 14:54:40.931670'),(116,'pbkdf2_sha256$36000$Sov1jd9ndTsr$aLLKKyxeS8cCuMKTSUZ+pzr/5NqgaGj3y6WPOuV7ehc=',NULL,0,'zrd114','','','zrdemail114@zrd.com',0,1,'2017-09-23 14:54:40.969301'),(117,'pbkdf2_sha256$36000$sThiVcnG0lT1$bxBHlETMMnffG9f6Rtn1RBxqKfo3FVqZZC+zSB40yFo=',NULL,0,'zrd115','','','zrdemail115@zrd.com',0,1,'2017-09-23 14:54:41.009416'),(118,'pbkdf2_sha256$36000$m2XYkPzONciV$AoEYcuzwOootmYrTqdVUd8ayMUWlOiDW+TQ8equJ0Kw=',NULL,0,'zrd116','','','zrdemail116@zrd.com',0,1,'2017-09-23 14:54:41.051653'),(119,'pbkdf2_sha256$36000$oulJNLytOUgo$p89vlLkfbVG0F30ppsMu+sOg9wgO1Km6gpYyTVs2n/s=',NULL,0,'zrd117','','','zrdemail117@zrd.com',0,1,'2017-09-23 14:54:41.089252'),(120,'pbkdf2_sha256$36000$OfwI78dcnUo8$SRPG3TQm9Ln9ymAPrEPD3B5DY2Bj6B0B9KyW40SuQSA=',NULL,0,'zrd118','','','zrdemail118@zrd.com',0,1,'2017-09-23 14:54:41.127751'),(121,'pbkdf2_sha256$36000$k597PVZyHDxn$0fDg2W5lLHe/TJOrV4CcvCCU+QzCZWrV8mkba+rFnlQ=',NULL,0,'zrd119','','','zrdemail119@zrd.com',0,1,'2017-09-23 14:54:41.164976'),(122,'pbkdf2_sha256$36000$Wqr0AH7wBNBM$qGlrtmATmE0jqHcfNcQ2DKLBVvgbjc5yLpDjwrlns8k=',NULL,0,'zrd120','','','zrdemail120@zrd.com',0,1,'2017-09-23 14:54:41.202990'),(123,'pbkdf2_sha256$36000$DGqd8PImka0y$ViyM1dOkpFq+Rvwhy3l9PVe18eEz6AzMVs0PJDJcJZE=',NULL,0,'zrd121','','','zrdemail121@zrd.com',0,1,'2017-09-23 14:54:41.245151'),(124,'pbkdf2_sha256$36000$42X6WOFIZg72$YiLlSSXwX3QTk0R6mCP7D+e+6IflC89/hLiaeJzENsY=',NULL,0,'zrd122','','','zrdemail122@zrd.com',0,1,'2017-09-23 14:54:41.282799'),(125,'pbkdf2_sha256$36000$QhPILSMlr794$2X6sFDgRT7ifqPC/IkQVMPqnUHOIfYNWL8cIGqpaGRk=',NULL,0,'zrd123','','','zrdemail123@zrd.com',0,1,'2017-09-23 14:54:41.320664'),(126,'pbkdf2_sha256$36000$DcwxV0yQsAhn$C2zvfKTji2t6gZP0b/9AeecJvPR0X/X+Nr+JyOZfijA=',NULL,0,'zrd124','','','zrdemail124@zrd.com',0,1,'2017-09-23 14:54:41.361013'),(127,'pbkdf2_sha256$36000$wXCUmCaQO4WN$/sNy27FBGKf40n456nAxuXH8212zAxzhx63A2LirTzU=',NULL,0,'zrd125','','','zrdemail125@zrd.com',0,1,'2017-09-23 14:54:41.399794'),(128,'pbkdf2_sha256$36000$anbGeC2WG6B9$KJXHa4tVyDuuKi1eNkL36gPYz9CITBa3U89REczO1dg=',NULL,0,'zrd126','','','zrdemail126@zrd.com',0,1,'2017-09-23 14:54:41.443624'),(129,'pbkdf2_sha256$36000$VSP8gqRCHRy2$Xqn4HyRi7uVoRyVKhT6jmCTBcx0xa5K5VaDb1ewKCek=',NULL,0,'zrd127','','','zrdemail127@zrd.com',0,1,'2017-09-23 14:54:41.486199'),(130,'pbkdf2_sha256$36000$RkRpdavkK88Y$OCx0BVw+zueBIsYV8GxYakoJZ4JMCjqyZy3d1hct0os=',NULL,0,'zrd128','','','zrdemail128@zrd.com',0,1,'2017-09-23 14:54:41.529459'),(131,'pbkdf2_sha256$36000$4M01yWIZJvXU$JeipYTzzgeO/3Y4Dq0ZrD9Ly19nHB3MZ/RmBKmSOqFQ=',NULL,0,'zrd129','','','zrdemail129@zrd.com',0,1,'2017-09-23 14:54:41.568002'),(132,'pbkdf2_sha256$36000$RhaGQJZ8HeBs$RYgrvLKMS6n1/WcJU7ZqMi2K5qYIqCYkRSQltQ8aOJA=',NULL,0,'zrd130','','','zrdemail130@zrd.com',0,1,'2017-09-23 14:54:41.607939'),(133,'pbkdf2_sha256$36000$JwPSLXeXnp7k$UTaVS6RTd65HAolEF7WS7BFfWpAUTa3fYmdl+duJt+k=',NULL,0,'zrd131','','','zrdemail131@zrd.com',0,1,'2017-09-23 14:54:41.646008'),(134,'pbkdf2_sha256$36000$rzNQJrLK3Gan$MfIclR7RpPcAhTOwF8ht8eGNaJgr2byqhN3DyStE9Y4=',NULL,0,'zrd132','','','zrdemail132@zrd.com',0,1,'2017-09-23 14:54:41.681453'),(135,'pbkdf2_sha256$36000$xIbVsSDDHasU$yryx25y53Ef/R+DD9VkuaDOz4HGKGL/CWY3P7vDxs98=',NULL,0,'zrd133','','','zrdemail133@zrd.com',0,1,'2017-09-23 14:54:41.720912'),(136,'pbkdf2_sha256$36000$sjRciK0Mvnqw$/3bdMfqm6u/3zSmz6L22t3VTtVliBCgI4mehQHLoS7U=',NULL,0,'zrd134','','','zrdemail134@zrd.com',0,1,'2017-09-23 14:54:41.758847'),(137,'pbkdf2_sha256$36000$yGBHyZwBYRxM$IUHFgO9k7vFF804sGK/sJdAIbPoCRyDQCi5tRQBUBV8=',NULL,0,'zrd135','','','zrdemail135@zrd.com',0,1,'2017-09-23 14:54:41.797536'),(138,'pbkdf2_sha256$36000$Hw03ApIC1RhR$fwoCU2OdNMFD4AMDva2HYaHZ+VHKLwnIv7o1Eh4oRaw=',NULL,0,'zrd136','','','zrdemail136@zrd.com',0,1,'2017-09-23 14:54:41.836287'),(139,'pbkdf2_sha256$36000$83jHXdWPW5a9$mpf/U6Pvd0kdFAO3ZwfDDbcwqA6jk0DxseN+tva4NaM=',NULL,0,'zrd137','','','zrdemail137@zrd.com',0,1,'2017-09-23 14:54:41.876345'),(140,'pbkdf2_sha256$36000$lKLhRyujzZpC$6oe1wamJtsuWslwbJyZaSgVrpLJjUTX3HrXN6RlSu2Y=',NULL,0,'zrd138','','','zrdemail138@zrd.com',0,1,'2017-09-23 14:54:41.918329'),(141,'pbkdf2_sha256$36000$IIFymdxU3ghu$4n3D0lI6e1MQvkc/mqCORDoIZDk9lrLEuygLj24jryA=',NULL,0,'zrd139','','','zrdemail139@zrd.com',0,1,'2017-09-23 14:54:41.957270'),(142,'pbkdf2_sha256$36000$lelvG0zKYVWu$JYnPxzRrckLZ5OjebJEdNmCAMOqQbiE5R8TI4gRenaM=',NULL,0,'zrd140','','','zrdemail140@zrd.com',0,1,'2017-09-23 14:54:41.994665'),(143,'pbkdf2_sha256$36000$NH7jTR24pEcW$tm8PGc4HqFzqKECvO/8z3grGcvolSLEJrDwQ/8RO/0s=',NULL,0,'zrd141','','','zrdemail141@zrd.com',0,1,'2017-09-23 14:54:42.030059'),(144,'pbkdf2_sha256$36000$fA2fESxS3ve6$X9fIcw7S2rB7ziZ2dm2sdR0lS0b6HwvDM3gHCMiDgH4=',NULL,0,'zrd142','','','zrdemail142@zrd.com',0,1,'2017-09-23 14:54:42.066871'),(145,'pbkdf2_sha256$36000$BNx7nm3Mv0EP$K05ejY/8kJyN4wCns62xViqLhP3ImGmNCHxudjhW7RQ=',NULL,0,'zrd143','','','zrdemail143@zrd.com',0,1,'2017-09-23 14:54:42.104235'),(146,'pbkdf2_sha256$36000$nlvmC7M6AOet$9YH76FFfswkX0FXrNjtDIIY27VhdQlunTHa/QY2iW18=',NULL,0,'zrd144','','','zrdemail144@zrd.com',0,1,'2017-09-23 14:54:42.141150'),(147,'pbkdf2_sha256$36000$mEFccOxzlW4w$2gbFg+jGg1B0rRoyvf8VTD24IIawPJE5ktv7RHsiNKw=',NULL,0,'zrd145','','','zrdemail145@zrd.com',0,1,'2017-09-23 14:54:42.178737'),(148,'pbkdf2_sha256$36000$JVYPqbhlXNbc$PTB7OgdUeI7my86bnaXAXj2KUoNnIC9X2N7zuv4ZCfU=',NULL,0,'zrd146','','','zrdemail146@zrd.com',0,1,'2017-09-23 14:54:42.215205'),(149,'pbkdf2_sha256$36000$YBUFAkNpvS71$2JjOVcYVFi0JL7ew5NkiG8HTh15f8/YsjqEHgpxzr1s=',NULL,0,'zrd147','','','zrdemail147@zrd.com',0,1,'2017-09-23 14:54:42.253244'),(150,'pbkdf2_sha256$36000$JVMGM18AQlAd$QZbkaXnthfzNhyQdh75iVy9ROljssg7y0YSdfAzOPGc=',NULL,0,'zrd148','','','zrdemail148@zrd.com',0,1,'2017-09-23 14:54:42.290315'),(151,'pbkdf2_sha256$36000$LZs2pWhTbPHE$PkkkHkJKYAkl0BaxU6baZaGDNioyASfweeuN3Y6fa3Q=',NULL,0,'zrd149','','','zrdemail149@zrd.com',0,1,'2017-09-23 14:54:42.324138'),(152,'pbkdf2_sha256$36000$3zMIJ6SyY8bG$swFBBUvOTEX81PAZgKg+zQMgzZr47+QloWMT4Vp1TvM=',NULL,0,'zrd150','','','zrdemail150@zrd.com',0,1,'2017-09-23 14:54:42.362271'),(153,'pbkdf2_sha256$36000$Zn3aoTtZFaCz$LMqr5HIKL3xcBme40DI1OK3hfb04qlT+pVSnSKt/TFU=',NULL,0,'zrd151','','','zrdemail151@zrd.com',0,1,'2017-09-23 14:54:42.398960'),(154,'pbkdf2_sha256$36000$O17pUGzhXIdk$0KlpP2Jdy/mwIhkU6aSIFnTERVRyjm5YN2pdUNGAGcw=',NULL,0,'zrd152','','','zrdemail152@zrd.com',0,1,'2017-09-23 14:54:42.434653'),(155,'pbkdf2_sha256$36000$krOP1pcwFh0H$1MOF3JSarnwg6U2ocHB4b9jEn2EFOa0bQefNdSeQc5E=',NULL,0,'zrd153','','','zrdemail153@zrd.com',0,1,'2017-09-23 14:54:42.471873'),(156,'pbkdf2_sha256$36000$Pj9YvcAxvHN7$ahjN2wkHpN+fqG5w7GRr88nEFpHj9OO8ww+KxcUZntM=',NULL,0,'zrd154','','','zrdemail154@zrd.com',0,1,'2017-09-23 14:54:42.511132'),(157,'pbkdf2_sha256$36000$dFVaWLPvjoFh$eUxgt4/U4FYQpDnGjyzHhN4PnP4MP6Adw1ebJkCXxxI=',NULL,0,'zrd155','','','zrdemail155@zrd.com',0,1,'2017-09-23 14:54:42.549311'),(158,'pbkdf2_sha256$36000$WqONPaLOMQUI$RrdPcztLAmy6vsgk4psCoRvNcydCpL/iVic2F79m6yw=',NULL,0,'zrd156','','','zrdemail156@zrd.com',0,1,'2017-09-23 14:54:42.586257'),(159,'pbkdf2_sha256$36000$7lUTJpkjwqp1$Pi0w8I6hk81i6tNdCTJiVIvXzlmUif8+t4d6sTm0Suo=',NULL,0,'zrd157','','','zrdemail157@zrd.com',0,1,'2017-09-23 14:54:42.622361'),(160,'pbkdf2_sha256$36000$uxiaBf17oPEM$almN9ijx/MFTkzTJp/M1RSNacnpgDY3hE2T7IZww9VI=',NULL,0,'zrd158','','','zrdemail158@zrd.com',0,1,'2017-09-23 14:54:42.659350'),(161,'pbkdf2_sha256$36000$OIEKfOssDxSq$LzklMXg/uoG/bobyNxa/Bg0ryhydjMevZMcGYMKGm1A=',NULL,0,'zrd159','','','zrdemail159@zrd.com',0,1,'2017-09-23 14:54:42.695544'),(162,'pbkdf2_sha256$36000$KcKL6lxwJoRk$6jP3d2zWtb/p22rQ9PeI/vZqLWsRUAogKckVl5GuItY=',NULL,0,'zrd160','','','zrdemail160@zrd.com',0,1,'2017-09-23 14:54:42.730943'),(163,'pbkdf2_sha256$36000$oP8DmbsxY2bs$dC3jQi5jbMEVoM6ODmu4aIwqSNEgdRdpeiVFJf1UD5o=',NULL,0,'zrd161','','','zrdemail161@zrd.com',0,1,'2017-09-23 14:54:42.767091'),(164,'pbkdf2_sha256$36000$zGwEYIcdeXHA$yi7K1oxOeuuBR3RF0ralHBEwNIwDUpHsIjZlX9p1JBw=',NULL,0,'zrd162','','','zrdemail162@zrd.com',0,1,'2017-09-23 14:54:42.804435'),(165,'pbkdf2_sha256$36000$rnruH8CLGuIn$1IG55uQH4H4al/ubd+G08mLj7w/fpEr1OEyRvDDeyy0=',NULL,0,'zrd163','','','zrdemail163@zrd.com',0,1,'2017-09-23 14:54:42.844320'),(166,'pbkdf2_sha256$36000$CokmWXmmtw3V$FFhTx2ob0RyEPKNt8k7iDzmKxGsDLoETBvyteBLxPug=',NULL,0,'zrd164','','','zrdemail164@zrd.com',0,1,'2017-09-23 14:54:42.883417'),(167,'pbkdf2_sha256$36000$yE4hG0Hm11Ko$5h34xqX5pvgOkp/pDa5eI4HXHXX/mLr7HV017QAVzb0=',NULL,0,'zrd165','','','zrdemail165@zrd.com',0,1,'2017-09-23 14:54:42.920126'),(168,'pbkdf2_sha256$36000$awsSwzuQmod9$Rvl+Lyoaa+QfYOAYuPlHJCGNxLp5OLjB0btkQRQwpis=',NULL,0,'zrd166','','','zrdemail166@zrd.com',0,1,'2017-09-23 14:54:42.958284'),(169,'pbkdf2_sha256$36000$v66pvQWSVTfs$3fTq1TTMI0LOFXPDRFN8mrrzmg7v1fpWsDbkeI/ssA8=',NULL,0,'zrd167','','','zrdemail167@zrd.com',0,1,'2017-09-23 14:54:42.995916'),(170,'pbkdf2_sha256$36000$nIAmn5cqbWW4$SiCDVC9hpEECZJMeuCIJMYp0gXAww9fhh68kCbB2cpg=',NULL,0,'zrd168','','','zrdemail168@zrd.com',0,1,'2017-09-23 14:54:43.031070'),(171,'pbkdf2_sha256$36000$E7ImoqHKvTSJ$62IgHT6BOw4z8slZfBkIe2nbdNTOo/B9+0xo9uQHaaU=',NULL,0,'zrd169','','','zrdemail169@zrd.com',0,1,'2017-09-23 14:54:43.066941'),(172,'pbkdf2_sha256$36000$8qGqMNiSyXU1$V71dQnNVuGmrWCbE91Ryzh/B6HGRPF6nQHxvzyhh4E8=',NULL,0,'zrd170','','','zrdemail170@zrd.com',0,1,'2017-09-23 14:54:43.104392'),(173,'pbkdf2_sha256$36000$YCIJwFaa64Cn$6/58MkiGS7bGP86I8Iz9jA5h9CXXpApmZWi36MK/z/c=',NULL,0,'zrd171','','','zrdemail171@zrd.com',0,1,'2017-09-23 14:54:43.141132'),(174,'pbkdf2_sha256$36000$mC7rZWjv167S$gaaTl+tQ3sVmVB1zVEs6hp6Kc2ddwpriFVIjnyMiKUo=',NULL,0,'zrd172','','','zrdemail172@zrd.com',0,1,'2017-09-23 14:54:43.181025'),(175,'pbkdf2_sha256$36000$vEoH9DZRh3NL$+GWio1gv6N4LI+GUgvqLfFHv8MCnaof+dz4JgJK42FA=',NULL,0,'zrd173','','','zrdemail173@zrd.com',0,1,'2017-09-23 14:54:43.219942'),(176,'pbkdf2_sha256$36000$CEW6AkcJVAyj$7dZBEC06olWvReGu8X53Po/gNWYc+XPZ+Pr4ZXQSp9Y=',NULL,0,'zrd174','','','zrdemail174@zrd.com',0,1,'2017-09-23 14:54:43.258931'),(177,'pbkdf2_sha256$36000$EoiTYIdyJp0g$AqedxEHxG6FhJXgJW18yig6I/XZpeUNh1CT3MmKWpmM=',NULL,0,'zrd175','','','zrdemail175@zrd.com',0,1,'2017-09-23 14:54:43.295069'),(178,'pbkdf2_sha256$36000$Q8PjJvlh2y41$913n7dwNiQIpw31KpAAhXcJ7Mjehid5sWzTpcV7Bltc=',NULL,0,'zrd176','','','zrdemail176@zrd.com',0,1,'2017-09-23 14:54:43.331687'),(179,'pbkdf2_sha256$36000$mp85Xs9RkoVY$jfwkX4opsLDj3nX50J0KNa13RGNtKOJG3WRFq8tKUKI=',NULL,0,'zrd177','','','zrdemail177@zrd.com',0,1,'2017-09-23 14:54:43.367083'),(180,'pbkdf2_sha256$36000$QZ2XmSqi48bU$NHEa7cr7dRwWVRIXqECHmvfodgkSRjiQbRHHefWMLBM=',NULL,0,'zrd178','','','zrdemail178@zrd.com',0,1,'2017-09-23 14:54:43.405816'),(181,'pbkdf2_sha256$36000$9vjgxbzp7pdN$/O0UUYZ55JmkBp9R0yi3dyfkg8aR86Sopzs/JzuaLdc=',NULL,0,'zrd179','','','zrdemail179@zrd.com',0,1,'2017-09-23 14:54:43.447372'),(182,'pbkdf2_sha256$36000$fGxv16hISfxE$Lm8Bp0MREHoLDn3/7GhFgSk2eXVwt3FNaUNfk32X9os=',NULL,0,'zrd180','','','zrdemail180@zrd.com',0,1,'2017-09-23 14:54:43.485295'),(183,'pbkdf2_sha256$36000$WcihrP53nYaU$ez94eSsxOI+hhvZJtiyBrDE3hlo9rQVD5kh02PX22Uc=',NULL,0,'zrd181','','','zrdemail181@zrd.com',0,1,'2017-09-23 14:54:43.521390'),(184,'pbkdf2_sha256$36000$R6UE9wVEyiN2$Acnsv9oyBbl+tHBINMFHNtfZbfG1uTFmFMRCDBK3XYA=',NULL,0,'zrd182','','','zrdemail182@zrd.com',0,1,'2017-09-23 14:54:43.558567'),(185,'pbkdf2_sha256$36000$6gIfVcYQZDnd$7f+lmanHKiVNzLIdSQLPYUcM59pZvUSLiBY3ZD5l+ZM=',NULL,0,'zrd183','','','zrdemail183@zrd.com',0,1,'2017-09-23 14:54:43.595352'),(186,'pbkdf2_sha256$36000$EKf6jQs8G5J8$bXvrlvrAc7aWNIAO4pRpONzsYH1NkkzwNeGg7Sw2jjo=',NULL,0,'zrd184','','','zrdemail184@zrd.com',0,1,'2017-09-23 14:54:43.633933'),(187,'pbkdf2_sha256$36000$i2mj9UNwJPCb$XG8GkpcTdDypQkE1r0YfMnISMMsaAjDpww3ce/Uulc0=',NULL,0,'zrd185','','','zrdemail185@zrd.com',0,1,'2017-09-23 14:54:43.669193'),(188,'pbkdf2_sha256$36000$odWnNED26cDY$BuSchi/Ap/aZ7zadUmWMU8YqxgxNgNWH8Qb0HP2ZWJY=',NULL,0,'zrd186','','','zrdemail186@zrd.com',0,1,'2017-09-23 14:54:43.707064'),(189,'pbkdf2_sha256$36000$2U6gmcLEpGfq$sVuI5I6JkjYmSZU/D7BiVU9ZqFSm8PlHC0Q+5/BpRIQ=',NULL,0,'zrd187','','','zrdemail187@zrd.com',0,1,'2017-09-23 14:54:43.746139'),(190,'pbkdf2_sha256$36000$8G8IhOFP593S$SMHy1PJgqB+GZRfVhz9vrTzS6r6+XekIUhE/9wRi/QE=',NULL,0,'zrd188','','','zrdemail188@zrd.com',0,1,'2017-09-23 14:54:43.783222'),(191,'pbkdf2_sha256$36000$EKc6wbuD7NVS$PVysheZk7NnfK8K/cLfqZAXRcLJjr9pns15ilXPh5XA=',NULL,0,'zrd189','','','zrdemail189@zrd.com',0,1,'2017-09-23 14:54:43.819019'),(192,'pbkdf2_sha256$36000$TJRGM1ZEtsCm$I+lJEOyjl6LmsVj8Z6gVWrTiQ8Li6GfzXpnU3/PUY5Q=',NULL,0,'zrd190','','','zrdemail190@zrd.com',0,1,'2017-09-23 14:54:43.857591'),(193,'pbkdf2_sha256$36000$P3w9YcfDz1af$eLQFehy3xfBhAP5ocFk/wAxvx0vt4Mf4l6WWSt3J3dA=',NULL,0,'zrd191','','','zrdemail191@zrd.com',0,1,'2017-09-23 14:54:43.896438'),(194,'pbkdf2_sha256$36000$X9TeWtpbsWT6$KLpMBZnLyPpLY2mgc3wdMhMjBzWTZwXRy5D4eiy2zCg=',NULL,0,'zrd192','','','zrdemail192@zrd.com',0,1,'2017-09-23 14:54:43.933452'),(195,'pbkdf2_sha256$36000$Cnh0ibgbHKHR$q74OCvqTljIaHTBuMc2sA2VDiln+VcnC04a9ZJfeb00=',NULL,0,'zrd193','','','zrdemail193@zrd.com',0,1,'2017-09-23 14:54:43.970468'),(196,'pbkdf2_sha256$36000$2c281rnh0IXi$hBHTO72sIrQAun5tIF3cTYF6ER7i9KJL7kfwK15GRaA=',NULL,0,'zrd194','','','zrdemail194@zrd.com',0,1,'2017-09-23 14:54:44.007952'),(197,'pbkdf2_sha256$36000$nkmCzSuGW6wE$z1bIr1709UJsyFyS70yZ/mmKvprc3Hypy0wO03Zu4fI=',NULL,0,'zrd195','','','zrdemail195@zrd.com',0,1,'2017-09-23 14:54:44.045435'),(198,'pbkdf2_sha256$36000$v9u7qgXlMUgv$F0nFPH6ExKOTysmkgz+DBciL2YbsnBpscHj0hkwt8W4=',NULL,0,'zrd196','','','zrdemail196@zrd.com',0,1,'2017-09-23 14:54:44.085072'),(199,'pbkdf2_sha256$36000$mo7kyb6p9awx$dYA4YKL64WuNLBp7t3ZIm2uIgsJDW2J4STE5Rh7gFrY=',NULL,0,'zrd197','','','zrdemail197@zrd.com',0,1,'2017-09-23 14:54:44.122117'),(200,'pbkdf2_sha256$36000$TSlh3u4MRJu5$ImaKw4qdEEwB0UF+Vg13v7dGPYgopYGlq2cE2jlAnsI=',NULL,0,'zrd198','','','zrdemail198@zrd.com',0,1,'2017-09-23 14:54:44.160422'),(201,'pbkdf2_sha256$36000$yyriWQPPVhUh$YVBg8Jv+IoYUbIOLtpSE+G5fmH6UOzz7HcvBjqhdwEQ=',NULL,0,'zrd199','','','zrdemail199@zrd.com',0,1,'2017-09-23 14:54:44.197710');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(7,'auth','group'),(9,'auth','permission'),(8,'auth','user'),(10,'contenttypes','contenttype'),(4,'server','idc'),(1,'server','product'),(3,'server','server'),(5,'server','status'),(2,'server','zabbixhost'),(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-23 08:40:30.908380'),(2,'auth','0001_initial','2017-09-23 08:40:32.115449'),(3,'admin','0001_initial','2017-09-23 08:40:32.438468'),(4,'admin','0002_logentry_remove_auto_add','2017-09-23 08:40:32.455468'),(5,'contenttypes','0002_remove_content_type_name','2017-09-23 08:40:32.638479'),(6,'auth','0002_alter_permission_name_max_length','2017-09-23 08:40:32.765486'),(7,'auth','0003_alter_user_email_max_length','2017-09-23 08:40:32.894494'),(8,'auth','0004_alter_user_username_opts','2017-09-23 08:40:32.914495'),(9,'auth','0005_alter_user_last_login_null','2017-09-23 08:40:33.009500'),(10,'auth','0006_require_contenttypes_0002','2017-09-23 08:40:33.015501'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-23 08:40:33.036502'),(12,'auth','0008_alter_user_username_max_length','2017-09-23 08:40:33.164509'),(13,'server','0001_initial','2017-09-23 08:40:34.372578'),(14,'sessions','0001_initial','2017-09-23 08:40:34.459583');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c1nglhfe258j8hrcax0sdqfiei9g8c5d','NzU2NzZjMWMyMjQ1ZWVmNTNmODBjNjk0YjczOTZmOWM3ODdhMzdiNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhMGEwNjcwZWMyNDFlOWU2OGJlZDg0OTYyMzg4OTBhNGZmZmI0ZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-07 15:43:18.610834'),('kqcppp3pif7qs0nh2oha1f6nweawx8qd','NTI1MDExN2RhZmUwZjUwODEyMDc3M2FjMjlhNmY1MmNjNjBhZDZkYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGEwYTA2NzBlYzI0MWU5ZTY4YmVkODQ5NjIzODg5MGE0ZmZmYjRkYSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-07 14:47:44.266404'),('ndl9thousdctuubbuzczto9y42a3b1u1','NTI1MDExN2RhZmUwZjUwODEyMDc3M2FjMjlhNmY1MmNjNjBhZDZkYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGEwYTA2NzBlYzI0MWU5ZTY4YmVkODQ5NjIzODg5MGE0ZmZmYjRkYSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-07 14:16:28.821305'),('p42blvus41z4cerb37lpez51339o7ak3','NTFiM2I0NTgxN2U5ODBhOTk3MzA4MmY3Y2RkMGY1ZDYxNjI4MjQ2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTBhMDY3MGVjMjQxZTllNjhiZWQ4NDk2MjM4ODkwYTRmZmZiNGRhIn0=','2017-10-07 09:28:03.713551');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_idc`
--

DROP TABLE IF EXISTS `resources_idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `idc_name` varchar(30) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `rel_cabinet_num` int(11) DEFAULT NULL,
  `pact_cabinet_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_idc`
--

LOCK TABLES `resources_idc` WRITE;
/*!40000 ALTER TABLE `resources_idc` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources_idc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_product`
--

DROP TABLE IF EXISTS `resources_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(32) NOT NULL,
  `pid` int(11) NOT NULL,
  `module_letter` varchar(32) NOT NULL,
  `dev_interface` varchar(100) DEFAULT NULL,
  `op_interface` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_product_pid_724b87ff` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_product`
--

LOCK TABLES `resources_product` WRITE;
/*!40000 ALTER TABLE `resources_product` DISABLE KEYS */;
INSERT INTO `resources_product` VALUES (1,'web移动',0,'webyd','zrdemail0@zrd.com,zrdemail1@zrd.com','zrdemail0@zrd.com,zrdemail83@zrd.com'),(2,'nginx服务器',1,'ngserver','292016176@qq.com','zrdemail0@zrd.com,zrdemail1@zrd.com'),(3,'aa',2,'bbc','292016176@qq.com','zrdemail2@zrd.com'),(4,'dsds',3,'dsds','zrdemail1@zrd.com','zrdemail0@zrd.com'),(5,'tomcat',0,'tomcat','zrdemail0@zrd.com','zrdemail0@zrd.com'),(6,'app',5,'app','zrdemail0@zrd.com','zrdemail1@zrd.com');
/*!40000 ALTER TABLE `resources_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_server`
--

DROP TABLE IF EXISTS `resources_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` int(11) DEFAULT NULL,
  `manufacturers` varchar(50) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `sn` varchar(60) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `inner_ip` varchar(32) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `server_cpu` varchar(250) DEFAULT NULL,
  `server_disk` varchar(100) DEFAULT NULL,
  `server_mem` varchar(100) DEFAULT NULL,
  `remark` longtext,
  `service_id` int(11) DEFAULT NULL,
  `check_update_time` datetime(6) DEFAULT NULL,
  `vm_status` int(11) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  `server_purpose_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inner_ip` (`inner_ip`),
  KEY `resources_server_idc_id_fe131330_fk_resources_idc_id` (`idc_id`),
  KEY `resources_server_server_purpose_id_c7534444_fk_resources` (`server_purpose_id`),
  KEY `resources_server_sn_3369a7d0` (`sn`),
  KEY `resources_server_hostname_2a827d99` (`hostname`),
  KEY `resources_server_service_id_a9f14ac5` (`service_id`),
  KEY `resources_server_vm_status_8df71878` (`vm_status`),
  KEY `resources_server_uuid_6c2b4617` (`uuid`),
  KEY `resources_server_status_id_85a23c2e_fk_resources_status_id` (`status_id`),
  CONSTRAINT `resources_server_idc_id_fe131330_fk_resources_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `resources_idc` (`id`),
  CONSTRAINT `resources_server_server_purpose_id_c7534444_fk_resources` FOREIGN KEY (`server_purpose_id`) REFERENCES `resources_product` (`id`),
  CONSTRAINT `resources_server_status_id_85a23c2e_fk_resources_status_id` FOREIGN KEY (`status_id`) REFERENCES `resources_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_server`
--

LOCK TABLES `resources_server` WRITE;
/*!40000 ALTER TABLE `resources_server` DISABLE KEYS */;
INSERT INTO `resources_server` VALUES (1,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-01','192.168.1.1','c6:6d:1:f0:23:78',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,1,'2017-09-23 16:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d823a',NULL,2,2),(2,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-00','192.168.1.0','c6:6d:1:f0:23:0',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,1,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8230a',NULL,2,2),(4,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-00','192.168.2.0','c6:6d:1:f0:23:0',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,1,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8230a',NULL,2,1),(5,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-01','192.168.2.1','c6:6d:1:f0:23:1',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,5,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8231a',NULL,6,1),(6,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-02','192.168.2.2','c6:6d:1:f0:23:2',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8232a',NULL,NULL,1),(7,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-03','192.168.2.3','c6:6d:1:f0:23:3',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8233a',NULL,NULL,1),(8,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-04','192.168.2.4','c6:6d:1:f0:23:4',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8234a',NULL,NULL,1),(9,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-05','192.168.2.5','c6:6d:1:f0:23:5',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,5,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8235a',NULL,6,1),(10,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-06','192.168.2.6','c6:6d:1:f0:23:6',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8236a',NULL,NULL,1),(11,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-07','192.168.2.7','c6:6d:1:f0:23:7',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8237a',NULL,NULL,1),(12,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-08','192.168.2.8','c6:6d:1:f0:23:8',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8238a',NULL,NULL,1),(13,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-09','192.168.2.9','c6:6d:1:f0:23:9',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d8239a',NULL,NULL,1),(14,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-010','192.168.2.10','c6:6d:1:f0:23:10',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82310a',NULL,NULL,1),(15,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-011','192.168.2.11','c6:6d:1:f0:23:11',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82311a',NULL,NULL,1),(16,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-012','192.168.2.12','c6:6d:1:f0:23:12',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82312a',NULL,NULL,1),(17,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-013','192.168.2.13','c6:6d:1:f0:23:13',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82313a',NULL,NULL,1),(18,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-014','192.168.2.14','c6:6d:1:f0:23:14',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82314a',NULL,NULL,1),(19,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-015','192.168.2.15','c6:6d:1:f0:23:15',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82315a',NULL,NULL,1),(20,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-016','192.168.2.16','c6:6d:1:f0:23:16',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82316a',NULL,NULL,1),(21,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-017','192.168.2.17','c6:6d:1:f0:23:17',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82317a',NULL,NULL,1),(22,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-018','192.168.2.18','c6:6d:1:f0:23:18',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82318a',NULL,NULL,1),(23,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-019','192.168.2.19','c6:6d:1:f0:23:19',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82319a',NULL,NULL,1),(24,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-020','192.168.2.20','c6:6d:1:f0:23:20',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82320a',NULL,NULL,1),(25,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-021','192.168.2.21','c6:6d:1:f0:23:21',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82321a',NULL,NULL,1),(26,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-022','192.168.2.22','c6:6d:1:f0:23:22',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82322a',NULL,NULL,1),(27,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-023','192.168.2.23','c6:6d:1:f0:23:23',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82323a',NULL,NULL,1),(28,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-024','192.168.2.24','c6:6d:1:f0:23:24',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82324a',NULL,NULL,1),(29,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-025','192.168.2.25','c6:6d:1:f0:23:25',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82325a',NULL,NULL,1),(30,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-026','192.168.2.26','c6:6d:1:f0:23:26',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82326a',NULL,NULL,1),(31,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-027','192.168.2.27','c6:6d:1:f0:23:27',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82327a',NULL,NULL,1),(32,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-028','192.168.2.28','c6:6d:1:f0:23:28',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82328a',NULL,NULL,1),(33,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-029','192.168.2.29','c6:6d:1:f0:23:29',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82329a',NULL,NULL,1),(34,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-030','192.168.2.30','c6:6d:1:f0:23:30',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82330a',NULL,NULL,1),(35,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-031','192.168.2.31','c6:6d:1:f0:23:31',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82331a',NULL,NULL,1),(36,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-032','192.168.2.32','c6:6d:1:f0:23:32',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82332a',NULL,NULL,1),(37,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-033','192.168.2.33','c6:6d:1:f0:23:33',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82333a',NULL,NULL,1),(38,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-034','192.168.2.34','c6:6d:1:f0:23:34',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82334a',NULL,NULL,1),(39,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-035','192.168.2.35','c6:6d:1:f0:23:35',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82335a',NULL,NULL,1),(40,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-036','192.168.2.36','c6:6d:1:f0:23:36',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82336a',NULL,NULL,1),(41,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-037','192.168.2.37','c6:6d:1:f0:23:37',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82337a',NULL,NULL,1),(42,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-038','192.168.2.38','c6:6d:1:f0:23:38',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82338a',NULL,NULL,1),(43,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-039','192.168.2.39','c6:6d:1:f0:23:39',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82339a',NULL,NULL,1),(44,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-040','192.168.2.40','c6:6d:1:f0:23:40',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82340a',NULL,NULL,1),(45,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-041','192.168.2.41','c6:6d:1:f0:23:41',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82341a',NULL,NULL,1),(46,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-042','192.168.2.42','c6:6d:1:f0:23:42',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82342a',NULL,NULL,1),(47,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-043','192.168.2.43','c6:6d:1:f0:23:43',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82343a',NULL,NULL,1),(48,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-044','192.168.2.44','c6:6d:1:f0:23:44',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82344a',NULL,NULL,1),(49,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-045','192.168.2.45','c6:6d:1:f0:23:45',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82345a',NULL,NULL,1),(50,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-046','192.168.2.46','c6:6d:1:f0:23:46',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82346a',NULL,NULL,1),(51,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-047','192.168.2.47','c6:6d:1:f0:23:47',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82347a',NULL,NULL,1),(52,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-048','192.168.2.48','c6:6d:1:f0:23:48',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82348a',NULL,NULL,1),(53,NULL,'HP ','2017-09-23','vmware','2qe','CentOS release 6.5 (Final)','web-049','192.168.2.49','c6:6d:1:f0:23:49',NULL,'Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz','9','490.39 MB',NULL,NULL,'2017-09-23 08:50:06.000000',1,'fb11b8fe-cd0d-11e6-9d02-0800272d82349a',NULL,NULL,1);
/*!40000 ALTER TABLE `resources_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_status`
--

DROP TABLE IF EXISTS `resources_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_status`
--

LOCK TABLES `resources_status` WRITE;
/*!40000 ALTER TABLE `resources_status` DISABLE KEYS */;
INSERT INTO `resources_status` VALUES (5,'abc'),(1,'故障'),(2,'正常');
/*!40000 ALTER TABLE `resources_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_zabbix_cache`
--

DROP TABLE IF EXISTS `resources_zabbix_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_zabbix_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `updatetime` datetime(6) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_id` (`server_id`),
  KEY `resources_zabbix_cache_hostid_5d8b7c6d` (`hostid`),
  KEY `resources_zabbix_cache_host_1f698eea` (`host`),
  KEY `resources_zabbix_cache_ip_b56667ce` (`ip`),
  CONSTRAINT `resources_zabbix_cache_server_id_0dbfb8f7_fk_resources_server_id` FOREIGN KEY (`server_id`) REFERENCES `resources_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_zabbix_cache`
--

LOCK TABLES `resources_zabbix_cache` WRITE;
/*!40000 ALTER TABLE `resources_zabbix_cache` DISABLE KEYS */;
INSERT INTO `resources_zabbix_cache` VALUES (1,10252,'yz-fang-web-01','10.20.1.1','2017-09-24 03:36:21.628212',NULL),(2,10084,'Zabbix server','127.0.0.1','2017-09-24 03:36:21.632229',NULL);
/*!40000 ALTER TABLE `resources_zabbix_cache` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-24 11:44:26

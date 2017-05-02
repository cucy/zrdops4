-- MySQL dump 10.13  Distrib 5.6.35, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: reboot
-- ------------------------------------------------------
-- Server version	5.6.35

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'dddd'),(2,'test'),(6,'市场'),(8,'研发'),(7,'运维');
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (58,1,19),(59,1,20),(60,1,21),(61,1,22),(62,1,23),(63,1,24),(64,1,25),(65,1,26),(66,1,27),(67,1,28),(98,6,5),(96,6,6),(97,6,13),(99,6,14),(100,6,15),(129,7,1),(130,7,2),(131,7,3),(132,7,4),(133,7,5),(134,7,6),(135,7,7),(136,7,8),(137,7,9),(138,7,10),(139,7,11),(140,7,12),(141,7,13),(142,7,14),(143,7,15),(144,7,16),(145,7,17),(146,7,18),(147,7,19),(148,7,20),(149,7,21),(150,7,22),(151,7,23),(152,7,24),(153,7,25),(154,7,26),(155,7,27),(156,7,28);
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add server',7,'add_server'),(20,'Can change server',7,'change_server'),(21,'Can delete server',7,'delete_server'),(22,'Can add department',8,'add_department'),(23,'Can change department',8,'change_department'),(24,'Can delete department',8,'delete_department'),(25,'Can add profile',9,'add_profile'),(26,'Can change profile',9,'change_profile'),(27,'Can delete profile',9,'delete_profile'),(28,'访问服务服务器信息',7,'view_server'),(29,'Can add idc',10,'add_idc'),(30,'Can change idc',10,'change_idc'),(31,'Can delete idc',10,'delete_idc'),(32,'访问idc列表',10,'view_idc');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$RWQ3z3eytjd5$+Sd3QMtO0O6XH4rYUeMKbLcxvw5iSSC0UI4qQcRwS24=','2017-04-30 23:00:51',1,'admin','','','admin@qq.com',1,1,'2017-04-09 02:21:38'),(2,'pbkdf2_sha256$20000$q75IwSiI1OEv$3HR91pLpVjbUQvXOx9eG9CvaMO/E7LFi0wqh3vFCl9Y=',NULL,0,'123','','','',0,1,'2017-04-09 05:39:12'),(3,'pbkdf2_sha256$20000$fzp0VmMqCaIE$Avqkfx94Hu3a7oek2Ax59b0LVYCX0ICmISp4Zk6JAbw=','2017-04-15 07:45:49',0,'aa','WWW','AAA','22@qq.com',0,1,'2017-04-15 07:43:19'),(4,'pbkdf2_sha256$20000$KjR255p2Qzy2$U3MLKKECPiaU9nfviAQVZxbi+OerkiebkOpbGMTGeXA=',NULL,0,'abc','','','',0,1,'2017-04-15 09:14:13');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(6,1,6),(7,1,7),(10,2,2),(13,3,6),(12,3,7),(11,4,2);
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'运维部'),(2,'市场部');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-04-09 05:39:12','2','123',1,'',4,1),(2,'2017-04-15 07:43:19','3','aa',1,'',4,1),(3,'2017-04-15 07:44:22','3','aa',2,'Changed first_name, last_name, email and last_login.',4,1),(4,'2017-04-15 09:14:13','4','abc',1,'',4,1);
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'dashboard','department'),(10,'dashboard','idc'),(9,'dashboard','profile'),(7,'dashboard','server'),(6,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-04-09 02:20:55'),(2,'auth','0001_initial','2017-04-09 02:20:55'),(3,'admin','0001_initial','2017-04-09 02:20:55'),(4,'contenttypes','0002_remove_content_type_name','2017-04-09 02:20:55'),(5,'auth','0002_alter_permission_name_max_length','2017-04-09 02:20:55'),(6,'auth','0003_alter_user_email_max_length','2017-04-09 02:20:55'),(7,'auth','0004_alter_user_username_opts','2017-04-09 02:20:55'),(8,'auth','0005_alter_user_last_login_null','2017-04-09 02:20:55'),(9,'auth','0006_require_contenttypes_0002','2017-04-09 02:20:55'),(10,'sessions','0001_initial','2017-04-09 02:20:55'),(11,'dashboard','0001_initial','2017-04-09 02:25:07'),(12,'dashboard','0002_auto_20170413_2239','2017-04-13 14:39:53'),(13,'dashboard','0003_auto_20170414_1737','2017-04-14 12:37:41'),(14,'dashboard','0004_idc','2017-04-30 19:03:27'),(15,'dashboard','0005_auto_20170423_1728','2017-04-30 19:03:28');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1br3otxty8uqnizo98bgoup837n6rdkc','YjYyNjBiZTBhNzA2YzNkYTkyZThjMjRkMTM5NDIyZGM5OTk3Y2RlNjp7IjAiOiJkZGZmZmZmZiIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 14:17:29'),('1jd12b194rgzlo9p7biz1sqtaomu9bjy','ZWJkMzEwYmY1OWUzMDVhNzBiMDE0OGM2YzViYmE2MzdlNTdlOWIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 15:36:48'),('1vn5bfv7myo1c7gen3uvnouy7x5tq00h','ZWJkMzEwYmY1OWUzMDVhNzBiMDE0OGM2YzViYmE2MzdlNTdlOWIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 16:08:59'),('3tvzcf7bq3ozxri1eftfiv0dh930x64p','OWEyZDhiNmQwYzc1ZjZiZjA0NDhjMDQ2ODJhMmVlMGI3ODA5NzU5MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlYzJiNjBjODE1YTY3ZWI0NDU2MDBkNmJkM2FiYWE4MTMzYzcyOGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-04-29 07:44:33'),('d2sxazghrh08wurgolahcv5zd59l50e9','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 22:42:10'),('ilbykylwzaq2btcteau0vz02vythor83','OWViMDhjZTI4YzRmN2FlZjM4OGQ1MGIyYzk3NGRiYjkyMDk4NmFiMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5OTJhNTc3MTRhNDBiMjcyZDZjYWQzZTA0ZTdhM2UwMWRiNmJkM2QiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-04-28 14:54:36'),('ir65c43zbnriv18vnve93jwfri7z27mx','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 22:50:08'),('l90l54ku49la3jqlw2425dy3a28onbvb','NjIxMmFiZGU4YTljNjBkYjY3ZmY5MzdjMTBhZGE3YzRlZTFiODM2Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5OTJhNTc3MTRhNDBiMjcyZDZjYWQzZTA0ZTdhM2UwMWRiNmJkM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-29 07:38:24'),('lav4edtdnnycvv35dejz67gk2ghp03rj','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 23:05:51'),('q23k0c14v1u0vxl8u3rl7p9r0g78uo8m','OWEyZDhiNmQwYzc1ZjZiZjA0NDhjMDQ2ODJhMmVlMGI3ODA5NzU5MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlYzJiNjBjODE1YTY3ZWI0NDU2MDBkNmJkM2FiYWE4MTMzYzcyOGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-04-29 07:45:49'),('rbydkse0lyhdui3zmdcqxwq7r4gkl86y','MjQzZDRjNTdhZjRkNDY1M2M0YjRmN2Q4MzE3Zjk0YjYyNDVlMDY0NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-05-04 14:47:10'),('z3gvbcwvc53lntdmv03owndc9q4nwrev','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-04-30 20:11:17');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idc`
--

DROP TABLE IF EXISTS `idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `idc_name` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `user` varchar(32) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idc`
--

LOCK TABLES `idc` WRITE;
/*!40000 ALTER TABLE `idc` DISABLE KEYS */;
INSERT INTO `idc` VALUES (1,'jxq','酒仙桥','酒仙桥数据中心','张三','15578985437','29@qq.com');
/*!40000 ALTER TABLE `idc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '权限英文名',
  `name_cn` varchar(40) NOT NULL COMMENT '权限中文名',
  `url` varchar(128) NOT NULL COMMENT '权限对应的url',
  `comment` varchar(128) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES (4,'git','git仓库','/project/project','测试'),(3,'cdn','cdn刷新接口','/api','cdn刷新测试'),(6,'zabbix','监控','/zabbix','监控管理平台sds'),(7,'elk','性能展示','/show','性能展示'),(8,'testing','测试发布','/project/testing','代码测试发布'),(9,'apply','申请发布','/project/apply','申请发布sdsd'),(10,'deploy','发布列表','/project/deploy','发布列表'),(13,'applylist','申请列表','/project/applylist','查看并处理申请发布的项目'),(15,'cdntest','cdn刷新123','http://cdn.com','cdn刷新'),(16,'devops','运维开发','sdafs','fasdf');
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '项目名',
  `path` varchar(128) NOT NULL COMMENT '项目代码仓库路径',
  `principal` varchar(32) NOT NULL COMMENT '负责人',
  `p_user` varchar(32) DEFAULT NULL COMMENT '有权限的用户',
  `p_group` varchar(32) DEFAULT NULL COMMENT '有权限的组',
  `create_date` date NOT NULL COMMENT '创建时间',
  `is_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '是否锁定 0-未锁定 1-锁定',
  `comment` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'test','test','2','3','1,6,7','2016-04-18',0,'testdsds'),(3,'devops','test111','3','21','9,10','2016-04-19',0,'testssdads'),(4,'gitolite-admin','gitolite-admin','1','1','1,6,7','2016-04-23',0,'管理仓库'),(5,'reboot','reboot','3','2,7','1,6','2016-04-24',0,'test'),(6,'test1','test','1','2','7','2016-07-17',0,'nihaosdsdssdsd'),(7,'devops2','http:///dsdsd','2','1,2,3','1,6,7','2016-07-17',0,'just+a+testsdad'),(17,'fdsafa','fasdfas','3','2,3','6','2016-07-31',0,'fsadfas'),(18,'sdad','dadsad','2','2','7','2016-07-31',0,'sad'),(19,'sdadsdsds','dadsad','1,15','2','1,7','2016-07-31',0,'sad'),(20,'adadsadas','sa','1,15,21','2,21','7','2016-07-31',0,'sad'),(21,'aaa','aa','2','1,3','7,9','2016-08-06',0,'aa'),(22,'sadfasf','fadsfa','1','2','7','2016-09-11',0,'fsadfa'),(23,'1111','1111','2','3','1','2016-11-19',0,'11'),(24,'fdasfsafs','fasdfasf','2','2','7','2016-11-20',0,'fdsafsaf'),(25,'2323','323232','2','24','10','2016-11-20',0,'32323');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_apply`
--

DROP TABLE IF EXISTS `project_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL COMMENT '对应project项目ID',
  `info` varchar(64) NOT NULL COMMENT '发布简介',
  `applicant` varchar(64) NOT NULL COMMENT '申请人',
  `version` varchar(64) DEFAULT NULL COMMENT '发布版本',
  `commit` varchar(64) NOT NULL COMMENT '代码最新版本',
  `apply_date` datetime NOT NULL COMMENT '申请时间',
  `status` int(10) DEFAULT '0' COMMENT '发布状态',
  `detail` text COMMENT '发布详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_apply`
--

LOCK TABLES `project_apply` WRITE;
/*!40000 ALTER TABLE `project_apply` DISABLE KEYS */;
INSERT INTO `project_apply` VALUES (1,1,'速度是多少','admin','aa','11111','2016-06-26 09:38:00',3,'实打实'),(2,3,'nihao','admin','vsdsds','11111','2016-07-31 18:00:00',1,'nihao'),(3,5,'DD','admin','111','11111','2016-04-24 16:36:00',3,'DD'),(4,4,'等等','admin',NULL,'11111','2016-05-22 10:13:00',3,'等等'),(5,7,'aa','admin','version0.11','11111','2016-08-06 09:22:00',1,'aa'),(7,21,'dsafs','bbbbb','dsafsaf','11111','2016-11-20 10:07:00',4,'fdsafsaf'),(6,20,'adsas','admin','dasd','11111','2016-07-31 17:55:00',3,'asd'),(8,17,'111','kk',NULL,'11111','2016-08-13 20:25:00',3,'111'),(9,23,'','admin','dfsafaf','11111','2016-11-20 11:44:00',1,'');
/*!40000 ALTER TABLE `project_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_deploy`
--

DROP TABLE IF EXISTS `project_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_deploy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL COMMENT '对应project的项目ID',
  `info` varchar(64) NOT NULL COMMENT '发布简介',
  `version` varchar(64) DEFAULT NULL COMMENT '发布版本',
  `commit` varchar(64) NOT NULL COMMENT '代码最新版本',
  `applicant` varchar(64) NOT NULL COMMENT '操作人',
  `apply_date` datetime NOT NULL COMMENT '操作时间',
  `status` int(10) DEFAULT '0' COMMENT '发布状态',
  `detail` text COMMENT '发布详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_deploy`
--

LOCK TABLES `project_deploy` WRITE;
/*!40000 ALTER TABLE `project_deploy` DISABLE KEYS */;
INSERT INTO `project_deploy` VALUES (1,1,'nih',NULL,'11111','admin','2016-04-21 21:05:00',1,'dsdsd'),(2,3,'nihao+',NULL,'11111','admin','2016-04-21 21:16:00',1,'nihao'),(3,3,'nihao+','','11111','admin','2016-04-21 21:16:00',4,'nihao'),(28,3,'111','v0.1','11111','admin','2016-04-22 11:46:00',3,'111'),(7,1,'nih','11111','11111','admin','2016-04-21 21:05:00',2,'dsdsd'),(8,1,'nih','11111','11111','admin','2016-04-21 21:05:00',3,'dsdsd'),(9,3,'你好',NULL,'11111','admin','2016-04-22 00:09:00',1,'测试'),(27,3,'111','v0.1','11111','admin','2016-04-22 11:46:00',2,'111'),(13,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',2,'测试'),(14,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',3,'测试'),(15,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',3,'测试'),(16,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',3,'测试'),(17,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',3,'测试'),(18,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',3,'测试'),(19,3,'你好','v0.q1','11111','admin','2016-04-22 00:09:00',4,'测试'),(20,1,'sdsds',NULL,'11111','admin','2016-04-22 00:17:00',1,'dsds'),(21,1,'sdsds','vsd','11111','admin','2016-04-22 00:17:00',2,'dsds'),(22,1,'sdsds','vsd','11111','admin','2016-04-22 00:17:00',3,'dsds'),(23,3,'dssd',NULL,'11111','admin','2016-04-22 00:20:00',1,'sds'),(24,3,'dssd','sdsd','11111','admin','2016-04-22 00:20:00',2,'sds'),(25,3,'dssd','sdsd','11111','admin','2016-04-22 00:20:00',3,'sds'),(26,3,'111',NULL,'11111','admin','2016-04-22 11:46:00',1,'111'),(29,1,'nihao+',NULL,'11111','rock','2016-04-23 12:25:00',1,'nihao'),(30,1,'nihao+','v1.0','11111','rock','2016-04-23 12:25:00',2,'nihao'),(31,1,'nihao+','v1.0','11111','rock','2016-04-23 12:25:00',4,'nihao'),(32,1,'nihao+','v1.0','11111','rock','2016-04-23 12:25:00',4,'nihao'),(33,1,'nihao+','v1.0','11111','rock','2016-04-23 12:25:00',4,'nihao'),(34,1,'test',NULL,'11111','rock','2016-04-23 12:26:00',1,'test'),(35,1,'test','12','11111','rock','2016-04-23 12:26:00',2,'test'),(36,1,'test','12','11111','rock','2016-04-23 12:26:00',4,'test'),(37,1,'nihaodd',NULL,'11111','rock','2016-04-23 13:24:00',1,'nih'),(38,1,'nihaodd','12','11111','rock','2016-04-23 13:24:00',3,'nih'),(39,1,'sss',NULL,'11111','rock','2016-04-23 13:24:00',1,'ss'),(40,1,'sss','sss','11111','rock','2016-04-23 13:24:00',2,'ss'),(41,1,'sss','sss','11111','rock','2016-04-23 13:24:00',4,'ss'),(42,1,'dssd',NULL,'11111','rock','2016-04-23 13:29:00',1,'sds'),(43,1,'dssd','v0.q1','11111','rock','2016-04-23 13:29:00',2,'sds'),(44,1,'dssd','v0.q1','11111','rock','2016-04-23 13:29:00',4,'sds'),(45,3,'test',NULL,'11111','admin','2016-04-24 15:01:00',1,'aaaa'),(46,3,'test','v0.1','11111','admin','2016-04-24 15:01:00',3,'aaaa'),(47,3,'test',NULL,'11111','admin','2016-04-24 15:06:00',1,'test'),(48,3,'test','version0.1','11111','admin','2016-04-24 15:06:00',2,'test'),(49,3,'test','version0.1','11111','admin','2016-04-24 15:06:00',4,'test'),(50,3,'ddd',NULL,'11111','admin','2016-04-24 15:48:00',1,'dddd'),(51,1,'nihao',NULL,'11111','admin','2016-04-24 16:03:00',1,'nihao'),(52,3,'ddd','version0.1','11111','admin','2016-04-24 15:48:00',3,'dddd'),(53,5,'nihao',NULL,'11111','admin','2016-04-24 16:05:00',1,'test'),(54,5,'nihao','','11111','admin','2016-04-24 16:05:00',3,'test'),(55,1,'nihao','aa','11111','admin','2016-04-24 16:03:00',2,'nihao'),(56,3,'fgfff',NULL,'11111','admin','2016-04-24 16:33:00',1,'ghgg'),(57,3,'fgfff','vvv','11111','admin','2016-04-24 16:33:00',2,'ghgg'),(58,1,'nihao','aa','11111','admin','2016-04-24 16:03:00',3,'nihao'),(59,5,'DD',NULL,'11111','admin','2016-04-24 16:36:00',1,'DD'),(60,3,'fgfff','vvv','11111','admin','2016-04-24 16:33:00',4,'ghgg'),(61,3,'特务+v',NULL,'11111','admin','2016-05-22 10:13:00',1,'特特'),(62,4,'等等',NULL,'11111','admin','2016-05-22 10:13:00',1,'等等'),(63,3,'特务+v','111','11111','admin','2016-05-22 10:13:00',2,'特特'),(64,3,'特务+v','111','11111','admin','2016-05-22 10:13:00',4,'特特'),(65,3,'qqq',NULL,'11111','admin','2016-06-25 23:16:00',1,'qqq'),(66,3,'qqq','sss','11111','admin','2016-06-25 23:16:00',2,'qqq'),(67,1,'速度是多少',NULL,'11111','admin','2016-06-26 09:38:00',1,'实打实'),(68,5,'DD','111','11111','admin','2016-04-24 16:36:00',2,'DD'),(69,3,'qqq','sss','11111','admin','2016-06-25 23:16:00',3,'qqq'),(70,7,'测试',NULL,'11111','admin','2016-07-17 14:01:00',1,'测试'),(71,3,'你好',NULL,'11111','admin','2016-07-17 14:03:00',1,'你好'),(72,3,'你好','sss','11111','admin','2016-07-17 14:03:00',3,'你好'),(73,7,'测试','version0.11','11111','admin','2016-07-17 14:01:00',2,'测试'),(74,7,'测试','version0.11','11111','admin','2016-07-17 14:01:00',4,'测试'),(75,3,'nihao+',NULL,'11111','admin','2016-07-28 23:15:00',1,'nihao'),(76,3,'nihao+','vsdad','11111','admin','2016-07-28 23:15:00',2,'nihao'),(77,3,'nihao+','vsdad','11111','admin','2016-07-28 23:15:00',4,'nihao'),(78,4,'等等','','11111','admin','2016-05-22 10:13:00',3,'等等'),(79,3,'sdafa',NULL,'11111','admin','2016-07-28 23:18:00',1,'dafasf'),(80,3,'sdafa','sdsd','11111','admin','2016-07-28 23:18:00',2,'dafasf'),(81,3,'sdafa','sdsd','11111','admin','2016-07-28 23:18:00',4,'dafasf'),(82,1,'速度是多少','aa','11111','admin','2016-06-26 09:38:00',3,'实打实'),(83,3,'sadfa',NULL,'11111','admin','2016-07-31 09:26:00',1,'fdsaf'),(84,3,'sadfa','vsdsds','11111','admin','2016-07-31 09:26:00',2,'fdsaf'),(85,5,'DD','111','11111','admin','2016-04-24 16:36:00',3,'DD'),(86,3,'sadfa','vsdsds','11111','admin','2016-07-31 09:26:00',4,'fdsaf'),(87,20,'just+a+test',NULL,'11111','admin','2016-07-31 17:36:00',1,'sdsds'),(88,20,'just+a+test','version0.1','11111','admin','2016-07-31 17:36:00',2,'sdsds'),(89,20,'just+a+test','version0.1','11111','admin','2016-07-31 17:36:00',3,'sdsds'),(90,20,'fasdfasfd',NULL,'11111','admin','2016-07-31 17:43:00',1,'asdfasf'),(91,20,'fasdfasfd','sadfa','11111','admin','2016-07-31 17:43:00',2,'asdfasf'),(92,20,'fasdfasfd','sadfa','11111','admin','2016-07-31 17:43:00',4,'asdfasf'),(93,20,'adsas',NULL,'11111','admin','2016-07-31 17:55:00',1,'asd'),(94,20,'adsas','dasd','11111','admin','2016-07-31 17:55:00',2,'asd'),(95,3,'nihao',NULL,'11111','admin','2016-07-31 18:00:00',1,'nihao'),(96,7,'aa',NULL,'11111','admin','2016-08-06 09:22:00',1,'aa'),(97,21,'s11111',NULL,'11111','admin','2016-08-06 09:54:00',1,'111'),(98,21,'s11111','v1.10','11111','admin','2016-08-06 09:54:00',2,'111'),(99,21,'s11111','v1.10','11111','admin','2016-08-06 09:54:00',4,'111'),(100,21,'sds',NULL,'11111','kk','2016-08-13 20:18:00',1,'sdsd'),(101,17,'111',NULL,'11111','kk','2016-08-13 20:25:00',1,'111'),(102,21,'sds','vvdd','11111','kk','2016-08-13 20:18:00',2,'sdsd'),(103,21,'sds','vvdd','11111','kk','2016-08-13 20:18:00',2,'sdsd'),(104,21,'sds','vvdd','11111','kk','2016-08-13 20:18:00',4,'sdsd'),(105,21,'',NULL,'11111','admin','2016-08-18 10:50:00',1,''),(106,21,'','vvdd','11111','admin','2016-08-18 10:50:00',3,''),(107,21,'这是一个测试',NULL,'11111','admin','2016-08-18 10:52:00',1,'这是一个测试'),(108,21,'这是一个测试','v0.3','11111','admin','2016-08-18 10:52:00',2,'这是一个测试'),(109,21,'这是一个测试','v0.3','11111','admin','2016-08-18 10:52:00',4,'这是一个测试'),(110,21,'test',NULL,'11111','admin','2016-09-10 10:13:00',1,'test'),(111,21,'test','ss','11111','admin','2016-09-10 10:13:00',2,'test'),(112,21,'test','ss','11111','admin','2016-09-10 10:13:00',4,'test'),(113,21,'fsadfsaf',NULL,'11111','admin','2016-09-11 11:53:00',1,'fasdfsa'),(114,21,'fsadfsaf','version0.1sdfs','11111','admin','2016-09-11 11:53:00',2,'fasdfsa'),(115,21,'fsadfsaf','version0.1sdfs','11111','admin','2016-09-11 11:53:00',4,'fasdfsa'),(116,20,'adsas','dasd','11111','admin','2016-07-31 17:55:00',3,'asd'),(117,17,'111','','11111','kk','2016-08-13 20:25:00',3,'111'),(118,21,'dsafs',NULL,'11111','bbbbb','2016-11-20 10:07:00',1,'fdsafsaf'),(119,21,'dsafs','dsafsaf','11111','bbbbb','2016-11-20 10:07:00',2,'fdsafsaf'),(120,21,'dsafs','dsafsaf','11111','bbbbb','2016-11-20 10:07:00',4,'fdsafsaf'),(121,23,'dfasdf',NULL,'11111','admin','2016-11-20 10:16:00',1,'fasdfsaf'),(122,23,'dfasdf','dfsafaf','11111','admin','2016-11-20 10:16:00',2,'fasdfsaf'),(123,23,'dfasdf','dfsafaf','11111','admin','2016-11-20 10:16:00',3,'fasdfsaf'),(124,23,'',NULL,'11111','admin','2016-11-20 11:44:00',1,'');
/*!40000 ALTER TABLE `project_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_test`
--

DROP TABLE IF EXISTS `project_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL COMMENT '对应project项目ID',
  `host` varchar(64) NOT NULL COMMENT '测试主机',
  `commit` varchar(64) NOT NULL COMMENT '推送版本号',
  `pusher` varchar(128) NOT NULL COMMENT '推送人',
  `push_date` datetime NOT NULL COMMENT '推送时间',
  `comment` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_test`
--

LOCK TABLES `project_test` WRITE;
/*!40000 ALTER TABLE `project_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT 'è§’è‰²å',
  `name_cn` varchar(40) NOT NULL COMMENT 'è§’è‰²ä¸­æ–‡å',
  `p_id` varchar(20) NOT NULL COMMENT 'æƒé™idï¼Œå…è®¸å¤šä¸ªp_id,å­˜ä¸ºå­—ç¬¦ä¸²ç±»åž‹',
  `info` varchar(50) DEFAULT NULL COMMENT 'è§’è‰²æè¿°ä¿¡æ¯',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'sa','运维组','4,3,6,7,8,9,10,13','超级管理员'),(7,'php','开发组','4,8,9,10','PHP开发'),(9,'ios','苹果开发组','4,8','苹果开发组'),(10,'devops','运维研发','4,3','运维研发');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) DEFAULT NULL,
  `sn` varchar(60) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  `remark` longtext,
  `check_update_time` datetime(6),
  `inner_ip` varchar(32),
  `ip_info` varchar(255),
  `mac_address` varchar(50),
  `manufacture_date` date,
  `manufacturers` varchar(50),
  `os` varchar(50),
  `server_cpu` varchar(250),
  `server_disk` varchar(100),
  `server_mem` varchar(100),
  `server_type` varchar(20),
  `status` varchar(100),
  `supplier` int(11),
  `uuid` varchar(100),
  `vm_status` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `inner_ip` (`inner_ip`),
  KEY `server_hostname_73f612bda79a534f_uniq` (`hostname`),
  KEY `server_idc_id_33d7a3cdef6053fc_uniq` (`idc_id`),
  KEY `server_sn_7cdb4aeb831d512b_uniq` (`sn`),
  KEY `server_9acb4454` (`status`),
  KEY `server_ef7c876f` (`uuid`),
  KEY `server_25e25237` (`vm_status`),
  CONSTRAINT `server_idc_id_33d7a3cdef6053fc_fk_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `idc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'localhost.localdomain','VMware-564dd9ff4ebe78a1-6a268732148bc1c6',NULL,NULL,'2017-05-01 11:19:09.612898',NULL,NULL,NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','1.94 GB','VMware Virtual Platf',NULL,NULL,'FFD94D56-BE4E-A178-6A26-8732148BC1C6',0);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(80) NOT NULL COMMENT '姓名',
  `email` varchar(64) NOT NULL COMMENT '公司邮箱',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号',
  `r_id` varchar(32) NOT NULL COMMENT '角色id,允许多个r_id,存为字符串类型',
  `is_lock` tinyint(1) unsigned NOT NULL COMMENT '是否锁定 0-未锁定 1-锁定',
  `join_date` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','adminadmin','787696331@qq.com','18310519911121','1,7,10',0,NULL,'2017-03-17 22:52:17'),(2,'wd','e10adc3949ba59abbe56e057f20f883e','卧底','787696331@123.com','121212121s','6',0,'2016-04-11 23:24:04','2016-08-13 10:11:44'),(3,'pc','e10adc3949ba59abbe56e057f20f883e','pc','787696331@qq.com','121212121','6',0,'2016-04-11 23:26:51','2016-04-24 14:43:38'),(7,'kk','e10adc3949ba59abbe56e057f20f883e','kk','7896331@qq.com','182104199222','1,6,7',0,'2016-04-13 14:53:33','2016-08-13 20:53:13'),(6,'panda','e10adc3949ba59abbe56e057f20f883e','panda','787696331@qq.com','121212121','1,7,10',0,'2016-04-12 23:23:50','2016-04-22 17:04:27'),(15,'rock','e10adc3949ba59abbe56e057f20f883e','峻峰','777@111111.com','18210510011','1,6,7,10',0,'2016-04-17 10:10:49','2016-04-23 12:21:59'),(22,'qicheng','e10adc3949ba59abbe56e057f20f883e','qicheng','787696331@qq.com','121212121','10',0,'2016-10-22 17:01:02',NULL),(23,'aaaaa','e10adc3949ba59abbe56e057f20f883e','测试','1111@reboot.com','18310419933','7',0,'2016-11-19 23:01:50','2016-11-20 11:08:21'),(24,'bbbbb','e10adc3949ba59abbe56e057f20f883e','你好吗','111@reboot.com','18210419911','7',0,'2016-11-20 10:04:01','2016-11-20 10:06:37');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `chinaname` varchar(32) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_profile_department_id_8ae2ef5_fk_department_id` (`department_id`),
  CONSTRAINT `user_profile_department_id_8ae2ef5_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `user_profile_user_id_a9bb3f0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'16662227','CEO','小明',2,1),(2,'88561','jj','jj',2,2),(3,'111222',NULL,NULL,2,3),(4,NULL,NULL,NULL,2,4);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-01 18:44:36

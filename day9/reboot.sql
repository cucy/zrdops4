-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: reboot
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add server',7,'add_server'),(20,'Can change server',7,'change_server'),(21,'Can delete server',7,'delete_server'),(22,'Can add department',8,'add_department'),(23,'Can change department',8,'change_department'),(24,'Can delete department',8,'delete_department'),(25,'Can add profile',9,'add_profile'),(26,'Can change profile',9,'change_profile'),(27,'Can delete profile',9,'delete_profile'),(28,'访问服务服务器信息',7,'view_server'),(29,'Can add idc',10,'add_idc'),(30,'Can change idc',10,'change_idc'),(31,'Can delete idc',10,'delete_idc'),(32,'访问idc列表',10,'view_idc'),(33,'Can add status',11,'add_status'),(34,'Can change status',11,'change_status'),(35,'Can delete status',11,'delete_status'),(36,'Can add product',12,'add_product'),(37,'Can change product',12,'change_product'),(38,'Can delete product',12,'delete_product'),(39,'管理业务线',12,'view_product'),(44,'Can add zabbix host',14,'add_zabbixhost'),(45,'Can change zabbix host',14,'change_zabbixhost'),(46,'Can delete zabbix host',14,'delete_zabbixhost');
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
  `username` varchar(150) NOT NULL,
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$RWQ3z3eytjd5$+Sd3QMtO0O6XH4rYUeMKbLcxvw5iSSC0UI4qQcRwS24=','2017-06-03 18:16:15',1,'admin','','','admin@qq.com',1,1,'2017-04-09 02:21:38'),(2,'pbkdf2_sha256$20000$q75IwSiI1OEv$3HR91pLpVjbUQvXOx9eG9CvaMO/E7LFi0wqh3vFCl9Y=','2017-05-18 15:29:44',0,'王五','','','wangwu@qq.com',0,1,'2017-04-09 05:39:12'),(3,'pbkdf2_sha256$20000$fzp0VmMqCaIE$Avqkfx94Hu3a7oek2Ax59b0LVYCX0ICmISp4Zk6JAbw=','2017-04-15 07:45:49',0,'张三','WWW','AAA','zhansan@qq.com',0,1,'2017-04-15 07:43:19'),(4,'pbkdf2_sha256$20000$KjR255p2Qzy2$U3MLKKECPiaU9nfviAQVZxbi+OerkiebkOpbGMTGeXA=','2017-05-18 15:29:46',0,'李四','','','lisi@qq.com',0,1,'2017-04-15 09:14:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'dashboard','department'),(10,'dashboard','idc'),(12,'dashboard','product'),(9,'dashboard','profile'),(7,'dashboard','server'),(11,'dashboard','status'),(14,'dashboard','zabbixhost'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-04-09 02:20:55'),(2,'auth','0001_initial','2017-04-09 02:20:55'),(3,'admin','0001_initial','2017-04-09 02:20:55'),(4,'contenttypes','0002_remove_content_type_name','2017-04-09 02:20:55'),(5,'auth','0002_alter_permission_name_max_length','2017-04-09 02:20:55'),(6,'auth','0003_alter_user_email_max_length','2017-04-09 02:20:55'),(7,'auth','0004_alter_user_username_opts','2017-04-09 02:20:55'),(8,'auth','0005_alter_user_last_login_null','2017-04-09 02:20:55'),(9,'auth','0006_require_contenttypes_0002','2017-04-09 02:20:55'),(10,'sessions','0001_initial','2017-04-09 02:20:55'),(11,'dashboard','0001_initial','2017-04-09 02:25:07'),(12,'dashboard','0002_auto_20170413_2239','2017-04-13 14:39:53'),(13,'dashboard','0003_auto_20170414_1737','2017-04-14 12:37:41'),(14,'dashboard','0004_idc','2017-04-30 19:03:27'),(15,'dashboard','0005_auto_20170423_1728','2017-04-30 19:03:28'),(16,'dashboard','0006_status','2017-05-10 22:53:27'),(17,'dashboard','0007_product','2017-05-11 21:49:38'),(18,'admin','0002_logentry_remove_auto_add','2017-05-18 09:51:31'),(19,'auth','0007_alter_validators_add_error_messages','2017-05-18 09:51:31'),(20,'auth','0008_alter_user_username_max_length','2017-05-18 09:51:31'),(21,'dashboard','0008_auto_20170519_1553','2017-05-19 15:53:36'),(22,'dashboard','0002_auto_20170603_1512','2017-06-03 15:12:53'),(23,'dashboard','0003_zabbixhost','2017-06-03 17:54:04');
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
INSERT INTO `django_session` VALUES ('0ukw51dyh7in7o4eebibf7a2cibuj018','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-19 16:36:15'),('1br3otxty8uqnizo98bgoup837n6rdkc','YjYyNjBiZTBhNzA2YzNkYTkyZThjMjRkMTM5NDIyZGM5OTk3Y2RlNjp7IjAiOiJkZGZmZmZmZiIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 14:17:29'),('1jd12b194rgzlo9p7biz1sqtaomu9bjy','ZWJkMzEwYmY1OWUzMDVhNzBiMDE0OGM2YzViYmE2MzdlNTdlOWIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 15:36:48'),('1vn5bfv7myo1c7gen3uvnouy7x5tq00h','ZWJkMzEwYmY1OWUzMDVhNzBiMDE0OGM2YzViYmE2MzdlNTdlOWIyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 16:08:59'),('2hag7hrlfxqpnov8jp76wl2vrmi3iwxc','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-10 23:33:23'),('2la6cb44rm3ar5lwjx277vvdwetqnu9s','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-12 12:00:51'),('3tvzcf7bq3ozxri1eftfiv0dh930x64p','OWEyZDhiNmQwYzc1ZjZiZjA0NDhjMDQ2ODJhMmVlMGI3ODA5NzU5MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlYzJiNjBjODE1YTY3ZWI0NDU2MDBkNmJkM2FiYWE4MTMzYzcyOGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-04-29 07:44:33'),('5r69aigijeahlg5qbmpgdkjtxjpz32cu','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 12:39:19'),('62drim52vjgdkyzzzm7rxtsk4wtxewj8','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-09 23:48:24'),('7ea5tr31jqdk4oiun8ncaapnv2bsxmwg','OWVmZmI1MmQ2NjdmZjk3ZjQ4NTFmYjIwYzQyM2RjYjljNTZlMzE1Njp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0MzcxZGUyYjhkNTI3NDgyZGYwOTk2YTNhOTY0ZDdhNzhmYWI0YWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-27 15:12:24'),('7ot34ies426w1lnya3g37mpa2fg0fi0n','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-03 11:37:57'),('8m11rncd7b9wqqkkjjyf4imoi3pjrf3e','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 10:42:55'),('bkhwjgyr2tpoeajn8ihqola74ii8akhp','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-11 00:34:56'),('ckv80p4v63czmlndz1zoyvtsgawbqp4n','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-18 16:10:11'),('d2sxazghrh08wurgolahcv5zd59l50e9','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 22:42:10'),('dmeefsi4dkhickgq3554ol3rnmnxpv40','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 17:49:51'),('dt4sq4cnwxl7f9bg1nye15lvh2vmr8zv','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-10 22:43:13'),('fibqxo9nhwshdgunzgbatqn6pbq22k9n','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-03 19:06:15'),('gix9vlc0a890nktxdmshvcyz9gohxka0','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-18 10:59:57'),('gzjl5aajfxqiozwcnzays3vuljxcrysv','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-19 10:34:43'),('hmiw72of712pk02df4w3y18626j4vcsw','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 18:57:35'),('ilbykylwzaq2btcteau0vz02vythor83','OWViMDhjZTI4YzRmN2FlZjM4OGQ1MGIyYzk3NGRiYjkyMDk4NmFiMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5OTJhNTc3MTRhNDBiMjcyZDZjYWQzZTA0ZTdhM2UwMWRiNmJkM2QiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-04-28 14:54:36'),('ir65c43zbnriv18vnve93jwfri7z27mx','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 22:50:08'),('k5ry40ymfxjlibon5xngdyd8rbar58px','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-09 22:58:10'),('l90l54ku49la3jqlw2425dy3a28onbvb','NjIxMmFiZGU4YTljNjBkYjY3ZmY5MzdjMTBhZGE3YzRlZTFiODM2Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5OTJhNTc3MTRhNDBiMjcyZDZjYWQzZTA0ZTdhM2UwMWRiNmJkM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-29 07:38:24'),('lav4edtdnnycvv35dejz67gk2ghp03rj','OWQ0ZDliOWQxNjkwMzIzOTBlZWVkMzMzZmJjZWJkZjZjMGI4NjQwNjp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwLCJfYXV0aF91c2VyX2hhc2giOiI5NDM3MWRlMmI4ZDUyNzQ4MmRmMDk5NmEzYTk2NGQ3YTc4ZmFiNGFjIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2017-04-30 23:05:51'),('lr47n7mvjep64m642ci6ejqzg7zmphxc','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-18 20:00:27'),('ls9p23t55rs890lj5d05rzggj82uyh2r','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-19 14:16:16'),('mieuorrm2wguwe2yqf8q9m251prbj58i','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 16:28:14'),('phjvm4vnhavjbi0cng5pg14nnqkayofl','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 19:48:07'),('pmgwib5bpb9h5guydvbsl9vb6dljiojb','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-12 11:55:10'),('q23k0c14v1u0vxl8u3rl7p9r0g78uo8m','OWEyZDhiNmQwYzc1ZjZiZjA0NDhjMDQ2ODJhMmVlMGI3ODA5NzU5MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlYzJiNjBjODE1YTY3ZWI0NDU2MDBkNmJkM2FiYWE4MTMzYzcyOGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-04-29 07:45:49'),('q7whu42mtrw1fgon9tx3m3xkcpesxjfw','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-12 10:57:47'),('rbydkse0lyhdui3zmdcqxwq7r4gkl86y','MjQzZDRjNTdhZjRkNDY1M2M0YjRmN2Q4MzE3Zjk0YjYyNDVlMDY0NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4OTdlZTk3YTFkODhjY2RjZDA3YjQ1NzM5MGRmNTNlNDg2ZDE0ZDkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-05-04 14:47:10'),('s1x2pd4m3htm4fdczpzkcwv7tjid0464','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-03 13:12:14'),('tg3hc2sox5ha26snrkjp6ik4zacrjg9t','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-11 01:27:49'),('uuqrw990g1yhwq5815shgwr8cletxzrc','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-12 12:18:39'),('uwp2c22y3yvilhq1yd743fdj8gwmatv5','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-20 14:50:29'),('w1j95skhr8roa0qalvthfbh38zlrk9c3','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-09 22:03:23'),('w1wrs08za5hjryr6hvkz4z3t87brq9lt','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-03 10:46:00'),('w4jkjtw01gwdayl63tzgkhwpyrzjciau','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-12 18:30:12'),('ybb2u306lg1rkuw3xsxys9feuefxbao1','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-11 22:57:10'),('z3gvbcwvc53lntdmv03owndc9q4nwrev','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-04-30 20:11:17'),('zl2u71g3y21p9dwzxoo0clx7gs4qbpy9','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-03 17:18:59'),('zyu3hsddvmt5t6d6zuthottubwng4pua','MzUwN2RhMmM3YjkzYWIzZGRlYzA3ZmNmZTBlYzNlYmVmZDE1YzM2YTp7Il9zZXNzaW9uX2V4cGlyeSI6MzAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiOTQzNzFkZTJiOGQ1Mjc0ODJkZjA5OTZhM2E5NjRkN2E3OGZhYjRhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-05-11 01:41:34');
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `module_letter` varchar(10) NOT NULL,
  `op_interface` varchar(500) NOT NULL,
  `dev_interface` varchar(500) NOT NULL,
  `p_product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name_7447dea0eb5f647a_uniq` (`name`),
  KEY `product_p_product_id_639b3adbd91107af_fk_product_id` (`p_product_id`),
  CONSTRAINT `product_p_product_id_639b3adbd91107af_fk_product_id` FOREIGN KEY (`p_product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'招聘','zp1','admin@qq.com,wangwu@qq.com,zhansan@qq.com','admin@qq.com,wangwu@qq.com,zhansan@qq.com,lisi@qq.com',NULL),(2,'市场','changs','admin@qq.com,wangwu@qq.com','admin@qq.com,zhansan@qq.com',NULL),(3,'移动app','ydapp','admin@qq.com,wangwu@qq.com,zhansan@qq.com,lisi@qq.com','admin@qq.com,wangwu@qq.com,zhansan@qq.com,lisi@qq.com',1),(4,'移动app2','yidongapp','admin@qq.com,wangwu@qq.com','',2),(5,'静态内容','jingt','admin@qq.com,wangwu@qq.com,zhansan@qq.com,lisi@qq.com','admin@qq.com,wangwu@qq.com,zhansan@qq.com',1),(6,'销售','xs','admin@qq.com,wangwu@qq.com,zhansan@qq.com','admin@qq.com,zhansan@qq.com,lisi@qq.com',NULL),(12,'移动应用','test1','admin@qq.com,zhansan@qq.com','wangwu@qq.com,zhansan@qq.com,lisi@qq.com',6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_p_to_server`
--

DROP TABLE IF EXISTS `product_p_to_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_p_to_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`server_id`),
  KEY `product_p_to_server_server_id_49d461432a5344e8_fk_server_id` (`server_id`),
  CONSTRAINT `product_p_to_server_product_id_17f36fbeb1d28817_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_p_to_server_server_id_49d461432a5344e8_fk_server_id` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_p_to_server`
--

LOCK TABLES `product_p_to_server` WRITE;
/*!40000 ALTER TABLE `product_p_to_server` DISABLE KEYS */;
INSERT INTO `product_p_to_server` VALUES (6,3,2),(9,3,3),(8,4,4),(10,4,5),(4,5,1),(2,5,58),(5,12,7);
/*!40000 ALTER TABLE `product_p_to_server` ENABLE KEYS */;
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
  KEY `resources_zabbix_cache_916e03f4` (`hostid`),
  KEY `resources_zabbix_cache_67b3dba8` (`host`),
  KEY `resources_zabbix_cache_957b527b` (`ip`),
  CONSTRAINT `resources_zabbix_cache_server_id_186d88b08aa33782_fk_server_id` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_zabbix_cache`
--

LOCK TABLES `resources_zabbix_cache` WRITE;
/*!40000 ALTER TABLE `resources_zabbix_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources_zabbix_cache` ENABLE KEYS */;
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
  `check_update_time` datetime(6) DEFAULT NULL,
  `inner_ip` varchar(32) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `manufacturers` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `server_cpu` varchar(250) DEFAULT NULL,
  `server_disk` varchar(100) DEFAULT NULL,
  `server_mem` varchar(100) DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `vm_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inner_ip` (`inner_ip`),
  KEY `server_hostname_73f612bda79a534f_uniq` (`hostname`),
  KEY `server_idc_id_33d7a3cdef6053fc_uniq` (`idc_id`),
  KEY `server_sn_7cdb4aeb831d512b_uniq` (`sn`),
  KEY `server_9acb4454` (`status`),
  KEY `server_ef7c876f` (`uuid`),
  KEY `server_25e25237` (`vm_status`),
  CONSTRAINT `server_idc_id_33d7a3cdef6053fc_fk_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `idc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'zw-web-pro-1','VMware-564dd9ff4ebe78a1-6a268732148bc11',NULL,NULL,NULL,NULL,'192.168.11.1',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','1 GB','VMware Virtual Platf','线上',NULL,'1b8f284a-34be-11e7-b1d9-784f4370c65f',0),(2,'zw-web-pro-2','VMware-564dd9ff4ebe78a1-6a268732148bc12',NULL,NULL,NULL,NULL,'192.168.11.2',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','2 GB','VMware Virtual Platf','报废',NULL,'1b9032f0-34be-11e7-88cc-784f4370c65f',0),(3,'zw-web-pro-3','VMware-564dd9ff4ebe78a1-6a268732148bc13',NULL,NULL,NULL,NULL,'192.168.11.3',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','3 GB','VMware Virtual Platf','报废',NULL,'1b9084a8-34be-11e7-95ac-784f4370c65f',0),(4,'zw-web-pro-4','VMware-564dd9ff4ebe78a1-6a268732148bc14',NULL,NULL,NULL,NULL,'192.168.11.4',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','4 GB','VMware Virtual Platf','报废',NULL,'1b90c780-34be-11e7-94f7-784f4370c65f',0),(5,'zw-web-pro-5','VMware-564dd9ff4ebe78a1-6a268732148bc15',NULL,NULL,NULL,NULL,'192.168.11.5',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','5 GB','VMware Virtual Platf','线下',NULL,'1b910282-34be-11e7-be13-784f4370c65f',0),(6,'zw-web-pro-6','VMware-564dd9ff4ebe78a1-6a268732148bc16',NULL,NULL,NULL,NULL,'192.168.11.6',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','6 GB','VMware Virtual Platf',NULL,NULL,'1b91389e-34be-11e7-bdb7-784f4370c65f',0),(7,'zw-web-pro-7','VMware-564dd9ff4ebe78a1-6a268732148bc17',NULL,NULL,NULL,NULL,'192.168.11.7',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','7 GB','VMware Virtual Platf','0',NULL,'1b916aba-34be-11e7-8a9b-784f4370c65f',0),(8,'zw-web-pro-8','VMware-564dd9ff4ebe78a1-6a268732148bc18',NULL,NULL,NULL,NULL,'192.168.11.8',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','8 GB','VMware Virtual Platf',NULL,NULL,'1b9198c0-34be-11e7-b340-784f4370c65f',0),(9,'zw-web-pro-9','VMware-564dd9ff4ebe78a1-6a268732148bc19',NULL,NULL,NULL,NULL,'192.168.11.9',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','9 GB','VMware Virtual Platf',NULL,NULL,'1b91c85c-34be-11e7-ae3a-784f4370c65f',0),(10,'zw-web-pro-10','VMware-564dd9ff4ebe78a1-6a268732148bc110',NULL,NULL,NULL,NULL,'192.168.11.10',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','10 GB','VMware Virtual Platf','故障',NULL,'1b91f28c-34be-11e7-bcc4-784f4370c65f',0),(11,'zw-web-pro-11','VMware-564dd9ff4ebe78a1-6a268732148bc111',NULL,NULL,NULL,NULL,'192.168.11.11',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','11 GB','VMware Virtual Platf',NULL,NULL,'1b921c00-34be-11e7-ab32-784f4370c65f',0),(12,'zw-web-pro-12','VMware-564dd9ff4ebe78a1-6a268732148bc112',NULL,NULL,NULL,NULL,'192.168.11.12',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','12 GB','VMware Virtual Platf','报废',NULL,'1b9245a3-34be-11e7-9ae1-784f4370c65f',0),(13,'zw-web-pro-13','VMware-564dd9ff4ebe78a1-6a268732148bc113',NULL,NULL,NULL,NULL,'192.168.11.13',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','13 GB','VMware Virtual Platf','维修',NULL,'1b926f4a-34be-11e7-a355-784f4370c65f',0),(14,'zw-web-pro-14','VMware-564dd9ff4ebe78a1-6a268732148bc114',NULL,NULL,NULL,NULL,'192.168.11.14',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','14 GB','VMware Virtual Platf',NULL,NULL,'1b929e63-34be-11e7-91f1-784f4370c65f',0),(15,'zw-web-pro-15','VMware-564dd9ff4ebe78a1-6a268732148bc115',NULL,NULL,NULL,NULL,'192.168.11.15',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','15 GB','VMware Virtual Platf','线下',NULL,'1b92cea1-34be-11e7-98ef-784f4370c65f',0),(16,'zw-web-pro-16','VMware-564dd9ff4ebe78a1-6a268732148bc116',NULL,NULL,NULL,NULL,'192.168.11.16',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','16 GB','VMware Virtual Platf',NULL,NULL,'1b92fa26-34be-11e7-beab-784f4370c65f',0),(17,'zw-web-pro-17','VMware-564dd9ff4ebe78a1-6a268732148bc117',NULL,NULL,NULL,NULL,'192.168.11.17',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','17 GB','VMware Virtual Platf','故障',NULL,'1b9325f8-34be-11e7-9573-784f4370c65f',0),(18,'zw-web-pro-18','VMware-564dd9ff4ebe78a1-6a268732148bc118',NULL,NULL,NULL,NULL,'192.168.11.18',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','18 GB','VMware Virtual Platf','报废',NULL,'1b93521e-34be-11e7-be9e-784f4370c65f',0),(19,'zw-web-pro-19','VMware-564dd9ff4ebe78a1-6a268732148bc119',NULL,NULL,NULL,NULL,'192.168.11.19',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','19 GB','VMware Virtual Platf','故障',NULL,'1b937cee-34be-11e7-be3e-784f4370c65f',0),(20,'yz-nginx-pro-1','VMware-564dd9ff4ebe78a1-6a268732148bc11',NULL,NULL,NULL,NULL,'192.168.11.1',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','1 GB','VMware Virtual Platf',NULL,NULL,'2b51201e-34be-11e7-98bb-784f4370c65f',0),(21,'yz-nginx-pro-2','VMware-564dd9ff4ebe78a1-6a268732148bc12',NULL,NULL,NULL,NULL,'192.168.11.2',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','2 GB','VMware Virtual Platf',NULL,NULL,'2b522017-34be-11e7-baca-784f4370c65f',0),(22,'yz-nginx-pro-3','VMware-564dd9ff4ebe78a1-6a268732148bc13',NULL,NULL,NULL,NULL,'192.168.11.3',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','3 GB','VMware Virtual Platf',NULL,NULL,'2b526211-34be-11e7-b444-784f4370c65f',0),(23,'yz-nginx-pro-4','VMware-564dd9ff4ebe78a1-6a268732148bc14',NULL,NULL,NULL,NULL,'192.168.11.4',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','4 GB','VMware Virtual Platf',NULL,NULL,'2b529c9e-34be-11e7-9b22-784f4370c65f',0),(24,'yz-nginx-pro-5','VMware-564dd9ff4ebe78a1-6a268732148bc15',NULL,NULL,NULL,NULL,'192.168.11.5',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','5 GB','VMware Virtual Platf',NULL,NULL,'2b52db51-34be-11e7-b075-784f4370c65f',0),(25,'yz-nginx-pro-6','VMware-564dd9ff4ebe78a1-6a268732148bc16',NULL,NULL,NULL,NULL,'192.168.11.6',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','6 GB','VMware Virtual Platf',NULL,NULL,'2b532382-34be-11e7-a049-784f4370c65f',0),(26,'yz-nginx-pro-7','VMware-564dd9ff4ebe78a1-6a268732148bc17',NULL,NULL,NULL,NULL,'192.168.11.7',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','7 GB','VMware Virtual Platf',NULL,NULL,'2b5359eb-34be-11e7-9b73-784f4370c65f',0),(27,'yz-nginx-pro-8','VMware-564dd9ff4ebe78a1-6a268732148bc18',NULL,NULL,NULL,NULL,'192.168.11.8',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','8 GB','VMware Virtual Platf',NULL,NULL,'2b538c78-34be-11e7-b3d8-784f4370c65f',0),(28,'yz-nginx-pro-9','VMware-564dd9ff4ebe78a1-6a268732148bc19',NULL,NULL,NULL,NULL,'192.168.11.9',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','9 GB','VMware Virtual Platf',NULL,NULL,'2b53bcde-34be-11e7-ac66-784f4370c65f',0),(29,'yz-nginx-pro-10','VMware-564dd9ff4ebe78a1-6a268732148bc110',NULL,NULL,NULL,NULL,'192.168.11.10',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','10 GB','VMware Virtual Platf',NULL,NULL,'2b53ea6b-34be-11e7-8909-784f4370c65f',0),(30,'yz-nginx-pro-11','VMware-564dd9ff4ebe78a1-6a268732148bc111',NULL,NULL,NULL,NULL,'192.168.11.11',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','11 GB','VMware Virtual Platf','故障',NULL,'2b5417ba-34be-11e7-9179-784f4370c65f',0),(31,'yz-nginx-pro-12','VMware-564dd9ff4ebe78a1-6a268732148bc112',NULL,NULL,NULL,NULL,'192.168.11.12',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','12 GB','VMware Virtual Platf',NULL,NULL,'2b5445fa-34be-11e7-a6cf-784f4370c65f',0),(32,'yz-nginx-pro-13','VMware-564dd9ff4ebe78a1-6a268732148bc113',NULL,NULL,NULL,NULL,'192.168.11.13',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','13 GB','VMware Virtual Platf',NULL,NULL,'2b54f05e-34be-11e7-9b01-784f4370c65f',0),(33,'yz-nginx-pro-14','VMware-564dd9ff4ebe78a1-6a268732148bc114',NULL,NULL,NULL,NULL,'192.168.11.14',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','14 GB','VMware Virtual Platf',NULL,NULL,'2b552f2e-34be-11e7-8939-784f4370c65f',0),(34,'yz-nginx-pro-15','VMware-564dd9ff4ebe78a1-6a268732148bc115',NULL,NULL,NULL,NULL,'192.168.11.15',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','15 GB','VMware Virtual Platf',NULL,NULL,'2b556370-34be-11e7-8243-784f4370c65f',0),(35,'yz-nginx-pro-16','VMware-564dd9ff4ebe78a1-6a268732148bc116',NULL,NULL,NULL,NULL,'192.168.11.16',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','16 GB','VMware Virtual Platf',NULL,NULL,'2b559585-34be-11e7-abf7-784f4370c65f',0),(36,'yz-nginx-pro-17','VMware-564dd9ff4ebe78a1-6a268732148bc117',NULL,NULL,NULL,NULL,'192.168.11.17',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','17 GB','VMware Virtual Platf',NULL,NULL,'2b55c8b3-34be-11e7-885b-784f4370c65f',0),(37,'yz-nginx-pro-18','VMware-564dd9ff4ebe78a1-6a268732148bc118',NULL,NULL,NULL,NULL,'192.168.11.18',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','18 GB','VMware Virtual Platf',NULL,NULL,'2b55ffe3-34be-11e7-99eb-784f4370c65f',0),(38,'yz-nginx-pro-19','VMware-564dd9ff4ebe78a1-6a268732148bc119',NULL,NULL,NULL,NULL,'192.168.11.19',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','19 GB','VMware Virtual Platf',NULL,NULL,'2b5637de-34be-11e7-bb68-784f4370c65f',0),(39,'yz-app-pro-1','VMware-564dd9ff4ebe78a1-6a268732148bc11',NULL,NULL,NULL,NULL,'192.168.11.1',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','1 GB','VMware Virtual Platf',NULL,NULL,'325bd528-34be-11e7-b13c-784f4370c65f',0),(40,'yz-app-pro-2','VMware-564dd9ff4ebe78a1-6a268732148bc12',NULL,NULL,NULL,NULL,'192.168.11.2',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','2 GB','VMware Virtual Platf','报废',NULL,'325cddd1-34be-11e7-a622-784f4370c65f',0),(41,'yz-app-pro-3','VMware-564dd9ff4ebe78a1-6a268732148bc13',NULL,NULL,NULL,NULL,'192.168.11.3',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','3 GB','VMware Virtual Platf',NULL,NULL,'325d2e5c-34be-11e7-b464-784f4370c65f',0),(42,'yz-app-pro-4','VMware-564dd9ff4ebe78a1-6a268732148bc14',NULL,NULL,NULL,NULL,'192.168.11.4',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','4 GB','VMware Virtual Platf',NULL,NULL,'325d67fa-34be-11e7-83bd-784f4370c65f',0),(43,'yz-app-pro-5','VMware-564dd9ff4ebe78a1-6a268732148bc15',NULL,NULL,NULL,NULL,'192.168.11.5',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','5 GB','VMware Virtual Platf',NULL,NULL,'325da628-34be-11e7-a505-784f4370c65f',0),(44,'yz-app-pro-6','VMware-564dd9ff4ebe78a1-6a268732148bc16',NULL,NULL,NULL,NULL,'192.168.11.6',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','6 GB','VMware Virtual Platf',NULL,NULL,'325de89c-34be-11e7-8cf8-784f4370c65f',0),(45,'yz-app-pro-7','VMware-564dd9ff4ebe78a1-6a268732148bc17',NULL,NULL,NULL,NULL,'192.168.11.7',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','7 GB','VMware Virtual Platf',NULL,NULL,'325e1e6e-34be-11e7-9339-784f4370c65f',0),(46,'yz-app-pro-8','VMware-564dd9ff4ebe78a1-6a268732148bc18',NULL,NULL,NULL,NULL,'192.168.11.8',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','8 GB','VMware Virtual Platf',NULL,NULL,'325e5002-34be-11e7-81da-784f4370c65f',0),(47,'yz-app-pro-9','VMware-564dd9ff4ebe78a1-6a268732148bc19',NULL,NULL,NULL,NULL,'192.168.11.9',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','9 GB','VMware Virtual Platf',NULL,NULL,'325e82f0-34be-11e7-84a5-784f4370c65f',0),(48,'yz-app-pro-10','VMware-564dd9ff4ebe78a1-6a268732148bc110',NULL,NULL,NULL,NULL,'192.168.11.10',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','10 GB','VMware Virtual Platf',NULL,NULL,'325eb1f0-34be-11e7-b68d-784f4370c65f',0),(49,'yz-app-pro-11','VMware-564dd9ff4ebe78a1-6a268732148bc111',NULL,NULL,NULL,NULL,'192.168.11.11',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','11 GB','VMware Virtual Platf',NULL,NULL,'325edf73-34be-11e7-a0bd-784f4370c65f',0),(50,'yz-app-pro-12','VMware-564dd9ff4ebe78a1-6a268732148bc112',NULL,NULL,NULL,NULL,'192.168.11.12',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','12 GB','VMware Virtual Platf',NULL,NULL,'325f0db3-34be-11e7-9dfc-784f4370c65f',0),(51,'yz-app-pro-13','VMware-564dd9ff4ebe78a1-6a268732148bc113',NULL,NULL,NULL,NULL,'192.168.11.13',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','13 GB','VMware Virtual Platf',NULL,NULL,'325f3c05-34be-11e7-84d2-784f4370c65f',0),(52,'yz-app-pro-14','VMware-564dd9ff4ebe78a1-6a268732148bc114',NULL,NULL,NULL,NULL,'192.168.11.14',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','14 GB','VMware Virtual Platf',NULL,NULL,'325f68e6-34be-11e7-934e-784f4370c65f',0),(53,'yz-app-pro-15','VMware-564dd9ff4ebe78a1-6a268732148bc115',NULL,NULL,NULL,NULL,'192.168.11.15',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','15 GB','VMware Virtual Platf',NULL,NULL,'325f9480-34be-11e7-b09f-784f4370c65f',0),(54,'yz-app-pro-16','VMware-564dd9ff4ebe78a1-6a268732148bc116',NULL,NULL,NULL,NULL,'192.168.11.16',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','16 GB','VMware Virtual Platf',NULL,NULL,'325fc12e-34be-11e7-960f-784f4370c65f',0),(55,'yz-app-pro-17','VMware-564dd9ff4ebe78a1-6a268732148bc117',NULL,NULL,NULL,NULL,'192.168.11.17',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','17 GB','VMware Virtual Platf',NULL,NULL,'325fee30-34be-11e7-b48d-784f4370c65f',0),(56,'yz-app-pro-18','VMware-564dd9ff4ebe78a1-6a268732148bc118',NULL,NULL,NULL,NULL,'192.168.11.18',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','18 GB','VMware Virtual Platf',NULL,NULL,'326019f0-34be-11e7-8a08-784f4370c65f',0),(57,'yz-app-pro-19','VMware-564dd9ff4ebe78a1-6a268732148bc119',NULL,NULL,NULL,NULL,'192.168.11.19',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','19 GB','VMware Virtual Platf',NULL,NULL,'32604523-34be-11e7-a192-784f4370c65f',0),(58,'cn-app-pro-1','VMware-564dd9ff4ebe78a1-6a268732148bc11',NULL,NULL,NULL,NULL,'172.16.11.1',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','1 GB','VMware Virtual Platf','故障',NULL,'d73f7561-34c6-11e7-ab30-784f4370c65f',0),(59,'cn-app-pro-2','VMware-564dd9ff4ebe78a1-6a268732148bc12',NULL,NULL,NULL,NULL,'172.16.11.2',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','2 GB','VMware Virtual Platf',NULL,NULL,'d7408523-34c6-11e7-911f-784f4370c65f',0),(60,'cn-app-pro-3','VMware-564dd9ff4ebe78a1-6a268732148bc13',NULL,NULL,NULL,NULL,'172.16.11.3',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','3 GB','VMware Virtual Platf',NULL,NULL,'d740d7b8-34c6-11e7-880c-784f4370c65f',0),(61,'cn-app-pro-4','VMware-564dd9ff4ebe78a1-6a268732148bc14',NULL,NULL,NULL,NULL,'172.16.11.4',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','4 GB','VMware Virtual Platf',NULL,NULL,'d741120a-34c6-11e7-897f-784f4370c65f',0),(62,'cn-app-pro-5','VMware-564dd9ff4ebe78a1-6a268732148bc15',NULL,NULL,NULL,NULL,'172.16.11.5',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','5 GB','VMware Virtual Platf',NULL,NULL,'d7415a3a-34c6-11e7-88dd-784f4370c65f',0),(63,'cn-app-pro-6','VMware-564dd9ff4ebe78a1-6a268732148bc16',NULL,NULL,NULL,NULL,'172.16.11.6',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','6 GB','VMware Virtual Platf',NULL,NULL,'d74195eb-34c6-11e7-8423-784f4370c65f',0),(64,'cn-app-pro-7','VMware-564dd9ff4ebe78a1-6a268732148bc17',NULL,NULL,NULL,NULL,'172.16.11.7',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','7 GB','VMware Virtual Platf',NULL,NULL,'d741ca23-34c6-11e7-a81c-784f4370c65f',0),(65,'cn-app-pro-8','VMware-564dd9ff4ebe78a1-6a268732148bc18',NULL,NULL,NULL,NULL,'172.16.11.8',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','8 GB','VMware Virtual Platf','线下',NULL,'d741fa8a-34c6-11e7-88f5-784f4370c65f',0),(66,'cn-app-pro-9','VMware-564dd9ff4ebe78a1-6a268732148bc19',NULL,NULL,NULL,NULL,'172.16.11.9',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','9 GB','VMware Virtual Platf',NULL,NULL,'d742285c-34c6-11e7-9ea6-784f4370c65f',0),(67,'cn-app-pro-10','VMware-564dd9ff4ebe78a1-6a268732148bc110',NULL,NULL,NULL,NULL,'172.16.11.10',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','10 GB','VMware Virtual Platf',NULL,NULL,'d742624a-34c6-11e7-bdff-784f4370c65f',0),(68,'cn-app-pro-11','VMware-564dd9ff4ebe78a1-6a268732148bc111',NULL,NULL,NULL,NULL,'172.16.11.11',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','11 GB','VMware Virtual Platf',NULL,NULL,'d7429363-34c6-11e7-a066-784f4370c65f',0),(69,'cn-app-pro-12','VMware-564dd9ff4ebe78a1-6a268732148bc112',NULL,NULL,NULL,NULL,'172.16.11.12',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','12 GB','VMware Virtual Platf',NULL,NULL,'d742c0c7-34c6-11e7-aa97-784f4370c65f',0),(70,'cn-app-pro-13','VMware-564dd9ff4ebe78a1-6a268732148bc113',NULL,NULL,NULL,NULL,'172.16.11.13',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','13 GB','VMware Virtual Platf',NULL,NULL,'d742f1f5-34c6-11e7-85bd-784f4370c65f',0),(71,'cn-app-pro-14','VMware-564dd9ff4ebe78a1-6a268732148bc114',NULL,NULL,NULL,NULL,'172.16.11.14',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','14 GB','VMware Virtual Platf',NULL,NULL,'d7431e9c-34c6-11e7-bcee-784f4370c65f',0),(72,'cn-app-pro-15','VMware-564dd9ff4ebe78a1-6a268732148bc115',NULL,NULL,NULL,NULL,'172.16.11.15',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','15 GB','VMware Virtual Platf',NULL,NULL,'d743499e-34c6-11e7-bba2-784f4370c65f',0),(73,'cn-app-pro-16','VMware-564dd9ff4ebe78a1-6a268732148bc116',NULL,NULL,NULL,NULL,'172.16.11.16',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','16 GB','VMware Virtual Platf',NULL,NULL,'d7437368-34c6-11e7-a11e-784f4370c65f',0),(74,'cn-app-pro-17','VMware-564dd9ff4ebe78a1-6a268732148bc117',NULL,NULL,NULL,NULL,'172.16.11.17',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','17 GB','VMware Virtual Platf',NULL,NULL,'d7439c6e-34c6-11e7-b5ce-784f4370c65f',0),(75,'cn-app-pro-18','VMware-564dd9ff4ebe78a1-6a268732148bc118',NULL,NULL,NULL,NULL,'172.16.11.18',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','18 GB','VMware Virtual Platf',NULL,NULL,'d743c799-34c6-11e7-99af-784f4370c65f',0),(76,'cn-app-pro-19','VMware-564dd9ff4ebe78a1-6a268732148bc119',NULL,NULL,NULL,NULL,'172.16.11.19',NULL,'2015-07-02','VMware, Inc.','CentOS Linux 7.3.1611 Core','Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz 2','20','19 GB','VMware Virtual Platf','维修',NULL,'d743f2e1-34c6-11e7-9563-784f4370c65f',0);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (4,'报废'),(2,'故障'),(1,'线上'),(3,'线下'),(5,'维修'),(6,'维护');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
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
INSERT INTO `user_profile` VALUES (1,NULL,'CEO','小明',2,1),(2,'88561','jj','王五',2,2),(3,'111222',NULL,'张三',2,3),(4,NULL,NULL,'李四',2,4);
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

-- Dump completed on 2017-06-03 18:30:56

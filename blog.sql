-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: chuyantest
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `text` longtext NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Article_user_id_0fa7fd51_fk_User_id` (`user_id`),
  CONSTRAINT `Article_user_id_0fa7fd51_fk_User_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'北洋军阀统治的飘摇岁月 ',' 1924年第二次直奉大战后，以张作霖为首的奉系军阀取得胜利，取得了北京政府控制权。1928年，张作霖被南方国民党军队战败，仓皇逃回东北，途中在沈阳皇姑屯被炸身亡。奉系军阀统治至此结束，前后也是4年。\r\n\r\n北洋统治时期，南方特别是西南一带还同时存在着孙中山领导的国民党政权和一些地方军阀，所以北洋军阀实际上未能统一中国。北洋政府总统也不是完全由北洋军阀内部人士担任，但实质上都是北洋军阀的工具。','2023-04-11 15:28:11.155867',1),(2,'北洋军阀统治的飘摇岁月 ',' 1924年第二次直奉大战后，以张作霖为首的奉系军阀取得胜利，取得了北京政府控制权。1928年，张作霖被南方国民党军队战败，仓皇逃回东北，途中在沈阳皇姑屯被炸身亡。奉系军阀统治至此结束，前后也是4年。\r\n\r\n北洋统治时期，南方特别是西南一带还同时存在着孙中山领导的国民党政权和一些地方军阀，所以北洋军阀实际上未能统一中国。北洋政府总统也不是完全由北洋军阀内部人士担任，但实质上都是北洋军阀的工具。','2023-04-11 15:32:06.697320',1),(3,'摆烂',' 破罐子破摔，只会让自己越来越差劲\r\n最近，“摆烂”这个网络词汇，在年轻人的圈子里，流行了起来。\r\n\r\n“摆烂”一词，原用于形容NBA篮球联赛中，为了获得更好的选秀权，而故意输球的行为。\r\n\r\n但现在，更多用来形容年轻人们消极的生活态度。\r\n\r\n觉得生活不如意，于是破罐子破摔。\r\n\r\n觉得身边的人好像都没有那么努力，都很差劲，于是自己也变成了差劲的一个人。\r\n\r\n觉得自己的努力没有收到显著的收获，于是便不再努力。\r\n\r\n这样的生活态度，一个字：“烂”。\r\n\r\n你认为你的努力没有用，你认为你的投产比很低，那你就开始活在自己的舒适圈。平时刷刷剧，玩会手机，一个月拿着四五千的工资，除了吃就是玩。\r\n\r\n你摸着你的心问问，这真的是你小时候期待的人生吗？\r\n\r\n我一直相信一句话：“上天自有安排。”\r\n\r\n或许，你的努力还没被看到，但至少不要轻易摆烂。\r\n\r\n毕竟，我们要成为越来越好的自己，而不是让自己变得越来越差劲。','2023-04-11 15:49:32.286811',1),(4,'“躺平”是个啥，外国人都知道了？',' 最近，“躺平”成为了网上最火的网络热词。\r\n\r\n网上查了一下，就是不管对方对你做什么事情，采取什么样的态度，你都不做任何的反应或者反抗，表示顺从，内心毫无波澜。\r\n\r\n通过我的观察，“躺平文化”的诞生跟另外两个概念息息相关：“内卷”和“割韭菜”。\r\n\r\n“内卷”指的就是大家疲于竞争，不断内耗，精疲力竭，最后啥都没得到。\r\n\r\n“割韭菜”是个老词儿了，大概就是说你的时间、精力、体力、金钱、甚至智力不断被权力方收割。\r\n\r\n那么“躺平”的核心逻辑就是，只要我躺平，内卷就卷不到我，镰刀就割不到我。','2023-04-11 16:42:38.497179',1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add article',7,'add_article'),(26,'Can change article',7,'change_article'),(27,'Can delete article',7,'delete_article'),(28,'Can view article',7,'view_article'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add tags',9,'add_tags'),(34,'Can change tags',9,'change_tags'),(35,'Can delete tags',9,'delete_tags'),(36,'Can view tags',9,'view_tags'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add user_ tags',11,'add_user_tags'),(42,'Can change user_ tags',11,'change_user_tags'),(43,'Can delete user_ tags',11,'delete_user_tags'),(44,'Can view user_ tags',11,'view_user_tags'),(45,'Can add author profile',12,'add_authorprofile'),(46,'Can change author profile',12,'change_authorprofile'),(47,'Can delete author profile',12,'delete_authorprofile'),(48,'Can view author profile',12,'view_authorprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$GWwWuF7lBKrrJ4J02zhcme$GJ+3xxOGcGie/dZof8qiOWL3ch7DUTu5OCZ3/kxnYRk=','2023-04-11 18:33:18.059432',0,'yimi','','','',0,1,'2023-04-11 15:27:07.207226');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','article'),(8,'main','author'),(12,'main','authorprofile'),(9,'main','tags'),(10,'main','user'),(11,'main','user_tags'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-11 15:25:34.000555'),(2,'auth','0001_initial','2023-04-11 15:25:34.279112'),(3,'admin','0001_initial','2023-04-11 15:25:34.370912'),(4,'admin','0002_logentry_remove_auto_add','2023-04-11 15:25:34.380886'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-11 15:25:34.391857'),(6,'contenttypes','0002_remove_content_type_name','2023-04-11 15:25:34.487526'),(7,'auth','0002_alter_permission_name_max_length','2023-04-11 15:25:34.551350'),(8,'auth','0003_alter_user_email_max_length','2023-04-11 15:25:34.574782'),(9,'auth','0004_alter_user_username_opts','2023-04-11 15:25:34.582761'),(10,'auth','0005_alter_user_last_login_null','2023-04-11 15:25:34.620993'),(11,'auth','0006_require_contenttypes_0002','2023-04-11 15:25:34.624012'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-11 15:25:34.634328'),(13,'auth','0008_alter_user_username_max_length','2023-04-11 15:25:34.673197'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-11 15:25:34.714298'),(15,'auth','0010_alter_group_name_max_length','2023-04-11 15:25:34.733245'),(16,'auth','0011_update_proxy_permissions','2023-04-11 15:25:34.742221'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-11 15:25:34.779613'),(18,'main','0001_initial','2023-04-11 15:25:35.202212'),(19,'sessions','0001_initial','2023-04-11 15:25:35.220729');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_author`
--

DROP TABLE IF EXISTS `main_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_author` (
  `id` char(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `age` int NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `personal_page` varchar(200) DEFAULT NULL,
  `intro` longtext,
  `remark` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`),
  KEY `main_author_email_a0b1f2db` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_author`
--

LOCK TABLES `main_author` WRITE;
/*!40000 ALTER TABLE `main_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_authorprofile`
--

DROP TABLE IF EXISTS `main_authorprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_authorprofile` (
  `id` char(32) NOT NULL,
  `fans_count` int NOT NULL,
  `visited_count` int NOT NULL,
  `words_count` int NOT NULL,
  `article_count` int NOT NULL,
  `collected_count` int NOT NULL,
  `admired_count` int NOT NULL,
  `author_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_id` (`author_id`),
  CONSTRAINT `main_authorprofile_author_id_244e6966_fk_main_author_id` FOREIGN KEY (`author_id`) REFERENCES `main_author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_authorprofile`
--

LOCK TABLES `main_authorprofile` WRITE;
/*!40000 ALTER TABLE `main_authorprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_authorprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tag` varchar(10) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'政权',0),(2,'完全',0),(3,'人士',0),(4,'战败',0),(5,'军队',0),(6,'仓皇',0),(7,'地方',0),(8,'军阀',0),(9,'总统',0),(10,'实质',0),(11,'年轻人',0),(12,'努力',0),(13,'形容',0),(14,'消极',0),(15,'年轻',0),(16,'人们',0),(17,'选秀权',0),(18,'玩会',0),(19,'小时候',0),(20,'输球',0),(21,'躺平',0),(22,'金钱',0),(23,'精力',0),(24,'体力',0),(25,'网络',0),(26,'热词',0),(27,'最火',0),(28,'智力',0),(29,'逻辑',0),(30,'核心',0);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yimi');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tags`
--

DROP TABLE IF EXISTS `user_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tags`
--

LOCK TABLES `user_tags` WRITE;
/*!40000 ALTER TABLE `user_tags` DISABLE KEYS */;
INSERT INTO `user_tags` VALUES (1,'政权'),(2,'完全'),(3,'人士'),(4,'战败'),(5,'军队'),(6,'仓皇'),(7,'地方'),(8,'军阀'),(9,'总统'),(10,'实质'),(11,'年轻人'),(12,'努力'),(13,'形容'),(14,'消极'),(15,'年轻'),(16,'人们'),(17,'选秀权'),(18,'玩会'),(19,'小时候'),(20,'输球'),(21,'躺平'),(22,'金钱'),(23,'精力'),(24,'体力'),(25,'网络'),(26,'热词'),(27,'最火'),(28,'智力'),(29,'逻辑'),(30,'核心');
/*!40000 ALTER TABLE `user_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tags_text`
--

DROP TABLE IF EXISTS `user_tags_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tags_text` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_tags_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_Tags_text_user_tags_id_article_id_90b65d01_uniq` (`user_tags_id`,`article_id`),
  KEY `User_Tags_text_article_id_6407a58b_fk_Article_id` (`article_id`),
  CONSTRAINT `User_Tags_text_article_id_6407a58b_fk_Article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `User_Tags_text_user_tags_id_4aaaa19a_fk_User_Tags_id` FOREIGN KEY (`user_tags_id`) REFERENCES `user_tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tags_text`
--

LOCK TABLES `user_tags_text` WRITE;
/*!40000 ALTER TABLE `user_tags_text` DISABLE KEYS */;
INSERT INTO `user_tags_text` VALUES (1,21,4),(2,22,4),(3,23,4),(4,24,4),(5,25,4),(6,26,4),(7,27,4),(8,28,4),(9,29,4),(10,30,4);
/*!40000 ALTER TABLE `user_tags_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tags_user`
--

DROP TABLE IF EXISTS `user_tags_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tags_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_tags_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_Tags_user_user_tags_id_user_id_e8180f76_uniq` (`user_tags_id`,`user_id`),
  KEY `User_Tags_user_user_id_d1e1e68b_fk_User_id` (`user_id`),
  CONSTRAINT `User_Tags_user_user_id_d1e1e68b_fk_User_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `User_Tags_user_user_tags_id_9592253c_fk_User_Tags_id` FOREIGN KEY (`user_tags_id`) REFERENCES `user_tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tags_user`
--

LOCK TABLES `user_tags_user` WRITE;
/*!40000 ALTER TABLE `user_tags_user` DISABLE KEYS */;
INSERT INTO `user_tags_user` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1);
/*!40000 ALTER TABLE `user_tags_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 20:15:16

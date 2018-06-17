-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: laprotectora
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Current Database: `laprotectora`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `laprotectora` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `laprotectora`;

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add categoria',1,'add_categoria'),(2,'Can change categoria',1,'change_categoria'),(3,'Can delete categoria',1,'delete_categoria'),(4,'Can add centro costo',2,'add_centrocosto'),(5,'Can change centro costo',2,'change_centrocosto'),(6,'Can delete centro costo',2,'delete_centrocosto'),(7,'Can add contabilidad',3,'add_contabilidad'),(8,'Can change contabilidad',3,'change_contabilidad'),(9,'Can delete contabilidad',3,'delete_contabilidad'),(10,'Can add contabilidad hijo',4,'add_contabilidadhijo'),(11,'Can change contabilidad hijo',4,'change_contabilidadhijo'),(12,'Can delete contabilidad hijo',4,'delete_contabilidadhijo'),(13,'Can add doc tipo',5,'add_doctipo'),(14,'Can change doc tipo',5,'change_doctipo'),(15,'Can delete doc tipo',5,'delete_doctipo'),(16,'Can add fondo detalle',6,'add_fondodetalle'),(17,'Can change fondo detalle',6,'change_fondodetalle'),(18,'Can delete fondo detalle',6,'delete_fondodetalle'),(19,'Can add gasto detalle',7,'add_gastodetalle'),(20,'Can change gasto detalle',7,'change_gastodetalle'),(21,'Can delete gasto detalle',7,'delete_gastodetalle'),(22,'Can add proveedor',8,'add_proveedor'),(23,'Can change proveedor',8,'change_proveedor'),(24,'Can delete proveedor',8,'delete_proveedor'),(25,'Can add rendicion',9,'add_rendicion'),(26,'Can change rendicion',9,'change_rendicion'),(27,'Can delete rendicion',9,'delete_rendicion'),(28,'Can add rendiciones fondos detalles',10,'add_rendicionesfondosdetalles'),(29,'Can change rendiciones fondos detalles',10,'change_rendicionesfondosdetalles'),(30,'Can delete rendiciones fondos detalles',10,'delete_rendicionesfondosdetalles'),(31,'Can add subcategoria',11,'add_subcategoria'),(32,'Can change subcategoria',11,'change_subcategoria'),(33,'Can delete subcategoria',11,'delete_subcategoria'),(34,'Can add subvencion',12,'add_subvencion'),(35,'Can change subvencion',12,'change_subvencion'),(36,'Can delete subvencion',12,'delete_subvencion'),(37,'Can add tipo fondo',13,'add_tipofondo'),(38,'Can change tipo fondo',13,'change_tipofondo'),(39,'Can delete tipo fondo',13,'delete_tipofondo'),(40,'Can add tipo forma pago',14,'add_tipoformapago'),(41,'Can change tipo forma pago',14,'change_tipoformapago'),(42,'Can delete tipo forma pago',14,'delete_tipoformapago'),(46,'Can add rendiciones gasto detalles',16,'add_rendicionesgastodetalles'),(47,'Can change rendiciones gasto detalles',16,'change_rendicionesgastodetalles'),(48,'Can delete rendiciones gasto detalles',16,'delete_rendicionesgastodetalles'),(49,'Can add users centro costos',17,'add_userscentrocostos'),(50,'Can change users centro costos',17,'change_userscentrocostos'),(51,'Can delete users centro costos',17,'delete_userscentrocostos'),(52,'Can add log entry',18,'add_logentry'),(53,'Can change log entry',18,'change_logentry'),(54,'Can delete log entry',18,'delete_logentry'),(55,'Can add permission',19,'add_permission'),(56,'Can change permission',19,'change_permission'),(57,'Can delete permission',19,'delete_permission'),(58,'Can add user',20,'add_user'),(59,'Can change user',20,'change_user'),(60,'Can delete user',20,'delete_user'),(61,'Can add group',21,'add_group'),(62,'Can change group',21,'change_group'),(63,'Can delete group',21,'delete_group'),(64,'Can add content type',22,'add_contenttype'),(65,'Can change content type',22,'change_contenttype'),(66,'Can delete content type',22,'delete_contenttype'),(67,'Can add session',23,'add_session'),(68,'Can change session',23,'change_session'),(69,'Can delete session',23,'delete_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$t0q0xlGJPSTZ$oy9T/NHG2xMMiN3Y4esuynvOABZ4W/lNa4LAFWCHBKs=','2017-10-10 07:26:13',1,'admin','Administrador','','ivancarrascoq@gmail.com',1,1,'2017-01-23 08:21:53'),(2,'pbkdf2_sha256$30000$3B5hr8JDdz20$j81mDQh+Iivlpr8suF8kaFzkC07tWyqSqaaSBNnFbAY=','2017-10-10 07:24:23',0,'supervisor','super_first_name','super_last_name','supervisor@laprotectora.cl',0,1,'2017-01-24 19:51:35'),(3,'pbkdf2_sha256$30000$ld1dluwbVdLp$xzUW/xEYtk+JGZ12FZFbnxgDNaVPCznP/20++jAO/aQ=','2017-05-25 05:37:20',0,'nromanini@protectora.cl','','','',0,1,'2017-05-25 05:32:36'),(4,'pbkdf2_sha256$30000$dum1LiYUMucr$0jF0JyYUpoUMrUn73SSccK2OD/kaW0EunTtfBWmC3p0=','2017-05-25 05:38:25',0,'domingo@protectora.cl','','','',0,1,'2017-05-25 05:33:13'),(5,'pbkdf2_sha256$30000$W3DfbeNCjRfa$NPoiUziwOBXdZT6xV98R4v6FvcR5dS7459K/yNhH8Jk=','2017-07-07 15:52:18',0,'ivancarrascoq@gmail.com','','','',0,1,'2017-05-25 05:33:25'),(6,'pbkdf2_sha256$30000$K4X25yRCIo4q$XmEiz92SjYbPLTX8DukAqerzmXxov8bSulNIGkxspKM=','2017-07-22 01:27:07',1,'admin@protectora.cl','protectora','','',0,1,'2017-05-25 05:57:50');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-01-24 19:51:35','2','supervisor',1,'[{\"added\": {}}]',20,1),(2,'2017-01-24 19:52:29','2','supervisor',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',20,1),(3,'2017-01-25 08:56:20','2','supervisor',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',20,1),(4,'2017-01-25 09:14:49','2','supervisor',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',20,1),(5,'2017-01-25 09:23:18','2','supervisor',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',20,1),(6,'2017-05-25 05:32:37','3','nromanini@protectora.cl',1,'[{\"added\": {}}]',20,1),(7,'2017-05-25 05:33:13','4','domingo@protectora.cl',1,'[{\"added\": {}}]',20,1),(8,'2017-05-25 05:33:25','5','ivancarrascoq@gmail.com',1,'[{\"added\": {}}]',20,1),(9,'2017-05-25 05:33:40','5','ivancarrascoq@gmail.com',2,'[]',20,1),(10,'2017-05-25 05:57:50','6','admin@protectora.cl',1,'[{\"added\": {}}]',20,1),(11,'2017-05-25 05:58:08','6','admin@protectora.cl',2,'[{\"changed\": {\"fields\": [\"first_name\", \"is_superuser\"]}}]',20,1),(12,'2017-05-25 05:59:01','6','admin@protectora.cl',2,'[]',20,1),(13,'2017-05-25 05:59:18','6','admin@protectora.cl',2,'[]',20,1),(14,'2017-05-25 06:01:02','6','admin@protectora.cl',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',20,1),(15,'2017-05-25 06:02:43','6','admin@protectora.cl',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',20,1),(16,'2017-05-25 06:02:48','6','admin@protectora.cl',2,'[]',20,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (18,'admin','logentry'),(21,'auth','group'),(19,'auth','permission'),(20,'auth','user'),(22,'contenttypes','contenttype'),(1,'main_app','categoria'),(2,'main_app','centrocosto'),(3,'main_app','contabilidad'),(4,'main_app','contabilidadhijo'),(5,'main_app','doctipo'),(6,'main_app','fondodetalle'),(7,'main_app','gastodetalle'),(8,'main_app','proveedor'),(9,'main_app','rendicion'),(10,'main_app','rendicionesfondosdetalles'),(16,'main_app','rendicionesgastodetalles'),(11,'main_app','subcategoria'),(12,'main_app','subvencion'),(13,'main_app','tipofondo'),(14,'main_app','tipoformapago'),(17,'main_app','userscentrocostos'),(23,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (22,'contenttypes','0001_initial','2017-01-26 12:24:50'),(23,'auth','0001_initial','2017-01-26 12:24:50'),(24,'admin','0001_initial','2017-01-26 12:24:50'),(25,'admin','0002_logentry_remove_auto_add','2017-01-26 12:24:50'),(26,'contenttypes','0002_remove_content_type_name','2017-01-26 12:24:50'),(27,'auth','0002_alter_permission_name_max_length','2017-01-26 12:24:50'),(28,'auth','0003_alter_user_email_max_length','2017-01-26 12:24:50'),(29,'auth','0004_alter_user_username_opts','2017-01-26 12:24:50'),(30,'auth','0005_alter_user_last_login_null','2017-01-26 12:24:50'),(31,'auth','0006_require_contenttypes_0002','2017-01-26 12:24:50'),(32,'auth','0007_alter_validators_add_error_messages','2017-01-26 12:24:50'),(33,'auth','0008_alter_user_username_max_length','2017-01-26 12:24:50'),(34,'sessions','0001_initial','2017-01-26 12:24:50'),(35,'main_app','0001_initial','2017-01-26 12:47:20'),(36,'main_app','0002_auto_20170126_1244','2017-01-26 12:47:20'),(37,'main_app','0003_auto_20170126_1245','2017-01-26 12:47:20'),(38,'main_app','0004_remove_rendicion_locked','2017-01-26 12:49:07'),(39,'main_app','0005_rendicion_locked','2017-01-26 12:49:51'),(40,'main_app','0006_rendicion_tipo_fondo','2017-02-07 11:27:55'),(41,'main_app','0007_remove_rendicion_tipo_fondo','2017-02-07 11:27:55'),(42,'main_app','0008_rendicion_tipo_fondo','2017-02-07 11:27:55');
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
INSERT INTO `django_session` VALUES ('0418e659wfzg2m9y8at3n6k8fvqa1icl','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-03-24 03:19:19'),('1670hafrjaowvmuzehl5ldv3kbhj994w','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-09 17:13:01'),('8po9jpgk3r6w0xazqvii8i7c60vwzrmx','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-07 00:55:35'),('cqck3n1rqj1qslrhjg5nn92o1w5lqclf','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-02-22 03:35:57'),('iugoyxl0cdb8557055e9fismlaaf09h4','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-09 06:02:12'),('izkited7wsl3sky8d64941i526ujucxp','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-03-13 02:04:09'),('ji64g0qmrpu3wftlsez0d8u5bqp8fhrb','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-04-19 07:13:08'),('kvsykeinknpwkdgbcu7fanlrdec09ljf','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-03-17 20:18:08'),('nqpd4da30jm2n1sb359diw753m4ex1se','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-02-09 14:42:52'),('pm15yl0mqrkaj12rc19aqxlq3m4lqm9p','ZTQ3MjExYTljZWZlZTkzYzNmODYxZDMxMWUwYTg3OGFjYjA5YjAxNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0OTBlMmEwNmY3ZmJlMjkzYjE0ZGY5ODhhNGU1MzE4YmRhNTA1MmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-10-24 07:26:13'),('r6f30mam8lmbnrfe6ceicjpb6423lswx','ZTQ3MjExYTljZWZlZTkzYzNmODYxZDMxMWUwYTg3OGFjYjA5YjAxNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0OTBlMmEwNmY3ZmJlMjkzYjE0ZGY5ODhhNGU1MzE4YmRhNTA1MmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-28 17:07:55'),('toxihnksy7sf9wknn87c9lm8xgp5uzfk','OTI5ZTUzY2UzMjRmYjk1OWEyZTczMTFhYzU4NDRkYzFjZmNjYWEzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNDQ5ODJlYjM4ZjYyNjdkZjk1ZjgyYjMxNTlhYjUzNWVjNWRhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-06-04 23:18:25'),('upth91c8qdslgb3a4uniw2u34lc3yvdl','YTk5ODg0MTVmMzc0N2IzNWYzYTJkMzg4Zjc1YzRhMzRjMjk1NTgzZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmZGZhOTljMzBjMzdiYTA1N2ViZmNkMjYyYmM5YWNhNjY0YTA1NjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-15 12:39:15');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_categoria`
--

DROP TABLE IF EXISTS `main_app_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `subvencion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_catego_subvencion_id_3a2ac5a1_fk_main_app_subvencion_id` (`subvencion_id`),
  CONSTRAINT `main_app_catego_subvencion_id_3a2ac5a1_fk_main_app_subvencion_id` FOREIGN KEY (`subvencion_id`) REFERENCES `main_app_subvencion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_categoria`
--

LOCK TABLES `main_app_categoria` WRITE;
/*!40000 ALTER TABLE `main_app_categoria` DISABLE KEYS */;
INSERT INTO `main_app_categoria` VALUES (1,'410500','ASESORIA TECNICA Y CAPACITACION',1),(2,'410600','GASTOS EN RECURSOS DE APRENDIZAJE',1),(3,'410700','GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',1),(4,'410800','GASTO BIENESTAR ALUMNOS',1),(5,'410900','GASTOS DE OPERACIÓN',1),(6,'411000','SERVICIOS BASICOS',1),(7,'411100','SERVICIOS GENERALES',1),(8,'411400','ARRIENDOS DE INMUEBLES',1),(9,'411500','ARRIENDO DE BIENES MUEBLES',1),(10,'411600','GASTOS EN CONSTRUCCION Y MANTENCION DE INFRAESTRUCTURA',1),(11,'411700','GASTOS MANTENCION Y REPARACION DE BIENES MUEBLES',1),(12,'411800','ADQUISICION DE BIENES MUEBLES E INMUEBLES',1),(13,'410500','ASESORIA TECNICA Y CAPACITACION',7),(14,'410900','GASTOS DE OPERACIÓN',7),(15,'411000','SERVICIOS BASICOS',7),(16,'411100','SERVICIOS GENERALES',7),(17,'411500','ARRIENDO DE BIENES MUEBLES',7),(18,'411600','GASTOS EN CONSTRUCCION Y MANTENCION DE INFRAESTRUCTURA',7),(19,'411700','GASTOS MANTENCION Y REPARACION DE BIENES MUEBLES',7),(20,'411800','ADQUISICION DE BIENES MUEBLES E INMUEBLES',7),(21,'410500','ASESORIA TECNICA Y CAPACITACION',2),(22,'410600','GASTOS EN RECURSOS DE APRENDIZAJE',2),(23,'410700','GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',2),(24,'410800','GASTO BIENESTAR ALUMNOS',2),(25,'410900','GASTOS DE OPERACIÓN',2),(26,'411000','SERVICIOS BASICOS',2),(27,'411100','SERVICIOS GENERALES',2),(28,'411400','ARRIENDOS DE INMUEBLES',2),(29,'411500','ARRIENDO DE BIENES MUEBLES',2),(30,'411800','ADQUISICION DE BIENES MUEBLES E INMUEBLES',2),(31,'410500','ASESORIA TECNICA Y CAPACITACION',8),(32,'410700','GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',8),(33,'410900','GASTOS DE OPERACIÓN',8),(34,'411000','SERVICIOS BASICOS',8),(35,'411500','ARRIENDO DE BIENES MUEBLES',8),(36,'411800','ADQUISICION DE BIENES MUEBLES E INMUEBLES',8),(37,'410500','ASESORIA TECNICA Y CAPACITACION',3),(38,'410600','GASTOS EN RECURSOS DE APRENDIZAJE',3),(39,'410700','GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',3),(40,'410800','GASTO BIENESTAR ALUMNOS',3),(41,'410900','GASTOS DE OPERACIÓN',3),(42,'411100','SERVICIOS GENERALES',3),(43,'411500','ARRIENDO DE BIENES MUEBLES',3),(44,'411600','GASTOS EN CONSTRUCCION Y MANTENCION DE INFRAESTRUCTURA',3),(45,'410600','GASTOS EN RECURSOS DE APRENDIZAJE',5),(46,'410700','GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',5),(47,'411500','ARRIENDO DE BIENES MUEBLES',5),(48,'411600','GASTOS EN CONSTRUCCION Y MANTENCION DE INFRAESTRUCTURA',5),(49,'411700','GASTOS MANTENCION Y REPARACION DE BIENES MUEBLES',5),(50,'410600','GASTOS EN RECURSOS DE APRENDIZAJE',4),(51,'410800','GASTO BIENESTAR ALUMNOS',4),(52,'410900','GASTOS DE OPERACIÓN',4),(53,'411100','SERVICIOS GENERALES',4),(55,'000000','-',9);
/*!40000 ALTER TABLE `main_app_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_centrocosto`
--

DROP TABLE IF EXISTS `main_app_centrocosto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_centrocosto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `rbd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_centrocosto`
--

LOCK TABLES `main_app_centrocosto` WRITE;
/*!40000 ALTER TABLE `main_app_centrocosto` DISABLE KEYS */;
INSERT INTO `main_app_centrocosto` VALUES (1,'Preescolar','10497'),(2,'Josefina Gana de Johnson (#5)','10497'),(3,'Miguel Cruchaga Tocornal (#10)','10502'),(4,'Luis García de la Huerta (#70)\r\n','2386'),(5,'Colegio Técnico\r\n','10507'),(6,'Colegio Industrial\r\n','10496'),(7,'Gerencia\r\n','AC');
/*!40000 ALTER TABLE `main_app_centrocosto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_contabilidad`
--

DROP TABLE IF EXISTS `main_app_contabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_contabilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_contabilidad`
--

LOCK TABLES `main_app_contabilidad` WRITE;
/*!40000 ALTER TABLE `main_app_contabilidad` DISABLE KEYS */;
INSERT INTO `main_app_contabilidad` VALUES (1,'Consumos básicos'),(2,'Materiales y útiles de aseo'),(3,'Gastos de mantención y reparación'),(4,'Alimentos'),(5,'Salud'),(6,'Higiene'),(7,'Tex. Vestuario y calzado'),(8,'Equipamiento'),(9,'Recreación y deportes'),(10,'Educación Material Escolar'),(11,'Movilización'),(12,'Talleres'),(13,'Pastoral'),(14,'Eventos'),(15,'Teléfono'),(16,'Correo y encomienda'),(17,'Gastos computacionales'),(18,'Materiales y útiles de oficina'),(19,'Servicios generales'),(20,'Gastos menores'),(21,'Servicios Externos'),(22,'Imprevistos'),(23,'Arriendos'),(24,'-');
/*!40000 ALTER TABLE `main_app_contabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_contabilidadhijo`
--

DROP TABLE IF EXISTS `main_app_contabilidadhijo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_contabilidadhijo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `contabilidad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_contabilidadhijo`
--

LOCK TABLES `main_app_contabilidadhijo` WRITE;
/*!40000 ALTER TABLE `main_app_contabilidadhijo` DISABLE KEYS */;
INSERT INTO `main_app_contabilidadhijo` VALUES (1,'Consumo de agua',1),(2,'Consumo de gas',1),(3,'Consumo de electricidad',1),(4,'Leña',1),(5,'Parafina',1),(6,'Materiales y útiles de aseo establecimiento',2),(7,'Materiales y útiles de aseo lavandería',2),(8,'Mantenciones menores',3),(9,'Alimentos',4),(10,'Consultas médicas',5),(11,'Tratamientos',5),(12,'Medicamentos',5),(13,'Exámenes',5),(14,'Botiquín',5),(15,'Higiene',6),(16,'Vestuario y calzado menores',7),(17,'Uniforme funcionarios',7),(18,'Equipamiento',8),(19,'Ropa blanca/Menaje',8),(20,'Deportes',9),(21,'Recreación',9),(22,'Vacaciones',9),(23,'Alimentación',10),(24,'Transporte escolar',10),(25,'Material didáctico',10),(26,'Fotocopias',10),(27,'Visitas pedagógicas',10),(28,'Libros de clases',10),(29,'Derecho a matriculas - pases escolares',10),(30,'Niño fuera de la localidad',10),(31,'Pasajes de micro y colectivos',11),(32,'Taxis',11),(33,'Cobro del kilometraje',11),(34,'Equipo (Autocuidado)',12),(35,'Niños y/o familia',12),(36,'Comunidad',12),(37,'Pastoral',13),(38,'Celebraciones',14),(39,'Teléfono',15),(40,'Celular',15),(41,'Tarjetas recargo',15),(42,'Correo',16),(43,'Encomiendas',16),(44,'Traslado activos muebles entre la institución',16),(45,'Suministros',17),(46,'Mantención equipos',17),(47,'Honorarios',17),(48,'Materiales',18),(49,'Fotocopias',18),(50,'Suscripciones',18),(51,'Internet',19),(52,'Servicios generales',19),(53,'Gastos menores',20),(54,'Servicios de alarmas',21),(55,'Imprevistos',22),(56,'Arriendos',23),(57,'-',24);
/*!40000 ALTER TABLE `main_app_contabilidadhijo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_doctipo`
--

DROP TABLE IF EXISTS `main_app_doctipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_doctipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_doctipo`
--

LOCK TABLES `main_app_doctipo` WRITE;
/*!40000 ALTER TABLE `main_app_doctipo` DISABLE KEYS */;
INSERT INTO `main_app_doctipo` VALUES (1,'BOL','BOLETA'),(2,'BOLE','BOLETA EXENTA'),(3,'BOLH','BOLETA HONORARIO'),(4,'BOLHEX','	BOLETA HONORARIO EXENTA'),(5,'FAC','FACTURA'),(6,'FACE','FACTURA EXENTA'),(7,'ODE','OTRO DOCUMENTO EXENTO'),(8,'LIQ','LIQUIDACION DE SUELDO'),(9,'COT','COTIZACION PREVISIONAL Y/O SALUD'),(10,'BOLEC','BOLETA ELECTRONICA'),(11,'BOLEX','BOLETA EXENTA  ELECTRONICA'),(12,'BOLHE','BOLETA HONORARIO  ELECTRONICA'),(13,'FACEL','FACTURA ELECTRONICA'),(14,'FACEX','FACTURA EXENTA ELECTRONICA'),(15,'ODA','OTRO DOCUMENTO AFECTO'),(16,'FIN','FINIQUITO'),(17,'BHTM','BOLETA DE HONORARIOS PRESTACION SERVICIOS TERCEROS'),(18,'BHTE','BOLETA DE HONORARIOS PRESTACION SERVICIOS TERCEROS ELECTRONICA'),(19,'NN','-');
/*!40000 ALTER TABLE `main_app_doctipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_fondodetalle`
--

DROP TABLE IF EXISTS `main_app_fondodetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_fondodetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cheque` varchar(100) DEFAULT NULL,
  `doc_no_cheque` varchar(100) DEFAULT NULL,
  `doc_no` varchar(100) DEFAULT NULL,
  `doc_fecha` datetime DEFAULT NULL,
  `doc_fecha_pago` datetime DEFAULT NULL,
  `doc_detalle` varchar(100) DEFAULT NULL,
  `proveedor_nombre` varchar(100) DEFAULT NULL,
  `proveedor_rut` varchar(100) DEFAULT NULL,
  `doc_monto` int(11) DEFAULT NULL,
  `gasto` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `contabilidad_id` int(11) DEFAULT NULL,
  `contabilidad_hijo_id` int(11) DEFAULT NULL,
  `doc_tipo_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_fondodet_categoria_id_f1a3e24c_fk_main_app_categoria_id` (`categoria_id`),
  KEY `main_app_fo_contabilidad_id_ad381d3e_fk_main_app_contabilidad_id` (`contabilidad_id`),
  KEY `ma_contabilidad_hijo_id_82e425e9_fk_main_app_contabilidadhijo_id` (`contabilidad_hijo_id`),
  KEY `main_app_fondodetall_doc_tipo_id_a7ddef3c_fk_main_app_doctipo_id` (`doc_tipo_id`),
  KEY `main_app_fondodet_proveedor_id_198dfa41_fk_main_app_proveedor_id` (`proveedor_id`),
  KEY `main_app_fo_subcategoria_id_dc7a9285_fk_main_app_subcategoria_id` (`subcategoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_fondodetalle`
--

LOCK TABLES `main_app_fondodetalle` WRITE;
/*!40000 ALTER TABLE `main_app_fondodetalle` DISABLE KEYS */;
INSERT INTO `main_app_fondodetalle` VALUES (1,'1','123','bol:32','2017-05-12 00:00:00','2017-05-13 00:00:00','pago cuenta luz a','Don Luchito','76100100-0',2000,0,30,1,4,1,1,147),(2,'0','','boleta: 990','2017-05-14 00:00:00','2017-05-15 00:00:00','bencina','Esvalito','79200200-8',3000,0,26,1,5,16,2,139);
/*!40000 ALTER TABLE `main_app_fondodetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_gastodetalle`
--

DROP TABLE IF EXISTS `main_app_gastodetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_gastodetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(100) DEFAULT NULL,
  `deposito_no` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `monto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_gastodetalle`
--

LOCK TABLES `main_app_gastodetalle` WRITE;
/*!40000 ALTER TABLE `main_app_gastodetalle` DISABLE KEYS */;
INSERT INTO `main_app_gastodetalle` VALUES (2,'devolucion','558','2017-04-07 00:00:00',124004),(14,'whispers','333','2017-01-01 00:00:00',1000),(52,'deposito en un solo cheque','752-154552-0001','2017-04-24 00:00:00',1000),(75,'asfasdasdasd','123123','2017-01-01 00:00:00',1100000),(79,'qwerty','','2017-01-01 00:00:00',105849),(86,'1.','10012','2017-01-01 00:00:00',50000),(93,'123','123-5841','2017-01-01 00:00:00',100000),(95,'devolución total','504-707-5641','2017-01-01 00:00:00',250000),(96,'1','1','2017-01-01 00:00:00',1000),(97,'devolución total','0-0000','2017-05-27 00:00:00',1000),(98,'2.','10013','2017-01-01 00:00:00',50000),(99,'1','1','2017-01-01 00:00:00',100000),(100,'1','1','2017-01-01 00:00:00',150000),(101,NULL,NULL,'2017-01-01 00:00:00',0),(102,NULL,NULL,'2017-01-01 00:00:00',0),(103,'devolución de $','1000-001','2017-07-10 00:00:00',1000),(104,'dev','555-7251-5','2017-01-01 00:00:00',20000);
/*!40000 ALTER TABLE `main_app_gastodetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_proveedor`
--

DROP TABLE IF EXISTS `main_app_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `rut` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=954 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_proveedor`
--

LOCK TABLES `main_app_proveedor` WRITE;
/*!40000 ALTER TABLE `main_app_proveedor` DISABLE KEYS */;
INSERT INTO `main_app_proveedor` VALUES (1,'Copec','70.100.200-8'),(2,'Lider','76.272.306-4'),(12,'Elba De Las Mercedes Arias Pino','6172079-0'),(13,'Marco Antonio Osorio Opazo','10017863-k'),(14,'Jacqueline Del Rosario Ortuzar Maulen','10021021-5'),(15,'Juan Vital Guerero Escobar','10029509-1'),(16,'Hiroo Menghraj Datwani','10098451-2'),(17,'Marta Aedo Vasquez','10147785-1'),(18,'Juan Francisco Parra Rojas','10185781-6'),(19,'Adan Benito Perez Riquelme','10193691-0'),(20,'Alvaro Rodrigo Padilla Lemus','10199650-6'),(21,'Ingrid Guajardo Gonzalez','10243411-0'),(22,'Elvira Aguirre Villablanca','10299073-0'),(23,'Manuel Benito Palma Astudillo','10316333-1'),(24,'Dario Alejandro Gaete Lizama','10342352-k'),(25,'Jose Roberto Rojas Lagos','10371056-1'),(26,'Claudio Silva Pavez','10396024-K'),(27,'Jorge Antonio Sazo Cea','10456332-5'),(28,'Jeannette Gonzalez Gonzalez','10464501-1'),(29,'Sandra Gilia Alcantara Leonicio','10474155-k'),(30,'Pablo Christian Pereira Mujica','10484580-0'),(31,'Patricia Alejandra Rojas Concha','10497306-k'),(32,'Rolando Olivares Collao','10525931-k'),(33,'Nidia Rosa Landeros Mariman','10544567-9'),(34,'Hernan Hale Aguilera Ravanal','10545837-1'),(35,'Richard Javier San Martin Vera','10552930-9'),(36,'Marcelo Antonio Llanos Neira','10555095-2'),(37,'Marcelo Astete Conejeros','10567069-9'),(38,'Yeremy Wilson Gallardo Infante','10569017-7'),(39,'Carolina Sofia Acuna Jimenez','10584633-9'),(40,'Marisol Soraya Hernandez Solis','10596355-6'),(41,'Freddy Marcel Quintana Peralta','10635655-6'),(42,'Maria Santiago Onostroza','10655063-8'),(43,'Rodrigo Villegas Cortez','10665634-7'),(44,'Verónica Del Pilar Correa Ramírez','10723985-5'),(45,'Cristian De La Fuente Bahamondes','10729946-7'),(46,'Luis  Lagos Bernal','10770884-7'),(47,'Carmen Cecilia Araneda Martinez','10792496-5'),(48,'Maria Del Carmen Jara Meza','10805776-9'),(49,'Ingrid Paola Muñoz Farfan','10888658-7'),(50,'Angela Jose Pugin Aguayo','10895098-6'),(51,'Juan Fidel Flores Lagos','10902848-7'),(52,'Isabel Margarita Vergara Correa','10991738-9'),(53,'Sandra Cecilia Morales Castillo','11075138-9'),(54,'Luis Ester Vera Diaz','11119600-1'),(55,'Hector Arriagada','11145850-2'),(56,'Veronica Elena Ortega Cerda','11164193-5'),(57,'Jasna Tapia Plaza','11220305-2'),(58,'Marcela Claudia Vergara Ortiz','11229311-6'),(59,'María Gabriela Andino Maldonado','11279560-k'),(60,'Bernardo Gamboa Navarro','11282022-1'),(61,'Luis Fabar Caro','11335988-9'),(62,'Jaime Andres Rojas Bustamante','11366642-0'),(63,'Maria Dolores Fuentes Maldonado','11366704-4'),(64,'Luis Eduardo Castro Alarcon','11398172-5'),(65,'Pedro Baeza Cortes','11484539-6'),(66,'Carmen Sofia Galvez Fuentes','11529477-6'),(67,'Eduardo Mauricio Muñoz Muñoz','11535589-9'),(68,'Julia Rojas Pinilla','11550217-4'),(69,'Luz Lillian Del Carmen Sepulveda Gonzalez','11556697-0'),(70,'Raul Antonio Zagal Sepulveda','11562526-8'),(71,'Leyla Jazmin Chaud Altermatt','11635828-K'),(72,'Jose Tomas Guzman Troncoso','11648639-3'),(73,'Alejandro Antonio Nuñez Espinoza','11658006-3'),(74,'Marcia Del Carmen Silva Celis','11673642-k'),(75,'Guillermo Iván Valenzuela Céspedes','11742261-5'),(76,'Claudia Correa Tejo','11754804-k'),(77,'Ana María Celis Zamorano','11759566-8'),(78,'Paola Sepulveda Barra','11834663-7'),(79,'Pamela Villarroel Mardones','11839016-4'),(80,'Ivonne Paola Navarro Bordones','11842635-5'),(81,'Marcos Antonio Zúñiga Olguín','12022676-2'),(82,'Ximena Gutierrez Campusano','12032858-1'),(83,'Elena Zavala Toledo','12036443-k'),(84,'Luis Alejandro Cid Urrutia','12189494-7'),(85,'Juan Roberto Perez Villegas','12240681-4'),(86,'Edith Marlen Cifuentes Levio','12257286-2'),(87,'Trinidad Del Carmen Escobar Guajardo','12278608-0'),(88,'Jacqueline Allende Quezada','12287534-2'),(89,'Pedro Antonio Zuñiga Fuentes','12326905-5'),(90,'Humberto Antonio Reyes Aliaga','12367837-0'),(91,'Ricardo Igor Acevedo Gutiérrez','12418476-2'),(92,'Carolina Duarte Moya','12458941-K'),(93,'Francisco Javier Maturana Perz','12486747-9'),(94,'Rolando Javier Borbalan Tapia','12495443-6'),(95,'Carlos Lopez Molines','12501517-4'),(96,'Jose Luis Molina Concha','12503669-4'),(97,'Dario Meneses Castillo','12516048-4'),(98,'Gloria Andrea Fuentes Castillo','12605227-8'),(99,'Viviana Peñaloza Prieto','12671620-6'),(100,'Elizabeth Andrea Nunez Valdes','12672805-0'),(101,'Macos Manuel Gonzalez Baeza','12675144-3'),(102,'Alexis González Errázuriz','12678457-0'),(103,'Ruth Curaqueo Soto','12678629-8'),(104,'Alejandro Antonio Dunstan Cofre','12688471-0'),(105,'Elizabeth Cecilia Sandoval Aguilar','12694984-7'),(106,'María Paz Vidal Lopez','12726344-2'),(107,'Claudia Daza Espinoza','12777010-7'),(108,'Pilar  Alejandra Aldana Retamal','12795303-1'),(109,'Erika Paola Quintral Rojas','12868804-8'),(110,'Paulina Alejandra Peña Carrasco','12871371-9'),(111,'Mauricio Guillot Baez','12893118-k'),(112,'Ingrid Delgado','12909843-0'),(113,'La Casa Del Músico','12913475-5'),(114,'Miriam Soza','13039110-9'),(115,'Silvanna Judith Danobeitia Larenas','13063263-7'),(116,'Miguel Ayala Iragorri','13068129-8'),(117,'Rosa Laura Cuevas Parancan','13079136-0'),(118,'Marcela Luisa Valdes Norambuena','13085994-1'),(119,'Reiner Enrique Freire Huechuqueo','13154523-1'),(120,'Ruperto Antonio Retamal Rios','13207197-7'),(121,'Lorena Lazcano','13239985-9'),(122,'Paola Urbina Parada','13243866-8'),(123,'Mabel Alejandra Llano Diaz','13261314-1'),(124,'Los Gemelos','13303526-5'),(125,'Maria Teresa Gonzalez Torres','13303526-5'),(126,'Ingrid Liliana Lopez Morales','13303688-1'),(127,'Karen Solar Godoy','13336865-5'),(128,'La Bodeguita Del Tata','13345825-5'),(129,'Nataly Arevalo Tapia','13445941-7'),(130,'Mariana Andrea Zuniga Torreblanca','13451715-8'),(131,'Luis Alejandro Rubilar Merino','13469580-3'),(132,'Jeannette Del Carmen Muñoz Olate','13471892-7'),(133,'Mariana Karfach Licunao','13486825-2'),(134,'Mary Viviana Fuentes Cancino','13488480-0'),(135,'Eduardo Miranda','13489115-7'),(136,'Andrea Carolina Maluenda Miranda','13551012-2'),(137,'Paula Antonieta Valdivia Martinez','13553097-2'),(138,'Ana Carolina Alvarado Osorio','13610791-7'),(139,'Andrea Paulina Huerta Sepulveda','13677138-8'),(140,'Andres Eduardo Valdes Miranda','13681627-6'),(141,'Barbara Quiroga Gallardo','13716700-K'),(142,'Marisol Andrea Gonzalez Infante','13755910-2'),(143,'Angel Sebastian Ramirez Fuentes','13779165-k'),(144,'Luis Gutierrez Jara','13835452-0'),(145,'Gilda Gonzalez Vergara','13886045-0'),(146,'Kevin Senen Olivares Gonzalez','13895774-8'),(147,'Karen Álvarez Igor','13909592-8'),(148,'Veronica Peña Galvez','13910893-0'),(149,'Yesenia Jara Martinez','14088132-1'),(150,'Patricia Andrea Leon Riquelme','14144474-3'),(151,'Nicolas Cruz Valdivieso','14166477-8'),(152,'Guillermo Saavedra Muñoz','14181320-k'),(153,'Juan Bautista Bustamante Hurtado','14183524-6'),(154,'Yasna Katherine Del Pino Ocares','14188059-4'),(155,'Alejandra Paola Carmona Navarro','14258603-7'),(156,'Floreria María Magdalena','14302291-9'),(157,'Sergio Hernan Yañez Jimenez','14335926-3'),(158,'Alejandro Muñoz Ibacache','14394534-0'),(159,'Won Che Kal','14425869-K'),(160,'Eduardo Millan Esteban','14498671-7'),(161,'José Luis Osorio Díaz','14512050-0'),(162,'Magaly Irene Sanhueza Melillan','14572268-3'),(163,'Antonio Rui Duarte Fernandes','14645854-8'),(164,'María Esperanza Verdesoto Flores','14674028-6'),(165,'Ikho Noh','14711172-k'),(166,'Loreto Andrea Berrios Catelican','15017333-7'),(167,'Angelica Quintanilla Rojas','15108762-0'),(168,'Jéssica Alejandra Galaz Contreras','15109258-6'),(169,'Marco Antonio Silva Donoso','15109378-7'),(170,'Ingrid Natalia Mejias Jara','15110436-3'),(171,'Javier Antonio Candia Candia','15168240-5'),(172,'Cecilia Elizabeth Valenzuela Quinchavil','15354681-9'),(173,'Priscila Pamela Calabrano Toro','15374059-3'),(174,'Mónica Salazar Castro','15431006-1'),(175,'Juan Miranda Araya','15444386-k'),(176,'Macarena Eveling Avila Figueroa','15445116-1'),(177,'Giannina Podesta Gonzalez','15661715-6'),(178,'Leslie Paulina Aracena Perez','15669008-2'),(179,'Peter O´Briam Carrasco Palma','15700426-3'),(180,'Danilo Almarza Ramirez','15715463-k'),(181,'Carolina Rozas Cataldo','15786297-9'),(182,'David Arriagada Castillo','15786780-6'),(183,'Sebastián Andrés Miranda Quintanilla','15806056-6'),(184,'Luis Andres Pena Seron','15841938-6'),(185,'Viviana Carolina Acevedo Pulgar','15902752-1'),(186,'Francisca Quintanilla Collio','15902986-7'),(187,'Grisett Santander Chávez','15908486-8'),(188,'Daniela Josefina Castillo Carbonell','15915557-9'),(189,'Paulina Schneidewind Hernaiz','15992084-4'),(190,'Sebastian  Vera Salinas','15999652-2'),(191,'Alejandra Valeska Pavez Lizama','13942579-0'),(192,'Nathaly Victoria Cesped Luna','16016650-9'),(193,'Eduardo Alejandro Núñez Godoy','16179402-3'),(194,'Esteban Pinto Cañete','16196431-k'),(195,'Lorena Salinas Parra','16268499-k'),(196,'Isaac Rodriguez Valdes','16385355-8'),(197,'Kevin Victor Carlier Riquelme','16410613-6'),(198,'Gisella Macarena Gallano Hidalgo','16423828-8'),(199,'Nicole Plaza Uribe','16440994-5'),(200,'Andrea Alvarez Mellado','16515216-6'),(201,'Juan Patricio Cabezas Pizarro','16522017-k'),(202,'Carolina Andrea Osses Contreras','16569606-9'),(203,'Juan Ernesto Osorio Reyes','16578791-9'),(204,'Nicol Andrea Romero Hernandez','16682245-9'),(205,'Jacqueline Andrea Herrera Gonzalez','16697725-8'),(206,'Jessica Yeti San Martin Cuevas','16714023-8'),(207,'Camila Fernanda Paredes Valencia','16745311-2'),(208,'Marco Andres Aguila Novoa','16800088-k'),(209,'Cristopher Salvo Urrutia','16800996-8'),(210,'Joana Rafaela Iturrieta Madrid','16802770-2'),(211,'Ximena Bustamante Bustamante','16828738-0'),(212,'Wan Jun Kim Lee','16839799-2'),(213,'Diego Leonardo Barrera Bustamante','16973473-9'),(214,'Jaime Rene Campos Yañez','17001284-4'),(215,'Vanesa Jordania Ilimuri Fuentes','17100359-8'),(216,'Polette Daniela Quezada Azocar','17142834-3'),(217,'John Carlos Henriquez Herrera','17277810-0'),(218,'Monica Constanza Cerna Vergara','17344928-3'),(219,'Lisette Garate Olivos','17381618-9'),(220,'Alvaro David Reyes Rodriguez','17395249-k'),(221,'Gabriel Jose Cruz Fernandez','17403023-5'),(222,'Camila Sibisa Rivadeneira','17406788-0'),(223,'Paulina Aranguiz','17418069-5'),(224,'Nicolas Horacio Cabezas Valenzuela','17484791-6'),(225,'Jose Luis Abaroa Moreno','17488289-4'),(226,'Damaris Lizette Rios Ayala','17503387-4'),(227,'Tamara Olea Caceres','17505144-9'),(228,'Genesis Farias Verdejo','17544795-4'),(229,'Anita Karina Moya Hernandez','17681887-5'),(230,'Antonia Andrea Muñoz Merino','17703457-6'),(231,'Sebastian Bravo Aguayo','17834168-5'),(232,'Felipe Andres Rojas Carrasco','17920372-3'),(233,'Katerine Daniela Hormazabal Melgarejo','17925797-1'),(234,'Jose Contreras Lagos','17926902-3'),(235,'Miguel Alejandro Reyes Olivares','17950269-0'),(236,'Priscila Alejandra Montero Vargas','18049158-9'),(237,'Alejandra Adriana Diaz Riveros','18051654-9'),(238,'Alejandra Andrea Dominguez Araya','18053098-3'),(239,'Barbara Elizabeth Rojas Zavala','18063829-6'),(240,'Danitza Olivos Briones','18074288-3'),(241,'Jairo Fuentes Sanchez','18079428-K'),(242,'Yoselyn Elena Alarcon Carcamo','18133541-6'),(243,'Renata Francisca Ulloa Calderon','18171951-6'),(244,'Yocelyn Maory Prado Peralta','18189401-6'),(245,'Carolina Paz Tapia Prieto','18190566-2'),(246,'Carolina Hernandez Aravena','18278447-8'),(247,'Nicolas Andres Contreras Vidal','18732179-4'),(248,'Barbara Tamara Herrera Bascuñan','18952927-9'),(249,'Emilio Andres Soto Zuñiga','19567405-1'),(250,'Mirian Milagros Pena Moreno','21921097-3'),(251,'Luis Alberto Garcia Hernandez','22642550-0'),(252,'Las Mercedes','23609039-6'),(253,'Alessio Cottafava','24126402-5'),(254,'Farmacia Estralla','3084297-9'),(255,'Telas Atriles','3109492-5'),(256,'Luis Orellana Caceres','3118349-9'),(257,'Janon Bathich Morales','3277819-4'),(258,'Juan Antonio Perez Bouzo','3283053-6'),(259,'Leonida Piccardo Fravega','3289140-3'),(260,'Antonio Jose Díaz González','3450704-k'),(261,'Ximena Ignacia Irrarazabal Correa','3559131-1'),(262,'Luis Albero Poza Maldonado ','3919700-6'),(263,'Nora Salas Castaleda','3941941-6'),(264,'Edgardo Enriquez Castillo Nuñez','4033885-3'),(265,'Luis Orellana Marchant','4096667-6'),(266,'Bernardo Riquelme Gomez','4287702-6'),(267,'Jose Luis Capdevila Honorato','4432741-4'),(268,'Georgina Del Carmen Gutiérrez Quiroz','4433765-7'),(269,'Carlos Tobar Silva','4435620-1'),(270,'Eduardo Jaime Carvajal Olate','4533379-5'),(271,'Gonzalo Alejandro Martin Iglesias','4661501-8'),(272,'Sergio Leopoldo Bravo Oliva','4690992-5'),(273,'Taller De Llaves Ivon','4816440-4'),(274,'Jorge Rehbein Ohaco','4817876-6'),(275,'Marco Leopoldo Laforest Rojas','4849927-9'),(276,'Donatilde Iturriaga Sanchez','4850635-6'),(277,'María Assadi Lama','4889117-9'),(278,'Luisa Regina Aguirre Fernadez','5076995-K'),(279,'Cutting Tools Chile E.I.R.L','52001373-3'),(280,'Renato A Soto Avendano Work Consultores E.I.R.L','52003093-k'),(281,'Fab Y Vta De Construc Eliana Del Carmen Maturana Carrasco E.I.R.L','52003601-6'),(282,'Comercial Eduardo Celery Fernandez E.I.R.L.','52005476-6'),(283,'Roberto Antonio Bennett Urzua','5209404-6'),(284,'Alejandro Fredy Vasquez Weigel','5225903-7'),(285,'Dario Enrique Sandoval Morales','5241404-0'),(286,'Luis Antonio Herrera Abarca (Ruta H)','5252475-k'),(287,'Francisco Mesko Garcia','5278045-4'),(288,'Comunidad De Productores Y Comerciantes Mayoristas De Flores ','53125680-8'),(289,'Waldo Alvarez Alvarez Y Otra','53309089-3'),(290,'Jose Miguel Guajardo Ulloa','5476348-4'),(291,'Victor Hugo Contreras Fuentes','5523932-0'),(292,'Rosa Pastora Medina Molina','5524258-5'),(293,'Maria Cecilia Milevcic Potin','5548060-5'),(294,'Rubén Narcizo Maldonado Vera','5557244-5'),(295,'Cesar Augusto Diaz Fernandez Nino','5583602-7'),(296,'Gabriel Enrique Gonzalez Medina','5591642-k'),(297,'Jose Arturo Hernandez Zumaeta','5614474-9'),(298,'Eugenio Esteban Alfonso Camus Mesa','5718545-7'),(299,'Eduardo Miguel Vera Urtubia','5767606-k'),(300,'Victor Barahona Calderon','5780333-9'),(301,'Pernos Tunca','5794345-9'),(302,'Lidia Del Carmen Guerrero Hernández','5805280-9'),(303,'Claudio Briones Espinosa','5842687-3'),(304,'Farmacias De Similares S.A','59111330-5'),(305,'Jardin Goly','5935468-k'),(306,'Carlos Alberto Lara Cerpa','6007592-1'),(307,'Empresas De Correos De Chile','60503000-9'),(308,'Pedro Luis Mora Lopez','6086074-2'),(309,'Marina Isabel Camus Vera','6086750-k'),(310,'Manuel Mardones','6089817-0'),(311,'Ministerio De Educacion','60902051-2'),(312,'Seremi Salud','60907062-5'),(313,'Universiad De Valparaiso','60921000-1'),(314,'Metro De Santiago','61219000-3'),(315,'Corporación Nacional Forestal','61313000-4'),(316,'Elsa Aguayo Riquelme','6133436-k'),(317,'Jose  Santelices','6134254-0'),(318,'Patricio Alejandro Olea Arias','6135581-2'),(319,'Laura Del Carmen Romo Rojas','6177507-2'),(320,'Aguas Andinas S.A','61808000-5'),(321,'Luis Orlando Railhet Araya','6264797-3'),(322,'Roberto Julio Naser Ghrez ','6345265-3'),(323,'Nancy Laprida Cortes','6358737-0'),(324,'Sonia Teresa Leyton Garrido','6448196-7'),(325,'Enrique Rodriguez Rios','6448496-6'),(326,'Juan Palavecino Fuenzalida','6452381-3'),(327,'Juan Alberto Díaz Espinosa','6462805-4'),(328,'Francisco Antonio Fuentes Jiménez','6463522-0'),(329,'Nelson Ramon Cuevas Moya','6468390-k'),(330,'Corporacion De La Educacion Aptus Chile','65020623-1'),(331,'Departamento Provincial De Educacion Cordillera','65039940-4'),(332,'Fundacion Educacional Protectora De La Infancia','65044065-k'),(333,'Asociacion De Municipalidades Parque Cordillera','65060484-9'),(334,'Centro De Padres Iln','65117753-7'),(335,'Walter Acevedo Duarte','6513613-9'),(336,'Carlos Roman Quintanilla','6520463-0'),(337,'Carlos Arze Bustamante','6557673-2'),(338,'Manuel Maturana Merino','6558329-1'),(339,'Fund. Gestión De Serv. Cooperativos','65645290-0'),(340,'Fundacion Fidecap','65671030-6'),(341,'Juan Zuñiga Otazo','6594505-3'),(342,'Jose Roberto Gutierrez Escare','6659551-k'),(343,'Margarita Solis Moreno','6690514-4'),(344,'Virna Vergara Vallejos','6699573-9'),(345,'Ilusita Manriquez Muñoz','6735280-7'),(346,'Margarita De Las Mercedes Garrido Galaz','6756326-3'),(347,'Rosa Emérita Novoa Jara','6807419-3'),(348,'Marina Del Rosario Garrido Ramirez','6890039-5'),(349,'Fresia Del Transito Rodriguez Rios','6922709-0'),(350,'Maria Antonieta Parraguez Henriquez','6953849-5'),(351,'Carolina Morales Mena','6964535-6'),(352,'Lucia Aravena Arce','6994869-3'),(353,'Congregacion Pias Discipulas Del Divino','70024390-7'),(354,'Jose Alejandro Reyes Soto','7003267-8'),(355,'Nelly Molina Lillo','7012898-5'),(356,'Fundación Arturo Lopez Perez','70377400-8'),(357,'Congregacion Clerigos De San Viator','70568300-k'),(358,'Maria Elena Salazar Rivera','7086910-1'),(359,'Universidad Diego Portales','70990700-k'),(360,'Corporacion Cultural De Las Condes ','71004200-4'),(361,'Eduardo Hernandez Rojas','7105213-3'),(362,'Corporación Privada Para La Divulgaciónde La Ciencia Y Tecnología','71091900-3'),(363,'Graciela Del Carmen Otarola Pizarro','7118510-9'),(364,'Maria Esther Becker Adrian','7120998-9'),(365,'Fundacion Para El Funcionamiento Desarrollo Y Promoción Del Planetario ','71250500-1'),(366,'Fundacion Pablo Neruda','71306000-3'),(367,'Fundacion Vicente Huidobro','71738200-5'),(368,'Juan Jose Herrera Diaz','7188548-8'),(369,'Apr Comité Agua Potable Rural Rosario Codao','71908500-8'),(370,'Corporación Espacio Para El Arte Artequin','72043000-2'),(371,'Fundacion Gabriel Y Mary Mustakis','72251700-8'),(372,'Fundacion Cardoen','72386700-2'),(373,'Raul Farias Tapia','7246179-7'),(374,'San Eugenio','7246494-k'),(375,'Top Roller Spa','73297385-5'),(376,'Hernan Gonzalo Matute Izurieta','7345106-k'),(377,'Servicios Integrales Reinaldo Andres Lopez Vergara Empresa Individual','73710532-0'),(378,'Rosa Mercedes Parraguez Perez','7372762-6'),(379,'Pedro Valdebenito Rodriguez','7407935-0'),(380,'Ricardo Rafael Lobos Inostroza','7447863-8'),(381,'Julia Alarcon Venegas','7479271-5'),(382,'Eulogia Neira Chavez','7515777-0'),(383,'Omar David Lagunas Halty','7518971-0'),(384,'Patricia Angélica Sasso Román','7540566-9'),(385,'Victor Hugo Donoso Bustos','7583276-1'),(386,'Cervantes Librería','76001337-4'),(387,'Importadora Suli Lai Ltda','76002856-8'),(388,'Sociedad De Capacitacion Firenze Ltda','76004118-1'),(389,'Yasmin General Placencia Producciones E.I.R.L.','76004178-5'),(390,'Super 10 S.A','76012833-3'),(391,'Solange Alvarez Aranda','76015239-0'),(392,'Distribuidora C Y F Spa','76020299-1'),(393,'Alimentos Puerto Nuevo Limitada','76022387-5'),(394,'Empresa Social De Comercialización De Productos Ltda','76026828-3'),(395,'Productora De Teatro Phi Ltda','76034674-8'),(396,'Importadora Y Exportadora Al Donna Ltda','76035035-4'),(397,'Comercial Ubilla Daza Ltda','76035100-8'),(398,'Alimentos Lonquen Ltda','76036339-1'),(399,'Arevalo Y Navarro Soc. Ltda','76037308-7'),(400,'Electromusica Ltda','76037511-K'),(401,'Comercial Arte Diseño D Y C Ltda','76038879-3'),(402,'Alfaomega Computación E.I.R.L','76040061-0'),(403,'Importadora Y Exportadora Hai Feng Limitada','76040665-1'),(404,'Cabello Y Cabello Ltda','76047287-5'),(405,'Juan Videla Solorza Impotadora E.I.R.L.','76048071-1'),(406,'Bronceria Nacional Ltda','76049198-5'),(407,'Promocenter Publicidad Ltda','76049456-9'),(408,'Servicios Integrales De Seguridad Ltda','76050559-5'),(409,'Medicion Y Gestion Educacional Kimetrica Ltda','76050781-4'),(410,'Pide Aguayo Y Gauna Ltda','76051705-4'),(411,'Hermanas Salvatierras Ltda','76051889-1'),(412,'Sociedad Tecnologica Tecpa Chile Ltda','76052252-k'),(413,'Comercial Y Servicios Palau Ltda','76058799-0'),(414,'Limpieza Verde Spa','76059183-1'),(415,'Sociedad Comercial Electroferr S.A','76060852-1'),(416,'Sociedad De Ingenieria En Limpieza Ltda','76061485-8'),(417,'Importadora Ferreyin Compañía Ltda','76063681-9'),(418,'Jis Parking Spa','76063822-6'),(419,'Astoreca Asesorías Educacionales Spa','76065475-2'),(420,'Sociedad Comercial Ecoimagem Limitada','76068924-6'),(421,'Importadora Artefinos Ltda','76070170-k'),(422,'Sociedad Comercial Dataglobal Ltda','76073252-4'),(423,'Deporte Sparta Ltda.','76074938-9'),(424,'Importadora Y Comercializadora Dopack ','76075455-2'),(425,'Importadora Hong Kong Toy Ltda','76075861-2'),(426,'Comercializadora E Importadora Jabes Chile Limitada','76077109-0'),(427,'Arquitectura Textil Ingenieria Y Montajes Ltda','76080637-4'),(428,'Ok Market San Pascual','76084682-1'),(429,'Concesiones Recoleta S.A','76088854-0'),(430,'Distribuidora Comercial Veintidos Ltda','76091737-0'),(431,'Sociedad Comercial Paz Y Compañía Limitada','76091949-7'),(432,'Napsis S.A','76093358-9'),(433,'Banqueteria Y Reposteria Florence Ltda','76098849-9'),(434,'Comerial E Inversiones Borquez Hulse Ltda','76099850-8'),(435,'Comercializadora Lagos Y Valenzuela Ltda','76107839-9'),(436,'Carlos Sobarzo Jimenez E.I.R.L','76110447-0'),(437,'Comercial Exportadora E Importadora A & C Ltda','76112635-0'),(438,'Importadora Y Exportadora Tian Fa Ltda','76114922-9'),(439,'Fondo De Inversión Privado Social','76116054-0'),(440,'Comercializadora Kayma Limitada','76117384-7'),(441,'Comercial La Liquidadora Ltda','76120080-1'),(442,'Sergio H. Iglesias Jara E.I.R.L','76121617-1'),(443,'Pedro Eduardo Garay Alemany Editorial E.I.R.L','76122502-2'),(444,'Comercializadora Borislav Ljubetic Ercig Ltda','76125786-2'),(445,'Importadora Sol Naciente Ltda','76131716-4'),(446,'Administradora Lot Park Ltda','76131738-5'),(447,'Centro De Capacitacion Teen Star Chile Ltda','76132116-1'),(448,'Comercial Santos Ltda','76132595-7'),(449,'María Yolanda Valenzuela Cabezas','7613355-7'),(450,'Importadora Y Exportadora Good Fortune Ltda','76134396-3'),(451,'Administradora De Supermercados Hiper Ltda','76134941-4'),(452,'Administradora De Supermercados Express Ltda','76134946-5'),(453,'Ingetecsa Spa.','76135126-5'),(454,'Importadora Fiesta Club Ltda','76135178-8'),(455,'Comercializadora Calvac Ltda','76137646-2'),(456,'Sociedad Educacional Capullitos Ltda','76137836-8'),(457,'Sociedad Valdebenito E Hijos Ltda','76141750-9'),(458,'Soc. Comercial Saveline Ltda','76142331-2'),(459,'Buffer Spa','76142567-6'),(460,'Soc. Comercial G & T Ltda','76144259-7'),(461,'Concesiones Providencia S.A','76148758-2'),(462,'Fabrica De Tortas Alico Ltda','76153340-1'),(463,'Comercializadora Importadora Y Exportadora','76154435-7'),(464,'Sociedad Comercial Cromocar Ltda','76160982-3'),(465,'Comercial Guipoba Gissela Cerda Moyano E.I.R.L','76163372-4'),(466,'Textil La Emiliana Ltda','76164260-K'),(467,'Distribuidora Y Comercializadora Juan Carlos Abarca Machuca Dekogar E.I.R.L','76168881-2'),(468,'Importadora Y Distribuidora De Plasticos S.A','76170499-0'),(469,'Ingenieria E Instalaciones Electricas Pailamilla Spa','76170749-3'),(470,'Sociedad A Y B Ltda','76174644-8'),(471,'Servicios Y Control De Plagas Beatriz Ivonne Bernier Valdes E.I.R.L','76178159-8'),(472,'Comercializadora Todo Fiesta Limitada','76181071-5'),(473,'Comercializadora Vargas Del Valle E Hijas Ltda (Nilahue)','76183900-4'),(474,'Comercializadora Telas Genesis Ltda','76186882-9'),(475,'R Y P Repuestos Ltda','76187881-6'),(476,'Sociedad Comercial Medicar Ltda','76189111-1'),(477,'Estructuras Gabriela Masia','76190182-6'),(478,'Sociedad Aridos Orellana Hermanos Ltda','76193391-4'),(479,'Importadora Y  Comercializadora Ortopedia Suiza  Spa','76194079-1'),(480,'Comercializadora Y Transportes San Lucas Ltda','76194487-8'),(481,'Irlanda De Lourdes Palacios Vargas Eds E.I.R.L','76197034-8'),(482,'Distribuidora Rio Serrano Ltda','76199121-3'),(483,'Luigui Lotito S Y Cia Ltda','76199346-1'),(484,'Comercializadora Moises Naranjo E.I.R.L','76202306-7'),(485,'Comercializadora Integración Digital Spa','76202443-8'),(486,'Muebles Andromeda Spa','76202596-5'),(487,'Importacion y Exportacion Doremi Ltda','76202697-K'),(488,'Jorge Renato Inope Puertas','76205764-6'),(489,'Comercial Smith Y Sanhueza','76206325-5'),(490,'Alfa Confecciones Ltda','76207417-6'),(491,'Deportes Ram S.A','76208579-8'),(492,'Distribuidora De Cotillon S.P.A','76209669-2'),(493,'Construccion Norton Ltda','76210854-2'),(494,'Arirang Comercializadora Integral Ltda','76213669-4'),(495,'Entretenimiento Y Producciones Activas Ltda','76214640-1'),(496,'Sociedad Comercial La Papa Ltda','76216379-9'),(497,'Comercializadora Los Olmos Ltda','76219742-1'),(498,'Bix S.A','76220324-3'),(499,'Importadora Y Comercializadora R Y S Ltda','76227509-0'),(500,'Pérez Y Pérez Limitada','76228338-7'),(501,'Comercial Hiper Asia Limitada','76229833-3'),(502,'Comercializadora Este Deportes Ltda','76231132-1'),(503,'Comercializadora De Pernos Y Herramientas Ltda','76232520-9'),(504,'Walmart Chile Mayorista Ltda','76232647-7'),(505,'Gomas San Vicente','76234327-4'),(506,'Luis Cifuentes Torres Y Otro Limitada','76235521-3'),(507,'Softland Training Center Ltda','76236150-7'),(508,'Central Catering Andres Cordova E.I.R.L','76238683-6'),(509,'Comercial Sergio Borlando Marconi E.I.R.L','76238945-2'),(510,'Importadora Y Distribuidora San Martín Limitada','76245193-K'),(511,'Impresiones Digitales Orioncolor Ltda','76245892-6'),(512,'Figueroa Y Orfali Ltda','76247050-0'),(513,'Asesorias Y Servicios Kyklos Spa','76247523-5'),(514,'Rackeo','76247932-K'),(515,'Dar Computación Spa','76251775-2'),(516,'Comercial Ely','76259626-1'),(517,'Distribuidora De Frutos Del Pais Claudio Marcelo Gaete Cartagena E.I.R.L.','76260436-1'),(518,'Multiservicios Chile Mas Spa','76261921-0'),(519,'Distribuidora San Javier S.A','76265681-7'),(520,'Rubilar  Y Valdivia Ltda','76267134-4'),(521,'Inversiones Cruz Del Sur S.A','76267237-5'),(522,'Ingeniería Mci Ltda','76269680-0'),(523,'Comercializadora Equus Y Cia Ltda','76271919-3'),(524,'Lefian Y Ampuero Ltda','76286679-k'),(525,'Distribuidora Meci','76288393-7'),(526,'Comercial Alemana Ltda','76292091-3'),(527,'Comercial Los Conquistadores Ltda','76297106-2'),(528,'Comercial Top Roller Ltda','76297385-5'),(529,'Comercializadora Y Distribuidora Lynnn Paz Limitada','76300857-6'),(530,'Distribuidora Y Comercializadora Manuel Gonzalez Torres','76302667-1'),(531,'Comercializadora De Productos Electronicos A&R Ltda','76306552-9'),(532,'Servicios Informaticos Y Telecomunicaciones Limitada','76314066-0'),(533,'Electroventas Ltda','76317590-1'),(534,'Wog Spa','76318208-8'),(535,'Matriz Ideas S.A','76322590-9'),(536,'Comercial Su Hogar Ltda','76328609-6'),(537,'Comercial Veronica Andrea Campos Castillo E.I.R.L','76336481-K'),(538,'Officolor.Cl Ltda','76336784-3'),(539,'Nilo & Arroyo Chilelift Ltda','76345095-3'),(540,'Servicio Medicos E Inversiones Aldana Leon, Pugin Y Cia Ltda','76346829-1'),(541,'Paraguez Hermanas Limitada','76361293-7'),(542,'Inversiones Schwerter Spa','76361953-2'),(543,'Producciones Y Eventos Claudia Andrea Ramirez Ramirez E.I.R.L','76362903-1'),(544,'Ferreteria Covadonga','76368507-1'),(545,'Comercializadora Dehua Qiu E.I.R.L','76374149-4'),(546,'Comercializadora Y Distribuidora La Paloma Ltda','76376800-7'),(547,'Farmacias Ahumada S.A','76378831-8'),(548,'Concha, Inostroza, Martinez & Lues Spa','76379254-4'),(549,'Comercializadora De Frutas Y Verduras D&B Ltda','76382587-6'),(550,'Asesoria Y Consultoria Educacional Ltda','76383711-4'),(551,'Blanc Spa','76383742-4'),(552,'All Strings Spa','76388578-K'),(553,'Centro Integral Fonoaudiológico Salud Y Educación Fonodesarrolla Y Com.','76390997-2'),(554,'Grupo Leer Mas Hoy Spa','76395554-0'),(555,'Sergio Hernan Arroyo Delgado E.I.R.L','76396952-5'),(556,'O.C. Ltda','76402026-K'),(557,'E&S Construcciones Spa','76403532-1'),(558,'Pedro Ibañez E Hijos','76405630-2'),(559,'Supermercados Cugat','76407505-6'),(560,'Cine Hoyts Spa','76416414-8'),(561,'Comercializadora Y Distribuidora C&M Ltda','76417054-7'),(562,'Serv. Telefonia Ivan Ego-Aguirre','76418812-8'),(563,'Capacitacion Usach Compañía Ltda','76421320-3'),(564,'Transportes Laprida Ltda','76429874-8'),(565,'Maria Lucila Fuentes Romo','7643068-3'),(566,'La Herencia Spa','76436048-6'),(567,'Pamela Otarola Rojas Servicios Promocionales E.I.R.L','76437683-8'),(568,'Enseña Lenguaje Spa','76441672-4'),(569,'Importadora Y Exportadora Yi Li Chile S.P.A','76442087-K'),(570,'Deportes Lorens  S.A','76446500-8'),(571,'Importadora Tomei Chile Spa','76450161-6'),(572,'Comercializdora Y Constructora Intercolor Ltda','76455915-0'),(573,'C. Ding Xing Ltda','76456928-8'),(574,'Sistemas Contra Incendio Tatti Spa','76460201-3'),(575,'Comercial Fernapet Ltda','76465809-4'),(576,'Tienda Leticia Mafalda','76465994-5'),(577,'Ondata Recovery','76469858-4'),(578,'Ekono Ltda','76473580-3'),(579,'Re Imagina Educación Ltda','76474550-7'),(580,'Comercializadora De Art.Deportivos Claudio Alejandro Soto Romero','76474802-6'),(581,'Bravo Y Jara Ltda','76475340-2'),(582,'Renacer Spa','76479238-6'),(583,'Aluminios Alvarez Ltda','76481136-4'),(584,'ASF Logistica Spa','76481576-9'),(585,'Soldaduras Soltec Spa','76488020-k'),(586,'New Markup S.A','76491379-5'),(587,'Importadora Internacional Technics Grapics Ltda','76493820-8'),(588,'Importadora Y Exportadora Xingda Trade Spa','76494268-K'),(589,'Arce Y Vergara  Cia','76497570-7'),(590,'Comercial E Industrial Valenzuela Ltda','76502880-9'),(591,'Publicidad Leonardo Gustavo Toribio Herrera E.I.R.L','76503181-8'),(592,'Importadora Y Exportadora Chen Chile Limitada','76503452-3'),(593,'Teatro Ed. Macarena Mendez Barraza Empresa Individual De Respons.','76504518-5'),(594,'Productora De Eventos G&G Ltda','76505807-4'),(595,'Promusic Audio Ltda','76512650-9'),(596,'Deltamed Ltda','76512686-K'),(597,'Obinu Y Cia Ltda','76516761-2'),(598,'Direkt Tecnologia Y Servicios Spa','76517178-4'),(599,'Lacasa Del Músico Spa','76520261-2'),(600,'Comercial Queretaro Spa','76536157-5'),(601,'La Frontera Spa','76536514-7'),(602,'Maquinarias Y Servicios Reyes Diaz Limitada','76536527-9'),(603,'Consultora Erika Loreto Quiroz Quinteros E.I.R.L','76538223-8'),(604,'Diyi Baihuo Ltda','76548617-3'),(605,'Textil Harry Limitada','76549845-7'),(606,'Productos Marys Ltda','76551990-k'),(607,'Importadora, Exportadora Y Comercializadora Dragon Del Cielo Ltda','76558476-0'),(608,'Ing. Jose Luis Campos Flores E.I.R.L','76560214-9'),(609,'Soc. Pedro Aguayo Y Ramirez Cia Ltda','76562719-2'),(610,'Bioquimica.Cl S.A','76563320-6'),(611,'Tecnologia Lk Spa','76567200-7'),(612,'Easy Reatil S.A','76568660-1'),(613,'Comercial Mafasil Limitada','76569022-6'),(614,'Dimacofi Negocias Avanzados Sa','76570350-6'),(615,'Inversiones, Construcción Y Estacionamientos Oro Verde','76572327-2'),(616,'Dist. Imp. Y C. Cindy Evelyn Aguilar Bol','76573935-7'),(617,'Comercial Way Trading','76575763-0'),(618,'Comercilizadora Lary Spa','76576204-9'),(619,'Jaime Andres Tolic Medel Servicios T Y T E.I.R.L','76577679-1'),(620,'Comercial The Master Ltda','76580210-5'),(621,'Importadora Y Exportadora Regalos Ángel Limitada','76589895-1'),(622,'Aula Editores S.A','76591500-7'),(623,'Comercial Textil Elie Mokarkar E.I.R.L','76592211-0'),(624,'Launch Latinoamerica Ltda','76592223-2'),(625,'Maria Guerrero Miranda','76597088-1'),(626,'Comercial  Zima Ltda','76598469-6'),(627,'Servicios De Interpretaciones Y Traducciones Ivan Enrique Jimenez Vald','76601160-8'),(628,'Juegos Infantiles Carlos Aviles E.I.R.L','76601645-6'),(629,'Sociedad Textil Jc Spa','76603985-5'),(630,'Neurokids Spa','76607182-1'),(631,'Parking Service Gino&Andrea Morales Emp. Ind.De Resp.Ltda','76607924-5'),(632,'Sociedad Comercial Rosas Spa','76608868-6'),(633,'Jose Zuñiga Ortiz','7662494-1'),(634,'Luis Zuñiga Ortiz','7662502-6'),(635,'Neurocare Spa','76633465-2'),(636,'Camo Odontologia Spa','76640627-0'),(637,'Ventas Y Servicios Publicitarios Casram Spa ','76648503-0'),(638,'Comercial Jaime Antonio Jimenez','76651991-1'),(639,'Renewal Company Ltda','76653055-9'),(640,'Sociedad Comercial Y De Inversiones','76667564-6'),(641,'Steffens Y Comp. Ltda','76688938-7'),(642,'Ventas Art. Electronicos','76689839-4'),(643,'Grafika Nahuel S.A','76709910-K'),(644,'Carpas Atenas Ltda','76712660-3'),(645,'Comercializadora Ecopapel Spa','76717977-4'),(646,'Intergroupe S.A','76719470-6'),(647,'Comercial E Importadora Turquesa Ltda','76727277-4'),(648,'Comercial Inarcon Spa','76733699-3'),(649,'Importadora Wind Ltda','76777310-2'),(650,'Samsonite Chile S.A','76811980-5'),(651,'Imperial S.A','76821330-5'),(652,'Abarrotes Economicos S.A','76833720-9'),(653,'My Plastic Ltda','76838940-3'),(654,'Comercial Aliaga Hmnos Ltda','76863530-7'),(655,'Kramer Y Asociados Ltda','76871700-1'),(656,'Pavez Y Reyes Ltda','76872740-6'),(657,'Comercial Uyustools Chile Ltda','76891050-2'),(658,'Asesorias Pedagogicas Chile S.A','76898780-7'),(659,'Maria Cristina Gitierrez Chavez Inversiones E.I.R.L','76943240-K'),(660,'Comercial Logroño Ltda','77024990-2'),(661,'Supermercado Mayorista La Fama San Vicente Limitada','77027930-5'),(662,'Sociedad Granja Agricola Educacional Limitada','77051760-5'),(663,'Jose Antonio Pavez Andrade','7707678-6'),(664,'Sociedad Comercial De Servicios Y Capacitación Elcom Limitada','77082290-4'),(665,'Liberalia Ediciones Limitada','77104100-0'),(666,'Servicios Y Comercial Rauco Ltda','77115570-7'),(667,'Turismo Costanera Ltda','77133730-9'),(668,'Steck Y Compañía Ltda','77140120-1'),(669,'Inmobiliaria E Inversiones Antunes Ltda','77148080-2'),(670,'Administradora De Ventas Al Detalle Ltda','77215640-5'),(671,'Distribuidora Alamos Y Bonometti Ltda','77222900-3'),(672,'Eduardo Abdon Ortiz Vera','7722335-5'),(673,'Servicios Integrales De Salud Limitada','77232540-1'),(674,'Orpinas Ycompañia Limitada','77247220-K'),(675,'Egasold Ltda','77248190-k'),(676,'Central Parking S.A','77248210-8'),(677,'Estacionamientos Central Parking System Chile Sa','77248210-8'),(678,'Mundo Didactico Ltda','77248320-1'),(679,'Falabella Retail S.A','77261280-K'),(680,'Ideas Educativas Spa','77262930-3'),(681,'Tecnored S.A.','77302440-5'),(682,'Librería Antartica Plaza Ltda','77339800-3'),(683,'Dominguez  Y Santis Ltda','77365550-2'),(684,'Transportes Muñoz Broco Ltda (Andimar)','77392590-9'),(685,'Broncerias Camille Ltda','77404630-5'),(686,'Importadora Y Exportadora Panamericana Limitada','77410900-5'),(687,'Sociedad Librería Rojas Limitada','77414690-3'),(688,'Imagen Optical Ltda','77422980-9'),(689,'Soc. Comerc. Keim Ltda','77444770-9'),(690,'Lorena Raquel Legrand Fonseca','7747800-0'),(691,'Autotek Ltda','77501510-1'),(692,'Jardin San Enrique ','77550200-2'),(693,'Computación Constanza Sofia Ltda','77556200-5'),(694,'Hotelera Holanda Ltda','77562000-5'),(695,'Comercial Santa Barbara','77568150-0'),(696,'Transportes Santa Lidia Limitada','77575890-2'),(697,'Soc. Retamal Y Villarroel Ltda','77592220-6'),(698,'Administrador De Sevicios De Retail Ltda','77614700-1'),(699,'Comercializadora Steck Y Del Rio Ltda','77667230-0'),(700,'Comercial San Francisco Ltda','77668710-3'),(701,'Sociedad Comercial E Industrial San Diego Ltda','77750600-5'),(702,'Instituto De Capacitacion Y Desarrollo Capacita Ltda','77786910-8'),(703,'Imax Ingenieria Ltda','77819970-K'),(704,'Soc.Comerc Y Distribuidora Cousin Ltda','77829720-5'),(705,'Patricio Pumpin Y Cia Ltda','77862960-7'),(706,'Importadora Vishv India Ltda','77874870-3'),(707,'Sociedad Farmacéutica Y Comercial Pavez Ltda','77876860-7'),(708,'Viviana Noemi Sanhueza Alarcon Comercializadora E.I.R.L','77914990-0'),(709,'Sociedad De Recaudacion Y Pagos De Servicios Ltda','78053790-6'),(710,'Ferreteria San Fermin','78139800-4'),(711,'Luarte Y Cia Ltda','78193920-K'),(712,'Revista Psicopedagogica Repsi Limitada','78220250-2'),(713,'Comercializadora El Mirador S.A','78289730-6'),(714,'Sociedad Comercial J Y L Ltda','78312580-3'),(715,'Imprenta Editorial Grafic Suisse Ltda','78342690-0'),(716,'Cristian Guillermo Faure Leiva','7845154-8'),(717,'Miguel Angel Qezada Castro','7845366-4'),(718,'Jorge Odeh Y Cia Ltda','78466770-7'),(719,'Copec','78513190-8'),(720,'Inversiones E Inmobiliaria Karime Y Francesco  Ltda','78545670-k'),(721,'Hipermercado Tottus S.A','78627210-6'),(722,'Adidas Chile Ltda','78744360-5'),(723,'Inversiones San Sergio Ltda','78786920-3'),(724,'Industrial Y Comercial Los Alamos Ltda','78801100-8'),(725,'Ingenieria En Sanitizacion S.A','78829890-0'),(726,'Computer Buro Service Ltda','78848750-9'),(727,'Personal Computer Factory S.A','78885550-8'),(728,'Artículos Deportivos Scratch Ltda','78893760-1'),(729,'Rs Componentes Electrónicos Ltda','7891251-4'),(730,'Productora Mceventos Ltda','78922250-9'),(731,'Nelson Diaz Espinoza','7892329-6'),(732,'Cardenas Y Pedemonte S.A','78925440-0'),(733,'Amasanderia Y Rotiseria Florencia Ltda','78963700-8'),(734,'Comercial Los Arcos Ltda','78967990-8'),(735,'Comercial Maicao Ltda','79500520-K'),(736,'Materiales Y Componentes Industriales Metacom Ltda','79521910-2'),(737,'Galileo Libros Ltda','79542460-1'),(738,'Madrigal Noriega Limitada','79544390-8'),(739,'Fca . Electricas Chilenas Ltda','79560270-4'),(740,'Sociedad De Alimentos Paypas Ltda','79653190-8'),(741,'Copec','79689550-0'),(742,'Petrobras Chile Red Ltda','79706120-4'),(743,'Sociedad Comercial Eoung Ok An Ban Limitada','79716540-9'),(744,'Soc. Muaiad Hermanos Ltda','79752380-1'),(745,'Polimin Comercial E Industrial','79760310-4'),(746,'Lanas Dina Ltda','79781860-7'),(747,'Compañía Distribuidora De Electronica Y Telecomunicaciones','79789710-8'),(748,'Fotografica Forestier S.A','79813360-8'),(749,'Comercial Excom Ltda','79836390-5'),(750,'Jose Patricio Bustos Espinoza','7985616-9'),(751,'Comercial Rey Ltda','79880870-2'),(752,'Universal Repuestos Tagua Tagua Limitada','79898120-K'),(753,'Centro De Capacitacion Cahuala Ltda','79939710-2'),(754,'Soc. Comercial Bustamante Y Cia Ltda','79971660-7'),(755,'Buses Peñablanca','79985610-7'),(756,'Carmen Paola Leon Martinez','8008085-9'),(757,'Manuel Catron E Hijos Limitada','80183000-5'),(758,'Farmacias Roubillard S.A','80338400-2'),(759,'Electricidad Gobantes S.A','80409800-3'),(760,'Ilop S.A','80478200-1'),(761,'Maria Rojas Arevalo','8051466-2'),(762,'Naser Hermanos Limitada','80670900-K'),(763,'Jorge Osorio Stuardo','8068177-1'),(764,'Mirta Zuzulich Vasquez','8068253-0'),(765,'Otero  Y Cia  Ltda','80706300-6'),(766,'Guillermina De Las Mercedes Peña Carruche','8088522-9'),(767,'Bombones Varsovienne S.A','81013400-3'),(768,'Victor Dawabe Ltda','81153800-0'),(769,'Cencosud Retail S.A','81201000-k'),(770,'Eduardo Lazo Contreras','8136619-5'),(771,'Alvaro Casanova Maquinarias Ltda','81440500-1'),(772,'Rendic Hermanos S.A','81537600-5'),(773,'Francisco Regulez Y Cia Ltda','81569800-2'),(774,'Garcia, Rio Y Cia','81571600-0'),(775,'Pontificia Universidad Catolica De Valparaiso','81669200-8'),(776,'Pontificia Universidad Catolica De Chile','81698900-0'),(777,'Enrique Alejandro Rojas Bustamante','8197342-3'),(778,'Mario Ignacio Yunis Giacaman','8204384-5'),(779,'Luis Armando Cifuentes Olivares','8221587-5'),(780,'Cooperativa Campesina Intercomunal Peumo Limitada','82400500-1'),(781,'Maria Antonieta Ulloa Hidalgo','8246443-3'),(782,'Juan Manuel Azcorbebeitia Ltda','82574000-7'),(783,'Corina Del Carmen Herrera Diaz','8277597-8'),(784,'Juana Eva Espinoza Aravena','8288222-7'),(785,'Industria Nacional De Tejidos De Alambre Ltda','82920900-4'),(786,'Distribuidora De Industrias Nacionales S.A','82982300-4'),(787,'Congregación Del Verbo Divino','82991800-5'),(788,'Nibsa S.A','83017600-4'),(789,'Electrónica Casa Royal Limitada','83030600-5'),(790,'Calzados Beba Ltda','83033300-2'),(791,'Feria Chilena  Del Libro Ltda','83068700-9'),(792,'Nelly De Las Mercedes Sarmiento Santander','8312579-9'),(793,'Mario Orfali Jimenez','8316042-K'),(794,'Manuela Del Carmen Moya San Martín','8327016-0'),(795,'Clelia Gonzalez Zapata','8332520-8'),(796,'Comercial Eccsa S.A','83382700-6'),(797,'Reinaldo Nuñez A. Spa','83414900-1'),(798,'Industria Metalurgica Aconcagua Ltda','83732700-8'),(799,'Victoria Luisa Bustamente Rojas','8393131-0'),(800,'Broncerias Bascuñan','8403854-7'),(801,'Alimentos Fruna Ltda','84156500-2'),(802,'Luis Eduardo Núñez Vidal','8432718-2'),(803,'Abastecedora Del Comercio Ltda','84348700-9'),(804,'Marisol Ahumada Romero','8489576-8'),(805,'Rosa Del Carmen León Goyak','8497253-3'),(806,'Salon De Te Y Restorant Villareal Ltda','85215800-k'),(807,'Fuenzalida  Y Cia Ltda','85243300-0'),(808,'Eduardo Alberto Quinchagual Deum','8579425-6'),(809,'Gomatex Ltda','85827900-3'),(810,'Maria De Lourdes Silva Molina','8586097-6'),(811,'Sociedad Importadora De Libros Kuatro Ltda','85913900-0'),(812,'Jorge Concha Cayuqueo','8605652-6'),(813,'Giovanna Eliana Pontiggia Garcia','8611080-6'),(814,'Iris De Los Angeles Gutierrez Roca','8624635-K'),(815,'Jose Rivero Llamazales Y Cia Ltda','86520500-7'),(816,'Alvaro Jose Marquez Eguiguren','8656565-k'),(817,'Paulina Beca Cofre','8667861-6'),(818,'Victor Gonzalez  Y Cia. Ltda','86962700-3'),(819,'Berta Del Carmen Nazar Rodriguez','8726444-0'),(820,'Maria Gutierrez Roca','8739841-2'),(821,'Rosa Lucia Avendaño Bernal','8768099-1'),(822,'Mariella Arias Tahuata','8774624-0'),(823,'Soc. Agencia Viajes  Andina Del Sud Ltda','87747300-7'),(824,'Yolanda Gonzalez Uribe','8802260-2'),(825,'Alejandra Del Carmen Carvacho Donoso','8802290-4'),(826,'Luisa De Las Mercedes Alarcón Martínez','8845294-1'),(827,'Administracion Y Gestion De Estaciones De Servicios Ltda','88473200-K'),(828,'Librería Antartica Ltda','88679500-9'),(829,'Myriam Elizabeth Mariela Amigo Arancibia','8884553-6'),(830,'Gina Soledad Solis Nuñez','8905496-6'),(831,'Erika Beatriz Riquelme Hernandez','8936153-2'),(832,'Dist. Com. Textil Ltda','89541600-2'),(833,'Elizabeth Gallardo Gallardo','8959502-9'),(834,'Estacion De Servicio Cordillera Ltda','89605500-3'),(835,'Ingenieria En Electronica, Computacion Y Medicina S.A','89630400-3'),(836,'Paola Arancibia Labra','8965567-6'),(837,'Pehuen Editores S.A','89664800-4'),(838,'Farmacias Cruz  Verde  S.A','89807200-2'),(839,'Ana Maria Espinoza Aravena','8997362-7'),(840,'Carmen Cecilia Contreras Coronado','9004652-9'),(841,'Empresa El Mercurio Sa Periodistica','90193000-7'),(842,'Telefonica Chile S.A','90635000-9'),(843,'David Enrique Godoy Sanchez','9066367-4'),(844,'Juan Esteban Avila Herrera','9066748-3'),(845,'Empresa Editora Zig Zag S.A','90684000-6'),(846,'Copec San Fco De Mostazal','90690000-9'),(847,'Mauricio Alonso Jarife Yoma','9082936-K'),(848,'Lucila Minguzzi Gonzalez','9098581-7'),(849,'Maritza De Las Mercedes Puga Matus','9117686-6'),(850,'Marisol Infante Alcaino','9121179-3'),(851,'Gladys Aroca Soto','9141225-K'),(852,'Lucila Aurora Guzmán Chavez','9160135-4'),(853,'Preunic S.A','91635000-7'),(854,'Nora Del Carmen Cisterna Maturana','9167369-K'),(855,'Alex Lizama Cornejo','9172358-1'),(856,'Ricardo Gonzalo Chelme Bustos','9199609-K'),(857,'Heriberto Cristian Ramirez Castro','9214702-9'),(858,'Erwin Andres Brauning Osses','9221924-0'),(859,'Joaquin Osvaldo Perez Fares','9252790-5'),(860,'Librería Nacional Artel S.A.I.C','92642000-3'),(861,'Jaime Donoso Morales','9275702-1'),(862,'Elena Ferrada Estay','9297178-3'),(863,'Santillana Del Pacifico S.A','93183000-7'),(864,'Productos Alimenticios Santa  Ana S.A','93274000-1'),(865,'Supermercados Montserrat S.A.C.','93307000-K'),(866,'Juan Enrique Cabezas Silva','9344739-5'),(867,'Claudio Silva Flores','9354069-7'),(868,'Raul Taucan Valdivia','9356211-9'),(869,'Ascensores Schindler (Chile) S.A','93565000-3'),(870,'Rosa Maria Bascoli Almendra','9357873-2'),(871,'Andres Vega Alvarado','9403507-4'),(872,'Angel Hernan Cisternas Muñoz','9433259-1'),(873,'Miriam Díaz Verdugo','9436265-2'),(874,'Lilian De Las Mercedes Maulen Ibaceta','9442978-1'),(875,'Jose Miguel Sepulveda Carreño','9455779-8'),(876,'Inversiones Enex S.A','94625000-7'),(877,'Marisol Gonzalez Flores','9494725-1'),(878,'Juan Carlos Pacheco Vivanco','9495234-4'),(879,'Segundo Manuel Ortega Araya','9507718-8'),(880,'Marco Antonio López Muñoz','9516032-8'),(881,'Patricia Gonzalez Menares','9570623-1'),(882,'Empresas Tacoha','95896000-k'),(883,'Margarita Isabel Orellana Cañas','9619867-1'),(884,'Ernesto Marin Valdes','9622686-1'),(885,'Mapfre Compañía De Seguros Generales De Chile','96508210-7'),(886,'Clinica Universidad Catolica S.A','96534960-K'),(887,'Proovedores Integrales Prisa S.A ','96556940-5'),(888,'Comercial Books And Bits','96579290-2'),(889,'Comercial E Importadora Audiomusica Spa','96579920-6'),(890,'Distribuidora Multihogar S.A','96589040-8'),(891,'Alvi S.A','96618540-6'),(892,'My Home S.A','96620000-6'),(893,'Fondo De Cultura Economica Chile S.A','96643240-3'),(894,'Steward S.A','96644100-3'),(895,'Bice Vida Compañía De Seguros S.A','96656410-5'),(896,'Cinemark Chile S.A','96659800-K'),(897,'Tac Communications S.A','96669340-1'),(898,'Bata Chile S.A','96670340-7'),(899,'Dimerc  S.A','96670840-9'),(900,'Ruben Alfredo Gorigoitia Krap','9667194-6'),(901,'Swap Distribución S.A','96674790-0'),(902,'Nike Chile Ltda','96675670-5'),(903,'Cusatto S.A','96689820-8'),(904,'Dictuc S.A','96691330-4'),(905,'Computacion E Ingenieria S.A','96693120-5'),(906,'Ferretería Garachena S.A','96702950-5'),(907,'Manantial S.A','96711590-8'),(908,'ADT Security Services S.A','96719620-7'),(909,'Gtd Telesat S.A','96721280-6'),(910,'Metrogas S.A','96722460-k'),(911,'Editorial Don Bosco S.A','96751940-5'),(912,'Retreta Sociedad Anonima','96772230-8'),(913,'Wei Chile S.A','96775870-1'),(914,'IFX Networks Chile S.A','96779080-k'),(915,'Sodimac  S.A','96792430-K'),(916,'Sherwin Williams Chile S.A','96803460-K'),(917,'Empresa Dmg  S.A','96803690-4'),(918,'Inversiones Y C. Grecka Ltda','96805530-5'),(919,'Entel Pcs Telecomunicaciones S.A','96806980-2'),(920,'Asistencia Y Gestión Internacional S.A','96810060-2'),(921,'Estacionamiento Plaza De Armas','96828560-2'),(922,'Estacionar S.A','96870910-0'),(923,'Ruta Del Maipo Sociedad Concesionaria S.A','96875230-8'),(924,'Melman S.A','96882140-7'),(925,'Cartim S.A','96905980-0'),(926,'Entre Musicos S.A','96908300-0'),(927,'Transportes Italia S.A','96989420-3'),(928,'Asercom Chile  S.A','96993250-4'),(929,'Comercial 33 S.A','96996320-5'),(930,'Kitchen Center Spa','96999930-7'),(931,'Jose Vicente Valdebenito Valenzuela','9705181-K'),(932,'Maria Cecilia Palmira Henriquez Araya','9732210-4'),(933,'Gustavo Adolfo Saldias Martinez','9783415-6'),(934,'Jaime Guillermo Fuentes Paredes','9791559-8'),(935,'Mauricio Alonso Prado Diaz','9794086-K'),(936,'Sergio Patricio Leiva Maldonado','9798470-0'),(937,'Victor Del Carmen Garcia Matus','9812402-0'),(938,'Guillermo Enrique Sierra Herrera','9862134-2'),(939,'Hector Bernardo San Martin Rios','9882846-K'),(940,'Maria Espinoza Carreño','9889580-9'),(941,'Compañía De Seguro Vida Camara','99003000-6'),(942,'Maria Soledad Quiñones Martinez','9906114-6'),(943,'Claudio Ivan Palma Espinola','9906149-9'),(944,'Praxedes Del Carmen Sandoval Toncoso','9911818-0'),(945,'Cecilia Del Carmen Díaz Astorga','9927459-K'),(946,'CGE Distribución S.A','99513400-4'),(947,'Compañía De Petroleos De Chile Copec S.A','99520000-7'),(948,'Saba Estacionamiento De Chile S.A','99554390-7'),(949,'Parque Zoologico Buin Zoo S.A','99555680-4'),(950,'Maigas Comercial S.A','99574340-K'),(951,'Maria Ines Gutierrez Soto','9962556-2'),(952,'Jaime Marcelo Alvarez Cayulef','9975151-7'),(953,'Jose Hernandez Peredo','9990970-6'),(1000,'-','-');
/*!40000 ALTER TABLE `main_app_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_rendicion`
--

DROP TABLE IF EXISTS `main_app_rendicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_rendicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `fecha_subida` datetime NOT NULL,
  `mes_gasto` varchar(100) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `centro_costo_id` int(11) NOT NULL,
  `subvencion_id` int(11) NOT NULL,
  `locked` int(11),
  `tipo_fondo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_rendicion_user_id_id_6755b825_uniq` (`user_id`),
  CONSTRAINT `main_app_rendicion_user_id_53179917_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_rendicion`
--

LOCK TABLES `main_app_rendicion` WRITE;
/*!40000 ALTER TABLE `main_app_rendicion` DISABLE KEYS */;
INSERT INTO `main_app_rendicion` VALUES (1,1,'2017-02-01 00:00:00','enero',300000,1,1,1,1),(2,2,'2001-12-11 00:00:00','enero',1000,1,5,1,1),(3,2,'2017-03-24 00:00:00','abril',125000,4,2,1,2),(4,2,'2017-03-24 00:00:00','abril',125000,4,2,1,2),(5,2,'2017-03-27 00:00:00','abril',1000,2,2,0,3),(6,2,'2017-03-25 00:00:00','diciembre',300000,1,2,0,3),(7,2,'2017-01-11 00:00:00','noviembre',1000,7,4,0,2),(8,2,'2017-04-11 00:00:00','enero',5000,1,1,1,1),(9,1,'2017-05-07 00:00:00','enero',1000,1,1,0,1),(10,2,'2018-05-08 00:00:00','abril',1000000,5,2,1,1),(11,2,'2017-05-23 00:00:00','enero',0,1,1,0,1),(12,2,'2017-07-04 00:00:00','enero',1000,1,4,0,1),(13,2,'2017-05-25 00:00:00','enero',250000,1,2,1,1),(14,3,'2017-05-30 00:00:00','enero',100000,1,1,0,1),(15,3,'2017-05-30 00:00:00','enero',100000,1,1,1,1),(16,4,'2017-05-30 00:00:00','enero',150000,1,1,0,1),(17,4,'2017-05-30 00:00:00','enero',250000,5,1,0,1),(18,6,'2017-06-12 00:00:00','enero',163000,1,4,0,3),(19,6,'2017-08-26 00:00:00','enero',99999,1,1,0,1),(20,1,'2017-07-19 00:00:00','enero',1000,4,1,1,1),(21,2,'2017-08-25 00:00:00','julio',200000,2,1,1,2);
/*!40000 ALTER TABLE `main_app_rendicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_rendicionesfondosdetalles`
--

DROP TABLE IF EXISTS `main_app_rendicionesfondosdetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_rendicionesfondosdetalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fondos_detalles_id` int(11) NOT NULL,
  `rendicion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_rendicionesfondosdetalles`
--

LOCK TABLES `main_app_rendicionesfondosdetalles` WRITE;
/*!40000 ALTER TABLE `main_app_rendicionesfondosdetalles` DISABLE KEYS */;
INSERT INTO `main_app_rendicionesfondosdetalles` VALUES (1,1,5),(2,2,5);
/*!40000 ALTER TABLE `main_app_rendicionesfondosdetalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_rendicionesgastodetalles`
--

DROP TABLE IF EXISTS `main_app_rendicionesgastodetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_rendicionesgastodetalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gastos_detalles_id` int(11) NOT NULL,
  `rendicion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_rendicionesgastodetalles`
--

LOCK TABLES `main_app_rendicionesgastodetalles` WRITE;
/*!40000 ALTER TABLE `main_app_rendicionesgastodetalles` DISABLE KEYS */;
INSERT INTO `main_app_rendicionesgastodetalles` VALUES (2,2,4),(13,14,8),(51,52,5),(74,75,10),(78,79,10),(85,86,1),(92,93,3),(94,95,13),(95,96,2),(96,97,12),(97,98,1),(98,99,14),(99,100,16),(100,101,11),(101,102,9),(102,103,20),(103,104,21);
/*!40000 ALTER TABLE `main_app_rendicionesgastodetalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_subcategoria`
--

DROP TABLE IF EXISTS `main_app_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_subcategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_subcategoria`
--

LOCK TABLES `main_app_subcategoria` WRITE;
/*!40000 ALTER TABLE `main_app_subcategoria` DISABLE KEYS */;
INSERT INTO `main_app_subcategoria` VALUES (1,'410502','PERFECCIONAMIENTO Y CAPACITACION DE RRHH',1),(2,'410601','IMPLEMENTOS DE LABORATORIO',2),(3,'410602','IMPLEMENTOS DEPORTIVOS',2),(4,'410603','INSTRUMENTOS MUSICALES Y ARTISTICOS',2),(5,'410604','RECURSOS AUDIOVISUALES Y SOFTWARE EDUCATIVO',2),(6,'410605','MATERIAL Y RECURSOS DIDACTICOS',2),(7,'410606','BIBLIOTECAS, LIBROS Y REVISTAS',2),(8,'410607','EVENTOS EDUCATIVOS Y CULTURALES',2),(9,'410608','INSTRUMENTOS DE EVALUACION DIAGNOSTICA',2),(10,'410609','OTROS GASTOS EN RECURSOS DE APRENDIZAJE',2),(11,'410701','EQUIPOS DE FOTOGAFIA Y FILMACION',3),(12,'410702','PIZARRAS INTERACTIVAS',3),(13,'410703','EQUIPOS INFORMATICOS',3),(14,'410704','EQUIPOS REPRODUCTORES DE IMAGEN',3),(15,'410705','EQUIPOS MULTICOPIADORES',3),(16,'410706','EQUIPOS DE AMPLIFICACION Y SONIDO',3),(17,'410707','OTROS GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',3),(18,'410801','UNIFORMES Y VESTUARIO',4),(19,'410802','OTROS GASTO BIENESTAR ALUMNOS',4),(20,'410803','TALLERES DEPORTIVOS',4),(21,'410806','ÚTILES ESCOLARES',4),(22,'410901','TRANSPORTE ESCOLAR',5),(23,'410902','MATERIALES DE OFICINA',5),(24,'410903','REPRODUCCION DE DOCUMENTOS',5),(25,'410904','ALIMENTACION',5),(26,'410905','INSUMOS COMPUTACIONALES',5),(27,'410906','COMBUSTIBLES Y PEAJES',5),(28,'410907','MATERIALES Y UTILES DE ASEO',5),(29,'410908','PUBLICIDAD',5),(30,'410909','PASAJES',5),(31,'410910','OTROS GASTOS DE OPERACIÓN',5),(32,'411001','INTERNET',6),(33,'411002','AGUA',6),(34,'411003','GAS',6),(35,'411004','ELECTRICIDAD',6),(36,'411005','SERVICIO DE CORRESPONDENCIA (CORREOS)',6),(37,'411006','TELEFONIA (MOVIL Y FIJA)',6),(38,'411007','CALEFACCION',6),(39,'411008','OTROS GASTOS EN SERVICIOS BASICOS',6),(40,'411101','CONTRATACION SERVICIOS ASEO Y JARDINERIA',7),(41,'411102','CONTRATACION SERVICIOS DE SEGURIDAD',7),(42,'411103','CONTRATACION OTROS SERVICIOS EXTERNOS',7),(43,'411401','ARRIENDO DE LOCAL ESCOLAR',8),(44,'411403','ARRIENDO DE OTROS BIENES INMUEBLES',8),(45,'411501','ARRIENDO DE EQUIPOS INFORMATICOS',9),(46,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',9),(47,'411503','ARRIENDO DE MOBILIARIOS',9),(48,'411504','ARRIENDO DE OTROS BIENES MUEBLES',9),(49,'411601','MANTENCION Y REPARACION DE INFRAESTRUCTURA',10),(50,'411602','CONSTRUCCION DE INFRAESTRUCTURA (OBRA GRUESA)',10),(51,'411603','TERMINACIONES DE INFRAESTRUCTURA',10),(52,'411604','INSTALACIONES ELECTRICAS E ILUMINACION',10),(53,'411605','INSTALACION DE GAS',10),(54,'411606','INSTALACION DE AGUA',10),(55,'411607','ALCANTARILLADOS O POZOS SEPTICOS',10),(56,'411608','CIERRES PERIMETRALES Y OBRAS COMPLEMENTARIAS',10),(57,'411609','SERVICIOS HIGIENICOS',10),(58,'411610','ELIMINACION DE BARRERAS ARQUITECTONICAS DE MENOR ENVERGADURA',10),(59,'411701','MANTENCION Y REPARACION DE BIENES MUEBLES',11),(60,'411702','REPUESTOS, MANTENIMIENTO Y REPARACION DE VEHICULOS',11),(61,'411703','MANTENCION Y REPARACION DE EQUIPOS COMPUTACIONALES',11),(62,'411704','MANTENCION Y REPARACION DE MOBILIARIO ESCOLAR',11),(63,'411705','MANTENCION Y REPARACION DE MAQUINAS DE OFICINA',11),(64,'411801','ADQUISICION DE BIENES INMUEBLES',12),(65,'411802','ADQUISICION DE MOBILIARIO',12),(66,'411803','VEHICULO',12),(67,'411804','ADQUISICION DE OTROS BIENES MUEBLES NO PEDAGOGICOS',12),(68,'410502','PERFECCIONAMIENTO Y CAPACITACION DE RRHH',13),(69,'410902','MATERIALES DE OFICINA',14),(70,'410903','REPRODUCCION DE DOCUMENTOS',14),(71,'410904','ALIMENTACION',14),(72,'410905','INSUMOS COMPUTACIONALES',14),(73,'410906','COMBUSTIBLES Y PEAJES',14),(74,'410907','MATERIALES Y UTILES DE ASEO',14),(75,'410908','PUBLICIDAD',14),(76,'410909','PASAJES',14),(77,'410910','OTROS GASTOS DE OPERACIÓN',14),(78,'411001','INTERNET',15),(79,'411002','AGUA',15),(80,'411003','GAS',15),(81,'411004','ELECTRICIDAD',15),(82,'411005','SERVICIO DE CORRESPONDENCIA (CORREOS)',15),(83,'411006','TELEFONIA (MOVIL Y FIJA)',15),(84,'411007','CALEFACCION',15),(85,'411008','OTROS GASTOS EN SERVICIOS BASICOS',15),(86,'411101','CONTRATACION SERVICIOS ASEO Y JARDINERIA',16),(87,'411102','CONTRATACION SERVICIOS DE SEGURIDAD',16),(88,'411103','CONTRATACION OTROS SERVICIOS EXTERNOS',16),(89,'411501','ARRIENDO DE EQUIPOS INFORMATICOS',17),(90,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',17),(91,'411503','ARRIENDO DE MOBILIARIOS',17),(92,'411504','ARRIENDO DE OTROS BIENES MUEBLES',17),(93,'411601','MANTENCION Y REPARACION DE INFRAESTRUCTURA',18),(94,'411602','CONSTRUCCION DE INFRAESTRUCTURA (OBRA GRUESA)',18),(95,'411603','TERMINACIONES DE INFRAESTRUCTURA',18),(96,'411604','INSTALACIONES ELECTRICAS E ILUMINACION',18),(97,'411605','INSTALACION DE GAS',18),(98,'411606','INSTALACION DE AGUA',18),(99,'411607','ALCANTARILLADOS O POZOS SEPTICOS',18),(100,'411608','CIERRES PERIMETRALES Y OBRAS COMPLEMENTARIAS',18),(101,'411609','SERVICIOS HIGIENICOS',18),(102,'411610','ELIMINACION DE BARRERAS ARQUITECTONICAS DE MENOR ENVERGADURA',18),(103,'411701','MANTENCION Y REPARACION DE BIENES MUEBLES',19),(104,'411702','REPUESTOS, MANTENIMIENTO Y REPARACION DE VEHICULOS',19),(105,'411703','MANTENCION Y REPARACION DE EQUIPOS COMPUTACIONALES',19),(106,'411705','MANTENCION Y REPARACION DE MAQUINAS DE OFICINA',19),(107,'411802','ADQUISICION DE MOBILIARIO',20),(108,'411803','VEHICULO',20),(109,'411804','ADQUISICION DE OTROS BIENES MUEBLES NO PEDAGOGICOS',20),(110,'410501','ASESORIA TECNICA Y CAPACITACION (ATE)',21),(111,'410601','IMPLEMENTOS DE LABORATORIO',22),(112,'410602','IMPLEMENTOS DEPORTIVOS',22),(113,'410603','INSTRUMENTOS MUSICALES Y ARTISTICOS',22),(114,'410604','RECURSOS AUDIOVISUALES Y SOFTWARE EDUCATIVO',22),(115,'410605','MATERIAL Y RECURSOS DIDACTICOS',22),(116,'410606','BIBLIOTECAS, LIBROS Y REVISTAS',22),(117,'410607','EVENTOS EDUCATIVOS Y CULTURALES',22),(118,'410608','INSTRUMENTOS DE EVALUACION DIAGNOSTICA',22),(119,'410609','OTROS GASTOS EN RECURSOS DE APRENDIZAJE',22),(120,'410701','EQUIPOS DE FOTOGAFIA Y FILMACION',23),(121,'410702','PIZARRAS INTERACTIVAS',23),(122,'410703','EQUIPOS INFORMATICOS',23),(123,'410704','EQUIPOS REPRODUCTORES DE IMAGEN',23),(124,'410705','EQUIPOS MULTICOPIADORES',23),(125,'410706','EQUIPOS DE AMPLIFICACION Y SONIDO',23),(126,'410707','OTROS GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',23),(127,'410801','UNIFORMES Y VESTUARIO',24),(128,'410802','OTROS GASTO BIENESTAR ALUMNOS',24),(129,'410803','TALLERES DEPORTIVOS',24),(130,'410806','ÚTILES ESCOLARES',24),(131,'410901','TRANSPORTE ESCOLAR',25),(132,'410902','MATERIALES DE OFICINA',25),(133,'410903','REPRODUCCION DE DOCUMENTOS',25),(134,'410904','ALIMENTACION',25),(135,'410905','INSUMOS COMPUTACIONALES',25),(136,'410906','COMBUSTIBLES Y PEAJES',25),(137,'410909','PASAJES',25),(138,'410910','OTROS GASTOS DE OPERACIÓN',25),(139,'411001','INTERNET',26),(140,'411103','CONTRATACION OTROS SERVICIOS EXTERNOS',27),(141,'411401','ARRIENDO DE LOCAL ESCOLAR',28),(142,'411403','ARRIENDO DE OTROS BIENES INMUEBLES',28),(143,'411501','ARRIENDO DE EQUIPOS INFORMATICOS',29),(144,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',29),(145,'411503','ARRIENDO DE MOBILIARIOS',29),(146,'411504','ARRIENDO DE OTROS BIENES MUEBLES',29),(147,'411802','ADQUISICION DE MOBILIARIO',30),(148,'410501','ASESORIA TECNICA Y CAPACITACION (ATE)',31),(149,'410703','EQUIPOS INFORMATICOS',32),(150,'410901','TRANSPORTE ESCOLAR',33),(151,'410902','MATERIALES DE OFICINA',33),(152,'410903','REPRODUCCION DE DOCUMENTOS',33),(153,'410905','INSUMOS COMPUTACIONALES',33),(154,'410906','COMBUSTIBLES Y PEAJES',33),(155,'410909','PASAJES',33),(156,'410910','OTROS GASTOS DE OPERACIÓN',33),(157,'411001','INTERNET',34),(158,'411501','ARRIENDO DE EQUIPOS INFORMATICOS',35),(159,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',35),(160,'411503','ARRIENDO DE MOBILIARIOS',35),(161,'411504','ARRIENDO DE OTROS BIENES MUEBLES',35),(162,'411802','ADQUISICION DE MOBILIARIO',36),(163,'410502','PERFECCIONAMIENTO Y CAPACITACION DE RRHH',37),(164,'410604','RECURSOS AUDIOVISUALES Y SOFTWARE EDUCATIVO',38),(165,'410605','MATERIAL Y RECURSOS DIDACTICOS',38),(166,'410606','BIBLIOTECAS, LIBROS Y REVISTAS',38),(167,'410607','EVENTOS EDUCATIVOS Y CULTURALES',38),(168,'410608','INSTRUMENTOS DE EVALUACION DIAGNOSTICA',38),(169,'410609','OTROS GASTOS EN RECURSOS DE APRENDIZAJE',38),(170,'410701','EQUIPOS DE FOTOGAFIA Y FILMACION',39),(171,'410702','PIZARRAS INTERACTIVAS',39),(172,'410703','EQUIPOS INFORMATICOS',39),(173,'410704','EQUIPOS REPRODUCTORES DE IMAGEN',39),(174,'410705','EQUIPOS MULTICOPIADORES',39),(175,'410706','EQUIPOS DE AMPLIFICACION Y SONIDO',39),(176,'410707','OTROS GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',39),(177,'410804','CONSULTAS MEDICAS',40),(178,'410901','TRANSPORTE ESCOLAR',41),(179,'410902','MATERIALES DE OFICINA',41),(180,'410903','REPRODUCCION DE DOCUMENTOS',41),(181,'410905','INSUMOS COMPUTACIONALES',41),(182,'410909','PASAJES',41),(183,'410910','OTROS GASTOS DE OPERACIÓN',41),(184,'411103','CONTRATACION OTROS SERVICIOS EXTERNOS',42),(185,'411501','ARRIENDO DE EQUIPOS INFORMATICOS',43),(186,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',43),(187,'411503','ARRIENDO DE MOBILIARIOS',43),(188,'411504','ARRIENDO DE OTROS BIENES MUEBLES',43),(189,'411610','ELIMINACION DE BARRERAS ARQUITECTONICAS DE MENOR ENVERGADURA',44),(190,'410601','IMPLEMENTOS DE LABORATORIO',45),(191,'410602','IMPLEMENTOS DEPORTIVOS',45),(192,'410603','INSTRUMENTOS MUSICALES Y ARTISTICOS',45),(193,'410604','RECURSOS AUDIOVISUALES Y SOFTWARE EDUCATIVO',45),(194,'410701','EQUIPOS DE FOTOGAFIA Y FILMACION',46),(195,'410702','PIZARRAS INTERACTIVAS',46),(196,'410703','EQUIPOS INFORMATICOS',46),(197,'410704','EQUIPOS REPRODUCTORES DE IMAGEN',46),(198,'410705','EQUIPOS MULTICOPIADORES',46),(199,'410706','EQUIPOS DE AMPLIFICACION Y SONIDO',46),(200,'410707','OTROS GASTOS EN EQUIPAMIENTO DE APOYO PEDAGOGICO',46),(201,'411502','ARRIENDO DE MAQUINARIAS Y EQUIPOS',47),(202,'411601','MANTENCION Y REPARACION DE INFRAESTRUCTURA',48),(203,'411602','CONSTRUCCION DE INFRAESTRUCTURA (OBRA GRUESA)',48),(204,'411603','TERMINACIONES DE INFRAESTRUCTURA',48),(205,'411604','INSTALACIONES ELECTRICAS E ILUMINACION',48),(206,'411605','INSTALACION DE GAS',48),(207,'411606','INSTALACION DE AGUA',48),(208,'411607','ALCANTARILLADOS O POZOS SEPTICOS',48),(209,'411608','CIERRES PERIMETRALES Y OBRAS COMPLEMENTARIAS',48),(210,'411609','SERVICIOS HIGIENICOS',48),(211,'411610','ELIMINACION DE BARRERAS ARQUITECTONICAS DE MENOR ENVERGADURA',48),(212,'411701','MANTENCION Y REPARACION DE BIENES MUEBLES',49),(213,'411703','MANTENCION Y REPARACION DE EQUIPOS COMPUTACIONALES',49),(214,'411704','MANTENCION Y REPARACION DE MOBILIARIO ESCOLAR',49),(215,'411705','MANTENCION Y REPARACION DE MAQUINAS DE OFICINA',49),(216,'410601','IMPLEMENTOS DE LABORATORIO',50),(217,'410602','IMPLEMENTOS DEPORTIVOS',50),(218,'410603','INSTRUMENTOS MUSICALES Y ARTISTICOS',50),(219,'410604','RECURSOS AUDIOVISUALES Y SOFTWARE EDUCATIVO',50),(220,'410605','MATERIAL Y RECURSOS DIDACTICOS',50),(221,'410606','BIBLIOTECAS, LIBROS Y REVISTAS',50),(222,'410607','EVENTOS EDUCATIVOS Y CULTURALES',50),(223,'410608','INSTRUMENTOS DE EVALUACION DIAGNOSTICA',50),(224,'410609','OTROS GASTOS EN RECURSOS DE APRENDIZAJE',50),(225,'410801','UNIFORMES Y VESTUARIO',51),(226,'410802','OTROS GASTO BIENESTAR ALUMNOS',51),(227,'410803','TALLERES DEPORTIVOS',51),(228,'410804','CONSULTAS MEDICAS',51),(229,'410805','APOYO AL ESTUDIANTE',51),(230,'410806','ÚTILES ESCOLARES',51),(231,'410901','TRANSPORTE ESCOLAR',52),(232,'410904','ALIMENTACION',52),(233,'411103','CONTRATACION OTROS SERVICIOS EXTERNOS',53),(234,'000000','-',55);
/*!40000 ALTER TABLE `main_app_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_subvencion`
--

DROP TABLE IF EXISTS `main_app_subvencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_subvencion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_subvencion`
--

LOCK TABLES `main_app_subvencion` WRITE;
/*!40000 ALTER TABLE `main_app_subvencion` DISABLE KEYS */;
INSERT INTO `main_app_subvencion` VALUES (1,'General'),(2,'SEP'),(3,'PIE'),(4,'PRORETENCION'),(5,'MANTENIMIENTO'),(6,'DONACION'),(7,'GENERAl GERENCIA'),(8,'SEP GERENCIA'),(9,'-');
/*!40000 ALTER TABLE `main_app_subvencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_tipofondo`
--

DROP TABLE IF EXISTS `main_app_tipofondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_tipofondo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_tipofondo`
--

LOCK TABLES `main_app_tipofondo` WRITE;
/*!40000 ALTER TABLE `main_app_tipofondo` DISABLE KEYS */;
INSERT INTO `main_app_tipofondo` VALUES (1,'adicional'),(2,'fijo'),(3,'reembolso');
/*!40000 ALTER TABLE `main_app_tipofondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_tipoformapago`
--

DROP TABLE IF EXISTS `main_app_tipoformapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_tipoformapago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_tipoformapago`
--

LOCK TABLES `main_app_tipoformapago` WRITE;
/*!40000 ALTER TABLE `main_app_tipoformapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_app_tipoformapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_userscentrocostos`
--

DROP TABLE IF EXISTS `main_app_userscentrocostos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_userscentrocostos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `centro_costo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_userscentrocostos_user_id_id_1106e2b5_uniq` (`user_id`),
  CONSTRAINT `main_app_userscentrocostos_user_id_85a4f9da_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_userscentrocostos`
--

LOCK TABLES `main_app_userscentrocostos` WRITE;
/*!40000 ALTER TABLE `main_app_userscentrocostos` DISABLE KEYS */;
INSERT INTO `main_app_userscentrocostos` VALUES (1,2,1),(2,2,2),(3,2,3),(4,1,1),(5,1,2),(6,1,3),(7,1,4),(8,1,5),(9,1,6),(10,1,7),(11,6,1),(12,6,2),(13,6,3),(14,6,4),(15,6,5),(16,6,6),(17,6,7);
/*!40000 ALTER TABLE `main_app_userscentrocostos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-12 14:18:03

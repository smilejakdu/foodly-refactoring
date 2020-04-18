-- MySQL dump 10.13  Distrib 8.0.19, for osx10.15 (x86_64)
--
-- Host: wecode-project.cp1i5dvyndvo.ap-northeast-2.rds.amazonaws.com    Database: rdsfoodly
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `postcode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_postcode_id_f79026e1_fk_postcodes_id` (`postcode_id`),
  CONSTRAINT `addresses_postcode_id_f79026e1_fk_postcodes_id` FOREIGN KEY (`postcode_id`) REFERENCES `postcodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bundle',7,'add_bundle'),(26,'Can change bundle',7,'change_bundle'),(27,'Can delete bundle',7,'delete_bundle'),(28,'Can view bundle',7,'view_bundle'),(29,'Can add harvest year',8,'add_harvestyear'),(30,'Can change harvest year',8,'change_harvestyear'),(31,'Can delete harvest year',8,'delete_harvestyear'),(32,'Can view harvest year',8,'view_harvestyear'),(33,'Can add keyword',9,'add_keyword'),(34,'Can change keyword',9,'change_keyword'),(35,'Can delete keyword',9,'delete_keyword'),(36,'Can view keyword',9,'view_keyword'),(37,'Can add measure',10,'add_measure'),(38,'Can change measure',10,'change_measure'),(39,'Can delete measure',10,'delete_measure'),(40,'Can view measure',10,'view_measure'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add recipe',12,'add_recipe'),(46,'Can change recipe',12,'change_recipe'),(47,'Can delete recipe',12,'delete_recipe'),(48,'Can view recipe',12,'view_recipe'),(49,'Can add recommendation',13,'add_recommendation'),(50,'Can change recommendation',13,'change_recommendation'),(51,'Can delete recommendation',13,'delete_recommendation'),(52,'Can view recommendation',13,'view_recommendation'),(53,'Can add similar product',14,'add_similarproduct'),(54,'Can change similar product',14,'change_similarproduct'),(55,'Can delete similar product',14,'delete_similarproduct'),(56,'Can view similar product',14,'view_similarproduct'),(57,'Can add recipe recommendation',15,'add_reciperecommendation'),(58,'Can change recipe recommendation',15,'change_reciperecommendation'),(59,'Can delete recipe recommendation',15,'delete_reciperecommendation'),(60,'Can view recipe recommendation',15,'view_reciperecommendation'),(61,'Can add recipe keyword',16,'add_recipekeyword'),(62,'Can change recipe keyword',16,'change_recipekeyword'),(63,'Can delete recipe keyword',16,'delete_recipekeyword'),(64,'Can view recipe keyword',16,'view_recipekeyword'),(65,'Can add product bundle',17,'add_productbundle'),(66,'Can change product bundle',17,'change_productbundle'),(67,'Can delete product bundle',17,'delete_productbundle'),(68,'Can view product bundle',17,'view_productbundle'),(69,'Can add category',18,'add_category'),(70,'Can change category',18,'change_category'),(71,'Can delete category',18,'delete_category'),(72,'Can view category',18,'view_category'),(73,'Can add product category',19,'add_productcategory'),(74,'Can change product category',19,'change_productcategory'),(75,'Can delete product category',19,'delete_productcategory'),(76,'Can view product category',19,'view_productcategory'),(77,'Can add sort',20,'add_sort'),(78,'Can change sort',20,'change_sort'),(79,'Can delete sort',20,'delete_sort'),(80,'Can view sort',20,'view_sort'),(81,'Can add season',21,'add_season'),(82,'Can change season',21,'change_season'),(83,'Can delete season',21,'delete_season'),(84,'Can view season',21,'view_season');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_addresses`
--

DROP TABLE IF EXISTS `billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` int(11) NOT NULL,
  `is_shipping_address` tinyint(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address_1` varchar(200) NOT NULL,
  `address_2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_addresses`
--

LOCK TABLES `billing_addresses` WRITE;
/*!40000 ALTER TABLE `billing_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles`
--

DROP TABLE IF EXISTS `bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  `is_in_promotion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles`
--

LOCK TABLES `bundles` WRITE;
/*!40000 ALTER TABLE `bundles` DISABLE KEYS */;
INSERT INTO `bundles` VALUES (1,'Berrissimo Pack!','$10.34',1),(2,'Jam It Suit!','$9.68',1),(3,'Pasta Mia Bag!','$27.34',1);
/*!40000 ALTER TABLE `bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` int(11) NOT NULL,
  `card_type` varchar(45) NOT NULL,
  `card_holder` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `expiration_year` varchar(10) NOT NULL,
  `expiration_month` varchar(10) NOT NULL,
  `cvv` int(11) NOT NULL,
  `payment_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `order_id` char(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `image_url` varchar(2000) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Fresh','http://cdn.shopify.com/s/files/1/1148/3974/collections/collection_02_fresh_large.png?v=1455202997','You’ll find here a lot of delightful vegtables & fruits that were harvested and are waiting to serve you'),(2,'Frozen','https://cdn.shopify.com/s/files/1/1148/3974/collections/collection_03_frozen_large.png?v=1455263893','Look through fruits & vegetables that are saved for later due to the'),(3,'Dried','https://cdn.shopify.com/s/files/1/1148/3974/collections/collection_04_dried_large.png?v=1455263955','We transform herbs, fruits & vegetables from fresh to'),(4,'Liquid','https://cdn.shopify.com/s/files/1/1148/3974/collections/collection_05_liquid_large.png?v=1455263995','Almost every cooking requires some oil or sauses in the kitchen. We got you covered here with specially crafted'),(5,'sale','https://cdn.shopify.com/s/files/1/1148/3974/collections/collection_06_sale_large.png?v=1456211951',NULL),(6,'Specials',NULL,NULL),(7,'Cooked',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(45) DEFAULT NULL,
  `discount_rate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (32,'account','address'),(33,'account','postcode'),(30,'account','user'),(31,'account','user_address'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(22,'order','billingaddress'),(29,'order','card'),(28,'order','cart'),(23,'order','coupon'),(27,'order','order'),(24,'order','packagetype'),(25,'order','paymentoption'),(26,'order','wishlist'),(7,'products','bundle'),(18,'products','category'),(8,'products','harvestyear'),(9,'products','keyword'),(10,'products','measure'),(11,'products','product'),(17,'products','productbundle'),(19,'products','productcategory'),(12,'products','recipe'),(16,'products','recipekeyword'),(15,'products','reciperecommendation'),(13,'products','recommendation'),(21,'products','season'),(14,'products','similarproduct'),(20,'products','sort'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-28 16:44:34.185252'),(2,'auth','0001_initial','2020-02-28 16:44:34.545330'),(3,'admin','0001_initial','2020-02-28 16:44:35.569272'),(4,'admin','0002_logentry_remove_auto_add','2020-02-28 16:44:35.825212'),(5,'admin','0003_logentry_add_action_flag_choices','2020-02-28 16:44:35.842538'),(6,'contenttypes','0002_remove_content_type_name','2020-02-28 16:44:36.052379'),(7,'auth','0002_alter_permission_name_max_length','2020-02-28 16:44:36.177699'),(8,'auth','0003_alter_user_email_max_length','2020-02-28 16:44:36.236725'),(9,'auth','0004_alter_user_username_opts','2020-02-28 16:44:36.254487'),(10,'auth','0005_alter_user_last_login_null','2020-02-28 16:44:36.358731'),(11,'auth','0006_require_contenttypes_0002','2020-02-28 16:44:36.368763'),(12,'auth','0007_alter_validators_add_error_messages','2020-02-28 16:44:36.393963'),(13,'auth','0008_alter_user_username_max_length','2020-02-28 16:44:36.527782'),(14,'auth','0009_alter_user_last_name_max_length','2020-02-28 16:44:36.673719'),(15,'auth','0010_alter_group_name_max_length','2020-02-28 16:44:36.723710'),(16,'auth','0011_update_proxy_permissions','2020-02-28 16:44:36.739206'),(17,'products','0001_initial','2020-02-28 16:44:37.801772'),(18,'sessions','0001_initial','2020-02-28 16:44:38.851997'),(19,'products','0002_auto_20200228_2345','2020-02-28 23:45:24.145056'),(20,'products','0003_auto_20200229_0646','2020-02-29 06:46:26.275381'),(21,'products','0004_auto_20200229_1255','2020-02-29 12:56:14.731685'),(22,'products','0005_auto_20200302_0827','2020-03-02 08:27:14.829648'),(23,'products','0006_auto_20200302_0847','2020-03-02 08:48:04.544276'),(24,'products','0007_auto_20200302_1141','2020-03-02 11:41:43.836902'),(25,'products','0008_auto_20200302_1349','2020-03-02 13:55:09.228679'),(26,'products','0009_auto_20200303_0728','2020-03-03 07:28:22.632774'),(27,'products','0010_auto_20200303_0810','2020-03-03 08:11:03.336305'),(28,'products','0011_product_is_main','2020-03-03 08:51:27.634657'),(29,'order','0001_initial','2020-03-04 23:54:57.400580'),(30,'account','0001_initial','2020-03-05 04:42:06.978269');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_years`
--

DROP TABLE IF EXISTS `harvest_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harvest_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_years`
--

LOCK TABLES `harvest_years` WRITE;
/*!40000 ALTER TABLE `harvest_years` DISABLE KEYS */;
INSERT INTO `harvest_years` VALUES (1,'2014'),(2,'2015'),(3,'2016');
/*!40000 ALTER TABLE `harvest_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (1,'lb'),(2,'oz'),(3,'bunch'),(4,'kg'),(5,'g'),(6,'pint'),(7,'unit'),(8,'red');
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `package_type_id` int(11) NOT NULL,
  `payment_option_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_types`
--

DROP TABLE IF EXISTS `package_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `price` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_types`
--

LOCK TABLES `package_types` WRITE;
/*!40000 ALTER TABLE `package_types` DISABLE KEYS */;
INSERT INTO `package_types` VALUES (1,'paper bag',0.00),(2,'wooden box',3.00);
/*!40000 ALTER TABLE `package_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_options`
--

DROP TABLE IF EXISTS `payment_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_options`
--

LOCK TABLES `payment_options` WRITE;
/*!40000 ALTER TABLE `payment_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` varchar(45) NOT NULL,
  `shipping_cost` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcodes`
--

LOCK TABLES `postcodes` WRITE;
/*!40000 ALTER TABLE `postcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `postcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundles`
--

DROP TABLE IF EXISTS `product_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundles_bundle_id_ee21ee44_fk_bundles_id` (`bundle_id`),
  KEY `product_bundles_product_id_a07954e7_fk_products_id` (`product_id`),
  CONSTRAINT `product_bundles_bundle_id_ee21ee44_fk_bundles_id` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`),
  CONSTRAINT `product_bundles_product_id_a07954e7_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundles`
--

LOCK TABLES `product_bundles` WRITE;
/*!40000 ALTER TABLE `product_bundles` DISABLE KEYS */;
INSERT INTO `product_bundles` VALUES (1,1,34),(2,1,34),(3,1,42),(4,1,42),(5,2,32),(6,2,32),(7,2,43),(8,2,43),(9,3,8),(10,3,8),(11,3,8),(12,3,8),(13,3,7),(14,3,7),(15,3,19);
/*!40000 ALTER TABLE `product_bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_category_id_127e9bb3_fk_categories_id` (`category_id`),
  KEY `product_categories_product_id_8862397f_fk_products_id` (`product_id`),
  CONSTRAINT `product_categories_category_id_127e9bb3_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_categories_product_id_8862397f_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,1,5),(2,1,8),(3,1,10),(4,1,11),(5,1,12),(6,1,13),(7,1,14),(8,1,16),(9,1,17),(10,1,19),(11,1,20),(12,1,21),(13,1,22),(14,1,23),(15,1,25),(16,1,27),(17,1,31),(18,1,33),(19,1,35),(20,1,41),(21,1,42),(22,1,43),(23,2,44),(24,1,47),(25,3,5),(26,3,31),(27,3,34),(28,3,40),(29,3,48),(30,7,5),(31,3,24),(32,3,30),(33,6,31),(34,3,33),(35,3,38),(36,3,39),(37,6,40),(38,3,45),(39,3,48),(40,4,3),(41,4,4),(42,4,7),(43,4,14),(44,4,16),(45,4,23),(46,4,25),(47,4,28),(48,4,29),(49,4,32),(50,4,36),(52,4,48),(53,5,8),(54,5,10),(55,5,40),(56,5,47),(57,6,10),(58,6,46),(59,6,47),(60,7,45),(61,7,49),(62,7,50);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `small_image` varchar(2000) DEFAULT NULL,
  `big_image1` varchar(2000) DEFAULT NULL,
  `energy` varchar(10) DEFAULT NULL,
  `carbonydrate` varchar(10) DEFAULT NULL,
  `protein` varchar(10) DEFAULT NULL,
  `fat` varchar(10) DEFAULT NULL,
  `mineral` varchar(100) DEFAULT NULL,
  `vitamin` varchar(100) DEFAULT NULL,
  `is_in_stock` varchar(30) DEFAULT NULL,
  `is_on_sale` tinyint(1) NOT NULL,
  `harvest_year_id` int(11) DEFAULT NULL,
  `measure_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `big_image2` varchar(2000) DEFAULT NULL,
  `big_image3` varchar(2000) DEFAULT NULL,
  `discount_rate` varchar(50) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `products_harvest_year_id_5e9dadf8_fk_harvest_years_id` (`harvest_year_id`),
  KEY `products_measure_id_425e7567_fk_measures_id` (`measure_id`),
  KEY `products_recipe_id_37652bef_fk_recipes_id` (`recipe_id`),
  KEY `products_season_id_98c8bbe1_fk_products_season_id` (`season_id`),
  CONSTRAINT `products_harvest_year_id_5e9dadf8_fk_harvest_years_id` FOREIGN KEY (`harvest_year_id`) REFERENCES `harvest_years` (`id`),
  CONSTRAINT `products_measure_id_425e7567_fk_measures_id` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `products_recipe_id_37652bef_fk_recipes_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `products_season_id_98c8bbe1_fk_products_season_id` FOREIGN KEY (`season_id`) REFERENCES `products_season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Asparagus',2.00,' Asparagus is a nutrient-dense food that is high in folic acid and is also a good source of potassium, fiber, vitamin B6, vitamins A and vitamin C, and thiamine. Extensive research into asparagus nutrition has resulted in this funny-looking vegetable being ranked among the top fruits and vegetables for its ability to reduce the effect of cell-damaging free radicals. ','https://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_grande.jpg?v=1473487320','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','20 kcal','4 g','2 g','0 g','Ca','c','1',0,1,1,1,'','','',5,0),(2,'Avocado',3.00,' Avocados are commercially valuable and are cultivated in tropical and Mediterranean climates throughout the world.[3] They have a green-skinned, fleshy body that may be pear-shaped, egg-shaped, or spherical. Commercially, they ripen after harvesting. Avocado trees are partially self-pollinating and often are propagated through grafting to maintain a predictable quality and quantity of the fruit. ','https://cdn.shopify.com/s/files/1/1148/3974/products/avocado_grande.jpg?v=1476190534','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','20kcal','9g','1g','8g','Zn','c','1',0,3,1,1,'','','',6,0),(3,'Balsamic Vinegar',3.48,' Description Local Balsamiq Vinegar tastes like real vinegar imported from Italy, but less expensive and taste with native flavour. It works well in a salad mixed with extra virgin olive oil. Put it on lettuce or a tomato slice and give it a try with crisp toast! ','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar_grande.jpeg?v=1456211029','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar.jpeg?v=1456211029','30 kcal','10 g','1.2g','1g','Mg','a','1',0,1,1,1,'https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar-single.jpeg?v=1456211029','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar-and-tomatoes.jpeg?v=1456211029','',NULL,1),(4,'Balsamic Vinegar 2015',3.48,' Description Local Balsamiq Vinegar tastes like real vinegar imported from Italy, but less expensive and taste with native flavour. It works well in a salad mixed with extra virgin olive oil. Put it on lettuce or a tomato slice and give it a try with crisp toast! ','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar_39f87480-3235-407b-a2e6-4fe718fde5ff_grande.jpeg?v=1456211000','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar_39f87480-3235-407b-a2e6-4fe718fde5ff.jpeg?v=1456211000','20 kcal','10 g','2 g','4g','P','r','1',0,2,2,1,'https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar-single_51e52c69-100f-41e2-b823-0c8480101143.jpeg?v=1456211000','https://cdn.shopify.com/s/files/1/1148/3974/products/Vinegar-and-tomatoes_c3c532ba-8857-4e2f-95d6-a27153a068d2.jpeg?v=1456211000','',NULL,0),(5,'Basil',2.29,' Description Basil is a well-known name for the culinary herb. Would like to make your pizza or salad smell and taste differently and intriguing, basil will manage this task. This is a \"king of herbs\" by many cookery authors, so don\'t pass by and join the credible community. Basil is most commonly used fresh in cooked recipes. In general, it is added at the last moment, as cooking quickly destroys the flavor. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Basil_grande.jpeg?v=1456211118','https://cdn.shopify.com/s/files/1/1148/3974/products/Basil.jpeg?v=1456211118','22Kcal','2.65g','0.64g','3.15g',' Ca Fe Zn Mg P Mn ',' a b2 b3 b6 b9 c k ','1',0,2,3,2,'https://cdn.shopify.com/s/files/1/1148/3974/products/Basil-close-up.jpeg?v=1456211118','https://cdn.shopify.com/s/files/1/1148/3974/products/Basil-side-pic.jpeg?v=1456211118','',4,0),(6,'Beetroot',2.95,' Belonging to the same family as chard and spinach, both the leaves and root can be eaten - the leaves have a bitter taste whereas the round root is sweet. Typically a rich purple colour, beetroot can also be white or golden. Due to its high sugar content, beetroot is delicious eaten raw but is more typically cooked or pickled. ','https://cdn.shopify.com/s/files/1/1148/3974/products/beetroot_grande.jpg?v=1473487746','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','43 kcal','10 g','1.6 g','0.2 g','Zn','e','1',0,3,4,2,'','','',5,0),(7,'Bell pepper',6.99,' All red, yellow, and orange peppers start out green. The color changes and their sweetness increases depending on how long they\'re allowed to ripen on the vine. In Season: Bell peppers are available year-round, but they\'re at their best from July through November. ','https://cdn.shopify.com/s/files/1/1148/3974/products/paprika_grande.jpg?v=1476191105','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','20kcal','4.6g','1.2g','0.2g','Ca','e','1',0,3,1,33,'','','',NULL,0),(8,'Brandywine Tomatoes',8.05,' Description Brandywine tomatoes popularly is considered among the best tasting available, probably is caused its origin. Brandywine tomato plant is an heirloom cultivar of the species. if you want to taste the best tomatoey flavor this tomato is exactly what you need. This particular cultivar is extremely succulent and tasty. It is a beautifully sweet tomato that is offset by a wonderful acidity that is a perfect combination for delicious dishes. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Brandywine-tomatoes-front_grande.jpeg?v=1456211078','https://cdn.shopify.com/s/files/1/1148/3974/products/Brandywine-tomatoes-front.jpeg?v=1456211078','18Kcal','3.9g','0.2g','0.9g',' Ca Zn Ma P Mn ',' a c e k ','1',1,2,4,6,'https://cdn.shopify.com/s/files/1/1148/3974/products/Brandywine-Tomatoes.jpeg?v=1456211078','','20',9,0),(9,'Broccoli',1.80,' Broccoli belongs to the cruciferous vegetable family, which includes kale, cauliflower, Brussels sprouts, bok choy, cabbage, collard greens, rutabaga and turnips. These nutrition powerhouses supply loads of nutrients for little calories. ','https://cdn.shopify.com/s/files/1/1148/3974/products/broccoli_grande.jpg?v=1473487386','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','34 kcal','7 g','2.8 g','0.4 g','Fe','a','1',0,3,1,3,'','','',7,0),(10,'C - OVERLOAD',12.00,' Description Season offer consists of 3 items full of C vitamin that is so important for your health especially in the fall when you can get cold. That\'s why we picked 2 5s of raspberries, 1 3 of Stanley plums and 2 3 of Fuji apples to make your health prepared for the nasty weather. All these items are carefully packed into a wooden box so there is no worries about shopping. Everything will be delivered on time and in proper shape. And of course, it is a discount offer where you save 20%. Safe and sound gets a new meaning ;) ','https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries_ed450429-f3d8-4757-9507-f18101c2c057_grande.jpeg?v=1456210992','https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries_ed450429-f3d8-4757-9507-f18101c2c057.jpeg?v=1456210992','30 kcal','10 g','1.2g','1g','Mn','a','0',1,2,4,3,'https://cdn.shopify.com/s/files/1/1148/3974/products/Stanley-Plums-Above_bcaaac45-1ebe-426a-a915-34f35561e082.jpeg?v=1456210992','https://cdn.shopify.com/s/files/1/1148/3974/products/Apple-in-the-middle.jpeg?v=1456210992','20',9,1),(11,'Campari Tomatoes',11.00,' Description Campari is a type of tomato, noted for its juiciness, high sugar level, low acidity, and lack of mealiness. Camparis are deep red and larger than a cherry tomato, but smaller and rounder than a plum tomato. This tomatoes variety is a handy ingredient in your kitchen as it can be nourished raw, salads, snacks and other cooking. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Campari-Tomatoes_grande.jpeg?v=1456211143','https://cdn.shopify.com/s/files/1/1148/3974/products/Campari-Tomatoes.jpeg?v=1456211143','18Kcal','3.9g','0.2g','0.9g',' Ca Zn Ma P Mn ',' a c e k ','1',0,2,4,3,'https://cdn.shopify.com/s/files/1/1148/3974/products/Campari-Tomatoes-closer_b2dc02f3-fb47-4ed9-b818-37c7660f3a30.jpeg?v=1456211143','','',4,1),(12,'Capia Pepper',6.95,' Description Capia peppers are rich in ascorbic acid and carotene. Grill it or just eat it raw. The Capia pepper is a delicatecy of different southern cousines, now organic at your kitchen. Just give it a try and see how it taste in your paella. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Capia-Pepper-above_grande.jpeg?v=1456211049','https://cdn.shopify.com/s/files/1/1148/3974/products/Capia-Pepper-above.jpeg?v=1456211049','20Kcal','4.64g','0.17g','0.86g',' Ca Fe Zn Mg P Mn ',' b1 b6 c k ','1',1,2,4,3,'https://cdn.shopify.com/s/files/1/1148/3974/products/Capia-Pepper.jpeg?v=1456211049','','15',9,0),(13,'Cherry Tomatoes',3.74,' These Cherry tomatoes just might be the sweetest little tomatoes we’ve ever offered. It is all thanks to perfect weather conditions this season. Very small, firm and juicy, it’s a great choice when you’re looking for a fresh and nutritious option for snacking. And when you’re making salads, just wash and toss in – no slicing required. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Cherry-tomatoes-above_grande.jpeg?v=1472537367','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','18Kcal','3.9g','0.2g','0.9g','Ca','b1','1',0,2,8,4,'','','',7,0),(14,'Cherry Tomatoes 2016',6.90,' These Cherry tomatoes just might be the sweetest little tomatoes we’ve ever offered. It is all thanks to perfect weather conditions this season. Very small, firm and juicy, it’s a great choice when you’re looking for a fresh and nutritious option for snacking. And when you’re making salads, just wash and toss in – no slicing required. ','https://cdn.shopify.com/s/files/1/1148/3974/products/cherry-tomatoes_grande.jpg?v=1473490001','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','18Kcal','3.9g','0.2g','0.9g','Fe','b6','1',0,3,4,33,'','','',4,0),(15,'Chives',2.98,' Sweet, mild-onion flavored chives are fresh top greens in the onion family of bu0 vegetables. Its stiff, hollow, tubular leaves appear similar to that of onions, but smaller in diameter, and appear somewhat like grass from a distance. ','https://cdn.shopify.com/s/files/1/1148/3974/products/chives_grande.jpg?v=1473488140','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','20 kcal','4 g','2 g','0 g','Fe','c','1',0,3,5,4,'','','',5,0),(16,'Cucumber',16.80,' The heart-shaped silhouette of the strawberry is the first clue that this fruit is good for you. These potent little packages protect your heart, increase HDL (good) cholesterol, lower your blood pressure, and guard against cancer. ','https://cdn.shopify.com/s/files/1/1148/3974/products/cucumber_grande.jpg?v=1473489264','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320',' 16kcal','3.6 g','0.7 g','0.1 g','Mg','c','1',0,3,4,4,'','','',6,0),(17,'Damson Plums',1.99,' Description Damson plums are very popular and widespread cultivar. Probably it is the first one that comes in mind when you hear the word \"plum\". The main characteristic of these plums is its distinctive rich flavour; unlike other plums, it is both high in sugars and highly astringent. The fruit of the damson has a distinctive, somewhat astringent taste, and are widely used for culinary purposes, particularly in fruit preserves or jam. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Damson_grande.jpeg?v=1456211083','https://cdn.shopify.com/s/files/1/1148/3974/products/Damson.jpeg?v=1456211083','46 kcal','11.42 g','0.7g','0.28 g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,2,4,5,'https://cdn.shopify.com/s/files/1/1148/3974/products/Damson-close-up.jpeg?v=1456211083','','',7,1),(18,'Eggplant',7.50,' The eggplant, also known as aubergine, garden egg, guinea squash, melongene, and brinjal, is usually distinguishable by its signature egg-like shape and vibrant purple color. Although the dark purple version of eggplants is best known, they actually come in a variety of shapes and colors from small and oblong to long and skinny, from shades of purple to white and green. ','https://cdn.shopify.com/s/files/1/1148/3974/products/eggplant_grande.jpg?v=1476190860','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','25kcal','6g','1g','0.2g','Ca','e','1',1,3,4,33,'','','20',9,0),(19,'Empire Apples',2.89,' Description Empire apples are red, juicy, firm, crunchy and sweet. We have already been gathering them during September and October for fourteen years. This delicious apple cultivar will be in good usable conditions until January. Empire apples are excellent for eating and salads, and good for sauce, baking, pies and freezing. We root for these apples as an ideal lunch-box apple, not least because it does not bruise easily. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Empire-Apple_grande.jpeg?v=1456211165','https://cdn.shopify.com/s/files/1/1148/3974/products/Empire-Apple.jpeg?v=1456211165',' 52 kcal','13.81 g','2 g','0.17 g',' Ca Fr Mg Mn P ',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,2,4,5,'https://cdn.shopify.com/s/files/1/1148/3974/products/Apple-cuts.jpeg?v=1456211165','https://cdn.shopify.com/s/files/1/1148/3974/products/Apples-horizontal.jpeg?v=1456211165','',4,0),(20,'Fuji Apples',9.39,' Description Fuji apples are very special ones as they contain the taste of two absolutely different apple varieties Red Delicious and old Virginia Ralls Genet. These apples have a dense flesh that is sweeter and crisper than many other apple cultivars, making them popular with consumers not only in our region but around the world as well. It is not the only advantage they have. Fuji is a long liver, they can be kept on shelves for a long time compared to other apples, even without refrigeration. With refrigeration, Fuji apples can remain fresh for up to a year. It is exactly what you need if you are looking for a fruit store as a backup. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Fuji-single_grande.jpeg?v=1456211065','https://cdn.shopify.com/s/files/1/1148/3974/products/Fuji-single.jpeg?v=1456211065',' 52 kcal','13.81 g','1.2g','0.17 g',' Ca Fr Mg Mn P ',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,1,4,5,'https://cdn.shopify.com/s/files/1/1148/3974/products/Fuji.jpeg?v=1456211065','','',5,0),(21,'Gala Apples',4.39,' Description Gala is one of our favorite apple cultivars. We started growing this particular apple cultivar in 1989 in our familial garden which was renovated two years before. Since that times Gala Apples are produced by our family and distributed at the local markets. Our cultivar has an exceptionally sweet taste with a mild flavor. Gala apples are a perfect choice to be added to salads or cooked. We highly recommend them as a constituent element of delicious sauces. ','https://cdn.shopify.com/s/files/1/1148/3974/products/apples_grande.jpeg?v=1456211105','https://cdn.shopify.com/s/files/1/1148/3974/products/apples.jpeg?v=1456211105',' 52 kcal','13,81 g','1.2g','0.2 g',' Ca Fr Mg Mn Na P K Zn ',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,2,4,6,'https://cdn.shopify.com/s/files/1/1148/3974/products/apple_pyramid.jpeg?v=1456211105','https://cdn.shopify.com/s/files/1/1148/3974/products/Apple_crepes_with_raspberryon_top.jpeg?v=1456211105','',1,0),(22,'Golden Delicious Apples',2.30,' Description It\'s already has been a well-known cultivar and beloved deeply by customers by its very sweet taste. Golden Delicious is a favorite fruit for salads, apple sauce, and apple butter. We recommend this cultivar to try as a filling of the pie. We find its delicious sweet taste a worth constituent to this dessert. Golden Delicious apples keep their shape well after baking, so you\'ll get beautiful slices that would make your pie looks perfect. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Golden-Delicious-Apples_grande.jpeg?v=1456211059','https://cdn.shopify.com/s/files/1/1148/3974/products/Golden-Delicious-Apples.jpeg?v=1456211059',' 52 kcal','13.81 g','1.2g','0.17 g',' Ca Fr Mg Mn P ',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,2,4,7,'https://cdn.shopify.com/s/files/1/1148/3974/products/Golden-Delicious-Apples-cut-off.jpeg?v=1456211059','https://cdn.shopify.com/s/files/1/1148/3974/products/Golden-Delicious-Yellow-Background.jpeg?v=1456211059','',9,1),(23,'Green Beans',2.99,' Green beans are eaten around the world, and are marketed canned, fr1en, and fresh. Green beans are often steamed, boiled, stir-fried, or baked in casseroles. A dish with green beans popular throughout the United States, particularly at Thanksgiving, is green bean casserole, which consists of green beans, cream of mushroom soup, and French fried onions. ','https://cdn.shopify.com/s/files/1/1148/3974/products/green-beans_grande.jpg?v=1473489516','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','31kcal','7 g','1.8 g','0.1 g','Ca','e','1',1,3,1,33,'','','30',9,0),(24,'Green Mixed Spice',9.89,' Description This mixture works best for soups, stews and salads. We also highly recommend to try it as a basis of your parsley pesto season. This spice would make it extremely delightful. It will add a delicious aroma to your cooking so no one can ignore it. Our pepper mixed spice is created based on a special proportion of each ingredient that makes it a perfect addition to your everyday meal. This mix consists of dried and powered basil, parsley, oregano, rosemary and thyme. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Green-Mixed-Spice_grande.jpeg?v=1456211020','https://cdn.shopify.com/s/files/1/1148/3974/products/Green-Mixed-Spice.jpeg?v=1456211020','40 kcal','2.2 g,','1.2g','3.15g','Ca',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,1,5,9,'https://cdn.shopify.com/s/files/1/1148/3974/products/Green-Mixed-Spice-with-Spoon.jpeg?v=1456211020','https://cdn.shopify.com/s/files/1/1148/3974/products/Green-Mixed-Spice-Decorated.jpeg?v=1456211020','',6,0),(25,'Leek',13.00,' Leeks have a mild, onion-like taste. In its raw state, the vegetable is crunchy and firm. The edible portions of the leek are the white base of the leaves (above the roots and stem base), the light green parts, and to a lesser extent the dark green parts of the leaves. One of the most popular uses is for adding flavor to stock. ','https://cdn.shopify.com/s/files/1/1148/3974/products/leek_grande.jpg?v=1473490100','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','61Kcal','14g','0.3g','0.9g','Ca','e','1',0,3,4,33,'','','',7,0),(26,'Lime',6.00,' Wonderful for bringing out the flavor of other foods, limes, while similar to lemons, have their own distinctive citrus flavor. Lime juice even has more acid and natural sugar content than its close cousin lemon juice. While some limes, known as sweet limes, contain little citric acid, the tart variety will give you the most nutritional bang for your buck. ','https://cdn.shopify.com/s/files/1/1148/3974/products/lime_grande.jpg?v=1473488514','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','30 kcal','11 g','0.7 g','0.2 g','Ca','e','1',0,3,4,33,'','','',2,0),(27,'Maynard Plums',2.11,' Description Maynard is one of our orchard special cultivars. Just like an apricot, the fruit flesh clings tightly to the pit. Its taste can differ from sweet to bitter sweet. The fruit is particularly aromatic that makes it especially appropriate for jams. As all plums Maynard plums are full of antioxidants. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Maynard-Plum-Front_grande.jpeg?v=1456211090','https://cdn.shopify.com/s/files/1/1148/3974/products/Maynard-Plum-Front.jpeg?v=1456211090','46 kcal','11.42 g','0.7g','0.28 g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,2,4,12,'https://cdn.shopify.com/s/files/1/1148/3974/products/Maynard-Plum-Macro.jpeg?v=1456211090','https://cdn.shopify.com/s/files/1/1148/3974/products/Maynard-plum-close-up.jpeg?v=1456211090','',3,1),(28,'Organic Corn Oil',8.98,' Description Our Organic Corn Oil is a cholesterol-free food product with zero grams of trans fat per individual serving. Corn oil is often used for popping popcorn and frying French fries and can be used for regular cooking in place of other oils. This 100 percent pure, cholesterol-free oil gives you a heart-healthy way to cook your favorite meals. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Single-oil_grande.jpeg?v=1456211037','https://cdn.shopify.com/s/files/1/1148/3974/products/Single-oil.jpeg?v=1456211037','18Kcal','3.6 g','2 g','3.15g','Fe',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,1,2,13,'https://cdn.shopify.com/s/files/1/1148/3974/products/Corn-Oil-perspective.jpeg?v=1456211037','https://cdn.shopify.com/s/files/1/1148/3974/products/Oil-and-vineguard.jpeg?v=1456211037','',4,0),(29,'Organic Corn Oil 2015',8.98,' Description Our Organic Corn Oil is a cholesterol-free food product with zero grams of trans fat per individual serving. Corn oil is often used for popping popcorn and frying French fries and can be used for regular cooking in place of other oils. This 100 percent pure, cholesterol-free oil gives you a heart-healthy way to cook your favorite meals. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Single-oil_b090e5f0-5e98-405e-8d0e-0ce3ba858cce_grande.jpeg?v=1456210996','https://cdn.shopify.com/s/files/1/1148/3974/products/Single-oil_b090e5f0-5e98-405e-8d0e-0ce3ba858cce.jpeg?v=1456210996','20 kcal','4 g','2 g','3.15g','Fe','e','1',0,2,2,14,'https://cdn.shopify.com/s/files/1/1148/3974/products/Corn-Oil-perspective_06d7de99-ae57-4a32-b378-4d226941471d.jpeg?v=1456210996','https://cdn.shopify.com/s/files/1/1148/3974/products/Oil-and-vineguard_f8e5d40b-4319-4041-a6c4-7c8a277ea8ba.jpeg?v=1456210996','',5,0),(30,'Paprika & Cayenne Pepper Mixed Spice',15.50,' Description A perfect combination of spicy flavor to enrich the taste of your dishes. We recommend to use it as a key ingredient in a variety of hot sauces, particularly those employing vinegar as a preservative. Our pepper mixed spice is created based on a special proportion of each ingredient that makes it perfect to be spread on sandwiches or similar items to add a spicy flavor. This mix consists of paprika and cayenne pepper, clove, mustard, zest and oregano. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Pepper-Mixed-Spice_grande.jpeg?v=1456211025','https://cdn.shopify.com/s/files/1/1148/3974/products/Pepper-Mixed-Spice.jpeg?v=1456211025','30 kcal','4 g','2 g','3.15g','Fe','e','1',0,1,5,15,'https://cdn.shopify.com/s/files/1/1148/3974/products/Pepper-Mixed-Spice-with-Spoon.jpeg?v=1456211025','https://cdn.shopify.com/s/files/1/1148/3974/products/Spoons-Collection.jpeg?v=1456211025','',3,0),(31,'Parsley',1.75,' Description Use curly leaf parsley as a garnish on your main dishes. We recommend this fresh herbal as a garnish on potato dishes (boiled or mashed potatoes), on rice dishes (risotto or pilaf), on fish, fried chicken, lamb, goose, and steaks, as well in meat or vegetable stews (including shrimp creole, beef bourguignon, goulash, or chicken paprikash). ','https://cdn.shopify.com/s/files/1/1148/3974/products/Parsley_grande.jpeg?v=1456211045','https://cdn.shopify.com/s/files/1/1148/3974/products/Parsley.jpeg?v=1456211045','36Kcal','6.33g','0.79g','2.97g',' Ca Fe Zn Mg K Mn ',' a b3 b9 c k ','0',0,2,1,16,'https://cdn.shopify.com/s/files/1/1148/3974/products/Parsley-close-up.jpeg?v=1456211045','https://cdn.shopify.com/s/files/1/1148/3974/products/Parsley-above.jpeg?v=1456211045','',1,0),(32,'Peaches',5.99,' Description Our peaches are extremely sweet to the taste with soft and thin skin. This particular cultivar is low-acid and white-fleshed that makes it a perfect candidate for the fresh desserts due to the juicy taste and entrancing aroma. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Peaches-in-the-pot_grande.jpeg?v=1456211131','https://cdn.shopify.com/s/files/1/1148/3974/products/Peaches-in-the-pot.jpeg?v=1456211131','39 kcal','9.54 g','1.2g','0.91g',' Fr Mg Mn P K Z ',' a b1 b2 b3 b5 b6 c e k ','1',1,2,4,17,'https://cdn.shopify.com/s/files/1/1148/3974/products/peaches.jpeg?v=1456211131','https://cdn.shopify.com/s/files/1/1148/3974/products/Peaches-cut-off.jpeg?v=1456211131','25',9,1),(33,'Radishes',2.49,' Description Our radishes are crisp enough and feels refreshening pungent that makes them perfect for salads, but they also may appear in many other dishes. Radish leaves are sometimes used in spicy recipes, like potato soup or as a sauteed side dish. You can also find them as a blended constituent with fruit juices in some piquant recipes. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Radishes_grande.jpeg?v=1456211127','https://cdn.shopify.com/s/files/1/1148/3974/products/Radishes.jpeg?v=1456211127','0.68g','10 g','2 g','3.15g',' K Fr Mg Mn P Ca Z ',' b2 b5 b6 b9 c ','0',0,2,3,18,'https://cdn.shopify.com/s/files/1/1148/3974/products/Radishes-side-close-up.jpeg?v=1456211127','https://cdn.shopify.com/s/files/1/1148/3974/products/Radishes-rightside.jpeg?v=1456211127','',6,0),(34,'Raspberries',10.98,' Description We started growing raspberries in 90’s on our family farm near Cupar. Our cultivar has exeptional sweet taste with astringent flavor. These individually gathered berries are a wonderful taste of summer in your everyday meal. Raspberries are perfect in smoothies, baking, on pancakes or just plain old snacking out of the bag! Enjoy! ','https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries_grande.jpeg?v=1456211149','https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries.jpeg?v=1456211149',' 53 kcal','11.94 g','1.2g','0.65 g',' Ca Fr Mg Mn P K Zn ',' b1 b2 b3 b5 b6 b9 c e k ','1',0,2,6,19,'https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries-2.jpeg?v=1456211149','https://cdn.shopify.com/s/files/1/1148/3974/products/raspberries-pie.jpeg?v=1456211149','',7,1),(35,'Red Bell Pepper',5.04,' Description Red pepper is rich source of antioxidants and vitamin C. The level of carotene, like lycopene, is nine times higher particularly in Red peppers in comparison to other variaties of pepper. Red peppers have twice the vitamin C content of green peppers. Nourishing this fine pepper cultivar, you are taking care of yourself and your family providing them with a healthy and very useful food. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Bell-Pepper_grande.jpeg?v=1456211053','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Bell-Pepper.jpeg?v=1456211053','20Kcal','4.64g','0.17g','0.86g',' Ca Fe Zn Mg P Mn ',' b1 b6 c k ','1',0,2,4,20,'https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Bell-Pepper-2.jpeg?v=1456211053','https://cdn.shopify.com/s/files/1/1148/3974/products/Pepper-Bundle.jpeg?v=1456211053','',1,1),(36,'Red European Plums',1.32,' Description European plum is an ancient domesticated species, known only in cultivation, now cultivated in temperate areas worldwide and our farm is not an exception. This particular plum cultivar differs from others with globose and large enough form. They are very juicy and especially suitable for salads or other quick desserts. European plum has a firm and succulent flesh full of antioxidants. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-plums-perspective_grande.jpeg?v=1456211139','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-plums-perspective.jpeg?v=1456211139','46 kcal','11.42 g','0.7g','0.28 g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,2,7,21,'https://cdn.shopify.com/s/files/1/1148/3974/products/Red-plum-close-up.jpeg?v=1456211139','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-plums-front.jpeg?v=1456211139','',10,1),(37,'Red Kabocha Squash',2.84,' Description Kabocha has an exceptional naturally sweet flavor, even sweeter in taste than butternut squash. It is similar in texture and flavor to a pumpkin and a sweet potato combined. Some kabocha can taste like Russet potatoes. The rind of a kabocha is edible, although, some cooks may peel it to speed up the cooking process, or, to suit their personal taste preferences. Kabocha is commonly utilized in side dishes and soups, or, as a substitute for potato or other squash varieties. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Kabocha_grande.jpeg?v=1456211099','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Kabocha.jpeg?v=1456211099','26 kcal','6.5 g','1.2g','0.1 g',' Ca Fr Mg Mn P K Zn ',' a b1 b2 b3 b5 b6 b9c e k ','1',0,2,4,22,'https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkin-close-up.jpeg?v=1456211099','https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkin-in-the-field.jpeg?v=1456211099','',11,1),(38,'Red Mixed Spice',7.99,' Description Constituents of this mixture prove the name of it. Red Mixed Spice is full of flavored ingredients such as dried tomatoes and pepper, paprika, carrot, onion, garlic, mustard, ginger, and sea salt. We designed it specially for dishes of rice paella or risotto. It works great with a Spanish soup gazpacho or any other tomato dish. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Mixed-Spice_grande.jpeg?v=1456211012','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Mixed-Spice.jpeg?v=1456211012','40 kcal','3.6 g','0.17g','3.15g','P','f','1',0,1,5,23,'https://cdn.shopify.com/s/files/1/1148/3974/products/Red-Mixed-Spice-with-Spoon.jpeg?v=1456211012','https://cdn.shopify.com/s/files/1/1148/3974/products/Four-Spices.jpeg?v=1456211012','',11,0),(39,'Red Onions',1.55,' Description Red onions are probably the best option to use in your salads or to be eaten raw because of its light sweeter taste and particular aroma. This particular onion cultivar is very high in flavonoids which are very useful for the health. We recommend Red onions to be used as a constituent of salad, sandwich and especially burger to enrich its succulence. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-onions_grande.jpeg?v=1456211183','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-onions.jpeg?v=1456211183','40 kcal','9.34 g','0.17g','0.1 g',' Ca Fr Mg Mn P K Zn ',' b1 b2 b5 b6 b9 c ','1',0,1,4,24,'https://cdn.shopify.com/s/files/1/1148/3974/products/Red-onions-close-up.jpeg?v=1456211183','https://cdn.shopify.com/s/files/1/1148/3974/products/Red-onions-from-above.jpeg?v=1456211183','',11,1),(40,'Spinach',4.25,' Description Calorie for calorie, leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. Although spinach is available throughout the year, its season runs from March through May and from September through October when it is the freshest, has the best flavor, and is most readily available. Spinach has the bitterness of beet greens and the slightly salty flavor of Swiss chard that makes them delicious as a soup basis or filing to a pie. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Spinach-front_grande.jpeg?v=1456211174','https://cdn.shopify.com/s/files/1/1148/3974/products/Spinach-front.jpeg?v=1456211174','0.4 g','2.2 g,','0.17g','3.15g',' Ca Fr Mg Mn P K Zn ',' a b2 b6 b9 c e k ','1',1,2,3,25,'https://cdn.shopify.com/s/files/1/1148/3974/products/Spinach-above.jpeg?v=1456211174','https://cdn.shopify.com/s/files/1/1148/3974/products/Spinach.jpeg?v=1456211174','15',9,1),(41,'Stanley Plums',4.25,' Description Description text how product was grown and reserved. All nutrition features that interest user goes here as well. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Stanley-Plums-Above_grande.jpeg?v=1456211110','https://cdn.shopify.com/s/files/1/1148/3974/products/Stanley-Plums-Above.jpeg?v=1456211110','46 kcal','11.42 g','0.7g','0.28 g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,2,4,26,'https://cdn.shopify.com/s/files/1/1148/3974/products/Stanley-Plum-perspective.jpeg?v=1456211110','https://cdn.shopify.com/s/files/1/1148/3974/products/Stanley-Plum-Cut-off.jpeg?v=1456211110','',12,1),(42,'Strawberries',2.85,' The heart-shaped silhouette of the strawberry is the first clue that this fruit is good for you. These potent little packages protect your heart, increase HDL (good) cholesterol, lower your blood pressure, and guard against cancer. ','https://cdn.shopify.com/s/files/1/1148/3974/products/strawberries_grande.jpg?v=1473489009','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','33 kcal','8 g','0.7 g','0.3 g','P','f','1',0,3,1,27,'','','',12,0),(43,'Sweet Grapes',15.00,' Description Thompson seedless grapes are one of the world\'s most popular eating grapes. It has a perfect refreshing sweet taste. What\'s the best of it that they can be a dessert itself or used in some sort of fruit salad seasoned with any condiment or juice. ','','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','20 kcal','0.5g','0.17g','3.15g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,3,4,28,'','','',3,0),(44,'Thompson Seedless Grapes',6.05,' Description Thompson seedless grapes are one of the world\'s most popular eating grapes. It has a perfect refreshing sweet taste. What\'s the best of it that they can be a dessert itself or used in some sort of fruit salad seasoned with any condiment or juice. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Thompson-Seedless-Grape_grande.jpeg?v=1456211160','https://cdn.shopify.com/s/files/1/1148/3974/products/Thompson-Seedless-Grape.jpeg?v=1456211160','30 kcal','0.5g','1.2g','3.15g',' Ca Fr Mg Mn P Zn ',' a b1 b2 b3 b5 b6 c e k ','1',0,2,4,29,'https://cdn.shopify.com/s/files/1/1148/3974/products/Thompson-Seedless-Grape-close-up.jpeg?v=1456211160','','',3,1),(45,'Veg Mixed Spice',8.14,' Description Vegetables can be useful in any state fresh, boiled, grilled and even dried. This is a mixture of our favorite and so native vegetables wrapped up into the mix of flavors. Veg Mixed Spice contains dried carrots, onion, leek, bell pepper, chilli pepper, garlic, basil, oregano, marjoram, allspice and black and white pepper. Feel free to add spice to any of your boiled, stewed or baked dishes. It will make your meat food aromatic and particularly tasty. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Veg-Mixed-Spice_grande.jpeg?v=1456211007','https://cdn.shopify.com/s/files/1/1148/3974/products/Veg-Mixed-Spice.jpeg?v=1456211007','30 kcal','6.33g','2 g','3.15g','P','f e','1',0,1,5,30,'https://cdn.shopify.com/s/files/1/1148/3974/products/Three-Spice-Spoons.jpeg?v=1456211007','https://cdn.shopify.com/s/files/1/1148/3974/products/Spice-Plates.jpeg?v=1456211007','',6,0),(46,'Veggie Balls',29.99,' Pack includes beetroot, spinach, eggplant, walnut and recipe for this delicious vegetarian meal (4 persons) that will impress even the most pernickety guest ','https://cdn.shopify.com/s/files/1/1148/3974/products/pack-image_grande_3837a501-1d78-48f6-8030-3f50a78faa16_grande.png?v=1478095494','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','30 kcal','3.6 g','1.2g','3.15g','P',' a b1 b2 b3 b5 b6 b9 c e k ','1',1,1,4,NULL,'','','30',9,0),(47,'Vit-plate',24.89,' Description A special offer consists of 3 items that are full of freshness and energy. Exactly what you need in the morning to start your day and be ready for new challenges. That\'s why we picked 1 3 of Maynard plums, 1 3 of Thompson Seedless grape and 1 3 of peaches and 1 3 of Stanley plums. All these items are carefully packed into a wooden box so there is no worries about shopping. Everything will be delivered on time and in proper shape. And of course, it is a discount offer where you save 15%. Safe and sound gets a new meaning ;) ','https://cdn.shopify.com/s/files/1/1148/3974/products/plums_wideangle_grande_66dba985-63ff-4613-b0af-f3074b9e3b2b_grande.jpg?v=1458054271','https://cdn.shopify.com/s/files/1/1148/3974/products/plums_wideangle_grande_66dba985-63ff-4613-b0af-f3074b9e3b2b.jpg?v=1458054271','40 kcal','2.2 g,','0.17g','2.97g','P',' a b1 b2 b3 b5 b6 b9 c e k ','1',0,2,4,NULL,'https://cdn.shopify.com/s/files/1/1148/3974/products/Thompson-Seedless-Grape_1a307bce-03ad-4153-aa6c-25d6919b5a31.jpeg?v=1458054271','https://cdn.shopify.com/s/files/1/1148/3974/products/Maynard-plum-close-up_740952ff-7591-4c06-b829-0c20b04f583d.jpeg?v=1458054271','',3,1),(48,'Winter Pumpkin',3.29,' Description Winter pumpkins are a delicious addition to your cold season meal. Choose red or green compact versions of this special cultivar to cook Heaven-and-Earth Tempura Cakes or Pumpkin Puree with Ginger. Its distinctive bottom with a circular ridge, though, gives it away. On some, the ridge may surround a more pronounced bump, or \"turban.\" A freshly cut buttercup may smell like a clean, fragrant cucumber, but once cooked, its orange flesh becomes dense, a bit dry, and very mild. ','https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkins-_horizontal_grande.jpeg?v=1456211157','https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkins-_horizontal.jpeg?v=1456211157','26 kcal','6.5 g','2 g','0.1 g',' Ca Fr Mg Mn P K Zn ',' a b1 b2 b3 b5 b6 b9c e k ','1',0,1,4,9,'https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkins.jpeg?v=1456211157','https://cdn.shopify.com/s/files/1/1148/3974/products/Pumpkins-behind-grens.jpeg?v=1456211157','',2,0),(49,'Wooden Bowls',103.99,' Richly grained acacia wood turns out in smooth, sculptural serving essentials, naturally suited to everyday use, entertaining or artful display. Bowls round in organic curves to hold salads, snacks, fruit or collectibles. Each piece is given a clear lacquer finish to bring out the wood\'s warm color and individual markings. Harvested from well-managed forests in the Philippines under close supervision of the local government\'s reforestation program. ','https://cdn.shopify.com/s/files/1/1148/3974/products/bowl_grande.jpg?v=1473490962','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','','','','','','','1',0,2,2,3,'','','',NULL,0),(50,'Wooden Spoon',49.99,' Richly grained acacia wood turns out in smooth, sculptural serving essentials, naturally suited to everyday use, entertaining or artful display. Spoon rounds in organic curves to hold salads, snacks, fruit or collectibles. Each piece is given a clear lacquer finish to bring out the wood\'s warm color and individual markings. Harvested from well-managed forests in the Philippines under close supervision of the local government\'s reforestation program. ','https://cdn.shopify.com/s/files/1/1148/3974/products/spoon_grande.jpg?v=1473490998','http://cdn.shopify.com/s/files/1/1148/3974/products/asparagus_1024x1024.jpg?v=1473487320','','','','','','','1',0,2,1,NULL,'','','',NULL,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_season`
--

DROP TABLE IF EXISTS `products_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_season`
--

LOCK TABLES `products_season` WRITE;
/*!40000 ALTER TABLE `products_season` DISABLE KEYS */;
INSERT INTO `products_season` VALUES (1,'January'),(2,'February'),(3,'March'),(4,'April'),(5,'May'),(6,'June'),(7,'July'),(8,'August'),(9,'September'),(10,'October'),(11,'November'),(12,'December');
/*!40000 ALTER TABLE `products_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_keywords`
--

DROP TABLE IF EXISTS `recipe_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_keywords_keyword_id_7862da8f_fk_keywords_id` (`keyword_id`),
  KEY `recipe_keywords_recipe_id_de90a8eb_fk_recipes_id` (`recipe_id`),
  CONSTRAINT `recipe_keywords_keyword_id_7862da8f_fk_keywords_id` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`id`),
  CONSTRAINT `recipe_keywords_recipe_id_de90a8eb_fk_recipes_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_keywords`
--

LOCK TABLES `recipe_keywords` WRITE;
/*!40000 ALTER TABLE `recipe_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_recommendations`
--

DROP TABLE IF EXISTS `recipe_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_recommendations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) DEFAULT NULL,
  `recommendation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_recommendations_recipe_id_f06f5f23_fk_recipes_id` (`recipe_id`),
  KEY `recipe_recommendatio_recommendation_id_eaf84e13_fk_recommend` (`recommendation_id`),
  CONSTRAINT `recipe_recommendatio_recommendation_id_eaf84e13_fk_recommend` FOREIGN KEY (`recommendation_id`) REFERENCES `recommendations` (`id`),
  CONSTRAINT `recipe_recommendations_recipe_id_f06f5f23_fk_recipes_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_recommendations`
--

LOCK TABLES `recipe_recommendations` WRITE;
/*!40000 ALTER TABLE `recipe_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `ingredient` varchar(2000) DEFAULT NULL,
  `direction` longtext,
  `thumbnail_url` varchar(2000) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `posting_date` varchar(45) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `description` longtext,
  `is_main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Plum Freezer Jam with Cardamon and Ginger','Ingredients1/3 cups coarsely chopped Meynard Plums (from about 1 1/4 pounds)1 (1-inch) piece ginger (about 1 1/2 ounces)1 1/3 cups sugar1/4 cup Ball® RealFruit® Instant Pectin2 tablespoons fresh lemon juice1/4 teaspoon freshly ground black pepper1/4 teaspoon ground cardamom','Bring plums and 1 cup water to a boil in a medium saucepan, then reduce heat to low and simmer until plums begin to soften and liquid is reduced by about half, about 5 minutes.Meanwhile, finely grate ginger, then squeeze juice into a small bowl; discard pulp.Combine sugar and pectin in a large bowl. Add plum mixture, lemon juice, pepper, cardamom, and 1 tsp. ginger juice (discard any remaining juice), then stir constantly for about 3 minutes to activate pectin. Using a potato masher or fork, break up any large plum pieces, then let cool at least 30 minutes.Ladle jam into sterilized jars, leaving 1/2 from the top to allow for expansion. Cover and chill.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Plum_Freezer_Jam_with_Cardamon_and_Ginger_large.png?v=1462438245','for Stanley Plums','February 23, 2016','by Ann Reed','Neither long simmering nor heat-canned, this vibrant, lightly spiced jam couldn\'t be simpler to prepare. Red-fleshed plums lend a gorgeous garnet color, but any variety works well. Ingredients1/3 cups coarsely chopped Meynard Plums (from about 1 1/4 pounds)1 (1-inch) piece ginger (about 1 1/2 ounces)1 1/3 cups sugar1/4 cup Ball® RealFruit® Instant Pectin2 tablespoons fresh lemon juice1/4 teaspoon freshly ground black pepper1/4 teaspoon ground cardamomDirectionsBring plums and 1 cup water to a boil in a medium saucepan, then reduce heat to low and simmer until plums begin to soften and liquid is reduced by about half, about 5 minutes.Meanwhile, finely grate ginger, then squeeze juice into a small bowl; discard pulp.Combine sugar and pectin in a large bowl. Add plum mixture, lemon juice, pepper, cardamom, and 1 tsp. ginger juice (discard any remaining juice), then stir constantly for about 3 minutes to activate pectin. Using a potato masher or fork, break up any large plum pieces, then let cool at least 30 minutes.Ladle jam into sterilized jars, leaving 1/2 from the top to allow for expansion. Cover and chill.',0),(2,'Oven Risotto with Kale Pesto','Ingredients1/2 cup walnuts, coarsely chopped, divided4 tablespoons olive oil, divided1 medium onion, finely chopped1 cup arborio riceKosher salt, freshly ground pepper1/2 cup dry white wine1 small garlic clove1 cup (packed) fresh parsley leaves3 tablespoons chopped fresh chives2 cups torn Tuscan kale leaves, divided2 tablespoons unsalted butter3 ounces Parmesan, finely grated (about 2 cups)','Preheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes. Let cool.Meanwhile, heat 2 tablespoons oil in a large ovenproof saucepan over medium heat. Add onion and cook, stirring often, until softened and translucent, 5–8 minutes. Stir in rice; season with salt and pepper. Cook, stirring, until some grains are translucent, about 5 minutes.Add wine, bring to a simmer, and cook until pan is almost dry, about 3 minutes. Add 2 cups very hot water; season with salt and pepper. Bring to a simmer, cover, and bake in oven until liquid is mostly absorbed but rice is still starchy in the center, 15–18 minutes (it should be undercooked).Meanwhile, pulse garlic and half of toasted walnuts in a food processor until very finely ground. Add parsley, chives, half of kale, remaining 2 tablespoons oil, and 1/4 cup cold water; process until smooth; season pesto with salt and pepper.Set saucepan over medium heat. Add 3/4 cup very hot water and cook rice, stirring constantly, until it is tender but still has some bite and sauce is creamy, about 3 minutes. Stir in pesto, butter, three-quarters of Parmesan, and remaining kale. Adjust consistency with water, if needed; season with salt and pepper. Serve topped with remaining walnuts and cheese.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Risotto_with_Kale_Pesto_large.png?v=1462438343','for Green Mixed Spice','February 23, 2016','by Ann Reed','If you have a ton of kale at home, this is a great use for it. This combination of rice and kale make them perfect candidates for a gorgeous veggie dinner.Ingredients1/2 cup walnuts, coarsely chopped, divided4 tablespoons olive oil, divided1 medium onion, finely chopped1 cup arborio riceKosher salt, freshly ground pepper1/2 cup dry white wine1 small garlic clove1 cup (packed) fresh parsley leaves3 tablespoons chopped fresh chives2 cups torn Tuscan kale leaves, divided2 tablespoons unsalted butter3 ounces Parmesan, finely grated (about 2 cups)DirectionsPreheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes. Let cool.Meanwhile, heat 2 tablespoons oil in a large ovenproof saucepan over medium heat. Add onion and cook, stirring often, until softened and translucent, 5–8 minutes. Stir in rice; season with salt and pepper. Cook, stirring, until some grains are translucent, about 5 minutes.Add wine, bring to a simmer, and cook until pan is almost dry, about 3 minutes. Add 2 cups very hot water; season with salt and pepper. Bring to a simmer, cover, and bake in oven until liquid is mostly absorbed but rice is still starchy in the center, 15–18 minutes (it should be undercooked).Meanwhile, pulse garlic and half of toasted walnuts in a food processor until very finely ground. Add parsley, chives, half of kale, remaining 2 tablespoons oil, and 1/4 cup cold water; process until smooth; season pesto with salt and pepper.Set saucepan over medium heat. Add 3/4 cup very hot water and cook rice, stirring constantly, until it is tender but still has some bite and sauce is creamy, about 3 minutes. Stir in pesto, butter, three-quarters of Parmesan, and remaining kale. Adjust consistency with water, if needed; season with salt and pepper. Serve topped with remaining walnuts and cheese.',0),(3,'Pasta Pomodoro with Shrimp','Ingredients1/2 pound angel hair pasta3/4 pound raw, peeled, deveined shrimp (medium sized)4 ripe Campari Tomatoes3 cloves garlic, minced1/3 cup torn fresh basil leaves3 Tbsp olive oil (divided, 1 Tbsp and 2 Tbsp)Salt and freshly ground black pepper to taste','Fill a large pot with 2 quarts of water. Bring to a boil (You will be using this water to both blanch the tomatoes and boil the pasta.) Core the tomatoes and use a sharp knife to cut a small X into the bottom end of each tomato. When the water is boiling, use a slotted spoon to lower the tomatoes into the water. Blanch for no more than one minute, just enough to loosen the skins. Remove tomatoes with a slotted spoon to a bowl of icy water, saving the blanching water.Peel off the tomato skins from the tomatoes. Cut the tomatoes crosswise in half, and squeeze out most of the seeds and juices. Chop the tomatoes into 1-inch pieces.Heat 1 Tbsp of olive oil in a large sauté pan on medium high heat. Add the shrimp to the pan and cook for 1 minute. Turn the shrimp over in the pan. Lower the heat to medium.Add the garlic, cook a minute more. Add the chopped tomatoes and basil. Sprinkle with salt. Cook for a minute more and remove from heat.Add a tablespoon of salt to the water you used to blanch the tomatoes. Bring to a boil again. Add the angel hair pasta and cook for 3 minutes.Drain the pasta and immediately add to pot with the shrimp and tomatoes. Drizzle the pasta with 2 Tbsp of olive oil. Then stir the pasta in with the shrimp and tomatoes. Serve immediately or at room temp.','http://cdn.shopify.com/s/files/1/1148/3974/articles/pasta-pomodoro-with-shrimp-horiz-a-800_grande_99f8f7fb-8733-41b3-82db-3e2641572e56_large.jpg?v=1456216102','for Cherry Tomatoes 2016','February 23, 2016','by Ann Reed','What’s your go-to quick midweek meal? Shrimps should be on your quick meal list. Tossing them with quickly cooked fresh tomatoes, garlic, and basil, the way how you get excellent filling to your pasta.Ingredients1/2 pound angel hair pasta3/4 pound raw, peeled, deveined shrimp (medium sized)4 ripe Campari Tomatoes3 cloves garlic, minced1/3 cup torn fresh basil leaves3 Tbsp olive oil (divided, 1 Tbsp and 2 Tbsp)Salt and freshly ground black pepper to tasteDirectionsFill a large pot with 2 quarts of water. Bring to a boil (You will be using this water to both blanch the tomatoes and boil the pasta.) Core the tomatoes and use a sharp knife to cut a small X into the bottom end of each tomato. When the water is boiling, use a slotted spoon to lower the tomatoes into the water. Blanch for no more than one minute, just enough to loosen the skins. Remove tomatoes with a slotted spoon to a bowl of icy water, saving the blanching water.Peel off the tomato skins from the tomatoes. Cut the tomatoes crosswise in half, and squeeze out most of the seeds and juices. Chop the tomatoes into 1-inch pieces.Heat 1 Tbsp of olive oil in a large sauté pan on medium high heat. Add the shrimp to the pan and cook for 1 minute. Turn the shrimp over in the pan. Lower the heat to medium.Add the garlic, cook a minute more. Add the chopped tomatoes and basil. Sprinkle with salt. Cook for a minute more and remove from heat.Add a tablespoon of salt to the water you used to blanch the tomatoes. Bring to a boil again. Add the angel hair pasta and cook for 3 minutes.Drain the pasta and immediately add to pot with the shrimp and tomatoes. Drizzle the pasta with 2 Tbsp of olive oil. Then stir the pasta in with the shrimp and tomatoes. Serve immediately or at room temp.Thanks               \n                   simplyrecipes.com\n                   for recipe',0),(4,'Spinach Puffs','Ingredients1 10-ounce package frozen chopped spinach, thawed1 garlic1/2 cup crumbled feta1/4 cup minced onion1 tablespoon olive oil1 teaspoon chopped dill1 teaspoon minced garlicKosher salt and freshly ground black pepper2 large eggs1 sheet frozen puff pastry (from a 17.3-ounces package), thawed, rolled out to a 12\" square, kept chilled6-cup muffin pan','Using your hands, squeeze spinach until dry, forcing out as much water as possible (too much water will make for a soggy filling; you should have about 2/3 cup well-drained spinach). Mix spinach and next 5 ingredients in a medium bowl. Season to taste with salt and pepper. In a small bowl, beat 1 egg to blend; fold into spinach mixture.Cut puff pastry into 3 equal strips. Reserve 1 strip for another use. Cut each remaining strip into 3 squares for a total of 6. Place a square in each muffin cup, pressing into bottom and up sides and leaving corners pointing up. Divide filling among cups. Fold pastry over filling, pressing corners together to meet in center. DO AHEAD: Spinach puffs can be assembled 3 hours ahead. Cover puffs and chill.Preheat oven to 400°F. Beat remaining egg to blend in a small bowl. Brush pastry with egg wash (this will give the pastry a nice sheen). Bake until pastry is golden brown and puffed, about 25 minutes. Transfer to a wire rack; let puffs cool in pan for 10 minutes. Run a sharp paring knife around pan edges to loosen; turn out puffs onto rack to cool slightly before serving.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Spinach-Puffs_large.jpg?v=1462445399','for Spinach','February 23, 2016','by Ann Reed','Serve these little spinach pies with a main course as your vegetable side and dinner roll in one, or eat a couple for a vegetarian dinner—they\'re that good.Ingredients1 10-ounce package frozen chopped spinach, thawed1 garlic1/2 cup crumbled feta1/4 cup minced onion1 tablespoon olive oil1 teaspoon chopped dill1 teaspoon minced garlicKosher salt and freshly ground black pepper2 large eggs1 sheet frozen puff pastry (from a 17.3-ounces package), thawed, rolled out to a 12\" square, kept chilled6-cup muffin panDirectionsUsing your hands, squeeze spinach until dry, forcing out as much water as possible (too much water will make for a soggy filling; you should have about 2/3 cup well-drained spinach). Mix spinach and next 5 ingredients in a medium bowl. Season to taste with salt and pepper. In a small bowl, beat 1 egg to blend; fold into spinach mixture.Cut puff pastry into 3 equal strips. Reserve 1 strip for another use. Cut each remaining strip into 3 squares for a total of 6. Place a square in each muffin cup, pressing into bottom and up sides and leaving corners pointing up. Divide filling among cups. Fold pastry over filling, pressing corners together to meet in center. DO AHEAD: Spinach puffs can be assembled 3 hours ahead. Cover puffs and chill.Preheat oven to 400°F. Beat remaining egg to blend in a small bowl. Brush pastry with egg wash (this will give the pastry a nice sheen). Bake until pastry is golden brown and puffed, about 25 minutes. Transfer to a wire rack; let puffs cool in pan for 10 minutes. Run a sharp paring knife around pan edges to loosen; turn out puffs onto rack to cool slightly before serving.',0),(5,'Pasta with Swordfish and Cherry Tomato Sauce','Ingredients3 tablespoons olive oil, divided4 oil-packed anchovy fillets4 garlic cloves, sliced1/2 teaspoon crushed red pepper flakes2 pints cherry tomatoes, halvedKosher salt, freshly ground pepper1 pound (1\"-thick) swordfish steaks2 tablespoons pine nuts12 ounces casarecce or other short pasta1/2 cup chopped fresh parsley, divided2 tablespoons golden raisins','Heat 2 tablespoons oil in a large skillet over medium. Cook anchovies, garlic, and red pepper flakes, stirring occasionally, until anchovies disintegrate, about 3 minutes. Add half of tomatoes; season with salt and pepper. Cook, stirring occasionally, until sauce thickens, 12–15 minutes. Add remaining tomatoes; remove from heat.Meanwhile, heat remaining 1 tablespoon oil in a large skillet over medium-high. Season fish with salt and pepper and cook until golden brown and just cooked through, about 4 minutes per side. Let cool slightly. Coarsely flake flesh; discard skin.Toast nuts in a dry small skillet over medium-low heat, tossing often, until golden brown, about 4 minutes. Let cool.Cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 1 cup pasta cooking liquid.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Serve pasta topped with raisins, pine nuts, and remaining parsley.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Pasta_with_Swordfish_and_Cherry_Tomato_Sauce_large.png?v=1462438823','for Cherry Tomatoes 2016','February 23, 2016','by Ann Reed','This recipe is the epitome of Sicily with the swordfish, pine nuts, and golden raisins. It is fun to make and even better to eat taking you to Sicily island.Ingredients3 tablespoons olive oil, divided4 oil-packed anchovy fillets4 garlic cloves, sliced1/2 teaspoon crushed red pepper flakes2 pints cherry tomatoes, halvedKosher salt, freshly ground pepper1 pound (1\"-thick) swordfish steaks2 tablespoons pine nuts12 ounces casarecce or other short pasta1/2 cup chopped fresh parsley, divided2 tablespoons golden raisinsDirectionsHeat 2 tablespoons oil in a large skillet over medium. Cook anchovies, garlic, and red pepper flakes, stirring occasionally, until anchovies disintegrate, about 3 minutes. Add half of tomatoes; season with salt and pepper. Cook, stirring occasionally, until sauce thickens, 12–15 minutes. Add remaining tomatoes; remove from heat.Meanwhile, heat remaining 1 tablespoon oil in a large skillet over medium-high. Season fish with salt and pepper and cook until golden brown and just cooked through, about 4 minutes per side. Let cool slightly. Coarsely flake flesh; discard skin.Toast nuts in a dry small skillet over medium-low heat, tossing often, until golden brown, about 4 minutes. Let cool.Cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 1 cup pasta cooking liquid.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Serve pasta topped with raisins, pine nuts, and remaining parsley.',0),(6,'Plum Freezer Jam with Cardamon and Ginger','Ingredients1/3 cups coarsely chopped Meynard Plums (from about 1 1/4 pounds)1 (1-inch) piece ginger (about 1 1/2 ounces)1 1/3 cups sugar1/4 cup Ball® RealFruit® Instant Pectin2 tablespoons fresh lemon juice1/4 teaspoon freshly ground black pepper1/4 teaspoon ground cardamom','Bring plums and 1 cup water to a boil in a medium saucepan, then reduce heat to low and simmer until plums begin to soften and liquid is reduced by about half, about 5 minutes.Meanwhile, finely grate ginger, then squeeze juice into a small bowl; discard pulp.Combine sugar and pectin in a large bowl. Add plum mixture, lemon juice, pepper, cardamom, and 1 tsp. ginger juice (discard any remaining juice), then stir constantly for about 3 minutes to activate pectin. Using a potato masher or fork, break up any large plum pieces, then let cool at least 30 minutes.Ladle jam into sterilized jars, leaving 1/2 from the top to allow for expansion. Cover and chill.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Plum_Freezer_Jam_with_Cardamon_and_Ginger_large.png?v=1462438245','for Stanley Plums','February 23, 2016','by Ann Reed','Neither long simmering nor heat-canned, this vibrant, lightly spiced jam couldn\'t be simpler to prepare. Red-fleshed plums lend a gorgeous garnet color, but any variety works well. Ingredients1/3 cups coarsely chopped Meynard Plums (from about 1 1/4 pounds)1 (1-inch) piece ginger (about 1 1/2 ounces)1 1/3 cups sugar1/4 cup Ball® RealFruit® Instant Pectin2 tablespoons fresh lemon juice1/4 teaspoon freshly ground black pepper1/4 teaspoon ground cardamomDirectionsBring plums and 1 cup water to a boil in a medium saucepan, then reduce heat to low and simmer until plums begin to soften and liquid is reduced by about half, about 5 minutes.Meanwhile, finely grate ginger, then squeeze juice into a small bowl; discard pulp.Combine sugar and pectin in a large bowl. Add plum mixture, lemon juice, pepper, cardamom, and 1 tsp. ginger juice (discard any remaining juice), then stir constantly for about 3 minutes to activate pectin. Using a potato masher or fork, break up any large plum pieces, then let cool at least 30 minutes.Ladle jam into sterilized jars, leaving 1/2 from the top to allow for expansion. Cover and chill.',0),(7,'Oven Risotto with Kale Pesto','Ingredients1/2 cup walnuts, coarsely chopped, divided4 tablespoons olive oil, divided1 medium onion, finely chopped1 cup arborio riceKosher salt, freshly ground pepper1/2 cup dry white wine1 small garlic clove1 cup (packed) fresh parsley leaves3 tablespoons chopped fresh chives2 cups torn Tuscan kale leaves, divided2 tablespoons unsalted butter3 ounces Parmesan, finely grated (about 2 cups)','Preheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes. Let cool.Meanwhile, heat 2 tablespoons oil in a large ovenproof saucepan over medium heat. Add onion and cook, stirring often, until softened and translucent, 5–8 minutes. Stir in rice; season with salt and pepper. Cook, stirring, until some grains are translucent, about 5 minutes.Add wine, bring to a simmer, and cook until pan is almost dry, about 3 minutes. Add 2 cups very hot water; season with salt and pepper. Bring to a simmer, cover, and bake in oven until liquid is mostly absorbed but rice is still starchy in the center, 15–18 minutes (it should be undercooked).Meanwhile, pulse garlic and half of toasted walnuts in a food processor until very finely ground. Add parsley, chives, half of kale, remaining 2 tablespoons oil, and 1/4 cup cold water; process until smooth; season pesto with salt and pepper.Set saucepan over medium heat. Add 3/4 cup very hot water and cook rice, stirring constantly, until it is tender but still has some bite and sauce is creamy, about 3 minutes. Stir in pesto, butter, three-quarters of Parmesan, and remaining kale. Adjust consistency with water, if needed; season with salt and pepper. Serve topped with remaining walnuts and cheese.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Risotto_with_Kale_Pesto_large.png?v=1462438343','for Green Mixed Spice','February 23, 2016','by Ann Reed','If you have a ton of kale at home, this is a great use for it. This combination of rice and kale make them perfect candidates for a gorgeous veggie dinner.Ingredients1/2 cup walnuts, coarsely chopped, divided4 tablespoons olive oil, divided1 medium onion, finely chopped1 cup arborio riceKosher salt, freshly ground pepper1/2 cup dry white wine1 small garlic clove1 cup (packed) fresh parsley leaves3 tablespoons chopped fresh chives2 cups torn Tuscan kale leaves, divided2 tablespoons unsalted butter3 ounces Parmesan, finely grated (about 2 cups)DirectionsPreheat oven to 350°. Toast walnuts on a rimmed baking sheet, tossing occasionally, until golden brown, 8–10 minutes. Let cool.Meanwhile, heat 2 tablespoons oil in a large ovenproof saucepan over medium heat. Add onion and cook, stirring often, until softened and translucent, 5–8 minutes. Stir in rice; season with salt and pepper. Cook, stirring, until some grains are translucent, about 5 minutes.Add wine, bring to a simmer, and cook until pan is almost dry, about 3 minutes. Add 2 cups very hot water; season with salt and pepper. Bring to a simmer, cover, and bake in oven until liquid is mostly absorbed but rice is still starchy in the center, 15–18 minutes (it should be undercooked).Meanwhile, pulse garlic and half of toasted walnuts in a food processor until very finely ground. Add parsley, chives, half of kale, remaining 2 tablespoons oil, and 1/4 cup cold water; process until smooth; season pesto with salt and pepper.Set saucepan over medium heat. Add 3/4 cup very hot water and cook rice, stirring constantly, until it is tender but still has some bite and sauce is creamy, about 3 minutes. Stir in pesto, butter, three-quarters of Parmesan, and remaining kale. Adjust consistency with water, if needed; season with salt and pepper. Serve topped with remaining walnuts and cheese.',0),(8,'Pasta Pomodoro with Shrimp','Ingredients1/2 pound angel hair pasta3/4 pound raw, peeled, deveined shrimp (medium sized)4 ripe Campari Tomatoes3 cloves garlic, minced1/3 cup torn fresh basil leaves3 Tbsp olive oil (divided, 1 Tbsp and 2 Tbsp)Salt and freshly ground black pepper to taste','Fill a large pot with 2 quarts of water. Bring to a boil (You will be using this water to both blanch the tomatoes and boil the pasta.) Core the tomatoes and use a sharp knife to cut a small X into the bottom end of each tomato. When the water is boiling, use a slotted spoon to lower the tomatoes into the water. Blanch for no more than one minute, just enough to loosen the skins. Remove tomatoes with a slotted spoon to a bowl of icy water, saving the blanching water.Peel off the tomato skins from the tomatoes. Cut the tomatoes crosswise in half, and squeeze out most of the seeds and juices. Chop the tomatoes into 1-inch pieces.Heat 1 Tbsp of olive oil in a large sauté pan on medium high heat. Add the shrimp to the pan and cook for 1 minute. Turn the shrimp over in the pan. Lower the heat to medium.Add the garlic, cook a minute more. Add the chopped tomatoes and basil. Sprinkle with salt. Cook for a minute more and remove from heat.Add a tablespoon of salt to the water you used to blanch the tomatoes. Bring to a boil again. Add the angel hair pasta and cook for 3 minutes.Drain the pasta and immediately add to pot with the shrimp and tomatoes. Drizzle the pasta with 2 Tbsp of olive oil. Then stir the pasta in with the shrimp and tomatoes. Serve immediately or at room temp.','http://cdn.shopify.com/s/files/1/1148/3974/articles/pasta-pomodoro-with-shrimp-horiz-a-800_grande_99f8f7fb-8733-41b3-82db-3e2641572e56_large.jpg?v=1456216102','for Cherry Tomatoes 2016','February 23, 2016','by Ann Reed','What’s your go-to quick midweek meal? Shrimps should be on your quick meal list. Tossing them with quickly cooked fresh tomatoes, garlic, and basil, the way how you get excellent filling to your pasta.Ingredients1/2 pound angel hair pasta3/4 pound raw, peeled, deveined shrimp (medium sized)4 ripe Campari Tomatoes3 cloves garlic, minced1/3 cup torn fresh basil leaves3 Tbsp olive oil (divided, 1 Tbsp and 2 Tbsp)Salt and freshly ground black pepper to tasteDirectionsFill a large pot with 2 quarts of water. Bring to a boil (You will be using this water to both blanch the tomatoes and boil the pasta.) Core the tomatoes and use a sharp knife to cut a small X into the bottom end of each tomato. When the water is boiling, use a slotted spoon to lower the tomatoes into the water. Blanch for no more than one minute, just enough to loosen the skins. Remove tomatoes with a slotted spoon to a bowl of icy water, saving the blanching water.Peel off the tomato skins from the tomatoes. Cut the tomatoes crosswise in half, and squeeze out most of the seeds and juices. Chop the tomatoes into 1-inch pieces.Heat 1 Tbsp of olive oil in a large sauté pan on medium high heat. Add the shrimp to the pan and cook for 1 minute. Turn the shrimp over in the pan. Lower the heat to medium.Add the garlic, cook a minute more. Add the chopped tomatoes and basil. Sprinkle with salt. Cook for a minute more and remove from heat.Add a tablespoon of salt to the water you used to blanch the tomatoes. Bring to a boil again. Add the angel hair pasta and cook for 3 minutes.Drain the pasta and immediately add to pot with the shrimp and tomatoes. Drizzle the pasta with 2 Tbsp of olive oil. Then stir the pasta in with the shrimp and tomatoes. Serve immediately or at room temp.Thanks               \n                   simplyrecipes.com \n                   for recipe',0),(9,'Spinach Puffs','Ingredients1 10-ounce package frozen chopped spinach, thawed1 garlic1/2 cup crumbled feta1/4 cup minced onion1 tablespoon olive oil1 teaspoon chopped dill1 teaspoon minced garlicKosher salt and freshly ground black pepper2 large eggs1 sheet frozen puff pastry (from a 17.3-ounces package), thawed, rolled out to a 12\" square, kept chilled6-cup muffin pan','Using your hands, squeeze spinach until dry, forcing out as much water as possible (too much water will make for a soggy filling; you should have about 2/3 cup well-drained spinach). Mix spinach and next 5 ingredients in a medium bowl. Season to taste with salt and pepper. In a small bowl, beat 1 egg to blend; fold into spinach mixture.Cut puff pastry into 3 equal strips. Reserve 1 strip for another use. Cut each remaining strip into 3 squares for a total of 6. Place a square in each muffin cup, pressing into bottom and up sides and leaving corners pointing up. Divide filling among cups. Fold pastry over filling, pressing corners together to meet in center. DO AHEAD: Spinach puffs can be assembled 3 hours ahead. Cover puffs and chill.Preheat oven to 400°F. Beat remaining egg to blend in a small bowl. Brush pastry with egg wash (this will give the pastry a nice sheen). Bake until pastry is golden brown and puffed, about 25 minutes. Transfer to a wire rack; let puffs cool in pan for 10 minutes. Run a sharp paring knife around pan edges to loosen; turn out puffs onto rack to cool slightly before serving.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Spinach-Puffs_large.jpg?v=1462445399','for Spinach','February 23, 2016','by Ann Reed','Serve these little spinach pies with a main course as your vegetable side and dinner roll in one, or eat a couple for a vegetarian dinner—they\'re that good.Ingredients1 10-ounce package frozen chopped spinach, thawed1 garlic1/2 cup crumbled feta1/4 cup minced onion1 tablespoon olive oil1 teaspoon chopped dill1 teaspoon minced garlicKosher salt and freshly ground black pepper2 large eggs1 sheet frozen puff pastry (from a 17.3-ounces package), thawed, rolled out to a 12\" square, kept chilled6-cup muffin panDirectionsUsing your hands, squeeze spinach until dry, forcing out as much water as possible (too much water will make for a soggy filling; you should have about 2/3 cup well-drained spinach). Mix spinach and next 5 ingredients in a medium bowl. Season to taste with salt and pepper. In a small bowl, beat 1 egg to blend; fold into spinach mixture.Cut puff pastry into 3 equal strips. Reserve 1 strip for another use. Cut each remaining strip into 3 squares for a total of 6. Place a square in each muffin cup, pressing into bottom and up sides and leaving corners pointing up. Divide filling among cups. Fold pastry over filling, pressing corners together to meet in center. DO AHEAD: Spinach puffs can be assembled 3 hours ahead. Cover puffs and chill.Preheat oven to 400°F. Beat remaining egg to blend in a small bowl. Brush pastry with egg wash (this will give the pastry a nice sheen). Bake until pastry is golden brown and puffed, about 25 minutes. Transfer to a wire rack; let puffs cool in pan for 10 minutes. Run a sharp paring knife around pan edges to loosen; turn out puffs onto rack to cool slightly before serving.',0),(10,'Pasta with Swordfish and Cherry Tomato Sauce','Ingredients3 tablespoons olive oil, divided4 oil-packed anchovy fillets4 garlic cloves, sliced1/2 teaspoon crushed red pepper flakes2 pints cherry tomatoes, halvedKosher salt, freshly ground pepper1 pound (1\"-thick) swordfish steaks2 tablespoons pine nuts12 ounces casarecce or other short pasta1/2 cup chopped fresh parsley, divided2 tablespoons golden raisins','Heat 2 tablespoons oil in a large skillet over medium. Cook anchovies, garlic, and red pepper flakes, stirring occasionally, until anchovies disintegrate, about 3 minutes. Add half of tomatoes; season with salt and pepper. Cook, stirring occasionally, until sauce thickens, 12–15 minutes. Add remaining tomatoes; remove from heat.Meanwhile, heat remaining 1 tablespoon oil in a large skillet over medium-high. Season fish with salt and pepper and cook until golden brown and just cooked through, about 4 minutes per side. Let cool slightly. Coarsely flake flesh; discard skin.Toast nuts in a dry small skillet over medium-low heat, tossing often, until golden brown, about 4 minutes. Let cool.Cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 1 cup pasta cooking liquid.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Serve pasta topped with raisins, pine nuts, and remaining parsley.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Pasta_with_Swordfish_and_Cherry_Tomato_Sauce_large.png?v=1462438823','for Cherry Tomatoes 2016','February 23, 2016','by Ann Reed','This recipe is the epitome of Sicily with the swordfish, pine nuts, and golden raisins. It is fun to make and even better to eat taking you to Sicily island.Ingredients3 tablespoons olive oil, divided4 oil-packed anchovy fillets4 garlic cloves, sliced1/2 teaspoon crushed red pepper flakes2 pints cherry tomatoes, halvedKosher salt, freshly ground pepper1 pound (1\"-thick) swordfish steaks2 tablespoons pine nuts12 ounces casarecce or other short pasta1/2 cup chopped fresh parsley, divided2 tablespoons golden raisinsDirectionsHeat 2 tablespoons oil in a large skillet over medium. Cook anchovies, garlic, and red pepper flakes, stirring occasionally, until anchovies disintegrate, about 3 minutes. Add half of tomatoes; season with salt and pepper. Cook, stirring occasionally, until sauce thickens, 12–15 minutes. Add remaining tomatoes; remove from heat.Meanwhile, heat remaining 1 tablespoon oil in a large skillet over medium-high. Season fish with salt and pepper and cook until golden brown and just cooked through, about 4 minutes per side. Let cool slightly. Coarsely flake flesh; discard skin.Toast nuts in a dry small skillet over medium-low heat, tossing often, until golden brown, about 4 minutes. Let cool.Cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 1 cup pasta cooking liquid.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Add pasta and 1/2 cup pasta cooking liquid to tomato sauce and cook over low heat, tossing often, and adding more cooking liquid as needed, until sauce is thickened and coats pasta. Add fish to pasta along with half of parsley and toss once to combine.Serve pasta topped with raisins, pine nuts, and remaining parsley.',0),(11,'Fuji Apple Tarte Tatin','IngredientsNonstick vegetable oil spray8 medium Fuji apples1 cup sugar6 tablespoons water1/4 cup (1/2 stick) unsalted butter1 sheet frozen puff pastry (half of 17.3-ounce package), thawed','Position rack in top third of oven and preheat to 425°F. Spray 8-inch-diameter cake pan with 3-inch-high sides with nonstick spray. Peel, quarter and core apples; place in bowl and set aside.Combine sugar and 6 tablespoons water in heavy medium saucepan. Stir over medium heat until sugar dissolves, occasionally brushing down sides of pan with wet pastry brush. Increase heat and boil without stirring until syrup is deep amber, occasionally brushing down sides of pan with wet pastry brush and swirling pan, about 10 minutes. Remove pan from heat. Add butter (caramel will bubble vigorously); stir to blend. Pour caramel into prepared pan. Let cool 5 minutes.Working carefully, stand apples on end in concentric circles in pan, crowding together as much as possible. Cut any remaining apple quarters into thin wedges; insert into empty spaces. Place pan directly over medium heat and bring caramel to simmer, about 2 minutes.Place pan in oven; bake until apples are tender and caramel bubbles thickly, occasionally pressing apples lightly with spatula to compact, about 1 1/2 hours.Meanwhile, unfold pastry sheet on work surface. Using 9-inch tart pan bottom as aid, cut out 9-inch round; pierce all over with fork. Chill until ready to use.Remove pan from oven. Top apples with pastry; tuck in edges. Return to oven; bake until pastry is golden, about 20 minutes. Transfer pan to rack. Cool tart completely in pan, about 3 hours.Place platter atop pan. Hold platter and pan and invert; tart will fall out onto platter. Cut into wedges and serve.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Apple_Tarte_Tatin_large.png?v=1462438204','for Golden Delicious Apples','February 23, 2016','by Ann Reed','This recipe is a keeper as it is easy to make, looks fabulous and tastes great! It makes one feel so, how you say?...French. There would be no leftovers at your dinner party.IngredientsNonstick vegetable oil spray8 medium Fuji apples1 cup sugar6 tablespoons water1/4 cup (1/2 stick) unsalted butter1 sheet frozen puff pastry (half of 17.3-ounce package), thawedDirectionsPosition rack in top third of oven and preheat to 425°F. Spray 8-inch-diameter cake pan with 3-inch-high sides with nonstick spray. Peel, quarter and core apples; place in bowl and set aside.Combine sugar and 6 tablespoons water in heavy medium saucepan. Stir over medium heat until sugar dissolves, occasionally brushing down sides of pan with wet pastry brush. Increase heat and boil without stirring until syrup is deep amber, occasionally brushing down sides of pan with wet pastry brush and swirling pan, about 10 minutes. Remove pan from heat. Add butter (caramel will bubble vigorously); stir to blend. Pour caramel into prepared pan. Let cool 5 minutes.Working carefully, stand apples on end in concentric circles in pan, crowding together as much as possible. Cut any remaining apple quarters into thin wedges; insert into empty spaces. Place pan directly over medium heat and bring caramel to simmer, about 2 minutes.Place pan in oven; bake until apples are tender and caramel bubbles thickly, occasionally pressing apples lightly with spatula to compact, about 1 1/2 hours.Meanwhile, unfold pastry sheet on work surface. Using 9-inch tart pan bottom as aid, cut out 9-inch round; pierce all over with fork. Chill until ready to use.Remove pan from oven. Top apples with pastry; tuck in edges. Return to oven; bake until pastry is golden, about 20 minutes. Transfer pan to rack. Cool tart completely in pan, about 3 hours.Place platter atop pan. Hold platter and pan and invert; tart will fall out onto platter. Cut into wedges and serve.',0),(12,'Granny’s Apple Pie','Ingredients1.5 (15 ounce) packages refrigerated pie crusts, divided6 medium granny smith apples, peeled and sliced (about 6 cups)1 1⁄2 tablespoons lemon juice3⁄4 cup firmly packed brown sugar1⁄2 cup granulated sugar1⁄3 cup all-purpose flour1 teaspoon ground cinnamon1⁄2 teaspoon ground nutmeg ','Unroll and stack 2 pie crusts; gently roll or press together.Fit pastry into a 9 inch deep-dish pie plate.Toss together apples and lemon juice in a large bowl.Combine brown sugar, granulated sugar, and next 3 ingredients; sprinkle over apple mixture and toss to coat.Spoon into prepared pie crust.Unroll and place remaining pie crust over filling.Fold edges under, and crimp; cut slits in top for steam to escape. (I also cover the crimped edges of my crust with foil to prevent burning).Bake at 450 degrees for 15 minutes. Reduce temperature to 350 degrees, and bake for 30-35 minutes.','http://cdn.shopify.com/s/files/1/1148/3974/articles/blog_recipe_01_grande_752a3238-c404-4c44-84f3-1e7bc30b54b8_large.jpg?v=1456215865','for Golden Delicious Apples','February 23, 2016','by Ann Reed','Excellent, not too sugary sweet taste that makes you feel cozy like the time you were a kid visiting your Grandma. Give it a try and share this feeling with others baking the most requested pie.Ingredients1.5 (15 ounce) packages refrigerated pie crusts, divided6 medium granny smith apples, peeled and sliced (about 6 cups)1 1⁄2 tablespoons lemon juice3⁄4 cup firmly packed brown sugar1⁄2 cup granulated sugar1⁄3 cup all-purpose flour1 teaspoon ground cinnamon1⁄2 teaspoon ground nutmeg DirectionsUnroll and stack 2 pie crusts; gently roll or press together.Fit pastry into a 9 inch deep-dish pie plate.Toss together apples and lemon juice in a large bowl.Combine brown sugar, granulated sugar, and next 3 ingredients; sprinkle over apple mixture and toss to coat.Spoon into prepared pie crust.Unroll and place remaining pie crust over filling.Fold edges under, and crimp; cut slits in top for steam to escape. (I also cover the crimped edges of my crust with foil to prevent burning).Bake at 450 degrees for 15 minutes. Reduce temperature to 350 degrees, and bake for 30-35 minutes.Thanks               \n                   Apple Pie \n                    for recipe ',0),(13,'Roasted Squash With Lemon-Tahini Sauce','Ingredients1 small kabocha squash or large acorn squash (1 pound), scrubbed1 1-pound delicata squash, scrubbed, cut into 1\"-thick wedges or rings, seeded7 tablespoons extra-virgin olive oil, divided1 1/2 teaspoons cumin seeds, dividedKosher salt, freshly ground pepper4 scallions, cut into 2\" pieces2 tablespoons fresh lemon juice1 tablespoon tahini (sesame seed paste)Aleppo pepper or crushed red pepper flakes','Arrange racks in upper and lower thirds of oven; preheat to 425°F. Place kabocha on a rimmed baking sheet and delicata on a second sheet. Divide 3 tablespoons oil and 1 1/4 teaspoons cumin between sheets. Season squash with salt and pepper; toss. Roast for 15 minutes.Combine remaining 1/4 teaspoon cumin, 1 tablespoon oil, and scallions in a small bowl; season with salt and pepper and toss to evenly coat. Scatter scallion mixture over squash, dividing evenly between sheets, and continue to roast until squash is tender but not mushy, about 15 minutes longer (time may vary depending on squash).Meanwhile, whisk lemon juice, tahini, and 1 tablespoon water in a small bowl to blend. Gradually whisk in remaining 3 tablespoons oil. Season to taste with salt and pepper.Transfer squash to a platter. Drizzle tahini sauce over and sprinkle with Aleppo pepper.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Roasted_Squash_With_Lemon-Tahini_Sauce_9a9e90a4-7474-470d-9299-908d0f2a1760_large.png?v=1462444942','for Red Kabocha Squash','February 23, 2016','by Ann Reed','Browned edges mean great flavor especially for this dish. You are in need of variety at your dinner parties? This one gonna be an excellent addition to your dinner entree. Ingredients1 small kabocha squash or large acorn squash (1 pound), scrubbed1 1-pound delicata squash, scrubbed, cut into 1\"-thick wedges or rings, seeded7 tablespoons extra-virgin olive oil, divided1 1/2 teaspoons cumin seeds, dividedKosher salt, freshly ground pepper4 scallions, cut into 2\" pieces2 tablespoons fresh lemon juice1 tablespoon tahini (sesame seed paste)Aleppo pepper or crushed red pepper flakesDirectionsArrange racks in upper and lower thirds of oven; preheat to 425°F. Place kabocha on a rimmed baking sheet and delicata on a second sheet. Divide 3 tablespoons oil and 1 1/4 teaspoons cumin between sheets. Season squash with salt and pepper; toss. Roast for 15 minutes.Combine remaining 1/4 teaspoon cumin, 1 tablespoon oil, and scallions in a small bowl; season with salt and pepper and toss to evenly coat. Scatter scallion mixture over squash, dividing evenly between sheets, and continue to roast until squash is tender but not mushy, about 15 minutes longer (time may vary depending on squash).Meanwhile, whisk lemon juice, tahini, and 1 tablespoon water in a small bowl to blend. Gradually whisk in remaining 3 tablespoons oil. Season to taste with salt and pepper.Transfer squash to a platter. Drizzle tahini sauce over and sprinkle with Aleppo pepper.',0),(14,'Mini Puff Pastry Apple Roses','Ingredients1-2 Empire Apples, cored and sliced as thin as possibleSqueeze of lemon juiceFlour, to dust1 sheet frozen puff pastry, thawed3 tablespoons apricot preserves1/8 teaspoon cinnamon','Lightly butter a muffin tin. Preheat the oven to 375°F.Place the apple slices in a bowl with the lemon juice and cover with water. Microwave until the slices are slightly softened, about 3 minutes.Lightly flour your workspace and roll out the puff pastry as thin as possible, keeping it in a rectangular shape. You want the pastry to be fairly thin – if you leave the puff too thick, it will have issues baking all the way through. Trim the pastry into 6 or 12 strips, depending on if you are making mini or regular roses.Mix the apricot preserves with 2 tablespoons of hot water and stir well. Brush onto the puff pastry. Place the apple slices on the puff, about halfway down, overlapping. Sprinkle with a touch of cinnamon, if using. Fold up the puff pastry and gently roll up, placing into the prepared tin when done.Bake until puff is golden brown and cooked through, 40-45 minutes. If the apples start to brown too much, cover with a piece of foil. Remove, let cool, and enjoy!','http://cdn.shopify.com/s/files/1/1148/3974/articles/apple-roses-14_grande_ed4bd0cb-8823-4f65-b334-ebcd3ceade65_large.jpg?v=1456215595','for Golden Delicious Apples','February 23, 2016','by Ann Reed','There are so many iterations of apple roses online, each more beautiful than the last. This particular ones are super simple to put together and fun to eat too. They’re basically a rolled up version of an apple tart. So it is gonna be a tempting dessert for apple-lovers.Ingredients1-2 Empire Apples, cored and sliced as thin as possibleSqueeze of lemon juiceFlour, to dust1 sheet frozen puff pastry, thawed3 tablespoons apricot preserves1/8 teaspoon cinnamonDirectionsLightly butter a muffin tin. Preheat the oven to 375°F.Place the apple slices in a bowl with the lemon juice and cover with water. Microwave until the slices are slightly softened, about 3 minutes.Lightly flour your workspace and roll out the puff pastry as thin as possible, keeping it in a rectangular shape. You want the pastry to be fairly thin – if you leave the puff too thick, it will have issues baking all the way through. Trim the pastry into 6 or 12 strips, depending on if you are making mini or regular roses.Mix the apricot preserves with 2 tablespoons of hot water and stir well. Brush onto the puff pastry. Place the apple slices on the puff, about halfway down, overlapping. Sprinkle with a touch of cinnamon, if using. Fold up the puff pastry and gently roll up, placing into the prepared tin when done.Bake until puff is golden brown and cooked through, 40-45 minutes. If the apples start to brown too much, cover with a piece of foil. Remove, let cool, and enjoy!Thanks               \n                   iamafoodblog.com \n                  for recipe',0),(15,'Roasted Red Onion Flowers','Ingredients6 medium red onions, skin on, roots intact6 tablespoons olive oil, dividedSalt (smoked is delicious here)Herbs-either a few bay leaves or a few sprigs of rosemary and thymeFreshly ground black pepper','Preheat oven to 350°.Make a total of 4 vertical cuts in each onion to create 8 wedges still attached at the root end.Drizzle a little of the olive oil into a baking dish, then arrange onions root end down.Spoon remaining olive oil into and around onions. Sprinkle generously with salt, getting some into the center of the onions. Toss in herbs.Roast for 40 minutes. Rearrange onions so that their petals open, and drizzle with a few spoonfuls of the caramelized onion juices from the pan. Roast until onions are tender on the inside with crispy bits on their outer petals, about 20 minutes longer. Season with pepper and more salt to taste. Serve hot or at room temperature as a side dish, or as dinner with a good cheese and a green salad.','http://cdn.shopify.com/s/files/1/1148/3974/articles/51238840_roasted-red-onion_1x1_grande_66c74ef9-b6df-4f43-833e-eabd2ccca86a_large.jpg?v=1456215533','for Red Onions','February 23, 2016','by Ann Reed','Embroidery on your table is not forbidden if you can eat it. These onions are the case when your food looks intriguing and tastes delicious.Ingredients6 medium red onions, skin on, roots intact6 tablespoons olive oil, dividedSalt (smoked is delicious here)Herbs-either a few bay leaves or a few sprigs of rosemary and thymeFreshly ground black pepperDirectionsPreheat oven to 350°.Make a total of 4 vertical cuts in each onion to create 8 wedges still attached at the root end.Drizzle a little of the olive oil into a baking dish, then arrange onions root end down.Spoon remaining olive oil into and around onions. Sprinkle generously with salt, getting some into the center of the onions. Toss in herbs.Roast for 40 minutes. Rearrange onions so that their petals open, and drizzle with a few spoonfuls of the caramelized onion juices from the pan. Roast until onions are tender on the inside with crispy bits on their outer petals, about 20 minutes longer. Season with pepper and more salt to taste. Serve hot or at room temperature as a side dish, or as dinner with a good cheese and a green salad.Thanks               \n                   allrecipes.com \n                  for recipe',0),(16,'Herbed Corn Oil','Ingredients3 cups (packed) fresh parsley leaves1 garlic1 tablespoon finely grated lemon zest1 1/4 cups extra-virgin olive oil1/2 teaspoon kosher salt','Peel garlic and grind it meticulously. Pulse parsley and lemon zest in a food processor until coarsely chopped.Add garlic and pulse again.Add oil and salt and pulse again until well combined.Herbed oil can be stored in an airtight container in the refrigerator for up to 2 days.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Herbed_corn_oil_large.png?v=1462443951','for Parsley','February 23, 2016','by Ann Reed','It is great to experiment and give it a try to some new flavours even for the oil you\'re using in your cooking. Simple oil can be absolutely different and become incredibly enriched with new flavors if you add a bunch of fresh herbs to it.Ingredients3 cups (packed) fresh parsley leaves1 garlic1 tablespoon finely grated lemon zest1 1/4 cups extra-virgin olive oil1/2 teaspoon kosher saltDirectionsPeel garlic and grind it meticulously. Pulse parsley and lemon zest in a food processor until coarsely chopped.Add garlic and pulse again.Add oil and salt and pulse again until well combined.Herbed oil can be stored in an airtight container in the refrigerator for up to 2 days.',0),(17,'Plum Galette','IngredientsPastry dough for a single-crust pie2 tablespoons semolina flour8 tablespoons granulated sugar5 large red plums (1 1/2 lb), halved, pitted, and each cut lengthwise into 8 wedges1 tablespoon confectioners sugar3/4 cup creame frache or sour cream1 tablespoon Armagnac or Cognac (optional)Special equipment: parchment paper','Put oven rack in middle position and preheat oven to 375°F. Line a large (17- by 12-inch) baking sheet with parchment paper.Roll out dough on a lightly floured surface with a lightly floured rolling pin into a 13-inch round. Transfer to baking sheet.Stir together semolina flour and 2 tablespoons granulated sugar and spread evenly over dough, leaving a 1-inch border. Arrange plums, skin sides down, in 1 layer on top of sugar mixture, then sprinkle plums with 3 tablespoons granulated sugar. Fold in edge of dough to cover outer rim of plums, pleating dough as necessary.Bake galette, loosely covered with a sheet of foil, 40 minutes. Remove foil and bake until fruit is tender and juices are bubbling, about 5 minutes more.Transfer galette on baking sheet to a rack and immediately brush hot juices over plums using a pastry brush. Dust hot galette with confectioners sugar. Cool to warm or room temperature, about 30 minutes.','http://cdn.shopify.com/s/files/1/1148/3974/articles/plum-galette-horiz-a-640_grande_c9c087e4-700d-4ba1-83ba-826025b11984_large.jpg?v=1456215393','for Strawberries','February 23, 2016','by Ann Reed','The beauty of plums becomes all the more evident when they are displayed in a galette. Accompanied by sweetened Armagnac crème fraîche, this one makes a wonderfully sophisticated dessert.IngredientsPastry dough for a single-crust pie2 tablespoons semolina flour8 tablespoons granulated sugar5 large red plums (1 1/2 lb), halved, pitted, and each cut lengthwise into 8 wedges1 tablespoon confectioners sugar3/4 cup creame frache or sour cream1 tablespoon Armagnac or Cognac (optional)Special equipment: parchment paperDirectionsPut oven rack in middle position and preheat oven to 375°F. Line a large (17- by 12-inch) baking sheet with parchment paper.Roll out dough on a lightly floured surface with a lightly floured rolling pin into a 13-inch round. Transfer to baking sheet.Stir together semolina flour and 2 tablespoons granulated sugar and spread evenly over dough, leaving a 1-inch border. Arrange plums, skin sides down, in 1 layer on top of sugar mixture, then sprinkle plums with 3 tablespoons granulated sugar. Fold in edge of dough to cover outer rim of plums, pleating dough as necessary.Bake galette, loosely covered with a sheet of foil, 40 minutes. Remove foil and bake until fruit is tender and juices are bubbling, about 5 minutes more.Transfer galette on baking sheet to a rack and immediately brush hot juices over plums using a pastry brush. Dust hot galette with confectioners sugar. Cool to warm or room temperature, about 30 minutes.',0),(18,'Plum Tarts With Honey and Black Pepper','Ingredients1 pound Stanley plums, pitted, cut into 1/2 wedges1 sheet frozen puff pastry (one 14-ounce package or half of 17.3-ounce package), thawed according to package directions1/4 cup sugarFreshly ground black pepper1 tablespoon honeyFlaky sea salt (such as Maldon)','Preheat oven to 425°. Cut pastry into six 4\" squares, place on a parchment-lined baking sheet, and prick all over with a fork. Top with plums, leaving a 1/2 border.Sprinkle with sugar; season with a few grinds of pepper.Bake tarts, rotating pan halfway through, until edges of pastry are puffed and golden brown, 25-30 minutes.Drizzle with honey and sprinkle with salt just before serving.Do ahead: Tarts can be baked 4 hours ahead. Keep at room temperature.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Plum-tarts_large.png?v=1462444405','for Strawberries','February 23, 2016','by Ann Reed','Consider this a two-ingredient tart. Besides the plums and pastry, we bet you have everything else on hand.Ingredients1 pound Stanley plums, pitted, cut into 1/2 wedges1 sheet frozen puff pastry (one 14-ounce package or half of 17.3-ounce package), thawed according to package directions1/4 cup sugarFreshly ground black pepper1 tablespoon honeyFlaky sea salt (such as Maldon)DirectionsPreheat oven to 425°. Cut pastry into six 4\" squares, place on a parchment-lined baking sheet, and prick all over with a fork. Top with plums, leaving a 1/2 border.Sprinkle with sugar; season with a few grinds of pepper.Bake tarts, rotating pan halfway through, until edges of pastry are puffed and golden brown, 25-30 minutes.Drizzle with honey and sprinkle with salt just before serving.Do ahead: Tarts can be baked 4 hours ahead. Keep at room temperature.',0),(19,'Peach Salsa','Ingredients4 ripe but firm yellow peaches2-3 Tbsp chopped shallots or onions2-3 jalapenosLemon juice2 Tbsp chopped fresh mint2 Tbsp grated ginger1 teaspoon sugarSalt and black pepper to taste','Prepare peaches. Skin on or off, your choice, skin on makes for better color, but if skin is too thick or fuzzy you may want to peel first. Then chop.Put the chopped peaches, shallots, and jalapeños in the bowl of a food processor. Add the remaining ingredients. Pulse 2-3 times, just enough to get most the pieces small and to well combine the salsa. Do not liquefy it.Place salsa into a bowl and cover. Let stand for an hour before serving to give the ingredients time to meld.Serve with chips, with fish, pork, or chicken.','http://cdn.shopify.com/s/files/1/1148/3974/articles/peach-salsa-a_grande_af134402-ef32-400a-8b83-443f615cf610_large.jpg?v=1456215174','for Peaches','February 23, 2016','by Ann Reed','At your disposal, here’s a quick and easy salsa, made with fresh peaches, jalapeños, lemon, ginger and mint, that goes beautifully with the grilled meats of your outdoor dinners.Ingredients4 ripe but firm yellow peaches2-3 Tbsp chopped shallots or onions2-3 jalapenosLemon juice2 Tbsp chopped fresh mint2 Tbsp grated ginger1 teaspoon sugarSalt and black pepper to tasteDirectionsPrepare peaches. Skin on or off, your choice, skin on makes for better color, but if skin is too thick or fuzzy you may want to peel first. Then chop.Put the chopped peaches, shallots, and jalapeños in the bowl of a food processor. Add the remaining ingredients. Pulse 2-3 times, just enough to get most the pieces small and to well combine the salsa. Do not liquefy it.Place salsa into a bowl and cover. Let stand for an hour before serving to give the ingredients time to meld.Serve with chips, with fish, pork, or chicken.Thanks               \n                   simplyrecipes.com \n                   for recipe',0),(20,'Warm Almond Cake with Grapes','Ingredients1 1/2 tablespoons Cognac (optional)1 cup Thompson Seedless Grapes, halved3/4 cup whole blanched almonds (3 3/4 ounces)1/2 cup sugar1 stick (1/2 cup) unsalted butter, softened3/4 teaspoon vanilla2 large eggs1/3 cup all-purpose flour1/8 teaspoon salt','Put oven rack in upper third of oven and preheat oven to 400°F.If using Cognac, toss grapes with it in a small bowl.Pulse half of almonds with 1 tablespoon sugar in a blender until finely ground. Transfer to a small bowl and repeat with remaining almonds and 1 more tablespoon sugar.Beat together butter and remaining 6 tablespoons sugar in a bowl with an electric mixer at high speed until pale and fluffy, then beat in vanilla. Add eggs 1 at a time, beating well after each addition. Reduce speed to low and beat in ground almonds, flour, and salt until just combined.Divide batter among gratin dishes and press grapes lightly into a batter (discard Cognac). Bake in dishes on a baking sheet until cake is firm and pale golden with slightly darker edges, about 20 minutes.Transfer cakes to a rack and cool slightly in dishes before serving.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Warm_Almond_Cake_with_Grapes_large.png?v=1462438131','for Thompson Seedless Grapes','February 23, 2016','by Ann Reed','You would like serving these chewy, moist almond cakes, which are based on the financier, a French pastry, as do we. Definitely a go-to recipe for a quick, delicious dessert still with sophisticated Fresh flavor.Ingredients1 1/2 tablespoons Cognac (optional)1 cup Thompson Seedless Grapes, halved3/4 cup whole blanched almonds (3 3/4 ounces)1/2 cup sugar1 stick (1/2 cup) unsalted butter, softened3/4 teaspoon vanilla2 large eggs1/3 cup all-purpose flour1/8 teaspoon saltDirectionsPut oven rack in upper third of oven and preheat oven to 400°F.If using Cognac, toss grapes with it in a small bowl.Pulse half of almonds with 1 tablespoon sugar in a blender until finely ground. Transfer to a small bowl and repeat with remaining almonds and 1 more tablespoon sugar.Beat together butter and remaining 6 tablespoons sugar in a bowl with an electric mixer at high speed until pale and fluffy, then beat in vanilla. Add eggs 1 at a time, beating well after each addition. Reduce speed to low and beat in ground almonds, flour, and salt until just combined.Divide batter among gratin dishes and press grapes lightly into a batter (discard Cognac). Bake in dishes on a baking sheet until cake is firm and pale golden with slightly darker edges, about 20 minutes.Transfer cakes to a rack and cool slightly in dishes before serving.',0),(21,'Basil Pesto','Ingredients2 cups fresh basil1/4 cup grated parmesan cheese1/4 cup pine nuts1 garlic clove1/2 teaspoon salt1/4 cup olive oil','Place the basil in a blender.Pour in about 1/4 cup of the olive oil, and blend basil into a paste.Gradually add pine nuts, Parmesan cheese, garlic, and remaining oil.Continue to blend until smooth.Season your main dish with the sauce. ','http://cdn.shopify.com/s/files/1/1148/3974/articles/Basil_pesto_large.png?v=1462444520','for Basil','February 23, 2016','by Ann Reed','This is a classic recipe for best pesto if you like the real deal.Ingredients2 cups fresh basil1/4 cup grated parmesan cheese1/4 cup pine nuts1 garlic clove1/2 teaspoon salt1/4 cup olive oilDirectionsPlace the basil in a blender.Pour in about 1/4 cup of the olive oil, and blend basil into a paste.Gradually add pine nuts, Parmesan cheese, garlic, and remaining oil.Continue to blend until smooth.Season your main dish with the sauce. ',0),(22,'Radish Yogurt with Pine Nuts','Ingredients8 medium radishes, very thinly slicedKosher salt1 tablespoon pine nuts1 1/4 cups low-fat plain Greek yogurt1/2 teaspoon finely grated lemon zest, plus more for serving1 tablespoon fresh lemon juice3 tablespoons olive oil, dividedFreshly ground black pepperCucumber spears (for serving)','Toss radishes in a small bowl with a couple pinches of salt. Let sit until salt begins to draw out water from radishes, about 5 minutes.Meanwhile, toast pine nuts in a medium skillet over medium-high heat, tossing often, until golden brown, about 2 minutes. Transfer to a small bowl and let cool.Massage radishes to release liquid, gently at first, then more vigorously as they start to expel water. Squeeze out excess liquid, then finely chop radishes (you should have about 1 cup).Add oil and salt and pulse again until well combined.Mix radishes, yogurt, lemon juice, 2 Tbsp. oil, and 1/2 tsp. lemon zest in a medium bowl; season with salt and pepper.Divide yogurt among bowls, top with pine nuts and more lemon zest and drizzle with remaining 1 Tbsp. oil. Serve with cucumber spears for dipping.Yogurt can be made 3 days ahead; cover and chill. Top with pine nuts and lemon zest just before serving.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Radish_Yogurt_with_Pine_Nuts_large.png?v=1462444552','for Radishes','February 23, 2016','by Ann Reed','Keen on healthy nutrition? This recipe of radish yogurt is your saver for a great breakfast or lunch.Ingredients8 medium radishes, very thinly slicedKosher salt1 tablespoon pine nuts1 1/4 cups low-fat plain Greek yogurt1/2 teaspoon finely grated lemon zest, plus more for serving1 tablespoon fresh lemon juice3 tablespoons olive oil, dividedFreshly ground black pepperCucumber spears (for serving)DirectionsToss radishes in a small bowl with a couple pinches of salt. Let sit until salt begins to draw out water from radishes, about 5 minutes.Meanwhile, toast pine nuts in a medium skillet over medium-high heat, tossing often, until golden brown, about 2 minutes. Transfer to a small bowl and let cool.Massage radishes to release liquid, gently at first, then more vigorously as they start to expel water. Squeeze out excess liquid, then finely chop radishes (you should have about 1 cup).Add oil and salt and pulse again until well combined.Mix radishes, yogurt, lemon juice, 2 Tbsp. oil, and 1/2 tsp. lemon zest in a medium bowl; season with salt and pepper.Divide yogurt among bowls, top with pine nuts and more lemon zest and drizzle with remaining 1 Tbsp. oil. Serve with cucumber spears for dipping.Yogurt can be made 3 days ahead; cover and chill. Top with pine nuts and lemon zest just before serving.',0),(23,'Shakshuka with Capia Peppers and Cumin','Ingredients2 tablespoons olive oil2 tablespoons Paprika & Cayenne Pepper Mixed Spice2 teaspoons tomato paste2 large red peppers, cut into 1/4-inch / 0.5cm dice (2 cups / 300 g in total)4 cloves garlic, finely chopped1 teaspoon ground cumin5 large, very ripe tomatoes, chopped4 large free-range eggs, plus 4 egg yolks1/2 cup / 120 g labneh or thick yogurtSalt','Heat the olive oil in a large frying pan over medium heat and add the pilpelchuma or harissa, tomato paste, peppers, garlic, cumin, and 3/4 teaspoon salt. Stir and cook over medium heat for about 8 minutes to allow the peppers to soften. Add the tomatoes, bring to a gentle simmer, and cook for a further 10 minutes until you have quite a thick sauce. Taste for seasoning.Make 8 little dips in the sauce. Gently break the eggs and carefully pour each into its own dip. Do the same with the yolks. Use a fork to swirl the egg whites a little bit with the sauce, taking care not to break the yolks. Simmer gently for 8 to 10 minutes, until the egg whites are set but the yolks are still runny (you can cover the pan with a lid if you wish to hasten the process). Remove from the heat, leave for a couple of minutes to settle, then spoon into individual plates and serve with the labneh or yogurt.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Shakshuka_with_Capia_Peppers_and_Cumin_large.png?v=1462444596','for Red Bell Pepper','February 23, 2016','by Ann Reed','Shakshuka is Tunisian in origin but has become hugely popular in Jerusalem and all over Israel as substantial breakfast or lunch fare. Would like to add exotic variant to your everyday meal?Ingredients2 tablespoons olive oil2 tablespoons Paprika & Cayenne Pepper Mixed Spice2 teaspoons tomato paste2 large red peppers, cut into 1/4-inch / 0.5cm dice (2 cups / 300 g in total)4 cloves garlic, finely chopped1 teaspoon ground cumin5 large, very ripe tomatoes, chopped4 large free-range eggs, plus 4 egg yolks1/2 cup / 120 g labneh or thick yogurtSaltDirectionsHeat the olive oil in a large frying pan over medium heat and add the pilpelchuma or harissa, tomato paste, peppers, garlic, cumin, and 3/4 teaspoon salt. Stir and cook over medium heat for about 8 minutes to allow the peppers to soften. Add the tomatoes, bring to a gentle simmer, and cook for a further 10 minutes until you have quite a thick sauce. Taste for seasoning.Make 8 little dips in the sauce. Gently break the eggs and carefully pour each into its own dip. Do the same with the yolks. Use a fork to swirl the egg whites a little bit with the sauce, taking care not to break the yolks. Simmer gently for 8 to 10 minutes, until the egg whites are set but the yolks are still runny (you can cover the pan with a lid if you wish to hasten the process). Remove from the heat, leave for a couple of minutes to settle, then spoon into individual plates and serve with the labneh or yogurt.',0),(24,'Roasted Red Bell Pepper','Ingredients5 red bell peppers2 small garlic cloves, very thinly sliced2 tablespoons extra-virgin olive oil1 tablespoon finely chopped fresh oregano3/4 teaspoon coarse sea salt1/4 teaspoon black pepper','Prepare grill for cooking. If using a charcoal grill, open vents on bottom of grill, then light charcoal. Charcoal fire is hot when you can hold your hand 5 inches above rack for 1 to 2 seconds. If using a gas grill, preheat burners on high, covered, 10 minutes, then reduce heat to moderately high.Lay bell peppers on their sides on lightly oiled grill rack and roast, turning occasionally with tongs, until skins are blackened, 10 to 12 minutes.Transfer to a bowl, then cover and let steam 10 minutes. Peel and seed peppers (reserving juices), then cut into 1/4-inch-thick strips.Stir together peppers (with their juices), garlic, oil, vinegar, oregano, sea salt, and pepper and marinate 30 minutes at room temperature.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Roasted_Red_Bell_Pepper_1974c158-f857-494d-a90a-fe0e83354bba_large.png?v=1462446159','for Red Bell Pepper','February 23, 2016','by Ann Reed','Delicious as a side dish, as part of an antipasto, and also wonderful in sandwiches the next day because of its sweet/mellow flavour. Ingredients5 red bell peppers2 small garlic cloves, very thinly sliced2 tablespoons extra-virgin olive oil1 tablespoon finely chopped fresh oregano3/4 teaspoon coarse sea salt1/4 teaspoon black pepperDirectionsPrepare grill for cooking. If using a charcoal grill, open vents on bottom of grill, then light charcoal. Charcoal fire is hot when you can hold your hand 5 inches above rack for 1 to 2 seconds. If using a gas grill, preheat burners on high, covered, 10 minutes, then reduce heat to moderately high.Lay bell peppers on their sides on lightly oiled grill rack and roast, turning occasionally with tongs, until skins are blackened, 10 to 12 minutes.Transfer to a bowl, then cover and let steam 10 minutes. Peel and seed peppers (reserving juices), then cut into 1/4-inch-thick strips.Stir together peppers (with their juices), garlic, oil, vinegar, oregano, sea salt, and pepper and marinate 30 minutes at room temperature.',0),(25,'Paella','Ingredients30 threads saffron, crushed4 chicken thighs10-12 large shrimps, peeled and deveinedsalt and freshly ground pepper, to taste1/2 cup extra-virgin olive oil1 tablespoon Red Mixed Spice1/2 tablespoon smoked paprika3 cloves garlic3 medium tomatoes1 small onion7 cups chicken broth2 1/2 cups short-grain rice1 red pepper12 clams','Put saffron and 1⁄4 cup hot water in a small bowl; let sit for 15 minutes. Season chicken and shrimp with salt and pepper. Heat oil in a 16″–18″ paella pan over medium-high heat. Add chicken, shrimp, and chorizo and cook, turning occasionally, until browned, about 5 minutes.Transfer shrimp to a plate, leaving meats in pan. Add paprika, garlic, tomatoes, and onions to pan and cook, stirring often, until onions soften, about 6 minutes. Add reserved saffron mixture and broth, season with salt, and bring to a boil over high heat.Sprinkle in rice, distribute evenly with a spoon, and add peppers. Cook, without stirring, until rice has absorbed most of the liquid, 12-15 minutes. (If your pan is larger than the burner, rotate it every two minutes so different parts are over the heat and the rice cooks evenly.)Reduce heat to low, add reserved shrimp, and nestle in clams hinge side down; cook, without stirring, until clams have opened and rice has absorbed the liquid and is al dente, 5–10 minutes more. Turn heat to high for 1-2 minutes to create the socarrat. Remove pan from heat, cover with aluminum foil, and let sit for 5 minutes before enjoying.','http://cdn.shopify.com/s/files/1/1148/3974/articles/paella-25_grande_2350030f-37c6-44bb-81df-bb0a5ecea731_large.jpg?v=1456214836','for Red Mixed Spice','February 23, 2016','by Ann Reed','Bring Spain to your dinner making this spicy seafood paella and you won\'t regret. This is really a festive meal where even the color looks enticing and the taste is much more better.Ingredients30 threads saffron, crushed4 chicken thighs10-12 large shrimps, peeled and deveinedsalt and freshly ground pepper, to taste1/2 cup extra-virgin olive oil1 tablespoon Red Mixed Spice1/2 tablespoon smoked paprika3 cloves garlic3 medium tomatoes1 small onion7 cups chicken broth2 1/2 cups short-grain rice1 red pepper12 clamsDirectionsPut saffron and 1⁄4 cup hot water in a small bowl; let sit for 15 minutes. Season chicken and shrimp with salt and pepper. Heat oil in a 16″–18″ paella pan over medium-high heat. Add chicken, shrimp, and chorizo and cook, turning occasionally, until browned, about 5 minutes.Transfer shrimp to a plate, leaving meats in pan. Add paprika, garlic, tomatoes, and onions to pan and cook, stirring often, until onions soften, about 6 minutes. Add reserved saffron mixture and broth, season with salt, and bring to a boil over high heat.Sprinkle in rice, distribute evenly with a spoon, and add peppers. Cook, without stirring, until rice has absorbed most of the liquid, 12-15 minutes. (If your pan is larger than the burner, rotate it every two minutes so different parts are over the heat and the rice cooks evenly.)Reduce heat to low, add reserved shrimp, and nestle in clams hinge side down; cook, without stirring, until clams have opened and rice has absorbed the liquid and is al dente, 5–10 minutes more. Turn heat to high for 1-2 minutes to create the socarrat. Remove pan from heat, cover with aluminum foil, and let sit for 5 minutes before enjoying.Thanks               \n                   iamafoodblog.com \n                   for recipe',0),(26,'Spaghetti with Parsley Pesto','Ingredients1 pound spaghettiKosher salt1/2 cup unsalted, roasted almonds4 cups fresh flat-leaf parsley leaves2 tablespoons Green Mixed Spice3/4 cup chopped fresh chives3/4 cup extra-virgin olive oil1/2 cup finely grated ParmesanFreshly ground black pepper','Cook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 2 cups pasta cooking liquid.Meanwhile, pulse almonds in a food processor until smooth. Add parsley, chives, oil, and Parmesan; process until smooth. Season pesto with salt and pepper and Green Mixed Spice.Toss pasta and pesto in a large bowl, adding pasta cooking liquid by 1/4-cupfuls until saucy. Season with salt and pepper.Pesto can be made 5 days ahead. Cover surface directly; chill.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Spaghetti-with-Parsley-Pesto_large.png?v=1462444730','for Green Mixed Spice','February 23, 2016','by Ann Reed','Why be limited to basil cooking pesto? Swapping in flat-leaf parsley makes for a balanced sauce that allows you to really taste the nuts, the olive oil, the Parmesan. Use this sauce as you would any pesto, yes, swirled into pasta.Ingredients1 pound spaghettiKosher salt1/2 cup unsalted, roasted almonds4 cups fresh flat-leaf parsley leaves2 tablespoons Green Mixed Spice3/4 cup chopped fresh chives3/4 cup extra-virgin olive oil1/2 cup finely grated ParmesanFreshly ground black pepperDirectionsCook pasta in a large pot of boiling salted water, stirring occasionally, until al dente. Drain, reserving 2 cups pasta cooking liquid.Meanwhile, pulse almonds in a food processor until smooth. Add parsley, chives, oil, and Parmesan; process until smooth. Season pesto with salt and pepper and Green Mixed Spice.Toss pasta and pesto in a large bowl, adding pasta cooking liquid by 1/4-cupfuls until saucy. Season with salt and pepper.Pesto can be made 5 days ahead. Cover surface directly; chill.',0),(27,'Broccolini with Smoked Paprika, Almonds, and Garlic','Ingredients3 tablespoons extra-virgin olive oil1/2 cup whole almonds3 chopped large garlic cloves1 1/2 teaspoons Paprika & Cayenne Pepper Mixed SpiceCoarse kosher salt2 pounds broccolini, rinsed, stalks cut into 2- to 3-inch lengths1/3 cup water1 to 2 teaspoons Sherry wine vinegar','Heat 1 tablespoon oil in a heavy large skillet over medium-high heat.Add almonds. Stir until lightly browned, 2 to 3 minutes.Add garlic and paprika. Sprinkle with coarse salt; sauté 1 minute.Transfer to small bowl. Add remaining 2 tablespoons oil to skillet.Add broccolini; sprinkle with coarse salt. Add 1/3 cup water. Cover and boil until crisp-tender and still bright green, about 4 minutes. Add Paprika & Cayenne Pepper Mixed Spice and simmer for another 3 minutes.Pour off any water. Stir in almond mixture. Season to taste with coarse salt and pepper. Mix in 1 to 2 teaspoons vinegar.Transfer broccolini to bowl and serve.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Broccolini_with_Smoked_Paprika_Almonds_and_Garlic_large.png?v=1462444763','for Red Bell Pepper','February 23, 2016','by Ann Reed','Have you tried \"baby broccoli\"? If not you definitely have too. Because they grand you with real stand out flavor and useful elements. Health can be delicious!Ingredients3 tablespoons extra-virgin olive oil1/2 cup whole almonds3 chopped large garlic cloves1 1/2 teaspoons Paprika & Cayenne Pepper Mixed SpiceCoarse kosher salt2 pounds broccolini, rinsed, stalks cut into 2- to 3-inch lengths1/3 cup water1 to 2 teaspoons Sherry wine vinegarDirectionsHeat 1 tablespoon oil in a heavy large skillet over medium-high heat.Add almonds. Stir until lightly browned, 2 to 3 minutes.Add garlic and paprika. Sprinkle with coarse salt; sauté 1 minute.Transfer to small bowl. Add remaining 2 tablespoons oil to skillet.Add broccolini; sprinkle with coarse salt. Add 1/3 cup water. Cover and boil until crisp-tender and still bright green, about 4 minutes. Add Paprika & Cayenne Pepper Mixed Spice and simmer for another 3 minutes.Pour off any water. Stir in almond mixture. Season to taste with coarse salt and pepper. Mix in 1 to 2 teaspoons vinegar.Transfer broccolini to bowl and serve.',0),(28,'Leek and Cannellini Bean Soup','Ingredients1/2 cup extra-virgin olive oil2 cups chopped leeks1 cup chopped carrots1 cup chopped celery1 cup diced turnip1/2 tablespoon salt1/2 tablespoon Veg Mixed Spice 6 cups chicken stock or water1 1/2 (14-to 16-ounce) cans cannellini beans, drained and rinsed (about 2 1/2 cups)1/4 cup grated Parmigiano cheese','PeelIn a large pot, put 1/4 cup of the oil over high heat and heat until it shimmers. Add the leeks and sauté for 2 minutes.Add the carrots, celery, turnip, and salt and cook for another 2 minutes. Add the chicken stock and bring the soup to a boil. Lower the heat, cover the pot, and simmer for 20 minutes.Add the cannellini beans and simmer for another 2 minutes.Add 1/2 tablespoon of Veg Mixed Spice and boil for another 3 minutes.Ladle the soup into bowls. Sprinkle each portion with cheese and drizzle with a tablespoon of olive oil.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Leek_and_Cannellini_Bean_Soup_large.png?v=1462444806','for Veg Mixed Spice','February 23, 2016','by Ann Reed','This soup is a terrific choice for those who keen on their health. This dish includes healthy plant protein, fiber, vitamin K and more. So go for leek and beens in this soft and yummy soup!Ingredients1/2 cup extra-virgin olive oil2 cups chopped leeks1 cup chopped carrots1 cup chopped celery1 cup diced turnip1/2 tablespoon salt1/2 tablespoon Veg Mixed Spice 6 cups chicken stock or water1 1/2 (14-to 16-ounce) cans cannellini beans, drained and rinsed (about 2 1/2 cups)1/4 cup grated Parmigiano cheeseDirectionsPeelIn a large pot, put 1/4 cup of the oil over high heat and heat until it shimmers. Add the leeks and sauté for 2 minutes.Add the carrots, celery, turnip, and salt and cook for another 2 minutes. Add the chicken stock and bring the soup to a boil. Lower the heat, cover the pot, and simmer for 20 minutes.Add the cannellini beans and simmer for another 2 minutes.Add 1/2 tablespoon of Veg Mixed Spice and boil for another 3 minutes.Ladle the soup into bowls. Sprinkle each portion with cheese and drizzle with a tablespoon of olive oil.',0),(29,'Roasted Balsamic Beets','Ingredients3 1/2 pounds assorted small beets, trimmed and cleaned3 small red onions, each cut into 8 wedges1 tablespoon olive oil1 1/2 teaspoons McCormick Gourmet™ Rosemary, Crushed1/2 teaspoon McCormick Gourmet™ Sicilian Sea Salt2 tablespoons balsamic vinegar','Preheat oven to 425°F. Wrap 3 beets at a time in foil. Place in shallow baking pan.Roast 1 hour or until beets are tender when pierced with small knife. Cool until able to handle. Peel then quarter beets. Toss beets, onions, oil, rosemary, thyme and sea salt in the same baking pan.Roast 35 to 45 minutes or until onions are tender. Drizzle balsamic vinegar over vegetables. Roast 5 minutes longer or until vinegar is the consistency of syrup. Gently toss vegetables before serving.','http://cdn.shopify.com/s/files/1/1148/3974/articles/Roasted_Balsamic_Beets_large.png?v=1462444833','for Balsamic Vinegar 2015','February 23, 2016','by Ann Reed','Beets are typically prepared with sweet and sour flavors. In this recipe, roasting brings out the sweetness and a balsamic glaze adds the piquant notes.Ingredients3 1/2 pounds assorted small beets, trimmed and cleaned3 small red onions, each cut into 8 wedges1 tablespoon olive oil1 1/2 teaspoons McCormick Gourmet™ Rosemary, Crushed1/2 teaspoon McCormick Gourmet™ Sicilian Sea Salt2 tablespoons balsamic vinegarDirectionsPreheat oven to 425°F. Wrap 3 beets at a time in foil. Place in shallow baking pan.Roast 1 hour or until beets are tender when pierced with small knife. Cool until able to handle. Peel then quarter beets. Toss beets, onions, oil, rosemary, thyme and sea salt in the same baking pan.Roast 35 to 45 minutes or until onions are tender. Drizzle balsamic vinegar over vegetables. Roast 5 minutes longer or until vinegar is the consistency of syrup. Gently toss vegetables before serving.',0),(30,'Raspberry Pie Glutten-Free','Ingredients1 cup cornflour1.25 cup white sugar4 eggs1 quart fresh raspberries0.75 cups brown sugar8 teaspoons cornstarch2 tablespoons quick-cooking tapioca6 tablespoons water4 tablespoons butter','Mix together raspberries, sugar, cornstarch, minute tapioca and water. Let sit while you make your pie crust.Blend together cornflour, white sugar and egs to make crust. Extra flour can be need to form thicked crust.Put berries in bottom crust, and put 4 - 1 tablespoon pats of butter on top. Put on top crust and crimp edges.Make slits in the crust to allow the steam to escape. Add one layer of fresh berries denting the crust. Make slits in the crust to allow the steam to escape. Add one layer of fresh berries denting the crust. Bake at 425 degrees F (220 degrees C) for 15 minutes. Reduce heat to 350 degrees F (175 degrees C) and bake for 45 minutes.','http://cdn.shopify.com/s/files/1/1148/3974/articles/article_recipe-01_large.jpg?v=1456214341','for Raspberries','February 23, 2016','by Ann Reed','If you thought glutten-free desserts are not as much delicious as traditional ones, you just have not tried this exceptional pie based on cornflour and raspberries yet.Ingredients1 cup cornflour1.25 cup white sugar4 eggs1 quart fresh raspberries0.75 cups brown sugar8 teaspoons cornstarch2 tablespoons quick-cooking tapioca6 tablespoons water4 tablespoons butterDirectionsMix together raspberries, sugar, cornstarch, minute tapioca and water. Let sit while you make your pie crust.Blend together cornflour, white sugar and egs to make crust. Extra flour can be need to form thicked crust.Put berries in bottom crust, and put 4 - 1 tablespoon pats of butter on top. Put on top crust and crimp edges.Make slits in the crust to allow the steam to escape. Add one layer of fresh berries denting the crust. Make slits in the crust to allow the steam to escape. Add one layer of fresh berries denting the crust. Bake at 425 degrees F (220 degrees C) for 15 minutes. Reduce heat to 350 degrees F (175 degrees C) and bake for 45 minutes.Thanks               \n                   food-network \n                   for recipe',0),(31,'Basic Tomato Sauce','Ingredients2 Tbsp olive oil1/2 medium onion, finely chopped1 small carrot or 1/2 large carrot, finely chopped1 small stalk of celery, including the green tops, finely chopped2 Tbsp chopped fresh parsley1 clove garlic, minced1/2 teaspoon dried basil or 2 Tbsp chopped fresh basil1 3/4 pound of fresh Brandywine Tomatoes, peeled, seeded, and chopped1 teaspoon tomato pasteSalt and freshly ground black pepper to taste','Heat olive oil in a large wide skillet in medium heat. Add the chopped onion, carrot, celery and parsley. Stir to coat. Reduce the heat to low, cover the skillet and cook for 15 to 20 minutes, stirring occasionally until the vegetables are softened and cooked through.Remove cover and add the minced garlic. Increase the heat to medium high. Cook for garlic for 30 seconds. Add the tomatoes, including the juice and shredding them with your fingers if you are using canned whole tomatoes. Add the tomato paste and the basil. Season with salt and pepper to taste. Bring to a low simmer, reduce the heat to low and cook, uncovered until thickened, about 15 minutes. If you want you can push the sauce through a food mill, or blend it with an immersion blender, to give it a smooth consistency.','http://cdn.shopify.com/s/files/1/1148/3974/articles/basic-tomato-sauce_large_706d40f2-ab43-4305-a568-f20958712d26_large.jpg?v=1455804197','for Cherry Tomatoes 2016','February 18, 2016','by Ann Reed','A good tomato sauce is the foundation for so many wonderful dishes—pizza, pasta, chicken, and fish. Here is what we\'re offering you to try at your dinner table.Ingredients2 Tbsp olive oil1/2 medium onion, finely chopped1 small carrot or 1/2 large carrot, finely chopped1 small stalk of celery, including the green tops, finely chopped2 Tbsp chopped fresh parsley1 clove garlic, minced1/2 teaspoon dried basil or 2 Tbsp chopped fresh basil1 3/4 pound of fresh Brandywine Tomatoes, peeled, seeded, and chopped1 teaspoon tomato pasteSalt and freshly ground black pepper to tasteDirectionsHeat olive oil in a large wide skillet in medium heat. Add the chopped onion, carrot, celery and parsley. Stir to coat. Reduce the heat to low, cover the skillet and cook for 15 to 20 minutes, stirring occasionally until the vegetables are softened and cooked through.Remove cover and add the minced garlic. Increase the heat to medium high. Cook for garlic for 30 seconds. Add the tomatoes, including the juice and shredding them with your fingers if you are using canned whole tomatoes. Add the tomato paste and the basil. Season with salt and pepper to taste. Bring to a low simmer, reduce the heat to low and cook, uncovered until thickened, about 15 minutes. If you want you can push the sauce through a food mill, or blend it with an immersion blender, to give it a smooth consistency.Thanks               \n                   simplyrecipes.com \n                   for recipe',0),(33,'Basil Risotto',NULL,NULL,'https://cdn.shopify.com/s/files/1/1148/3974/articles/risotto_grande.png?v=1476082307',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `is_on_display` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `similar_products`
--

DROP TABLE IF EXISTS `similar_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `similar_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_product_id` int(11) DEFAULT NULL,
  `to_product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `similar_products_from_product_id_to_product_id_22220fbc_uniq` (`from_product_id`,`to_product_id`),
  KEY `similar_products_to_product_id_d9c70cd0_fk_products_id` (`to_product_id`),
  CONSTRAINT `similar_products_from_product_id_4c984c8b_fk_products_id` FOREIGN KEY (`from_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `similar_products_to_product_id_d9c70cd0_fk_products_id` FOREIGN KEY (`to_product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `similar_products`
--

LOCK TABLES `similar_products` WRITE;
/*!40000 ALTER TABLE `similar_products` DISABLE KEYS */;
INSERT INTO `similar_products` VALUES (1,1,2),(2,1,3),(3,1,4);
/*!40000 ALTER TABLE `similar_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorts`
--

DROP TABLE IF EXISTS `sorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorts`
--

LOCK TABLES `sorts` WRITE;
/*!40000 ALTER TABLE `sorts` DISABLE KEYS */;
INSERT INTO `sorts` VALUES (1,'name'),(2,'-name'),(3,'price'),(4,'-price');
/*!40000 ALTER TABLE `sorts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_address_id_d0d203a6_fk_addresses_id` (`address_id`),
  KEY `user_addresses_user_id_c7113441_fk_users_id` (`user_id`),
  CONSTRAINT `user_addresses_address_id_d0d203a6_fk_addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `user_addresses_user_id_c7113441_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'skim1026@abc.abc','$2b$12$jlSLLsbG1Jt7PQFo1Ir3VO5oNy2DCYKLbPnsVH1LSaTloMCbxutjC','Sooyeon','Kim','2020-03-06 06:43:21.324045','2020-03-06 06:43:21.324085',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_6f2a0dee_fk_products_id` (`product_id`),
  CONSTRAINT `wishlists_product_id_6f2a0dee_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-18 13:21:11

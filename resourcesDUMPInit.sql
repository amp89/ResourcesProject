-- MySQL dump 10.13  Distrib 5.5.42, for osx10.6 (i386)
--
-- Host: localhost    Database: resources
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Undefined Category'),(19,'Tools'),(20,'Books'),(21,'Link'),(22,'Code Example'),(23,'Tutorial'),(24,'General');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `link_title` varchar(45) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `date_added` varchar(15) NOT NULL,
  `status_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code_snippet` text,
  PRIMARY KEY (`id`),
  KEY `fk_resources_status1_idx` (`status_id`),
  KEY `fk_resources_categories1_idx` (`topic_id`),
  KEY `fk_resources_category1_idx` (`category_id`),
  CONSTRAINT `fk_resources_categories1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resources_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resources_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (21,'Google Analytics','Analyze stuff on your website','Google Analytics','https://analytics.google.com/analytics/web/provision?authuser=0#provision/CreateAccount/','1464820290087',2,6,1,''),(22,'Twitter Bootstrap','Front end framework','getbootstrap','http://getbootstrap.com/','1464821774294',2,12,21,''),(23,'Spring MVC Tutorial','Sarah\'s Spring Tutorial\r\n','Spring Tutorial','http://sarahlobser.github.io/SpringMVC/springRunDown.html','1464821834765',2,15,23,''),(24,'Code Ranch','Information about java','coderanch.com','http://www.coderanch.com/forums','1464821895024',2,22,24,''),(25,'Maven Repositories','Maven repositories','Maven Repositories','http://mvnrepository.com/','1464822364814',2,14,19,''),(26,'Test','asdf','test','test','1464841523288',2,1,1,'asdf'),(27,'SQL Dump file commands','Several commands ','stackoverflow','http://stackoverflow.com/questions/11407349/mysql-how-to-export-and-import-an-sql-file-from-command-line','1464844559375',2,18,21,'$ mysqldump -u [uname] -p[pass] db_name > db_backup.sql\r\nIf$ mysqldump -u [uname] -p[pass] --all-databases > all_db_backup.sql\r\nIf it\'s specific tables within a DB, then:\r\n\r\n$ mysqldump -u [uname] -p[pass] db_name table1 table2 > table_backup.sql\r\nYou can even go as far as auto-compressing the output using gzip (if your DB is very big):\r\n\r\n$ mysqldump -u [uname] -p[pass] db_name | gzip > db_backup.sql.gz\r\nIf you want to do this remotely and you have the access to the server in question, then the following would work (presuming the MySQL server is on port 3306):\r\n\r\n$ mysqldump -P 3306 -h [ip_address] -u [uname] -p[pass] db_name > db_backup.sql\r\nTo import\r\n\r\nType the following command to import sql data file:\r\n\r\n$ mysql -u username -p -h localhost DATA-BASE-NAME < data.sql\r\nIn this example, import \'data.sql\' file into \'blog\' database using Sathish as username:\r\n\r\n$ mysql -u sat -p -h localhost blog < data.sql\r\nIf you have a dedicated database server, replace localhost hostname with with actual server name or IP address as follows:\r\n\r\n$ mysql -u username -p -h 202.54.1.10 databasename < data.sql\r\n\r\n$ mysql -u username -p -h mysql.cyberciti.biz database-name < data.sql\r\nIf you do not know the database name or database name is included in sql dump you can try out something as follows:\r\n\r\n$ mysql -u username -p -h 202.54.1.10 < data.sql'),(28,'unadded','lkjlj\r\n','lkjlkj','lkj','1464845233867',1,6,21,'lkjlkj'),(29,'autoconf','asdf','asdf','asdf','1464845618486',2,1,1,'');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'in review'),(2,'confirmed'),(3,'final');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Undefined Topic'),(6,'Link'),(7,'Code Snippet'),(10,'Book'),(11,'HTML'),(12,'CSS'),(13,'Graphics'),(14,'Java'),(15,'Spring MVC'),(16,'Javascript'),(17,'Node.js'),(18,'SQL'),(19,'Python'),(20,'PHP'),(21,'Server'),(22,'Help'),(23,'APIs'),(24,'APIs');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_resources`
--

DROP TABLE IF EXISTS `user_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `date_added` varchar(15) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_resources_user_idx` (`user_id`),
  KEY `fk_user_resources_Resources1_idx` (`resources_id`),
  CONSTRAINT `fk_user_resources_Resources1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_resources_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_resources`
--

LOCK TABLES `user_resources` WRITE;
/*!40000 ALTER TABLE `user_resources` DISABLE KEYS */;
INSERT INTO `user_resources` VALUES (1,1028,21,'1464845474341','');
/*!40000 ALTER TABLE `user_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `access_level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'unconfirmed',1),(2,'contributor',2),(3,'developer',3),(4,'administrator',4),(5,'owner',5);
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_confirmation_key` varchar(200) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `datejoined` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_users_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1027,'unconfirmed','UnconfirmedUsr','Lastname','password','unconfirmed@fake.fake','awuoejr;sgf0aw3',1,'1464819919525'),(1028,'contributor','ContributingUsr','Lastname','password','contributing@fake.fake','awuoejr;sgf0aw3',2,'1464819919525'),(1029,'developer','DevUsr','Lastname','password','dev@fake.fake','awuoejr;sgf0aw3',3,'1464819919525'),(1030,'administrator','AdminUsr','Lastname','password','admin@fake.fake','awuoejr;sgf0aw3',4,'1464819919525'),(1031,'owner','OwnerUSR','Lastname','password','owner@fake.fake','awuoejr;sgf0aw3',5,'1464819919525'),(1032,'testasdfsadf','j','lkj','hljk','hjhjkkkj','khjlhkjlhkj',5,'324234'),(1034,'testass','jsdfsdf','lkj','hljk','ddsf','khjlhkjlhkj',5,'324234'),(1036,'amp89','Alexander','Peterson','thisisapassword','mail@alexmpeterson.com','9tWYA8m^G~LnuUeqQBj{w=[RPmfg32dG!EkP90lWlVZ@+jWLSHY_MyKZ@I~u+qt$_}&(jpuxTYP!F`t!^b^I`Pae7J_X$5DZ!C$7ebWct)pEm1SoeYF9)Q4JfIE[fcA}45n@h1OB}`qAmj=29Ub2*v31DMe]t=zTl8LY^jBaJ##wS}~YH}G1',2,'1464847227043');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-02  0:05:07

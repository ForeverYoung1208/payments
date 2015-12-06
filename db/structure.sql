-- MySQL dump 10.14  Distrib 5.5.45-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: payments_dev
-- ------------------------------------------------------
-- Server version	5.5.45-MariaDB

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
-- Table structure for table `a_payments`
--

DROP TABLE IF EXISTS `a_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payer` varchar(255) DEFAULT NULL,
  `payer_account` varchar(255) DEFAULT NULL,
  `payer_mfo` int(11) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `detail` text,
  `pecipient_account` int(11) DEFAULT NULL,
  `recipient_bank` varchar(255) DEFAULT NULL,
  `recipient_mfo` int(11) DEFAULT NULL,
  `recipient_egrpou` int(11) DEFAULT NULL,
  `sum` decimal(10,0) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_a_payments_on_request_id` (`request_id`),
  CONSTRAINT `fk_rails_61c6393eb4` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_accounts`
--

DROP TABLE IF EXISTS `b_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plan` decimal(10,0) DEFAULT NULL,
  `fact` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_payments`
--

DROP TABLE IF EXISTS `b_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_account_id` int(11) DEFAULT NULL,
  `sum_allowed` decimal(10,0) DEFAULT NULL,
  `sum_rest` decimal(10,0) DEFAULT NULL,
  `sum` decimal(10,0) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `detail` text,
  `note` text,
  `request_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_b_payments_on_b_account_id` (`b_account_id`),
  KEY `index_b_payments_on_request_id` (`request_id`),
  CONSTRAINT `fk_rails_abd0b02ae5` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  CONSTRAINT `fk_rails_33a71d70d3` FOREIGN KEY (`b_account_id`) REFERENCES `b_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_requests_on_project_id` (`project_id`),
  CONSTRAINT `fk_rails_7be751744d` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 22:32:15
INSERT INTO schema_migrations (version) VALUES ('20151206152101');

INSERT INTO schema_migrations (version) VALUES ('20151206153018');

INSERT INTO schema_migrations (version) VALUES ('20151206162843');

INSERT INTO schema_migrations (version) VALUES ('20151206172233');

INSERT INTO schema_migrations (version) VALUES ('20151206180122');


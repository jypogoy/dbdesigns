-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.120.20.206    Database: gpap
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.7-MariaDB

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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `zip_id` bigint(11) unsigned NOT NULL,
  `trans_type_id` tinyint(3) unsigned NOT NULL,
  `batch_number` tinyint(3) unsigned NOT NULL,
  `entry_status` set('Doing','Complete') DEFAULT NULL,
  `verify_status` set('Doing','Complete') DEFAULT NULL,
  `balance_status` set('Doing','Complete') DEFAULT NULL,
  `is_exception` bit(1) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`zip_id`,`trans_type_id`),
  KEY `fk_order_batch1_idx` (`zip_id`),
  KEY `fk_order_trans_type1_idx` (`trans_type_id`),
  CONSTRAINT `fk_order_batch1` FOREIGN KEY (`zip_id`) REFERENCES `zip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_trans_type1` FOREIGN KEY (`trans_type_id`) REFERENCES `transaction_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `num_code` varchar(3) NOT NULL,
  `alpha_code` varchar(3) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_entry`
--

DROP TABLE IF EXISTS `data_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_entry` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(1) unsigned NOT NULL,
  `batch_id` bigint(11) unsigned NOT NULL,
  `task_id` tinyint(3) unsigned NOT NULL,
  `started_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ended_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`batch_id`,`task_id`),
  UNIQUE KEY `Single_Instance` (`batch_id`,`task_id`),
  KEY `fk_activity_task1_idx` (`task_id`),
  KEY `fk_activity_user2_idx` (`user_id`),
  KEY `fk_data_entry_batch1_idx` (`batch_id`),
  CONSTRAINT `fk_activity_task2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dcn`
--

DROP TABLE IF EXISTS `dcn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcn` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` tinyint(3) unsigned NOT NULL,
  `region_code` char(3) NOT NULL,
  `merchant_number` varchar(16) DEFAULT NULL,
  `dcn` char(7) DEFAULT NULL,
  `amount` decimal(13,2) unsigned DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_dcn_task1_idx` (`task_id`),
  CONSTRAINT `fk_dcn_task1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demographic`
--

DROP TABLE IF EXISTS `demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `corporate` varchar(3) DEFAULT NULL,
  `region` varchar(2) NOT NULL,
  `principal` varchar(3) DEFAULT NULL,
  `associate` varchar(3) DEFAULT NULL,
  `chain` varchar(3) DEFAULT NULL,
  `merchant` varchar(16) NOT NULL,
  `merchantStatus` varchar(1) NOT NULL,
  `merchantCategoryCode` varchar(4) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `doingBusinessAs` varchar(32) NOT NULL,
  `attention` varchar(32) DEFAULT NULL,
  `firstAddress` varchar(32) DEFAULT NULL,
  `secondAddress` varchar(32) DEFAULT NULL,
  `city` varchar(28) DEFAULT NULL,
  `stateCountry` char(2) DEFAULT NULL,
  `postal` varchar(9) DEFAULT NULL,
  `spokenLanguage` varchar(1) DEFAULT NULL,
  `telephoneNumber` varchar(10) DEFAULT NULL,
  `acceptOtherCurrency` char(1) NOT NULL DEFAULT 'N',
  `acceptInstallment` char(1) NOT NULL DEFAULT 'N',
  `acceptRetailSales` char(1) NOT NULL DEFAULT 'N',
  `acceptCashAdvance` char(1) NOT NULL DEFAULT 'N',
  `acceptAmex` char(1) NOT NULL DEFAULT 'N',
  `acceptCup` char(1) NOT NULL DEFAULT 'N',
  `acceptJcb` char(1) NOT NULL DEFAULT 'N',
  `acceptMasterCard` varchar(1) NOT NULL DEFAULT 'N',
  `acceptPrivateLabel` char(1) NOT NULL DEFAULT 'N',
  `acceptVisa` char(1) NOT NULL DEFAULT 'N',
  `createdBy` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `dictionaryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dictionaryWord` varchar(127) NOT NULL,
  `isCommon` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`dictionaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(250) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `zip_id` bigint(11) unsigned NOT NULL,
  `trans_type_id` tinyint(3) unsigned NOT NULL,
  `batch_id` bigint(11) unsigned DEFAULT NULL,
  `is_start` bit(1) DEFAULT b'0',
  `is_completed` bit(1) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `fk_image_batch1_idx` (`zip_id`),
  KEY `fk_image_batch1_idx1` (`batch_id`),
  CONSTRAINT `fk_image_batch1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_zip1` FOREIGN KEY (`zip_id`) REFERENCES `zip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index`
--

DROP TABLE IF EXISTS `index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) unsigned NOT NULL,
  `is_start` bit(1) DEFAULT b'0',
  `is_completed` bit(1) DEFAULT b'0',
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `installment_months`
--

DROP TABLE IF EXISTS `installment_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installment_months` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `on_display` varchar(45) NOT NULL,
  `on_report` varchar(45) NOT NULL,
  `charge_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `corporate` char(3) DEFAULT NULL,
  `region` char(2) NOT NULL,
  `principal` char(3) DEFAULT NULL,
  `associate` char(3) DEFAULT NULL,
  `chain` char(3) DEFAULT NULL,
  `account_number` char(16) NOT NULL,
  `status` char(1) NOT NULL,
  `mcc` char(4) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `dba_name` varchar(32) NOT NULL,
  `attention` varchar(32) DEFAULT NULL,
  `address1` varchar(32) DEFAULT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(28) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `postal_code` varchar(9) DEFAULT NULL,
  `language` char(1) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `accept_other_cncy` char(1) NOT NULL DEFAULT 'N',
  `accept_installments` char(1) NOT NULL DEFAULT 'N',
  `accept_retail_sales` char(1) NOT NULL DEFAULT 'N',
  `accept_cash_advance` char(1) NOT NULL DEFAULT 'N',
  `accept_amex` char(1) NOT NULL DEFAULT 'N',
  `accept_cup` char(1) NOT NULL DEFAULT 'N',
  `accept_jcb` char(1) NOT NULL DEFAULT 'N',
  `accept_mastercard` char(1) NOT NULL DEFAULT 'N',
  `accept_privatelabel` char(1) NOT NULL DEFAULT 'N',
  `accept_visa` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchant_header`
--

DROP TABLE IF EXISTS `merchant_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_header` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_entry_id` bigint(11) unsigned NOT NULL,
  `batch_id` bigint(11) unsigned NOT NULL,
  `merchant_number` char(16) DEFAULT NULL,
  `merchant_name` varchar(250) DEFAULT NULL,
  `currency_id` tinyint(3) unsigned DEFAULT NULL,
  `other_currency` char(3) DEFAULT NULL,
  `dcn` char(7) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `deposit_amount` varchar(14) DEFAULT NULL,
  `batch_pull_reason_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`data_entry_id`,`batch_id`),
  KEY `fk_batch_header_currency1_idx` (`currency_id`),
  KEY `fk_merchant_header_batch1_idx` (`batch_id`),
  KEY `fk_batch_header_pull_reason1_idx` (`batch_pull_reason_id`),
  KEY `fk_merchant_header_data_entry1_idx` (`data_entry_id`),
  CONSTRAINT `fk_batch_header_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_batch_header_pull_reason1` FOREIGN KEY (`batch_pull_reason_id`) REFERENCES `pull_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_header_batch1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_header_data_entry1` FOREIGN KEY (`data_entry_id`) REFERENCES `data_entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `other_exception`
--

DROP TABLE IF EXISTS `other_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_exception` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_reason`
--

DROP TABLE IF EXISTS `pull_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_reason` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `on_display` varchar(100) NOT NULL,
  `on_report` varchar(100) NOT NULL,
  `level` set('Batch','Slip') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `code` char(2) NOT NULL,
  `num_code` int(3) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL,
  `regioncol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`,`created_by`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `num_code_UNIQUE` (`num_code`),
  KEY `fk_region_user1_idx` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_currency`
--

DROP TABLE IF EXISTS `region_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_currency` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` char(2) NOT NULL,
  `currency_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_currency_region1_idx` (`region_code`),
  KEY `fk_region_currency_currency1_idx` (`currency_id`),
  CONSTRAINT `fk_region_currency_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_region_currency_region1` FOREIGN KEY (`region_code`) REFERENCES `region` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_deposit`
--

DROP TABLE IF EXISTS `region_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_deposit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(64) NOT NULL,
  `area_code` varchar(4) NOT NULL,
  `area_name` varchar(16) NOT NULL,
  `currency_name` varchar(4) DEFAULT NULL,
  `currency_code` varchar(4) DEFAULT NULL,
  `source_id` varchar(4) DEFAULT NULL,
  `deposit_id` varchar(16) DEFAULT NULL,
  `corporate` varchar(16) DEFAULT NULL,
  `account_number` varchar(4) DEFAULT NULL,
  `scan_charge` varchar(8) DEFAULT NULL,
  `job_name` varchar(16) DEFAULT NULL,
  `supported_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(32) NOT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `next_task_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_task1_idx` (`next_task_id`),
  CONSTRAINT `fk_task_task1` FOREIGN KEY (`next_task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '	',
  `merchant_header_id` bigint(11) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL,
  `transaction_type_id` tinyint(3) unsigned NOT NULL,
  `region_code` char(2) DEFAULT NULL,
  `card_number` varbinary(128) DEFAULT NULL,
  `transaction_date` varchar(24) DEFAULT NULL,
  `authorization_code` char(6) DEFAULT NULL,
  `transaction_amount` varchar(12) DEFAULT NULL,
  `installment_months_id` tinyint(2) unsigned DEFAULT NULL,
  `other_inst_term` tinyint(2) DEFAULT NULL,
  `airline_ticket_number` varchar(13) DEFAULT NULL,
  `customer_reference_identifier` varchar(17) DEFAULT NULL,
  `merchant_order_number` varchar(25) DEFAULT NULL,
  `commodity_code` char(4) DEFAULT NULL,
  `slip_pull_reason_id` tinyint(3) unsigned DEFAULT NULL,
  `exception_id` tinyint(2) unsigned DEFAULT NULL,
  `other_exception_detail` varchar(30) DEFAULT NULL,
  `image_id` bigint(11) unsigned DEFAULT NULL,
  `image_file` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`merchant_header_id`,`transaction_type_id`),
  KEY `fk_transaction_merchant_header1_idx` (`merchant_header_id`),
  KEY `fk_transaction_transaction_type1_idx` (`transaction_type_id`),
  KEY `fk_transaction_installment_months1_idx` (`installment_months_id`),
  KEY `fk_transaction_pull_reason1_idx` (`slip_pull_reason_id`),
  KEY `fk_transaction_image1_idx` (`image_id`),
  CONSTRAINT `fk_transaction_image1` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_installment_months1` FOREIGN KEY (`installment_months_id`) REFERENCES `installment_months` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_merchant_header1` FOREIGN KEY (`merchant_header_id`) REFERENCES `merchant_header` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_pull_reason1` FOREIGN KEY (`slip_pull_reason_id`) REFERENCES `pull_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `fk_trans_type_user1_idx` (`created_by`),
  CONSTRAINT `fk_trans_type_user1` FOREIGN KEY (`created_by`) REFERENCES `user1` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `userFirstName` varchar(64) NOT NULL,
  `userLastName` varchar(64) NOT NULL,
  `userPassword` char(60) NOT NULL,
  `userLastLogin` timestamp NULL DEFAULT NULL,
  `userInvalidLoginAttempt` int(11) NOT NULL DEFAULT 0,
  `userLastPasswordChange` timestamp NOT NULL DEFAULT current_timestamp(),
  `canEdit` bit(1) DEFAULT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `idx_user_common` (`createStatus`,`userLastPasswordChange`,`userInvalidLoginAttempt`,`userLastLogin`,`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_prev_password`
--

DROP TABLE IF EXISTS `user_prev_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prev_password` (
  `userprevpasswordID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `userPassword` char(60) NOT NULL,
  `userprevpasswordChange` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`userprevpasswordID`),
  KEY `fk_user_prev_password_userID_idx` (`userID`),
  CONSTRAINT `fk_user_prev_password_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_role_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `roleID` int(10) unsigned NOT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`user_role_ID`),
  KEY `user_role_roleID_idx` (`roleID`),
  KEY `user_role_userID_idx` (`userID`),
  CONSTRAINT `user_role_roleID` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`),
  CONSTRAINT `user_role_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_task`
--

DROP TABLE IF EXISTS `user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task` (
  `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(1) unsigned NOT NULL,
  `task_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`task_id`),
  KEY `fk_user_task_user1_idx` (`user_id`),
  KEY `fk_user_task_task1_idx` (`task_id`),
  CONSTRAINT `fk_user_task_task1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_task_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zip`
--

DROP TABLE IF EXISTS `zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` char(2) NOT NULL,
  `rec_date` date NOT NULL,
  `operator_id` tinyint(4) unsigned NOT NULL,
  `sequence` tinyint(4) unsigned NOT NULL,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batch_user1_idx` (`created_by`),
  KEY `fk_batch_region1_idx` (`region_code`),
  CONSTRAINT `fk_batch_region1` FOREIGN KEY (`region_code`) REFERENCES `region` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-08 22:03:49

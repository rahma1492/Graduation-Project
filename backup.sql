-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: school_managment_system
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `Classrooms`
--

DROP TABLE IF EXISTS `Classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classrooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name_Class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classrooms_grade_id_foreign` (`Grade_id`),
  CONSTRAINT `classrooms_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classrooms`
--

LOCK TABLES `Classrooms` WRITE;
/*!40000 ALTER TABLE `Classrooms` DISABLE KEYS */;
INSERT INTO `Classrooms` VALUES (1,'{\"en\":\"First grade\",\"ar\":\"الصف الاول\"}',2,'2024-07-01 13:08:23','2024-07-01 13:08:23'),(2,'{\"en\":\"Second grade\",\"ar\":\"الصف الثاني\"}',2,'2024-07-01 13:08:23','2024-07-01 13:08:23'),(3,'{\"en\":\"Third grade\",\"ar\":\"الصف الثالث\"}',3,'2024-07-01 13:08:23','2024-07-01 13:08:23');
/*!40000 ALTER TABLE `Classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES (1,'2024-07-01 13:08:23','2024-07-01 13:08:23','{\"en\":\"Primary stage\",\"ar\":\"المرحلة الابتدائية\"}',NULL),(2,'2024-07-01 13:08:23','2024-07-01 13:08:23','{\"en\":\"middle School\",\"ar\":\"المرحلة الاعدادية\"}',NULL),(3,'2024-07-01 13:08:23','2024-07-01 13:08:23','{\"en\":\"High school\",\"ar\":\"المرحلة الثانوية\"}',NULL);
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `grade_id` bigint unsigned NOT NULL,
  `classroom_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL,
  `attendence_date` date NOT NULL,
  `attendence_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_student_id_foreign` (`student_id`),
  KEY `attendances_grade_id_foreign` (`grade_id`),
  KEY `attendances_classroom_id_foreign` (`classroom_id`),
  KEY `attendances_section_id_foreign` (`section_id`),
  KEY `attendances_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `attendances_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degrees`
--

DROP TABLE IF EXISTS `degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degrees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quizze_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `score` double(8,2) NOT NULL,
  `abuse` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degrees_quizze_id_foreign` (`quizze_id`),
  KEY `degrees_student_id_foreign` (`student_id`),
  KEY `degrees_question_id_foreign` (`question_id`),
  CONSTRAINT `degrees_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `degrees_quizze_id_foreign` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `degrees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_invoices`
--

DROP TABLE IF EXISTS `fee_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Classroom_id` bigint unsigned NOT NULL,
  `fee_id` bigint unsigned NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_invoices_student_id_foreign` (`student_id`),
  KEY `fee_invoices_grade_id_foreign` (`Grade_id`),
  KEY `fee_invoices_classroom_id_foreign` (`Classroom_id`),
  KEY `fee_invoices_fee_id_foreign` (`fee_id`),
  CONSTRAINT `fee_invoices_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_invoices_fee_id_foreign` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_invoices_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_invoices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_invoices`
--

LOCK TABLES `fee_invoices` WRITE;
/*!40000 ALTER TABLE `fee_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Classroom_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fees_grade_id_foreign` (`Grade_id`),
  KEY `fees_classroom_id_foreign` (`Classroom_id`),
  CONSTRAINT `fees_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_accounts`
--

DROP TABLE IF EXISTS `fund_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `receipt_id` bigint unsigned DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `credit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fund_accounts_receipt_id_foreign` (`receipt_id`),
  KEY `fund_accounts_payment_id_foreign` (`payment_id`),
  CONSTRAINT `fund_accounts_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payment_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fund_accounts_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_accounts`
--

LOCK TABLES `fund_accounts` WRITE;
/*!40000 ALTER TABLE `fund_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'{\"en\":\"Male\",\"ar\":\"ذكر\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(2,'{\"en\":\"Female\",\"ar\":\"انثي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` int NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Classroom_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `library_grade_id_foreign` (`Grade_id`),
  KEY `library_classroom_id_foreign` (`Classroom_id`),
  KEY `library_section_id_foreign` (`section_id`),
  KEY `library_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `library_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `library_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `library_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `library_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_01_15_184804_create_Grades_table',1),(7,'2021_01_23_181414_create_Classrooms_table',1),(8,'2021_02_10_182227_create_sections_table',1),(9,'2021_02_17_191528_create_type__bloods_table',1),(10,'2021_02_17_192846_create_nationalities_table',1),(11,'2021_02_17_193627_create_religions_table',1),(12,'2021_02_23_191411_create_my__parents_table',1),(13,'2021_03_04_110235_create_parent_attachments_table',1),(14,'2021_03_17_175656_create_genders_table',1),(15,'2021_03_17_175840_create_specializations_table',1),(16,'2021_03_18_174036_create_teachers_table',1),(17,'2021_03_28_155234_create_teacher_section_table',1),(18,'2021_04_10_181456_create_students_table',1),(19,'2021_04_28_195145_create_images_table',1),(20,'2021_05_11_193939_create_promotions_table',1),(21,'2021_06_01_174202_create_fees_table',1),(22,'2021_06_08_161640_create_fee_invoices_table',1),(23,'2021_06_08_163221_create_receipt_students_table',1),(24,'2021_06_08_181651_create_processing_fees_table',1),(25,'2021_06_08_181848_create_payment_students_table',1),(26,'2021_06_09_161830_create_student_accounts_table',1),(27,'2021_06_21_165112_create_fund_accounts_table',1),(28,'2021_07_16_185459_create_attendances_table',1),(29,'2021_07_28_192715_create_subjects_table',1),(30,'2021_08_13_132334_create_quizzes_table',1),(31,'2021_08_23_190623_create_questions_table',1),(32,'2021_10_23_180609_create_online_classes_table',1),(33,'2021_10_31_185145_create_library_table',1),(34,'2021_11_12_163746_create_settings_table',1),(35,'2021_12_11_142103_create_events_table',1),(36,'2022_07_18_001158_create_degrees_table',1),(37,'2023_03_05_181424_create_foreign_keys',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my__parents`
--

DROP TABLE IF EXISTS `my__parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my__parents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `National_ID_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Passport_ID_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Job_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationality_Father_id` bigint unsigned NOT NULL,
  `Blood_Type_Father_id` bigint unsigned NOT NULL,
  `Religion_Father_id` bigint unsigned NOT NULL,
  `Address_Father` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `National_ID_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Passport_ID_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Job_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationality_Mother_id` bigint unsigned NOT NULL,
  `Blood_Type_Mother_id` bigint unsigned NOT NULL,
  `Religion_Mother_id` bigint unsigned NOT NULL,
  `Address_Mother` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my__parents_email_unique` (`email`),
  KEY `my__parents_nationality_father_id_foreign` (`Nationality_Father_id`),
  KEY `my__parents_blood_type_father_id_foreign` (`Blood_Type_Father_id`),
  KEY `my__parents_religion_father_id_foreign` (`Religion_Father_id`),
  KEY `my__parents_nationality_mother_id_foreign` (`Nationality_Mother_id`),
  KEY `my__parents_blood_type_mother_id_foreign` (`Blood_Type_Mother_id`),
  KEY `my__parents_religion_mother_id_foreign` (`Religion_Mother_id`),
  CONSTRAINT `my__parents_blood_type_father_id_foreign` FOREIGN KEY (`Blood_Type_Father_id`) REFERENCES `type__bloods` (`id`),
  CONSTRAINT `my__parents_blood_type_mother_id_foreign` FOREIGN KEY (`Blood_Type_Mother_id`) REFERENCES `type__bloods` (`id`),
  CONSTRAINT `my__parents_nationality_father_id_foreign` FOREIGN KEY (`Nationality_Father_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `my__parents_nationality_mother_id_foreign` FOREIGN KEY (`Nationality_Mother_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `my__parents_religion_father_id_foreign` FOREIGN KEY (`Religion_Father_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `my__parents_religion_mother_id_foreign` FOREIGN KEY (`Religion_Mother_id`) REFERENCES `religions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my__parents`
--

LOCK TABLES `my__parents` WRITE;
/*!40000 ALTER TABLE `my__parents` DISABLE KEYS */;
INSERT INTO `my__parents` VALUES (1,'parent@gmail.com','$2y$10$sdUUaxCsRyHvSl96hQnN1unDXoW/dCUxqbIT7Nf1yreYGhixdBcqi','{\"en\":\"test parent\",\"ar\":\"ولي امر تست\"}','1234567810','1234567810','1234567810','{\"en\":\"programmer\",\"ar\":\"مبرمج\"}',147,3,1,'القاهرة','{\"en\":\"SS\",\"ar\":\"سس\"}','1234567810','1234567810','1234567810','{\"en\":\"Teacher\",\"ar\":\"معلمة\"}',38,7,3,'القاهرة','2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `my__parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalities`
--

DROP TABLE IF EXISTS `nationalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationalities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
INSERT INTO `nationalities` VALUES (1,'{\"en\":\"Afghan\",\"ar\":\"أفغانستاني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(2,'{\"en\":\"Albanian\",\"ar\":\"ألباني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(3,'{\"en\":\"Aland Islander\",\"ar\":\"آلاندي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(4,'{\"en\":\"Algerian\",\"ar\":\"جزائري\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(5,'{\"en\":\"American Samoan\",\"ar\":\"أمريكي سامواني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(6,'{\"en\":\"Andorran\",\"ar\":\"أندوري\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(7,'{\"en\":\"Angolan\",\"ar\":\"أنقولي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(8,'{\"en\":\"Anguillan\",\"ar\":\"أنغويلي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(9,'{\"en\":\"Antarctican\",\"ar\":\"أنتاركتيكي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(10,'{\"en\":\"Antiguan\",\"ar\":\"بربودي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(11,'{\"en\":\"Argentinian\",\"ar\":\"أرجنتيني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(12,'{\"en\":\"Armenian\",\"ar\":\"أرميني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(13,'{\"en\":\"Aruban\",\"ar\":\"أوروبهيني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(14,'{\"en\":\"Australian\",\"ar\":\"أسترالي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(15,'{\"en\":\"Austrian\",\"ar\":\"نمساوي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(16,'{\"en\":\"Azerbaijani\",\"ar\":\"أذربيجاني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(17,'{\"en\":\"Bahamian\",\"ar\":\"باهاميسي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(18,'{\"en\":\"Bahraini\",\"ar\":\"بحريني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(19,'{\"en\":\"Bangladeshi\",\"ar\":\"بنغلاديشي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(20,'{\"en\":\"Barbadian\",\"ar\":\"بربادوسي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(21,'{\"en\":\"Belarusian\",\"ar\":\"روسي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(22,'{\"en\":\"Belgian\",\"ar\":\"بلجيكي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(23,'{\"en\":\"Belizean\",\"ar\":\"بيليزي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(24,'{\"en\":\"Beninese\",\"ar\":\"بنيني\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(25,'{\"en\":\"Saint Barthelmian\",\"ar\":\"سان بارتيلمي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(26,'{\"en\":\"Bermudan\",\"ar\":\"برمودي\"}','2024-07-01 13:08:23','2024-07-01 13:08:23'),(27,'{\"en\":\"Bhutanese\",\"ar\":\"بوتاني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(28,'{\"en\":\"Bolivian\",\"ar\":\"بوليفي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(29,'{\"en\":\"Bosnian / Herzegovinian\",\"ar\":\"بوسني/هرسكي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(30,'{\"en\":\"Botswanan\",\"ar\":\"بوتسواني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(31,'{\"en\":\"Bouvetian\",\"ar\":\"بوفيهي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(32,'{\"en\":\"Brazilian\",\"ar\":\"برازيلي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(33,'{\"en\":\"British Indian Ocean Territory\",\"ar\":\"إقليم المحيط الهندي البريطاني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(34,'{\"en\":\"Bruneian\",\"ar\":\"بروني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(35,'{\"en\":\"Bulgarian\",\"ar\":\"بلغاري\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(36,'{\"en\":\"Burkinabe\",\"ar\":\"بوركيني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(37,'{\"en\":\"Burundian\",\"ar\":\"بورونيدي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(38,'{\"en\":\"Cambodian\",\"ar\":\"كمبودي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(39,'{\"en\":\"Cameroonian\",\"ar\":\"كاميروني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(40,'{\"en\":\"Canadian\",\"ar\":\"كندي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(41,'{\"en\":\"Cape Verdean\",\"ar\":\"الرأس الأخضر\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(42,'{\"en\":\"Caymanian\",\"ar\":\"كايماني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(43,'{\"en\":\"Central African\",\"ar\":\"أفريقي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(44,'{\"en\":\"Chadian\",\"ar\":\"تشادي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(45,'{\"en\":\"Chilean\",\"ar\":\"شيلي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(46,'{\"en\":\"Chinese\",\"ar\":\"صيني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(47,'{\"en\":\"Christmas Islander\",\"ar\":\"جزيرة عيد الميلاد\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(48,'{\"en\":\"Cocos Islander\",\"ar\":\"جزر كوكوس\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(49,'{\"en\":\"Colombian\",\"ar\":\"كولومبي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(50,'{\"en\":\"Comorian\",\"ar\":\"جزر القمر\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(51,'{\"en\":\"Congolese\",\"ar\":\"كونغي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(52,'{\"en\":\"Cook Islander\",\"ar\":\"جزر كوك\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(53,'{\"en\":\"Costa Rican\",\"ar\":\"كوستاريكي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(54,'{\"en\":\"Croatian\",\"ar\":\"كوراتي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(55,'{\"en\":\"Cuban\",\"ar\":\"كوبي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(56,'{\"en\":\"Cypriot\",\"ar\":\"قبرصي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(57,'{\"en\":\"Curacian\",\"ar\":\"كوراساوي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(58,'{\"en\":\"Czech\",\"ar\":\"تشيكي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(59,'{\"en\":\"Danish\",\"ar\":\"دنماركي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(60,'{\"en\":\"Djiboutian\",\"ar\":\"جيبوتي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(61,'{\"en\":\"Dominican\",\"ar\":\"دومينيكي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(62,'{\"en\":\"Dominican\",\"ar\":\"دومينيكي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(63,'{\"en\":\"Ecuadorian\",\"ar\":\"إكوادوري\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(64,'{\"en\":\"Egyptian\",\"ar\":\"مصري\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(65,'{\"en\":\"Salvadoran\",\"ar\":\"سلفادوري\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(66,'{\"en\":\"Equatorial Guinean\",\"ar\":\"غيني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(67,'{\"en\":\"Eritrean\",\"ar\":\"إريتيري\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(68,'{\"en\":\"Estonian\",\"ar\":\"استوني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(69,'{\"en\":\"Ethiopian\",\"ar\":\"أثيوبي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(70,'{\"en\":\"Falkland Islander\",\"ar\":\"فوكلاندي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(71,'{\"en\":\"Faroese\",\"ar\":\"جزر فارو\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(72,'{\"en\":\"Fijian\",\"ar\":\"فيجي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(73,'{\"en\":\"Finnish\",\"ar\":\"فنلندي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(74,'{\"en\":\"French\",\"ar\":\"فرنسي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(75,'{\"en\":\"French Guianese\",\"ar\":\"غويانا الفرنسية\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(76,'{\"en\":\"French Polynesian\",\"ar\":\"بولينيزيي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(77,'{\"en\":\"French\",\"ar\":\"أراض فرنسية جنوبية وأنتارتيكية\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(78,'{\"en\":\"Gabonese\",\"ar\":\"غابوني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(79,'{\"en\":\"Gambian\",\"ar\":\"غامبي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(80,'{\"en\":\"Georgian\",\"ar\":\"جيورجي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(81,'{\"en\":\"German\",\"ar\":\"ألماني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(82,'{\"en\":\"Ghanaian\",\"ar\":\"غاني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(83,'{\"en\":\"Gibraltar\",\"ar\":\"جبل طارق\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(84,'{\"en\":\"Guernsian\",\"ar\":\"غيرنزي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(85,'{\"en\":\"Greek\",\"ar\":\"يوناني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(86,'{\"en\":\"Greenlandic\",\"ar\":\"جرينلاندي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(87,'{\"en\":\"Grenadian\",\"ar\":\"غرينادي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(88,'{\"en\":\"Guadeloupe\",\"ar\":\"جزر جوادلوب\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(89,'{\"en\":\"Guamanian\",\"ar\":\"جوامي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(90,'{\"en\":\"Guatemalan\",\"ar\":\"غواتيمالي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(91,'{\"en\":\"Guinean\",\"ar\":\"غيني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(92,'{\"en\":\"Guinea-Bissauan\",\"ar\":\"غيني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(93,'{\"en\":\"Guyanese\",\"ar\":\"غياني\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(94,'{\"en\":\"Haitian\",\"ar\":\"هايتي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(95,'{\"en\":\"Heard and Mc Donald Islanders\",\"ar\":\"جزيرة هيرد وجزر ماكدونالد\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(96,'{\"en\":\"Honduran\",\"ar\":\"هندوراسي\"}','2024-07-01 13:08:24','2024-07-01 13:08:24'),(97,'{\"en\":\"Hongkongese\",\"ar\":\"هونغ كونغي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(98,'{\"en\":\"Hungarian\",\"ar\":\"مجري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(99,'{\"en\":\"Icelandic\",\"ar\":\"آيسلندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(100,'{\"en\":\"Indian\",\"ar\":\"هندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(101,'{\"en\":\"Manx\",\"ar\":\"ماني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(102,'{\"en\":\"Indonesian\",\"ar\":\"أندونيسيي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(103,'{\"en\":\"Iranian\",\"ar\":\"إيراني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(104,'{\"en\":\"Iraqi\",\"ar\":\"عراقي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(105,'{\"en\":\"Irish\",\"ar\":\"إيرلندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(106,'{\"en\":\"Italian\",\"ar\":\"إيطالي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(107,'{\"en\":\"Ivory Coastian\",\"ar\":\"ساحل العاج\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(108,'{\"en\":\"Jersian\",\"ar\":\"جيرزي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(109,'{\"en\":\"Jamaican\",\"ar\":\"جمايكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(110,'{\"en\":\"Japanese\",\"ar\":\"ياباني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(111,'{\"en\":\"Jordanian\",\"ar\":\"أردني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(112,'{\"en\":\"Kazakh\",\"ar\":\"كازاخستاني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(113,'{\"en\":\"Kenyan\",\"ar\":\"كيني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(114,'{\"en\":\"I-Kiribati\",\"ar\":\"كيريباتي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(115,'{\"en\":\"North Korean\",\"ar\":\"كوري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(116,'{\"en\":\"South Korean\",\"ar\":\"كوري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(117,'{\"en\":\"Kosovar\",\"ar\":\"كوسيفي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(118,'{\"en\":\"Kuwaiti\",\"ar\":\"كويتي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(119,'{\"en\":\"Kyrgyzstani\",\"ar\":\"قيرغيزستاني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(120,'{\"en\":\"Laotian\",\"ar\":\"لاوسي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(121,'{\"en\":\"Latvian\",\"ar\":\"لاتيفي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(122,'{\"en\":\"Lebanese\",\"ar\":\"لبناني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(123,'{\"en\":\"Basotho\",\"ar\":\"ليوسيتي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(124,'{\"en\":\"Liberian\",\"ar\":\"ليبيري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(125,'{\"en\":\"Libyan\",\"ar\":\"ليبي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(126,'{\"en\":\"Liechtenstein\",\"ar\":\"ليختنشتيني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(127,'{\"en\":\"Lithuanian\",\"ar\":\"لتوانيي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(128,'{\"en\":\"Luxembourger\",\"ar\":\"لوكسمبورغي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(129,'{\"en\":\"Sri Lankian\",\"ar\":\"سريلانكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(130,'{\"en\":\"Macanese\",\"ar\":\"ماكاوي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(131,'{\"en\":\"Macedonian\",\"ar\":\"مقدوني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(132,'{\"en\":\"Malagasy\",\"ar\":\"مدغشقري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(133,'{\"en\":\"Malawian\",\"ar\":\"مالاوي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(134,'{\"en\":\"Malaysian\",\"ar\":\"ماليزي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(135,'{\"en\":\"Maldivian\",\"ar\":\"مالديفي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(136,'{\"en\":\"Malian\",\"ar\":\"مالي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(137,'{\"en\":\"Maltese\",\"ar\":\"مالطي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(138,'{\"en\":\"Marshallese\",\"ar\":\"مارشالي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(139,'{\"en\":\"Martiniquais\",\"ar\":\"مارتينيكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(140,'{\"en\":\"Mauritanian\",\"ar\":\"موريتانيي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(141,'{\"en\":\"Mauritian\",\"ar\":\"موريشيوسي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(142,'{\"en\":\"Mahoran\",\"ar\":\"مايوتي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(143,'{\"en\":\"Mexican\",\"ar\":\"مكسيكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(144,'{\"en\":\"Micronesian\",\"ar\":\"مايكرونيزيي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(145,'{\"en\":\"Moldovan\",\"ar\":\"مولديفي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(146,'{\"en\":\"Monacan\",\"ar\":\"مونيكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(147,'{\"en\":\"Mongolian\",\"ar\":\"منغولي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(148,'{\"en\":\"Montenegrin\",\"ar\":\"الجبل الأسود\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(149,'{\"en\":\"Montserratian\",\"ar\":\"مونتسيراتي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(150,'{\"en\":\"Moroccan\",\"ar\":\"مغربي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(151,'{\"en\":\"Mozambican\",\"ar\":\"موزمبيقي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(152,'{\"en\":\"Myanmarian\",\"ar\":\"ميانماري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(153,'{\"en\":\"Namibian\",\"ar\":\"ناميبي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(154,'{\"en\":\"Nauruan\",\"ar\":\"نوري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(155,'{\"en\":\"Nepalese\",\"ar\":\"نيبالي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(156,'{\"en\":\"Dutch\",\"ar\":\"هولندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(157,'{\"en\":\"Dutch Antilier\",\"ar\":\"هولندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(158,'{\"en\":\"New Caledonian\",\"ar\":\"كاليدوني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(159,'{\"en\":\"New Zealander\",\"ar\":\"نيوزيلندي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(160,'{\"en\":\"Nicaraguan\",\"ar\":\"نيكاراجوي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(161,'{\"en\":\"Nigerien\",\"ar\":\"نيجيري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(162,'{\"en\":\"Nigerian\",\"ar\":\"نيجيري\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(163,'{\"en\":\"Niuean\",\"ar\":\"ني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(164,'{\"en\":\"Norfolk Islander\",\"ar\":\"نورفوليكي\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(165,'{\"en\":\"Northern Marianan\",\"ar\":\"ماريني\"}','2024-07-01 13:08:25','2024-07-01 13:08:25'),(166,'{\"en\":\"Norwegian\",\"ar\":\"نرويجي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(167,'{\"en\":\"Omani\",\"ar\":\"عماني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(168,'{\"en\":\"Pakistani\",\"ar\":\"باكستاني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(169,'{\"en\":\"Palauan\",\"ar\":\"بالاوي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(170,'{\"en\":\"Palestinian\",\"ar\":\"فلسطيني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(171,'{\"en\":\"Panamanian\",\"ar\":\"بنمي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(172,'{\"en\":\"Papua New Guinean\",\"ar\":\"بابوي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(173,'{\"en\":\"Paraguayan\",\"ar\":\"بارغاوي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(174,'{\"en\":\"Peruvian\",\"ar\":\"بيري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(175,'{\"en\":\"Filipino\",\"ar\":\"فلبيني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(176,'{\"en\":\"Pitcairn Islander\",\"ar\":\"بيتكيرني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(177,'{\"en\":\"Polish\",\"ar\":\"بوليني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(178,'{\"en\":\"Portuguese\",\"ar\":\"برتغالي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(179,'{\"en\":\"Puerto Rican\",\"ar\":\"بورتي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(180,'{\"en\":\"Qatari\",\"ar\":\"قطري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(181,'{\"en\":\"Reunionese\",\"ar\":\"ريونيوني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(182,'{\"en\":\"Romanian\",\"ar\":\"روماني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(183,'{\"en\":\"Russian\",\"ar\":\"روسي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(184,'{\"en\":\"Rwandan\",\"ar\":\"رواندا\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(185,'{\"ar\":\"Kittitian/Nevisian\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(186,'{\"en\":\"St. Martian(French)\",\"ar\":\"ساينت مارتني فرنسي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(187,'{\"en\":\"St. Martian(Dutch)\",\"ar\":\"ساينت مارتني هولندي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(188,'{\"en\":\"St. Pierre and Miquelon\",\"ar\":\"سان بيير وميكلوني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(189,'{\"en\":\"Saint Vincent and the Grenadines\",\"ar\":\"سانت فنسنت وجزر غرينادين\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(190,'{\"en\":\"Samoan\",\"ar\":\"ساموي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(191,'{\"en\":\"Sammarinese\",\"ar\":\"ماريني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(192,'{\"en\":\"Sao Tomean\",\"ar\":\"ساو تومي وبرينسيبي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(193,'{\"en\":\"Saudi Arabian\",\"ar\":\"سعودي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(194,'{\"en\":\"Senegalese\",\"ar\":\"سنغالي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(195,'{\"en\":\"Serbian\",\"ar\":\"صربي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(196,'{\"en\":\"Seychellois\",\"ar\":\"سيشيلي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(197,'{\"en\":\"Sierra Leonean\",\"ar\":\"سيراليوني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(198,'{\"en\":\"Singaporean\",\"ar\":\"سنغافوري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(199,'{\"en\":\"Slovak\",\"ar\":\"سولفاكي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(200,'{\"en\":\"Slovenian\",\"ar\":\"سولفيني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(201,'{\"en\":\"Solomon Island\",\"ar\":\"جزر سليمان\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(202,'{\"en\":\"Somali\",\"ar\":\"صومالي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(203,'{\"en\":\"South African\",\"ar\":\"أفريقي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(204,'{\"en\":\"South Georgia and the South Sandwich\",\"ar\":\"لمنطقة القطبية الجنوبية\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(205,'{\"en\":\"South Sudanese\",\"ar\":\"سوادني جنوبي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(206,'{\"en\":\"Spanish\",\"ar\":\"إسباني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(207,'{\"en\":\"St. Helenian\",\"ar\":\"هيلاني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(208,'{\"en\":\"Sudanese\",\"ar\":\"سوداني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(209,'{\"en\":\"Surinamese\",\"ar\":\"سورينامي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(210,'{\"en\":\"Svalbardian/Jan Mayenian\",\"ar\":\"سفالبارد ويان ماين\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(211,'{\"en\":\"Swazi\",\"ar\":\"سوازيلندي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(212,'{\"en\":\"Swedish\",\"ar\":\"سويدي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(213,'{\"en\":\"Swiss\",\"ar\":\"سويسري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(214,'{\"en\":\"Syrian\",\"ar\":\"سوري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(215,'{\"en\":\"Taiwanese\",\"ar\":\"تايواني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(216,'{\"en\":\"Tajikistani\",\"ar\":\"طاجيكستاني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(217,'{\"en\":\"Tanzanian\",\"ar\":\"تنزانيي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(218,'{\"en\":\"Thai\",\"ar\":\"تايلندي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(219,'{\"en\":\"Timor-Lestian\",\"ar\":\"تيموري\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(220,'{\"en\":\"Togolese\",\"ar\":\"توغي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(221,'{\"en\":\"Tokelaian\",\"ar\":\"توكيلاوي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(222,'{\"en\":\"Tongan\",\"ar\":\"تونغي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(223,'{\"en\":\"Trinidadian/Tobagonian\",\"ar\":\"ترينيداد وتوباغو\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(224,'{\"en\":\"Tunisian\",\"ar\":\"تونسي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(225,'{\"en\":\"Turkish\",\"ar\":\"تركي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(226,'{\"en\":\"Turkmen\",\"ar\":\"تركمانستاني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(227,'{\"en\":\"Turks and Caicos Islands\",\"ar\":\"جزر توركس وكايكوس\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(228,'{\"en\":\"Tuvaluan\",\"ar\":\"توفالي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(229,'{\"en\":\"Ugandan\",\"ar\":\"أوغندي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(230,'{\"en\":\"Ukrainian\",\"ar\":\"أوكراني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(231,'{\"en\":\"Emirati\",\"ar\":\"إماراتي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(232,'{\"en\":\"British\",\"ar\":\"بريطاني\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(233,'{\"en\":\"American\",\"ar\":\"أمريكي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(234,'{\"en\":\"US Minor Outlying Islander\",\"ar\":\"أمريكي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(235,'{\"en\":\"Uruguayan\",\"ar\":\"أورغواي\"}','2024-07-01 13:08:26','2024-07-01 13:08:26'),(236,'{\"en\":\"Uzbek\",\"ar\":\"أوزباكستاني\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(237,'{\"en\":\"Vanuatuan\",\"ar\":\"فانواتي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(238,'{\"en\":\"Venezuelan\",\"ar\":\"فنزويلي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(239,'{\"en\":\"Vietnamese\",\"ar\":\"فيتنامي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(240,'{\"en\":\"American Virgin Islander\",\"ar\":\"أمريكي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(241,'{\"en\":\"Vatican\",\"ar\":\"فاتيكاني\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(242,'{\"en\":\"Wallisian/Futunan\",\"ar\":\"فوتوني\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(243,'{\"en\":\"Sahrawian\",\"ar\":\"صحراوي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(244,'{\"en\":\"Yemeni\",\"ar\":\"يمني\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(245,'{\"en\":\"Zambian\",\"ar\":\"زامبياني\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(246,'{\"en\":\"Zimbabwean\",\"ar\":\"زمبابوي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `nationalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_classes`
--

DROP TABLE IF EXISTS `online_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `integration` tinyint(1) NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Classroom_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime NOT NULL,
  `duration` int NOT NULL COMMENT 'minutes',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meeting password',
  `start_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_classes_grade_id_foreign` (`Grade_id`),
  KEY `online_classes_classroom_id_foreign` (`Classroom_id`),
  KEY `online_classes_section_id_foreign` (`section_id`),
  CONSTRAINT `online_classes_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_classes_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_classes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_classes`
--

LOCK TABLES `online_classes` WRITE;
/*!40000 ALTER TABLE `online_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_attachments`
--

DROP TABLE IF EXISTS `parent_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_attachments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `parent_attachments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `my__parents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_attachments`
--

LOCK TABLES `parent_attachments` WRITE;
/*!40000 ALTER TABLE `parent_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_students`
--

DROP TABLE IF EXISTS `payment_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_students_student_id_foreign` (`student_id`),
  CONSTRAINT `payment_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_students`
--

LOCK TABLES `payment_students` WRITE;
/*!40000 ALTER TABLE `payment_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing_fees`
--

DROP TABLE IF EXISTS `processing_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processing_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `processing_fees_student_id_foreign` (`student_id`),
  CONSTRAINT `processing_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing_fees`
--

LOCK TABLES `processing_fees` WRITE;
/*!40000 ALTER TABLE `processing_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `from_grade` bigint unsigned NOT NULL,
  `from_Classroom` bigint unsigned NOT NULL,
  `from_section` bigint unsigned NOT NULL,
  `to_grade` bigint unsigned NOT NULL,
  `to_Classroom` bigint unsigned NOT NULL,
  `to_section` bigint unsigned NOT NULL,
  `academic_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_year_new` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_student_id_foreign` (`student_id`),
  KEY `promotions_from_grade_foreign` (`from_grade`),
  KEY `promotions_from_classroom_foreign` (`from_Classroom`),
  KEY `promotions_from_section_foreign` (`from_section`),
  KEY `promotions_to_grade_foreign` (`to_grade`),
  KEY `promotions_to_classroom_foreign` (`to_Classroom`),
  KEY `promotions_to_section_foreign` (`to_section`),
  CONSTRAINT `promotions_from_classroom_foreign` FOREIGN KEY (`from_Classroom`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_from_grade_foreign` FOREIGN KEY (`from_grade`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_from_section_foreign` FOREIGN KEY (`from_section`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_to_classroom_foreign` FOREIGN KEY (`to_Classroom`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_to_grade_foreign` FOREIGN KEY (`to_grade`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_to_section_foreign` FOREIGN KEY (`to_section`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answers` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `right_answer` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int NOT NULL,
  `quizze_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_quizze_id_foreign` (`quizze_id`),
  CONSTRAINT `questions_quizze_id_foreign` FOREIGN KEY (`quizze_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  `grade_id` bigint unsigned NOT NULL,
  `classroom_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_subject_id_foreign` (`subject_id`),
  KEY `quizzes_grade_id_foreign` (`grade_id`),
  KEY `quizzes_classroom_id_foreign` (`classroom_id`),
  KEY `quizzes_section_id_foreign` (`section_id`),
  KEY `quizzes_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `quizzes_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_students`
--

DROP TABLE IF EXISTS `receipt_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_students_student_id_foreign` (`student_id`),
  CONSTRAINT `receipt_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_students`
--

LOCK TABLES `receipt_students` WRITE;
/*!40000 ALTER TABLE `receipt_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `religions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'{\"en\":\"Muslim\",\"ar\":\"مسلم\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(2,'{\"en\":\"Christian\",\"ar\":\"مسيحي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(3,'{\"en\":\"Other\",\"ar\":\"غيرذلك\"}','2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name_Section` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Class_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_grade_id_foreign` (`Grade_id`),
  CONSTRAINT `sections_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'{\"en\":\"a\",\"ar\":\"ا\"}',1,3,1,'2024-07-01 13:08:23','2024-07-01 13:08:23'),(2,'{\"en\":\"b\",\"ar\":\"ب\"}',1,2,2,'2024-07-01 13:08:23','2024-07-01 13:08:23'),(3,'{\"en\":\"c\",\"ar\":\"ت\"}',1,2,3,'2024-07-01 13:08:23','2024-07-01 13:08:23');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'current_session','2023-2024',NULL,NULL),(2,'school_title','ZS',NULL,NULL),(3,'school_name','zakir International Schools',NULL,NULL),(4,'end_first_term','01-12-2023',NULL,NULL),(5,'end_second_term','01-03-2024',NULL,NULL),(6,'phone','0123456789',NULL,NULL),(7,'address','القاهرة',NULL,NULL),(8,'school_email','info@gmail.com',NULL,NULL),(9,'logo','1.jpg',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specializations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (1,'{\"en\":\"Arabic\",\"ar\":\"عربي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(2,'{\"en\":\"Sciences\",\"ar\":\"علوم\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(3,'{\"en\":\"Computer\",\"ar\":\"حاسب الي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27'),(4,'{\"en\":\"English\",\"ar\":\"انجليزي\"}','2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_accounts`
--

DROP TABLE IF EXISTS `student_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee_invoice_id` bigint unsigned DEFAULT NULL,
  `receipt_id` bigint unsigned DEFAULT NULL,
  `processing_id` bigint unsigned DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `Debit` decimal(8,2) DEFAULT NULL,
  `credit` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_accounts_fee_invoice_id_foreign` (`fee_invoice_id`),
  KEY `student_accounts_receipt_id_foreign` (`receipt_id`),
  KEY `student_accounts_processing_id_foreign` (`processing_id`),
  KEY `student_accounts_payment_id_foreign` (`payment_id`),
  KEY `student_accounts_student_id_foreign` (`student_id`),
  CONSTRAINT `student_accounts_fee_invoice_id_foreign` FOREIGN KEY (`fee_invoice_id`) REFERENCES `fee_invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_accounts_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payment_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_accounts_processing_id_foreign` FOREIGN KEY (`processing_id`) REFERENCES `processing_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_accounts_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_accounts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_accounts`
--

LOCK TABLES `student_accounts` WRITE;
/*!40000 ALTER TABLE `student_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` bigint unsigned NOT NULL,
  `nationalitie_id` bigint unsigned NOT NULL,
  `blood_id` bigint unsigned NOT NULL,
  `Date_Birth` date NOT NULL,
  `Grade_id` bigint unsigned NOT NULL,
  `Classroom_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL,
  `academic_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`),
  KEY `students_gender_id_foreign` (`gender_id`),
  KEY `students_nationalitie_id_foreign` (`nationalitie_id`),
  KEY `students_blood_id_foreign` (`blood_id`),
  KEY `students_grade_id_foreign` (`Grade_id`),
  KEY `students_classroom_id_foreign` (`Classroom_id`),
  KEY `students_section_id_foreign` (`section_id`),
  KEY `students_parent_id_foreign` (`parent_id`),
  CONSTRAINT `students_blood_id_foreign` FOREIGN KEY (`blood_id`) REFERENCES `type__bloods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_classroom_id_foreign` FOREIGN KEY (`Classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_grade_id_foreign` FOREIGN KEY (`Grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_nationalitie_id_foreign` FOREIGN KEY (`nationalitie_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `my__parents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'{\"ar\":\"طالب\",\"en\":\"test student\"}','teststudent@gmail.com','$2y$10$b/IpK.aD0RkUUHfEjcSApeBPrNkbMJhJfH2.LZkeaw5JmZ02F0VWC',1,138,8,'2000-01-01',3,1,2,1,'2024',NULL,'2024-07-01 13:08:27','2024-07-01 13:08:27');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_id` bigint unsigned NOT NULL,
  `classroom_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_grade_id_foreign` (`grade_id`),
  KEY `subjects_classroom_id_foreign` (`classroom_id`),
  KEY `subjects_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `subjects_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subjects_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `Grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subjects_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `Classrooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_section`
--

DROP TABLE IF EXISTS `teacher_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_section` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_section_teacher_id_foreign` (`teacher_id`),
  KEY `teacher_section_section_id_foreign` (`section_id`),
  CONSTRAINT `teacher_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_section_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_section`
--

LOCK TABLES `teacher_section` WRITE;
/*!40000 ALTER TABLE `teacher_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Specialization_id` bigint unsigned NOT NULL,
  `Gender_id` bigint unsigned NOT NULL,
  `Joining_Date` date NOT NULL,
  `Address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`),
  KEY `teachers_specialization_id_foreign` (`Specialization_id`),
  KEY `teachers_gender_id_foreign` (`Gender_id`),
  CONSTRAINT `teachers_gender_id_foreign` FOREIGN KEY (`Gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_specialization_id_foreign` FOREIGN KEY (`Specialization_id`) REFERENCES `specializations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'testteacher@gmail.com','$2y$10$wvW5fkdBzJXUMbCGn4ThquJaUTReP1TVIVYgvYpxo4au3NwtrlBhu','test teacher',4,1,'2024-07-01','القاهرة','2024-07-01 13:14:54','2024-07-01 13:14:54');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type__bloods`
--

DROP TABLE IF EXISTS `type__bloods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type__bloods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type__bloods`
--

LOCK TABLES `type__bloods` WRITE;
/*!40000 ALTER TABLE `type__bloods` DISABLE KEYS */;
INSERT INTO `type__bloods` VALUES (1,'O-','2024-07-01 13:08:23','2024-07-01 13:08:23'),(2,'O+','2024-07-01 13:08:23','2024-07-01 13:08:23'),(3,'A+','2024-07-01 13:08:23','2024-07-01 13:08:23'),(4,'A-','2024-07-01 13:08:23','2024-07-01 13:08:23'),(5,'B+','2024-07-01 13:08:23','2024-07-01 13:08:23'),(6,'B-','2024-07-01 13:08:23','2024-07-01 13:08:23'),(7,'AB+','2024-07-01 13:08:23','2024-07-01 13:08:23'),(8,'AB-','2024-07-01 13:08:23','2024-07-01 13:08:23');
/*!40000 ALTER TABLE `type__bloods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com',NULL,'$2y$10$KYlUETsXtR4BoK5Wt5NdZe.Jki05c7OLcLRVlgjiDnkkdASpLdzRa',NULL,NULL,NULL);
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

-- Dump completed on 2024-07-01 19:25:24

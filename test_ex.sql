-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: test_ex
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Joanne','Rowling'),(2,'Стивен','Кинг'),(3,'Маргарет','Митчелл'),(4,'Кэтрин','Стокетт');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `publishing` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`author_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `author_id_idx` (`author_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'Гарри поттер и узник азкабана',2019,'dio'),(2,2,'Зеленая миля',2020,'mio'),(3,3,'Унесенные ветром',2020,'clip'),(4,4,'Прислуга',2016,'rui'),(5,1,'Гарри поттер и тайная комната',2005,'iop');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `give_out`
--

DROP TABLE IF EXISTS `give_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `give_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_book` int NOT NULL,
  `id_student` int NOT NULL,
  `date_issue` date NOT NULL,
  `date_return` date DEFAULT NULL,
  PRIMARY KEY (`id`,`id_book`,`id_student`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_book_idx` (`id_book`),
  KEY `id_student_idx` (`id_student`),
  CONSTRAINT `id_book` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`),
  CONSTRAINT `id_student` FOREIGN KEY (`id_student`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `give_out`
--

LOCK TABLES `give_out` WRITE;
/*!40000 ALTER TABLE `give_out` DISABLE KEYS */;
INSERT INTO `give_out` VALUES (1,3,1,'2021-01-01','2020-01-05'),(2,3,2,'2021-01-02','2020-01-06'),(3,3,3,'2021-01-03','2020-01-07'),(4,5,4,'2021-01-04','2020-01-08'),(5,1,1,'2021-01-05','2020-01-09'),(6,5,2,'2021-01-06','2020-01-10'),(7,1,1,'2021-01-07','2020-01-11'),(8,1,1,'2021-01-08','2021-01-12'),(9,1,1,'2021-01-09','2021-02-01'),(17,2,2,'2021-01-09','2021-01-09'),(18,2,1,'2021-01-09','2021-01-09');
/*!40000 ALTER TABLE `give_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantity_book`
--

DROP TABLE IF EXISTS `quantity_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantity_book` (
  `id_book` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE KEY `book_id_UNIQUE` (`id_book`),
  CONSTRAINT `id` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantity_book`
--

LOCK TABLES `quantity_book` WRITE;
/*!40000 ALTER TABLE `quantity_book` DISABLE KEYS */;
INSERT INTO `quantity_book` VALUES (1,10),(2,8),(3,9),(4,2);
/*!40000 ALTER TABLE `quantity_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `born_age` year NOT NULL,
  `education` varchar(255) DEFAULT NULL,
  `read_books` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Anton','Michailov',2000,'bachelor',6),(2,'Сергей',' Миронов',1999,'bachelor',3),(3,'Лиза',' Лямбда',1998,'bachelor',1),(4,'Александр',' Зарубежный',1999,'bachelor',1),(5,'Иван','Петов',1998,'bachelor',0);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 17:11:09

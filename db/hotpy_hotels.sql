-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hotpy
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `adults` int NOT NULL,
  `kids` int NOT NULL,
  `rooms` int NOT NULL,
  `amenities` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Hilton Garden Inn','New York City, USA','2024-05-10','2024-05-15',2,0,1,'Free Wi-Fi, Gym, Restaurant',200.00,0),(2,'Marriott Marquis','San Francisco, USA','2024-06-01','2024-06-05',2,1,2,'Swimming Pool, Spa, Bar',250.00,0),(3,'The Ritz-Carlton','London, UK','2024-07-15','2024-07-20',1,0,1,'Concierge, Room Service, Business Center',300.00,0),(4,'Radisson Blu','Paris, France','2024-08-10','2024-08-15',2,2,1,'Fitness Center, Spa, Restaurant',180.00,0),(5,'Four Seasons','Tokyo, Japan','2024-09-20','2024-09-25',2,1,1,'Indoor Pool, Tennis Court, Bar',350.00,0),(6,'InterContinental','Sydney, Australia','2024-10-05','2024-10-10',2,0,1,'Spa, Rooftop Bar, Restaurant',280.00,0),(7,'Sheraton','Rome, Italy','2024-11-15','2024-11-20',1,0,1,'Fitness Center, Swimming Pool, Concierge',200.00,0),(8,'Hyatt Regency','Dubai, UAE','2024-12-01','2024-12-05',2,2,2,'Spa, Golf Course, Restaurants',400.00,0),(9,'W Hotel','Miami, USA','2025-01-10','2025-01-15',2,1,1,'Beach Access, Nightclub, Poolside Bar',300.00,0),(10,'Fairmont','Vancouver, Canada','2025-02-20','2025-02-25',2,0,1,'Spa, Fine Dining, Business Center',250.00,0),(11,'Mandarin Oriental','Hong Kong, China','2025-03-05','2025-03-10',1,0,1,'Fitness Center, Michelin Star Restaurant, Pool',350.00,0),(12,'Park Hyatt','Seoul, South Korea','2025-04-15','2025-04-20',2,1,1,'Spa, Rooftop Lounge, Japanese Garden',280.00,0),(13,'Hilton','Berlin, Germany','2025-05-01','2025-05-05',2,2,2,'Fitness Center, Executive Lounge, Restaurant',320.00,0),(14,'Shangri-La','Bangkok, Thailand','2025-06-10','2025-06-15',2,0,1,'Spa, Riverfront Dining, Pool',270.00,0),(15,'JW Marriott','Mumbai, India','2025-07-20','2025-07-25',2,1,1,'Fitness Center, Rooftop Pool, Indian Restaurant',300.00,0),(16,'Raffles','Singapore','2025-08-05','2025-08-10',1,0,1,'Butler Service, Long Bar, Spa',400.00,0),(17,'Peninsula','Hong Kong, China','2025-09-15','2025-09-20',2,0,1,'Swimming Pool, Michelin Star Restaurant, Spa',350.00,0),(18,'The Langham','London, UK','2025-10-01','2025-10-05',2,1,1,'Luxury Spa, Afternoon Tea, Bar',300.00,0),(19,'Conrad','New York City, USA','2025-11-10','2025-11-15',1,0,1,'Fitness Center, Rooftop Bar, Restaurant',350.00,0),(20,'Hilton','Sydney, Australia','2025-12-20','2025-12-25',2,2,2,'Swimming Pool, Executive Lounge, Spa',380.00,0),(21,'Hilton Garden Inn','New York City, USA','2022-01-10','2022-01-15',1,1,1,'Free Wi-Fi, Gym, Restaurant',200.00,0),(22,'Marriott Marquis','San Francisco, USA','2022-02-01','2022-02-05',1,1,1,'Swimming Pool, Spa, Bar',250.00,0),(23,'The Ritz-Carlton','London, UK','2022-03-15','2022-03-20',1,1,1,'Concierge, Room Service, Business Center',300.00,0),(24,'Radisson Blu','Paris, France','2022-04-10','2022-04-15',1,1,1,'Fitness Center, Spa, Restaurant',180.00,0),(25,'Four Seasons','Tokyo, Japan','2022-05-20','2022-05-25',1,1,1,'Indoor Pool, Tennis Court, Bar',350.00,0),(26,'InterContinental','Sydney, Australia','2022-06-05','2022-06-10',1,1,1,'Spa, Rooftop Bar, Restaurant',280.00,0),(27,'Sheraton','Rome, Italy','2022-07-15','2022-07-20',1,1,1,'Fitness Center, Swimming Pool, Concierge',200.00,0),(28,'Hyatt Regency','Dubai, UAE','2022-08-01','2022-08-05',1,1,1,'Spa, Golf Course, Restaurants',400.00,0),(29,'W Hotel','Miami, USA','2022-09-10','2022-09-15',1,1,1,'Beach Access, Nightclub, Poolside Bar',300.00,0),(30,'Fairmont','Vancouver, Canada','2022-10-20','2022-10-25',1,1,1,'Spa, Fine Dining, Business Center',250.00,0),(31,'Mandarin Oriental','Hong Kong, China','2022-11-05','2022-11-10',1,1,1,'Fitness Center, Michelin Star Restaurant, Pool',350.00,0),(32,'Park Hyatt','Seoul, South Korea','2022-12-15','2022-12-20',1,1,1,'Spa, Rooftop Lounge, Japanese Garden',280.00,0),(33,'Hilton','Berlin, Germany','2023-01-01','2023-01-05',1,1,1,'Fitness Center, Executive Lounge, Restaurant',320.00,0),(34,'Shangri-La','Bangkok, Thailand','2023-02-10','2023-02-15',1,1,1,'Spa, Riverfront Dining, Pool',270.00,0),(35,'JW Marriott','Mumbai, India','2023-03-20','2023-03-25',1,1,1,'Fitness Center, Rooftop Pool, Indian Restaurant',300.00,0),(36,'Raffles','Singapore','2023-04-05','2023-04-10',1,1,1,'Butler Service, Long Bar, Spa',400.00,0),(37,'Peninsula','Hong Kong, China','2023-05-15','2023-05-20',1,1,1,'Swimming Pool, Michelin Star Restaurant, Spa',350.00,0),(38,'The Langham','London, UK','2023-06-01','2023-06-05',1,1,1,'Luxury Spa, Afternoon Tea, Bar',300.00,0),(39,'Conrad','New York City, USA','2023-07-10','2023-07-15',1,1,1,'Fitness Center, Rooftop Bar, Restaurant',350.00,0),(40,'Hilton','Sydney, Australia','2023-08-20','2023-08-25',1,1,1,'Swimming Pool, Executive Lounge, Spa',380.00,0);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-12 20:51:47

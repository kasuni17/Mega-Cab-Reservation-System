-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mega_cab_service
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_address` text NOT NULL,
  `pickup_location` text NOT NULL,
  `drop_location` text NOT NULL,
  `ride_date` date NOT NULL,
  `ride_time` time NOT NULL,
  `passenger_count` int NOT NULL,
  `luggage_count` int NOT NULL,
  `special_request` text,
  `payment_type` enum('cash','card') NOT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `card_expiry` date DEFAULT NULL,
  `card_cvc` varchar(5) DEFAULT NULL,
  `driver_id` int NOT NULL,
  `cab_id` int NOT NULL,
  `status` enum('assigned','completed','canceled') DEFAULT 'assigned',
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  KEY `driver_id` (`driver_id`),
  KEY `cab_id` (`cab_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`cab_id`) REFERENCES `cabs` (`id`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (12,'Kasuni','kasuniik0217@gmail.com','0712343565','Kandy','Kandy','pilimathalawa','2025-04-04','07:30:00',2,3,NULL,'card','8753875487548','2029-03-15','432',1,27,'canceled',18,'2025-02-28 11:37:51'),(13,'Hashan','hashanwickramasooriya14@gmail.com','0711659612','Thalathuoya','Thalathuoya','Kandy','2025-03-05','09:00:00',6,1,NULL,'card','8753875487549','2028-03-01','438',10,25,'assigned',19,'2025-02-28 11:46:03'),(15,'Kasuni','kasuniik417@gmail.com','0711467850','Pilimathalawa','Kandy','colombo 7','2025-03-07','07:00:00',3,3,NULL,'card','8753875487548','2028-06-07','754',10,25,'completed',20,'2025-03-01 12:12:04'),(16,'Kasuni','kasuniik417@gmail.com','0711467850','Pilimathalawa','kandy','colombo 7','2025-03-05','17:00:00',2,2,NULL,'cash','',NULL,'',17,25,'assigned',20,'2025-03-03 11:44:49');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabs`
--

DROP TABLE IF EXISTS `cabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `capacity` varchar(50) DEFAULT NULL,
  `use_case` varchar(255) DEFAULT NULL,
  `fare_range` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabs`
--

LOCK TABLES `cabs` WRITE;
/*!40000 ALTER TABLE `cabs` DISABLE KEYS */;
INSERT INTO `cabs` VALUES (25,'Suzuki Alto','uploads\\E_3.png','A compact and economical hatchback designed for easy maneuverability and cost-effective travel. With its small footprint and low fuel consumption, the Alto is perfect for navigating city streets and tight parking spaces.','4 passengers (including the driver).','Solo travelers or couples, short city trips.','$12'),(27,'Toyota Corolla','uploads\\S_1.png','A reliable and fuel-efficient sedan with a smooth ride and modern safety features. The Corolla offers a spacious interior, advanced technology, and a stylish design, making it a great choice for business professionals and small families.',' 5 passengers (including the driver).','Business meetings, family outings, or medium-distance trips.','$20'),(28,'Honda Accord','uploads\\S_2.png','A premium sedan with a sleek, sophisticated look and a powerful yet efficient engine. The Accord is known for its comfortable seating, high-tech infotainment system, and smooth handling, making it ideal for long drives and executive travel.','5 passengers (including the driver)','Business meetings, family outings, or medium-distance trips.','$19'),(31,'Toyota Prius','uploads\\E_1.png','A hybrid vehicle known for its excellent fuel efficiency and eco-friendly design. Ideal for city commutes and long drives, the Prius offers a smooth ride with advanced safety features and a comfortable interior.','4 passengers (including the driver).',' Solo travelers or couples, short city trips.','$15'),(32,'Honda Civic ','uploads\\E_2.png','A stylish and reliable sedan with a sleek design and a well-balanced combination of performance and efficiency. The Civic offers a spacious cabin, modern technology, and a responsive driving experience, making it perfect for both urban and highway driving.','4 passengers (including the driver)','Solo travelers or couples, short city trips.','$19'),(33,'Hyundai Elantra.','uploads\\S_3.png','A modern and stylish sedan with a bold design and a feature-packed interior. The Elantra provides excellent fuel economy, a comfortable cabin, and advanced driver-assist technologies, making it perfect for daily commutes and family trips','5 passengers (including the driver).','Business meetings, family outings, or medium-distance trips.','$22'),(34,'Toyota Fortuner','uploads\\SUV_1.png','Spacious and versatile vehicles, perfect for groups or trips requiring extra comfort.','6-7 passengers (including the driver).','Long-distance travel, airport pickups, or family trips.','$25'),(35,'Audi A6','uploads\\L_3.png','High-end vehicles offering premium comfort and a luxurious experience','4 passengers (including the driver).','Corporate travel, special events, or VIP clients.','$30'),(36,'BMW 5 Series','uploads\\L_2.png','A dynamic and performance-driven luxury sedan, the 5 Series combines sporty handling with advanced comfort features. With its premium cabin and intelligent driver assistance, itâs perfect for business professionals and special occasions.','4 passengers (including the driver).','Corporate travel, special events, or VIP clients.','$27'),(37,'Nissan Leaf.','uploads\\EV_2.png','A practical and affordable EV designed for city travel, the Leaf provides a comfortable ride, intuitive technology, and excellent energy efficiency. With its compact size and smooth handling, itâs ideal for daily commutes and urban driving.',' 4-5 passengers (including the driver).','Environmentally conscious users, city travel.','$18');
/*!40000 ALTER TABLE `cabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_reply` text,
  `replied_at` timestamp NULL DEFAULT NULL,
  `status` enum('PENDING','REPLIED') DEFAULT 'PENDING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Kasuni','kasuniik0217@gmail.com','0711458171','hi','2025-02-20 13:11:51','hi','2025-02-20 14:47:31','REPLIED'),(2,'Kasuni','kasuniik0217@gmail.com','0711458170','hi\r\n','2025-02-20 13:44:23','HI','2025-02-20 15:23:39','REPLIED'),(3,'Hashan','kasuniik0217@gmail.com','0702010169','hello give me more info','2025-02-20 15:23:21','hello . Thank you for contacting us. ','2025-02-20 15:50:36','REPLIED'),(4,'Kasuni','kasuniik0217@gmail.com','0702010169','hi\r\n','2025-02-20 15:51:14','hi','2025-02-20 15:51:42','REPLIED'),(5,'Kasuni','kasuniik0217@gmail.com','0711458190','hi\r\n','2025-02-20 15:52:48','hi','2025-02-20 15:53:09','REPLIED'),(6,'Hashan','hashanwickramasooriya14@gmail.com','0702010169','Hello, Iâd like to ask about your cab service. Can you share details on availability and booking? Thanks!','2025-02-20 15:56:14','Hello! Our cab service is available 24/7. You can book a ride by calling us or using our online booking system. Let us know your pickup location and destination, and well arrange a ride for you. Feel free to ask if you need more details. Thank you!','2025-02-20 15:57:08','REPLIED'),(7,'Kasuni','kasuniik0217@gmail.com','0711458190','hi','2025-02-22 17:04:52',NULL,NULL,'PENDING'),(8,'Kasuni','kasuniik0217@gmail.com','0711458171','give me more details about cab service','2025-03-01 07:52:12','jhjh','2025-03-01 07:53:51','REPLIED'),(9,'Kasuni','kasuniik417@gmail.com','0711467850','give more details about cabs','2025-03-01 09:16:10','please visit our web site ','2025-03-01 09:17:11','REPLIED'),(10,'Kasuni','kasuniik0217@gmail.com','0711458171','hi','2025-03-01 12:05:45',NULL,NULL,'PENDING'),(11,'Kasuni','kasuniik417@gmail.com','0711467850','tell me more details about cab service','2025-03-01 12:11:02','please wisit our website','2025-03-01 12:12:57','REPLIED');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address` text,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Hashan','hashan@gmail.com','hashan','234567','0711458171','colombo','inactive','2025-02-14 05:18:45'),(10,'Kasun','kasun0217@gmail.com','Kasun','234567111','0711458170','Kandy','active','2025-02-14 06:26:46'),(13,'Kumara','kumara@gmail.com','kumara','23456766754','0711458987','Colombo','active','2025-03-01 09:19:09'),(16,'Deshan','deshan@gmail.com','deshan','ABC12345','0712345678','Colombo','active','2025-03-03 07:33:56'),(17,'Sandun','sandun@gmail.com','Ssandun','XYZ98765','0729876543','Negambo','active','2025-03-03 07:35:02');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (18,'Kasuni','kasuniik0217@gmail.com','0712343565','200123476549','kasuni','Kandy','2025-02-28 11:36:15'),(19,'Hashan','hashanwickramasooriya14@gmail.com','0711659612','200189765470','hashan','Thalathuoya','2025-02-28 11:44:40'),(20,'Kasuni','kasuniik417@gmail.com','0711467850','200289767540','kasuni12','Pilimathalawa','2025-03-01 09:15:01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 19:50:54

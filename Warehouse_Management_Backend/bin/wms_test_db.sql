CREATE DATABASE  IF NOT EXISTS `wms_test_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wms_test_db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wms_test_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `AddressID` int NOT NULL,
  `UserID` int NOT NULL,
  `RecipientName` varchar(50) DEFAULT NULL,
  `Street` varchar(50) NOT NULL,
  `Street2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL,
  `IsShipping` tinyint(1) NOT NULL,
  `IsBilling` tinyint(1) NOT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'Bobby Joe','100 This st','Apt 20','Los Angeles','CA','90025',1,1),(2,2,'Andrew Williams','3211 That Blvd',NULL,'Dallas','TX','75011',0,1),(3,3,'Nancy Johnson','20 Example Ave',NULL,'New York','NY','10205',1,0),(4,4,'Jenny Jones','777 Some Rd','Apt 94','Minneapolis','MN','55543',1,1),(5,5,'George Lee','57 Hello Ln',NULL,'Honolulu','HI','96720',1,1),(201,1,'Bobby Joe','100 This st','Apt 20','Los Angeles','CA','90025',1,1),(202,2,'Andrew Williams','3211 That Blvd',NULL,'Dallas','TX','75011',0,1),(203,3,'Nancy Johnson','20 Example Ave',NULL,'New York','NY','10205',1,0),(204,4,'Jenny Jones','777 Some Rd','Apt 94','Minneapolis','MN','55543',1,1),(205,5,'George Lee','57 Hello Ln',NULL,'Honolulu','HI','96720',1,1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `CartItemID` int NOT NULL,
  `UserID` int NOT NULL,
  `UPC` char(12) NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`CartItemID`),
  KEY `UserID` (`UserID`),
  KEY `UPC` (`UPC`),
  CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`UPC`) REFERENCES `products` (`UPC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `CreditCardID` int NOT NULL,
  `UserID` int NOT NULL,
  `BankName` varchar(40) NOT NULL,
  `CardType` varchar(20) NOT NULL,
  `CardNumber` char(16) NOT NULL,
  `SecurityNumber` varchar(4) NOT NULL,
  `Expiration` date NOT NULL,
  PRIMARY KEY (`CreditCardID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES (1,1,'Wellsfargo','Visa','4443123467891234','808','2022-09-20'),(2,3,'Bank of America','Amex','3734567891011121','6290','2024-01-25'),(3,2,'Chase','MasterCard','4264483469273672','700','2026-09-29'),(4,5,'Chase','Visa','4231902528753161','232','2025-03-15'),(5,4,'Wellsfargo','Amex','3484127952481970','1101','2028-06-16'),(6,3,'CitiBank','Discovery','6091862988814035','444','2027-07-11'),(7,1,'Wellsfargo','MasterCard','4100360765536477','121','2024-08-07');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int NOT NULL,
  `OrderID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UPC` char(12) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `UPC` (`UPC`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`UPC`) REFERENCES `products` (`UPC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `UserID` int NOT NULL,
  `AddressID` int NOT NULL,
  `Price` float NOT NULL,
  `CreditCardID` int NOT NULL,
  `DateOrdered` datetime NOT NULL,
  `DateShipped` datetime DEFAULT NULL,
  `DateDelivered` datetime DEFAULT NULL,
  `OrderStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `AddressID` (`AddressID`),
  KEY `CreditCardID` (`CreditCardID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`CreditCardID`) REFERENCES `creditcards` (`CreditCardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,10,1,'2011-12-18 13:17:17','2011-12-18 13:17:17',NULL,'Canceled'),(2,2,2,11,2,'2012-12-18 13:17:17','2012-12-18 13:17:17','2012-12-20 13:17:17','Delivered'),(3,3,3,12,3,'2013-12-18 13:17:17','2013-12-18 13:17:17','2013-12-20 13:17:17','Delivered'),(4,4,4,13,4,'2014-12-18 13:17:17','2014-12-18 13:17:17',NULL,'Canceled'),(5,5,5,14,5,'2015-12-18 13:17:17','2015-12-18 13:17:17',NULL,'Canceled'),(6,1,1,10,1,'2015-12-18 13:17:17','2015-12-18 13:17:17','2015-12-20 13:17:17','Delivered'),(7,2,2,11,2,'2016-12-18 13:17:17','2016-12-18 13:17:17','2016-12-20 13:17:17','Delivered'),(8,3,3,12,3,'2017-12-18 13:17:17','2017-12-18 13:17:17',NULL,'Canceled'),(9,5,5,13,5,'2018-12-17 13:17:17','2018-12-18 13:17:17',NULL,'Shipped'),(10,5,5,14,5,'2018-12-18 13:17:17',NULL,NULL,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `UPC` char(12) NOT NULL,
  `ProdName` varchar(50) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `ProdDescription` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `PricePerUnit` float NOT NULL,
  `ImageURL` varchar(2048) DEFAULT NULL,
  `AvailableStock` int NOT NULL,
  `ReservedStock` int NOT NULL,
  `ShippedStock` int NOT NULL,
  PRIMARY KEY (`UPC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('100000000001','Shark Bites','Assorted Gummy Sharks','Betty Crockers','Snacks',3.99,'https://m.media-amazon.com/images/I/51Xlrk8SOaL.jpg',49,5,10),('100000000011','Cheerios','General Mills','Oat cold breakfast cereal','Breakfast Cereals',5.99,'https://i5.walmartimages.com/asr/ce09f4c7-0b16-4c56-9abe-76cf8ed53915.63028f7382a779cd875263c912632114.jpeg',119,3,0),('100000000111','Frosted Flakes','Kelloggs','Sugary corn cold breakfast cereal','Breakfast Cereals',5.99,'https://bjs.scene7.com/is/image/bjs/3633?$bjs-Zoom$',419,25,14),('100000001111','Kix','General Mills','Sugary corn puff cold breakfast cereal','Breakfast Cereals',4.99,'https://cereals.generalmills.com/wp-content/uploads/2019/04/kix.png',44,15,5),('100000011111','Sriracha','Huy Fong Foods','Chili paste hot sauce','Condiments',8.99,'https://m.media-amazon.com/images/I/817HLNV5DZL._SL1500_.jpg',0,1,12),('100000111111','Paper Towels','Bounty','Paper but towels','Household',2.99,'https://images.heb.com/is/image/HEBGrocery/003264047?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0',59,5,10),('100001111111','Goldfish','Pepperidge Farm','Goldfish Baked Snack Crackers Cheddar','Snacks',2.99,'https://www.kroger.com/product/images/large/front/1001410004897',49,6,70),('100011111111','Malk','Now With Vitamin R','Not actually milk','Drinks',0.99,'https://target.scene7.com/is/image/Target/GUEST_fc940329-105c-42ce-8c26-d3d34b1a51b4?wid=800&hei=800&qlt=80&fmt=pjpeg',39,3,3),('600000000002','Crystal Geyser','Crystal Geyser Water Company','Spring Water','Drinks',0.99,'https://images.heb.com/is/image/HEBGrocery/001966477',121,3,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `Phone` char(10) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bobby.joe@gmail.com','Bobby','Joe','password123','9876543210'),(2,'awilliams@yahoo.com','Andrew','Williams','mypassword','8376519501'),(3,'n.johnson@gmail.com','Nancy','Johnson','thisisabadpassword','6504891123'),(4,'jj1205@msn.com','Jenny','Jones','iforgot','6264589104'),(5,'g.s.l.62@gmail.com','George','Lee','whatismypassword','3108573221');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wms_test_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-20 15:19:56

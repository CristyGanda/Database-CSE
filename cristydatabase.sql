-- MySQL dump 10.13  Distrib 8.1.0-1, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.1.0-1

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `motor`
--

DROP TABLE IF EXISTS `motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor` (
  `idmotor` int NOT NULL,
  `type_idtype` int NOT NULL,
  `license_num` varchar(45) DEFAULT NULL,
  `cur_mileage` int DEFAULT NULL,
  `engine_size` int NOT NULL,
  `other_motor_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmotor`,`type_idtype`),
  KEY `fk_motor_type_idx` (`type_idtype`),
  CONSTRAINT `fk_motor_type` FOREIGN KEY (`type_idtype`) REFERENCES `type` (`idtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor`
--

LOCK TABLES `motor` WRITE;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` VALUES (1,1,'ABC123',35000,3,'Blue color,Big bike'),(2,2,'XYZ789',20000,3,'Red color, Big bike'),(3,3,'DEF456',19000,2,'Black color, luxury  Big bike'),(4,4,'GHI789',13000,2,'Silver color, compact motor');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturing`
--

INSERT INTO `manufacturing` VALUES  ('1', 'Honda Click 125i', 'LED headlight, tail light, and winker for a safer ride. Full Digital Meter Panel.'),('2', 'Yamaha Nmax', 'Designed with a 'Prestige and Confidence' concept in mind, its style is simple but elegant, providing comfort and reliability through a sense of riding.'),('3', 'Yamaha Aerox 155', 'the most powerful in the Mio lineup, the Aerox comes with a 155cc liquid-cooled, 4-stroke, SOHC, 4-valve engine which produces 18 hp and 14 Nm of torque.'),('4', 'Honda Click 160', 'A powerful, New Generation 157cc, 4-valve, liquid-cooled, eSP+ engine packs quite the punch for a scooter with a max power of 11.3 kW.'),('5', 'Honda PCX160', 'Bringing elegance and superiority to the next level.');
Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
Editing Database-CSE/mydatabase.sql at main · CristyGanda/Database-CSE

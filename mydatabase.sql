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
INSERT INTO `motor` VALUES (1,1,'ABC123',35000,3,'Blue color, sedan'),(2,2,'XYZ789',20000,3,'Red color, Big bike'),(3,3,'DEF456',19000,2,'Black color, luxury  Big bike'),(4,4,'GHI789',13000,2,'Silver color, compact motor');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturing`
--

DROP TABLE IF EXISTS `manufacturing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturing` (
  `idmanufacturing` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmanufacturing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturing`
--

LOCK TABLES `manufacturing` WRITE;
/*!40000 ALTER TABLE `manufacturing` DISABLE KEYS */;
INSERT INTO `manufacturing` VALUES (1,'Honda Click 125i','One of the largest motor manufacturers in the world.'),(2,'Yamaha Nmax','An American multinational automaker.'),(3,'Yamaha Aerox 155','A German luxury vehicle and motorcycle manufacturer.'),(4,'Honda Click 160','Known for manufacturing motorcycles, automobiles, and power equipment.'),(5,'Honda PCX160','An American automobile division of General Motors.');
/*!40000 ALTER TABLE `manufacturing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `idtype` int NOT NULL,
  `manufacturing_idmanufacturing` int NOT NULL,
  `model_code` varchar(255) DEFAULT NULL,
  `daily_hire_rate` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idtype`,`manufacturing_idmanufacturing`),
  KEY `fk_type_Manufacturer1_idx` (`manufacturing_idmanufacturing`),
  CONSTRAINT `fk_type_Manufacturer1` FOREIGN KEY (`manufacturing_idmanufacturing`) REFERENCES `manufacturing` (`idmanufacturing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,1,'CLICK125i',50,'Honda Click 125i'),(2,2,'NMAX',75,'Yamaha Nmax'),(3,3,'AEROX155',90,'Yamaha Aerox 155'),(4,4,'CLICK160',55,'Honda Click 160'),(5,5,'PCX160',65,'Honda PCX160');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
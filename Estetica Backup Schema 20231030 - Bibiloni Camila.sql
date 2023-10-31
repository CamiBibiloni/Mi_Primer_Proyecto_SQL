CREATE DATABASE  IF NOT EXISTS `estetica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estetica`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: estetica
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` varchar(20) NOT NULL,
  `id_turnos` int DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `telefono` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('C41234123',1,'Cecilia','Riquelme',11784365,'cecir@gmail.com','1977-11-04'),('C41234124',1,'Abril','Cavani',11784366,'abrilc@gmail.com','1977-11-04'),('C41234125',1,'Camila','Zeballos',11784367,'camilaz@gmail.com','1977-11-04'),('C41234126',1,'Liliana','Merentiel',11784368,'lilianam@gmail.com','1977-11-04'),('C41234127',1,'Carolina','Blondel',11784369,'carolinab@gmail.com','1977-11-04'),('C41234128',1,'Gisela','Langoni',11784370,'giselal@gmail.com','1977-11-04'),('C41234129',1,'Lorena','Bullaude',11784371,'lorenab@gmail.com','1977-11-04');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cuartavista`
--

DROP TABLE IF EXISTS `cuartavista`;
/*!50001 DROP VIEW IF EXISTS `cuartavista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cuartavista` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_turnos`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `id_servicio`,
 1 AS `Servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `id_turnos` int NOT NULL,
  `id_puesto` varchar(20) DEFAULT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `telefono` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_turnos` (`id_turnos`),
  KEY `id_puesto` (`id_puesto`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_turnos`) REFERENCES `turnos` (`id_turnos`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (41234567,1,'BAR1','Gabriel','Rivarola',11234567,'grivarola@estetica.com','2023-07-17'),(41234568,1,'COL1','Gonzalo','Ferrero',11234568,'gferrero@estetica.com','2023-07-17'),(41234569,1,'LASH1','Camila','Bibiloni',11234569,'cbibiloni@estetica.com','2023-07-17'),(41234570,1,'MAN1','Guadalupe','Chavez',11234570,'gchavez@estetica.com','2023-07-17'),(41234571,1,'EST1','Agostina','Udria',11234571,'audria@estetica.com','2023-07-17'),(41234572,1,'CEJ1','Ignacio','del Rio',11234572,'idelrio@estetica.com','2023-07-17'),(41234573,1,'BAR2','Valentina','Zenere',11234573,'vzenere@estetica.com','2023-07-17');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `primervista`
--

DROP TABLE IF EXISTS `primervista`;
/*!50001 DROP VIEW IF EXISTS `primervista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `primervista` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_puesto`,
 1 AS `puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` varchar(20) NOT NULL,
  `id_empleado` int NOT NULL,
  `ubicacion_locales` varchar(20) DEFAULT NULL,
  `puesto` tinytext,
  `descripcion_puesto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`),
  KEY `ubicacion_locales` (`ubicacion_locales`),
  CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`ubicacion_locales`) REFERENCES `ubicacion_locales` (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES ('BAR1',41234567,'BELGRANO1','Barbero','Perfilar y cortar barba'),('BAR2',41234573,'BELGRANO1','Barbero','Perfilar y cortar barba'),('CEJ1',41234572,'RAMOS1','Cejas','Perfilado de cejas'),('COL1',41234568,'BELGRANO1','Colorista','Decoloracion y color de pelo'),('EST1',41234571,'LUZURIAGA1','Esteticista','Depilacion de cuerpo'),('LASH1',41234569,'RAMOS1','Lashista','Colocacion de pestanias'),('MAN1',41234570,'PALERMO1','Manicura','Colocacion de unias');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quintavista`
--

DROP TABLE IF EXISTS `quintavista`;
/*!50001 DROP VIEW IF EXISTS `quintavista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quintavista` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_turnos`,
 1 AS `fecha`,
 1 AS `hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `segundavista`
--

DROP TABLE IF EXISTS `segundavista`;
/*!50001 DROP VIEW IF EXISTS `segundavista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `segundavista` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_turnos`,
 1 AS `fecha`,
 1 AS `hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` tinytext,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Corte de Hombre','Barbero',2500),(2,'Corte de Mujer','Barbero',3000),(3,'Tintura','Colorista',10000),(4,'Decoloracion','Colorista',20000),(5,'Extensiones de pestanias','Lashista',5000),(6,'Lifting de pestanias','Lashista',5000),(7,'Laminado de cejas','Cejas',3000),(8,'Depilacion de cejas','Cejas',2000),(9,'Esculpidas en gel','Manicura',8000),(10,'Esmaltado comun','Manicura',5500),(11,'Esmaltado semi','Manicura',6000),(12,'Depilacion cuerpo completo','Esteticista',45000),(13,'Depilacion zona intima','Esteticista',15000);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `servicio_BEFORE_INSERT` BEFORE INSERT ON `servicio` FOR EACH ROW BEGIN
		insert into servicio_log_i values (
		new.id_servicio, new.nombre, new.descripcion, new.precio, curdate(), curtime(), user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `servicio_BEFORE_UPDATE` BEFORE UPDATE ON `servicio` FOR EACH ROW BEGIN
	insert into servicio_log_u 
    select new.id_servicio, new.nombre, new.descripcion, new.precio, curdate(), curtime(), user()
    from servicio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `servicio_BEFORE_DELETE` BEFORE DELETE ON `servicio` FOR EACH ROW BEGIN
	insert into servicio_log_d 
    select old.id_servicio, old.nombre, old.descripcion, old.precio, curdate(), curtime(), user()
    from servicio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `servicio_log_d`
--

DROP TABLE IF EXISTS `servicio_log_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_log_d` (
  `id_servicio` int DEFAULT NULL,
  `nombre` tinytext,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_log_d`
--

LOCK TABLES `servicio_log_d` WRITE;
/*!40000 ALTER TABLE `servicio_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_log_i`
--

DROP TABLE IF EXISTS `servicio_log_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_log_i` (
  `id_servicio` int DEFAULT NULL,
  `nombre` tinytext,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_log_i`
--

LOCK TABLES `servicio_log_i` WRITE;
/*!40000 ALTER TABLE `servicio_log_i` DISABLE KEYS */;
INSERT INTO `servicio_log_i` VALUES (1,'Corte de Hombre','Barbero',2500,'2023-10-04','23:25:23','root@localhost'),(2,'Corte de Mujer','Barbero',3000,'2023-10-04','23:25:23','root@localhost'),(3,'Tintura','Colorista',10000,'2023-10-04','23:25:23','root@localhost'),(4,'Decoloracion','Colorista',20000,'2023-10-04','23:25:23','root@localhost'),(5,'Extensiones de pestanias','Lashista',5000,'2023-10-04','23:25:23','root@localhost'),(6,'Lifting de pestanias','Lashista',5000,'2023-10-04','23:25:23','root@localhost'),(7,'Laminado de cejas','Cejas',3000,'2023-10-04','23:25:23','root@localhost'),(8,'Depilacion de cejas','Cejas',2000,'2023-10-04','23:25:23','root@localhost'),(9,'Esculpidas en gel','Manicura',8000,'2023-10-04','23:25:23','root@localhost'),(10,'Esmaltado comun','Manicura',5500,'2023-10-04','23:25:23','root@localhost'),(11,'Esmaltado semi','Manicura',6000,'2023-10-04','23:25:23','root@localhost'),(12,'Depilacion cuerpo completo','Esteticista',45000,'2023-10-04','23:25:23','root@localhost'),(13,'Depilacion zona intima','Esteticista',15000,'2023-10-04','23:25:23','root@localhost');
/*!40000 ALTER TABLE `servicio_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_log_u`
--

DROP TABLE IF EXISTS `servicio_log_u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_log_u` (
  `id_servicio` int DEFAULT NULL,
  `nombre` tinytext,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_log_u`
--

LOCK TABLES `servicio_log_u` WRITE;
/*!40000 ALTER TABLE `servicio_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_log_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tercervista`
--

DROP TABLE IF EXISTS `tercervista`;
/*!50001 DROP VIEW IF EXISTS `tercervista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tercervista` AS SELECT 
 1 AS `id_servicio`,
 1 AS `nombre`,
 1 AS `id_turnos`,
 1 AS `fecha`,
 1 AS `hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turnos` int NOT NULL,
  `id_cliente` varchar(20) DEFAULT NULL,
  `id_servicio` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `comentarios` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_turnos`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'C41234123',3,'2023-12-30','09:00:00','Color rojo'),(2,'C41234124',5,'2023-12-31','10:00:00','Volumen medio'),(3,'C41234125',6,'2024-01-01','11:00:00','Sin tintura'),(4,'C41234126',1,'2024-01-02','12:00:00','Estilo CR7'),(5,'C41234127',8,'2024-01-03','13:00:00','No tan finas'),(6,'C41234128',9,'2024-01-04','14:00:00','Largo 2'),(7,'C41234129',12,'2024-01-05','15:00:00','Sin comentarios');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_locales`
--

DROP TABLE IF EXISTS `ubicacion_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_locales` (
  `id_ubicacion` varchar(20) NOT NULL,
  `locales` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_locales`
--

LOCK TABLES `ubicacion_locales` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales` DISABLE KEYS */;
INSERT INTO `ubicacion_locales` VALUES ('BELGRANO1','Peluqueria'),('LUZURIAGA1','Depilacion'),('PALERMO1','Manicuria'),('RAMOS1','Pestanias y Cejas');
/*!40000 ALTER TABLE `ubicacion_locales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ubicacion_locales_AFTER_INSERT` AFTER INSERT ON `ubicacion_locales` FOR EACH ROW BEGIN
		insert into ubicacion_locales_log_i values (
		new.id_ubicacion, new.locales, curdate(), curtime(), user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ubicacion_locales_AFTER_UPDATE` AFTER UPDATE ON `ubicacion_locales` FOR EACH ROW BEGIN
	insert into ubicacion_locales_log_u 
    select new.id_ubicacion, new.locales, curdate(), curtime(), user()
    from ubicacion_locales;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ubicacion_locales_AFTER_DELETE` AFTER DELETE ON `ubicacion_locales` FOR EACH ROW BEGIN
	insert into ubicacion_locales_log_d 
    select old.id_ubicacion, old.locales, curdate(), curtime(), user()
    from ubicacion_locales;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ubicacion_locales_log_d`
--

DROP TABLE IF EXISTS `ubicacion_locales_log_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_locales_log_d` (
  `id_ubicacion` varchar(20) DEFAULT NULL,
  `locales` varchar(30) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_locales_log_d`
--

LOCK TABLES `ubicacion_locales_log_d` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_locales_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_locales_log_i`
--

DROP TABLE IF EXISTS `ubicacion_locales_log_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_locales_log_i` (
  `id_ubicacion` varchar(20) DEFAULT NULL,
  `locales` varchar(30) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_locales_log_i`
--

LOCK TABLES `ubicacion_locales_log_i` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_i` DISABLE KEYS */;
INSERT INTO `ubicacion_locales_log_i` VALUES ('BELGRANO1','Peluqueria','2023-10-04','23:26:06','root@localhost'),('PALERMO1','Manicuria','2023-10-04','23:26:06','root@localhost'),('RAMOS1','Pestanias y Cejas','2023-10-04','23:26:06','root@localhost'),('LUZURIAGA1','Depilacion','2023-10-04','23:26:06','root@localhost');
/*!40000 ALTER TABLE `ubicacion_locales_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_locales_log_u`
--

DROP TABLE IF EXISTS `ubicacion_locales_log_u`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_locales_log_u` (
  `id_ubicacion` varchar(20) DEFAULT NULL,
  `locales` varchar(30) DEFAULT NULL,
  `fechacambio` date DEFAULT NULL,
  `horacambio` time DEFAULT NULL,
  `usercambio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_locales_log_u`
--

LOCK TABLES `ubicacion_locales_log_u` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_locales_log_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'estetica'
--

--
-- Dumping routines for database 'estetica'
--
/*!50003 DROP FUNCTION IF EXISTS `Funcion1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Funcion1`(ServicioID text(30)) RETURNS varchar(30) CHARSET utf8mb4
    READS SQL DATA
begin

declare Resultado varchar(30);
select nombre
into Resultado
from servicio
where id_servicio = ServicioID;

Return Resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Funcion2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Funcion2`(Empleado text(20)) RETURNS tinytext CHARSET utf8mb4
    READS SQL DATA
begin

declare Resultado text(20);
select nombre
into Resultado
from empleados
where id_empleado = Empleado;

Return Resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente`(
    IN e_id VARCHAR(20),
    IN e_nombre VARCHAR(50),
    IN e_apellido VARCHAR(50),
    IN e_telefono INT ,
    IN e_email VARCHAR(100),
    IN e_fecha_nacimiento DATE
)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Intentar insertar un nuevo registro en la tabla
        INSERT INTO cliente (id_cliente, nombre, apellido, telefono, email, fecha_nacimiento)
        VALUES (e_id, e_nombre, e_apellido, e_telefono, e_email, e_fecha_nacimiento);

    -- Comprobar si ocurrió un error durante la inserción
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Registro insertado correctamente.';
    ELSE
        SET mensaje = 'No se pudo insertar el registro. Verifique los valores proporcionados.';
    END IF;

    -- Mostrar el mensaje
    SELECT mensaje AS Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarTurnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarTurnos`(
    IN Tabla VARCHAR(100),
    IN Columnas VARCHAR(100),
    IN TipoOrden VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', Tabla, ' order by ', Columnas, ' ', TipoOrden);
    PREPARE runsql FROM @query;
    EXECUTE runsql;
    DEALLOCATE PREPARE runsql;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cuartavista`
--

/*!50001 DROP VIEW IF EXISTS `cuartavista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cuartavista` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`t`.`id_turnos` AS `id_turnos`,`t`.`fecha` AS `fecha`,`t`.`hora` AS `hora`,`s`.`id_servicio` AS `id_servicio`,`s`.`nombre` AS `Servicio` from ((`cliente` `c` join `turnos` `t` on((`c`.`id_cliente` = `t`.`id_cliente`))) join `servicio` `s` on((`s`.`id_servicio` = `t`.`id_servicio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `primervista`
--

/*!50001 DROP VIEW IF EXISTS `primervista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `primervista` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`p`.`id_puesto` AS `id_puesto`,`p`.`puesto` AS `puesto` from (`empleados` `e` join `puestos` `p` on((`e`.`id_puesto` = `p`.`id_puesto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quintavista`
--

/*!50001 DROP VIEW IF EXISTS `quintavista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quintavista` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`t`.`id_turnos` AS `id_turnos`,`t`.`fecha` AS `fecha`,`t`.`hora` AS `hora` from (`empleados` `e` join `turnos` `t` on((`e`.`id_turnos` = `t`.`id_turnos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `segundavista`
--

/*!50001 DROP VIEW IF EXISTS `segundavista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `segundavista` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`t`.`id_turnos` AS `id_turnos`,`t`.`fecha` AS `fecha`,`t`.`hora` AS `hora` from (`cliente` `c` join `turnos` `t` on((`c`.`id_cliente` = `t`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tercervista`
--

/*!50001 DROP VIEW IF EXISTS `tercervista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tercervista` AS select `s`.`id_servicio` AS `id_servicio`,`s`.`nombre` AS `nombre`,`t`.`id_turnos` AS `id_turnos`,`t`.`fecha` AS `fecha`,`t`.`hora` AS `hora` from (`servicio` `s` join `turnos` `t` on((`s`.`id_servicio` = `t`.`id_servicio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 23:39:24

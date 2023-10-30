-- BD Backup 2023-10-29
-- Tablas: Cliente, Empleados, Puesto, Servicio, Turnos, Ubicacion Locales.
-- Tablas de Logs: servicio_log_i, servicio_log_u, servicio_log_d, ubicacion_locales_log_i, ubicacion_locales_log_u, ubicacion_locales_log_d.

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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('C41234123',1,'Cecilia','Riquelme',11784365,'cecir@gmail.com','1977-11-04'),('C41234124',1,'Abril','Cavani',11784366,'abrilc@gmail.com','1977-11-04'),('C41234125',1,'Camila','Zeballos',11784367,'camilaz@gmail.com','1977-11-04'),('C41234126',1,'Liliana','Merentiel',11784368,'lilianam@gmail.com','1977-11-04'),('C41234127',1,'Carolina','Blondel',11784369,'carolinab@gmail.com','1977-11-04'),('C41234128',1,'Gisela','Langoni',11784370,'giselal@gmail.com','1977-11-04'),('C41234129',1,'Lorena','Bullaude',11784371,'lorenab@gmail.com','1977-11-04');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (41234567,1,'BAR1','Gabriel','Rivarola',11234567,'grivarola@estetica.com','2023-07-17'),(41234568,1,'COL1','Gonzalo','Ferrero',11234568,'gferrero@estetica.com','2023-07-17'),(41234569,1,'LASH1','Camila','Bibiloni',11234569,'cbibiloni@estetica.com','2023-07-17'),(41234570,1,'MAN1','Guadalupe','Chavez',11234570,'gchavez@estetica.com','2023-07-17'),(41234571,1,'EST1','Agostina','Udria',11234571,'audria@estetica.com','2023-07-17'),(41234572,1,'CEJ1','Ignacio','del Rio',11234572,'idelrio@estetica.com','2023-07-17'),(41234573,1,'BAR2','Valentina','Zenere',11234573,'vzenere@estetica.com','2023-07-17');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES ('BAR1',41234567,'BELGRANO1','Barbero','Perfilar y cortar barba'),('BAR2',41234573,'BELGRANO1','Barbero','Perfilar y cortar barba'),('CEJ1',41234572,'RAMOS1','Cejas','Perfilado de cejas'),('COL1',41234568,'BELGRANO1','Colorista','Decoloracion y color de pelo'),('EST1',41234571,'LUZURIAGA1','Esteticista','Depilacion de cuerpo'),('LASH1',41234569,'RAMOS1','Lashista','Colocacion de pestanias'),('MAN1',41234570,'PALERMO1','Manicura','Colocacion de unias');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Corte de Hombre','Barbero',2500),(2,'Corte de Mujer','Barbero',3000),(3,'Tintura','Colorista',10000),(4,'Decoloracion','Colorista',20000),(5,'Extensiones de pestanias','Lashista',5000),(6,'Lifting de pestanias','Lashista',5000),(7,'Laminado de cejas','Cejas',3000),(8,'Depilacion de cejas','Cejas',2000),(9,'Esculpidas en gel','Manicura',8000),(10,'Esmaltado comun','Manicura',5500),(11,'Esmaltado semi','Manicura',6000),(12,'Depilacion cuerpo completo','Esteticista',45000),(13,'Depilacion zona intima','Esteticista',15000);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio_log_d`
--

LOCK TABLES `servicio_log_d` WRITE;
/*!40000 ALTER TABLE `servicio_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio_log_i`
--

LOCK TABLES `servicio_log_i` WRITE;
/*!40000 ALTER TABLE `servicio_log_i` DISABLE KEYS */;
INSERT INTO `servicio_log_i` VALUES (1,'Corte de Hombre','Barbero',2500,'2023-10-04','23:25:23','root@localhost'),(2,'Corte de Mujer','Barbero',3000,'2023-10-04','23:25:23','root@localhost'),(3,'Tintura','Colorista',10000,'2023-10-04','23:25:23','root@localhost'),(4,'Decoloracion','Colorista',20000,'2023-10-04','23:25:23','root@localhost'),(5,'Extensiones de pestanias','Lashista',5000,'2023-10-04','23:25:23','root@localhost'),(6,'Lifting de pestanias','Lashista',5000,'2023-10-04','23:25:23','root@localhost'),(7,'Laminado de cejas','Cejas',3000,'2023-10-04','23:25:23','root@localhost'),(8,'Depilacion de cejas','Cejas',2000,'2023-10-04','23:25:23','root@localhost'),(9,'Esculpidas en gel','Manicura',8000,'2023-10-04','23:25:23','root@localhost'),(10,'Esmaltado comun','Manicura',5500,'2023-10-04','23:25:23','root@localhost'),(11,'Esmaltado semi','Manicura',6000,'2023-10-04','23:25:23','root@localhost'),(12,'Depilacion cuerpo completo','Esteticista',45000,'2023-10-04','23:25:23','root@localhost'),(13,'Depilacion zona intima','Esteticista',15000,'2023-10-04','23:25:23','root@localhost');
/*!40000 ALTER TABLE `servicio_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio_log_u`
--

LOCK TABLES `servicio_log_u` WRITE;
/*!40000 ALTER TABLE `servicio_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_log_u` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'C41234123',3,'2023-12-30','09:00:00','Color rojo'),(2,'C41234124',5,'2023-12-31','10:00:00','Volumen medio'),(3,'C41234125',6,'2024-01-01','11:00:00','Sin tintura'),(4,'C41234126',1,'2024-01-02','12:00:00','Estilo CR7'),(5,'C41234127',8,'2024-01-03','13:00:00','No tan finas'),(6,'C41234128',9,'2024-01-04','14:00:00','Largo 2'),(7,'C41234129',12,'2024-01-05','15:00:00','Sin comentarios');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ubicacion_locales`
--

LOCK TABLES `ubicacion_locales` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales` DISABLE KEYS */;
INSERT INTO `ubicacion_locales` VALUES ('BELGRANO1','Peluqueria'),('LUZURIAGA1','Depilacion'),('PALERMO1','Manicuria'),('RAMOS1','Pestanias y Cejas');
/*!40000 ALTER TABLE `ubicacion_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ubicacion_locales_log_d`
--

LOCK TABLES `ubicacion_locales_log_d` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_locales_log_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ubicacion_locales_log_i`
--

LOCK TABLES `ubicacion_locales_log_i` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_i` DISABLE KEYS */;
INSERT INTO `ubicacion_locales_log_i` VALUES ('BELGRANO1','Peluqueria','2023-10-04','23:26:06','root@localhost'),('PALERMO1','Manicuria','2023-10-04','23:26:06','root@localhost'),('RAMOS1','Pestanias y Cejas','2023-10-04','23:26:06','root@localhost'),('LUZURIAGA1','Depilacion','2023-10-04','23:26:06','root@localhost');
/*!40000 ALTER TABLE `ubicacion_locales_log_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ubicacion_locales_log_u`
--

LOCK TABLES `ubicacion_locales_log_u` WRITE;
/*!40000 ALTER TABLE `ubicacion_locales_log_u` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion_locales_log_u` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 22:54:23

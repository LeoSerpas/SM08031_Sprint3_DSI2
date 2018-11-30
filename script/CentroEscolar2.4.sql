-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: centroescolar
-- ------------------------------------------------------
-- Server version 5.5.5-10.3.7-MariaDB

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
-- Table structure for table `ACT_COTIDIANAS`
--

DROP TABLE IF EXISTS `ACT_COTIDIANAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_COTIDIANAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_cotidiana` float DEFAULT NULL,
  `nota_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_COTIDIANAS`
--

LOCK TABLES `ACT_COTIDIANAS` WRITE;
/*!40000 ALTER TABLE `ACT_COTIDIANAS` DISABLE KEYS */;
INSERT INTO `ACT_COTIDIANAS` VALUES (17,3.99,1.4,'2018-11-25 13:49:48','2018-11-26 04:32:50',22),(18,10,3.5,'2018-11-25 13:49:48','2018-11-26 05:43:06',23),(19,6,6,'2018-11-25 23:25:28','2018-11-25 23:25:28',24),(20,5,8,'2018-11-25 23:25:28','2018-11-25 23:25:28',25),(21,7,2.45,'2018-11-25 23:32:41','2018-11-26 09:44:38',26),(22,5,1.75,'2018-11-25 23:32:41','2018-11-26 09:44:38',27),(23,7,2.45,'2018-11-26 09:43:03','2018-11-26 09:43:03',28);
/*!40000 ALTER TABLE `ACT_COTIDIANAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_INTEGRADORAS`
--

DROP TABLE IF EXISTS `ACT_INTEGRADORAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_INTEGRADORAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activi_1` float DEFAULT NULL,
  `activi_2` float DEFAULT NULL,
  `promedio_i` float DEFAULT NULL,
  `prom_i_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_INTEGRADORAS`
--

LOCK TABLES `ACT_INTEGRADORAS` WRITE;
/*!40000 ALTER TABLE `ACT_INTEGRADORAS` DISABLE KEYS */;
INSERT INTO `ACT_INTEGRADORAS` VALUES (1,2,2,0,0,'2018-11-25 13:14:29','2018-11-25 13:14:29',NULL),(2,0,0,0,0,'2018-11-25 13:15:22','2018-11-25 13:15:22',NULL),(3,0,0,0,0,'2018-11-25 13:16:03','2018-11-25 13:16:03',NULL),(4,0,0,0,0,'2018-11-25 13:16:30','2018-11-25 13:16:30',NULL),(5,0,0,0,0,'2018-11-25 13:17:20','2018-11-25 13:17:20',NULL),(6,0,0,0,0,'2018-11-25 13:17:20','2018-11-25 13:17:20',NULL),(7,0,0,0,0,'2018-11-25 13:17:58','2018-11-25 13:17:58',NULL),(8,0,0,0,0,'2018-11-25 13:17:59','2018-11-25 13:17:59',NULL),(9,0,0,0,0,'2018-11-25 13:19:28','2018-11-25 13:19:28',NULL),(10,0,0,0,0,'2018-11-25 13:19:28','2018-11-25 13:19:28',NULL),(11,0,0,0,0,'2018-11-25 13:19:31','2018-11-25 13:19:31',NULL),(12,0,0,0,0,'2018-11-25 13:19:32','2018-11-25 13:19:32',NULL),(13,0,0,0,0,'2018-11-25 13:19:38','2018-11-25 13:19:38',NULL),(14,0,0,0,0,'2018-11-25 13:19:38','2018-11-25 13:19:38',NULL),(15,8,8,5.5,2.4,'2018-11-25 13:22:04','2018-11-26 03:06:59',22),(16,10,1,5.5,1.92,'2018-11-25 13:22:04','2018-11-26 09:43:03',23),(17,2.84,6.05,6,6,'2018-11-25 23:25:28','2018-11-25 23:29:00',24),(18,6,5.03,5,4,'2018-11-25 23:25:28','2018-11-25 23:29:00',25),(19,10,7,8.5,2.97,'2018-11-25 23:32:41','2018-11-26 09:45:27',26),(20,5,1,3,1.05,'2018-11-25 23:32:41','2018-11-26 09:45:27',27),(21,7,8,7.5,2.63,'2018-11-26 09:43:03','2018-11-26 09:43:03',28);
/*!40000 ALTER TABLE `ACT_INTEGRADORAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ALUMNOS`
--

DROP TABLE IF EXISTS `ALUMNOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALUMNOS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `no_nie` int(11) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_nie` (`no_nie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUMNOS`
--

LOCK TABLES `ALUMNOS` WRITE;
/*!40000 ALTER TABLE `ALUMNOS` DISABLE KEYS */;
INSERT INTO `ALUMNOS` VALUES (1,'Milton Alexander','Figueroa',1234567,'1998-11-28',NULL,'2018-11-25 07:31:53','2018-11-25 07:31:53'),(2,'karla','Castillo',2225554,'2000-01-01',NULL,'2018-11-25 07:51:03','2018-11-25 07:51:03'),(3,'Abraham','Alfaro',4564789,'2008-11-22',NULL,'2018-11-25 10:15:38','2018-11-25 10:15:38');
/*!40000 ALTER TABLE `ALUMNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASIGNACIONES`
--

DROP TABLE IF EXISTS `ASIGNACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASIGNACIONES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GRADO_UNICO` (`id_grado`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `GRADOS` (`id`),
  CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `DOCENTES` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNACIONES`
--

LOCK TABLES `ASIGNACIONES` WRITE;
/*!40000 ALTER TABLE `ASIGNACIONES` DISABLE KEYS */;
INSERT INTO `ASIGNACIONES` VALUES (1,1,1,2019,'2018-11-25 07:35:43','2018-11-25 07:35:43'),(2,1,3,2018,'2018-11-25 07:36:04','2018-11-25 07:36:04'),(4,2,2,2018,'2018-11-25 07:50:25','2018-11-25 07:50:25');
/*!40000 ALTER TABLE `ASIGNACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASIGNACION_ALUMNOS_NOTAS`
--

DROP TABLE IF EXISTS `ASIGNACION_ALUMNOS_NOTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASIGNACION_ALUMNOS_NOTAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALUMNO_GRADO_UNICO` (`id_asignacion`,`id_alumno`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_1` FOREIGN KEY (`id_asignacion`) REFERENCES `ASIGNACIONES` (`id`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `ALUMNOS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNACION_ALUMNOS_NOTAS`
--

LOCK TABLES `ASIGNACION_ALUMNOS_NOTAS` WRITE;
/*!40000 ALTER TABLE `ASIGNACION_ALUMNOS_NOTAS` DISABLE KEYS */;
INSERT INTO `ASIGNACION_ALUMNOS_NOTAS` VALUES (1,1,1,'2018-11-25 07:36:59','2018-11-25 07:36:59'),(2,4,2,'2018-11-25 07:51:16','2018-11-25 07:51:16'),(3,4,3,'2018-11-25 10:16:34','2018-11-25 10:16:34');
/*!40000 ALTER TABLE `ASIGNACION_ALUMNOS_NOTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASIGNACION_DOCENTES_MATERIAS`
--

DROP TABLE IF EXISTS `ASIGNACION_DOCENTES_MATERIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASIGNACION_DOCENTES_MATERIAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materia` (`id_materia`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asignacion_docentes_materias_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `MATERIAS` (`id`),
  CONSTRAINT `asignacion_docentes_materias_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `DOCENTES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNACION_DOCENTES_MATERIAS`
--

LOCK TABLES `ASIGNACION_DOCENTES_MATERIAS` WRITE;
/*!40000 ALTER TABLE `ASIGNACION_DOCENTES_MATERIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASIGNACION_DOCENTES_MATERIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASIGNACION_NOTAS`
--

DROP TABLE IF EXISTS `ASIGNACION_NOTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASIGNACION_NOTAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) DEFAULT NULL,
  `id_conducta` int(11) DEFAULT NULL,
  `id_pruebas` int(11) DEFAULT NULL,
  `id_cotidianas` int(11) DEFAULT NULL,
  `id_integradoras` int(11) DEFAULT NULL,
  `id_asignacion_alumno` int(11) DEFAULT NULL,
  `nota_trimestral` float DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_alumno` (`id_asignacion_alumno`),
  KEY `id_pruebas` (`id_pruebas`),
  KEY `id_cotidianas` (`id_cotidianas`),
  KEY `id_integradoras` (`id_integradoras`),
  KEY `id_conducta` (`id_conducta`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `asignacion_notas_ibfk_1` FOREIGN KEY (`id_asignacion_alumno`) REFERENCES `ASIGNACION_ALUMNOS_NOTAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `MATERIAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_3` FOREIGN KEY (`id_pruebas`) REFERENCES `PRUEBAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_4` FOREIGN KEY (`id_cotidianas`) REFERENCES `ACT_COTIDIANAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_5` FOREIGN KEY (`id_integradoras`) REFERENCES `ACT_INTEGRADORAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_6` FOREIGN KEY (`id_conducta`) REFERENCES `CONDUCTAS` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_7` FOREIGN KEY (`id_materia`) REFERENCES `MATERIAS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNACION_NOTAS`
--

LOCK TABLES `ASIGNACION_NOTAS` WRITE;
/*!40000 ALTER TABLE `ASIGNACION_NOTAS` DISABLE KEYS */;
INSERT INTO `ASIGNACION_NOTAS` VALUES (23,1,NULL,NULL,NULL,NULL,3,7.82,1,NULL,'2018-11-25 13:17:20','2018-11-26 09:53:57'),(24,2,NULL,NULL,NULL,NULL,2,0,NULL,NULL,'2018-11-25 23:25:28','2018-11-25 23:28:17'),(25,2,NULL,NULL,NULL,NULL,3,0,NULL,NULL,'2018-11-25 23:25:28','2018-11-25 23:28:17'),(26,3,NULL,NULL,NULL,NULL,2,7.52,NULL,NULL,'2018-11-25 23:32:41','2018-11-26 09:45:27'),(27,3,NULL,NULL,NULL,NULL,3,4.9,NULL,NULL,'2018-11-25 23:32:41','2018-11-26 09:45:27'),(28,1,NULL,NULL,NULL,NULL,2,7.03,NULL,NULL,'2018-11-26 09:43:03','2018-11-26 09:43:03');
/*!40000 ALTER TABLE `ASIGNACION_NOTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONDUCTAS`
--

DROP TABLE IF EXISTS `CONDUCTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONDUCTAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moral_civica` varchar(30) DEFAULT NULL,
  `nota_conducta` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONDUCTAS`
--

LOCK TABLES `CONDUCTAS` WRITE;
/*!40000 ALTER TABLE `CONDUCTAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONDUCTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCENTES`
--

DROP TABLE IF EXISTS `DOCENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCENTES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `no_escalafon` decimal(10,0) NOT NULL,
  `no_dui` char(10) NOT NULL,
  `telefono` char(8) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_escalafon` (`no_escalafon`),
  UNIQUE KEY `no_dui` (`no_dui`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCENTES`
--

LOCK TABLES `DOCENTES` WRITE;
/*!40000 ALTER TABLE `DOCENTES` DISABLE KEYS */;
INSERT INTO `DOCENTES` VALUES (1,1,1234564,'1234564987','72781466','Direccion 1','2018-11-25 07:31:14','2018-11-25 07:31:14'),(2,2,1215454,'03931841-4','54545454','5454545','2018-11-25 07:49:32','2018-11-25 07:49:32');
/*!40000 ALTER TABLE `DOCENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRADOS`
--

DROP TABLE IF EXISTS `GRADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRADOS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `seccion` char(8) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GRADO_UNICO` (`nombre`,`seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRADOS`
--

LOCK TABLES `GRADOS` WRITE;
/*!40000 ALTER TABLE `GRADOS` DISABLE KEYS */;
INSERT INTO `GRADOS` VALUES (1,'Noveno','A',30,'2018-11-25 07:33:49','2018-11-25 07:33:49'),(2,'Octavo','B',60,'2018-11-25 07:34:11','2018-11-25 07:34:11'),(3,'Séptimo','A',30,'2018-11-25 07:34:46','2018-11-25 07:34:46');
/*!40000 ALTER TABLE `GRADOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIAS`
--

DROP TABLE IF EXISTS `MATERIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATERIAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIAS`
--

LOCK TABLES `MATERIAS` WRITE;
/*!40000 ALTER TABLE `MATERIAS` DISABLE KEYS */;
INSERT INTO `MATERIAS` VALUES (1,'Lenguaje','2018-11-25 07:32:13','2018-11-25 07:32:13'),(2,'Matematicas','2018-11-25 07:32:36','2018-11-25 07:32:36'),(3,'Ciencias Sociales','2018-11-25 07:32:59','2018-11-25 07:32:59');
/*!40000 ALTER TABLE `MATERIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISOS`
--

DROP TABLE IF EXISTS `PERMISOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISOS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISOS`
--

LOCK TABLES `PERMISOS` WRITE;
/*!40000 ALTER TABLE `PERMISOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERMISOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISO_ROL`
--

DROP TABLE IF EXISTS `PERMISO_ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISO_ROL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permisos` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permisos` (`id_permisos`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `permiso_rol_ibfk_1` FOREIGN KEY (`id_permisos`) REFERENCES `PERMISOS` (`id`),
  CONSTRAINT `permiso_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `ROLES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISO_ROL`
--

LOCK TABLES `PERMISO_ROL` WRITE;
/*!40000 ALTER TABLE `PERMISO_ROL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERMISO_ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRUEBAS`
--

DROP TABLE IF EXISTS `PRUEBAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRUEBAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `laboratorio` float DEFAULT NULL,
  `examen` float DEFAULT NULL,
  `promedio_p` float DEFAULT NULL,
  `prom_p_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRUEBAS`
--

LOCK TABLES `PRUEBAS` WRITE;
/*!40000 ALTER TABLE `PRUEBAS` DISABLE KEYS */;
INSERT INTO `PRUEBAS` VALUES (1,0,0,0,0,'2018-11-25 13:17:20','2018-11-25 13:17:20',NULL),(2,0,0,0,0,'2018-11-25 13:17:20','2018-11-25 13:17:20',NULL),(3,2,4,4,4,'2018-11-25 13:17:58','2018-11-25 13:17:58',NULL),(4,0,0,0,0,'2018-11-25 13:17:59','2018-11-25 13:17:59',NULL),(5,10,10,10,3,'2018-11-25 13:19:28','2018-11-26 05:47:40',22),(6,9,7,8,2.4,'2018-11-25 13:19:28','2018-11-26 09:43:03',23),(7,6,6,6,6,'2018-11-25 23:25:28','2018-11-25 23:25:28',24),(8,7,8,8,8,'2018-11-25 23:25:28','2018-11-25 23:25:28',25),(9,5,9,7,2.1,'2018-11-25 23:32:41','2018-11-26 09:45:27',26),(10,7,7,7,2.1,'2018-11-25 23:32:41','2018-11-26 09:45:27',27),(11,8,5,6.5,1.95,'2018-11-26 09:43:03','2018-11-26 09:43:03',28);
/*!40000 ALTER TABLE `PRUEBAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLES` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROL_USUARIO`
--

DROP TABLE IF EXISTS `ROL_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROL_USUARIO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `USERS` (`id`),
  CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `ROLES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROL_USUARIO`
--

LOCK TABLES `ROL_USUARIO` WRITE;
/*!40000 ALTER TABLE `ROL_USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROL_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` char(255) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(191) NOT NULL,
  `email` varchar(30) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'Serpas','Serpas','$2y$10$yLtDDPAcLMeUK/8LELOKg.3KOfAvvPDq5cTAsoS4jHrasR7xrWR1u','leon_s054@hotmail.com','6hWQD7x5fVYfmHp33ig4bRSjLR9QVdyMZTpROf3TEleheDh9DFzvKBQcUVhX','2018-11-25 07:30:18','2018-11-25 07:30:18'),(2,'alexsfig','Milton Alexander Sosa Figueroa','$2y$10$QYjqGdEBIW4vNcqqonGPCObkK9mrdrcx0BtUNDu3ebAd88UY4WRvm','alexandersosa2204@gmail.com',NULL,'2018-11-25 07:48:33','2018-11-25 07:48:33');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 11:33:52

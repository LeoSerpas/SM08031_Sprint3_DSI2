-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para centroescolar
CREATE DATABASE IF NOT EXISTS `centroescolar` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `centroescolar`;

-- Volcando estructura para tabla centroescolar.act_cotidianas
CREATE TABLE IF NOT EXISTS `act_cotidianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  `nota_cotidiana` float DEFAULT NULL,
  `nota_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_notas` (`id_asignacion_notas`),
  CONSTRAINT `act_cotidianas_ibfk_1` FOREIGN KEY (`id_asignacion_notas`) REFERENCES `asignacion_notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_cotidianas: ~34 rows (aproximadamente)
/*!40000 ALTER TABLE `act_cotidianas` DISABLE KEYS */;
INSERT INTO `act_cotidianas` (`id`, `id_asignacion_notas`, `nota_cotidiana`, `nota_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 0, 0, '2018-12-30 06:29:48', '2018-12-30 06:29:48'),
  (2, 2, 0, 0, '2018-12-30 06:29:48', '2018-12-30 06:29:48'),
  (3, 3, 0, 0, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (4, 4, 0, 0, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (5, 5, 0, 0, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (6, 6, 0, 0, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (7, 7, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (8, 8, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (9, 9, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (10, 10, 0, 0, '2019-01-02 07:30:06', '2019-01-02 07:30:06'),
  (11, 11, 10, 3.5, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (12, 12, 8, 2.8, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (13, 13, 9, 3.15, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (14, 14, 9, 3.15, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (15, 15, 9, 3.15, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (16, 16, 9, 3.15, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (17, 17, 9, 3.15, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (18, 18, 9, 3.15, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (19, 19, 9, 3.15, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (20, 20, 4, 1.4, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (21, 21, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (22, 22, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (23, 23, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (24, 24, 8, 2.8, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (25, 25, 8, 2.8, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (26, 26, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (27, 27, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (28, 28, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (29, 29, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (30, 30, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (31, 31, 8, 2.8, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (32, 32, 7, 2.45, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (33, 33, 8, 2.8, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (34, 34, 7, 2.45, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (35, 35, 8, 2.8, '2019-01-11 18:24:00', '2019-01-11 18:24:00');
/*!40000 ALTER TABLE `act_cotidianas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.act_integradoras
CREATE TABLE IF NOT EXISTS `act_integradoras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  `activi_1` float DEFAULT NULL,
  `activi_2` float DEFAULT NULL,
  `promedio_i` float DEFAULT NULL,
  `prom_i_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_notas` (`id_asignacion_notas`),
  CONSTRAINT `act_integradoras_ibfk_1` FOREIGN KEY (`id_asignacion_notas`) REFERENCES `asignacion_notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_integradoras: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `act_integradoras` DISABLE KEYS */;
INSERT INTO `act_integradoras` (`id`, `id_asignacion_notas`, `activi_1`, `activi_2`, `promedio_i`, `prom_i_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 0.01, 1, 0.51, 0.18, '2018-12-30 01:40:48', '2019-01-02 07:30:06'),
  (2, 2, 1, 1, 1, 0.35, '2018-12-30 06:29:48', '2018-12-30 06:29:48'),
  (3, 3, 2, 2, 2, 0.7, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (4, 4, 2, 2, 2, 0.7, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (5, 5, 3, 3, 3, 1.05, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (6, 6, 3, 3, 3, 1.05, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (7, 7, 9, 8, 8.5, 2.97, '2019-01-02 01:01:55', '2019-01-02 01:01:55'),
  (8, 8, 7, 8, 7.5, 2.63, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (9, 9, 0, 0, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (10, 10, 0, 0, 0, 0, '2019-01-02 07:30:06', '2019-01-02 07:30:06'),
  (11, 11, 10, 10, 10, 3.5, '2019-01-07 21:54:03', '2019-01-07 21:54:03'),
  (12, 12, 9, 9, 9, 3.15, '2019-01-07 21:54:03', '2019-01-07 21:54:03'),
  (13, 13, 8, 8, 8, 2.8, '2019-01-07 21:54:03', '2019-01-07 21:54:03'),
  (14, 14, 7, 7, 7, 2.45, '2019-01-07 21:54:03', '2019-01-07 21:54:03'),
  (15, 15, 6, 6, 6, 2.1, '2019-01-07 21:54:03', '2019-01-07 21:54:03'),
  (16, 16, 7, 8, 7.5, 2.63, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (17, 17, 7, 8, 7.5, 2.63, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (18, 18, 7, 8, 7.5, 2.63, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (19, 19, 7, 8, 7.5, 2.63, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (20, 20, 7, 9, 8, 2.8, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (21, 21, 8, 8, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (22, 22, 8, 8, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (23, 23, 8, 8, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (24, 24, 8, 8, 8, 2.8, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (25, 25, 8, 8, 8, 2.8, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (26, 26, 7, 7, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (27, 27, 7, 7, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (28, 28, 7, 7, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (29, 29, 7, 7, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (30, 30, 7, 7, 7, 2.45, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (31, 31, 8, 7, 7.5, 2.63, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (32, 32, 7, 8, 7.5, 2.63, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (33, 33, 8, 7, 7.5, 2.63, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (34, 34, 7, 8, 7.5, 2.63, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (35, 35, 7, 8, 7.5, 2.63, '2019-01-11 18:24:00', '2019-01-11 18:24:00');
/*!40000 ALTER TABLE `act_integradoras` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `no_nie` int(11) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.alumnos: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombres`, `apellidos`, `no_nie`, `f_nacimiento`, `edad`, `created_at`, `updated_at`) VALUES
  (1, 'Emely Valeria', 'Martinez', 1111111, '2002-02-15', NULL, '2018-12-30 06:25:11', '2018-12-30 06:25:11'),
  (2, 'Denis Alejandro', 'Martinez', 3333333, '2003-03-26', NULL, '2018-12-30 06:27:50', '2018-12-30 06:27:50'),
  (3, 'Alexander Bladimir', 'Sanchez', 2222666, '2003-12-18', NULL, '2018-12-30 07:35:21', '2018-12-30 07:35:21'),
  (4, 'Alexander Bladimir', 'Sosa', 3457678, '2004-01-22', NULL, '2019-01-02 10:22:18', '2019-01-02 10:22:18'),
  (5, 'Manuel Antonio', 'Rivas', 8908463, '2019-01-24', NULL, '2019-01-02 10:23:12', '2019-01-02 10:23:12'),
  (6, 'Milton Alexander', 'Sosa', 3437999, '2008-07-10', NULL, '2019-01-04 06:20:52', '2019-01-04 06:20:52'),
  (7, 'Marcela Beatriz', 'Leiva', 8878684, '2006-09-29', NULL, '2019-01-05 04:31:02', '2019-01-05 04:31:02'),
  (8, 'Magaly', 'Castillo', 5454345, '2007-10-25', NULL, '2019-01-05 06:34:02', '2019-01-05 06:34:02'),
  (9, 'Karla Maria', 'Alvarez', 6654654, '2015-12-19', NULL, '2019-01-05 06:38:29', '2019-01-05 06:38:29'),
  (10, 'Rosa Maria', 'Velazco', 8658858, '2014-07-16', NULL, '2019-01-05 06:39:09', '2019-01-05 06:39:09'),
  (11, 'Zulma Azucena', 'Aguilar', 5675899, '2009-08-20', NULL, '2019-01-05 07:28:08', '2019-01-05 07:28:08'),
  (12, 'Marina Alejandra', 'Sanchez', 5545455, '2003-05-16', NULL, '2019-01-06 05:50:00', '2019-01-06 05:50:00'),
  (13, 'Arnoldo Gausiano', 'Pérez', 6666666, '2012-12-12', NULL, '2019-01-06 08:22:32', '2019-01-06 21:54:43'),
  (14, 'Kathya Alejandra', 'Figueroa', 6665656, '2009-05-14', NULL, '2019-01-07 07:08:07', '2019-01-07 07:08:07'),
  (15, 'Julia Antonia', 'Corena', 4342526, '2008-04-25', NULL, '2019-01-08 22:29:50', '2019-01-08 22:29:50');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignaciones
CREATE TABLE IF NOT EXISTS `asignaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_grado` (`id_grado`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id`),
  CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignaciones: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` (`id`, `id_docente`, `id_grado`, `anio`, `created_at`, `updated_at`) VALUES
  (1, 1, 2, 2018, '2018-12-30 06:27:14', '2018-12-30 06:27:14'),
  (2, 2, 3, 2019, '2019-01-02 10:27:29', '2019-01-02 10:27:29'),
  (3, 1, 1, 2019, '2019-01-04 06:19:57', '2019-01-04 06:19:57'),
  (4, 3, 5, 2018, '2019-01-05 06:36:07', '2019-01-05 07:14:14'),
  (5, 4, 13, 2018, '2019-01-05 07:28:55', '2019-01-05 07:28:55'),
  (9, 4, 4, 2019, '2019-01-06 04:32:02', '2019-01-06 04:32:02'),
  (10, 5, 14, 2019, '2019-01-07 01:45:12', '2019-01-07 01:45:12'),
  (11, 1, 2, 2020, '2019-01-07 07:16:08', '2019-01-07 07:16:08'),
  (12, 6, 6, 2019, '2019-01-08 21:46:41', '2019-01-08 21:46:41');
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignacion_alumnos_notas
CREATE TABLE IF NOT EXISTS `asignacion_alumnos_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `estado_academico` char(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion` (`id_asignacion`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_1` FOREIGN KEY (`id_asignacion`) REFERENCES `asignaciones` (`id`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_alumnos_notas: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_alumnos_notas` DISABLE KEYS */;
INSERT INTO `asignacion_alumnos_notas` (`id`, `id_asignacion`, `id_alumno`, `anio`, `estado_academico`, `created_at`, `updated_at`) VALUES
  (1, 1, 1, 2018, 'Aprobado', '2018-12-30 06:28:03', '2018-12-30 06:28:03'),
  (2, 1, 2, 2018, 'Reprobado', '2018-12-30 06:28:13', '2018-12-30 06:28:13'),
  (3, 1, 3, 2018, 'Aprobado', '2018-12-30 07:35:38', '2018-12-30 07:35:38'),
  (4, 2, 5, 2019, 'En curso', '2019-01-02 10:28:17', '2019-01-02 10:28:17'),
  (5, 2, 4, 2019, 'En curso', '2019-01-02 10:28:25', '2019-01-02 10:28:25'),
  (6, 3, 6, 2019, 'En curso', '2019-01-04 07:10:55', '2019-01-04 07:10:55'),
  (7, 3, 7, 2019, 'En curso', '2019-01-05 04:31:59', '2019-01-05 04:31:59'),
  (8, 4, 9, 2018, 'Aprobado', '2019-01-05 06:39:45', '2019-01-05 06:39:45'),
  (9, 4, 10, 2018, 'Reprobado', '2019-01-05 06:39:55', '2019-01-05 06:39:55'),
  (10, 5, 11, 2018, 'Aprobado', '2019-01-05 07:33:03', '2019-01-05 07:33:03'),
  (14, 3, 8, 2019, 'En curso', '2019-01-06 08:41:08', '2019-01-06 08:41:08'),
  (15, 3, 14, 2019, 'En curso', '2019-01-07 07:09:49', '2019-01-07 07:11:34'),
  (16, 3, 12, 2019, 'En curso', '2019-01-07 07:23:34', '2019-01-07 07:23:34'),
  (19, 3, 9, 2019, NULL, '2019-01-12 07:20:53', '2019-01-12 07:20:53');
/*!40000 ALTER TABLE `asignacion_alumnos_notas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignacion_conductas
CREATE TABLE IF NOT EXISTS `asignacion_conductas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_alumno` int(11) DEFAULT NULL,
  `id_trimestre` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_alumno` (`id_asignacion_alumno`),
  KEY `id_trimestre` (`id_trimestre`),
  CONSTRAINT `asignacion_conductas_ibfk_1` FOREIGN KEY (`id_asignacion_alumno`) REFERENCES `asignacion_alumnos_notas` (`id`),
  CONSTRAINT `asignacion_conductas_ibfk_2` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_conductas: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_conductas` DISABLE KEYS */;
INSERT INTO `asignacion_conductas` (`id`, `id_asignacion_alumno`, `id_trimestre`, `created_at`, `updated_at`) VALUES
  (8, 1, 2, '2019-01-02 03:37:22', '2019-01-02 03:37:22'),
  (9, 2, 2, '2019-01-02 03:37:22', '2019-01-02 03:37:22'),
  (10, 3, 2, '2019-01-02 03:37:22', '2019-01-02 03:37:22'),
  (11, 1, 1, '2019-01-02 03:38:14', '2019-01-02 03:38:14'),
  (12, 2, 1, '2019-01-02 03:38:14', '2019-01-02 03:38:14'),
  (13, 3, 1, '2019-01-02 03:38:14', '2019-01-02 03:38:14'),
  (14, 6, 1, '2019-01-08 04:32:59', '2019-01-08 04:32:59'),
  (15, 7, 1, '2019-01-08 04:32:59', '2019-01-08 04:32:59'),
  (16, 14, 1, '2019-01-08 04:33:00', '2019-01-08 04:33:00'),
  (17, 15, 1, '2019-01-08 04:33:00', '2019-01-08 04:33:00'),
  (18, 16, 1, '2019-01-08 04:33:00', '2019-01-08 04:33:00');
/*!40000 ALTER TABLE `asignacion_conductas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignacion_docentes_materias
CREATE TABLE IF NOT EXISTS `asignacion_docentes_materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materia` (`id_materia`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asignacion_docentes_materias_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`),
  CONSTRAINT `asignacion_docentes_materias_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_docentes_materias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_docentes_materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion_docentes_materias` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignacion_notas
CREATE TABLE IF NOT EXISTS `asignacion_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materia` int(11) DEFAULT NULL,
  `id_asignacion_alumno` int(11) DEFAULT NULL,
  `id_trimestre` int(11) DEFAULT NULL,
  `nota_trimestral` float DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_alumno` (`id_asignacion_alumno`),
  KEY `id_materia` (`id_materia`),
  KEY `id_trimestre` (`id_trimestre`),
  CONSTRAINT `asignacion_notas_ibfk_1` FOREIGN KEY (`id_asignacion_alumno`) REFERENCES `asignacion_alumnos_notas` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_3` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_notas: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_notas` DISABLE KEYS */;
INSERT INTO `asignacion_notas` (`id`, `id_materia`, `id_asignacion_alumno`, `id_trimestre`, `nota_trimestral`, `trimestre`, `created_at`, `updated_at`) VALUES
  (1, 1, 1, 1, 0.18, NULL, '2018-12-30 06:29:48', '2019-01-02 07:30:06'),
  (2, 1, 2, 1, 0.35, NULL, '2018-12-30 06:29:48', '2018-12-30 06:29:48'),
  (3, 1, 1, 2, 0.7, NULL, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (4, 1, 2, 2, 0.7, NULL, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (5, 1, 1, 3, 1.05, NULL, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (6, 1, 2, 3, 1.05, NULL, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (7, 2, 1, 1, 2.97, NULL, '2019-01-02 01:01:55', '2019-01-02 01:01:55'),
  (8, 2, 2, 1, 3.38, NULL, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (9, 2, 3, 1, 0, NULL, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (10, 1, 3, 1, 0, NULL, '2019-01-02 07:30:06', '2019-01-02 07:30:06'),
  (11, 1, 6, 1, 8.95, NULL, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (12, 1, 7, 1, 8.05, NULL, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (13, 1, 14, 1, 8.35, NULL, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (14, 1, 15, 1, 8, NULL, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (15, 1, 16, 1, 8.25, NULL, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (16, 1, 6, 2, 7.73, NULL, '2019-01-10 20:11:59', '2019-01-10 20:11:59'),
  (17, 1, 7, 2, 7.73, NULL, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (18, 1, 14, 2, 7.73, NULL, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (19, 1, 15, 2, 7.73, NULL, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (20, 1, 16, 2, 5.85, NULL, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (21, 2, 6, 1, 8, NULL, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (22, 2, 7, 1, 8, NULL, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (23, 2, 14, 1, 8, NULL, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (24, 2, 15, 1, 8, NULL, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (25, 2, 16, 1, 8, NULL, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (26, 3, 6, 1, 7, NULL, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (27, 3, 7, 1, 7, NULL, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (28, 3, 14, 1, 7, NULL, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (29, 3, 15, 1, 7, NULL, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (30, 3, 16, 1, 7, NULL, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (31, 4, 6, 1, 7.68, NULL, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (32, 4, 7, 1, 7.33, NULL, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (33, 4, 14, 1, 7.68, NULL, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (34, 4, 15, 1, 7.33, NULL, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (35, 4, 16, 1, 7.53, NULL, '2019-01-11 18:24:00', '2019-01-11 18:24:00');
/*!40000 ALTER TABLE `asignacion_notas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.conductas
CREATE TABLE IF NOT EXISTS `conductas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_conductas` int(11) DEFAULT NULL,
  `moral_civica` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nota_conducta` int(11) DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_conductas` (`id_asignacion_conductas`),
  CONSTRAINT `conductas_ibfk_1` FOREIGN KEY (`id_asignacion_conductas`) REFERENCES `asignacion_conductas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.conductas: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `conductas` DISABLE KEYS */;
INSERT INTO `conductas` (`id`, `id_asignacion_conductas`, `moral_civica`, `nota_conducta`, `observaciones`, `created_at`, `updated_at`) VALUES
  (1, 8, 'Muy bueno', 2, 'Segunda observación del trimestre, para Prueba de inserción de datos.', '2019-01-02 03:37:22', '2019-01-02 09:57:22'),
  (2, 9, 'Muy bueno', 2, NULL, '2019-01-02 03:37:22', '2019-01-02 09:16:50'),
  (3, 10, 'Muy bueno', 2, NULL, '2019-01-02 03:37:22', '2019-01-02 09:16:50'),
  (4, 11, 'Regular', 10, 'Primera observación del trimestre, para Prueba de inserción de datos.', '2019-01-02 03:38:14', '2019-01-02 20:43:06'),
  (5, 12, 'Regular', 10, NULL, '2019-01-02 03:38:14', '2019-01-02 20:43:06'),
  (6, 13, 'Regular', 10, NULL, '2019-01-02 03:38:14', '2019-01-02 20:43:06'),
  (7, 14, 'Excelente', 10, 'Observación 1', '2019-01-08 04:32:59', '2019-01-08 04:32:59'),
  (8, 15, 'Excelente', 9, 'Observación 2', '2019-01-08 04:32:59', '2019-01-08 04:32:59'),
  (9, 16, 'Excelente', 8, NULL, '2019-01-08 04:33:00', '2019-01-08 04:33:00'),
  (10, 17, 'Excelente', 7, NULL, '2019-01-08 04:33:00', '2019-01-08 04:33:00'),
  (11, 18, 'Excelente', 6, NULL, '2019-01-08 04:33:00', '2019-01-08 04:33:00');
/*!40000 ALTER TABLE `conductas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.docentes
CREATE TABLE IF NOT EXISTS `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `no_escalafon` decimal(10,0) NOT NULL,
  `no_dui` char(10) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.docentes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` (`id`, `id_usuario`, `no_escalafon`, `no_dui`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
  (1, 1, 1458799, '1234565498', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2018-12-30 06:24:44', '2018-12-30 06:24:44'),
  (2, 2, 7567567, '2342222222', '73666455', 'San Salvador 8 calle poniente.', '2019-01-02 10:21:43', '2019-01-02 10:21:43'),
  (3, 3, 1458791, '4564566666', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2019-01-05 06:35:51', '2019-01-05 06:35:51'),
  (4, 4, 98, '4564788845', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2019-01-05 07:27:31', '2019-01-05 07:27:31'),
  (5, 5, 2222222, '1111111111', '78787878', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2019-01-07 01:44:04', '2019-01-07 01:44:04'),
  (6, 6, 4446464, '5556565656', '78799559', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2019-01-08 20:29:42', '2019-01-08 20:29:42');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.grados
CREATE TABLE IF NOT EXISTS `grados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `seccion` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.grados: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` (`id`, `nombre`, `seccion`, `capacidad`, `created_at`, `updated_at`) VALUES
  (1, 'Primero', 'A', 30, '2018-12-30 06:25:28', '2018-12-30 06:25:28'),
  (2, 'Noveno', 'A', 30, '2018-12-30 06:25:49', '2018-12-30 06:25:49'),
  (3, 'Noveno', 'B', 30, '2019-01-02 10:27:10', '2019-01-02 10:27:10'),
  (4, 'Kinder', 'A', 30, '2019-01-05 04:51:04', '2019-01-05 04:51:04'),
  (5, 'Preparatoria', 'A', 30, '2019-01-05 04:51:14', '2019-01-05 04:51:14'),
  (6, 'Segundo', 'A', 30, '2019-01-05 04:51:32', '2019-01-05 04:51:32'),
  (7, 'Tercero', 'A', 30, '2019-01-05 04:51:44', '2019-01-05 04:51:44'),
  (8, 'Cuarto', 'A', 30, '2019-01-05 04:52:18', '2019-01-05 04:52:18'),
  (9, 'Quinto', 'A', 30, '2019-01-05 04:52:30', '2019-01-05 04:52:30'),
  (10, 'Sexto', 'A', 30, '2019-01-05 04:52:39', '2019-01-05 04:52:39'),
  (11, 'Séptimo', 'A', 30, '2019-01-05 04:52:49', '2019-01-05 04:52:49'),
  (12, 'Octavo', 'A', 30, '2019-01-05 04:53:05', '2019-01-05 04:53:05'),
  (13, 'Preparatoria', 'B', 30, '2019-01-05 07:28:23', '2019-01-05 07:28:23'),
  (14, 'Primero', 'B', 30, '2019-01-07 01:44:27', '2019-01-07 01:44:27');
/*!40000 ALTER TABLE `grados` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.materias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
  (1, 'Matemática', '2018-12-30 06:26:07', '2018-12-30 06:26:07'),
  (2, 'Ciencias Naturales', '2018-12-30 06:26:12', '2018-12-30 06:26:12'),
  (3, 'Lenguaje', '2018-12-30 06:26:21', '2018-12-30 06:26:21'),
  (4, 'Ciencias Sociales', '2018-12-30 06:26:34', '2018-12-30 06:26:34');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.permisos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.permiso_rol
CREATE TABLE IF NOT EXISTS `permiso_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permisos` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permisos` (`id_permisos`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `permiso_rol_ibfk_1` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id`),
  CONSTRAINT `permiso_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.permiso_rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso_rol` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.pruebas
CREATE TABLE IF NOT EXISTS `pruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  `laboratorio` float DEFAULT NULL,
  `examen` float DEFAULT NULL,
  `promedio_p` float DEFAULT NULL,
  `prom_p_porcent` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_notas` (`id_asignacion_notas`),
  CONSTRAINT `pruebas_ibfk_1` FOREIGN KEY (`id_asignacion_notas`) REFERENCES `asignacion_notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.pruebas: ~35 rows (aproximadamente)
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` (`id`, `id_asignacion_notas`, `laboratorio`, `examen`, `promedio_p`, `prom_p_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 0, 0, 0, 0, '2018-12-30 06:29:48', '2018-12-30 06:29:48'),
  (2, 2, 0, 0, 0, 0, '2018-12-30 06:29:49', '2018-12-30 06:29:49'),
  (3, 3, 0, 0, 0, 0, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (4, 4, 0, 0, 0, 0, '2018-12-30 06:30:09', '2018-12-30 06:30:09'),
  (5, 5, 0, 0, 0, 0, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (6, 6, 0, 0, 0, 0, '2018-12-30 06:30:44', '2018-12-30 06:30:44'),
  (7, 7, 0, 0, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (8, 8, 0, 5, 2.5, 0.75, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (9, 9, 0, 0, 0, 0, '2019-01-02 01:01:56', '2019-01-02 01:01:56'),
  (10, 10, 0, 0, 0, 0, '2019-01-02 07:30:06', '2019-01-02 07:30:06'),
  (11, 11, 7, 6, 6.5, 1.95, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (12, 12, 7, 7, 7, 2.1, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (13, 13, 8, 8, 8, 2.4, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (14, 14, 8, 8, 8, 2.4, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (15, 15, 10, 10, 10, 3, '2019-01-07 21:54:03', '2019-01-10 19:41:32'),
  (16, 16, 6, 7, 6.5, 1.95, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (17, 17, 6, 7, 6.5, 1.95, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (18, 18, 6, 7, 6.5, 1.95, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (19, 19, 6, 7, 6.5, 1.95, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (20, 20, 2, 9, 5.5, 1.65, '2019-01-10 20:12:00', '2019-01-10 20:12:00'),
  (21, 21, 8, 8, 8, 2.4, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (22, 22, 8, 8, 8, 2.4, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (23, 23, 8, 8, 8, 2.4, '2019-01-11 18:21:43', '2019-01-11 18:21:43'),
  (24, 24, 8, 8, 8, 2.4, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (25, 25, 8, 8, 8, 2.4, '2019-01-11 18:21:44', '2019-01-11 18:21:44'),
  (26, 26, 7, 7, 7, 2.1, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (27, 27, 7, 7, 7, 2.1, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (28, 28, 7, 7, 7, 2.1, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (29, 29, 7, 7, 7, 2.1, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (30, 30, 7, 7, 7, 2.1, '2019-01-11 18:22:52', '2019-01-11 18:22:52'),
  (31, 31, 7, 8, 7.5, 2.25, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (32, 32, 8, 7, 7.5, 2.25, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (33, 33, 7, 8, 7.5, 2.25, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (34, 34, 8, 7, 7.5, 2.25, '2019-01-11 18:24:00', '2019-01-11 18:24:00'),
  (35, 35, 7, 7, 7, 2.1, '2019-01-11 18:24:00', '2019-01-11 18:24:00');
/*!40000 ALTER TABLE `pruebas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.roles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.rol_usuario
CREATE TABLE IF NOT EXISTS `rol_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`),
  CONSTRAINT `rol_usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.rol_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.trimestres
CREATE TABLE IF NOT EXISTS `trimestres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.trimestres: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `trimestres` DISABLE KEYS */;
INSERT INTO `trimestres` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
  (1, 'Primer', '2018-12-11 01:53:59', '2018-12-11 01:53:59'),
  (2, 'Segundo', '2018-12-11 01:54:05', '2018-12-11 01:54:05'),
  (3, 'Tercer', '2018-12-11 01:54:15', '2018-12-11 01:54:15');
/*!40000 ALTER TABLE `trimestres` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` char(255) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `usuario`, `name`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
  (1, 'LeoSerpas', 'Leonardo Serpas', '$2y$10$jSBFR7EyhToLmz3OlLZnrOZXN34ZdOZzgLBAwNFAQZahqOAcehcU.', 'leon_s054@hotmail.com', '68VLpHeVtJDx9mX1d7mQZOXiUniCciSHjJYqL07IisVcCAsntxYihNdhZoix', '2018-12-30 06:23:36', '2018-12-30 06:23:36'),
  (2, 'Karen Elvira Peñate', 'Karen Elvira Peñate Aviles', '$2y$10$ASHxsXpE8/rG.6C3zQYdrepzpw7KyTp37Om0p0XI/4dfTA3jdl0CW', 'karen.penate@ues.edu.sv', 'Kc4Atzo0izRA2PeopI0zsNuByQxpaTpQ2HHm38dyVzLFIjlYirTkYksBY0np', '2019-01-02 10:20:56', '2019-01-02 10:20:56'),
  (3, 'MarthaCorena', 'Martha Julia Corena', '$2y$10$tsFyg3bksGo0.DtyDh6E.uELBPQPYTEiXMdzbR.Stkv46ThLREwe2', 'martha123@hotmail.com', 'Dy0xyBvdCaf1kNUocLmLdDkkxFXfZt3qYBSE0ZRTFGOF4q2Zpit14wWjy9YX', '2019-01-05 06:33:27', '2019-01-05 06:33:27'),
  (4, 'CVeronica', 'Claudia Veronica Campos', '$2y$10$nuEJyB4NK0B79ejHCWjsTe0Vre0Ii7Ryk0rr1CoOwzxA2GRfOMd8.', 'veronica123@hotmail.com', 'KHJ1BokO0lbW3hE4V0Lim0LL8Qsnvqt3KHqXVv1LSB92ToKDghU1vSwsBdf6', '2019-01-05 07:26:57', '2019-01-05 07:26:57'),
  (5, 'Hernandez', 'Karla Maria', '$2y$10$b.0MV5C.R6wNAwAUjzMO9Orjsy3g.rHKe8yTTMV1xu1ev0O4k5IX.', 'karla123@hotmail.com', 'D2YG0KdQyN29ACkbtqMrHfGgrdpI3yi1GoU4pGGlm6pdCGfoNVCBen2QYW38', '2019-01-07 01:43:36', '2019-01-07 01:43:36'),
  (6, 'Mejía Hernandez', 'Christopher Alexander', '$2y$10$6J..wSjEqrfe.sqUvDNsFeCqvOKRZFFVjKrynFS.beNTSkhMp9.uG', 'alexander123@hotmail.com', 'NLvpn79WrY5MpUZ2KajbtMRwxwezCbIsgzNz1uBHzAk17BTssZDVl1uYMGNS', '2019-01-08 20:06:48', '2019-01-08 20:06:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

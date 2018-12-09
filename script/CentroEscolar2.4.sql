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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_cotidianas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `act_cotidianas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_integradoras: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `act_integradoras` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_nie` (`no_nie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.alumnos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombres`, `apellidos`, `no_nie`, `f_nacimiento`, `edad`, `created_at`, `updated_at`) VALUES
  (1, 'Emely Valeria', 'Serpas', 1111111, '1999-07-22', NULL, '2018-12-09 00:51:20', '2018-12-09 00:51:20'),
  (2, 'Denis Alejandro', 'Martinez', 3453445, '2001-05-15', NULL, '2018-12-09 00:51:44', '2018-12-09 00:51:44'),
  (3, 'Christopher Alexander', 'Sanchez', 1231231, '2007-02-03', NULL, '2018-12-09 00:55:55', '2018-12-09 00:55:55'),
  (4, 'Alexander Bladimir', 'Sanchez', 7676777, '2005-03-17', NULL, '2018-12-09 02:29:48', '2018-12-09 02:29:48');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignaciones
CREATE TABLE IF NOT EXISTS `asignaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `anio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GRADO_UNICO` (`id_grado`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id`),
  CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignaciones: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` (`id`, `id_docente`, `id_grado`, `anio`, `created_at`, `updated_at`) VALUES
  (2, 1, 4, 2018, '2018-12-09 00:59:27', '2018-12-09 00:59:27'),
  (3, 2, 3, 2018, '2018-12-09 01:48:36', '2018-12-09 01:48:36');
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.asignacion_alumnos_notas
CREATE TABLE IF NOT EXISTS `asignacion_alumnos_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALUMNO_GRADO_UNICO` (`id_asignacion`,`id_alumno`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_1` FOREIGN KEY (`id_asignacion`) REFERENCES `asignaciones` (`id`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_alumnos_notas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_alumnos_notas` DISABLE KEYS */;
INSERT INTO `asignacion_alumnos_notas` (`id`, `id_asignacion`, `id_alumno`, `anio`, `created_at`, `updated_at`) VALUES
  (3, 2, 1, 2018, '2018-12-09 01:45:07', '2018-12-09 05:32:45'),
  (4, 3, 2, 2018, '2018-12-09 01:45:13', '2018-12-09 06:21:14'),
  (5, 3, 3, 2019, '2018-12-09 01:49:05', '2018-12-09 05:22:36'),
  (6, 3, 1, 2018, '2018-12-09 01:49:12', '2018-12-09 04:40:47'),
  (8, 3, 4, 2018, '2018-12-09 02:36:02', '2018-12-09 02:36:02');
/*!40000 ALTER TABLE `asignacion_alumnos_notas` ENABLE KEYS */;

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
  `nota_trimestral` float DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_alumno` (`id_asignacion_alumno`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `asignacion_notas_ibfk_1` FOREIGN KEY (`id_asignacion_alumno`) REFERENCES `asignacion_alumnos_notas` (`id`),
  CONSTRAINT `asignacion_notas_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_notas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion_notas` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.conductas
CREATE TABLE IF NOT EXISTS `conductas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  `moral_civica` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nota_conducta` int(11) DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_notas` (`id_asignacion_notas`),
  CONSTRAINT `conductas_ibfk_1` FOREIGN KEY (`id_asignacion_notas`) REFERENCES `asignacion_notas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.conductas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `conductas` DISABLE KEYS */;
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
  UNIQUE KEY `no_escalafon` (`no_escalafon`),
  UNIQUE KEY `no_dui` (`no_dui`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.docentes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` (`id`, `id_usuario`, `no_escalafon`, `no_dui`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
  (1, 1, 1458799, '1234565498', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2018-12-09 00:50:55', '2018-12-09 00:50:55'),
  (2, 2, 7567567, '1665499877', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2018-12-09 01:47:29', '2018-12-09 01:47:29');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.grados
CREATE TABLE IF NOT EXISTS `grados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `seccion` char(8) COLLATE utf8_spanish2_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GRADO_UNICO` (`nombre`,`seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.grados: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` (`id`, `nombre`, `seccion`, `capacidad`, `created_at`, `updated_at`) VALUES
  (1, 'Kinder', 'A', 30, '2018-12-09 00:56:20', '2018-12-09 00:56:20'),
  (2, 'Kinder', 'B', 40, '2018-12-09 00:56:33', '2018-12-09 00:56:33'),
  (3, 'Octavo', 'A', 40, '2018-12-09 00:56:54', '2018-12-09 00:56:54'),
  (4, 'Noveno', 'A', 60, '2018-12-09 00:57:07', '2018-12-09 00:57:07');
/*!40000 ALTER TABLE `grados` ENABLE KEYS */;

-- Volcando estructura para tabla centroescolar.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.materias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
  (1, 'Ciencias Naturales', '2018-12-09 00:57:27', '2018-12-09 00:57:27'),
  (2, 'Matematica', '2018-12-09 00:57:33', '2018-12-09 00:57:33'),
  (3, 'Lenguaje', '2018-12-09 00:57:39', '2018-12-09 00:57:39'),
  (4, 'Ciencias Sociales', '2018-12-09 00:57:44', '2018-12-09 00:57:44');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.pruebas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
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

-- Volcando estructura para tabla centroescolar.trimestre
CREATE TABLE IF NOT EXISTS `trimestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_notas` int(11) DEFAULT NULL,
  `no_trimestre` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_asignacion_notas` (`id_asignacion_notas`),
  CONSTRAINT `trimestre_ibfk_1` FOREIGN KEY (`id_asignacion_notas`) REFERENCES `asignacion_notas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.trimestre: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `trimestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `trimestre` ENABLE KEYS */;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `usuario`, `name`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
  (1, 'LeoSerpas', 'Leonardo Serpas', '$2y$10$f5oGFnIl5sGKx5m02gpS1OCvfvpBL8xQDzFTil725e0E/tSnPpwrS', 'leon_s054@hotmail.com', 'QAe7zRLI67c6p8sHKF5wRpYPjKZgecQR3yqPo97wtmY3m51eeyIpsBuwibTR', '2018-12-09 00:50:39', '2018-12-09 00:50:39'),
  (2, 'Corena', 'Martha Julia Corena', '$2y$10$wsQlEJOkjrWFdlzDeKZkU.bnxolF/037S/VBeyzGdUf3Mdezocfjy', 'corena123@hotmail.com', NULL, '2018-12-09 01:47:11', '2018-12-09 01:47:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

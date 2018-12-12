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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_cotidianas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `act_cotidianas` DISABLE KEYS */;
INSERT INTO `act_cotidianas` (`id`, `id_asignacion_notas`, `nota_cotidiana`, `nota_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 10, 3.5, '2018-12-11 22:29:32', '2018-12-11 22:29:32'),
  (2, 2, 0, 0, '2018-12-11 22:29:33', '2018-12-11 22:29:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.act_integradoras: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `act_integradoras` DISABLE KEYS */;
INSERT INTO `act_integradoras` (`id`, `id_asignacion_notas`, `activi_1`, `activi_2`, `promedio_i`, `prom_i_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 10, 10, 10, 3.5, '2018-12-11 22:29:32', '2018-12-11 22:29:32'),
  (2, 2, 0, 0, 0, 0, '2018-12-11 22:29:33', '2018-12-11 22:29:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.alumnos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` (`id`, `nombres`, `apellidos`, `no_nie`, `f_nacimiento`, `edad`, `created_at`, `updated_at`) VALUES
  (1, 'Emely Valeria', 'Martinez', 1231412, '1999-05-20', NULL, '2018-12-11 01:49:33', '2018-12-11 01:49:33'),
  (2, 'Denis Alejandro', 'Serpas', 4564547, '2001-05-16', NULL, '2018-12-11 01:49:55', '2018-12-11 01:49:55'),
  (3, 'Christopher Alexander', 'Sanchez', 9789795, '2002-02-03', NULL, '2018-12-11 01:50:52', '2018-12-11 01:50:52'),
  (4, 'Katerine Maria', 'Figueroa', 7676567, '2005-04-19', NULL, '2018-12-11 01:51:25', '2018-12-11 01:51:25'),
  (5, 'Manuel Antonio', 'Sanchez', 4545345, '2008-04-10', NULL, '2018-12-11 08:26:28', '2018-12-11 08:26:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignaciones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` (`id`, `id_docente`, `id_grado`, `anio`, `created_at`, `updated_at`) VALUES
  (18, 1, 1, 2018, '2018-12-11 06:42:59', '2018-12-12 00:38:19'),
  (19, 6, 4, 2018, '2018-12-11 06:43:35', '2018-12-11 06:43:35'),
  (20, 7, 7, 2018, '2018-12-11 23:59:50', '2018-12-11 23:59:50');
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
  KEY `id_asignacion` (`id_asignacion`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_1` FOREIGN KEY (`id_asignacion`) REFERENCES `asignaciones` (`id`),
  CONSTRAINT `asignacion_alumnos_notas_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_alumnos_notas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_alumnos_notas` DISABLE KEYS */;
INSERT INTO `asignacion_alumnos_notas` (`id`, `id_asignacion`, `id_alumno`, `anio`, `created_at`, `updated_at`) VALUES
  (13, 19, 1, 2018, '2018-12-11 07:46:50', '2018-12-11 07:46:50'),
  (14, 19, 3, 2018, '2018-12-11 08:16:11', '2018-12-11 08:16:11'),
  (15, 19, 5, 2018, '2018-12-11 08:24:23', '2018-12-12 01:30:52'),
  (16, 18, 5, 2018, '2018-12-11 08:26:41', '2018-12-12 02:16:14'),
  (18, 18, 2, 2018, '2018-12-12 01:59:46', '2018-12-12 02:26:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.asignacion_notas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `asignacion_notas` DISABLE KEYS */;
INSERT INTO `asignacion_notas` (`id`, `id_materia`, `id_asignacion_alumno`, `nota_trimestral`, `trimestre`, `created_at`, `updated_at`) VALUES
  (1, 1, 15, 10, 1, '2018-12-11 22:29:32', '2018-12-11 22:29:32'),
  (2, 1, 16, 0, 1, '2018-12-11 22:29:33', '2018-12-11 22:29:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.docentes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` (`id`, `id_usuario`, `no_escalafon`, `no_dui`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
  (1, 1, 1458799, '1234565498', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2018-12-11 01:44:56', '2018-12-11 01:44:56'),
  (6, 2, 7533333, '2342222222', '72781466', 'Km. 11.5, casa  4,  El Porvenir, Caserío Cuesta de la Cruz.', '2018-12-11 04:34:40', '2018-12-11 04:34:40'),
  (7, 4, 6666666, '4564566666', '77777777', 'San Salvador 8 calle poniente.', '2018-12-11 23:57:27', '2018-12-11 23:57:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.grados: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` (`id`, `nombre`, `seccion`, `capacidad`, `created_at`, `updated_at`) VALUES
  (1, 'Noveno', 'A', 30, '2018-12-11 01:52:37', '2018-12-11 01:52:37'),
  (3, 'Noveno', 'B', 30, '2018-12-11 01:53:24', '2018-12-11 01:53:24'),
  (4, 'Octavo', 'A', 40, '2018-12-11 01:53:41', '2018-12-11 01:53:41'),
  (5, 'Octavo', 'B', 40, '2018-12-11 01:53:50', '2018-12-11 01:53:50'),
  (6, 'Kinder', 'A', 40, '2018-12-11 08:23:25', '2018-12-11 08:23:25'),
  (7, 'Séptimo', 'A', 30, '2018-12-11 23:51:27', '2018-12-11 23:51:27');
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
  (1, 'Ciencias Naturales', '2018-12-11 01:53:59', '2018-12-11 01:53:59'),
  (2, 'Matematica', '2018-12-11 01:54:05', '2018-12-11 01:54:05'),
  (3, 'Lenguaje', '2018-12-11 01:54:10', '2018-12-11 01:54:10'),
  (4, 'Ciencias Sociales', '2018-12-11 01:54:15', '2018-12-11 01:54:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.pruebas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` (`id`, `id_asignacion_notas`, `laboratorio`, `examen`, `promedio_p`, `prom_p_porcent`, `created_at`, `updated_at`) VALUES
  (1, 1, 10, 10, 10, 3, '2018-12-11 22:29:33', '2018-12-11 22:29:33'),
  (2, 2, 0, 0, 0, 0, '2018-12-11 22:29:33', '2018-12-11 22:29:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla centroescolar.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `usuario`, `name`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
  (1, 'LeoSerpas', 'Leonardo Serpas', '$2y$10$/IdNnIiCTTJ.77iMitR3eO1vPil.UaNQqcOJaCm2J0IsuY9yE/Z..', 'leon_s054@hotmail.com', 'NM7nizBEQwm6kpmgx3Vd4FoZbvE0MZdgjy7NojrmFbYkUC5QDoCkv0KcpM4E', '2018-12-11 01:41:50', '2018-12-11 01:41:50'),
  (2, 'MarthaCorena', 'Martha Julia Corena', '$2y$10$sZ.GQA122Aw8ddLjvHv1zucKvxdd/xIRWf6zcwqQd.V7xu.vkcvje', 'martha123@hotmail.com', 'c0IotMa5QNpq96dUYh7R5MUeDERtUmrFxzzHffzbc1cqtDZEb44zQb6Zx8a9', '2018-12-11 04:34:01', '2018-12-11 04:34:01'),
  (3, 'LeonSerpas', 'Leonardo Serpas', '$2y$10$Icr61jnDjNH039I3QIMsh.IMiuMiyR2xHPIrMkgLtPL1ASslm7xUC', 'leon_s050@hotmail.com', 'NmRczcQL4BmwE6KDzP8uAhDJI39chdRE03etMBNkg8FgYVprSJAZSdtVDmuO', '2018-12-11 23:51:07', '2018-12-11 23:51:07'),
  (4, 'Leonardo', 'Leonardo Serpas Martinez', '$2y$10$KR2qGv5Ds3b7MPLhaQEZI.krf3MPpvu1AGmQgZnMf5i2WRuC6IPlm', 'leon_s056@hotmail.com', '3xo6uBpfuss4MqpHWCfhPI9rbTyHEuUsbMiew9Qd73VuZ0SbTYUGqhM4NoQe', '2018-12-11 23:53:16', '2018-12-11 23:53:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

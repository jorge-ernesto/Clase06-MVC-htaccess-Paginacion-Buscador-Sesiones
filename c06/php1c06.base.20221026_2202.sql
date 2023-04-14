-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.8-MariaDB-log - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para php1g10
CREATE DATABASE IF NOT EXISTS `php1g10` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `php1g10`;

-- Volcando estructura para tabla php1g10.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.agenda: ~10 rows (aproximadamente)
INSERT INTO `agenda` (`id`, `paterno`, `materno`, `nombre`, `fnacimiento`, `activo`) VALUES
	(7, 'hurtado', 'perez', 'VANESSA', '2003-07-10', 1),
	(8, 'Rueda', 'Lope', 'Jorge', '2001-06-11', 1),
	(9, 'diaz', 'ortega', 'elsa', '2003-07-07', 0),
	(10, 'salas', 'campos', 'maria', '2003-07-06', 0),
	(11, 'urbina', 'gareca', 'hugo', '2003-07-12', 0),
	(12, 'torres', 'lopez', 'gianella', '2003-07-06', 0),
	(13, 'levano', 'flores', 'martin', '2003-07-03', 0),
	(14, 'hurtado', 'perez', 'VANESSA', '2003-07-09', 0),
	(15, 'hurtado', 'perez', 'VANESSA', '2003-07-14', 0),
	(16, 'hurtado', 'perez', 'VANESSA', '2003-06-30', 0);

-- Volcando estructura para tabla php1g10.agenda_log
CREATE TABLE IF NOT EXISTS `agenda_log` (
  `idlog` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fnacimiento` date DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `accion` varchar(20) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.agenda_log: ~8 rows (aproximadamente)
INSERT INTO `agenda_log` (`idlog`, `id`, `paterno`, `materno`, `nombre`, `fnacimiento`, `activo`, `accion`, `fecha`) VALUES
	(1, 6, 'torres', 'flores', 'humberto', '2022-01-25', 1, 'BORRAR', '2022-10-27 00:28:36'),
	(2, 7, 'hurtado', 'perez', 'margarita', '2003-07-10', 1, 'ACTUALIZAR', '2022-10-27 00:32:06'),
	(3, 14, 'torres', 'gareca', 'VANESSA', '2003-07-09', 0, 'ACTUALIZAR', '2022-10-27 02:21:16'),
	(4, 15, 'urbina', 'lopez', 'VANESSA', '2003-07-14', 0, 'ACTUALIZAR', '2022-10-27 02:21:19'),
	(5, 16, 'torres', 'bbb', 'VANESSA', '2003-06-30', 0, 'ACTUALIZAR', '2022-10-27 02:21:21'),
	(6, 14, 'hurtado', 'gareca', 'VANESSA', '2003-07-09', 0, 'ACTUALIZAR', '2022-10-27 02:21:25'),
	(7, 15, 'hurtado', 'lopez', 'VANESSA', '2003-07-14', 0, 'ACTUALIZAR', '2022-10-27 02:21:26'),
	(8, 16, 'hurtado', 'bbb', 'VANESSA', '2003-06-30', 0, 'ACTUALIZAR', '2022-10-27 02:21:27');

-- Volcando estructura para vista php1g10.vagenda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vagenda` (
	`id` INT(11) NOT NULL,
	`persona` VARCHAR(152) NOT NULL COLLATE 'latin1_swedish_ci',
	`fnacimiento` DATE NULL,
	`anios` INT(10) NULL
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento php1g10.sp_persona
DELIMITER //
CREATE PROCEDURE `sp_persona`(
	IN `idpersona` INT
)
BEGIN
SELECT id, upper(CONCAT_WS(' ',paterno,materno,nombre)) persona,fnacimiento ,
FLOOR((DATEDIFF(CURRENT_TIMESTAMP(),fnacimiento)/365.25)) anios
FROM agenda WHERE id=idpersona;
END//
DELIMITER ;

-- Volcando estructura para disparador php1g10.agenda_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `agenda_before_delete` BEFORE DELETE ON `agenda` FOR EACH ROW BEGIN
insert into agenda_log(id,paterno,materno,nombre,fnacimiento,activo,accion,fecha) 
values(OLD.id,OLD.paterno,OLD.materno,OLD.nombre,OLD.fnacimiento,OLD.activo,'BORRAR',CURRENT_TIMESTAMP());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador php1g10.agenda_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `agenda_before_update` BEFORE UPDATE ON `agenda` FOR EACH ROW BEGIN
insert into agenda_log(id,paterno,materno,nombre,fnacimiento,activo,accion,fecha) 
values(OLD.id,OLD.paterno,OLD.materno,OLD.nombre,OLD.fnacimiento,OLD.activo,'ACTUALIZAR',CURRENT_TIMESTAMP());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista php1g10.vagenda
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vagenda`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vagenda` AS SELECT id, upper(CONCAT_WS(' ',paterno,materno,nombre)) persona,fnacimiento ,
FLOOR((DATEDIFF(CURRENT_TIMESTAMP(),fnacimiento)/365.25)) anios
FROM agenda ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

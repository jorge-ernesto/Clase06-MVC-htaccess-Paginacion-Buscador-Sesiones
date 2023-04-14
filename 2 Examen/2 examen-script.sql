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

-- Volcando datos para la tabla php1g10.agenda: ~8 rows (aproximadamente)
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

-- Volcando estructura para tabla php1g10.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.cursos: ~1 rows (aproximadamente)
INSERT INTO `cursos` (`id`, `nombre`, `codigo`, `estado`) VALUES
	(1, 'JAVACRIPT 1', 'JS01', 1),
	(2, 'PHP Nivel 1', 'PHP1', 1);

-- Volcando estructura para tabla php1g10.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.documentos: ~1 rows (aproximadamente)
INSERT INTO `documentos` (`id`, `nombre`, `codigo`, `estado`) VALUES
	(1, 'Documento Nacional de identidad', 'DNI', '1'),
	(2, 'Pasaporte', 'PAS', '1');

-- Volcando estructura para tabla php1g10.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idalumno` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `n1` int(11) DEFAULT 0,
  `n2` int(11) DEFAULT 0,
  `n3` int(11) DEFAULT 0,
  `n4` int(11) DEFAULT 0,
  `prom` decimal(20,2) DEFAULT 0.00,
  `notificado` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_matricula_personas` (`idalumno`),
  KEY `FK_matricula_cursos` (`idcurso`),
  CONSTRAINT `FK_matricula_cursos` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_matricula_personas` FOREIGN KEY (`idalumno`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.matricula: ~1 rows (aproximadamente)
INSERT INTO `matricula` (`id`, `idalumno`, `idcurso`, `n1`, `n2`, `n3`, `n4`, `prom`, `notificado`) VALUES
	(4, 1, 1, 9, 12, 0, 0, 5.25, 0);

-- Volcando estructura para tabla php1g10.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `docu_tip` int(11) DEFAULT NULL,
  `docu_num` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docu_tip_docu_num` (`docu_tip`,`docu_num`),
  CONSTRAINT `FK_personas_documentos` FOREIGN KEY (`docu_tip`) REFERENCES `documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.personas: ~1 rows (aproximadamente)
INSERT INTO `personas` (`id`, `paterno`, `materno`, `nombre`, `genero`, `docu_tip`, `docu_num`, `correo`) VALUES
	(1, 'Rojas', 'Campos', 'Ericka', 'F', 1, '12345678', 'prueba@gmail.com');

-- Volcando estructura para tabla php1g10.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla php1g10.usuarios: ~0 rows (aproximadamente)

-- Volcando estructura para vista php1g10.vagenda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vagenda` (
	`id` INT(11) NOT NULL,
	`persona` VARCHAR(152) NOT NULL COLLATE 'latin1_swedish_ci',
	`fnacimiento` DATE NULL,
	`anios` INT(10) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista php1g10.valumnos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `valumnos` (
	`id` INT(11) NOT NULL,
	`paterno` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`materno` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nombre` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`genero` ENUM('M','F') NULL COLLATE 'latin1_swedish_ci',
	`docu_tip` INT(11) NULL,
	`docu_num` VARCHAR(10) NULL COLLATE 'latin1_swedish_ci',
	`correo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idcurso` INT(11) NOT NULL,
	`curso` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`codigo` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`estado` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista php1g10.vmatricula
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vmatricula` (
	`id` INT(11) NOT NULL,
	`idalumno` INT(11) NOT NULL,
	`idcurso` INT(11) NOT NULL,
	`n1` INT(11) NULL,
	`n2` INT(11) NULL,
	`n3` INT(11) NULL,
	`n4` INT(11) NULL,
	`prom` DECIMAL(20,2) NULL,
	`notificado` TINYINT(4) NOT NULL,
	`alumno` VARCHAR(152) NULL COLLATE 'latin1_swedish_ci',
	`correo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`codigo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nombre` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento php1g10.promedios_calcular
DELIMITER //
CREATE PROCEDURE `promedios_calcular`()
BEGIN
UPDATE matricula SET prom=(n1+n2+n3+n4)/4;
END//
DELIMITER ;

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

-- Volcando estructura para vista php1g10.valumnos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `valumnos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `valumnos` AS SELECT p.*,
d.id idcurso,d.nombre curso,d.codigo,d.estado 
from personas p 
INNER JOIN documentos d ON p.docu_tip=d.id ;

-- Volcando estructura para vista php1g10.vmatricula
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vmatricula`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vmatricula` AS SELECT m.*,
upper(CONCAT_WS(' ',p.paterno, p.materno,p.nombre)) alumno,
p.correo,
c.codigo, c.nombre
from matricula m 
INNER JOIN personas p ON m.idalumno=p.id
INNER JOIN cursos c ON m.idcurso=c.id ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

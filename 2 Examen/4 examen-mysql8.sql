-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
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
CREATE DATABASE IF NOT EXISTS `php1g10` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `php1g10`;

-- Volcando estructura para tabla php1g10.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `materno` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.agenda: ~0 rows (aproximadamente)

-- Volcando estructura para tabla php1g10.agenda_log
CREATE TABLE IF NOT EXISTS `agenda_log` (
  `idlog` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `paterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `materno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fnacimiento` date DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  `accion` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.agenda_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla php1g10.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.cursos: ~2 rows (aproximadamente)
INSERT INTO `cursos` (`id`, `nombre`, `codigo`, `estado`) VALUES
	(1, 'PHP Basico', 'PHP1', 1),
	(2, 'PHP Intermedio', 'PHP2', 1);

-- Volcando estructura para tabla php1g10.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.documentos: ~2 rows (aproximadamente)
INSERT INTO `documentos` (`id`, `nombre`, `codigo`, `estado`) VALUES
	(1, 'DOCUMENTO NACIONAL DE IDENTIDAD', 'DNI', '1'),
	(2, 'CARNE DE EXTRANJERIA', 'CE', '1');

-- Volcando estructura para tabla php1g10.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idalumno` int NOT NULL,
  `idcurso` int NOT NULL,
  `n1` int DEFAULT '0',
  `n2` int DEFAULT '0',
  `n3` int DEFAULT '0',
  `n4` int DEFAULT '0',
  `prom` decimal(20,2) DEFAULT '0.00',
  `notificado` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_matricula_personas` (`idalumno`),
  KEY `FK_matricula_cursos` (`idcurso`),
  CONSTRAINT `FK_matricula_cursos` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`id`),
  CONSTRAINT `FK_matricula_personas` FOREIGN KEY (`idalumno`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.matricula: ~1 rows (aproximadamente)
INSERT INTO `matricula` (`id`, `idalumno`, `idcurso`, `n1`, `n2`, `n3`, `n4`, `prom`, `notificado`) VALUES
	(1, 1, 1, 12, 13, 16, 17, 14.50, 0);

-- Volcando estructura para tabla php1g10.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `materno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `genero` enum('M','F') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `docu_tip` int DEFAULT NULL,
  `docu_num` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docu_tip_docu_num` (`docu_tip`,`docu_num`),
  CONSTRAINT `FK_personas_documentos` FOREIGN KEY (`docu_tip`) REFERENCES `documentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.personas: ~1 rows (aproximadamente)
INSERT INTO `personas` (`id`, `paterno`, `materno`, `nombre`, `genero`, `docu_tip`, `docu_num`, `correo`) VALUES
	(1, 'CAMPOS', 'FLORES', 'ANA', 'F', 1, '11223344', 'ANA@PERU.COM');

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

-- Volcando estructura para tabla php1g10.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clave` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla php1g10.usuarios: ~2 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `estado`) VALUES
	(1, 'admin', '123456', 1),
	(2, 'user', 'abc123', 0);

-- Volcando estructura para vista php1g10.vagenda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vagenda` (
	`id` INT(10) NOT NULL,
	`persona` VARCHAR(152) NULL COLLATE 'utf8mb4_general_ci',
	`fnacimiento` DATE NULL,
	`anios` BIGINT(19) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista php1g10.valumnos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `valumnos` (
	`id` INT(10) NOT NULL,
	`paterno` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`materno` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`genero` ENUM('M','F') NULL COLLATE 'utf8mb4_general_ci',
	`docu_tip` INT(10) NULL,
	`docu_num` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`correo` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`idcurso` INT(10) NOT NULL,
	`curso` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`codigo` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`estado` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista php1g10.vmatricula
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vmatricula` (
	`id` INT(10) NOT NULL,
	`idalumno` INT(10) NOT NULL,
	`idcurso` INT(10) NOT NULL,
	`n1` INT(10) NULL,
	`n2` INT(10) NULL,
	`n3` INT(10) NULL,
	`n4` INT(10) NULL,
	`prom` DECIMAL(20,2) NULL,
	`notificado` TINYINT(3) NOT NULL,
	`alumno` VARCHAR(152) NULL COLLATE 'utf8mb4_general_ci',
	`correo` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`codigo` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para disparador php1g10.agenda_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `agenda_before_delete` BEFORE DELETE ON `agenda` FOR EACH ROW BEGIN
insert into agenda_log(id,paterno,materno,nombre,fnacimiento,activo,accion,fecha) 
values(OLD.id,OLD.paterno,OLD.materno,OLD.nombre,OLD.fnacimiento,OLD.activo,'BORRAR',CURRENT_TIMESTAMP());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador php1g10.agenda_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
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
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vagenda` AS select `agenda`.`id` AS `id`,upper(concat_ws(' ',`agenda`.`paterno`,`agenda`.`materno`,`agenda`.`nombre`)) AS `persona`,`agenda`.`fnacimiento` AS `fnacimiento`,floor(((to_days(now()) - to_days(`agenda`.`fnacimiento`)) / 365.25)) AS `anios` from `agenda`;

-- Volcando estructura para vista php1g10.valumnos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `valumnos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `valumnos` AS select `p`.`id` AS `id`,`p`.`paterno` AS `paterno`,`p`.`materno` AS `materno`,`p`.`nombre` AS `nombre`,`p`.`genero` AS `genero`,`p`.`docu_tip` AS `docu_tip`,`p`.`docu_num` AS `docu_num`,`p`.`correo` AS `correo`,`d`.`id` AS `idcurso`,`d`.`nombre` AS `curso`,`d`.`codigo` AS `codigo`,`d`.`estado` AS `estado` from (`personas` `p` join `documentos` `d` on((`p`.`docu_tip` = `d`.`id`)));

-- Volcando estructura para vista php1g10.vmatricula
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vmatricula`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vmatricula` AS select `m`.`id` AS `id`,`m`.`idalumno` AS `idalumno`,`m`.`idcurso` AS `idcurso`,`m`.`n1` AS `n1`,`m`.`n2` AS `n2`,`m`.`n3` AS `n3`,`m`.`n4` AS `n4`,`m`.`prom` AS `prom`,`m`.`notificado` AS `notificado`,upper(concat_ws(' ',`p`.`paterno`,`p`.`materno`,`p`.`nombre`)) AS `alumno`,`p`.`correo` AS `correo`,`c`.`codigo` AS `codigo`,`c`.`nombre` AS `nombre` from ((`matricula` `m` join `personas` `p` on((`m`.`idalumno` = `p`.`id`))) join `cursos` `c` on((`m`.`idcurso` = `c`.`id`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

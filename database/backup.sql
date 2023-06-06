/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - almacen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`almacen` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `almacen`;

/*Table structure for table `movimientos` */

DROP TABLE IF EXISTS `movimientos`;

CREATE TABLE `movimientos` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `idtipoprenda` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idprenda` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idmovimiento`),
  KEY `fk_idprenda` (`idprenda`),
  KEY `fk_idtipoprenda_MOV` (`idtipoprenda`),
  KEY `fk_idusu` (`idusuario`),
  CONSTRAINT `fk_idprenda` FOREIGN KEY (`idprenda`) REFERENCES `prendas` (`idprenda`),
  CONSTRAINT `fk_idtipoprenda_MOV` FOREIGN KEY (`idtipoprenda`) REFERENCES `tipoprenda` (`idtipoprenda`),
  CONSTRAINT `fk_idusu` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

/*Data for the table `movimientos` */

insert  into `movimientos`(`idmovimiento`,`idtipoprenda`,`idusuario`,`idprenda`,`tipo`,`cantidad`,`fecha`,`observaciones`) values 
(1,1,1,1,'Entrada',100,'2023-05-20',''),
(2,1,1,2,'Entrada',90,'2023-05-21',''),
(3,1,1,3,'Entrada',120,'2023-05-20',''),
(4,1,1,4,'Entrada',150,'2023-05-20',''),
(5,2,1,5,'Entrada',80,'2023-05-21',''),
(6,2,1,6,'Entrada',90,'2023-05-20',''),
(7,2,1,7,'Entrada',100,'2023-05-21',''),
(8,2,1,8,'Entrada',115,'2023-05-20',''),
(9,3,1,9,'Entrada',70,'2023-05-21',''),
(10,3,1,10,'Entrada',110,'2023-05-20',''),
(11,3,2,11,'Entrada',90,'2023-05-22',''),
(12,3,1,12,'Entrada',60,'2023-05-21',''),
(13,4,1,13,'Entrada',180,'2023-05-20',''),
(14,4,1,14,'Entrada',120,'2023-05-21',''),
(15,4,2,15,'Entrada',130,'2023-05-22',''),
(16,4,1,16,'Entrada',140,'2023-05-20',''),
(17,5,1,17,'Entrada',100,'2023-05-21',''),
(18,5,1,18,'Entrada',80,'2023-05-20',''),
(19,5,2,19,'Entrada',120,'2023-05-22',''),
(20,5,1,20,'Entrada',90,'2023-05-21',''),
(21,1,2,1,'Salida',5,'2023-05-22','Se encuentran mal cocidos'),
(22,1,2,2,'Salida',50,'2023-05-23','Para ventas'),
(23,2,2,7,'Salida',90,'2023-05-23','Para ventas'),
(24,2,3,8,'Salida',10,'2023-05-24','Prendas con fallos'),
(25,3,2,11,'Salida',80,'2023-05-22','Para ventas'),
(26,3,2,12,'Salida',2,'2023-05-22','Las camisas estan manchadas'),
(27,4,2,13,'Salida',100,'2023-05-22','Para ventas'),
(28,4,3,14,'Salida',100,'2023-05-24','Para ventas'),
(29,5,3,19,'Salida',60,'2023-05-24','Para ventas'),
(30,5,2,20,'Salida',1,'2023-05-23','Cierre mal colocado'),
(31,4,1,15,'Salida',50,'2023-06-04','Para ventas'),
(32,2,3,7,'Entrada',30,'2023-06-04',NULL),
(33,5,3,19,'Salida',30,'2023-06-04',''),
(34,5,1,17,'Entrada',95,'2023-06-06','Nuevos modelos en casacas');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`nombres`,`apellidos`,`dni`,`telefono`,`direccion`,`email`) values 
(1,'Keylee','Saravia Tipian','65524578','963258741','Av.Asuncion','k.saravia10@gmail.com'),
(2,'Joseph','Avalos Mora','54783210','985674123','Psj.Claveles',''),
(3,'Henry','Tapia Guzman','32695814','912563047','','henry.guz43@hotmail.com'),
(4,'Tamara','Rosales Diaz','74302057','','Av.gamarra','tammy11@gmail.com'),
(5,'Juliana','Sanchez Hernandez','44120366','','',''),
(6,'Anny','Cabrera Napa','71788436','965380175','Av.Buenos aires','anny16072003@gmail.com');

/*Table structure for table `prendas` */

DROP TABLE IF EXISTS `prendas`;

CREATE TABLE `prendas` (
  `idprenda` int(11) NOT NULL AUTO_INCREMENT,
  `idtipoprenda` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idprenda`),
  KEY `fk_idtipoprenda` (`idtipoprenda`),
  CONSTRAINT `fk_idtipoprenda` FOREIGN KEY (`idtipoprenda`) REFERENCES `tipoprenda` (`idtipoprenda`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `prendas` */

insert  into `prendas`(`idprenda`,`idtipoprenda`,`descripcion`) values 
(1,1,'Cuello redondo'),
(2,1,'Cuello V'),
(3,1,'Camisero'),
(4,1,'Oversize'),
(5,2,'Vestir'),
(6,2,'Jeans'),
(7,2,'Drill'),
(8,2,'Urbanos'),
(9,3,'Vestir'),
(10,3,'Jean'),
(11,3,'Alicradas'),
(12,3,'Drill'),
(13,4,'Playeros'),
(14,4,'Jeans'),
(15,4,'Strech'),
(16,4,'Drill'),
(17,5,'Cuero'),
(18,5,'Con cierre'),
(19,5,'Con capuchas'),
(20,5,'Basicas');

/*Table structure for table `tipoprenda` */

DROP TABLE IF EXISTS `tipoprenda`;

CREATE TABLE `tipoprenda` (
  `idtipoprenda` int(11) NOT NULL AUTO_INCREMENT,
  `tipoprenda` varchar(30) NOT NULL,
  PRIMARY KEY (`idtipoprenda`),
  UNIQUE KEY `uk_tipoprenda` (`tipoprenda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipoprenda` */

insert  into `tipoprenda`(`idtipoprenda`,`tipoprenda`) values 
(3,'Camisas'),
(5,'Casacas'),
(2,'Pantalones'),
(1,'Polo'),
(4,'Shorts');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clave` varchar(150) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `ck_idpersona` (`idpersona`),
  CONSTRAINT `ck_idpersona` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`email`,`clave`) values 
(1,5,'jul.san@gmail.com','$2y$10$gs11Pb.i/P4s0PYUD7MNAuBsJiYUlJsiIYXsZb7ITCdslub8S9y66'),
(2,3,'h.tapia@gmail.com','$2y$10$gs11Pb.i/P4s0PYUD7MNAuBsJiYUlJsiIYXsZb7ITCdslub8S9y66'),
(3,1,'keylee01@gmail.com','$2y$10$gs11Pb.i/P4s0PYUD7MNAuBsJiYUlJsiIYXsZb7ITCdslub8S9y66');

/* Procedure structure for procedure `spu_filtro_cate` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_cate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_cate`(
	IN _idtipoprenda INT
)
BEGIN
   SELECT
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`,
	personas.`nombres` 
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	INNER JOIN usuarios ON usuarios.`idusuario` = movimientos.`idusuario`
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE movimientos.`idtipoprenda` = _idtipoprenda
	ORDER BY movimientos.`idmovimiento`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtro_descrip` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_descrip` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_descrip`(
	IN _idtipoprenda INT,
	in _idprenda int
)
BEGIN
   SELECT
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`,
	personas.`nombres` 
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	INNER JOIN usuarios ON usuarios.`idusuario` = movimientos.`idusuario`
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE movimientos.`idtipoprenda` = _idtipoprenda and movimientos.`idprenda` = _idprenda
	ORDER BY movimientos.`idmovimiento`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico1` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico1`()
BEGIN
	SELECT movimientos.`tipo`, movimientos.`cantidad`, movimientos.`fecha`, tipoprenda.`tipoprenda`,
	prendas.`descripcion`
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	WHERE movimientos.`tipo` = 'Entrada'
	ORDER BY movimientos.`fecha`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_grafico2` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_grafico2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_grafico2`()
BEGIN
	SELECT movimientos.`tipo`, movimientos.`cantidad`, movimientos.`fecha`, tipoprenda.`tipoprenda`,
	prendas.`descripcion`
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	WHERE movimientos.`tipo` = 'Salida'
	ORDER BY movimientos.`fecha`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_movimientos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_movimientos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_movimientos`()
BEGIN
	SELECT  
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`, personas.`nombres`
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	INNER JOIN usuarios ON usuarios.`idusuario` = movimientos.`idusuario`
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	ORDER BY movimientos.`idmovimiento`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_movimientos_editar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_movimientos_editar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_movimientos_editar`(
	in _idmovimiento 	int,
	IN _idtipoprenda	INT,
	IN _idprenda		INT,
	IN _tipo		VARCHAR(15),
	IN _cantidad		INT,
	IN _observaciones	VARCHAR(200)
)
BEGIN
	update movimientos set
	 idtipoprenda = _idtipoprenda,
	 idprenda = _idprenda,
	 tipo = _tipo,
	 cantidad = _cantidad,
	 observaciones = _observaciones
	 where idmovimiento = _idmovimiento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_movimientos_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_movimientos_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_movimientos_registrar`(
	IN _idtipoprenda	INT,
	IN _idusuario		INT,
	IN _idprenda		INT,
	IN _tipo		VARCHAR(15),
	IN _cantidad		INT,
	IN _observaciones	VARCHAR(200)
)
BEGIN
	INSERT INTO movimientos(idtipoprenda, idusuario,idprenda, tipo, cantidad, observaciones) VALUES
	(_idtipoprenda, _idusuario, _idprenda, _tipo, _cantidad, _observaciones);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_movimiento_fecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_movimiento_fecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_movimiento_fecha`(
	IN _fecha DATE
)
BEGIN
SELECT  
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`,
	personas.`nombres` 
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	INNER JOIN usuarios ON usuarios.`idusuario` = movimientos.`idusuario`
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE movimientos.`fecha` = _fecha
	ORDER BY movimientos.`idmovimiento`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_prendas_filtrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_prendas_filtrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_prendas_filtrar`(
	IN _idtipoprenda INT
)
BEGIN
	SELECT prendas.`idprenda`, prendas.`descripcion` FROM prendas
	INNER JOIN tipoPrenda ON tipoPrenda.`idtipoprenda` = prendas.`idtipoprenda`
	WHERE prendas.`idtipoprenda` = _idtipoprenda
	ORDER BY prendas.`idprenda`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_tipoprenda_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_tipoprenda_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_tipoprenda_listar`()
BEGIN
	SELECT idtipoprenda, tipoprenda FROM tipoPrenda ORDER BY idtipoprenda;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(
	IN _email	VARCHAR(100)
)
BEGIN 
	SELECT usuarios.`idusuario`, personas.`nombres`, personas.`apellidos`,
			usuarios.`email`, usuarios.`clave`
	FROM usuarios
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE usuarios.`email` =_email;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE DATABASE almacen
USE almacen

CREATE TABLE personas
(
	idpersona	INT AUTO_INCREMENT PRIMARY KEY,
	nombres		VARCHAR(50) 	NOT NULL,
	apellidos	VARCHAR(50) 	NOT NULL,
	dni 			CHAR(8)			NOT NULL,
	telefono		CHAR(9)			NULL,
	direccion	VARCHAR(100) 	NULL,
	email			VARCHAR(100)   NULL,
	CONSTRAINT uk_dni UNIQUE(dni)
)
ENGINE = INNODB

-- Insertar datos:
INSERT INTO personas(nombres, apellidos, dni, telefono, direccion, email) VALUES
	('Keylee','Saravia Tipian','65524578','963258741','Av.Asuncion','k.saravia10@gmail.com'),
	('Joseph','Avalos Mora','54783210','985674123','Psj.Claveles',''),
	('Henry','Tapia Guzman','32695814','912563047','','henry.guz43@hotmail.com'),
	('Tamara','Rosales Diaz','74302057','','Av.gamarra','tammy11@gmail.com'),
	('Juliana','Sanchez Hernandez','44120366','','',''),
	('Anny','Cabrera Napa','71788436','965380175','Av.Buenos aires','anny16072003@gmail.com')

SELECT * FROM personas
-- -------------------------------------------------------
CREATE TABLE usuarios
(
	idusuario	INT AUTO_INCREMENT PRIMARY KEY,
	idpersona	INT 				NOT NULL,
	email			VARCHAR(100)		NOT NULL,
	clave			VARCHAR(150)	NOT NULL,
	CONSTRAINT ck_idpersona FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT uk_email UNIQUE (email)
)
ENGINE = INNODB

INSERT INTO usuarios(idpersona, email, clave) VALUES
(5, 'jul.san@gmail.com', '1234')

SELECT * FROM usuarios
-- -------------------------------------------------------

CREATE TABLE tipoPrenda
(
	idtipoprenda	INT AUTO_INCREMENT PRIMARY KEY,
	tipoprenda		VARCHAR(30) NOT NULL,
	CONSTRAINT uk_tipoprenda UNIQUE (tipoprenda)
)
ENGINE = INNODB

INSERT INTO tipoPrenda(tipoprenda) VALUES
	('Polo'),
	('Jeans'),
	('Camisas'),
	('Shorts'),
	('Casacas')
	
CREATE TABLE prendas
(
	idprenda 		INT AUTO_INCREMENT PRIMARY KEY,
	idtipoprenda	INT 				NOT NULL,
	descripcion		VARCHAR(100)	NULL,
	CONSTRAINT fk_idtipoprenda FOREIGN KEY(idtipoprenda) REFERENCES tipoPrenda(idtipoprenda)
)
ENGINE = INNODB

INSERT INTO prendas(idtipoprenda, descripcion) VALUES
(1,'Cuello redondo'),
(1,'Cuello V'),
(1,'Camisero'),
(1,'Oversize'),
(2,'Clasicos'),
(2,'Rasgados'),
(2,'Strech'),
(2,'Urbanos'),
(3,'Vestir'),
(3,'Jean'),
(3,'Alicradas'),
(3,'Drill'),
(4,'Playeros'),
(4,'Jeans'),
(4,'Strech'),
(4,'Drill'),
(5,'Cuero'),
(5,'Con cierre'),
(5,'Con capuchas'),
(5,'Basicas')

SELECT * FROM prendas

CREATE TABLE movimientos
(
	idmovimiento	INT AUTO_INCREMENT PRIMARY KEY,
	idtipoprenda	INT 			NOT NULL,	
	idprenda 		INT 			NOT NULL,
	tipo 				VARCHAR(15)	NOT NULL,
	cantidad			INT 			NOT NULL,
	fecha				DATE 	NOT NULL DEFAULT NOW(),
	observaciones	VARCHAR(200)    NULL,
	CONSTRAINT fk_idprenda FOREIGN KEY (idprenda) REFERENCES prendas(idprenda),
	CONSTRAINT fk_idtipoprenda_MOV FOREIGN KEY(idtipoprenda) REFERENCES tipoPrenda(idtipoprenda)
)
ENGINE = INNODB

INSERT INTO movimientos(idtipoprenda,idprenda, tipo, cantidad, observaciones) VALUES
(1,2,'entrada', 115, 'Ingreso de polos en talla M-L')

CREATE TABLE almacen
(
	idalmacen		INT AUTO_INCREMENT PRIMARY KEY,
	idprenda			INT 			NOT NULL,
	numestante		INT 			NOT NULL,
	disponibilidad	CHAR(1)		NOT NULL DEFAULT 1,
	cantprendas		INT 			NOT NULL,
	CONSTRAINT fk_idprenda_alm FOREIGN KEY (idprenda) REFERENCES prendas(idprenda)
)
ENGINE = INNODB

-- Procedimientos almacenados
-- Login
DELIMITER $$
CREATE PROCEDURE spu_usuarios_login 
(
	IN _email	VARCHAR(100)
)
BEGIN 
	SELECT usuarios.`idusuario`, personas.`nombres`, personas.`apellidos`,
			usuarios.`email`, usuarios.`clave`
	FROM usuarios
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE usuarios.`email` =_email;
END $$

CALL spu_usuarios_login('jul.san@gmail.com')

-- Actualizar contraseña
UPDATE usuarios
	SET clave= '$2y$10$SCcG.69BYXhCtJLTIAv0guAFYQxTQMBeghuMAAsJgyvf.D0DHTy22'
	WHERE idusuario = 1;
	
-- Listar tipos
DELIMITER $$
CREATE PROCEDURE spu_tipoprenda_listar()
BEGIN
	SELECT idtipoprenda, tipoprenda FROM tipoPrenda ORDER BY idtipoprenda;
END$$

CALL spu_tipoprenda_listar()

-- Listar prendas

DELIMITER $$
CREATE PROCEDURE spu_prendas_filtrar
(
	IN _idtipoprenda INT
)
BEGIN
	SELECT prendas.`idprenda`, prendas.`descripcion` FROM prendas
	INNER JOIN tipoPrenda ON tipoPrenda.`idtipoprenda` = prendas.`idtipoprenda`
	WHERE prendas.`idtipoprenda` = _idtipoprenda
	ORDER BY prendas.`idprenda`;
END$$

CALL spu_prendas_filtrar(3)

-- Registrar entrada de prendas
DELIMITER $$
CREATE PROCEDURE spu_movimientos_registrar
(
	IN _idtipoprenda	INT,
	IN _idprenda		INT,
	IN _tipo				VARCHAR(15),
	IN _cantidad		INT,
	IN _observaciones	VARCHAR(200)
)
BEGIN
	IF _observaciones = '' THEN SET _observaciones = NULL;END IF;
	INSERT INTO movimientos(idtipoprenda,idprenda, tipo, cantidad, observaciones) VALUES
	(_idtipoprenda,_idprenda, _tipo, _cantidad, _observaciones);
END$$

CALL spu_movimientos_registrar(3,9,'entrada', 210, '');

-- Listar movimientos
DELIMITER $$
CREATE PROCEDURE spu_listar_movimientos()
BEGIN
	SELECT  
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`  
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`;
END $$

CALL spu_listar_movimientos()

DELIMITER $$
CREATE PROCEDURE spu_filtro_cate
(
	IN _idtipoprenda INT
)
BEGIN
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`  
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	WHERE movimientos.`idtipoprenda` = _idtipoprenda;
END $$

-- Reporte de dia
DELIMITER $$
CREATE PROCEDURE spu_movimiento_fecha
(
	IN _fecha DATE
)
BEGIN
SELECT  
	movimientos.`idmovimiento`,tipoprenda.`tipoprenda`, prendas.`descripcion`,
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`  
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	WHERE movimientos.`fecha` = _fecha;
END$$

CALL spu_movimiento_fecha('2023-05-29')
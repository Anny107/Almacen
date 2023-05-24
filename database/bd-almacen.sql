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
	('Anny','Cabrera Napa','71788436','965380175','Av.Buenos aires','anny16072003@gmail.com'),

SELECT * FROM personas
-- -------------------------------------------------------
CREATE TABLE usuarios
(
	idusuario	INT AUTO_INCREMENT PRIMARY KEY,
	idpersona	INT 				NOT NULL,
	usuario		VARCHAR(50)		NOT NULL,
	clave			VARCHAR(150)	NOT NULL,
	CONSTRAINT ck_idpersona FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)
ENGINE = INNODB

INSERT INTO usuarios(idpersona, usuario, clave) VALUES
(6, 'anny_fab', '1628')

SELECT * FROM usuarios
-- -------------------------------------------------------
CREATE TABLE prendas
(
	idprendas		INT AUTO_INCREMENT PRIMARY KEY,
	talla				CHAR(2)			NOT NULL,
	tipoprenda		VARCHAR(30)		NOT NULL,
	color				VARCHAR(30)		NOT NULL,
	descripcion		VARCHAR(100)	NULL
)
ENGINE = INNODB

CREATE TABLE proveedores
(
	idproveedor		INT AUTO_INCREMENT PRIMARY KEY,
	nombreCompañia	VARCHAR(100)	NOT NULL,
	nombreContacto	VARCHAR(50)		NOT NULL,
	direccion		VARCHAR(100)	NOT NULL,
	telefono			CHAR(9)			NULL	
)
ENGINE = INNODB

CREATE TABLE almacen
(
	idalmacen		INT AUTO_INCREMENT PRIMARY KEY,
	idprenda			INT 	NOT NULL,
	idproveedor		INT 	NOT NULL,
	direccion		VARCHAR(50) NOT NULL,
	cantprendas		INT 		NOT NULL,
	CONSTRAINT ck_idprenda	FOREIGN KEY (idprenda) REFERENCES prendas(idprendas),
	CONSTRAINT ck_idproveedor	FOREIGN KEY (idproveedor) REFERENCES proveedores(idproveedor)
)
ENGINE = INNODB

CREATE TABLE requerimientos
(
	idrequerimiento	INT AUTO_INCREMENT PRIMARY KEY,
	idprenda				INT 	NOT NULL,
	idusuario			INT 	NOT NULL,
	fechapedido			DATE  NOT NULL,
	cantrequerida		INT   NOT NULL,
	CONSTRAINT ck_usuario FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT ck_idprenda_re	FOREIGN KEY (idprenda) REFERENCES prendas(idprendas)               
)ENGINE = INNODB

-- Procedimientos almacenados
-- Login
DELIMITER $$
CREATE PROCEDURE spu_usuarios_login 
(
	IN _usuario		VARCHAR(50)
)
BEGIN 
	SELECT idusuario, usuario, clave
	FROM usuarios
	WHERE usuario =_usuario;
END $$

CALL spu_usuarios_login('anny_fab')

-- Actualizar contraseña
UPDATE usuarios
	SET clave= '$2y$10$jeI1KKVn6bfF926j0gZHreEyZbjosQzEnn2cH2J/73HnZ0Ex46oV2'
	WHERE idusuario = 1;
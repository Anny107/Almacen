DROP DATABASE almacen;
CREATE DATABASE almacen;
USE almacen;

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

-- -------------------------------------------------------

CREATE TABLE tipoPrenda
(
	idtipoprenda	INT AUTO_INCREMENT PRIMARY KEY,
	tipoprenda		VARCHAR(30) NOT NULL,
	CONSTRAINT uk_tipoprenda UNIQUE (tipoprenda)
)
ENGINE = INNODB

-- -------------------------------------------------------	
CREATE TABLE prendas
(
	idprenda 		INT AUTO_INCREMENT PRIMARY KEY,
	idtipoprenda	INT 				NOT NULL,
	descripcion		VARCHAR(100)	NULL,
	CONSTRAINT fk_idtipoprenda FOREIGN KEY(idtipoprenda) REFERENCES tipoPrenda(idtipoprenda)
)
ENGINE = INNODB

-- ---------------------------------------------------------
CREATE TABLE movimientos
(
	idmovimiento	INT AUTO_INCREMENT PRIMARY KEY,
	idtipoprenda	INT 		NOT NULL,
	idusuario 	INT 		NOT NULL,	
	idprenda 	INT 		NOT NULL,
	tipo 		VARCHAR(15)	NOT NULL, -- 1 = ENTRADA, 2 = SALIDA
	cantidad	INT 		NOT NULL,
	fecha		DATE 		NOT NULL DEFAULT NOW(),
	observaciones	VARCHAR(200)    NULL,
	CONSTRAINT fk_idprenda FOREIGN KEY (idprenda) REFERENCES prendas(idprenda),
	CONSTRAINT fk_idtipoprenda_MOV FOREIGN KEY(idtipoprenda) REFERENCES tipoPrenda(idtipoprenda),
	CONSTRAINT fk_idusu FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario)
)
ENGINE = INNODB

-- ----------------------------------------------------------------
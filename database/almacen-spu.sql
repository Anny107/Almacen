USE almacen;
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

-- Registrar movimientos (aun no esta ejecutado)
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
	movimientos.`tipo`, movimientos.`cantidad`, movimientos.`observaciones`, movimientos.`fecha`, personas.`nombres`
	FROM movimientos
	INNER JOIN prendas ON prendas.`idprenda` = movimientos.`idprenda`
	INNER JOIN tipoprenda ON tipoprenda.`idtipoprenda` = movimientos.`idtipoprenda`
	INNER JOIN usuarios ON usuarios.`idusuario` = movimientos.`idusuario`
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	ORDER BY movimientos.`idmovimiento`;
END $$

CALL spu_listar_movimientos()

DELIMITER $$
CREATE PROCEDURE spu_filtro_cate
(
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
	WHERE movimientos.`idtipoprenda` = _idtipoprenda;
END $$

CALL spu_filtro_cate(2)

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

CALL spu_movimiento_fecha('2023-05-20')
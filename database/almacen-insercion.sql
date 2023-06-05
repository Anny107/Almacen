USE almacen;
-- Insertar datos a las tablas
-- Personas:
INSERT INTO personas(nombres, apellidos, dni, telefono, direccion, email) VALUES
	('Keylee','Saravia Tipian','65524578','963258741','Av.Asuncion','k.saravia10@gmail.com'),
	('Joseph','Avalos Mora','54783210','985674123','Psj.Claveles',''),
	('Henry','Tapia Guzman','32695814','912563047','','henry.guz43@hotmail.com'),
	('Tamara','Rosales Diaz','74302057','','Av.gamarra','tammy11@gmail.com'),
	('Juliana','Sanchez Hernandez','44120366','','',''),
	('Anny','Cabrera Napa','71788436','965380175','Av.Buenos aires','anny16072003@gmail.com')
	
SELECT * FROM personas

-- Usuarios: 
INSERT INTO usuarios(idpersona, email, clave) VALUES
(5, 'jul.san@gmail.com', '12345'),
(3, 'h.tapia@gmail.com', '12345'),
(1, 'keylee01@gmail.com', '12345')

SELECT * FROM usuarios

-- Actualizar contraseña
UPDATE usuarios
	SET clave= '$2y$10$gs11Pb.i/P4s0PYUD7MNAuBsJiYUlJsiIYXsZb7ITCdslub8S9y66';

-- Tipo de prenda:
INSERT INTO tipoPrenda(tipoprenda) VALUES
	('Polo'),
	('Pantalones'),
	('Camisas'),
	('Shorts'),
	('Casacas')
	
SELECT * FROM tipoPrenda;

-- Prendas:
INSERT INTO prendas(idtipoprenda, descripcion) VALUES
(1,'Cuello redondo'),
(1,'Cuello V'),
(1,'Camisero'),
(1,'Oversize'),
(2,'Vestir'),
(2,'Jeans'),
(2,'Drill'),
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
-- Movimientos

INSERT INTO movimientos(idtipoprenda,idprenda, idusuario, tipo, cantidad, fecha, observaciones) VALUES
(1,1,1,'Entrada', 100, '2023/05/20', ''),
(1,2,1,'Entrada', 90, '2023/05/21', ''),
(1,3,1,'Entrada', 120, '2023/05/20', ''),
(1,4,1,'Entrada', 150, '2023/05/20', ''),
(2,5,1,'Entrada', 80, '2023/05/21', ''),
(2,6,1,'Entrada', 90, '2023/05/20', ''),
(2,7,1,'Entrada', 100, '2023/05/21', ''),
(2,8,1,'Entrada', 115, '2023/05/20', ''),
(3,9,1,'Entrada', 70, '2023/05/21', ''),
(3,10,1,'Entrada', 110, '2023/05/20', ''),
(3,11,2,'Entrada', 90, '2023/05/22', ''),
(3,12,1,'Entrada', 60, '2023/05/21', ''),
(4,13,1,'Entrada', 180, '2023/05/20', ''),
(4,14,1,'Entrada', 120, '2023/05/21', ''),
(4,15,2,'Entrada', 130, '2023/05/22', ''),
(4,16,1,'Entrada', 140, '2023/05/20', ''),
(5,17,1,'Entrada', 100, '2023/05/21', ''),
(5,18,1,'Entrada', 80, '2023/05/20', ''),
(5,19,2,'Entrada', 120, '2023/05/22', ''),
(5,20,1,'Entrada', 90, '2023/05/21', '')
SELECT * FROM movimientos

INSERT INTO movimientos(idtipoprenda,idprenda, idusuario, tipo, cantidad, fecha, observaciones) VALUES
(1,1,2,'Salida', 5, '2023/05/22', 'Se encuentran mal cocidos'),
(1,2,2,'Salida', 50, '2023/05/23', 'Para ventas'),
(2,7,2,'Salida', 90, '2023/05/23', 'Para ventas'),
(2,8,3,'Salida', 10, '2023/05/24', 'Prendas con fallos'),
(3,11,2,'Salida', 80, '2023/05/22', 'Para ventas'),
(3,12,2,'Salida', 2, '2023/05/22', 'Las camisas estan manchadas'),
(4,13,2,'Salida', 100, '2023/05/22', 'Para ventas'),
(4,14,3,'Salida', 100, '2023/05/24', 'Para ventas'),
(5,19,3,'Salida', 60, '2023/05/24', 'Para ventas'),
(5,20,2,'Salida', 1, '2023/05/23', 'Cierre mal colocado')
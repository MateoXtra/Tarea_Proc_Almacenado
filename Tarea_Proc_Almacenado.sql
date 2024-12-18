create database tareadb;
use tareadb;

-- Creacion tabla clientes
CREATE TABLE Cliente(
ClienteID int auto_increment primary key,
Nombre varchar(100),
Estatura decimal (5,2),
Edad int,
FechaNacimiento Date,
Sueldo decimal(10,2)
);

-- Creacion tabla ordenes
CREATE TABLE Ordenes(
OrdenID int auto_increment primary key,
FechaOrden Date,
TotalOrden decimal(10,2),
ClienteID int,
FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);



-- 1. Procedimiento de Inserción (INSERT)
DELIMITER $$
CREATE PROCEDURE InsertarCliente(
    IN p_Nombre VARCHAR(100),
    IN p_Estatura DECIMAL(5,2),
    IN p_FechaNacimiento DATE,
    IN p_Sueldo DECIMAL(10,2),
    IN p_Edad int
)
BEGIN
    INSERT INTO Cliente (Nombre, Estatura, FechaNacimiento, Sueldo, Edad)
    VALUES (p_Nombre, p_Estatura, p_FechaNacimiento, p_Sueldo, p_Edad);
END$$
DELIMITER ;	

CALL InsertarCliente('Camila Egas', 1.58, '2004-02-16', 5000.00,20);
CALL InsertarCliente('Mateo Moran', 1.65, '2004-02-20', 3000.00,20);

SELECT * FROM Cliente

-- 2. Procedimiento de Actualización (UPDATE)
DELIMITER $$
CREATE PROCEDURE ActualizarEdad(
    IN p_ClienteID INT,
    IN p_NuevaEdad INT
)
BEGIN
    UPDATE Cliente
    SET Edad = p_NuevaEdad
    WHERE ClienteID = p_ClienteID;
END$$
DELIMITER ;
CALL ActualizarEdad(1, 35);
SELECT * FROM Cliente

-- 3. Procedimiento de Eliminación (DELETE)
DELIMITER $$
CREATE PROCEDURE EliminarCliente(
    IN p_ClienteID INT
)
BEGIN
    DELETE FROM Cliente
    WHERE ClienteID = p_ClienteID;
END$$
DELIMITER ;
CALL EliminarCliente(1);
SELECT * FROM Cliente

-- 4. Procedimiento de verificar edad mayor o igual a 22
DELIMITER $$
CREATE PROCEDURE VerificarEdadCliente(
    IN p_ClienteID INT
)
BEGIN
    DECLARE p_Edad INT;
    SELECT Edad INTO p_Edad
    FROM Cliente
    WHERE ClienteID = p_ClienteID;
    IF p_Edad >= 22 THEN
        SELECT 'La edad del cliente es mayor o igual a 22 años' AS Resultado;
    ELSE
        SELECT 'La edad del cliente es menor a 22 años' AS Resultado;
    END IF;
END$$
DELIMITER ;
CALL VerificarEdadCliente(2);

-- 1. Procedimientos de Órdenes -Insertar Orden
DELIMITER $$
CREATE PROCEDURE InsertarOrden(
    IN p_FechaOrden DATE,
    IN p_TotalOrden DECIMAL(10,2),
    IN p_IdCliente int
)
BEGIN
    INSERT INTO Ordenes (FechaOrden, TotalOrden, ClienteID)
    VALUES (p_FechaOrden, p_TotalOrden, p_IdCliente);
END$$
DELIMITER ;

CALL InsertarOrden('2024-12-17', 150.00, 2);
SELECT * FROM ordenes


-- 2. Procedimientos  Actualizar Orden
DELIMITER $$
CREATE PROCEDURE ActualizarOrden(
    IN p_OrdenID INT,
    IN p_TotalOrden DECIMAL(10,2)
)
BEGIN
    UPDATE Ordenes
    SET TotalOrden = p_TotalOrden
    WHERE OrdenID = p_OrdenID;
END$$
DELIMITER ;
CALL ActualizarOrden(2, 200.00);
SELECT * FROM ordenes


-- 3. Procedimientos Eliminar Orden
DELIMITER $$
CREATE PROCEDURE EliminarOrden(
    IN p_OrdenID INT
)
BEGIN
    DELETE FROM Ordenes
    WHERE OrdenID = p_OrdenID;
END$$
DELIMITER ;
CALL EliminarOrden(2);
SELECT * FROM ordenes







	

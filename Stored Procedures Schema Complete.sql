-- Stored Procedures 1

delimiter $$
-- Este sp puede ordenar la columna que desees en ascendente o descendente de la tabla que elijas.
CREATE PROCEDURE OrdenarTurnos (
    IN Tabla VARCHAR(100),
    IN Columnas VARCHAR(100),
    IN TipoOrden VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', Tabla, ' order by ', Columnas, ' ', TipoOrden);
    PREPARE runsql FROM @query;
    EXECUTE runsql;
    DEALLOCATE PREPARE runsql;
END $$

delimiter ;

/*
1. Nombretabla: Seleccionar el nombre de tabla que se desea ordenar.
2. CampoOrden: El campo por el cual deseas ordernar la tabla.
3. OrdenTipo: El tipo de ordenamiento que queres, asc o desc
*/

-- Llamar SP
CALL OrdenarTurnos('Turnos', 'fecha', 'Desc'); -- Orden descendente



-- Stored Procedures 2
DELIMITER $$

-- Procedimiento almacenado para insertar registros en la tabla estetica.tabla_ejemplo
CREATE PROCEDURE InsertarCliente(
    IN e_id VARCHAR(20),
    IN e_nombre VARCHAR(50),
    IN e_apellido VARCHAR(50),
    IN e_telefono INT ,
    IN e_email VARCHAR(100),
    IN e_fecha_nacimiento DATE
)
BEGIN
    DECLARE mensaje VARCHAR(100);

    -- Intentar insertar un nuevo registro en la tabla
        INSERT INTO cliente (id_cliente, nombre, apellido, telefono, email, fecha_nacimiento)
        VALUES (e_id, e_nombre, e_apellido, e_telefono, e_email, e_fecha_nacimiento);

    -- Comprobar si ocurrió un error durante la inserción
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Registro insertado correctamente.';
    ELSE
        SET mensaje = 'No se pudo insertar el registro. Verifique los valores proporcionados.';
    END IF;

    -- Mostrar el mensaje
    SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

call InsertarCliente('C21234131', 'Carolina', 'Langoni', '11784373', 'clangoni@gmail.com', '1977-11-04');
-- Creacion y utilizacion del schema:

create schema estetica;
use estetica;

 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de las tablas y primary key en el esquema:

create table ubicacion_locales (
id_ubicacion VARCHAR(20),
locales VARCHAR(30),
primary key (id_ubicacion));

create table puestos (
id_puesto VARCHAR(20),
id_empleado int not null,
ubicacion_locales varchar(20),
puesto text(20),
descripcion_puesto varchar(40),
primary key (id_puesto));
	
create table empleados (
id_empleado int not null,
id_turnos int not null,
id_puesto varchar(20),
nombre text(30),
apellido text(30),
telefono int,
email varchar(50),
fecha_contratacion date,
primary key (id_empleado));	

create table turnos (
id_turnos int not null,
id_cliente varchar(20),
id_servicio int not null,
fecha date,
hora time,
comentarios varchar(40),
primary key (id_turnos));

create table servicio (
id_servicio int auto_increment not null,
nombre text(30),
descripcion varchar(50),
precio DECIMAL,
primary key (id_servicio));

create table cliente (
id_cliente varchar(20),
id_turnos int,
nombre text(30),
apellido text(30),
telefono int,
email varchar(50),
fecha_nacimiento date,
primary key (id_cliente));

 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
    
-- Creacion de las Foreign Key:

ALTER TABLE puestos
	ADD FOREIGN KEY (ubicacion_locales) references ubicacion_locales (id_ubicacion);
ALTER TABLE empleados
	ADD FOREIGN KEY (id_turnos) references turnos (id_turnos);
ALTER TABLE empleados
	ADD FOREIGN KEY (id_puesto) references puestos (id_puesto);
ALTER TABLE turnos
	ADD FOREIGN KEY (id_cliente) references cliente (id_cliente);
ALTER TABLE turnos
	ADD FOREIGN KEY (id_servicio) references servicio (id_servicio);
    
 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */    

-- Creacion de 2 Funciones:

delimiter $$
create function Funcion1(ServicioID text(30))
returns varchar(30)
reads sql data
begin
declare Resultado varchar(30);
select nombre
into Resultado
from servicio
where id_servicio = ServicioID;
Return Resultado;
end $$
delimiter ;
/* select Funcion1 (4) as Servicio; */

delimiter $$
create function Funcion2 (Empleado text(20))
returns text(20)
reads sql data
begin
declare Resultado text(20);
select nombre
into Resultado
from empleados
where id_empleado = Empleado;
Return Resultado;
end $$
delimiter ;
/* select Funcion2 (41234567) as nombre; */   

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de 5 vistas: 

/* Primer vista: A que puesto pertenecen los empleados */
create or replace view PrimerVista as select e.id_empleado, e.nombre, e.apellido, p.id_puesto, p.puesto from empleados e join puestos p on e.id_puesto = p.id_puesto;
select * from PrimerVista;

/* Segunda vista: Que clientes tomaron turnos */
create or replace view SegundaVista as select c.id_cliente, c.nombre, c.apellido, t.id_turnos, t.fecha, t.hora from cliente c join turnos t on c.id_cliente = t.id_cliente;
select * from SegundaVista;

/* Tercera vista: Que servicios tienen turnos */
create or replace view TercerVista as select s.id_servicio, s.nombre, t.id_turnos, t.fecha, t.hora from servicio s join turnos t on s.id_servicio = t.id_servicio;
select * from TercerVista;

/* Cuarta vista: Que servicio eligio cada cliente */
create or replace view CuartaVista as select c.id_cliente, c.nombre, c.apellido, t.id_turnos, t.fecha, t.hora, s.id_servicio, s.nombre as Servicio from cliente c join turnos t on c.id_cliente = t.id_cliente join servicio s on s.id_servicio = t.id_servicio;
select * from CuartaVista;

/* Quinta vista: Que empleados dieron turnos */
create or replace view QuintaVista as select e.id_empleado, e.nombre, e.apellido, t.id_turnos, t.fecha, t.hora from empleados e join turnos t on e.id_turnos = t.id_turnos;
select * from QuintaVista;

 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de Triggers:

/* Trigger 1 de tabla ubicacion_locales, se modifica la fecha, la hora y los comentarios quedando registro de quien lo hizo. Estas tablas son after. */

create table ubicacion_locales_log_i
(id_ubicacion varchar(20),
locales varchar(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `ubicacion_locales_AFTER_INSERT` AFTER INSERT ON `ubicacion_locales` FOR EACH ROW BEGIN
		insert into ubicacion_locales_log_i values (
		new.id_ubicacion, new.locales, curdate(), curtime(), user());
END
*/
/* insert into ubicacion_locales values ('COLEGIALES2', 'Alisados'); */
/* select * from ubicacion_locales_log_i */

create table ubicacion_locales_log_u
(id_ubicacion varchar(20),
locales varchar(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `ubicacion_locales_AFTER_UPDATE` AFTER UPDATE ON `ubicacion_locales` FOR EACH ROW BEGIN
	insert into ubicacion_locales_log_u 
    select new.id_ubicacion, new.locales, curdate(), curtime(), user()
    from ubicacion_locales;
END
*/
/* update ubicacion_locales set locales = 'Liposucciones' where id_ubicacion = 'COLEGIALES2'; */
/* select * from ubicacion_locales_log_u */

create table ubicacion_locales_log_d
(id_ubicacion varchar(20),
locales varchar(30),
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `ubicacion_locales_AFTER_DELETE` AFTER DELETE ON `ubicacion_locales` FOR EACH ROW BEGIN
	insert into ubicacion_locales_log_d 
    select old.id_ubicacion, old.locales, curdate(), curtime(), user()
    from ubicacion_locales;
END
*/
/* delete from ubicacion_locales where id_ubicacion = 'COLEGIALES2'; */
/* select * from ubicacion_locales; */

/* Trigger 2 de tabla servicio, se actualiza el servicio con toda la informacion nueva. Estas tablas son before. */

create table servicio_log_i
(id_servicio int,
nombre text(30),
descripcion varchar(50),
precio decimal,
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER = CURRENT_USER TRIGGER `estetica`.`servicio_BEFORE_INSERT` BEFORE INSERT ON `servicio` FOR EACH ROW
BEGIN
		insert into servicio_log_i values (
		new.id_servicio, new.nombre, new.descripcion, new.precio, curdate(), curtime(), user());
END
*/
/* insert into servicio values (14, 'Pedicuria', 'Pedicura', 8000); */
/* select * from servicio_log_i */

create table servicio_log_u
(id_servicio int,
nombre text(30),
descripcion varchar(50),
precio decimal,
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `servicio_BEFORE_UPDATE` BEFORE UPDATE ON `servicio` FOR EACH ROW BEGIN
	insert into servicio_log_u 
    select new.id_servicio, new.nombre, new.descripcion, new.precio, curdate(), curtime(), user()
    from servicio;
END
*/
/* update servicio set nombre = 'Unias', descripcion = 'Esmalte', precio = 7000 where id_servicio = 14; */
/* select * from servicio_log_u; */

create table servicio_log_d
(id_servicio int,
nombre text(30),
descripcion varchar(50),
precio decimal,
fechacambio date,
horacambio time,
usercambio varchar(30));
/*
CREATE DEFINER = CURRENT_USER TRIGGER `estetica`.`servicio_BEFORE_DELETE` BEFORE DELETE ON `servicio` FOR EACH ROW
BEGIN
	insert into servicio_log_d 
    select old.id_servicio, old.nombre, old.descripcion, old.precio, curdate(), curtime(), user()
    from servicio;
END
*/
/* delete from servicio where id_servicio = 14; */
/* select * from servicio_log_d */

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de 2 Stored Procedures:

/* Stored Procedures 1: */

delimiter $$
/* Este sp puede ordenar la columna que desees en ascendente o descendente de la tabla que elijas. */
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

/* CALL OrdenarTurnos('Turnos', 'fecha', 'Desc'); -- Orden descendente */


-- Stored Procedures 2:
DELIMITER $$
/* Procedimiento almacenado para insertar registros en la tabla estetica.tabla_ejemplo */
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
    /* Intentar insertar un nuevo registro en la tabla */
        INSERT INTO cliente (id_cliente, nombre, apellido, telefono, email, fecha_nacimiento)
        VALUES (e_id, e_nombre, e_apellido, e_telefono, e_email, e_fecha_nacimiento);
    /* Comprobar si ocurrió un error durante la inserción */
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Registro insertado correctamente.';
    ELSE
        SET mensaje = 'No se pudo insertar el registro. Verifique los valores proporcionados.';
    END IF;
    SELECT mensaje AS Mensaje;
END $$
DELIMITER ;

/* call InsertarCliente('C21234131', 'Carolina', 'Langoni', '11784373', 'clangoni@gmail.com', '1977-11-04'); */

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de 2 Users:

/* Usuario 1 */
use mysql;
create user 'UsuarioStgSelect'@'localhost';
-- El usuario creado tendra permisos solamente para lectura.
alter user 'UsuarioStgSelect'@'localhost' identified by 'stg';
-- Se crea la contraseña del usuario
grant select on estetica.* to 'UsuarioStgSelect'@'localhost';
-- Se le asigna permisos al usuario de solo lectura a la bd Estetica.

/* Usuario 2 */
use mysql;
create user 'UsuarioStg'@'localhost';
-- El usuario creado tendra permisos solamente para lectura.
alter user 'UsuarioStg'@'localhost' identified by 'stg';
-- Se crea la contraseña del usuario
grant select, insert, update on estetica.* to 'UsuarioStg'@'localhost';
-- Se le asigna permisos al usuario de lectura, insert y update a la bd Estetica.

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */

-- Creacion de 2 sentencias:

/* select @@autocommit;
 set autocommit = 0; */

/* 1er Tabla */

select * from empleados;
start transaction;
delete from empleados where id_empleado = 41234573; 
-- insert into empleados values (41234573, 1, 'BAR2', 'Valentina', 'Zenere', 11234573, 'vzenere@estetica.com', '2023-07-17')
-- rollback;
-- commit;

/* 2da Tabla */

select * from cliente;
start transaction;
savepoint parte_1;
insert into cliente values ('C41234567', 1, 'Mariana', 'Nannis', 1123456789, 'mnannis@gmail.com', '1977-11-04');
insert into cliente values ('C41234568', 1, 'Martina', 'Nim', 1123456790, 'mnim@gmail.com', '1977-11-04');
insert into cliente values ('C41234569', 1, 'Marianela', 'Nen', 1123456791, 'mnen@gmail.com', '1977-11-04');
insert into cliente values ('C41234510', 1, 'Mariano', 'Non', 1123456792, 'mnon@gmail.com', '1977-11-04');
savepoint parte_2;
insert into cliente values ('C41234511', 1, 'Marcos', 'Nun', 1123456793, 'mnun@gmail.com', '1977-11-04');
insert into cliente values ('C41234512', 1, 'Marisol', 'Nan', 1123456794, 'mnan@gmail.com', '1977-11-04');
insert into cliente values ('C41234513', 1, 'Soldelis', 'Marimar', 1123456795, 'smarimar@gmail.com', '1977-11-04');
insert into cliente values ('C41234514', 1, 'Denisse', 'Bibiloni', 1123456796, 'dbibiloni@gmail.com', '1977-11-04');
savepoint parte_3;
-- rollback to parte_2;

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ */
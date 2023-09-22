-- Trigger 1 de tabla ubicacion_locales, se modifica la fecha, la hora y los comentarios quedando registro de quien lo hizo. Estas tablas son after.
-- select * from ubicacion_locales

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
-- insert into ubicacion_locales values ('COLEGIALES2', 'Alisados');
-- select * from ubicacion_locales_log_i

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
-- update ubicacion_locales set locales = 'Liposucciones' where id_ubicacion = 'COLEGIALES2';
-- select * from ubicacion_locales_log_u

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
-- delete from ubicacion_locales where id_ubicacion = 'COLEGIALES2';
-- select * from ubicacion_locales;





-- Trigger 2 de tabla servicio, se actualiza el servicio con toda la informacion nueva. Estas tablas son before.
-- select * from servicio

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
-- insert into servicio values (14, 'Pedicuria', 'Pedicura', 8000);
-- select * from servicio_log_i

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
-- update servicio set nombre = 'Unias', descripcion = 'Esmalte', precio = 7000 where id_servicio = 14;
-- select * from servicio_log_u;

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
-- delete from servicio where id_servicio = 14;
-- select * from servicio_log_d
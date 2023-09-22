/*
create schema ESTETICA_BIBILONI;

use ESTETICA_BIBILONI;
*/

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

    
-- Foreign Key
ALTER TABLE puestos
	ADD FOREIGN KEY (id_empleado) references empleados (id_empleado);
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

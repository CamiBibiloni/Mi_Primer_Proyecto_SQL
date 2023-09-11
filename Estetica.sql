create schema estetica;

use estetica;

create table if not exists area (
id_area int primary key auto_increment not null,
nombre_area varchar (50) not null);

create table if not exists puestos (
id_puesto int primary key auto_increment not null,
id_empleado int not null,
id_area int not null,
puesto text (30),
descripcion_puesto varchar (50)); 
-- foreign key (id_empleado) references empleado (id_empleado),
-- foreign key (id_area) references area (id_area);

create table if not exists empleado (
id_empleado int primary key auto_increment not null,
id_turnos int not null,
id_servicio INT not null,
id_tratamientos INT not null, 
nombre text (20),
apellido text (30),
especialidad text (15),
fecha_contratacion date);
-- foreign key (id_turnos) references turnos (id_turnos),
-- foreign key (id_servicio) references servicio (id_servicio),
-- foreign key (id_tratamiento) references tratamiento (id_tratamiento));

create table if not exists servicio (
id_servicio int primary key auto_increment not null,
nombre text (20),
descripcion varchar (30),
precio INT);

create table if not exists turnos (
id_turnos int primary key auto_increment not null,
id_cliente int not null,
id_servicio INT not null,
id_tratamiento INT not null,
fecha date,
hora time, 
comentarios varchar (50));
-- foreign key (id_cliente) references cliente (id_cliente),
-- foreign key (id_servicio) references servicio (id_servicio),
-- foreign key (id_tratamiento) references tratamiento (id_tratamiento));

create table if not exists tratamiento (
id_tratamiento int primary key auto_increment not null,
nombre text (20),
descripcion varchar (30),
duracion time,
precio INT);

create table if not exists cliente (
id_cliente int primary key auto_increment not null,
id_turnos int not null,
nombre text (20),
apellido text (20),
telefono int,
email varchar (50),
fecha_nacimiento date);
-- foreign key (id_turnos) references turnos (id_turnos));


-- Foreign Key añadidas a Puestos
ALTER TABLE puestos
ADD FOREIGN KEY (id_empleado) references empleado (id_empleado);
ALTER TABLE puestos
ADD FOREIGN KEY (id_area) references area (id_area);

-- Foreign Key añadidas a Empleado
ALTER TABLE Empleado
ADD foreign key (id_turnos) references turnos (id_turnos);
ALTER TABLE Empleado
ADD foreign key (id_servicio) references servicio (id_servicio);
ALTER TABLE Empleado
ADD foreign key (id_tratamiento) references tratamiento (id_tratamiento);

-- Foreign Key añadidas a Turnos
ALTER TABLE Turnos
ADD foreign key (id_cliente) references cliente (id_cliente);
ALTER TABLE Turnos
ADD foreign key (id_servicio) references servicio (id_servicio);
ALTER TABLE Turnos
ADD foreign key (id_tratamiento) references tratamiento (id_tratamiento);

-- Foreign Key añadidas a Cliente
ALTER TABLE Cliente
ADD foreign key (id_turnos) references turnos (id_turnos);

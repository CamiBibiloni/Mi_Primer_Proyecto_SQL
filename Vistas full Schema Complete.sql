/*
VISTAS 
*/

-- Primer vista: A que puesto pertenecen los empleados
create or replace view PrimerVista as select e.id_empleado, e.nombre, e.apellido, p.id_puesto, p.puesto from empleados e join puestos p on e.id_puesto = p.id_puesto;
select * from PrimerVista;

-- Segunda vista: Que clientes tomaron turnos
create or replace view SegundaVista as select c.id_cliente, c.nombre, c.apellido, t.id_turnos, t.fecha, t.hora from cliente c join turnos t on c.id_cliente = t.id_cliente;
select * from SegundaVista;

-- Tercera vista: Que servicios tienen turnos
create or replace view TercerVista as select s.id_servicio, s.nombre, t.id_turnos, t.fecha, t.hora from servicio s join turnos t on s.id_servicio = t.id_servicio;
select * from TercerVista;

-- Cuarta vista: Que servicio eligio cada cliente
create or replace view CuartaVista as select c.id_cliente, c.nombre, c.apellido, t.id_turnos, t.fecha, t.hora, s.id_servicio, s.nombre as Servicio from cliente c join turnos t on c.id_cliente = t.id_cliente join servicio s on s.id_servicio = t.id_servicio;
select * from CuartaVista;

-- Quinta vista: Que empleados dieron turnos
create or replace view QuintaVista as select e.id_empleado, e.nombre, e.apellido, t.id_turnos, t.fecha, t.hora from empleados e join turnos t on e.id_turnos = t.id_turnos;
select * from QuintaVista;
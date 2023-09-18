-- FUNCIONES --

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

select Funcion1 (4) as Servicio;




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

select Funcion2 (41234567) as nombre;
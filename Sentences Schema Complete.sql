-- select @@autocommit;

-- set autocommit = 0;

-- 1er Tabla
select * from empleados;

start transaction;
delete from empleados where id_empleado = 41234573; 
-- insert into empleados values (41234573, 1, 'BAR2', 'Valentina', 'Zenere', 11234573, 'vzenere@estetica.com', '2023-07-17')

-- rollback;

-- commit;



-- 2da Tabla
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
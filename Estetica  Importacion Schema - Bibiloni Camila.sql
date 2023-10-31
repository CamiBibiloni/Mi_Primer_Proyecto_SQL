-- INSERCION DE DATOS:

/*Tabla de Cliente */
insert into cliente values ('C41234123', 1, 'Cecilia', 'Riquelme', 11784365, 'cecir@gmail.com', '1977-11-04');
insert into cliente values ('C41234124', 1, 'Abril', 'Cavani', 11784366, 'abrilc@gmail.com', '1977-11-04');
insert into cliente values ('C41234125', 1, 'Camila', 'Zeballos', 11784367, 'camilaz@gmail.com', '1977-11-04');
insert into cliente values ('C41234126', 1, 'Liliana', 'Merentiel', 11784368, 'lilianam@gmail.com', '1977-11-04');
insert into cliente values ('C41234127', 1, 'Carolina', 'Blondel', 11784369, 'carolinab@gmail.com', '1977-11-04');
insert into cliente values ('C41234128', 1, 'Gisela', 'Langoni', 11784370, 'giselal@gmail.com', '1977-11-04');
insert into cliente values ('C41234129', 1, 'Lorena', 'Bullaude', 11784371, 'lorenab@gmail.com', '1977-11-04');

/* Tabla de Empleados */
insert into empleados values (41234567, 1, 'BAR1', 'Gabriel', 'Rivarola', 11234567, 'grivarola@estetica.com', '2023-07-17');
insert into empleados values (41234568, 1, 'COL1', 'Gonzalo', 'Ferrero', 11234568, 'gferrero@estetica.com', '2023-07-17');
insert into empleados values (41234569, 1, 'LASH1', 'Camila', 'Bibiloni', 11234569, 'cbibiloni@estetica.com', '2023-07-17');
insert into empleados values (41234570, 1, 'MAN1', 'Guadalupe', 'Chavez', 11234570, 'gchavez@estetica.com', '2023-07-17');
insert into empleados values (41234571, 1, 'EST1', 'Agostina', 'Udria', 11234571, 'audria@estetica.com', '2023-07-17');
insert into empleados values (41234572, 1, 'CEJ1', 'Ignacio', 'del Rio', 11234572, 'idelrio@estetica.com', '2023-07-17');
insert into empleados values (41234573, 1, 'BAR2', 'Valentina', 'Zenere', 11234573, 'vzenere@estetica.com', '2023-07-17');

/* Tabla de Puestos */
insert into puestos values ('BAR1', 41234567, 'BELGRANO1', 'Barbero', 'Perfilar y cortar barba');
insert into puestos values ('COL1', 41234567, 'BELGRANO1', 'Colorista', 'Decoloracion y color de pelo');
insert into puestos values ('LASH1', 41234567, 'RAMOS1', 'Lashista', 'Colocacion de pestanias');
insert into puestos values ('MAN1', 41234567, 'PALERMO1', 'Manicura', 'Colocacion de unias');
insert into puestos values ('EST1', 41234567, 'LUZURIAGA1', 'Esteticista', 'Depilacion de cuerpo');
insert into puestos values ('CEJ1', 41234567, 'RAMOS1', 'Cejas', 'Perfilado de cejas');
insert into puestos values ('BAR2', 41234567, 'BELGRANO1', 'Barbero', 'Perfilar y cortar barba');

/* Tabla de Servicio */
insert into servicio values (1, 'Corte de Hombre', 'Barbero', 2500);
insert into servicio values (2, 'Corte de Mujer', 'Barbero', 3000);
insert into servicio values (3, 'Tintura', 'Colorista', 10000);
insert into servicio values (4, 'Decoloracion', 'Colorista', 20000);
insert into servicio values (5, 'Extensiones de pestanias', 'Lashista', 5000);
insert into servicio values (6, 'Lifting de pestanias', 'Lashista', 5000);
insert into servicio values (7, 'Laminado de cejas', 'Cejas', 3000);
insert into servicio values (8, 'Depilacion de cejas', 'Cejas', 2000);
insert into servicio values (9, 'Esculpidas en gel', 'Manicura', 8000);
insert into servicio values (10, 'Esmaltado comun', 'Manicura', 5500);
insert into servicio values (11, 'Esmaltado semi', 'Manicura', 6000);
insert into servicio values (12, 'Depilacion cuerpo completo', 'Esteticista', 45000);
insert into servicio values (13, 'Depilacion zona intima', 'Esteticista', 15000);

/* Tabla de Turnos */
insert into turnos values (1, 'C41234123', 3, '2023-12-30', '9:00', 'Color rojo');
insert into turnos values (2, 'C41234124', 5, '2023-12-31', '10:00', 'Volumen medio');
insert into turnos values (3, 'C41234125', 6, '2023-01-01', '11:00', 'Sin tintura');
insert into turnos values (4, 'C41234126', 1, '2023-01-02', '12:00', 'Estilo CR7');
insert into turnos values (5, 'C41234127', 8, '2023-01-03', '13:00', 'No tan finas');
insert into turnos values (6, 'C41234128', 9, '2023-01-04', '14:00', 'Largo 2');
insert into turnos values (7, 'C41234129', 12, '2023-01-05', '15:00', 'Sin Comentarios');

/* Tabla de Ubicacion_locales */
insert into ubicacion_locales values ('BELGRANO1', 'Peluqueria');
insert into ubicacion_locales values ('PALERMO1', 'Manicuria');
insert into ubicacion_locales values ('RAMOS1', 'Pestanias y Cejas');
insert into ubicacion_locales values ('LUZURIAGA1', 'Depilacion');
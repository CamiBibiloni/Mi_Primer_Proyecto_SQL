use mysql;

create user 'UsuarioStgSelect'@'localhost';
-- El usuario creado tendra permisos solamente para lectura.

alter user 'UsuarioStgSelect'@'localhost' identified by 'stg';
-- Se crea la contraseña del usuario

grant select on estetica.* to 'UsuarioStgSelect'@'localhost';
-- Se le asigna permisos al usuario de solo lectura a la bd Estetica.

/*

*/

use mysql;

create user 'UsuarioStg'@'localhost';
-- El usuario creado tendra permisos solamente para lectura.

alter user 'UsuarioStg'@'localhost' identified by 'stg';
-- Se crea la contraseña del usuario

grant select, insert, update on estetica.* to 'UsuarioStg'@'localhost';
-- Se le asigna permisos al usuario de solo lectura a la bd Estetica.
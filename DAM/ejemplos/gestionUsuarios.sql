-- Mostrando 
show grants;
select * from information_schema.USER_PRIVILEGES;
set password = password('claveSegura');

-- WHO AM I? 24601!!!
select current_user();
select user();

-- ¿Cómo conceder permisos?
grant select on liga.* to alumno@’%’;

-- ¿Cómo conceder permisos con la creación de usuarios? En una misma línea:
grant select on liga.* to alumnito@’%’ identified by ‘1234’;

show grants;
show databases;
use liga;
select * from equipo;

-- ¿Cómo revocar permisos?
revoke select on liga.* from alumnito@'%';
revoke all privileges, grant optiom from usuario@'%';

-- Jugando con los permisos de Otto
grant select on liga.jugador to otto@'%';
show grants;
show databases;
use liga;
show tables;
select * from jugador;
select * from equipo;
grant select (nombre, id) on liga.equipo to otto;
select id, nombre from equipo;
revoke select (nombre) on liga.equipo from otto;

grant select (nombre), update (web_oficial) on liga.equipo to otto;
update equipo set web_oficial = 'LOL' where id = 9;

revoke all privileges, grant option from otto;
show grants;

grant all on liga.equipo to otto;
grant select (id, nombre, salario) on liga.jugador to otto;
show grants;

grant file on *.* to otto;

select id, nombre, salario from jugador into outfile '/tmp/sueldos.csv' fields terminated by ';';

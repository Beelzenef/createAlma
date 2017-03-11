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

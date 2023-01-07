-- Eliminando un inscrito
begin;
select * from empleado;
delete from inscrito where empleado = 3 and curso = 4;
select * from empleado;
rollback;

-- Cambiando sueldo de empleados
begin;
update empleado set sueldo = 1000 where sueldo = 100;
select * from inscrito;
rollback;

-- Simulando desconexión de base de datos
begin;
update empleado set sueldo = 1000 where sueldo = 100;
-- CTRL + C! Relog!
select * from empleado;

-- ¿Qué es autocommit? ¿Qué valor tiene?
show variables\G;
show variables like 'autocommit';

-- Una tabla de pruebas:
create table test (campo int not null primary key) engine = innodb;
insert into test values (1), (2), (3);
set autocommit = 0;
show variables like 'autocommit';
insert into test values (4), (5), (6);
select * from test;
-- CTRL + C! Relog!
select * from test;
-- Los datos no están... :(
set autocommit = 0;
show variables like 'autocommit';
insert into test values (4), (5), (6);
commit;
-- CTRL + C! Relog!
select * from test;
-- Los valores permanecen

-- Insertando datos almacenados en variables locales
begin;
select @maximo := max(campo) + 1 from test;
insert into test values (@maximo);
commit;
select * from test;

-- ¿En qué nivel de aislamiento se encuentran las transacciones?
select @@global.tx_isolation, @@tx_isolation;

-- Cambiando niveles:
set session tx_isolation = 'READ-UNCOMMITTED';
select @@tx_isolation;
set global tx_isolation = 'READ-UNCOMMITTED';
select @@global.tx_isolation;

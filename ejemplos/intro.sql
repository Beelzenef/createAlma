-- Mostrar bases de datos existentes
show databases;

-- Crear base de datos "padron"
create database padron;

-- Entrar en base de datos "padron"
use padron;

-- Mostrar tablas
show tables;

-- Entrar en el diccionario de datos
use mysql;

-- Mostrar tablas existentes en la base de datos actual
show tables;

-- Mostrar columnas de la tabla "user"
desc user;

-- Mostrar descripcion de tabla "user"
show create table user;

-- Ver usuarios, contraseñas y plugin especificado de tabla "user"
select user, host, password, plugin from user;

-- Invocando calculos matemáticos
select 10 + 5;

-- Encriptando una palabra
select password('hola');

-- 05/12/2016

-- Mostrar base de datos  
show databases like 'padron';

-- Eliminar la base de datos 'padron'
drop database if exists tablaInexistente;

-- Mostrar warnings
show warnings;

-- Eliminar base de datos "padron"
drop database padron;

-- Crear base de datos "padron"
create database padron;

-- Especificacion de la base de datos "padron"
show create database padron;

-- Conexion directa a base de datos "padron"
mysql -u root -p padron

-- Inyectar un script en la base de datos actual
source padron.sql

-- ¿Cuantas tablas existen ahora?
show tables;

-- Consultar los datos de la tabla "municipio"
select * from municipio;

-- Detalles a perfilar de la tabla "municipio"
show create table municipio;

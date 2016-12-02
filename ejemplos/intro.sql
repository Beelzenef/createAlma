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

-- Activacion de claves ajenas:
pragma foreign_keys = on;

-- Eliminando tablas existentes para consistencia de claves ajenas:
drop table if exists ventas;
drop table if exists distribucion;
drop table if exists coches;
drop table if exists concesionarios;
drop table if exists marcas;
drop table if exists clientes;

-- Construccion de tablas:
create table clientes (
    dni text primary key,
    nombre text,
    apellido text,
    ciudad text
);

create table marcas (
  cifm text primary key,
  nombre text,
  ciudad text
);

create table concesionarios (
  cifc text primary key,
  nombre text,
  ciudad text
);

create table coches (
  codcoche text primary key,
  cifm text references marcas (cifm)
    on update cascade
    on delete restrict,
  nombre text,
  modelo text
);

create table distribucion (
  cifc text,
  codcoche text,
  cantidad integer,
  primary key (cifc, codcoche),
  foreign key (codcoche) references coches (codcoche)
    on update cascade
    on delete restrict,
  foreign key (cifc) references concesionarios (cifc)
    on update cascade
    on delete restrict
);

create table ventas (
  cifc text,
  dni text,
  codcoche text,
  color text,
  primary key (cifc, dni, codcoche),
  foreign key (cifc) references concesionarios (cifc)
    on update cascade
    on delete restrict,
  foreign key (codcoche) references coches (codcoche)
    on update cascade
    on delete restrict,
  foreign key (dni) references clientes (dni)
    on update cascade
    on delete restrict
);

-- Importacion de datos:
.mode tabs
.import marcas.csv marcas
.import clientes.csv clientes
.import concesionarios.csv concesionarios
.import coches.csv coches
.import distribucion.csv distribucion
.import ventas.csv ventas

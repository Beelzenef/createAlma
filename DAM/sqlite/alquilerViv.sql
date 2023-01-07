-- ALQUILER DE VIVIENDAS

-- Un dueño puede ser también arrendatario, pero obviamente no en una misma vivienda
-- No se puede borrar un dueño si tiene casas 
-- Un alquiler no puede terminar el mismo día en que se ha iniciado

-- Modelo relacional:

-- 1. Arrendatario (dni (PK), nombre)
-- 2. Dueño (dni (PK), nombre)
-- 3. Casa (id (PK), direccion, dnidueno (FK))
-- 4. Alquiler (idCasa (PK)(FK), dnialquilado(PK)(FK), fechaD, fechaD (?), deuda)
-- 4. Agenda (num (PK))
-- 5. AgendaArrendatario (num (PK)(FK), dnialquilado (PK)(FK))
-- 6. AgendaDuenos (num (PK)(FK), dnidueno (PK)(FK))

-- Activacion de claves ajenas:

pragma foreign_keys = on;
.mode column
.headers on

-- Borrado de tablas:

drop table if exists agendaarrendatario;
drop table if exists agendadueno;
drop table if exists agenda;
drop table if exists alquiler;
drop table if exists casa;
drop table if exists arrendatario;
drop table if exists dueno;

-- Creacion de tablas:

create table arrendatario (
  dni text primary key,
  nombre text not null
);

create table dueno (
  dni text primary key,
  nombre text not null
);

create table casa (
  id integer primary key,
  direccion text not null,
  propietario text not null,
  foreign key (propietario) references dueno (dni)
    on update cascade
    on delete restrict
);

create table alquiler (
  casa integer,
  dni text not null,
  fechaD text not null,
  fechaH text,
  deuda numeric,
  primary key (casa, dni),
  foreign key (casa) references casa (id)
    on update cascade
    on update restrict,
  foreign key (dni) references arrendatario (dni)
    on update cascade
    on delete restrict
);

create table agenda (
  num text primary key
);

create table agendaarrendatario (
  num text,
  dni text,
  primary key (num, dni),
  foreign key (dni) references arrendatario (dni)
    on update cascade
    on delete restrict,
  foreign key (num) references agenda (num)
    on update cascade
    on delete restrict
);

create table agendadueno (
  num text,
  dni text,
  primary key (num, dni),
  foreign key (dni) references dueno (dni)
    on update cascade
    on delete restrict,
  foreign key (num) references agenda (num)
    on update cascade
    on delete restrict
);

-- Datos:

insert into dueno (dni, nombre) values
  ('17189863P', 'Lois Ewing'),
  ('Y9703607J', 'George Thompson'),
  ('J0116651A', 'Allan Cox'),
  ('68306388E', 'Eliseo Moreno');
  
insert into arrendatario (dni, nombre) values
  ('00037985N', 'Margaret Lister'),
  ('Y9685081W', 'Kenneth L. Johnston'),
  ('H97276489', 'Jon L. Leonard'),
  ('19582792V', 'Jane B. Washington'),
  ('63003530K', 'Brenda A. Brown');
  
insert into casa (id, direccion, propietario) values
  (1, '123 6th St.', '17189863P'),
  (2, '70 Bowman St.', 'Y9703607J'),
  (3, '71 Pilgrim Avenue', 'J0116651A'),
  (4, '514 S. Magnolia St.', 'J0116651A'),
  (5, 'Cómpeta, 28, 1C', '68306388E');
  
insert into alquiler (casa, dni, fechaD, fechaD, deuda) values
  (1, '00037985N', '2017-06-06', null, 0),
  (2, 'Y9685081W', '2017-06-06', '2018-08-07', 0),
  (3, 'H97276489', '2017-06-06', '2017-09-03', 30),
  (4, '19582792V', '2017-06-06', '2019-02-01', 100),
  (5, '63003530K', '2017-06-06', '2018-03-03', 150);
  
insert into agenda (num) values
  ('0148'),
  ('2874'),
  ('2571'),
  ('8746'),
  ('9841'),
  ('7458'),
  ('9881'),
  ('9632'),
  ('4125');
  
insert into agendaarrendatario (num, dni) values
  ('0148', '00037985N'),
  ('2874', 'Y9685081W'),
  ('2571', 'H97276489'),
  ('8746', '19582792V'),
  ('9841', '63003530K');
  
insert into agendadueno (num, dni) values
  ('7458', '17189863P'),
  ('9881', 'Y9703607J'),
  ('9632', 'J0116651A'),
  ('4125', '68306388E');
  

-- Consideraciones:

-- 1. Toda casa tiene un único dueño. DONE!

-- 2.1. La fecha de un nuevo alquiler de vivienda no puede estar en el pasado.
-- 2.2. La fecha final debe ser al menos un día posterior a la fecha inicial del alquiler.
-- 3. 	Una casa no puede estar alquilada por más de un arrendatario en el mismo período de tiempo.
-- 4. 	Un arrendatario no puede alquilar una casa si tiene alguna deuda pendiente.

drop trigger if exists antesDeAlquilar;
create trigger antesDeAlquilar
    before insert on alquiler
    for each row
    begin
        select case when new.fechaD < date('now') then
                    raise(abort, "ERROR: No puedes alquilar en el pasado")
                end;
	select case when new.fechaD > new.fechaH then
                    raise(abort, "ERROR: El periodo de alquiler no puede ser tan breve")
                end;
	select case when (select new.dni in (select dni from alquiler where deuda > 0)) then
                    raise(abort, "ERROR: Los arrendatarios con deudas pendientes no pueden realizar nuevos alquileres")
                end;
                
        -- Para el control de solapamiento de fechas
        select case when exists (select * from alquier where new.fechaD < fechaD and new.fechaH >= fechaH and casa = new.casa) then
		    raise(abort, "ERROR: La casa solicitada ya está en alquiler, fecha de inicio en solapamiento")
		end;
        select case when exists (select * from alquier where new.fechaD >= fechaD and new.fechaH <= fechaH and casa = new.casa) then
		    raise(abort, "ERROR: La casa solicitada ya está en alquiler")
		end;
      end;
      
drop trigger if exists actualizarAlquiler;
create trigger actualizarAlquiler
  before update on alquiler
  for each row
  
  begin
  
	select case when new.fechaD < date('now') then
                    raise(abort, "ERROR: No puedes alquilar en el pasado")
                end;
        select case when new.fechaD > new.fechaH then
                    raise(abort, "ERROR: El periodo de alquiler no puede ser tan breve")
                end;
        -- Para el control de solapamiento de fechas
        select case when exists (select * from alquier where new.fechaD < fechaD and new.fechaH >= fechaH and casa = new.casa and old.dni != new.dni) then
		    raise(abort, "ERROR: La casa solicitada ya está en alquiler, fecha de inicio en solapamiento")
		end;
        select case when exists (select * from alquier where new.fechaD >= fechaD and new.fechaH <= fechaH and casa = new.casa and old.dni != new.dni) then
		    raise(abort, "ERROR: La casa solicitada ya está en alquiler")
		end;
  
  end;
      
-- 5. El nombre de un arrendatario no puede contener números. Idem para el nombre de los dueños de viviendas.

drop trigger if exists ArrendatarioSinNumeros;
create trigger ArrendatarioSinNumeros
    before insert on alquiler   
    begin
    
	select case when new.nombre glob '*[1-9]*' then
		  raise(abort, "ERROR: Los nombres de dueños no pueden contener números")
		end;
    end;
    
drop trigger if exists DuenosSinNumeros;
create trigger DuenosSinNumeros
    before insert on dueno   
    begin
    
	select case when new.nombre glob '*[1-9]*' then
		  raise(abort, "ERROR: Los nombres de dueños no pueden contener números")
		end;
    end;

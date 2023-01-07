use cursos;

drop table if exists requisitos;
drop table if exists asistentes;
drop table if exists edicion;
drop table if exists empleado;
drop table if exists curso;

-- Tabla CURSO
create table curso (
  idcurso smallint unsigned not null,
  nombre varchar(50) not null,
  coste mediumint unsigned not null,
  descripcion varchar(50) not null,
  horas smallint unsigned not null,
    primary key (idcurso)
);

insert into curso values (1, "Curso 1", 100, "Desc C1", 100);

-- Tabla EMPLEADO
create table empleado (
  idempleado smallint unsigned not null,
  nombre varchar(50) not null,
  direccion varchar(50) not null,
  nif char(15) not null,
  genero char(1) not null default 'F',
  tlf char(15) not null,
  fnac date not null,
  capacitado boolean default 0 not null,
    unique key (nif),
    primary key (idempleado)
);

insert into empleado values (1, "Elena", "Calle 1", "7663", 'F', "952236786", "1993-05-05", 1);
insert into empleado values (2, "Laín", "Calle 2", "9658", 'M', "952586786", "1997-06-04", 2);
insert into empleado values (3, "Colophonius", "Calle 3", "9128", 'M', "952586145", "1978-06-04", 0);

-- Tabla EDICION
create table edicion (
  uncurso smallint unsigned not null,
  fecha date not null,
  horario char(1) default 'T',
  localizacion varchar(20),
  profesor smallint unsigned not null,
    primary key (uncurso, fecha),
    foreign key (uncurso) references curso (idcurso)
      on update cascade
      on delete restrict,
    foreign key (profesor) references empleado (idempleado)
      on update cascade
      on delete restrict
);

-- Tabla ASISTENTES
create table asistentes (
  edicioncurso smallint unsigned not null,
  fechaedicion date not null,
  asistente smallint unsigned not null,
    primary key (edicioncurso, fechaedicion, asistente),
    foreign key (edicioncurso, fechaedicion) references edicion (uncurso, fecha)
      on update cascade
      on delete restrict,
    foreign key (asistente) references empleado (idempleado)
      on update cascade
      on delete restrict
);

-- Tabla REQUISITOS
create table requisitos (
  idcurso smallint unsigned not null,
  cursoreq smallint unsigned not null,
  obligatorio boolean,
    primary key (idcurso),
    foreign key (idcurso) references curso (idcurso)
      on update cascade
      on delete restrict,
    foreign key (cursoreq) references curso (idcurso)
      on update cascade
      on delete restrict
);

-- Mostrando creacion de tablas
show tables;
desc curso;
desc empleado;

-- Mostrando empleados
select * from empleado;

-- Mostrando cursos
select * from cursos;

-- Interpretacion de 
select nombre, if(capacitado, 'verdadero', 'falso') from empleado;

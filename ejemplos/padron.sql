use padron;

drop table if exists municipio;

create table municipio (
  cp char(5),
  nombre varchar(50) not null,
    primary key (cp)
  );

insert into municipio (cp, nombre) values (
    "29005", "Malaga - Portada Alta"
  );
insert into municipio (cp, nombre) values (
    "29007", "Malaga - Teatinos"
  );
insert into municipio (cp, nombre) values (
    "29010", "Malaga - Cruz Humilladero"
  );

drop table if exists vivienda;

create table vivienda (
  nrc char(50),
  direccion varchar(50) not null,
  municipioVivienda char(5) not null,
    primary key (nrc),
    foreign key (municipioVivienda) references municipio (cp)
	on update cascade
	on delete restrict
);
  
drop table if exists habitante;

create table habitante (
  idhab int,
  nombrehab varchar(50), 
    primary key (idhab)
);

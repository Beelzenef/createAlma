use padron;

drop table if exists propietarios;
drop table if exists habitante;
drop table if exists vivienda;
drop table if exists municipio;

-- Tabla MUNICIPIO
create table municipio (
 codprov char(2),
 codmunicipio char(3),
 nombre varchar(100) not null,
    primary key (codprov, codmunicipio)
);

insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "005", "Malaga - Portada Alta"
  );
insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "007", "Malaga - Teatinos"
  );
insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "010", "Malaga - Cruz Humilladero"
  );

create table vivienda (
    nrc char(50),
    direccion char(50) not null,
    provincia char(2) not null,
    municipio char(3) not null,
        primary key (nrc),
        foreign key (provincia, municipio) references municipio (codprov, codmunicipio)
            on update cascade
            on delete restrict
);

insert into vivienda values ("00001", "Calle 001", "29", "005");
insert into vivienda values ("00002", "Calle 002", "29", "007");
insert into vivienda values ("00003", "Calle 003", "29", "010");

-- Tabla HABITANTE
create table habitante (
    numid int,
    nombre varchar(100) not null,
    fechanacimiento date not null,
    dondevive char(50) not null,
    cf int not null,
        primary key (numid),
        foreign key (dondevive) references vivienda (nrc)
            on update cascade
            on delete restrict,
        foreign key (cf) references habitante (numid)
            on update cascade
            on delete restrict
);

insert into habitante values (1, "Elena", "1993-06-12", "00001", 1);
insert into habitante values (2, "Colophonius", "1913-04-12", "00001", 1);
insert into habitante values (3, "Laín Coubert", "1989-09-12", "00001", 1);
insert into habitante values (4, "Dresden", "1982-05-12", "00002", 4);
insert into habitante values (5, "Capitan Osoazul", "1978-01-12", "00003", 5);

-- Tabla PROPIETARIOS
create table propietarios (
    propietario int,
    lugar char(50),
        primary key (propietario, lugar),
        foreign key (propietario) references habitante (numid)
            on update cascade
            on delete restrict,
        foreign key (lugar) references vivienda (nrc)
            on update cascade
            on delete restrict,
);

insert into propietarios values (1, "00001");

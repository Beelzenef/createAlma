-- Usando base de datos PADRON
use padron;

-- Eliminando tablas en orden inverso, que no afecta a claves ajenas
drop table if exists propietarios;
drop table if exists habitante;
drop table if exists vivienda;
drop table if exists municipio;

-- Creacion de tabla MUNICIPIO
create table municipio (
  	codigoprovincia char(2),
  	codigomunicipio char(3),
  	nombre varchar(50) not null,
    		primary key (codigoprovincia, codigomunicipio)
  );
  
-- Datos para tabla MUNICIPIO
insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "005", "Malaga - Portada Alta"
  );
insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "007", "Malaga - Teatinos"
  );
insert into municipio (codigoprovincia, codigomunicipio, nombre) values (
    "29", "010", "Malaga - Cruz Humilladero"
  );

-- Creacion de tabla VIVIENDA
create table vivienda (
  	nrc char(50),
  	direccion varchar(50) not null,
  	provinciaVivienda char(2) not null,
  	municipioVivienda char(3) not null,
    		primary key (nrc),
    		foreign key (provinciaVivienda, municipioVivienda) references municipio (codigoprovincia, codigomunicipio)
			on update cascade
			on delete restrict
);

-- Datos para tabla VIVIENDA
insert into vivienda values ("00001", "Calle 001", "29", "005");
insert into vivienda values ("00002", "Calle 002", "29", "007");
insert into vivienda values ("00003", "Calle 003", "29", "010");

-- Creacion de tabla HABITANTE
create table habitante (
	numid char(10),
  	nombrehab varchar(50) not null,
  	fechanacimiento date not null,
  	codigovivienda char(50) not null,
  	cf char(10) not null,
	primary key (numid),
	foreign key (codigovivienda) references vivienda (nrc)
		on update cascade
		on delete restrict,
	foreign key (cf) references habitante (numid)
		on update cascade
		on delete restrict
);

-- Datos para tabla HABITANTE

insert into habitante values ("001", "Elena", "1993-06-12", "00001", "001");
insert into habitante values ("002", "Colophonius", "1913-04-12", "00001", "001");
insert into habitante values ("003", "Laín Coubert", "1989-09-12", "00001", "001");
insert into habitante values ("004", "Dresden", "1982-05-12", "00002", "004");
insert into habitante values ("005", "Capitan Osoazul", "1978-01-12", "00003", "005");

-- Creacion de tabla PROPIETARIOS
create table propietarios (
	codvivienda char(50),
	codhabitante char(10),
		primary key (codvivienda, codhabitante),
		foreign key (codvivienda) references vivienda (nrc)
			on update cascade
			on delete restrict,
		foreign key (codhabitante) references habitante (numid)
			on update cascade
			on delete restrict
);

-- Datos para tabla PROPIETARIOS
insert into propietarios values ("00001", "78844445B");

-- Actualizando un codigo de municipio en tabla MUNICIPIO
select * from municipio;
update municipio set codigomunicipio = '011' where codigomunicipio = '010';
select * from municipio;
select * from vivienda;

select * from habitante;

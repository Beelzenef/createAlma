use padron;

drop table if exists municipio;

create table municipio (
  	codigoprovincia char(2),
  	codigomunicipio char(3),
  	nombre varchar(50) not null,
    		primary key (codigoprovincia, codigomunicipio)
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

drop table if exists vivienda;

create table vivienda (
  	nrc char(50),
  	direccion varchar(50) not null,
  	municipioVivienda char(5) not null,
    		primary key (nrc),
    		foreign key (municipioVivienda) references municipio (codigoprovincia, codigomunicipio)
			on update cascade
			on delete restrict
);
  
drop table if exists habitante;

create table habitante (
	numid int,
  	nombrehab varchar(50) not null,
  	fechanacimiento char(10) not null,
  	codigovivienda char(50) not null,
  	provinciahab char(2) not null,
  	municipiohab char(50) not null,
    	primary key (numid),
	foreign key (provinciahab, municipiohab) references municipio (codigoprovincia, codigomunicipio)
		on update cascade
		on delete restrict,
	foreign key (codigovivienda) references vivienda (nr)
		on update cascade
		on delete restrict
);

drop table if exists propietarios;

create table propietarios (
	codvivienda char(50),
	codhabitante int,
		primary key (codvivienda, codhabitante),
		foreign key (codvivienda) references vivienda (nrc)
			on update cascade
			on delete restrict,
		foreign key (codhabitante) references habitante (numid)
			on update cascade
			on delete restrict
	);

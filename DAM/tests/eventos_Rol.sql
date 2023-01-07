create database if not exists partidas;

use partidas;

drop table if exists timeline;
drop table if exists cronica;

create table cronica (
  idcronica int not null,
  nombrecronica varchar(30) not null,
    primary key (idcronica)
);

create table timeline (
  fecha date not null,
  titulo char(30) not null,
  cronica int not null,
    primary key (fecha, titulo),
    foreign key (cronica) references cronica (idcronica)
      on update cascade
      on delete restrict
);

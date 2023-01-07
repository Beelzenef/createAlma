-- =============================================
-- Autor: Elena Guzman Blanco (Beelzenef)
-- Fecha de crecion:  29/Nov/2016
-- Descripcion: Inicio de creacion de personajes para dontBePantser
-- =============================================

create table personajes (
    id int not null,
    nombre varchar(100),
    localizacion varchar(100),
        primary key (id),
        foreign key (localizacion)
            references (lugares)
                on delete restrict
                on update cascade
);

create table lugares (
    id int not null,
    ciudad varchar(100),
    pais varchar(100)
        primary key (id)
);

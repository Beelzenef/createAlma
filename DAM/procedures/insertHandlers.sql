delimiter ]]

-- INSERTAR UN DVDdasdsdasfafasfas --
drop procedure if exists insertarDVD2]]

create procedure insertarDVD2(cod smallint(6),
			     title varchar(40),
			     artist varchar(30), 
			     elPais char(2),
			     comp varchar(40),
			     prec decimal(6,2),
			     elAnio char(4),
			     out resultado tinyint(1))
comment 'Insertando un DVD con los datos especificados'

begin

    -- Declaracion de handlers
        -- Intento de inserción de clave primaria repetida
    declare exit handler for 1062 set resultado = 1;
        -- Intento de inserción de clave ajena inexistente
    declare exit handler for 1452 set resultado = 2;
        -- Intento de agregar valor a columna ue no admite null
    declare exit handler for 1048 set resultado = 3;
        -- Intento de pasar la clave primaria como valor null
    declare exit handler for 1171 set resultado = 4;
    
    insert into dvd (codigo, titulo, artista, pais, compania, precio, anio)
      values
	(cod, title, artist, elPais, comp, prec, elAnio);

end]]

delimiter ;

delimiter ]]

-- SELECCIONAR TODOS LOS DVDS
drop procedure if exists seleccionarDVDs]]

create procedure seleccionarDVDs()
comment 'Selecciona todos los DVDs existentes en tabla'

begin

  select codigo, titulo, artista, pais, compania, precio, anio
    from dvd;

end]]

-- SELECCIONAR DVDS CON CONTROL DE PARÁMETROS
drop procedure if exists seleccionarUnDVD]]

create procedure seleccionarUnDVD(cod smallint(6),
				  title varchar(40), 
				  artist varchar(30), 
				  elPais char(2),
				  comp varchar(40),
				  precioDesde decimal(6,2), precioHasta decimal(6,2), 
				  elAnio char(4), 
				  out resultado tinyint(1))
comment 'Seleccionar DVDs con parámetros que admiten NULL'

begin

    declare condicion varchar(255) default null;
    
    set condicion = concat('anio =', elAnio);

    if condicion is null then
      select codigo, titulo, artista, pais, compania, precio, anio from dvd;  
    else
       select codigo, titulo, artista, pais, compania, precio, anio from dvd
	  where condicion;
    end if;
    
  
  set resultado = 0;
  
end]] 

-- INSERTAR UN DVD
drop procedure if exists insertarDVD]]

create procedure insertarDVD(cod smallint(6), title varchar(40), artist varchar(30), elPais char(2),
			    comp varchar(40), prec decimal(6,2), elAnio char(4), out resultado tinyint(1))
comment 'Insertando un DVD con los datos especificados'

begin

  insert into dvd (codigo, titulo, artista, pais, compania, precio, anio)
    values
      (cod, title, artist, elPais, comp, prec, elAnio);
      
  set resultado = 0;

end]]

-- ELIMINAR UN DVD
drop procedure if exists eliminarDVD]]

create procedure eliminarDVD()
comment ''

begin

  select 'Eliminando DVDs' as mensaje;

end]]

-- MODIFICAR UN DVD
drop procedure if exists modificarDVD]]

create procedure modificarDVD()
comment ''

begin

  select 'Modificando DVDs' as mensaje;

end]]

-- DELIMITADOR, DE VUELTA A LA NORMALIDAD
delimiter ;

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
				  precioHasta decimal(6,2), 
				  elAnio char(4),
				  out resultado tinyint(1))
comment 'Seleccionar DVDs con parámetros que admiten NULL'

begin

    declare condiciones varchar(255) default '';
    set @orden = 'select codigo, titulo, artista, pais, compania, precio, anio from dvd';
    
    -- Para búsqueda de codigos:
    if cod is not null then
	set condiciones = concat(' where codigo = ', cod);
    end if;
    -- Para búsqueda de titulos:
    if title is not null then
	if condiciones = '' then
	  set condiciones = concat(' where titulo rlike "', title, '"');
	else
	  set condiciones = concat(condiciones, ' and titulo rlike "', title, '"');
	end if;
    end if;
    -- Para búsqueda de artistas:
    if artist is not null then
	if condiciones = '' then
	  set condiciones = concat(' where artista rlike "', artist, '"');
	else
	  set condiciones = concat(condiciones, ' and artista rlike "', artist, '"');
	end if;
    end if;
    -- Para búsqueda de países:
    if elPais is not null then
	if condiciones = '' then
	  set condiciones = concat(' where pais = ', elPais);
	else
	  set condiciones = concat(condiciones, ' and pais = ', elPais);
	end if;
    end if;
    -- Para búsqueda de companias
    if comp is not null then
	if condiciones = '' then
	  set condiciones = concat(' where compania rlike "', comp, '"');
	else
	  set condiciones = concat(condiciones, ' and compania rlike "', comp, '"');
	end if;
    end if;
    -- Para búsqueda de precios:
    if title is not null then
	if condiciones = '' then
	  set condiciones = concat(' where precio <= ', precioHasta);
	else
	  set condiciones = concat(condiciones, ' and precio <= ', precioHasta);
	end if;
    end if;
    -- Para búsqueda por años:
    if elAnio is not null then
	if condiciones = '' then
	  set condiciones = concat(' where anio = ', elAnio);
	else
	  set condiciones = concat(condiciones, ' and anio = ', elAnio);
	end if;
    end if;
    
    select @orden as "Consulta a depurar";
    set @orden = concat(@orden, condiciones);
  
    prepare sentencia from @orden;
    execute sentencia;
    deallocate prepare sentencia;
  
end]] 

-- INSERTAR UN DVD
drop procedure if exists insertarDVD]]

create procedure insertarDVD(cod smallint(6),
			     title varchar(40),
			     artist varchar(30), 
			     elPais char(2),
			     comp varchar(40),
			     prec decimal(6,2),
			     elAnio char(4),
			     out resultado tinyint(1))
comment 'Insertando un DVD con los datos especificados'

begin

  -- Declaracion de excepciones posibles:
  declare errorClavePrimaria condition for sqlstate '23000';
  declare errorClaveAJena condition for sqlstate '23000';
  
  declare tuplasEncontradas int default 0;
  declare paisEncontrado int default 0;
  
  -- Buscando claves ajenas y primarias para evitar errores:
  select count(*) into tuplasEncontradas from dvd where codigo = cod;
  select count(*) into paisEncontrado from pais where iso2 = elPais;
 
  if tuplasEncontradas <> 0 then   
    signal errorClavePrimaria set message_text = 'Codigo de DVD repetido', mysql_errno = 1062;
  elseif paisEncontrado = 0 then
    signal errorClaveAJena set message_text = 'Codigo de país inexistente', mysql_errno = 1452;
  else
    insert into dvd (codigo, titulo, artista, pais, compania, precio, anio)
      values
	(cod, title, artist, elPais, comp, prec, elAnio);
  end if;
  set resultado = 0;

end]]

-- ELIMINAR UN DVD
drop procedure if exists eliminarDVD]]

create procedure eliminarDVD(cod smallint(6),
			     codHasta smallint(6),
			     out resultado tinyint(1))
comment 'Eliminando un DVD desde código, pudiendo ser un rango de códigos'

begin
  
  declare condiciones varchar(255) default '';
  set @orden = 'delete from dvd';
  
  if codHasta is not null and codHasta is not null and codHasta > cod then
      set condiciones = concat(' where codigo between ', cod, ' and ', codHasta);
  elseif cod is not null and codHasta is null then
      set condiciones = concat(' where codigo = ', cod);
  elseif cod is null or codHasta is null then
    set condiciones = concat( ' where codigo is null');
  end if;
  
  set @orden = concat(@orden, condiciones);
  select @orden as "Consulta a depurar";
  
  prepare sentencia from @orden;
  execute sentencia;
  deallocate prepare sentencia;

end]]

-- MODIFICAR UN DVD
drop procedure if exists modificarDVD]]

create procedure modificarDVD(cod smallint(6),
			     title varchar(40),
			     artist varchar(30), 
			     elPais char(2),
			     comp varchar(40),
			     prec decimal(6,2),
			     elAnio char(4),
			     out resultado tinyint(1))
comment 'Modificando un DVD a través de su código. Especificación de modificación de campos:
	  Pais es una clave ajena
	  Titulo, artista, compañía totalmente libres de modificacion
	  Precio ¿libre?
	  No es posible introducir años futuros
	  Resultado 0, OK - Resultado -1, fallo encontrado'

begin

 declare anioValido char(4) default null;
  
  if elAnio <= year(now()) then
     set anioValido = elAnio;
  end if;
  
  update dvd
      set titulo = title,
	  artista = artist,
	  pais = elPais,
	  compania = comp,
	  precio = prec,
	  anio = anioValido
	    where codigo = cod;
  
  set resultado = 0;

end]]

-- DELIMITADOR, DE VUELTA A LA NORMALIDAD
delimiter ;

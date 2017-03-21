delimiter [[

drop procedure if exists addDatos[[

create procedure addDatos()
comment 'Insertando un equipo'
sql security invoker
reads sql data
begin

  select '¡Insertando datos!';
  insert into equipo (id, nombre, idcapitan, ciudad, web_oficial, puntos)
      values
	(10, 'Pecezuelos', NULL, 'Malaga', 'http://www.pecezuelos.net', 0);

end[[

delimiter ;

delimiter ]]

drop procedure if exists listarPorEquipo]]
create procedure listarPorEquipo(in eq int)
comment 'Listando todos los jugadores por equipo'

begin

  -- Variables para almacenar campos en FETCH
  declare nombreTemp varchar(102);
  declare idTemp int;
  -- Variable para control de filas leídas
  declare hayFilasSinLeer boolean default true;

  -- Cursor para leer 
  declare jugadoresDeEquipo cursor for 
      select id, concat(nombre, ' ', apellido) from jugador where equipo = eq;
  
  -- Handler para manejar error de filas no encontradas en FETCH
  declare continue handler for not found set hayFilasSinLeer = false;
      
  open jugadoresDeEquipo;
  
    while hayFilasSinLeer do
    
      fetch jugadoresDeEquipo into idTemp, nombreTemp;
      
      if hayFilasSinLeer then
	select idTemp as 'codigo', nombreTemp as 'nombrecillo';
      end if;
      
    end while;
    
  close jugadoresDeEquipo;

end]]

delimiter ;

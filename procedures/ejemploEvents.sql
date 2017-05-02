delimiter ]]

drop event if exists copiaSeguridadPartidos]]
create event copiaSeguridadPartidos
  on schedule
    every 1 week
    starts '2017-09-01 22:00'
    ends '2018-06-30 23:00'
  on completion preserve 
  comment 'Volcado de seguridad de partidos jugados, cada domingo a las 22h'
  
  do
    
    begin
    
      -- Creando tabla temporal si no existe para comenzar a almacenar los datos de partidos:
      create table if not exists partidosTMP (eloc smallint(6), evis smallint(6), result char(7), fechaPartido date, arbitradoPor smallint(6));
      
      -- Insertando datos:
      insert into partidosTMP
	  select elocal, evisitante, resultado, fecha, arbitro from partido
	      where fecha > (select max(fechaPartido) from partidosTMP);
	    
    end]]
    
drop event if exists AumentarSueldoCadaMinuto]]
create event AumentarSueldoCadaMinuto
  on schedule
    every 1 minute
    starts current_timestamp + interval 1 minute
    ends current_timestamp + interval 2 minute   
  on completion not preserve
  comment 'Aumentando el sueldo de todos los jugadores cada minuto'
  
  do
    
    begin
    
      update jugador set salario = salario * 1.10;
    
    end]]
      
delimiter ;
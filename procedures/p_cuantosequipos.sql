delimiter ]]

drop procedure if exists cuantosEquipos]]
create procedure cuantosEquipos(out nEquipos int)
comment '¿Cuantos equipos hay en liga?'

begin

  select count(*) into nEquipos from equipo;

end]]

delimiter ;
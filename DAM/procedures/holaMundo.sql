delimiter [[

drop procedure if exists holaMundo[[

create procedure holaMundo()
comment 'Saludando a la consola'
sql security invoker
begin

  select '¡hola mundo!';

end[[

delimiter ;

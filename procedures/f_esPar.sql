delimiter ]]

drop function if exists esPar]]

create function esPar(numero char(32))
returns bool
comment '¿Es par?'
deterministic

begin
  
  declare resultado bool;
  
  if convert(numero, signed) not like numero or numero is null then
    set resultado = null;
  elseif numero % 2 = 0 then
    set resultado = true;
  else
    set resultado = false;
  end if;
  
  return resultado;
  
end]]

delimiter ;
delimiter ]]

drop procedure if exists p_proc]]
create procedure p_proc(in p int)
comment 'Ejemplo para parámetro de entrada (IN)'

begin

  select concat("El valor que has introducido es ", p) as "Procedimiento com parámetro IN";

end]]

drop procedure if exists p_proc2]]
create procedure p_proc2(in entrada int, out mitad int, out doble int)
comment 'Ejemplo para parámetro de salida (OUT)'

begin

  
  set mitad = entrada / 2;
  set doble = entrada * 2;

end]]

drop procedure if exists p_proc3]]
create procedure p_proc3(inout p int)
comment ''

begin

  set p = p * 2;

end]]

drop procedure if exists p_proc4]]
create procedure p_proc4()
comment 'Ejemplo de alcance de variables'

begin

  declare x1 char(25) default 'Fuera de ambito';
  
  begin
  
    declare x1 char(25) default 'Dentro de ambito';
    select x1;
  
  end;
  
  select x1;
  
end]]

drop procedure if exists p_proc5]]
create procedure p_proc5(in param1 int)
comment 'Ejemplo de uso para estructura CASE'

begin

  case param1
    when 0 then
      insert into tablita values (-1);
    when 1 then
      insert into tablita values (param1);
    else
      insert into tablita values (param1 * 100);
  end case;
  
end]]

drop procedure if exists p_proc6]]
create procedure p_proc6(in hasta int)
comment 'Ejemplo de uso para estructura LOOP'

begin

  declare contador int;
  set contador = hasta;

  bucleConSalida: loop
  
    select concat('LOOP: Valor de contador: ', contador);
    set contador = contador - 1;
    
    if contador <= 0 then
      leave bucleConSalida;
    end if;
    
  end loop bucleConSalida;
  
end]]

drop procedure if exists p_proc7]]
create procedure p_proc7(in hasta int)
comment 'Ejemplo de uso para estructura REPEAT UNTIL'

begin

  declare contador int;
  set contador = hasta;

  repeat
  
    select concat('REPEAT UNTIL: Valor de contador: ', contador);
    set contador = contador - 1;
  
  until contador <= 0 end repeat;
  
end]]

drop procedure if exists p_proc8]]
create procedure p_proc8(in hasta int)
comment 'Ejemplo de uso para estructura WHILE'

begin

  declare contador int;
  set contador = hasta;
  
  while contador > 0 do
  
    select concat('WHILE: Valor de contador: ', contador);
    set contador = contador - 1;
    
  end while;
  
end]]

delimiter ;

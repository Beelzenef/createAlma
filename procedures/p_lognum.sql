delimiter ]]

drop table if exists logNum]]
create table logNum (pares int, impares int)]]

drop procedure if exists insertar]]
drop procedure if exists insertarNum]]
create procedure insertarNum(p1 char(32))
comment 'Insertando resultados pares o impares'

begin

  if esPar(p1) is not null then
    if esPar(p1) then
      insert into logNum(pares, impares) values (p1, null);
    else
      insert into logNum(pares, impares) values (null, p1);
    end if;
  end if;
  
end]]

delimiter ;
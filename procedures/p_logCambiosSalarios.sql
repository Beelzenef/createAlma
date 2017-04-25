delimiter ]]

use liga]]

drop table if exists logCambios]]
create table logCambios
(
  fecha date,
  hora time,
  usuario varchar(30),
  ip char(32),
  id smallint(6)
) engine = myisam]]

create user liga_usr@'%' identified by '123']]
show grants for liga_usr]]
grant insert on liga.logCambios to liga_usr]]
grant select, update, delete, insert on liga.jugador to liga_usr]]
grant trigger on liga.* to liga_usr]]

insert into logCambios values (date(now()), time(now()),
                              substring_index(current_user(), '@', 1), substring_index(current_user(), '@', -1), 596)]]
insert into logCambios values (date(now()), time(now()), substring_index(current_user(), '@', 1),
    (select host from information_schema.processlist where id = connection_id()), 596)]]
    
select host from information_schema.processlist where id = connection_id()]]

drop trigger if exists AU_CambiarSalario]]
create trigger AU_CambiarSalario after update on jugador
  for each row
  
  begin
    
    if (new.salario >= 1.20 * old.salario) or (new.salario <= 0.80 * old.salario) then
      insert into logCambios values (date(now()),
				      time(now()),
				      substring_index(current_user(), '@', 1),
				      (select host from information_schema.processlist where id = connection_id()),
				      new.id);
    end if;
    
  end]]

delimiter ;

delimiter ]]

drop trigger if exists BU_ActualizarWebEquipo]]
create trigger BU_ActualizarWebEquipo before update on equipo
  for each row
  
  begin
  
    if new.web_oficial is not null then
	if new.web_oficial not rlike '^http://' or new.web_oficial not rlike '^https://' then
	  set new.web_oficial = concat('https://', new.web_oficial);
	end if;
    else
	set new.web_oficial = '<desconocido>';
    end if;
  
  end]]
  
drop trigger if exists BI_InsertarWebEquipo]]
create trigger BI_InsertarWebEquipo before insert on equipo
  for each row
  
  begin
  
    if new.web_oficial is not null then
	if new.web_oficial not rlike '^http://' or new.web_oficial not rlike '^https://' then
	  set new.web_oficial = concat('https://', new.web_oficial);
	end if;
    else
	set new.web_oficial = '<desconocido>';
    end if;
  
  end]]

delimiter ;
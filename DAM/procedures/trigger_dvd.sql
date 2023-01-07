delimiter ]]

drop trigger if exists BI_AnadirDVD]]
create trigger BU_AnadirDVD before update on dvd
for each row

  begin
  
      if new.anio < 1920 then
	set new.anio = 1920;
      elseif new.anio > year(now()) then
	set new.anio = year(now());
      end if;
  
  end]]

delimiter ;
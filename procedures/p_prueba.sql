delimiter ]]

drop procedure if exists p_prueba]]
create procedure p_prueba(in p int)
comment 'Ejemplo para parámetro de entrada (IN)'

begin

  select concat("El valor que has introducido es ", p) as "Procedimiento com parámetro IN";

end]]

drop procedure if exists p_prueba2]]
create procedure p_prueba2(in entrada int, out mitad int, out doble int)
comment 'Ejemplo para parámetro de salida (OUT)'

begin

  
  set mitad = entrada / 2;
  set doble = entrada * 2;

end]]

delimiter ;
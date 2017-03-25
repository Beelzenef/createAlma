delimiter ]]

drop function if exists elegirClase]]
create function elegirClase(opcion char(1))
returns varchar(20)
comment 'opciones: "M" - Mago, "P" - Picaro, "G" - Guerrero'
deterministic

begin
	declare clase varchar(20);

	if opcion = 'M' then
		set clase = 'mago';
	elseif opcion = 'p' then
		set clase = 'picaro';
	elseif opcion = 'G' then
		set clase = 'guerrero';
	else
		set clase = 'sin clase';
	end if;

	return clase;

end]]

delimiter ;

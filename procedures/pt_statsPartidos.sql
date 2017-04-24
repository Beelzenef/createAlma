use liga;

delimiter ]]

drop procedure if exists InicializarStats]]
create procedure InicializarStats()
comment 'Inicializar estadísticas de victorias'

	begin

	-- Variables que almacenarán FETCH
	declare localTMP int;
	declare visitanteTMP int;
	declare ganaLocal boolean;

	-- Variables que marcan final de lectura:
	declare finLectura boolean default false;
	
	declare busquedaPartidos cursor for
		select p.elocal, p.evisitante, p.elocal > p.evisitante
			from
				(select elocal, evisitante, cast(substring_index(resultado, '-', 1) as integer) as mLocal,
					cast(substring_index(resultado, '-', -1) as integer) as mVisitante
						from partido) as p where mLocal <> mVisitante;
	
	declare continue handler for not found set finLectura = true;

	truncate stats;
	insert into stats (idEquipo)
	    select distinct id from equipo;
	
	open busquedaPartidos;

	while not finLectura do
		fetch busquedaPartidos into localTMP, visitanteTMP, ganaLocal;
		if not finLectura then
			if ganaLocal then
				update stats set victoriasLocales = victoriasLocales + 1
					where idEquipo = localTMP;
			else
				update stats set victoriasVisitantes = victoriasVisitantes + 1
					where idEquipo = visitanteTMP;
			end if;
		end if;
	end while;
	
	close busquedaPartidos;

	end]]

drop trigger if exists AI_InsertarPartido]]
create trigger AI_InsertarPartido after insert on partido
  for each row
  
  begin
    
      if (cast(substring_index(new.resultado, '-', 1) as integer) > cast(substring_index(new.resultado, '-', -1) as integer)) then
	  update stats set victoriasLocales = victoriasLocales + 1 where idEquipo = new.elocal;
      else
	  update stats set victoriasVisitantes = victoriasVisitantes + 1 where idEquipo =  new.evisitante;
      end if;
      
  end]]

drop trigger if exists AU_ActualizarPartido]]
create trigger AU_ActualizarPartido after update on partido
  for each row
  
  begin
  
  end]]

drop trigger if exists AD_EliminarPartido]]
create trigger AD_EliminarPartido after delete on partido
  for each row
  
  begin
  
  end]]
	
delimiter ;
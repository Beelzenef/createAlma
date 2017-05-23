-- Elena Guzman Blanco 2016/2017

delimiter ]]

create database if not exists examen3eval]]
use examen3eval]]

-- 1. Procedimiento para el cálculo de dias pasados desde una fecha, ya sea en el pasado o en el futuro

drop procedure if exists diasPasados]]
create procedure diasPasados (fecha date)
comment 'Dias pasados desde la fecha'
	begin

		declare fechaEsNull condition for sqlstate '26000';

		if fecha is null then
			signal fechaEsNull
				set message_text = 'ERROR 2222 (26000): Fecha invalida';
		elseif fecha > current_date() then
			select concat('Falta(n) ', date(fecha) - current_date(), ' día(s) para la fecha dada') as 'Fecha futura';
		elseif fecha < current_date() then		
			select concat('Ha(n) transcurrido ', current_date() - date(fecha), ' día(s) desde la fecha dada') as 'Fecha pasada';
		end if;

	end ]]



-- 2. Triggers para control de máximo 5 jugadores en cada equipo

-- Creacion de tabla:

drop table if exists jugador]]
create table jugador (
	id char(4),
	nombre varchar(15), 
	capitan char(4), 
	primary key (id),
	foreign key (capitan) references jugador (id)
		on delete cascade
)]]

-- Datos para pruebas

insert into jugador values ('1', 'Juan Fran Benitez', '1')]]
insert into jugador values ('2', 'Alejandro Mechiné', '1')]]
insert into jugador values ('3', 'Elena G', '1')]]
insert into jugador values ('4', 'Andrés Bujalance', '1')]]
insert into jugador values ('5', 'Eliseo Moreno', '1')]]

-- Control en triggers de inserciones y modificaciones

drop trigger if exists bi_cincoJugadoresMaximo]]
create trigger bi_cincoJugadoresMaximo
	before insert on jugador
		for each row

		begin

		declare cincoJugadoresMaximo condition for sqlstate '77777';

		if (select count(*) from jugador where capitan = new.capitan) >= 5 then
			signal cincoJugadoresMaximo
				set message_text = 'ERROR: El número máximo de jugadores permitidos para cada capitán es de 5';
		end if;

		end]]

drop trigger if exists bu_cincoJugadoresMaximo]]
create trigger bu_cincoJugadoresMaximo
	before update on jugador
		for each row
		
		begin

		declare cincoJugadoresMaximo condition for sqlstate '77777';

		if (select count(*) from jugador where capitan = new.capitan) >= 5 then
			signal cincoJugadoresMaximo
				set message_text = 'ERROR: El número máximo de jugadores permitidos para cada capitán es de 5';
		end if;

		end]]

-- 4. Procedimiento para el cálculo de promedios de alumnos



-- Creacion de tablas:
drop table if exists nota;
create table nota (
	fecha date,
	alumno varchar(100),
	nota decimal(2, 1)
);
create table if not exists promedio (
		alumno varchar(100),
		mediaAprobado decimal(2,1),
		mediaSuspenso decimal(2,1),
		foreign key (alumno) references nota (alumno)
			on update cascade
			on delete restrict
);

-- Datos de prueba:

insert into nota values (current_date(), '1', 5);
insert into nota values (current_date(), '1', 3);
insert into nota values (current_date(), '1', 6);
insert into nota values (current_date(), '1', 2);
insert into nota values (current_date(), '2', 4);
insert into nota values (current_date(), '2', 8);
insert into nota values (current_date(), '2', 5);

insert into promedio values ('1', 0, 0);
insert into promedio values ('', 0, 0);

-- Creacion del procedimiento
drop procedure if exists actualizarPromedio]]
create procedure actualizarPromedio(alum varchar(100))
comment 'Calculo de medias para todos los alumnos, ya sean aprobados o suspensos'
	begin
	
	-- Variable para final de bucle de cursor
	declare filasSinLeer bool default true;
	
	-- Variables para calculo de promedios
	declare notaAEvaluar decimal(2,1) default 0;

	declare sumatorioAprobadas decimal(2, 1) default 0.0;
	declare sumatorioSuspensas decimal(2 ,1) default 0.0;

	-- Declaracion de cursor y handler
	declare lectorNotas cursor for select nota from nota where alumno = alum;
	declare continue handler for not found set filasSinLeer = false;

	-- Si no existe el alumno, no se inicia la lectura
	if (select not exists (select * from nota where alumno = alum)) then
			select 'Alumno no encontrado' as 'Un error con el alumno';
	else	
		-- Apertura de cursor:
		open lectorNotas;

		-- Bucle de lectura:
		while filasSinLeer do
			fetch lectorNotas into notaAEvaluar;
			if notaAEvaluar >= 5 then
				set sumatorioAprobadas = sumatorioAprobadas + notaAEvaluar;
			else
				set sumatorioSuspensas = sumatorioSuspensas + notaAEvaluar;
			end if;	

		end while;

		-- Cierre de cursor:
		close lectorNotas;

		-- Actualizacion y notificacion final:
		update promedio set mediaSuspenso = (sumatorioSuspensas / (select count(*) from nota where alumno = alum and nota < 5)) where alumno = alum;
		update promedio set mediaAprobado = (sumatorioAprobadas / (select count(*) from nota where alumno = alum and nota >= 5)) where alumno = alum;

		select concat('Se actualizó el registro de: ', alum) as 'Actualizacion finalizada';
	end if;
	
	end]]

delimiter ;

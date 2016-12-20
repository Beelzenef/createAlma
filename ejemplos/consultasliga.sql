-- Selecciona el jugador con menos antiguedad
select nombre, apellido, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad limit 1;

-- Selecciona el jugador con mas antiguedad
select nombre, apellido, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad desc limit 1;

-- Selecciona id, nombre, apellido, fecha de alta y años en el equipo, ordenados por antiguedad descendente
select id, nombre, apellido, fecha_alta, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad desc;

-- Datos de jugador con mínima antiguedad
select id, nombre, apellido, fecha_alta from jugador where fecha_alta = (select max(fecha_alta) from jugador);

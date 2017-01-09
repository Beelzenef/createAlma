-- Selecciona el jugador con menos antiguedad
select nombre, apellido, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad limit 1;

-- Selecciona el jugador con mas antiguedad
select nombre, apellido, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad desc limit 1;

-- Selecciona dorsal, nombre, apellido, fecha de alta y años en el equipo, ordenados por antiguedad descendente
select id, nombre, apellido, fecha_alta, year(now()) - year(fecha_alta) as antiguedad from jugador order by antiguedad desc;

-- Datos de jugador con mínima antiguedad
select id, nombre, apellido, fecha_alta from jugador where fecha_alta = (select max(fecha_alta) from jugador);

-- Seleccionando equipos que no sean de Madrid o Valencia
select * from equipo where ciudad <> 'Valencia' and ciudad <> 'Madrid';
select * from equipo where ciudad not in ('Valencia', 'Madrid');
select * from equipo where ciudad not in (select ciudad from equipo where ciudad = 'Madrid');

-- Seleccionando jugadores que sean bases o aleros
select nombre, apellido from jugador where puesto in ('base', 'alero');
select nombre, apellido from jugador where puesto = 'base' or puesto = 'alero';
-- Con formato de cadena
select concat(nombre, ' ', apellido) as jugador from jugador where puesto = 'base' or puesto = 'alero';
select concat(nombre, ' ', apellido) as jugador from jugador where puesto in ('base', 'alero');
-- Ordenando, además, por puestos
select concat(nombre, ' ', apellido) as jugador from jugador where puesto in ('base', 'alero') order by puesto;

-- Seleccionando a los jugadores con altura entre 1.86 y 2.00 metros
select concat(nombre, ' ', apellido) as jugador, altura from jugador where altura >= 1.86 and altura <= 2.00;
select concat(nombre, ' ', apellido) as jugador, altura from jugador where altura between 1.86 and 2.00;

-- Seleccionando a los jugadores más altos y a los más bajos
select nombre, apellido, altura from jugador where altura >= 2.00 or altura <= 1.87;
select nombre, apellido, altura from jugador where altura not between 1.87 and 2.00;

-- Partidos dados en Octubre de 2011
select * from partido where fecha between '2011-10-01' and '2011-10-31';
select * from partido where month(fecha) = 10 and year(fecha) = 2011;
select * from partido where fecha >= '2011-10-01' and fecha <= '2011-10-31';

-- Selecciona jugadores cuyo apellido acabe con 'mer'
select * from jugador where apellido like '%mer';

-- Selecciona jugadores que se llamen 'Rafa'
select * from jugador where nombre like 'rafa';
select * from jugador where nombre = 'rafa';

-- Selecciona parametros varios para nombres de jugadores
select * from jugador where nombre like 'a%';
select * from jugador where nombre like '%a';
select * from jugador where nombre like '%z%';
select * from jugador where nombre like '_i%';

-- Selecciona a los jugadores con nombre de longitud 4
select * from jugador where nombre like '____';
select * from jugador where length(nombre) = 4;

-- Selecciona los equipos cuya web contenga triple W
select * from equipo where web_oficial like '%www%';

-- Selecciona URLs de equipo mal escritas
select * from equipo where web_oficial not like 'http%://%';

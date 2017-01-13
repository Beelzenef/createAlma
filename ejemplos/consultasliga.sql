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

-- Jugadores que juegan como pivots y ganen mas de 100.000
select * from jugador where puesto = 'pivot' and salario > 10000;

-- Pivots de equipos 2 y 4
select * from jugador where puesto = 'pivot' and (equipo = 2 or equipo = 4);
select * from jugador where puesto = 'pivot' and equipo in (2, 4);

-- Contando filasselee
select count(*) from jugador;
select count(*) from jugador where equipo = 4;

-- Jugadores del equipo 3 ordenados por apellidos
select * from jugador where equipo = 3 order by apellido;

-- Jugadores más altos de 2 metros y que ganen menos de 40.000 €
select * from jugador where altura > 2 and salario < 40000;

-- Partidos jugados en febrero
select * from partido where month(fecha) = 2;

-- Capitanes de equipo
select * from jugador where capitan = id;

-- Equipos con sitios web sin 'www'
select * from equipo where web_oficial not like '%www%';

-- Equipos con sitios web sin 'www' o directamente NULL
select * from equipo where web_oficial not like '%www%' or where web_oficial is null;

-- Equipos con sitios web que contengan '.com'
select * from equipo where web_oficial like '%.com%';

-- Equipos con sitios web que terminen en .com o tengan directorios despues de .com
select * from equipo where web_oficial rlike '\\.com$' or web_oficial like '%.com/%';

-- Equipos con sitios web con estructura 'http://x/y'
select * from equipo where web_oficial like 'http://%/%';

-- Equipos con sitios web con la estructura "http://x.y.z/abc"
select * from equipo where web_oficial rlike '^http://[A-z0-9]+\\.[A-z0-9]+\\.[A-z0-9]+/';

-- Seleccionar a los jugadores que sean más altos
select * from jugador where altura = (select max(altura) from jugador);

-- Seleccionar a los jugadores que sean más bajos
select * from jugador where altura = (select min(altura) from jugador);

-- Media de altura de jugadores
select avg(altura) from jugador;
select round(avg(altura),2) from jugador as alturaMedia;

-- Suma de alturas de equipo 2
select sum(altura) from jugador where equipo = 1;
select concat(sum(altura), ' ', 'metros') as alturaTotal from jugador where equipo = 2;

-- Obtiene el salario máximo, el mínimo y la diferencia entre ellos como "diferencia salarial"
select max(salario) as maximo, min(salario) as minimo, max(salario) - min(salario) as difSalarial from jugador;

-- ¿Cuantas ciudades de equipos hay?
select count(distinct(ciudad)) as ciudadesConEquipos from equipo;

-- Sueldo medio mensual de cada jugador suponiendo un IRPF de 21%
select avg(salario * 0.79 / 12) as salarioMedioNeto from jugador;

-- Salario bruto
select concat(nombre, ' ', apellido) as jugador, salario as salarioBruto, round(salario * 0.79 / 12, 0) as salarioNeto from jugador;

-- ¿Cuantos jugadores hay en cada equipo?
select equipo, count(*) as numeroJugadores from jugador group by equipo;

-- ¿Cuantos jugadores hay que midan más de 1.90?
select count(*) from jugador where altura > 1.90;

-- ¿Cuantos jugadores hay que midan más de 1.90 en cada equipo?
select equipo, count(*) from jugador where altura >= 1.90 group by equipo;

-- ¿Cuantos jugadores hay que midan más de 1.90 en los equipos 1 (Madrid) y 2 (Barcelona)?
 select equipo, count(*) from jugador where altura > 1.90 && equipo in (1, 2) group by equipo;
 
-- Salario minimo y máximo de cada equipo
select equipo, max(salario), min(salario) from jugador group by equipo;

-- Seleccionar la media de salario de los equipos que superen de media los 80.000
select equipo, avg(salario) as sueldoMedio from jugador group by equipo having sueldoMedio > 80000;

-- ¿Cuantos partidos se jugaron en noviembre?
select count(*) from partido where month(fecha) = 11;

-- Fichas de los jugadores mas altos
select * from jugador where altura = (select max(altura) from jugador);

-- Fichas de los jugadores mas bajos o con valores NULL
select * from jugador where altura = (select min(altura) from jugador) or altura is null;

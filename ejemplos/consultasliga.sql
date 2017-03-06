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

-- FUNCIONES DE AGREGADO

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

-- SUBCONSULTAS

-- Jugadores que cobran más que Carlos Cabezas
select nombre, apellido, salario from jugador where salario > (select salario from jugador where nombre = 'carlos' and apellido = 'cabezas');

-- ¿Cuantos jugadores de cada equipo cobran más que la media de todos los salarios?
select equipo, count(*) as nJugadores from jugador where salario > (select avg(salario) from jugador) group by equipo;

-- Fichas de jugadores que ganen más que todos los jugadores del equipo 2
select equipo, salario, nombre, apellido from jugador where salario > all (select salario from jugador where equipo = 2);

-- Fichas de jugadores que ganen más que todos los jugadores del Real Madrid
select equipo, salario, nombre, apellido from jugador where salario > all (select salario from jugador where equipo = (select id from equipo where nombre like '%madrid%'));

-- Fichas de jugadores que ganen más que cualquiera de los jugadores del Barcelona
select equipo, salario, nombre, apellido from jugador where salario > any (select salario from jugador where equipo = (select id from equipo where nombre like '%barcelona%'));

-- Datos de jugadores que jueguen en Madrid
select * from jugador where equipo = any (select id from equipo where ciudad = 'Madrid');
select * from jugador where equipo in (select id from equipo where ciudad = 'Madrid');

-- Datos de jugadores que jueguen en Madrid y que este equipo tenga pagina web
select * from jugador where equipo in (select id from equipo where ciudad = 'Madrid' and web_oficial is not null);

-- CONSULTAS CORRELACIONADAS

-- Muestra todos los jugadores siempre y cuando haya mas de 10 equipos
select * from jugador where (select count(*) from equipo) >= 10;
select * from jugador where exists (select count(*) from equipo having count(*) >= 10);

-- Toma todos los jugadores que midan más que la media de todos los jugadores de su propio equipo:
select * from jugador j where altura > (select avg(altura) from jugador where equipo = j.equipo);

-- Obten informacion de equipos con más de 2 jugadores
select * from equipo e where (select count(*) from jugador j where j.equipo = e.id) > 2;

-- Obten todos los datos de los capitanes de cada equipo
select * from jugador where id = capitan;

-- Usando el predicado IN, obten todos los datos de los capitanes de cada equipo
select * from jugador where id in (select capitan from jugador);
select * from jugador where id in (select capitan from jugador where capitan is not null);

-- Usando el predicado EXITS, obten todos los datos de los capitanes de cada equipo
select * from jugador j1 where exists (select * from jugador j2 where j1.id = j2.capitan);

-- Obten toda la informacion de los jugadores que no son capitanes
select * from jugador j1 where not exists (select * from jugador j2 where j1.id = j2.capitan);

-- Obten los datos de los jugadores junto al salario medio de su equipo y la diferencia de su salario con la de su equipo
select nombre, equipo, salario, round((select avg(salario) from jugador j2 where j1.equipo = j2.equipo),2) as salarioMedioEquipo,
    (select avg(salario) - salario where j1.equipo = j2.equipo) from jugador j1;

-- Obtener el maximo salario medio de todos los equipos 
select max(sumaSalarios) from (select sum(salario) as sumaSalarios from jugador group by equipo) as tablaDerivada;

-- Jugadores mas altos:
select * from jugador where altura = (select max(altura) from jugador);

-- ¿Cuanto suman en altura los jugadores del "CAI" y "Madrid"?
select sum(altura) as SUMA from jugador where equipo in (select id from equipo where nombre like '%madrid%' or nombre like '%cai%');

-- Datos de jugadores que hayan compitieran como locales contra equipo de Vitoria
select id, nombre, apellido, equipo from jugador where equipo in (select elocal from partido where evisitante in (select id from equipo where ciudad like '%vitoria%'));

-- Jugadores más altos que todos los jugadores más altos de todos los jugadores del 'Caja Laboral':
select * from jugador where altura > (select max(altura) from jugador where equipo = (select id from equipo where nombre like '%caja laboral%'));

-- Jugadores que cobran más que los capitanes de su propio equipos
select * from jugador j1 where salario > (select salario from jugador j2 where j1.capitan = j2.id);

-- ¿Qué equipo ha jugado más partidos?
select t1.elocal, count(*) from select (select elocal from partido union all select evisitante from partido) as t1 group by elocal;

select elocal from (select elocal, count(*) as MAX 
    from (select elocal from partido union all select evisitante from partido) as t1 group by elocal) as t2 where t2.MAX = 
	(select max(MAXIMO) from (select elocal, count(*) as MAXIMO from (select elocal from partido union all select evisitante from partido) as t3 group by elocal) as t4);
	
-- Datos de jugadores mejor y peor pagados
select * from jugador where salario = (select max(salario) from jugador) or salario = (select min(salario) from jugador);
select * from jugador where salario in ((select max(salario) from jugador), (select min(salario) from jugador));

-- JOINS

-- Muestra todas las combinaciones posibles entre las filas de la tabla jugador (14 filas) y las de la tabla equipo (9 filas). Resultado = 14 * 9 = 126 posibilidades.

     select * from jugador, equipo;

-- Muestra todos los posibles partidos que podrían haber entre los equipos de la tabla equipo, eliminando los casos en los que se repite el mismo equipo para ambos bandos.

     select * from equipo e1, equipo e2 where e1.id <> e2.id;

--Muestra una lista con todos los jugadores de la lista jugador y el equipo al que pertenecen.

     select j.id, j.nombre, j.apellido, e.nombre from jugador j, equipo e where j.equipo = e.id;

-- El comando JOIN combina dos tablas siguiendo una condición especificada en una consulta en caso de que tengamos que llamar a muchas tablas, y haya que revisar muchas opciones.

-- Muestra una lista con todos los jugadores de la lista jugador y el equipo al que pertenecen utilizando el comando INNER JOIN.

     select j.id, j.nombre, j.apellido, e.nombre from jugador j inner join equipo e on j.equipo = e.id;

-- Muestra una lista con todos los jugadores de la lista jugador y que pertenezcan al Barcelona o al Madrid utilizando el comando INNER JOIN.

     select j.id, j.nombre, j.apellido, e.nombre from jugador j inner join equipo e on j.equipo = e.id and (e.nombre like '%barcelona%' or e.nombre like '%madrid%');

-- Podemos aclarar aún más esta consulta, agrupando en una tabla los datos de los equipos que cumplan con las condiciones especificadas.

     select j.id, j.nombre, j.apellido, e.nombre from jugador j inner join (select * from equipo where nombre like '%barcelona%' or nombre like '%madrid%') as e on
     j.equipo = e.id;

-- En este caso vamos a actualizar la tabla con algunos valores en NULL, y usaremos el comando LEFT JOIN, que es más potente que el anterior, ya que tiene un especial tratamiento para los valores NULL.
-- Mostrar el listado de todos los equipos y de aquellos que tengan jugadores, quiénes son y cómo se llaman.

     update jugador set equipo = null where id in (1,2);
     select j.id, j.nombre, j.apellido, e.nombre from jugador j left join equipo e on j.equipo = e.id;

-- Datos de cada equipo y número de partidos que han jugador como locales.

     select e.id, e.nombre, count(*) nPartidosLocales from equipo e inner join partido p on p.elocal = e.id group by e.id;

-- Datos de equipos que tengan más de tres jugadores dados de alta (dos formas).
-- Volvemos a actualizar los valores de la taba jugador para que no hayan valores en NULL.

update jugador set equipo = 2 where id = 2;
update jugador set equipo = 1 where id = 1;
     
select e.id, e.nombre, count(*) as numJ from equipo e inner join jugador j on j.equipo = e.id group by e.id having count(*) > 2;
select e.id, e.nombre from equipo e where exists (select count(*) from jugador j where j.equipo = e.id group by e.id having count(*) > 2);
    
-- Datos de todos los equipos y partidos que han jugado como locales
select e.id, e.nombre, p.resultado, p.fecha, p.arbitro from equipo e join partido p on e.id = p.elocal;

-- De cada equipo, obten los datos del eequipo y el máximo sueldo que tiene el mismo
select e.id, e.nombre, max(j.salario) as mejorSueldoDeEquipo from equipo e join jugador j on j.equipo = e.id group by e.id;

-- Datos de partidos con más puntos obtenidos en total
select * from partido where substring_index(resultado, '-', 1) + substring_index(resultado, '-', -1) = (select max(substring_index(resultado, '-', 1) + substring_index(resultado, '-', -1)) from partido);

-- Nombre de cada equipo y numero de victorias que ha conseguido
select e.id, e.nombre, ((select sum(substring_index(resultado, '-', 1)) from partido p1 where p1.elocal = e.id) + (select sum(substring_index(resultado, '-', -1)) from partido p2 where p2.evisitante = e.id)) as puntosTotales from equipo e;
select e.nombre, count(*) from equipo e join partido p on (p.elocal = e.id or e.id = p.evisitante) where (substring_index(p.resultado, '-', 1) - substring_index(resultado, '-', -1) > 0 and e.id = p.elocal) or (substring_index(p.resultado, '-', -1) - substring_index(resultado, '-', 1) > 0) group by e.id;

-- Para cada equipo, nombre de su capitan
select e.nombre, j.nombre, j.apellido from equipo e join jugador j on e.id = j.equipo and j.capitan = j.id;
select e.nombre, j.nombre, j.apellido from equipo e join jugador j on e.id = j.equipo where j.capitan = j.id;

-- Ids de equipos que hayan jugado como locales y también como visitantes
select distinct p1.elocal from partido e1 join partido p2 on p1.elocal = p2.evisitante;

-- MODIFICACIONES DE DATOS Y TABLAS

create table t (c char);
insert into t values ('d'), ('e'), ('f');
select * from t;
describe t;
alter table t add primary key (c);
describe t;
insert into t values ('c');
insert into t values ('c') on duplicate key update c = select concat('c', 1);
alter table t modify c char(5);
insert into t values ('c') on duplicate key update c = (select concat('c', 1));
alter table t add column c1 char(10) null;
insert into t (c) values ('d') on duplicate key update c = (select concat('d', 1));
insert into t (c) values ('e') on duplicate key update c = (select concat('e', 1)), c1 = 'hey';

-- Dada una fecha de nacimiento cualquiera, ¿podemos calcular la edad?
select year(curdate()) - year('1993-05-05') - (right(curdate(), 5) < right('1993-05-05', 5));

-- Añadiendo campos virtuales, ¿es posible?
alter table jugador add fecha_nac date after apellido;
update jugador set fechaNac = '1993-02-02';

-- Por documentación, determinado como innecesario:
-- alter table jugador add column edad int(3) as (timestampdiff(year,fechaNac,curdate())) virtual);

-- Consulta con edad como un campo calculado
select id, nombre, apellido, (year(curdate()) - year(fecha_nac) - (right(curdate(), 5) < right(fecha_nac, 5))) as edad from jugador;

-- Creando una vista para informacion virtual, campos calculados 
create view bdays as (select id, nombre, apellido, fecha_nac, (year(curdate()) - year(fecha_nac) - (right(curdate(), 5) < right(fecha_nac, 5))) as edad from jugador);
show tables;
select * from bdays;
update bdays set fecha_nac = '1997-11-11' where id = 14;
select * from bdays;
insert into jugador values (15, 'Juan Manuel', 'Lobato', '1990-02-03', 1.92, 10, 'Pivot', curdate(), 10000, 5);
select * from bdays;
drop view bdays;
create view bdays as (select id, concat(apellido, ', ', nombre) as nombre, fecha_nac, (year(curdate()) - year(fecha_nac) - (right(curdate(), 5) < right(fecha_nac, 5))) as edad from jugador);

-- Creando indices
desc jugador;
create index iApellido on jugador (apellido);
desc jugador;

-- Eliminando y reconstruyendo indices
show create table jugador;
alter table jugador drop index `iApellido`;
create index iApellido on jugador (apellido, nombre);

-- Creando tablas a partir de consultas
create table jugadores select * from jugador;
describe jugadores;
truncate jugadores;
insert into jugadores select * from jugador;

-- Reemplazando registros...
replace into jugadores (id, nombre, apellido) values (14, 'Sitaphar', 'Savanél');
select * from jugadores;
-- ... que como es una tabla creada a partir de una consulta, no tiene claves primarias asignadas
alter table jugadores add primary key (id);

-- Buscando datos duplicados con datos idénticos
select j1.nombre, j1.apellido, j1.id from jugadores j1 join jugador j2 on j1.id = j2.id group by j1.id having count(*) > 1;
-- Buscando datos duplicados en clave pero con datos que difieren
select j1.nombre, j1.apellido, j1.id from jugadores j1 join jugador j2 on j1.id = j2.id and j1.nombre <> j2.nombre;

-- Ejemplo con JOINS

-- Creacion de tablas:
create table t1 (a char(1), b char(1));
create table t2 (c char(1), d char(1));

-- Insertando datos:
insert into t1 values (3, 1);
insert into t1 values (2, 4);
insert into t1 values (5, 9);
insert into t2 values (2, 'x');
insert into t2 values (3, 'w');

-- JOIN y LEFT JOIN:
select tb1.a, tb1.b, tb2.c, tb2.d from t1 tb1 join t2 tb2 on tb1.a = tb2.c;
select tb1.a, tb1.b, tb2.c, tb2.d from t1 tb1 left join t2 tb2 on tb1.a = tb2.c;

-- REPLACE vs INSERT
truncate table jugadores;
desc jugadores;
insert into jugadores select * from jugador where year(fecha_nac) <= '1990';
alter table jugadores add primary key (id);
desc jugadores;
insert into jugadores (id, nombre, apellido) values (13, 'Elena', 'G');
replace into jugadores (id, nombre, apellido) values (13, 'Elena', 'G');

-- Exportando tablas:
select * from jugadores into outfile '/tmp/jugador.sql';
select * from jugador into outfile '/tmp/jugador.csv' fields terminated by ';';
 select * from jugador into outfile '/tmp/jugadores.csv' fields terminated by ';' enclosed by '"';

-- IMPORTANDO DESDE CSV

-- Creando tabla objetivo de inyección
create table personajes
(
  id int primary key,
  nombre varchar(10) not null,
  clase varchar(10) not null,
  nivel int not null
);
desc personajes;

-- Cargando datos
load data local infile 'personajes.csv' into table personajes fields terminated by ';' enclosed by '"' ignore 1 lines;
select * from personajes;

-- Creando tabla objetivo de inyección con un nuevo campo
drop table if exists personajes;
create table personajes
(
  id int primary key,
  nombre varchar(10) not null,
  clase varchar(10) not null,
  nivel int not null,
  fecha date not null
);

load data local infile 'personajes2.csv' into table personajes fields terminated by ';' enclosed by '"' ignore 1 lines;
select * from personajes;

-- Importacion desde XML
load xml local infile 'personajes.xml' into table personajes rows identified by '<personaje>';

-- Subir un 10% de salarios a los jugadores del equipo 5:
select * from jugador where equipo = 5;
update jugador set salario = salario * 1.10 where equipo = 5;

-- Añadir 
alter table equipo add idcapitan smallint(6) after nombre;
desc equipo;
select e.id, e.nombre, e.idcapitan, j.id as idjugador, j.capitan, j.equipo from equipo e join jugador j on e.id = j.equipo where j.capitan = j.id;
update equipo e join jugador j on e.id = j.equipo set e.idcapitan = j.capitan where j.id = j.capitan;


-- Bloqueo de tablas

lock tables jugador read;
select * from jugador;
insert into jugador values (16, 'Elena', 'G', '2017-02-02', 1.34, 4, 'Pivot', '2010-01-01', 100, 3);
unlock tables;

lock tables jugador write;
select * from jugador;
insert into jugador values (16, 'Elena', 'G', '2017-02-02', 1.34, 4, 'Pivot', '2010-01-01', 100, 3);
unlock tables;

lock tables jugador read local;
select * from jugador;
insert into jugador values (16, 'Elena', 'G', '2017-02-02', 1.34, 4, 'Pivot', '2010-01-01', 100, 3);
unlock tables;

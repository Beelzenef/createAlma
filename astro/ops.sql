--== SELECCIONANDO DATOS

-- Selecciona todas las columnas de la tabla MOVIES
select * from MOVIES

-- Selecciona la columna de titulo pero renombrala como 'TITULASO'
select title as TITULASO from MOVIES

-- Selecciona las columnas de año y titulo de la tabla MOVIES
select year, title from MOVIES

-- Selecciona las columnas de titulo y año de la tabla MOVIES
select title, year from MOVIES

-- Selecciona las columnas de titulo, genero y año de la tabla MOVIES
select title, year, id_genre from MOVIES

--== OPERADORES BINARIOS

-- Selecciona todas las peliculas que NO sean del 2021
select * from MOVIES where year <> 2021

-- Selecciona todas las peliculas posteriores al 2000
select * from MOVIES where year > 2020

-- Selecciona todas las películas anteriores al 2019
select * from MOVIES where year < 2019

-- Selecciona todas las peliculas entre 1995 y 2000
select * from MOVIES where year > 1995 and year < 2000

-- Selecciona todas las peliculas del 2020
select * from MOVIES where year = 2022

--== OPERADORES COMPLEJOS

--== LIMIT
-- Selecciona únicamente 10 peliculas
select * from MOVIES limit 10

-- Selecciona únicamente 3 peliculas
select * from MOVIES limit 3

--== ORDERBY
-- Selecciona todas las peliculas y ordenalas por año
select * from MOVIES ORDER by year

-- Selecciona todas las peliculas y ordenalas por titulo
select * from MOVIES ORDER by title

-- Selecciona todas las peliculas y ordenalas por año de forma descendente
select * from MOVIES ORDER by year DESC

--== ORDERBY + LIMIT
-- Selecciona el titulo de las 3 peliculas mas antiguas
select * from MOVIES order by year limit 3

-- Selecciona el titulo de las 3 peliculas mas nuevas
select * from MOVIES order by year desc limit 3

--== IN
-- Selecciona las peliculas de los años 2015, 2019 y 2022
select * from MOVIES where year in (2015, 2019, 2022)

--== CONTAINS
-- Selecciona las peliculas cuyo titulo contenga la palabra "love"


-- Selecciona las peliculas cuyo titulo contenga la palabra "day"


--== BETWEEN
-- Selecciona peliculas en un rango de fechas


-- GETTING SPECIFIC DATA

--== SUBQUERIES FOR DIRECTORS
-- Selecciona todas las peliculas de Spielberg
select * from MOVIES where id_director = 10

-- Selecciona todas las peliculas de Nolan anteriores a 2010


--== SUBQUERIES FOR GENRES

-- Selecciona todas las peliculas romanticas
select * from MOVIES where id_genre = 6

-- Selecciona todas las peliculas romanticas (con subqueries)
select * from MOVIES where id_genre = (select id from GENRES where name = 'Romance')

-- Selecciona todas las peliculas del 2019 y que sean de terror
select * from MOVIES where id_genre = 5 and year = 2019

-- Selecciona todas las peliculas del 2019 y que sean de terror (con subqueries)
select * from MOVIES where id_genre = (select id from GENRES where name = 'Horror') and year = 2019

--== JOIN
-- Selecciona todas las peliculas y muestra también sus géneros

-- Selecciona todos los alquileres y muestra también el nombre de la persona que los realizó

--== OUTER JOIN


--== RIGHT O LEFT JOIN


--== UNION


--== UNION ALL 


--== EXCEPT
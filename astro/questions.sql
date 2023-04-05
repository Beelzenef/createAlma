--== PRESENTANDO DATOS

select * from MOVIES
select * from GENRES
select * from DIRECTORS
select * from CLIENTS

--== SELECCIONANDO DATOS

-- Selecciona todas las columnas de la tabla MOVIES

-- Selecciona la columna de titulo pero renombrala como 'TITULASO'

-- Selecciona las columnas de año y titulo de la tabla MOVIES

-- Selecciona las columnas de titulo y año de la tabla MOVIES

-- Selecciona las columnas de titulo, genero y año de la tabla MOVIES

--== OPERADORES BINARIOS

-- Selecciona todas las peliculas que NO sean del 2021

-- Selecciona todas las peliculas posteriores al 2000

-- Selecciona todas las películas anteriores al 2019

-- Selecciona todas las peliculas entre 1995 y 2000

-- Selecciona todas las peliculas del 2020

--== OPERADORES COMPLEJOS

--== LIMIT
-- Selecciona únicamente 10 peliculas

-- Selecciona únicamente 3 peliculas

--== ORDERBY
-- Selecciona todas las peliculas y ordenalas por año

-- Selecciona todas las peliculas y ordenalas por titulo

-- Selecciona todas las peliculas y ordenalas por año de forma descendente

--== ORDERBY + LIMIT
-- Selecciona el titulo de las 3 peliculas mas antiguas

-- Selecciona el titulo de las 3 peliculas mas nuevas

--== IN
-- Selecciona las peliculas de los años 2015, 2019 y 2022

--== CONTAINS
-- Selecciona las peliculas cuyo titulo contenga la palabra "love"

-- Selecciona las peliculas cuyo titulo contenga la palabra "day"

--== BETWEEN
-- Selecciona peliculas entre 2015 y 2019

-- GETTING SPECIFIC DATA

--== SUBQUERIES FOR DIRECTORS
-- Selecciona todas las peliculas de Spielberg

-- Selecciona todas las peliculas de Nolan

-- Selecciona todas las peliculas de Nolan anteriores a 2020

--== SUBQUERIES FOR GENRES
-- Selecciona todas las peliculas romanticas

-- Selecciona todas las peliculas romanticas (con subqueries)

-- Selecciona todas las peliculas del 2019 y que sean de terror

-- Selecciona todas las peliculas del 2019 y que sean de terror (con subqueries)

--== TRANSFORMACIÓN DE TEXTO
-- Muestra el titulo de las peliculas en mayusculas

-- Muestra el titulo de las peliculas en minúsculas

--== IS NULL

-- Selecciona las películas que aún no hayan sido devueltas

-- Selecciona las películas que aún hayan sido devueltas

--== JOIN
-- Selecciona todas las peliculas y muestra también sus géneros

-- Selecciona títulos, años y géneros de películas posteriores a 2000

-- Selecciona títulos, años y géneros de películas posteriores a 2000 y que sean romance

-- Selecciona título, año y nombre del director

-- Selecciona título, año, nombre del director de todas aquellas películas de Bong Joon-ho

-- Selecciona título, año, nombre del director de todas aquellas películas de Christopher Nolan que sean de drama

-- Selecciona título, año, nombre del director de todas aquellas películas de Christopher Nolan que sean de drama posteriores a 2013
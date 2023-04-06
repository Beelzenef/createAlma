# 📼 AstroMovies

## Un viaje al pasado para aprender SQL

⚗ Recursos homemade:

- [Slides](https://1drv.ms/p/s!AkcJg4FUx8k0gg8wSSMJwB2PvYhA?e=rDNwlH)
- [Base de datos](data/astro.db3)
- [Enunciados](questions.sql)

La base de datos puede cambiar y cambiará a lo largo del tiempo.

🔨 Herramientas y recursos

- [DB Browser for SQLite](https://sqlitebrowser.org/)
- [Aprende SQL en un fin de semana](https://www.goodreads.com/book/show/34368679-aprende-sql-en-un-fin-de-semana)

### 1️⃣ Primera sesión

Instrucciones SQL vistas en esta sesión:

- Seleccionar todas las columnas
- Seleccionar columnas específicas
- Seleccionar columnas con un alias customizado
- Seleccionar limitando el número de filas a mostrar
- Seleccionar ordenando por una columna (ascendente y descendente)

### 2️⃣ Segunda sesión

Instrucciones SQL vistas en esta sesión:

- WHERE
- Concatenar condiciones
- Operadores
- LIKE
- BETWEEN
- UPPER
- LOWER
- IN
- IS NULL
- IS NOT NULL

Dudas que han surgido durante la sesión:

- Capitalizar

No existe una función específica como tal, pero existen truquis para hacerlo. En este [enlace de Stackoverflow](https://stackoverflow.com/a/16619942) vemos cómo la solución puede ser seleccionar el primer carácter de un texto, hacerle un `UPPER()`, y el resto dejarlo como `LOWER()`.

SQLite no está pensado como una herramienta para transformación de texto, pero hay soluciones específicas para ello si se diera la necesidad.

- REGEX en SQLite

Dos enlaces, una [introducción en DEV.to](https://dev.to/nalgeon/regular-expressions-in-sqlite-82k) y [documentación del motor en GitHub](https://github.com/nalgeon/sqlean/blob/main/docs/regexp.md).

### 3️⃣ Tercera sesión

Instrucciones SQL vistas en esta sesión:

- Subconsultas o subqueries
- JOINs

Para recordar:

- Las subqueries son útiles, pero no muy potentes
- Donde usamos joins, no hace falta usar subqueries/subconsultas
- Si estamos usando joins, tenemos acceso a todas las tablas que estamos conectando, por lo tanto podemos hacer uso de diferentes campos para establecer `WHERE`s

Las consultas, usemos lo que usemos, no tienen ningún tipo de persistencia, no se almacenan en ninguna parte. Estos datos se proyectan al momento y no se guardan en ningún momento. 

Lo más cercano que tenemos son las [`VIEW`s, que no dejan de ser tablas virtuales que mezclan datos de otras tablas](https://learnsql.com/blog/sql-view/), cuyos datos se generan cada vez que la consultamos.

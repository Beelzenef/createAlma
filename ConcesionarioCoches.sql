-- Consultas para BD ConcesionarioCoches
-- 2016/2017

-- 1. En un editor de texto plano, crear un script sql llamado 'concesionario.sql'.
-- 2. Crear las tablas e insertar los datos.
-- 3. Crear un índice en MARCAS sobre el atributo cifm llamado 'icifm'.
-- 4. Crear un índice en COCHES sobre todos los atributos y llamarlo 'itodos'.
-- 5. Añadir a la tabla MARCAS un nuevo atributo llamado PAIS de longitud 25.
-- 6. Borrar la tabla distribución.
-- 7. Obtener todos los concesionarios.
-- 8. Obtener todos los clientes de Madrid.
-- 9. Nombre de las marcas de coches ordenadas alfabéticamente.
-- 10. Cifc de los concesionarios cuya cantidad en distribución sea mayor de 18.
-- 11. cifc de los concesionarios cuya distribución sea en cantidades entre 10 y 18.
-- 12. Idem del anterior con otra solución.
-- 13. Cifc de los concesionarios que tienen más de 10 coches o menos de 5.
-- 14. Parejas de cifm y dni que sean de la misma ciudad.
-- 15. Parejas de cifm y dni que no sean de la misma ciudad.
-- 16. Códigos de coches suministrados por concesionarios de BARCELONA.
-- 17. Códigos de coches vendidos a clientes de MADRID.
-- 18. Códigos de coches que un cliente de MADRID ha comprado a un concesionario de MADRID.
-- 19. Códigos de coches comprados en un concesionario de la misma ciudad que el comprador.
-- 20. Códigos de coches comprados en un concesionario de distinta ciudad que el comprador.
-- 21. Todas las parejas de nombre de marcas que sean de la misma ciudad.
-- 22. Todas las parejas de modelos de coches cuyo nombre sea el mismo y la marca sea de BILBAO.
-- 23. Códigos de coches cuyo nombre empiece por C.
-- 24. Códigos de coches cuyo nombre no contenga ninguna A.
-- 25. Número total de nombres de marcas de coches que sean de MADRID.
-- 26. Hallar la media del número de coches que tienen todos los concesionarios.
-- 27. DNI más alto de todos los clientes de MADRID.
-- 28. DNI más bajo de todos los clientes que han comprado un coche blanco.
-- 29. Codigo de concesionarios cuyo stock de coches no sea nulo.
-- 30. Cifm y nombre de marcas de coches cuya segunda letra del nombre de la ciudad de origen sea una 'I'.
-- 31. DNI de clientes que han comprado algún coche a un concesionario de MADRID.
-- 32. Color de los coches vendidos por el concesionario ACAR.
-- 33. Códigos de coches vendidos por algún concesionario de MADRID.
-- 34. Nombre y modelo de coches vendidos por algún concesionario de BARCELONA.
-- 35. Nombre de clientes que compraron coches al concesionario DCAR.
-- 36. Nombre y apellido de clientes que han comprado un coche GTI de color blanco.
-- 37. Nombre y apellido de clientes que han comprado un coche a un concesionario que posea actualmente stock de modelos GTI
-- 38. Nombre y apellido de clientes que han comprado un coche a un concesionario de MADRID que posea actualmente stock de modelos GTI.
-- 39. Nombre y apellido de clientes con dni menor que el del cliente JUAN MARTIN.
-- 40. Nombre y apellido de clientes con dni menor que el de todos los clientes de BARCELONA.
-- 41. Nombre y apellido de clientes cuyo nombre empiece por 'A' y su dni sea mayor que el de todos los clientes de MADRID.
-- 42. Nombre y apellido de clientes cuyo nombre empiece por 'A' y su dni sea mayor que el de algún cliente de MADRID.
-- 43. Nombre y apellido de clientes cuyo nombre empiece por 'A' y su dni sea mayor que el de algún cliente de MADRID o menor que el de todos los de VALENCIA.
-- 44. Nombre y apellido de clientes que han comprado como mínimo un coche blanco y otro rojo.
-- 45. DNI de clientes cuya ciudad sea la última del alfabeto de las ciudades donde existan concesionarios.
-- 46. Sacar la media de los coches que tiene actualmente cada concesionario en stock.
-- 47. Cifc de concesionarios que no sean de MADRID y su media de vehículos en stock sea la mayor de todas las medias.
-- 48. Repetir el ejercicio 33 pero utilizando la cláusula exists en la solución.
-- 49. Utilizndo exists, obtener el dni de los clientes que hayan comprado al menos alguno de los coches que han sido vendidos por el concesionario con cif '0001'.
-- 50. DNI de clientes que sólo le han comprado coches al concesionario '0001'.
-- 51. Nombre de clientes que no han comprado ningún coche rojo a ningún concesionario de MADRID.
-- 52. Nombre de clientes que solo le han comprado coches al concesionario '0001'.
-- 53. Código de coches que han sido adquiridos por todos los clientes de MADRID.
-- 54. Código de coches de color rojo y modelo GTI que han comprado todos los clientes cuyo apellido empieza por 'G'.
-- 55. DNI de clientes que han comprado al menos los mismos coches que LUIS GARCIA.
-- 56. CIFC de concesionarios que han vendido el mismo coche a todos los

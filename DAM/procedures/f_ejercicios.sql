-- Elena Guzman Blanco
-- Bases de Datos, abril 2016

-- Funcion diaSemana()

DELIMITER //
DROP FUNCTION IF EXISTS f_diaSemana //
CREATE FUNCTION f_diaSemana(
	n INT,
)

RETURNS VARCHAR (50)
	DETERMINISTIC NO SQL
BEGIN
-- Variable para almacenar el resultado del día de la semana	
	DECLARE resultado VARCHAR(20) DEFAULT "INDETERNIMADO";

-- Para cada día de la semana, un número correspondiente
	CASE (n)
		WHEN 1 THEN
			SET resultado = "LUNES";
		WHEN 2 THEN
			SET resultado = "MARTES";
		WHEN 3 THEN
			SET resultado = "MIERCOLES";
		WHEN 4 THEN
			SET resultado = "JUEVES";
		WHEN 5 THEN
			SET resultado = "VIERNES";
		WHEN 6 THEN
			SET resultado = "SABADO";
		WHEN 7 THEN
			SET resultado = "DOMINGO";
		ELSE
			SET resultado = "NOPE";
	END CASE;

		RETURN resultado;

END //

-- Funcion f_maxTres()


DROP FUNCTION IF EXISTS f_maxTres //
CREATE FUNCTION f_maxTres(
	n1 INT,
	n2 INT,
	n3 INT
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

	DECLARE numero INT DEFAULT 0;

	IF (n1 > n2 AND n1 > n3) THEN
		SET numero = n1;
	ELSE IF (n2 > n1 AND n2 > n3) THEN
		SET numero = n2;
	ELSE IF (n3 > n1 AND n3 > n2) THEN
		SET numero = n3;
	END IF; 

	RETURN numero;

END //


-- Funcion f_palindromo()

DROP FUNCTION IF EXISTS f_palindromo //
CREATE FUNCTION f_palindromo(
	cadena VARCHAR(50)
)

RETURNS BOOLEAN
	DETERMINISTIC NO SQL

BEGIN

	IF (reverse(cadena) = cadena) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;

END //



-- Funcion f_sumaN()

DROP FUNCTION IF EXISTS f_sumaN //
CREATE FUNCTION f_sumaN(
	n INT,
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

	DECLARE contador INT DEFAULT 1;
	declare primo boolean default false;

	while (contador < n) do
	    if (f_esPrimo(contador)) then
	        set numero = numero + contador;
	    end if;
	    set contador = contador + 1;
	end while;

	return numero;

END //


-- Funcion f_sucesion()


DROP FUNCTION IF EXISTS f_sucesion //
CREATE FUNCTION f_sucesion(
	m INT,
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

	DECLARE contador INT DEFAULT 1;
	DECLARE total int default 0;

	if (m = 0) then
		set m = 1;
	end if;
	
	while (contador < m) do
	    set total = total / contador;
	    set contador = contador + 1;
	end while;

	return total;

END //


-- Funcion f_encriptar()


DROP FUNCTION IF EXISTS f_encriptar //
CREATE FUNCTION f_encriptar(
	cadena varchar(10)
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

	DECLARE cadenaR varchar(10);

	set cadenaR = reverse(cadena);

	return cadenaR;

END //



-- Funcion f_actualizarPuntos()


DROP FUNCTION IF EXISTS f_actualizarPuntos //
CREATE FUNCTION f_actualizarPuntos(
	n INT,
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

return 0;

END //


-- Funcion f_esPrimo()

DROP FUNCTION IF EXISTS f_esPrimo //
CREATE FUNCTION f_esPrimo(
	n INT,
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN

	DECLARE contador INT DEFAULT 1;
	declare primo boolean default false;

	while (contador < n) do
	    if (mod(n, contador) then
	        set primo = false;
	    else
	        set primo = true;
	    end if;
	    set contador = contador + 1;
	end while;

	return primo;

END //


-- Funcion f_sumaN()


DROP FUNCTION IF EXISTS f_generarPrimos //
CREATE FUNCTION f_generarPrimos(
	n INT,
)

RETURNS INT
	DETERMINISTIC NO SQL

BEGIN


END //

DELIMITER ;
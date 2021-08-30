-- Elena Guzman Blanco

-- 1. Creando base de datos y tablas

drop database if exists comercio;
create database if not exists comercio;

use comercio;

drop table if exists categorias;
create table if not exists categorias (
	codigo int primary key auto_increment,
	comision decimal (7,2)
) engine=innodb;

drop table if exists productos;
create table if not exists productos (
	codigo int primary key,
	nombre varchar(20) not null,
	id_categoria int,
	foreign key (id_categoria) references categorias (id)
		on update cascade
		on delete restrict
) engine=innodb;

drop table if exists ventas;
create table if not exists ventas (
	codigoprod int,
	vendedor int primary key,
	fecha datetime default null primary key,
	importe decimal (7,2)
) engine= innodb;

drop table if exists comisiones;
create table if not exists comisiones (
	vendedor int primary key,
	comision decimal(7,2),
	foreign key (codigoprod) references productos (id)
		on update cascade
		on delete restrict
) engine=innodb; 


drop table if exists estadisticasVentas;
create table if not exists estadisticasVentas (
	anioVenta int not null,
	mesVenta int not null,
	codigoProducto int not null,
	cantidad int
) engine = innodb;

-- 2. Creando procedimiento

delimiter //

create procedure sp_comisiones(
	in vendedor int,
	in producto int
)

begin


end //

-- Crear un procedimiento llamado sp_comisiones(in vendedor int, in producto int). Este
-- procedimiento debe calcular la suma de todos los importes de un producto dado en las
-- ventas para un vendedor dado y aplicarle el % de comisión según el producto. Por
-- último debe actualizar en la tabla comisiones dicho valor calculado, acumulando el
-- valor anterior de la comisión de otro producto o insertarlo en caso de no que no esté
-- introducido.
-- Para el cálculo de la comisión, se debe buscar el producto en la tabla categorías y de
-- ahí extraer el porcentaje. 

-- 3. Trigger para recalcular la comision a cada nueva venta

drop trigger if exists nuevaVenta
create trigger nuevaVenta after insert on ventas for each row

begin

	call sp_comisiones(new.vendedor, new.codigoprod);

end //

-- 4. Manejo de errores




-- 5. Creacion de evento para guardar total de ventas cada mes

drop event if exists totalVentas;

create event if not exists totalVentas
	on schedule
		every 1 month
		starts current_timestamp
	on completion preserve

	do

	insert into estadisticasVentas (anioVenta, mesVenta, codigoProducto, cantidad) values
		(year(now()), month(now()),  1, 1); 

delimiter ;
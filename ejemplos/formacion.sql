-- 1) Crear la Base de datos llamada FORMACION, las TABLAS, las CLAVES y las relaciones de integridad referencial necesarias.

create database if not exists formacion;
use formacion;

drop table if exists inscrito;
drop table if exists empleado;
drop table if exists curso;

create table curso
(
  curso int,
  nombrecurso varchar(20) not null,
    primary key (curso)
);

create table empleado
(
  empleado int,
  nombre varchar(50) not null,
  sueldo int not null,
    primary key (empleado)
);

create table inscrito
(
  empleado int,
  curso int,
  horas int not null,
    primary key (empleado, curso),
    foreign key (empleado) references empleado (empleado)
      on update cascade
      on delete restrict,
    foreign key (curso) references curso (curso)
      on update cascade
      on delete restrict
);


insert into curso values
  ('01', 'MySQL'), ('02', 'Python'), ('03', 'C#'), ('04', 'Unity'), ('05', 'Javascript');

insert into empleado values
  (1, 'Elena G', 100),
  (2, 'Colophonius RdL', 150),
  (3, 'Andrea Hansen', 300),
  (4, 'Harry Bosch', 200);
  
insert into inscrito values
  (1, 1, 10),
  (1, 2, 5),
  (1, 3, 20),
  (1, 4, 20),
  (3, 3, 20),
  (3, 4, 20),
  (3, 2, 20),
  (2, 4, 5);
  
-- 2) Nombre de empleados inscritos exactamente en 3 cursos.
select nombre from empleado e where
  (select count(*) from inscrito i where e.nombre = i.empleado) = 3;
select nombre from empleado where empleado in
  (select empleado from inscrito group by empleado having count(*) = 3); 
-- Demasiado complicada, no rices el rizo
select nombre from empleado e where empleado in (select empleado from inscrito where e.empleado = empleado having count(*) = 3);

-- 3) Nombre de cursos que no han sido escogidos por ningún empleado.
select nombrecurso from curso where curso not in (select curso from inscrito);

-- 4) Códigos de empleados que no se hayan inscrito en ningún curso.
select * from empleado where empleado not in (select empleado from inscrito);
-- Con LEFT JOIN
select e.nombre from empleado e left join inscrito i on e.empleado = i.empleado where curso is null;
-- Con RIGHT JOIN
select e.nombre from inscrito i right join empleado e on e.empleado = i.empleado where i.curso is null;

-- 5) Nombres de empleados que se hayan inscrito en todos los cursos.
insert into inscrito values (1, 5, 20);
select nombre from empleado where empleado in
  (select empleado from inscrito group by empleado having count(*) = (select count(*) from curso));
  
select nombre from empleado e where not exists
  (select * from curso c where not exists
    (select * from inscrito i where i.curso = c.curso and e.empleado = i.empleado));

-- 6) Códigos de empleados que se han inscrito en al menos en todos los cursos que haya elegido el empleado con código “H2” 


-- 7) Nombre de los cursos que han sido escogidos por más de 3 empleados que tengan el mayor sueldo.


-- 8) Nombre de los cursos que han elegido hacer los empleados que menos cobran

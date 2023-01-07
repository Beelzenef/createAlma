use test;

drop table if exists A;
create table A (
  ca int not null,
  da int null
) engine = myISAM;

drop table if exists B;
create table B (
  ca int not null,
  db int not null
) engine = myISAM;


drop table if exists C;
create table C (
  ca int not null,
  dc int not null
) engine = myISAM;

delimiter ]]

-- CONTROL DE INSERCIONES



-- PROPAGACION DE INSERCIONES


  
-- CONTROL DE MODIFICACIONES:



-- CONTROL DE BORRADOS:


  
-- PROPAGACION DE ELIMINACIONES:


 
delimiter ;

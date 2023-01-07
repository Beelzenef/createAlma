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

drop trigger if exists bi_A]]
create trigger bi_A before insert on A
  for each row

  begin
  
    declare violacionJerarquiaTotal condition for SQLSTATE '77777';
    declare violacionClavePrimaria condition for SQLSTATE '77779';
  
    -- Si no está ni en B ni en C:
    if not exists (select * from B where ca = new.ca) and not exists (select * from C where ca = new.ca) then
      signal violacionJerarquiaTotal set message_text = 'Operacion no permitida en tabla A';
    end if;
    -- Si está ya en A:
    if exists (select * from A where ca = new.ca) then
      signal violacionClavePrimaria set message_text = 'Error de clave primaria';
    end if;
  
  end]]
 
drop trigger if exists bi_B]]
create trigger bi_B before insert on B
  for each row

  begin
  
    declare violacionJerarquiaExclusiva condition for SQLSTATE '77778';
  
    if exists (select * from A where ca = new.ca) then
      signal violacionJerarquiaExclusiva set message_text = 'Registro duplicado';
    end if;
  
  end]]
  
drop trigger if exists bi_C]]
create trigger bi_C before insert on C
  for each row

  begin
  
    declare violacionJerarquiaExclusiva condition for SQLSTATE '77778';
  
    if exists (select * from A where ca = new.ca) then
      signal violacionJerarquiaExclusiva set message_text = 'Registro duplicado';
    end if;
  
  end]]

-- PROPAGACION DE INSERCIONES

drop trigger if exists ai_B]]
create trigger ai_B after insert on B
  for each row

  begin
  
    insert into A (ca) values (new.ca);
  
  end]]
  
drop trigger if exists ai_C]]
create trigger ai_C after insert on C
  for each row

  begin
  
    insert into A (ca) values (new.ca);
  
  end]]
  
-- CONTROL DE MODIFICACIONES:

drop trigger if exists bu_A]]
create trigger bu_A before update on A
  for each row

  begin
  
     declare violacionClavePrimaria condition for SQLSTATE '77779';
     
     if exists (select * from B where ca = new.ca) or exists (select * from C where ca = new.ca) then
	signal violacionClavePrimaria set message_text = 'Clave primaria ya existente';
     end if;
  
  end]]
  
drop trigger if exists au_A]]
create trigger au_A update on A 
  for each row

  begin
  
    if old.ca <> new.ca then
      update b set ca = new.ca where id = old.ca;
      update c set ca = new.ca where id = old.ca;
    end if;
  
  end]]
  
drop trigger if exists bu_B]]
create trigger bu_B before update on B
  for each row

  begin
  
    declare clavePrimariaNoModificable condition for SQLSTATE '777780';
    
    if not exists (select * from A where ca = new.ca) then
      signal clavePrimariaNoModificable set message_text = 'No está permitido cambiar la clave primaria en esta entidad';
    end if;
  
  end]]
  
drop trigger if exists bu_C]]
create trigger bu_C before update on C
  for each row

  begin
  
    declare clavePrimariaNoModificable condition for SQLSTATE '777780';
    
    if not exists (select * from A where ca = new.ca) then
      signal clavePrimariaNoModificable set message_text = 'No está permitido cambiar la clave primaria en esta entidad';
    end if;
  
  end]]

-- CONTROL DE BORRADOS:

drop trigger if exists bd_B]]
create trigger bd_B before delete on B

  begin
  
    declare borradoProhibido condition for SQLSTATE '77781';
    
    if exists (select * from A where ca = old.ca) then
      signal borradoProhibido set message_text = 'Prohibido borrar en esta entidad';
    end if;
  
  end]]

drop trigger if exists bd_C]]
create trigger bd_C before delete on C

  begin
  
    declare borradoProhibido condition for SQLSTATE '77781';
    
    if exists (select * from A where ca = old.ca) then
      signal borradoProhibido set message_text = 'Prohibido borrar en esta entidad';
    end if;
    
  end]]
  
-- PROPAGACION DE ELIMINACIONES:

drop trigger if exists ad_A]]
create trigger ad_A after delete on A
  for each row
  
  begin
      
      delete from B where ca = old.ca;
      delete from C where ca = old.ca;
  
  end]]
 
delimiter ;
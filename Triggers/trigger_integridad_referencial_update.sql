CREATE OR REPLACE TRIGGER integridad_referencial_update
 AFTER UPDATE ON referencial_update FOR EACH ROW
BEGIN
    UPDATE referencial_update_slave
       SET id_slave  = :new.id_master 
     WHERE id_slave  = :old.id_master;
END;
/


--Tablas de ejemplo ya que las tablas de HR disponen de llaves unicas con muchas refencias
create table referencial_update (id_master number constraint master_pk primary key,name_integridad VARCHAR2(20)); 
create table referencial_update_slave (id_slave number constraint slave_ffk references referencial_update,name_slave VARCHAR2(20)); 

--Insertar datos 
insert into referencial_update_slave (id_slave,name_slave) values (15,'test_up');
insert into referencial_update (id_master,name_integridad) values (15,'test_up');

--Actualización en cascada
update referencial_update
set id_master = 15;

--Comprobacion
select * from referencial_update;
select * from referencial_update_slave;



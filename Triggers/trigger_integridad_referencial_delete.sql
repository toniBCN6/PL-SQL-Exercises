CREATE OR REPLACE TRIGGER integridad_referencial_delete
 AFTER DELETE ON referencial_update FOR EACH ROW
BEGIN
    DELETE FROM referencial_update_slave
     WHERE id_slave  = :old.id_master
     AND name_slave = :old.name_integridad;
END;
/

--Insertar datos 
insert into referencial_update (id_master,name_integridad) values (16,'test_del');
insert into referencial_update_slave (id_slave,name_slave) values (16,'test_del');

--Actualización en cascada
delete from referencial_update
where id_master = 16;

--Comprobacion
select * from referencial_update;
select * from referencial_update_slave;
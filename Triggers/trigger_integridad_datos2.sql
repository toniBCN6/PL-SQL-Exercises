--las comisiones no pueden ser superiores al 0,40
create or replace TRIGGER employees_restrict_commission
    BEFORE INSERT OR UPDATE OF commission_pct 
    ON employees
FOR EACH ROW
BEGIN

    IF :NEW.commission_pct > 0.40 THEN
        raise_application_error(-20202,'Error de violacion a la integridad hacia la base de datos: No puedes modificar la comision a un valor superior a 0,40');
    END IF;
END;
/

UPDATE
   employees
SET
   commission_pct = 0.45
WHERE
   employee_id = 164;

select * from employees;
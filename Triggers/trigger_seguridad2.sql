--Salario no puede ser superior a 10000
create or replace TRIGGER employees_restrict_salary
    BEFORE INSERT OR UPDATE OF salary 
    ON employees
FOR EACH ROW
BEGIN
    -- determine the transaction type

    IF :NEW.salary > 10000 THEN
        raise_application_error(-20202,'Error de violacion a la seguridad hacia la base de datos: Los empleados no pueden tener el salario mas elevado que 10000');
    END IF;
END;
/

UPDATE
   employees
SET
   salary = 200000
WHERE employee_id = 198;


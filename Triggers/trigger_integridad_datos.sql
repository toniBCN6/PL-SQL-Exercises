-- limitar los empleados del departamento 50 a 45 empleados
create or replace TRIGGER employees_restrict_departm
    BEFORE INSERT OR UPDATE OF department_id
    ON employees
    FOR EACH ROW
DECLARE
    n INTEGER;
BEGIN
    select count(department_id) into n from employees where department_id = 50;
    IF n >= 50 THEN
        raise_application_error(-20000,'Violacion de la integridad de la base de datos: El departamento 50 no puede disponer de mas de 50 empleados');
    END IF;
END;
/

ALTER TABLE employees
DISABLE CONSTRAINT EMP_JOB_FK;

select count(department_id) from employees where department_id = 50;

insert into employees (employee_id,first_name,last_name,email,salary,hire_date,job_id,department_id) values (11,'name','surname','mail@mail',12,'12/12/12',12,60);

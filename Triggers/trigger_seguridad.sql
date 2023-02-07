--limitar modificacion salarial en fechas de vacaciones
create or replace TRIGGER jobs_limit_salary
    BEFORE UPDATE OF min_salary  
    ON jobs
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 11 AND 31 THEN
        raise_application_error(-20100,'Error de violacion a la seguridad hacia la base de datos: No se puede actualizar el salario entre las fechas 11 al 31');
    END IF;
END;
/

-- Probar el codigo
UPDATE
   employees
SET
   salary = 250000
WHERE
   employee_id =198;
   

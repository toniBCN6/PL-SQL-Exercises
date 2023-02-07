CREATE TABLE salary_diff (
      emp_id         NUMBER,
      tabla       VARCHAR2(255),
      fecha DATE,
      old_salary NUMBER,
      new_salary NUMBER,
      diff NUMBER
);

-- Mostrar el nuevo, viejo salario y la diferencia salarial
CREATE OR REPLACE TRIGGER employees_diff_salary
    AFTER 
    UPDATE 
    ON employees
    FOR EACH ROW
DECLARE
   sal_diff number;
BEGIN
   -- calculo de diferencia salarial
    sal_diff := :NEW.salary  - :OLD.salary;
   -- insertar los datos en la tabla   
   INSERT INTO salary_diff (emp_id, tabla, fecha, old_salary, new_salary, diff)
   VALUES(:NEW.employee_id,'Employees', SYSDATE, :OLD.salary,:NEW.salary, sal_diff);
END;
/

--Bloque de codigo para provocar el trigger
UPDATE
   employees
SET
   salary = 3000
WHERE
   employee_id =198;

--Verificacion
select * from salary_diff;
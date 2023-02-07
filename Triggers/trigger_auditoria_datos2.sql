--los empleados con mas de 10 a�o aumenta su salario

CREATE TABLE auxiliar_ten_salary (
      salary_aux        NUMBER,
      employee_id_aux   NUMBER,
      hire_date_aux     DATE
);

CREATE OR REPLACE TRIGGER ten_years_employees
 AFTER UPDATE  
   ON employees  
   FOR EACH ROW 
DECLARE 
hire_num NUMBER;
BEGIN 
       SELECT Abs(EXTRACT(YEAR FROM To_Date(sysdate)) - EXTRACT(YEAR FROM hire_date_aux))
       into hire_num
       from auxiliar_ten_salary where employee_id_aux = :old.employee_id;
       
    IF hire_num >= 10 THEN
        update auxiliar_ten_salary set salary_aux = :new.salary + 200 where employee_id_aux = :old.employee_id;
    ELSE 
        raise_application_error(-20001,'Error al habilitar control de eventos: El empleado no tiene mas de 10 a�os en la empresa');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER ten_years_employees_auxiliar
 AFTER INSERT  
   ON employees  
   FOR EACH ROW 

BEGIN 
    INSERT INTO auxiliar_ten_salary (salary_aux,employee_id_aux,hire_date_aux)
   VALUES(:NEW.salary,:NEW.employee_id,:new.hire_date);
END;
/

insert into employees (employee_id,first_name,last_name,email,salary,hire_date,job_id,department_id) values (20,'name','surname','mail@mail',12,'12/12/12',12,60);

update employees
set salary = 2005
where employee_id= 20;

select * from employees where employee_id= 20;
select * from auxiliar_ten_salary;

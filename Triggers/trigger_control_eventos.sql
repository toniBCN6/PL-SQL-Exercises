CREATE OR REPLACE TRIGGER low_salary_commision 
BEFORE INSERT ON employees
FOR EACH ROW 
WHEN (old.commission_pct <= 0.2)
BEGIN 
   update employees set salary = :new.salary - 20;
   COMMIT;
END;
/

ALTER TABLE state_lineages INITRANS 8;
 
select * from employees where department_id = 60;

insert into employees (employee_id,first_name,last_name,email,salary,hire_date,job_id,department_id,commission_pct) values (17,'name','surname','mail@mail',100,'12/12/12',12,60,0.1);

update employees set salary = 2000 where employee_id= 173;


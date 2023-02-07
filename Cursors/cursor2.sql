-- Codificar un programa que visualice los dos empleados que ganan menos de cada oficio
set serveroutput on
DECLARE
   CURSOR c1 is   
    SELECT *
    FROM   (
      SELECT employees.salary,first_name,jobs.job_title
      FROM   employees
      INNER JOIN jobs 
      ON employees.job_id = jobs.job_id
      where employees.job_id = 'ST_MAN'
      ORDER BY employees.salary ASC
    )
    WHERE  rownum <= 2;
    
   my_department_name VARCHAR2(500);
   my_employee_name VARCHAR(500);
   my_last_name VARCHAR(500);
BEGIN
   OPEN c1;
    Dbms_output.PUT_LINE(
         'Empleados con menor salario:'
    );
   FOR i IN 1..10 LOOP
      FETCH c1 INTO my_department_name,my_employee_name,my_last_name;
      EXIT WHEN c1%NOTFOUND;
      COMMIT;
        Dbms_output.PUT_LINE(
         my_employee_name||','||
         my_department_name||','||my_last_name
         );
   END LOOP;
   CLOSE c1;
END;  

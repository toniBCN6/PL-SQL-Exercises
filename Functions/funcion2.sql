set serveroutput on
DECLARE
   CURSOR c1 is
      SELECT department_name,first_name,last_name,email,phone_number,departments.manager_id,employees.salary,employee_id,locations.street_address FROM employees JOIN  departments USING(department_id) JOIN locations USING(location_id) where department_name='Administration';
   my_department_name VARCHAR2(50);
   my_employee_name VARCHAR(50);
   my_last_name VARCHAR(50);
   my_email VARCHAR(50);
   my_phone VARCHAR(50);
   my_manager_id VARCHAR(50);
   my_salary VARCHAR(50);
   my_employees_id VARCHAR(50);
   my_address VARCHAR(50);
BEGIN
   OPEN c1;
   FOR i IN 1..10 LOOP
      FETCH c1 INTO my_department_name,my_employee_name,my_last_name,my_email,my_phone,my_manager_id,my_salary,my_employees_id,my_address;
      EXIT WHEN c1%NOTFOUND;
      COMMIT;
   END LOOP;
         Dbms_output.put_line(
         'Numero de empleados del departamento: '||c1%ROWCOUNT||','||
         'Nombre del departamento: '||my_department_name||CHR(9)||
         ',Nombre del empleado: '|| my_employee_name||CHR(9)||
         ',Apellido del empleado: '||my_last_name||CHR(9)||
         ',Email del empleado: '||my_email||CHR(9)||
         ',Telefono del empleado: '||my_phone||CHR(9)||
         ',Identificación del manager del empleado: '||my_manager_id||CHR(9)||
         ',Salario del empleado: '||my_salary||CHR(9)||
         ',Dirección: '||my_address||CHR(9)
         );
   CLOSE c1;
END;  
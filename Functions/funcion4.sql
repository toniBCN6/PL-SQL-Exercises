set serveroutput on
create or replace procedure antiguedad_empleado(fecha_ID IN NUMBER) AS
    hire_num NUMBER;
    begin
       SELECT Abs(EXTRACT(YEAR FROM To_Date(sysdate)) - EXTRACT(YEAR FROM hire_date))
       into hire_num
       from employees WHERE employee_id=fecha_ID;
       dbms_output.put_line('Antiguedad en a�os del empleado: '||hire_num);
end;
/

--ejecuci�n del codigo
execute antiguedad_empleado('198')

--validacion

SELECT Abs(EXTRACT(YEAR FROM To_Date(sysdate)) - EXTRACT(YEAR FROM hire_date)) AS "Antiguedad en a�os del empleado" FROM employees where employee_id='198';
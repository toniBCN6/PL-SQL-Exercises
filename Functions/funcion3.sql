set serveroutput on
create or replace procedure salario_medio_depar(depar_ID IN NUMBER) AS
    depar_num NUMBER;
    begin
       select ROUND(AVG(salary) ,2) 
       into depar_num
       from employees WHERE department_id=depar_ID
       group by department_id;
       dbms_output.put_line('Salario redondeado ='||depar_num);
end;
/

--ejecución del codigo
execute salario_medio_depar('50')

--validacion

SELECT ROUND(AVG(salary) ,2) AS "Salario redondeado" FROM employees where department_id='50' GROUP BY department_id;


/* Funcion para obtener el numero de empleados por departamento */

CREATE OR REPLACE FUNCTION Obtener_Numero_Empleados(c_department VARCHAR2) 
RETURN NUMBER
IS
  resultado NUMBER;
BEGIN
  SELECT count(employee_id) 
  INTO resultado
  FROM employees
  WHERE department_id = c_department;
  return(resultado);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
  return 0;
END;
/

/* Invocar la funcion mediante un prompt en la tabla dual para limitarlo a una sola entrada */

select Obtener_Numero_Empleados('&Departamentos') as "Número de empleados" from dual;

/* Verificacion de la funcion*/

select * from employees where department_id = 50;


-- Codificar un procedimiento reciba como parametros un numero de departamento, un importe y un porcentaje; y suba el salario a todos los empleados del departamento indicado en la llamada. 
-- La subida sera el porcentaje o el importe indicado en la llamada (el que sea mas beneficioso para el empleado en cada caso empleado).
set serveroutput on
CREATE OR REPLACE PROCEDURE incremento_salario
    (
        depart_id       IN departments.department_id%TYPE,
        impor        IN NUMBER,
        incr   IN NUMBER  
    )    AUTHID  CURRENT_USER IS
    valor_incr NUMBER (3,2);
BEGIN
     valor_incr := incr/100;
     
    IF valor_incr > impor THEN
        UPDATE employees
        SET salary = salary+(salary*incr)
        WHERE department_id = depart_id;
    ELSE
        UPDATE employees
        SET salary = salary+(salary*impor)
        WHERE department_id = depart_id;
    END IF;
END;
/

BEGIN
    incremento_salario
    (
        40,
        20,
        10
    );
END;
/
select salary from employees where department_id = 40;

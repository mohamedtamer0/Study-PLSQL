/* Formatted on 5/5/2023 8:49:12 PM (QP5 v5.326) */
CREATE OR REPLACE FUNCTION get_sal (p_emp_id NUMBER)
    RETURN NUMBER
IS
    v_sal   NUMBER;
BEGIN
    SELECT salary
      INTO v_sal
      FROM employees
     WHERE employee_id = p_emp_id;

    RETURN v_sal;
END;

-----------------------
-- 1 as part of Expression

DECLARE
    v_sal   NUMBER;
BEGIN
    v_sal := get_sal (100);
    DBMS_OUTPUT.put_line (v_sal);
END;

-----------------------
-- 2 as parameter Value

BEGIN
    DBMS_OUTPUT.put_line (get_sal (100));
END;

--OR

EXECUTE DBMS_OUTPUT.put_line (get_sal (100));

-----------------------
-- 3 using host variable

VARIABLE b_salary NUMBER;

EXECUTE :b_salary:= get_sal( 100);

PRINT b_salary;

-----------------------
-- 4 as part of select

SELECT get_sal (100) FROM DUAL;

SELECT employee_id, first_name, get_sal (employee_id)
  FROM employees
 WHERE department_id = 20;

-----------------------

SELECT *
  FROM user_objects
 WHERE object_name = 'GET_SAL';

SELECT LINE, TEXT
  FROM USER_SOURCE
 WHERE name = 'GET_SAL';
 
-----------------------

--ORA-01403: no data found
begin
 DBMS_OUTPUT.put_line (get_sal (99999));
end;


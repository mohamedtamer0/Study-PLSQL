/* Formatted on 5/5/2023 8:14:42 PM (QP5 v5.326) */
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

print b_salary;
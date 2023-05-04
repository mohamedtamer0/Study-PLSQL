/* Formatted on 5/4/2023 11:39:16 PM (QP5 v5.326) */
CREATE OR REPLACE PROCEDURE query_emp (
    p_emp_id       employees.employee_id%TYPE,
    p_f_name   OUT EMPLOYEES.FIRST_NAME%TYPE,
    p_sal      OUT employees.salary%TYPE)
IS
BEGIN
    SELECT first_name, salary
      INTO p_f_name, p_sal
      FROM employees
     WHERE employee_id = p_emp_id;
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.put_line (SQLCODE);
        DBMS_OUTPUT.put_line (SQLERRM);
END;

------

VARIABLE b_first_name VARCHAR2 ( 100 )
VARIABLE b_sal NUMBER

EXECUTE query_emp(105,:b_first_name,:b_sal)

PRINT b_first_name;
PRINT b_sal;

------------------------------

-- The Other way to print the out parameter

DECLARE
    v_first_name   EMPLOYEES.FIRST_NAME%TYPE;
    v_sal          employees.salary%TYPE;
BEGIN
    query_emp (105, v_first_name, v_sal);
    DBMS_OUTPUT.put_line (v_first_name);
    DBMS_OUTPUT.put_line (v_sal);
END;
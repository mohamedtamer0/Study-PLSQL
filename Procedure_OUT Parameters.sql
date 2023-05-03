/* Formatted on 03/05/2023 11:20:08 AM (QP5 v5.326) */
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
Variable b_first_name varchar2(100)
Variable b_sal number

execute query_emp(105,:b_first_name,:b_sal)

print b_first_name;
print b_sal;
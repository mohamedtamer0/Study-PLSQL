/* Formatted on 4/15/2023 10:13:31 PM (QP5 v5.326) */
-- Using = %notfound  -  %isopen  -  %rowcount

DECLARE
    CURSOR c_emp IS SELECT employee_id, first_name FROM EMPLOYEES;

    v_empno        EMPLOYEES.employee_id%TYPE;
    v_first_name   EMPLOYEES.first_name%TYPE;
BEGIN
    IF c_emp%ISOPEN
    THEN
        NULL;
    ELSE
        OPEN c_emp;
    END IF;

    DBMS_OUTPUT.put_line ('the counter for cursor now is ' || c_emp%ROWCOUNT);

    LOOP
        FETCH c_emp INTO v_empno, v_first_name;

        EXIT WHEN c_emp%NOTFOUND OR c_emp%ROWCOUNT > 10;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    DBMS_OUTPUT.put_line ('the counter for cursor now is ' || c_emp%ROWCOUNT);

    CLOSE c_emp;
END;

---------------------------

DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id, first_name
          FROM EMPLOYEES 
         WHERE department_id = 30;
BEGIN
    FOR i IN c_emp_dept30
    LOOP
        DBMS_OUTPUT.put_line (i.employee_id || ' ' || i.first_name);
    END LOOP;
END;
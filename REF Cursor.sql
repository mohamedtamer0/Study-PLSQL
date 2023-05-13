/* Formatted on 5/13/2023 7:40:07 PM (QP5 v5.326) */
--The Ref cursor can be opend many times with dif query

DECLARE
    TYPE c_emp_dept IS REF CURSOR;

    d_cursor       c_emp_dept;
    v_empno        EMPLOYEES.EMPLOYEE_ID%TYPE;
    v_first_name   EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    OPEN d_cursor FOR SELECT EMPLOYEE_ID, first_name
                        FROM EMPLOYEES
                       WHERE department_id = 10;

    LOOP
        FETCH d_cursor INTO v_empno, v_first_name;

        EXIT WHEN d_cursor%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE d_cursor;

    OPEN d_cursor FOR SELECT EMPLOYEE_ID, first_name
                        FROM EMPLOYEES
                       WHERE department_id = 30;

    LOOP
        FETCH d_cursor INTO v_empno, v_first_name;

        EXIT WHEN d_cursor%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE d_cursor;
END;

-----------------

--Dynamic sql with multi row query

CREATE OR REPLACE PROCEDURE emp_list (p_dept_id NUMBER DEFAULT NULL)
IS
    TYPE c_emp_dept IS REF CURSOR;

    d_cursor       c_emp_dept;
    v_empno        EMPLOYEES.EMPLOYEE_ID%TYPE;
    v_first_name   EMPLOYEES.FIRST_NAME%TYPE;
    v_sql          VARCHAR2 (1000)
                       := 'select EMPLOYEE_ID,FIRST_NAME from EMPLOYEES';
BEGIN
    IF p_dept_id IS NULL
    THEN
        OPEN d_cursor FOR v_sql;
    ELSE
        v_sql := v_sql || ' where department_id =:id';

        OPEN d_cursor FOR v_sql USING p_dept_id;
    END IF;

    LOOP
        FETCH d_cursor INTO v_empno, v_first_name;

        EXIT WHEN d_cursor%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE d_cursor;
END;

-- To get all the Emp
execute emp_list;

-- To get all the Emp in Specific dep
execute emp_list(30);
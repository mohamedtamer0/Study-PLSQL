/* Formatted on 5/13/2023 6:47:11 PM (QP5 v5.326) */
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
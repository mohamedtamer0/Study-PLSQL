/* Formatted on 4/15/2023 9:22:01 PM (QP5 v5.326) */
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
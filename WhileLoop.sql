/* Formatted on 3/29/2023 10:56:20 PM (QP5 v5.326) */
DECLARE
    v_counter   NUMBER := 1;
BEGIN
    WHILE v_counter <= 3
    LOOP
        DBMS_OUTPUT.put_line ('Welcome');
        v_counter := v_counter + 1;
    END LOOP;
END;

-----------------------------

DECLARE
    v_empno        NUMBER := 100;
    v_first_name   employees.first_name%TYPE;
BEGIN
    WHILE v_empno <= 102
    LOOP
        SELECT first_name
          INTO v_first_name
          FROM employees
         WHERE employee_id = v_empno;

        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
        v_empno := v_empno + 1;
    END LOOP;
END;
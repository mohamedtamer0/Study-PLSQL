/* Formatted on 29/03/2023 1:59:01 PM (QP5 v5.326) */
DECLARE
    v_counter   NUMBER := 0;
BEGIN
    LOOP
        v_counter := v_counter + 1;
        DBMS_OUTPUT.put_line ('Welcome ' || v_counter);
        EXIT WHEN v_counter = 3;
    END LOOP;
END;

---------------------

DECLARE
    v_counter   NUMBER := 0;
BEGIN
    LOOP
        v_counter := v_counter + 1;
        DBMS_OUTPUT.put_line ('Welcome ' || v_counter);

        IF v_counter = 3
        THEN
            EXIT;
        END IF;
    END LOOP;
END;

---------------------


DECLARE
    v_empno        NUMBER := 100;
    v_first_name   employees.first_name%TYPE;
BEGIN
    LOOP
        SELECT first_name
          INTO v_first_name
          FROM EMPLOYEES
         WHERE employee_id = v_empno;

        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
        v_empno := v_empno + 1;
        EXIT WHEN v_empno > 102;
    END LOOP;
END;
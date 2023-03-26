/* Formatted on 3/26/2023 8:41:27 AM (QP5 v5.326) */
DECLARE
    v_sal       EMPLOYEES.salary%TYPE;
    v_new_sal   EMPLOYEES.salary%TYPE;
BEGIN
    SELECT salary
      INTO v_sal
      FROM EMPLOYEES
     WHERE employee_id = 100;

    DBMS_OUTPUT.put_line ('the old salary is ' || v_sal);
    v_new_sal := v_sal + 100;

    UPDATE EMPLOYEES
       SET salary = v_new_sal
     WHERE employee_id = 100;

    DBMS_OUTPUT.put_line ('the new salary is ' || v_new_sal);
END;

COMMIT;
/* Formatted on 4/27/2023 6:22:36 PM (QP5 v5.326) */
DECLARE
    v_first_name   EMPLOYEES.first_name%TYPE;
BEGIN
    SELECT first_name
      INTO v_first_name
      FROM EMPLOYEES
     WHERE employee_id = 1;

    DBMS_OUTPUT.put_line (v_first_name);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        DBMS_OUTPUT.put_line ('The Query does not retrive any record');
END;
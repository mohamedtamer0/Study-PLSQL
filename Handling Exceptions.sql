/* Formatted on 4/29/2023 2:39:25 PM (QP5 v5.326) */
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

--------------------------

DECLARE
    v_emp_id   EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
    SELECT EMPLOYEE_ID
      INTO v_emp_id
      FROM EMPLOYEES
     WHERE first_name = 'John';
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        DBMS_OUTPUT.put_line ('The Query does not retrive any record');
    WHEN TOO_MANY_ROWS
    THEN
        DBMS_OUTPUT.put_line ('The Query retrive more than one record');
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.put_line ('Other Error');
END;


--------------------------

DECLARE
    v_first_name   EMPLOYEES.first_name%TYPE;
BEGIN
    FOR i IN 99 .. 102
    LOOP
        BEGIN
            SELECT first_name
              INTO v_first_name
              FROM employees
             WHERE employee_id = i;

            DBMS_OUTPUT.put_line (i || ' ' || v_first_name);
        EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
                NULL;
        END;
    END LOOP;
END;

-----------------------------

DESC DEPARTMENTS;

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
     VALUES (1, NULL);

-- SQL Error : ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")

DECLARE
    e_insert   EXCEPTION;
    PRAGMA EXCEPTION_INIT (e_insert, -01400);
BEGIN
    INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
         VALUES (1, NULL);
EXCEPTION
    WHEN e_insert
    THEN
        DBMS_OUTPUT.put_line ('insert failed');
        DBMS_OUTPUT.put_line (SQLCODE);
        DBMS_OUTPUT.put_line (SQLERRM);
    WHEN OTHERS
    THEN
        NULL;
END;

-------------------------

DECLARE
    e_insert   EXCEPTION;
    PRAGMA EXCEPTION_INIT (e_insert, -01400);
BEGIN
    BEGIN
        INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
             VALUES (1, NULL);
    EXCEPTION
        WHEN e_insert
        THEN
            DBMS_OUTPUT.put_line ('insert failed');
            DBMS_OUTPUT.put_line (SQLCODE);
            DBMS_OUTPUT.put_line (SQLERRM);
    END;

    BEGIN
        UPDATE EMPLOYEES
           SET employee_id = 'ss'
         WHERE employee_id = 100;
    EXCEPTION
        WHEN OTHERS
        THEN
            DBMS_OUTPUT.put_line ('insert failed');
            DBMS_OUTPUT.put_line (SQLCODE);
            DBMS_OUTPUT.put_line (SQLERRM);
    END;
END;

-----------------------------

DECLARE
    v_emp_id       NUMBER := 1;
    e_invalid_no   EXCEPTION;
BEGIN
    UPDATE EMPLOYEES
       SET salary = 2000
     WHERE employee_id = v_emp_id;

    DBMS_OUTPUT.put_line (SQLCODE);
    DBMS_OUTPUT.put_line (SQLERRM);

    IF SQL%NOTFOUND
    THEN
        RAISE e_invalid_no;
    END IF;

    COMMIT;
EXCEPTION
    WHEN e_invalid_no
    THEN
        DBMS_OUTPUT.put_line ('invalid emp ID');
        DBMS_OUTPUT.put_line (SQLCODE);
        DBMS_OUTPUT.put_line (SQLERRM);
END;
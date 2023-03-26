/* Formatted on 3/26/2023 7:47:23 AM (QP5 v5.326) */
DECLARE
    v_frist_name   EMPLOYEES.FIRST_NAME%TYPE;
    v_last_name    EMPLOYEES.LAST_NAME%TYPE;
    v_sal          NUMBER;
    "hire date"    DATE;                -- this is not recommended from oracle
BEGIN
    SELECT FIRST_NAME,
           LAST_NAME,
           salary,
           hire_date
      INTO v_frist_name,
           v_last_name,
           v_sal,
           "hire date"
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;

    DBMS_OUTPUT.put_line ('the first name is ' || v_frist_name);
    DBMS_OUTPUT.put_line ('the last name is ' || v_last_name);
    DBMS_OUTPUT.put_line ('the salary is ' || v_sal);
    DBMS_OUTPUT.put_line ('the hire date name is ' || "hire date");
    DBMS_OUTPUT.put_line (
        'the first name length is ' || LENGTH (v_frist_name));
    DBMS_OUTPUT.put_line (
           'the first 3 letters of first name is '
        || SUBSTR (v_frist_name, 1, 3));
END;


-----------------------------
-- Data type Conversion

DECLARE
    v_date   DATE := SYSDATE;
    v_sal    NUMBER := 5000;
BEGIN
    DBMS_OUTPUT.put_line (v_date);
    DBMS_OUTPUT.put_line (v_date + 8);
    DBMS_OUTPUT.put_line (v_date - 3);
    DBMS_OUTPUT.put_line (TO_CHAR (v_date, 'dd-mm-yyyy hh:mi:ss am'));
    DBMS_OUTPUT.put_line (ADD_MONTHS (v_date, 2));
    DBMS_OUTPUT.put_line (TO_CHAR (v_sal, '$999,999'));
END;
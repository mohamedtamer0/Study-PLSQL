/* Formatted on 3/26/2023 7:08:25 AM (QP5 v5.326) */
DECLARE
    v_empno         NUMBER := 10;
    v_ename         VARCHAR2 (100) := 'Tamer';
    v_salary        EMPLOYEES.salary%TYPE;
    v_HIRE_PERIOD   INTERVAL YEAR TO MONTH;
    v_empno1        v_empno%TYPE;
BEGIN
    DBMS_OUTPUT.put_line (v_empno);
    DBMS_OUTPUT.put_line (v_ename);
    v_salary := 5000;
    DBMS_OUTPUT.put_line (v_salary);
    v_HIRE_PERIOD := '1-3';
    DBMS_OUTPUT.put_line (v_HIRE_PERIOD);
    DBMS_OUTPUT.put_line (v_empno1);
END;

-----------------------

DECLARE
    flag      BOOLEAN;
    v_no1     NUMBER := 20;
    v_no2     NUMBER := 20;
    v_print   VARCHAR2 (100);
BEGIN
    flag := FALSE;

    IF v_no1 = v_no2
    THEN
        flag := TRUE;
        v_print := 'numbers are eqaul';
    END IF;

    IF flag = TRUE
    THEN
        DBMS_OUTPUT.put_line (v_print);
    END IF;
END;
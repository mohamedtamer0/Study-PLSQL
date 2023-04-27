/* Formatted on 4/27/2023 4:41:09 PM (QP5 v5.326) */
-- Using = %notfound  -  %isopen  -  %rowcount

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

---------------------------
--
--- For Loop With CURSOR. (1)
--

DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id, first_name
          FROM EMPLOYEES
         WHERE department_id = 30;
BEGIN
    FOR i IN c_emp_dept30
    LOOP
        DBMS_OUTPUT.put_line (i.employee_id || ' ' || i.first_name);
    END LOOP;
END;


---------------------------

--
--- For Loop With CURSOR. (2)
--

DECLARE
BEGIN
    FOR i IN (SELECT employee_id, first_name, salary
                FROM EMPLOYEES
               WHERE department_id = 30)
    LOOP
        DBMS_OUTPUT.put_line (
            i.employee_id || ' ' || i.first_name || ' ' || i.salary);

        UPDATE EMPLOYEES
           SET salary = salary + 12
         WHERE employee_id = i.employee_id;
    END LOOP;
END;


---------------------------
--
--- For Loop With CURSOR and Set Parameters (1)
--

DECLARE
    CURSOR c_emp_dept (v_dept NUMBER)
    IS
        SELECT employee_id, first_name
          FROM EMPLOYEES
         WHERE department_id = v_dept;

    v_empno        EMPLOYEES.employee_id%TYPE;
    v_first_name   EMPLOYEES.first_name%TYPE;
BEGIN
    OPEN c_emp_dept (10);

    DBMS_OUTPUT.put_line ('dept 10 contains:');

    LOOP
        FETCH c_emp_dept INTO v_empno, v_first_name;

        EXIT WHEN c_emp_dept%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE c_emp_dept;

    OPEN c_emp_dept (20);

    DBMS_OUTPUT.put_line ('dept 20 contains:');

    LOOP
        FETCH c_emp_dept INTO v_empno, v_first_name;

        EXIT WHEN c_emp_dept%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE c_emp_dept;
END;

---------------------------
--
--- For Loop With CURSOR and Set Parameters (2)
--

DECLARE
    CURSOR c_emp_dept (v_dept NUMBER)
    IS
        SELECT employee_id, first_name
          FROM EMPLOYEES
         WHERE department_id = v_dept;
BEGIN
    DBMS_OUTPUT.put_line ('dept 10 contains:');

    FOR i IN c_emp_dept (10)
    LOOP
        DBMS_OUTPUT.put_line (i.employee_id || ' ' || i.first_name);
    END LOOP;

    DBMS_OUTPUT.put_line ('dept 20 contains:');

    FOR i IN c_emp_dept (20)
    LOOP
        DBMS_OUTPUT.put_line (i.employee_id || ' ' || i.first_name);
    END LOOP;
END;


---------------------------
--
--- For Update CURSOR
--

DECLARE
    CURSOR c_emp_dept30 IS
        SELECT employee_id, first_name
          FROM EMPLOYEES
         WHERE department_id = 30
        FOR UPDATE;
BEGIN
    FOR i IN c_emp_dept30
    LOOP
        UPDATE EMPLOYEES
           SET salary = salary + 3
         WHERE CURRENT OF c_emp_dept30;
    END LOOP;

    COMMIT;
END;
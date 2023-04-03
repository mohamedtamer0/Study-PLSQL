/* Formatted on 03/04/2023 9:50:25 AM (QP5 v5.326) */
DECLARE
    CURSOR c_emp_dept IS
        SELECT employee_id, first_name
          FROM employees
         WHERE department_id = 30;

    v_empno        employees.employee_id%TYPE;
    v_first_name   employees.first_name%TYPE;
BEGIN
    OPEN c_emp_dept;

    LOOP
        FETCH c_emp_dept INTO v_empno, v_first_name;

        EXIT WHEN c_emp_dept%NOTFOUND;
        DBMS_OUTPUT.put_line (v_empno || ' ' || v_first_name);
    END LOOP;

    CLOSE c_emp_dept;
END;
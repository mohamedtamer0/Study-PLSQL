/* Formatted on 3/31/2023 3:42:25 PM (QP5 v5.326) */
DECLARE
    TYPE t_emp IS RECORD
    (
        v_emp_id        employees.employee_id%TYPE,
        v_first_name    employees.first_name%TYPE,
        v_last_name     employees.last_name%TYPE
    );

    v_emp   t_emp;
BEGIN
    SELECT employee_id, first_name, last_name
      INTO v_emp
      FROM employees
     WHERE employee_id = 100;

    DBMS_OUTPUT.put_line (
           v_emp.v_emp_id
        || ' '
        || v_emp.v_first_name
        || ' '
        || v_emp.v_last_name);
END;
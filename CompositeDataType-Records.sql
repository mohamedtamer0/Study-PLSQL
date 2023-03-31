/* Formatted on 3/31/2023 4:09:33 PM (QP5 v5.326) */
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

------------

CREATE TABLE copy_departments
AS
    SELECT *
      FROM departments
     WHERE 1 = 2;

-----

DECLARE
    TYPE t_dept IS RECORD
    (
        v_dept_id         departments.department_id%TYPE,
        v_dept_name       departments.department_name%TYPE,
        v_dept_manager    departments.manager_id%TYPE,
        v_dept_loc        departments.location_id%TYPE
    );

    v_dept   t_dept;
BEGIN
    SELECT department_id,
           department_name,
           manager_id,
           location_id
      INTO v_dept
      FROM departments
     WHERE department_id = 10;

    INSERT INTO copy_departments
         VALUES v_dept;
END;


SELECT * FROM copy_departments;

---------------------------
-- Using %rowtype
------

DECLARE
    v_dept   departments%ROWTYPE;
BEGIN
    SELECT department_id,
           department_name,
           manager_id,
           location_id
      INTO v_dept
      FROM departments
     WHERE department_id = 20;

    INSERT INTO copy_departments
         VALUES v_dept;
END;


SELECT * FROM copy_departments;

---------------------------
-- Using %rowtype in Update
------

DECLARE
    v_dept   departments%ROWTYPE;
BEGIN
    v_dept.department_id := 10;
    v_dept.department_name := 'Test';

    UPDATE copy_departments
       SET row = v_dept;
END;


SELECT * FROM copy_departments;
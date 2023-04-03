/* Formatted on 03/04/2023 10:50:54 AM (QP5 v5.326) */
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

-------------------

DECLARE
    CURSOR c_emp_dept IS
        SELECT employee_id, first_name
          FROM employees
         WHERE department_id = 30;

    v_emp_rec   employees%ROWTYPE;
BEGIN
    OPEN c_emp_dept;

    LOOP
        FETCH c_emp_dept INTO v_emp_rec.employee_id, v_emp_rec.first_name;

        EXIT WHEN c_emp_dept%NOTFOUND;
        DBMS_OUTPUT.put_line (
            v_emp_rec.employee_id || ' ' || v_emp_rec.first_name);
    END LOOP;

    CLOSE c_emp_dept;
END;


-------------------

DECLARE
    CURSOR c_emp_dept IS
        SELECT employee_id, first_name
          FROM employees
         WHERE department_id = 30;

    v_emp_rec   c_emp_dept%ROWTYPE;
BEGIN
    OPEN c_emp_dept;

    LOOP
        FETCH c_emp_dept INTO v_emp_rec;

        EXIT WHEN c_emp_dept%NOTFOUND;
        DBMS_OUTPUT.put_line (
            v_emp_rec.employee_id || ' ' || v_emp_rec.first_name);
    END LOOP;

    CLOSE c_emp_dept;
END;

-------------------

DECLARE
    CURSOR c_emp_dept IS
        SELECT employee_id, first_name, salary
          FROM employees
         WHERE department_id = 30;

    v_empno        employees.employee_id%TYPE;
    v_first_name   employees.first_name%TYPE;
    v_salary       employees.salary%TYPE;
BEGIN
    OPEN c_emp_dept;

    LOOP
        FETCH c_emp_dept INTO v_empno, v_first_name, v_salary;

        EXIT WHEN c_emp_dept%NOTFOUND;

        UPDATE employees
           SET salary = salary + 100
         WHERE employee_id = v_empno;
    END LOOP;

    CLOSE c_emp_dept;

    COMMIT;
END;

---

SELECT employee_id, first_name, salary
  FROM employees
 WHERE department_id = 30;
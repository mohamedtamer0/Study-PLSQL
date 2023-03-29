/* Formatted on 29/03/2023 11:34:50 AM (QP5 v5.326) */
SELECT employee_id,
       first_name,
       LENGTH (first_name),
       CASE LENGTH (first_name)
           WHEN 4 THEN '4 char'
           WHEN 5 THEN '5 char'
           WHEN 6 THEN '6 char'
           ELSE 'N/A'
       END
           LEN,
       last_name,
       salary
  FROM EMPLOYEES;

------------------------

SELECT employee_id,
       first_name,
       LENGTH (first_name),
       CASE
           WHEN LENGTH (first_name) = 4 THEN '4 char'
           WHEN LENGTH (first_name) = 5 THEN '5 char'
           WHEN LENGTH (first_name) = 6 THEN '6 char'
           ELSE 'N/A'
       END
           LEN
  FROM EMPLOYEES;

------------------------

DECLARE
    v_sal    NUMBER;
    v_desc   VARCHAR2 (100);
BEGIN
    SELECT salary
      INTO v_sal
      FROM EMPLOYEES
     WHERE employee_id = &emp_id;

    v_desc :=
        CASE
            WHEN v_sal IS NULL THEN 'no salary fro the employee'
            WHEN v_sal BETWEEN 1000 AND 3000 THEN 'salary is low'
            WHEN v_sal BETWEEN 3001 AND 5000 THEN 'salary is medium'
            WHEN v_sal BETWEEN 5001 AND 10000 THEN 'salary is good'
            ELSE 'salary is High'
        END;
    DBMS_OUTPUT.put_line (v_desc);
END;
/* Formatted on 3/26/2023 7:23:17 AM (QP5 v5.326) */
SELECT *
  FROM EMPLOYEES
 WHERE employee_id = 100;

--define a bind variable v_sal to be a number
--create a block to store the salary for employee_id=100 in this variable
--print the variable

VARIABLE v_sal NUMBER;

BEGIN
    SELECT salary
      INTO :v_sal
      FROM EMPLOYEES
     WHERE employee_id = 100;
END;

PRINT v_sal

-----------------------


SET AUTOPRINT ON
VARIABLE v_sal NUMBER;

BEGIN
    SELECT salary
      INTO :v_sal
      FROM EMPLOYEES
     WHERE employee_id = 100;
END;
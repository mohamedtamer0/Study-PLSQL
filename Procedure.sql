/* Formatted on 03/05/2023 11:01:11 AM (QP5 v5.326) */
CREATE OR REPLACE PROCEDURE UPDATE_SAL (P_EMP_ID   IN NUMBER,
                                        P_AMOUNT   IN NUMBER)
IS
BEGIN
    UPDATE EMPLOYEES
       SET salary = salary + P_AMOUNT
     WHERE employee_id = P_EMP_ID;

    COMMIT;
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.put_line (SQLCODE);
        DBMS_OUTPUT.put_line (SQLERRM);
END;
--
/*
Call The PROCEDURE Alone
*/

EXECUTE UPDATE_SAL(100,200);

--OR

BEGIN
    UPDATE_SAL (&emp_id, &amount);
END;

SELECT *
  FROM EMPLOYEES
 WHERE employee_id = 100;

-------------------------------------------------------

SELECT *
  FROM user_objects
 WHERE object_name = 'UPDATE_SAL';

-------------------------------------------------------

  SELECT *
    FROM user_source
   WHERE name = 'UPDATE_SAL'
ORDER BY line;


--To Drop The Procedure
DROP PROCEDURE UPDATE_SAL;
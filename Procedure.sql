/* Formatted on 01/05/2023 5:14:28 PM (QP5 v5.326) */
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

EXECUTE UPDATE_SAL(&emp_id,&amount);

SELECT *
  FROM EMPLOYEES
 WHERE employee_id = 100;

-------------------------------------------------------
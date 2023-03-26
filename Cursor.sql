/* Formatted on 3/26/2023 8:58:09 AM (QP5 v5.326) */
SELECT *
  FROM EMPLOYEES
 WHERE department_id = 20;

---------------

DECLARE
    v_rows_updated   NUMBER := 0;
BEGIN
    UPDATE EMPLOYEES
       SET salary = salary + 250
     WHERE department_id = 20;

    v_rows_updated := SQL%ROWCOUNT;

    DBMS_OUTPUT.put_line ('the records that updates: ' || v_rows_updated);
END;

COMMIT;

SELECT *
  FROM EMPLOYEES
 WHERE department_id = 20;

 --------------------------------


DECLARE
    v_rows_exist   BOOLEAN := TRUE;
BEGIN
    UPDATE EMPLOYEES
       SET salary = salary + 250
     WHERE department_id = 9999999;

    v_rows_exist := SQL%FOUND;

    IF v_rows_exist = FALSE
    THEN
        DBMS_OUTPUT.put_line ('the sql contains no records retrieved');
    ELSE
        DBMS_OUTPUT.put_line (
            'the sql contains  records retrieved ' || SQL%ROWCOUNT);
    END IF;
END;

COMMIT;
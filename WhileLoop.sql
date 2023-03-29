/* Formatted on 3/29/2023 10:51:02 PM (QP5 v5.326) */
DECLARE
    v_counter   NUMBER := 1;
BEGIN
    WHILE v_counter <= 3
    LOOP
        DBMS_OUTPUT.put_line ('Welcome');
        v_counter := v_counter + 1;
    END LOOP;
END;

-----------------------------


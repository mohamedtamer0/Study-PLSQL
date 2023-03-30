/* Formatted on 30/03/2023 10:53:51 AM (QP5 v5.326) */
DECLARE
    v_star   VARCHAR2 (100);
BEGIN
    FOR i IN 1 .. 5
    LOOP
        FOR j IN 1 .. i
        LOOP
            v_star := v_star || '*';
        END LOOP;

        DBMS_OUTPUT.put_line (v_star);
        v_star := NULL;
    END LOOP;
END;
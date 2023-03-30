/* Formatted on 30/03/2023 10:57:29 AM (QP5 v5.326) */
BEGIN
    FOR i IN 1 .. 10
    LOOP
        DBMS_OUTPUT.put_line (i);
        CONTINUE WHEN i > 5;
        DBMS_OUTPUT.put_line (':)');
    END LOOP;
END;
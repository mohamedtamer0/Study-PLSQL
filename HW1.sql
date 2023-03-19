/* Formatted on 19/03/2023 3:45:09 PM (QP5 v5.326) */
BEGIN
    DBMS_OUTPUT.put_line ('Hello World');
END;

---------------------

BEGIN
    DBMS_OUTPUT.put_line ('Hello World 1');
    DBMS_OUTPUT.put_line ('Hello World 2');
END;


---------------------

DECLARE
BEGIN
    DBMS_OUTPUT.put_line ('Hello World');
END;

---------------------

DECLARE
    n   NUMBER DEFAULT 5;
    v   VARCHAR2 (100) DEFAULT 'Hello World';
BEGIN
    DBMS_OUTPUT.put_line (n);
    DBMS_OUTPUT.put_line (v);
    DBMS_OUTPUT.put_line (n || ' ' || v);
END;
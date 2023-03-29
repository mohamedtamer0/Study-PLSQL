/* Formatted on 29/03/2023 11:59:23 AM (QP5 v5.326) */
DECLARE
    x   NUMBER := 5;
    y   NUMBER;
BEGIN
    IF x <> y
    THEN
        DBMS_OUTPUT.put_line ('Welcome');
    ELSE
        DBMS_OUTPUT.put_line ('Operator with null value always = null');
    END IF;
END;

-- OutPut -> Operator with null value always = null
----------------------

DECLARE
    x   NUMBER := 5;
    y   NUMBER;
BEGIN
    IF NVL (x, 0) <> NVL (y, 0)
    THEN
        DBMS_OUTPUT.put_line ('Welcome');
    ELSE
        DBMS_OUTPUT.put_line ('Operator with null value always = null');
    END IF;
END;

-- OutPut -> Welcome
----------------------

DECLARE
    x   NUMBER;
    y   NUMBER;
BEGIN
    IF x = y
    THEN
        DBMS_OUTPUT.put_line ('Welcome');
    ELSE
        DBMS_OUTPUT.put_line ('Operator with null value always = null');
    END IF;
END;

-- OutPut -> Operator with null value always = null
----------------------

DECLARE
    x   NUMBER;
    y   NUMBER;
BEGIN
    IF x IS NULL AND y IS NULL
    THEN
        DBMS_OUTPUT.put_line ('Welcome');
    ELSE
        DBMS_OUTPUT.put_line ('Operator with null value always = null');
    END IF;
END;

-- OutPut -> Welcome
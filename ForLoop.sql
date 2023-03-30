/* Formatted on 3/29/2023 11:15:30 PM (QP5 v5.326) */
BEGIN
    FOR i IN 1 .. 3
    LOOP
        DBMS_OUTPUT.put_line ('Welcome ' || i);
    END LOOP;
END;

--------------------

BEGIN
    FOR i IN 1 .. 1
    LOOP
        DBMS_OUTPUT.put_line ('Welcome ' || i);
    END LOOP;
END;

--------------------

BEGIN
    FOR i IN 3 .. 5
    LOOP
        DBMS_OUTPUT.put_line ('Welcome ' || i);
    END LOOP;
END;

--------------------

BEGIN
    FOR i IN REVERSE 1 .. 3
    LOOP
        DBMS_OUTPUT.put_line ('Welcome ' || i);
    END LOOP;
END;

--------------------

BEGIN
    FOR i IN 1 .. 9 / 2
    LOOP
        DBMS_OUTPUT.put_line ('Welcome ' || i);
    END LOOP;
END;

--------------------

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
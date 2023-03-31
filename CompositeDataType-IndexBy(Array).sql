/* Formatted on 3/31/2023 5:41:43 PM (QP5 v5.326) */
DECLARE
    TYPE tab_no IS TABLE OF VARCHAR2 (100)
        INDEX BY PLS_INTEGER;

    v_tab_no   tab_no;
BEGIN
    v_tab_no (1) := 'Osama Mohamed';
    v_tab_no (6) := 'Elzero';
    v_tab_no (4) := 'Mohamed Tamer';
    DBMS_OUTPUT.put_line (v_tab_no (1));
    DBMS_OUTPUT.put_line (v_tab_no (6));
    DBMS_OUTPUT.put_line (v_tab_no (4));
END;

----------------

DECLARE
    TYPE tab_no IS TABLE OF VARCHAR2 (100)
        INDEX BY pls_integer;

    v_tab_no   tab_no;
    v_total    NUMBER;
BEGIN
    v_tab_no (1) := 'Osama Mohamed';
    v_tab_no (2) := 'Tamer Mohamed';
    v_tab_no (3) := 'Elzero';
    v_tab_no (6) := 'Alwqar';

    FOR i IN 1 .. 10
    LOOP
        IF v_tab_no.EXISTS (i)
        THEN
            DBMS_OUTPUT.put_line (
                   'the element '
                || i
                || ' is exists in the array and ='
                || v_tab_no (i));
        ELSE
            DBMS_OUTPUT.put_line (
                'the element ' || i || 'is not exist in the array');
        END IF;
    END LOOP;
END;
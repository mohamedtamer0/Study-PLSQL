/* Formatted on 3/31/2023 8:44:29 PM (QP5 v5.326) */
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
        INDEX BY PLS_INTEGER;

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

    v_total := v_tab_no.COUNT;
    DBMS_OUTPUT.put_line ('the total elements in the array=' || v_total);
    DBMS_OUTPUT.put_line (
        'the first element index in the array=' || v_tab_no.FIRST);
    DBMS_OUTPUT.put_line (
        'the Next element index after index 3=' || v_tab_no.NEXT (3));
END;


---------------------------------

DECLARE
    TYPE tab_no IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;

    v_tab_no  tab_no ;
BEGIN
    FOR i IN 100 .. 104
    LOOP
        SELECT *
          INTO v_tab_no (i)
          FROM employees
         WHERE employee_id = i;

        DBMS_OUTPUT.put_line (
               v_tab_no (i).employee_id
            || ' '
            || v_tab_no (i).first_name
            || ' '
            || v_tab_no (i).last_name);
    END LOOP;
END;
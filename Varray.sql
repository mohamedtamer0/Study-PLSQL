/* Formatted on 4/1/2023 10:14:09 AM (QP5 v5.326) */
DECLARE
    TYPE t_names IS VARRAY (3) OF VARCHAR2 (100);

    nam   t_names;
BEGIN
    nam := t_names ('Mohamed', 'Elzer', 'Tamer');
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
    DBMS_OUTPUT.put_line (nam (3));
END;

---------------------

DECLARE
    TYPE t_names IS VARRAY (3) OF VARCHAR2 (100);

    nam   t_names;
BEGIN
    nam := t_names ('Mohamed', 'Elzer', 'Tamer');
    nam.TRIM (1);                       --this delete one element from last...
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
--DBMS_OUTPUT.put_line (nam (3));
END;
/* Formatted on 3/31/2023 8:53:09 PM (QP5 v5.326) */
DECLARE
    TYPE t_name IS TABLE OF VARCHAR2 (100);

    nam   t_name;
BEGIN
    nam := t_name ('Mohamed', 'Osama', 'Omar');
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
    DBMS_OUTPUT.put_line (nam (3));
END;
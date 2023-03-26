/* Formatted on 3/26/2023 8:25:18 AM (QP5 v5.326) */
DECLARE
    v_global   VARCHAR2 (100) := 'this is a global Var';
BEGIN
    DECLARE
        v_local   VARCHAR2 (100) := 'this is a local Var';
    BEGIN
        DBMS_OUTPUT.put_line (v_global);
        DBMS_OUTPUT.put_line (v_local);
    END;

    DBMS_OUTPUT.put_line (v_global);
--    DBMS_OUTPUT.put_line (v_local); (Not working because this a local)
END;


-------------------------


DECLARE
    v_father_name   VARCHAR2 (100) := 'Tamer';
    v_birthday      DATE := '18-JUN-1996';
BEGIN
    DECLARE
        v_child      VARCHAR2 (100) := 'Lea';
        v_birthday   DATE := '20-JUN-2027';
    BEGIN
        DBMS_OUTPUT.put_line ('the father name is ' || v_father_name);
        DBMS_OUTPUT.put_line ('the father birthday is ' || v_birthday);
        DBMS_OUTPUT.put_line ('the child name is ' || v_child);
        DBMS_OUTPUT.put_line ('the child birthday is ' || v_birthday);
    END;
END;
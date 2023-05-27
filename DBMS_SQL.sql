/* Formatted on 5/27/2023 10:28:28 PM (QP5 v5.326) */
CREATE TABLE emp1
(
    empid    NUMBER
);

CREATE OR REPLACE PROCEDURE delete_any_table (p_table_name VARCHAR2)
IS
    v_no_rec   NUMBER;
    v_cur_id   NUMBER;
BEGIN
    v_cur_id := DBMS_SQL.open_cursor;
    DBMS_SQL.parse (v_cur_id,
                    'delete from ' || p_table_name,
                    DBMS_SQL.native);
    v_no_rec := DBMS_SQL.execute (v_cur_id);
    DBMS_OUTPUT.Put_line (
        v_no_rec || ' record(s) deleted from ' || p_table_name);
    COMMIT;
END;

EXECUTE delete_any_table('emp1');
/* Formatted on 21/03/2023 10:05:25 AM (QP5 v5.326) */
DECLARE
    v_date   DATE;
    v_no     NUMBER := 10;
    v_name   VARCHAR2 (100) NOT NULL := 'Tamer';
BEGIN
    DBMS_OUTPUT.put_line (V_date);
    DBMS_OUTPUT.put_line (V_no);
    DBMS_OUTPUT.put_line (V_name);

    v_no := v_no + 10;
    v_name := 'Eren';
    DBMS_OUTPUT.put_line (V_name);
    v_date := '21-Mar-2023';
    DBMS_OUTPUT.put_line (V_date);
END;
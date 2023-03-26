/* Formatted on 3/26/2023 6:53:44 AM (QP5 v5.326) */
BEGIN
    DBMS_OUTPUT.put_line ('Mother''s day');
END;
----------------

SELECT 'today is the Mother''s day' FROM DUAL;

----------------

SELECT q'(today is the Mother's day)' FROM DUAL;

----------------

SELECT q'[today is the Mother's day]' FROM DUAL;

----------------

BEGIN
    DBMS_OUTPUT.put_line ('Mother''s day');
    DBMS_OUTPUT.put_line (q'(Mother's day)');
END;
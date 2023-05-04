/* Formatted on 5/5/2023 12:18:55 AM (QP5 v5.326) */
--assume the length for tel is 12
--Ex 01500000000
--we need a procedure to format the 01500000000 to 015(000)00000


CREATE OR REPLACE PROCEDURE formate_tel (p_tel IN OUT VARCHAR2)
IS
BEGIN
    p_tel :=
           SUBSTR (p_tel, 1, 3)
        || '('
        || SUBSTR (p_tel, 4, 3)
        || ')'
        || SUBSTR (p_tel, 7);
END;

------------------

VARIABLE b_tele VARCHAR2 ( 20 );

EXECUTE :b_tele:='01500000000';

EXECUTE formate_tel(:b_tele);

PRINT b_tele;


------------------

--another ay

DECLARE
    v_tel   VARCHAR2 (100) := '01500000000';
BEGIN
    formate_tel (v_tel);
    DBMS_OUTPUT.put_line (v_tel);
END;
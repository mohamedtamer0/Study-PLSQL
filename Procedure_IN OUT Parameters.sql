/* Formatted on 5/5/2023 12:04:05 AM (QP5 v5.326) */
--assume the length for tel is 12
--Ex 01500000000
--we need a procedure to format the 01500000000 to 015(000)00000

/* Formatted on 5/5/2023 12:07:14 AM (QP5 v5.326) */
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

variable b_tele varchar2(20);

execute :b_tele:='01500000000';

execute formate_tel(:b_tele);

PRINT b_tele;

/* Formatted on 5/13/2023 5:56:31 PM (QP5 v5.326) */
CREATE OR REPLACE PACKAGE override
IS
    FUNCTION TO_CHAR (p1 NUMBER, p2 DATE)
        RETURN VARCHAR2;

    PROCEDURE PRINT;
END;

----

CREATE OR REPLACE PACKAGE BODY override
IS
    FUNCTION TO_CHAR (p1 NUMBER, p2 DATE)
        RETURN VARCHAR2
    IS
    BEGIN
        RETURN p1 || p2;
    END;

    PROCEDURE PRINT
    IS
    BEGIN
        DBMS_OUTPUT.put_line (TO_CHAR (1, '13-MAY-2023'));
        DBMS_OUTPUT.put_line (STANDARD.TO_CHAR (10));
    END;
END;


execute override.print;
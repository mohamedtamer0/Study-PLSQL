/* Formatted on 5/11/2023 11:08:32 PM (QP5 v5.326) */
CREATE OR REPLACE PACKAGE p_test
IS
    c_var1   CONSTANT NUMBER := 10;
    c_var2            VARCHAR2 (100) := 'welcome';

    PROCEDURE PRINT;
END;

------------------

CREATE OR REPLACE PACKAGE BODY p_test
IS
    c_var3   VARCHAR2 (100) := 'hi there';

    PROCEDURE PRINT
    IS
        c_var4   VARCHAR2 (100) := 'hi';
    BEGIN
        DBMS_OUTPUT.put_line (
            'this variable come from package spec. ' || c_var1);
        DBMS_OUTPUT.put_line (
            'this variable come from package spec. ' || c_var2);
        DBMS_OUTPUT.put_line (
            'this variable come from package spec. ' || c_var3);
        DBMS_OUTPUT.put_line (
            'this variable come from package spec. ' || c_var4);
    END;
END;

EXECUTE p_test.print;
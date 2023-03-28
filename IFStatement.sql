/* Formatted on 28/03/2023 9:00:49 AM (QP5 v5.326) */
DECLARE
    v_no   NUMBER := &v;
BEGIN
    IF v_no >= 10
    THEN
        DBMS_OUTPUT.put_line ('the number you enterd is >= 10');
    END IF;
END;


------------------------


DECLARE
    v_no   NUMBER := &v;
BEGIN
    IF v_no >= 10
    THEN
        DBMS_OUTPUT.put_line ('the number you enterd is >= 10');
    ELSE
        DBMS_OUTPUT.put_line ('the number you enterd is less than 10');
    END IF;
END;

--------------------

DECLARE
    v_grade   NUMBER := &v;
BEGIN
    IF v_grade BETWEEN 90 AND 100
    THEN
        DBMS_OUTPUT.put_line ('the grade is A');
    ELSIF v_grade BETWEEN 80 AND 89
    THEN
        DBMS_OUTPUT.put_line ('the grade is B');
    ELSIF v_grade BETWEEN 70 AND 79
    THEN
        DBMS_OUTPUT.put_line ('the grade is C');
    ELSIF v_grade BETWEEN 60 AND 69
    THEN
        DBMS_OUTPUT.put_line ('the grade is D');
    ELSE
        DBMS_OUTPUT.put_line ('the grade is F');
    END IF;
END;


-----------------------


-- null Vlaue in if

DECLARE
    v_no   NUMBER;
BEGIN
    IF v_no >= 10
    THEN
        DBMS_OUTPUT.put_line ('the number you enterd is >= 10');
    ELSE
        DBMS_OUTPUT.put_line ('the number you enterd is less than 10');
    END IF;
END;
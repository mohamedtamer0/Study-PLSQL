/* Formatted on 08/05/2023 12:49:28 PM (QP5 v5.326) */
DROP TABLE student;

CREATE TABLE student
(
    student_id    NUMBER,
    first_name    VARCHAR2 (100),
    birthday      DATE,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
);

DROP SEQUENCE student_seq;

CREATE SEQUENCE student_seq;

-------------------
--1 We Create the Package spec...

CREATE OR REPLACE PACKAGE General_student
IS
    PROCEDURE insert_student (p_first_name VARCHAR2, p_birthday DATE);

    PROCEDURE delete_student (p_student_id NUMBER);

    FUNCTION get_name (p_student_id NUMBER)
        RETURN VARCHAR2;
END;

-------------------
--2 We Create the Package body

CREATE OR REPLACE PACKAGE BODY General_student
IS
    PROCEDURE insert_student (p_first_name VARCHAR2, p_birthday DATE)
    IS
    BEGIN
        INSERT INTO student
             VALUES (student_seq.NEXTVAL, p_first_name, p_birthday);

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            DBMS_OUTPUT.put_line (SQLCODE);
            DBMS_OUTPUT.put_line (SQLERRM);
    END;

    PROCEDURE delete_STUDENT (p_student_id NUMBER)
    IS
    BEGIN
        DELETE FROM student
              WHERE student_id = p_student_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            DBMS_OUTPUT.put_line (SQLCODE);
            DBMS_OUTPUT.put_line (SQLERRM);
    END;


    FUNCTION get_name (p_student_id NUMBER)
        RETURN VARCHAR2
    IS
        v_name   student.first_name%TYPE;
    BEGIN
        SELECT first_name
          INTO v_name
          FROM student
         WHERE student_id = p_student_id;

        RETURN v_name;
    EXCEPTION
        WHEN OTHERS
        THEN
            RETURN NULL;
    END;
END;

--------------------------


EXECUTE GENERAL_STUDENT.INSERT_STUDENT('Mohamed Tamer','08-MAY-23');
EXECUTE GENERAL_STUDENT.INSERT_STUDENT('Osama Mohamed','08-MAY-23');

SELECT * FROM STUDENT;

EXECUTE GENERAL_STUDENT.delete_STUDENT(1);

select GENERAL_STUDENT.GET_NAME(2)from dual;
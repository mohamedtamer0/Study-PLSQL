/* Formatted on 5/27/2023 11:16:49 PM (QP5 v5.326) */
CREATE TABLE emp2
(
    test_value    VARCHAR2 (25)
);

CREATE OR REPLACE PROCEDURE child_block
IS
BEGIN
    INSERT INTO emp2 (test_value)
         VALUES ('Child block insert');

    COMMIT;
END child_block;

CREATE OR REPLACE PROCEDURE parent_block
IS
BEGIN
    INSERT INTO emp2 (test_value)
         VALUES ('Parent block insert');

    child_block;
    ROLLBACK;
END parent_block;

EXECUTE parent_block;

SELECT * FROM emp2;
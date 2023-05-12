/* Formatted on 5/13/2023 2:16:00 AM (QP5 v5.326) */
DROP TABLE customer;

CREATE TABLE customer
(
    cust_id     NUMBER,
    name        VARCHAR2 (100),
    birthday    DATE
);

-----------------------

CREATE OR REPLACE PACKAGE overload_procedure
IS
    PROCEDURE add_cust (p_id NUMBER, p_name VARCHAR2, p_bd DATE);

    PROCEDURE add_cust (p_id NUMBER, p_name VARCHAR2);
END;

-------

CREATE OR REPLACE PACKAGE BODY overload_procedure
IS
    PROCEDURE add_cust (p_id NUMBER, p_name VARCHAR2, p_bd DATE)
    IS
    BEGIN
        INSERT INTO customer (cust_id, name, birthday)
             VALUES (p_id, p_name, p_bd);

        COMMIT;
    END;

    PROCEDURE add_cust (p_id NUMBER, p_name VARCHAR2)
    IS
    BEGIN
        INSERT INTO customer (cust_id, name)
             VALUES (p_id, p_name);

        COMMIT;
    END;
END;

EXECUTE overload_procedure.add_cust(1,'Tamer','13-MAY-2023');

SELECT * FROM customer;
/* Formatted on 4/1/2023 10:07:32 AM (QP5 v5.326) */
DECLARE
    TYPE t_name IS TABLE OF VARCHAR2 (100);

    nam   t_name;
BEGIN
    nam := t_name ('Mohamed', 'Osama', 'Omar');
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
    DBMS_OUTPUT.put_line (nam (3));
END;

----------------

DECLARE
    TYPE t_name IS TABLE OF VARCHAR2 (100);

    nam   t_name;
BEGIN
    nam := t_name ('Mohamed', 'Osama', 'Omar');
    nam.EXTEND;
    nam (4) := 'Tamer';
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
    DBMS_OUTPUT.put_line (nam (3));
    DBMS_OUTPUT.put_line (nam (4));
END;

----------------

DECLARE
    TYPE t_name IS TABLE OF VARCHAR2 (100);

    nam   t_name;
BEGIN
    nam := t_name ('Mohamed', 'Osama', 'Omar');
    nam.delete (2);
    nam (2) := 'Tamer';
    DBMS_OUTPUT.put_line (nam (1));
    DBMS_OUTPUT.put_line (nam (2));
    DBMS_OUTPUT.put_line (nam (3));
END;

----------------

DROP TABLE x_customer;
DROP TYPE t_tel;

CREATE OR REPLACE TYPE t_tel AS TABLE OF NUMBER;

CREATE TABLE x_customer
(
    cust_id      NUMBER,
    cust_name    VARCHAR2 (100),
    tel          t_tel
)
NESTED TABLE tel
    STORE AS t_tel_tbl;

INSERT INTO x_customer (cust_id, cust_name, tel)
     VALUES (1, 'Tamer', t_tel (2634734, 78348, 837483));

SELECT * FROM x_customer;
/* Formatted on 3/31/2023 9:41:14 PM (QP5 v5.326) */
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

drop table x_customer;
drop type t_tel;

create or replace type t_tel as table of number;

create table x_customer
(
cust_id number,
cust_name varchar2(100),
tel t_tel
)

nested table tel store as t_tel_tbl;

insert into x_customer (cust_id,cust_name,tel)
values (1,'Tamer',t_tel(2634734,78348,837483));

select * from x_customer;
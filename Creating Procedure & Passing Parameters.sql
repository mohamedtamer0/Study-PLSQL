/* Formatted on 5/5/2023 1:05:23 AM (QP5 v5.326) */
CREATE TABLE products
(
    prod_id      NUMBER,
    prod_name    VARCHAR2 (20),
    prod_type    VARCHAR2 (20),
    CONSTRAINT products_pk PRIMARY KEY (prod_id)
);

------------------------

CREATE OR REPLACE PROCEDURE add_products (p_prod_id     NUMBER,
                                          p_prod_name   VARCHAR2,
                                          p_prod_type   VARCHAR2)
IS
BEGIN
    INSERT INTO products
         VALUES (p_prod_id, p_prod_name, p_prod_type);

    COMMIT;
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.put_line ('error in insert');
        DBMS_OUTPUT.put_line (SQLCODE);
        DBMS_OUTPUT.put_line (SQLERRM);
END;

------------------------

EXECUTE add_products(1,'IPHONE','Apple');

SELECT * FROM products;

------------------------

EXECUTE add_products (p_prod_id=>2,p_prod_name=>'IPHONE14', p_prod_type=>'Apple');

SELECT * FROM products;


------------------------

EXECUTE add_products (p_prod_name=>'Ipad',p_prod_id=>3, p_prod_type=>'Apple');

SELECT * FROM products;
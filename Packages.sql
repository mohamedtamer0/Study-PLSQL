/* Formatted on 5/5/2023 9:28:33 PM (QP5 v5.326) */
CREATE OR REPLACE PACKAGE area
IS
    FUNCTION square_area (p_side NUMBER)
        RETURN NUMBER;

    FUNCTION rectangle_area (p_l NUMBER, p_w NUMBER)
        RETURN NUMBER;
END;

-------------------

CREATE OR REPLACE PACKAGE BODY area
IS
    FUNCTION square_area (p_side NUMBER)
        RETURN NUMBER
    IS
    BEGIN
        RETURN p_side * p_side;
    END;


    FUNCTION rectangle_area (p_l NUMBER, p_w NUMBER)
        RETURN NUMBER
    IS
    BEGIN
        RETURN p_l * p_w;
    END;
END;

---

SELECT area.square_area (4) FROM DUAL;

SELECT area.rectangle_area (4, 10) FROM DUAL;
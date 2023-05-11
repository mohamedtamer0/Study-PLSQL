/* Formatted on 5/11/2023 10:42:36 PM (QP5 v5.326) */
CREATE OR REPLACE PACKAGE global_Measurement
IS
    c_mile_to_km     CONSTANT NUMBER := 1.6093;
    c_kilo_to_mile   CONSTANT NUMBER := 0.6214;
END;

------------------

EXECUTE dbms_outPut.Put_line('60 mile :=' || 60 * global_Measurement.c_mile_to_km|| ' KM');

EXECUTE dbms_outPut.Put_line('100 KM :=' || 100 * global_Measurement.c_kilo_to_mile|| ' Mile');

------------------

--You can create function that read from this package

CREATE OR REPLACE FUNCTION get_mile_to_km (p_value NUMBER)
    RETURN NUMBER
IS
BEGIN
    RETURN p_value * global_Measurement.c_mile_to_km;
END;

SELECT get_mile_to_km (100) FROM DUAL;
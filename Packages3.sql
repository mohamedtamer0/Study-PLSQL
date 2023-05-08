/* Formatted on 08/05/2023 12:57:03 PM (QP5 v5.326) */
CREATE OR REPLACE PACKAGE global_Measurement
IS
    c_mile_to_km     CONSTANT NUMBER := 1.6093;
    c_kilo_to_mile   CONSTANT NUMBER := 0.6214;
END;

------------------

execute dbms_outPut.Put_line('60 mile :=' || 60 * global_Measurement.c_mile_to_km|| ' KM');
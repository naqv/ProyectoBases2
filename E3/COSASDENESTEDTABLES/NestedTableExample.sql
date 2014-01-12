-- DESCIFRANDO LAS NESTED TABLE

CREATE OR REPLACE TYPE caja_t AS OBJECT(
   id VARCHAR(5)
);
/

CREATE OR REPLACE TYPE ref_caja_t AS OBJECT (
   miDato REF caja_t
);
/

CREATE OR REPLACE TYPE caja_nt AS TABLE OF ref_caja_t;
/ 

CREATE OR REPLACE TYPE prueba_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(30,5),
    misCajas caja_nt
);
/

CREATE TABLE prueba_table OF prueba_t
NESTED TABLE misCajas  STORE AS EVIL_NESTED_TABLE;

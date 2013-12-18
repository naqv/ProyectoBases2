
CREATE OR REPLACE TYPE ruta_t AS OBJECT(
nombre VARCHAR(100),
inicioLatitud coordenada_t,
inicioLongitud coordenada_t,
finLatitud coordenada_t,
finLongitud coordenada_t,
cantidadVisitas INTEGER(20),
tipo VARCHAR(20),
fechaIngreso DATE,
descripcion VARCHAR(500),
RutaEn REF hito_t)NOT FINAL;
/

CREATE OR REPLACE TYPE ref_to_ruta AS OBJECT(toRuta REF ruta_t);
/

CREATE OR REPLACE TYPE ref_to_ruta_table AS TABLE OF ref_to_ruta;
/

CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(30,5),
    estaEnRefs 		    ref_to_ruta_table
);
/

ALTER TYPE ruta_t ADD ATTRIBUTE (estaEn REF ciudad_t) CASCADE;
/


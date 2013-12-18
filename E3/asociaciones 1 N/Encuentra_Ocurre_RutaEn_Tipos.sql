CREATE OR REPLACE TYPE acompanante_t AS OBJECT(tipo VARCHAR(30),numero INTEGER(10));
/
CREATE OR REPLACE TYPE acompanantes_t AS VARRAY(3) OF acompanante_t;
/
CREATE OR REPLACE TYPE multi_t AS OBJECT(
atributomultivaluado VARCHAR(40));
/
CREATE OR REPLACE TYPE multis_t AS VARRAY(7) OF multi_t;
/
CREATE OR REPLACE TYPE telefono_t AS OBJECT(codigo NUMBER(5),numero NUMBER(7));
/
CREATE OR REPLACE TYPE coordenada_t AS OBJECT(angulo NUMERIC(20),minuto NUMERIC(20),segundo NUMERIC(20));
/
CREATE OR REPLACE TYPE boolean_t AS OBJECT(booleano NUMBER(1));
/
CREATE OR REPLACE TYPE time_t AS OBJECT(hora NUMERIC(30),minuto NUMERIC(30),segundo NUMERIC(30));
/
CREATE OR REPLACE TYPE nombres_t AS OBJECT(
nombre1 NUMERIC(20),
nombre2 NUMERIC(20),
apellido1 NUMERIC(20),
apellido2 NUMERIC(20));
/

-- Tipo Via.
-- Elimine el atributo seEncuentraEn porque no iba ahi
CREATE OR REPLACE TYPE via_t AS OBJECT(
    nombre              VARCHAR(100),
    tipo                VARCHAR(50),
    tiposTransporte     multis_t,
    inicioLatitud       coordenada_t,
    inicioLongitud      coordenada_t,
    finLatitud          coordenada_t,
    finLongintud        coordenada_t
);
/

CREATE OR REPLACE TYPE ref_to_via AS OBJECT (toVia REF via_t);
/

CREATE OR REPLACE TYPE refs_to_via AS TABLE OF ref_to_via;
/


-- Tipo Evento
CREATE OR REPLACE TYPE evento_t AS OBJECT(
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),
    costoMonedaLocal    NUMERIC(30,5),
    descripcion         CLOB,
    fechaInicio         DATE,
    fechaFin            DATE
);
/

CREATE OR REPLACE TYPE ref_to_evento AS OBJECT (toEvento REF evento_t);
/
CREATE OR REPLACE TYPE refs_to_evento AS TABLE OF ref_to_evento;
/


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
    EstaEn REF ciudad_t)NOT FINAL;
/

CREATE OR REPLACE TYPE ref_to_ruta AS OBJECT (toRuta REF ruta_t);
/
CREATE OR REPLACE TYPE refs_to_ruta AS TABLE OF ref_to_ruta;
/

CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(30,5),
    seEncuentraEnRefs   refs_to_via,
    estaEnRefs 		    ref_to_ruta_table
);
/

ALTER TYPE via_t ADD ATTRIBUTE (seEncuentraEn REF ciudad_t) CASCADE;
/

ALTER TYPE ruta_t ADD ATTRIBUTE (estaEn REF ciudad_t) CASCADE;
/


-- Agregue ocurreRefs y rutaEnRefs
CREATE OR REPLACE TYPE hito_t AS OBJECT(
    nombre          VARCHAR(100),
    latitud         coordenada_t,
    longitud        coordenada_t,
    altitud         coordenada_t,
    descripcion     CLOB,
    estado          VARCHAR(50),
    categoria       multis_t,
    edadApropiada   INTEGER(2),
    paginaweb       VARCHAR(30),
    telefono        telefono_t,
    email           VARCHAR(100),
    foto            BLOB,
    horario         VARCHAR(50),
    tarifadescuento VARCHAR(100),
    costoTicketMonedaLocal NUMERIC(30,5),
    ocurreRefs      refs_to_evento,      
    contiene        REF hito_t,
    rutaEnRefs      refs_to_ruta
);
/

ALTER TYPE evento_t ADD ATTRIBUTE (ocurre REF hito_t) CASCADE;
/

ALTER TYPE ruta_t ADD ATTRIBUTE (rutaEn REF hito_t) CASCADE;
/



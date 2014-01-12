


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
    ocurreRefs      refs_to_evento,
    rutaEnRefs      refs_to_ruta)
/


ALTER TYPE ruta_t ADD ATTRIBUTE (rutaEn REF hito_t) CASCADE;
/





-- Tabla Ruta
CREATE TABLE ruta_table OF ruta_t 
    NESTED TABLE partesVia STORE AS PARTESVIA_RUTA 
;

-- Tabla Via
CREATE TABLE via_table OF via_t 
    NESTED TABLE todoRuta STORE AS TODORUTA_VIA 
;
-- Tabla Telefono
CREATE TABLE telefonos_tab OF telefono_t;

-- Tabla Coordenada
CREATE TABLE coordenada_table OF coordenada_t;

-- Tabla Boolean
CREATE TABLE boolean_table OF boolean_t(
    CONSTRAINT cont_boolean CHECK(booleano IN(0,1))
);

-- Tabla Nombres
CREATE TABLE nombres_table OF nombres_t;

-- Tabla Ciudad
CREATE TABLE ciudad_table OF ciudad_t
NESTED TABLE SeEncuentraEnRefs STORE AS VIA_SEENCUENTRAEN_CIUDAD
NESTED TABLE estaEnRefs STORE AS RUTA_ESTAEN_CIUDAD;

-- Tabla Hito
CREATE TABLE hito_table OF hito_t(
    CONSTRAINT cont_estado CHECK(estado IN('disponible','en reparacion','clausurado temporalmente')),
    FOREIGN KEY(contiene) references hito_table
)
NESTED TABLE ocurreRefs STORE AS EVENTO_OCURRE_HITO
NESTED TABLE rutaEnRefs STORE AS RUTA_RUTAEN_HITO;


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

-- Tabla Hito
CREATE TABLE hito_table OF hito_t(
    CONSTRAINT cont_estado CHECK(estado IN('disponible','en reparacion','clausurado temporalmente')),
    FOREIGN KEY(contiene) references hito_table
);

-- Tabla Ciudad
CREATE TABLE ciudad_table OF ciudad_t;

-- Tabla Usuario
CREATE TABLE usuario_table OF usuario_t(
    CONSTRAINT cont_genero CHECK (genero IN ('F', 'M')))
    NESTED TABLE creaRefs STORE AS USUARIO_CREA_DINAMICA;
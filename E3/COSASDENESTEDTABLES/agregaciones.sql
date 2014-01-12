-- Tipo Ruta
CREATE OR REPLACE TYPE ruta_t AS OBJECT(
    nombre          VARCHAR(100),
    inicioLatitud   coordenada_t,
    inicioLongitud  coordenada_t,
    finLatitud      coordenada_t,
    finLongitud     coordenada_t,
    cantidadVisitas INTEGER(20),
    tipo            VARCHAR(20),
    fechaIngreso    DATE,
    descripcion     VARCHAR(500),
    RutaEn          REF hito_t,
    EstaEn          REF ciudad_t
)NOT FINAL;
/

-- Tipo Via
CREATE OR REPLACE TYPE via_t AS OBJECT(
    nombre              VARCHAR(100),
    tipo                VARCHAR(50),
    tiposTransporte     multis_t,
    inicioLatitud       coordenada_t,
    inicioLongitud      coordenada_t,
    finLatitud          coordenada_t,
    finLongintud        coordenada_t,
    SeEncuentraEn REF   ciudad_t
);
/

-- Tabla Ruta
CREATE TABLE ruta_table OF ruta_t(
	PRIMARY KEY(nombre),
	CONSTRAINT cont_tip CHECK(tipo IN('dinamica','fija')),
	FOREIGN KEY(RutaEn) references hito_table,
	FOREIGN KEY(EstaEn) references ciudad_table);

-- Tabla Via
CREATE TABLE via_table OF via_t(
    PRIMARY KEY (nombre),
    CONSTRAINT  cont_tipvia CHECK (tipo IN('calle','avenida','caminerıa','autopista','elevado','camino','puente')),
    FOREIGN     key(SeEncuentraEn) references ciudad_table
);

CREATE OR REPLACE TYPE hito_t AS OBJECT(
    nombre                    VARCHAR(100),
    latitud                   coordenada_t,
    longitud                  coordenada_t,
    altitud                   coordenada_t,
    descripcion               CLOB,
    estado                    VARCHAR(50),
    categoria                 multis_t,
    edadApropiada             INTEGER(2),
    paginaweb                 VARCHAR(30),
    telefono                  telefono_t,
    email                     VARCHAR(100),
    foto                      BLOB,
    horario                   VARCHAR(50),
    tarifadescuento           VARCHAR(100),
    costoTickerMonedaLocal    NUMERIC(30,5),
    contiene                  REF hito_t    
);
/

-- Tabla Hito
CREATE TABLE hito_table OF hito_t(
    PRIMARY KEY (nombre),
    CONSTRAINT cont_estado CHECK(estado IN('disponible','en reparacion','clausurado temporalmente')),
    FOREIGN KEY(contiene) references hito_table
);


------------ AGREGACIONES -----------------
-- Agregue un primary key en via_table
-- Agregue un primary key en hito_table

-- Agregacion Ruta-Via
CREATE OR REPLACE TYPE agr_via_t AS OBJECT(
    ruta    REF ruta_t,
    via     REF via_t
);
/








CREATE TABLE agr_via_table OF agr_via_t(
    FOREIGN KEY (nombre) REFERENCES ruta_tabla,
    FOREIGN KEY (nombre) REFERENCES via_tabla
    
);

-- Agregacion Ruta-Hito
CREATE OR REPLACE TYPE agr_hito_t AS OBJECT(
    ruta    REF ruta_t,
    hito    REF hito_t
);
/

CREATE TABLE agr_hito_table OF agr_hito_t(
    FOREIGN KEY (nombre) REFERENCES ruta_tabla,
    FOREIGN KEY (nombre) REFERENCES hito_tabla 
);





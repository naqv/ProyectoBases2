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
CREATE OR REPLACE TYPE hito_t AS OBJECT(
  nombre       VARCHAR(100),
  latitud      coordenada_t,
  longitud     coordenada_t,
  altitud      coordenada_t,
  descripcion  CLOB,
  estado       VARCHAR(50),
  categoria    multis_t,
  edadApropiada   INTEGER(2),
  paginaweb      VARCHAR(30),
  telefono       telefono_t,
  email          VARCHAR(100),
  foto BLOB,
  horario VARCHAR(50),
  tarifadescuento VARCHAR(100),
  costoTickerMonedaLocal NUMERIC(30,5),
  contiene REF hito_t
  );
  /
CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
 nombre  VARCHAR(100),
 pais    VARCHAR(100),
 nombreMonedaLocal VARCHAR(30),
 relacionLocalUSD  NUMERIC(30,5));
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
RutaEn REF hito_t,
EstaEn REF ciudad_t)NOT FINAL;
/
CREATE OR REPLACE TYPE dinamica_t UNDER ruta_t(propuestaFija NUMERIC(1));
/

CREATE OR REPLACE TYPE ref_to_dinamica AS OBJECT(toDinamica REF dinamica_t);
/

CREATE OR REPLACE TYPE refs_to_dinamica AS TABLE OF ref_to_dinamica;
/
CREATE OR REPLACE TYPE usuario_t AS OBJECT(
    alias           VARCHAR(100),
    nombre          nombres_t,
    email           VARCHAR(100),
    contrasena      VARCHAR(30),
    genero          VARCHAR(1),
    fechaNacimiento DATE,
    esEstudiante    boolean_t,
    interes  		multis_t,
    biografia       CLOB,
    creaRefs 		refs_to_dinamica
);
/

ALTER TYPE dinamica_t ADD ATTRIBUTE (Crea REF usuario_t) CASCADE;
/

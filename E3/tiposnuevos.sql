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
CREATE OR REPLACE TYPE usuario_t AS OBJECT(
    alias           VARCHAR(100),
    nombre          nombres_t,
    email           VARCHAR(100),
    contrasena      VARCHAR(30),
    genero          VARCHAR(1),
    fechaNacimiento DATE,
    esEstudiante    boolean_t,
    interes       multis_t,
    biografia       CLOB);
/

CREATE OR REPLACE TYPE dinamica_t UNDER ruta_t(propuestaFija NUMERIC(1),Crea REF usuario_t);
/
CREATE OR REPLACE TYPE fija_t UNDER ruta_t();
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

-- Tipo Evento
CREATE OR REPLACE TYPE evento_t AS OBJECT(
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),
    costoMonedaLocal    NUMERIC(30,5),
    descripcion         CLOB,
    ocurre              REF hito_t,
    fechaInicio         DATE,
    fechaFin            DATE
);
/
-- Tipo Servicio
CREATE OR REPLACE TYPE servicio_t AS OBJECT (
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),
    numeroDeContacto    telefono_t,
    email               VARCHAR(100),
    paginaweb           VARCHAR(100),
    descripcion         CLOB,
    direccion           VARCHAR(100),
    esGratuito          boolean_t,
    latitud             coordenada_t,
    longitud            coordenada_t,
    tieneServicio       REF Servicio_t,
    tiene               REF hito_t
)NOT FINAL;
/

-- Tipo Valoracion
CREATE OR REPLACE TYPE valoracion_t AS OBJECT (
    nivelSeguridad      INTEGER(10),
    relacionPrecioValor INTEGER(10),
    puntuacion          INTEGER(10),
    comentario          VARCHAR(140));
/
CREATE OR REPLACE TYPE paquete_t UNDER servicio_t (
  nombrePaquete  VARCHAR(100),
  costoEstudiante  NUMERIC(30,5),
  costoEstandar    NUMERIC(30,5),
  costoTerceraEdad NUMERIC(30,5),
  costoNino        NUMERIC(30,5),
  descripcionPaquete    CLOB,
  incluye REF ruta_t);
/
CREATE OR REPLACE TYPE contrata_t AS OBJECT (
  companero acompanantes_t,
  paquete  REF paquete_t,
  usuario REF usuario_t);
 /

CREATE OR REPLACE TYPE SeAccedePor AS OBJECT(hito REF hito_t,via  REF via_t);
/
CREATE OR REPLACE TYPE Tiene AS OBJECT(
  hito REF hito_t,
  servicio REF servicio_t);
 /
CREATE OR REPLACE TYPE TieneServicio AS OBJECT(servicio REF servicio_t,via REF via_t);
/
 CREATE OR REPLACE TYPE Toma AS OBJECT(
   usuarioToma REF usuario_t,
   rutaToma REF ruta_t,
   esAprobada boolean_t,
   horaInicio time_t,
   horaFin time_t);
/
-- TERNARIAS--

CREATE OR REPLACE TYPE ValoraCiudad_t AS OBJECT (
usuariovaloraciudad REF usuario_t,
valoracionciudad REF valoracion_t,
ciudadvalorada REF ciudad_t);
/
CREATE OR REPLACE TYPE ValoraHito_t AS OBJECT(
usuariovalorahito REF usuario_t,
valoracionhito REF valoracion_t,
hitovalorado REF hito_t);
/
CREATE OR REPLACE TYPE ValoraRuta_t AS OBJECT(
usuariovaloraruta REF usuario_t,
valoracionruta REF valoracion_t,
rutavalorada REF ruta_t);
/
-- NUevos
CREATE OR REPLACE TYPE agr_via_t AS OBJECT(
    ruta    REF ruta_t,
    via     REF via_t);
/
-- Agregacion Ruta-Hito
CREATE OR REPLACE TYPE agr_hito_t AS OBJECT(
   ruta    REF ruta_t,
   hito    REF hito_t);
/

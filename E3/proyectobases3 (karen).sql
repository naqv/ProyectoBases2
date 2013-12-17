/* PROYECTO DE BASES DE DATOS II 
 * Entrega 3
 */


-- 1 n… en el lado de n tengo que colocar un foreign key
--- 1 1…cualquiera
--- n m no tengo que colocar nada.



-- TIPOS NUEVOS .

CREATE OR REPLACE TYPE telefono_t AS OBJECT(codigo NUMBER(5),numero NUMBER(7));

CREATE TABLE telefonos_table OF telefono_t;

CREATE OR REPLACE TYPE coordenada_t AS OBJECT(angulo NUMERIC(20),minuto NUMERIC(20),segundo NUMERIC(20));

CREATE TABLE coordenada_table OF coordenada_t;

CREATE OR REPLACE TYPE boolean_t AS OBJECT(booleano NUMBER(1));

CREATE TABLE boolean_table OF boolean_t(
    CONSTRAINT cont_boolean CHECK(booleano IN(0,1))
);

CREATE OR REPLACE TYPE nombres_t AS OBJECT(nombre1 NUMERIC(20), nombre2 NUMERIC(20), apellido1 NUMERIC(20), apellido2 NUMERIC(20));

CREATE TABLE nombres_table OF nombres_t;  

-- TIPOS COLECCION
CREATE OR REPLACE TYPE categoria_hito_t AS VARRAY(7) OF VARCHAR(50);  


-- HITO 
 
CREATE OR REPLACE TYPE hito_t AS OBJECT(
    nombre          VARCHAR(100),
    latitud         coordenada_t,
    longitud        coordenada_t,
    altitud         coordenada_t,
    descripcion     CLOB(175K),
    estado          VARCHAR(50),
    categoria       categoria_hito_t,
    edadApropiada   INTEGER(2),
    paginaweb       VARCHAR(30),
    telefono        telefono_t,
    email           VARCHAR(100),
    horario         VARCHAR(50),
    foto            BLOB(1M),
    horario         VARCHAR(50),
    tarifadescuento VARCHAR(100),
    costoTicketMonedaLocal  NUMERIC(100,5),
    contiene        REF hito_t    
);
  
CREATE TABLE hito_table OF hito_t(
    CONSTRAINT cont_estado      CHECK (estado    IN('disponible','en reparacion','clausurado temporalmente')),
    CONSTRAINT cont_categoria   CHECK (categoria IN('entretenimiento', 'deporte', 'cultura', 'infantil', 'ciencia', 'historia', 'musica'))
);
 

-- CUIDAD
CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(100,5)
);
  
CREATE TABLE ciudad_table OF ciudad_t;


-- RUTA
CREATE OR REPLACE TYPE ruta_t AS OBJECT(
    nombre          VARCHAR(100),
    inicioLatitud   coordenada_t,
    inicioLongitud  coordenada_t,
    finLatitud      coordenada_t,
    finLongitud     coordenada_t,
    cantidadVisitas INTEGER(20),
    tipo            VARCHAR(20),
    propuestaFija   NUMBER(2),
    fechaIngreso    DATE,
    descripcion     VARCHAR(500)
    RutaEn  REF     hito_t,
    EstaEn  REF     ciudad_t
);
   
CREATE TABLE ruta_table OF ruta_t(
    PRIMARY     KEY(nombre),
    CONSTRAINT  cont_tip CHECK(tipo IN('dinamica','fija')),
    FOREIGN     KEY(RutaEn) references hito_table,
    FOREIGN     KEY(EstaEn) references ciudad_table
);
 
 
-- VIA 
CREATE OR REPLACE TYPE via_t AS OBJECT(
    nombre              VARCHAR(100),
    tipo                VARCHAR(50),
    -- tiposTransporte  (multivaluado) MANEJO DE ARRAYS...
    inicioLatitud       coordenada_t,
    inicioLongitud      coordenada_t,
    finLatitud          coordenada_t,
    finLongintud        coordenada_t,
    SeEncuentraEn       REF ciudad_t
);
  
CREATE TABLE via_table OF via_t(
    CONSTRAINT cont_tipvia CHECK(tipo IN('calle','avenida','caminerıa','autopista','elevado','camino','puente')),
    FOREIGN key(SeEncuentraEn) references ciudad_table
);
 
 
-- EVENTO
CREATE OR REPLACE TYPE evento_t AS OBJECT( 
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),    
    costoMonedaLocal    NUMERIC(100,5),
    descripcion         CLOB(175K),
    ocurre              REF hito_t
);
  
CREATE TABLE evento_table OF evento_t(
    FOREING     key(ocurre) references hito_table,
    CONSTRAINT  cont_eventocat CHECK( categoría IN ('musical', 'entretenimiento', 'cultural', 'historico', 'social', 'festivo'))
);
  
-- SERVICIO
CREATE OR REPLACE TYPE servicio_t AS OBJECT (  
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),
    numeroDeContacto    telefono_t,
    email               VARCHAR(100),
    paginaweb           VARCHAR(100),
    descripcion         CLOB(175K),
    direccion           VARCHAR(100)   
    esGratuito          boolean_t,
    latitud             coordenada_t,
    longitud            coordenada_t,
    tieneServicio       REF Servicio_t,
    tiene               REF hito_t

)-- VER DONDE PONER ESTO --> ;[NOT FINAL]

CREATE TABLE servicio_table OF servicio_t(
    CONSTRAINT cont_categoria CHECK (categoría IN ('salud', 'entretenimiento', 'comida', 'transporte', 'estacion de servicio', 'otros'))
);

--PAQUETE  
CREATE OR REPLACE TYPE paquete_t AS OBJECT UNDER servicio_t(
    nombre              VARCHAR(100),
    costoEstudiante     VARCHAR(100,5),
    costoEstandar       VARCHAR(100,5),
    costoTerceraEdad    VARCHAR(100,5),
    costoNino           VARCHAR(100,5),      
    descripcion         CLOB(175K),
    incluye             REF ruta_t
);
  
CREATE TABLE paquete_table OF paquete_t;

--USUARIO
CREATE OR REPLACE TYPE usuario_t AS OBJECT(
    alias           VARCHAR(100),
    nombre          nombres_t,  
    email           VARCHAR(100),
    contrasena      VARCHAR(30),       
    genero          VARCHAR(1),
    fechaNacimiento DATE,
    esEstudiante    boolean_t,
    --interes       (multivaluado) MANEJO DE ARRAYS...         
    biografia       CLOB(175K)
);

CREATE TABLE usuario_table OF usuario_t(
    CONSTRAINT cont_genero CHECK (genero IN ('F', 'M'))
);
  
CREATE OR REPLACE TYPE valoracion_t AS OBJECT (
    nivelSeguridad      INTEGER(10),
    relacionPrecioValor INTEGER(10),
    puntuacion          INTEGER(10),
    comentario          VARCHAR(142)
);

CREATE TABLE valoracion_table OF valoracion_t(
    CONSTRAINT cont_seguridad   CHECK(nivelSeguridad IN (1,2,3,4,5)),
    CONSTRAINT cont_precioval   CHECK(relacionPrecioValor IN (1,2,3,4,5)),
    CONSTRAINT cont_puntuacion  CHECK(puntuacion IN (1,2,3,4,5)));
);

------ PARTE 2

CREATE OR REPLACE TYPE Contiene AS OBJECT (
hito_table REF hito_t);






CREATE OR REPLACE TYPE Contrata AS OBJECT (
  --tipo VARCHAR(30) -- Multivaluado 
  numero INTEGER(20)
  paquete  REF paquete_t
  usuario REF usuario_t);
 

CREATE TABLE contrata_in OF Contrata(

foreign key(paquete) references paquete_table, n
foreign key (usuario) references usuario_table); I



-- Duda…es 1:N pero se creo porque tiene argumentos :/
CREATE OR REPLACE TYPE Ocurre AS OBJECT (
  FechaInicio DATE
  FechaFin DATE
  evento REF evento_t
  hito   REF hito_t);

CREATE TABLE Ocurre_table OF Ocurre (

foreign key(evento) references evento_table, g
foreign key (hito) references hito_table
)
  

CREATE OR REPLACE TYPE ValoraCiudad AS OBJECT (
usuario REF usuario_t
valoracion valoracion_t
ciudad Ciudad_T

CREATE TABLE ValoraCiudad_table OF Ocurre (

foreign key(usuario) references usuario_table,  
foreign key (valoracion) references valoracion_table
foreign key (ciudad) references Ciudad_table
)




CREATE OR REPLACE TYPE ValoraHito AS OBJECT(
usuario REF usuario_t
valoracion REF valoracion_t
hito REF hito_T

CREATE TABLE ValoraHito_table OF Ocurre (

foreign key(usuario) references usuario_table, t
foreign key (valoracion) references valoracion_table
foreign key (hito) references hito_table
)

CREATE OR REPLACE TYPE ValoraRuta AS OBJECT(
REF usuario_t
REF valoracion_t
REF ruta_t

CREATE TABLE ValoraRuta_table OF Ocurre (

foreign key(usuario) references usuario_table, t
foreign key (valoracion) references valoracion_table
foreign key (ruta) references ruta_table
)


--Problemas con la generalizacion
--CREATE OR REPLACE TYPE Incluye AS OBJECT(
--  REF paquete_t
--  REF ruta_t  -- Especificar que es de tipo= fija
 
 --- NI IDEA PORQUE HAY UN DUDA CON LA GENERALIZACION
--CREATE OR REPLACE TYPE Crea AS OBJECT(

--  REF usuario_t
--  REF ruta_t
-)  

-- No se crea porque es 1:n
--CREATE OR REPLACE TYPE EstaEn AS OBJECT(
--  REF ruta_t
--  REF Ciudad_t
-- No se crea porque es 1:n
CREATE OR REPLACE TYPE SeEncuentra AS OBJECT(
  REF via_t
  REF Ciudad_T


-- GENERALIZACION PROBLEMAS NI IDEA. PREGUNTAR
--CREATE OR REPLACE TYPE Toma AS OBJECT(
--  REF usuario_T
--  REF ruta_t
--  EsAprobada BOOLEAN
--  HoraInicio: TIME
--  HoraFin: TIME


CREATE OR REPLACE TYPE Tiene AS OBJECT(
  hito REF hito_t
  servicio REF servicio_t
  
  );
  
 CREATE TABLE Tiene_table OF Tiene(
 
 foreign key(hito) references hito_table, �

 foreign key (servicio) references servicio_table);  

  

CREATE TABLE TieneServicio_table OF TieneServicio(
 
 foreign key(servicio) references servicio_table,  

 foreign key (via) references via_table); _

  
CREATE OR REPLACE TYPE SeAccedePor AS OBJECT(
  hito REF hito_t
  via  REF via_t

CREATE TABLE SeAccedePor_table OF SeAccedePor(
 
 foreign key(hito) references hito_table, P

 foreign key (via) references via_table); P



-- No se crea porque es N:1
CREATE OR REPLACE TYPE RutaEn AS OBJECT(
  REF hito_t


-- No se crea porque es N:1
CREATE OR REPLACE ES TYPE AS OBJECT
  REF via_t
  REF hito_t


  



  
  
  

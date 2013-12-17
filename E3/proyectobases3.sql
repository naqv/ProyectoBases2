
----------------- TIPOS -------------------


-- Tipo Multivaluado
CREATE OR REPLACE TYPE multi_t AS OBJECT(
atributomultivaluado VARCHAR(40));
/
-- Tipo Multivaluado ARRAY
CREATE OR REPLACE TYPE multis_t AS VARRAY(7) OF multi_t;
/

-- Tipo telefono
CREATE OR REPLACE TYPE telefono_t AS OBJECT(
    codigo      NUMBER(5),
    numero      NUMBER(7)
);
/

-- Tipo coordenada
CREATE OR REPLACE TYPE coordenada_t AS OBJECT(
    angulo      NUMERIC(20),
    minuto      NUMERIC(20),
    segundo     NUMERIC(20)
);
/

-- Tipo boolean
CREATE OR REPLACE TYPE boolean_t AS OBJECT(
    booleano    NUMBER(1)
);
/

-- Tipo TIME 
CREATE OR REPLACE TYPE time_t AS OBJECT(hora NUMERIC(30),minuto NUMERIC(30),segundo NUMERIC(30));
/

-- Tipo nombres. Esto engloba los 2 nombres
-- y los 2 apellidos de un usuario.
CREATE OR REPLACE TYPE nombres_t AS OBJECT(
    nombre1     VARCHAR(20), 
    nombre2     VARCHAR(20), 
    apellido1   VARCHAR(20), 
    apellido2   VARCHAR(20)
);
/

-- Tipo Hito
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
  
-- Tipo Ciudad
CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(30,5)
);
/

-- Tipo Usuario
CREATE OR REPLACE TYPE usuario_t AS OBJECT(
    alias           VARCHAR(100),
    nombre          nombres_t,  
    email           VARCHAR(100),
    contrasena      VARCHAR(30),       
    genero          VARCHAR(1),
    fechaNacimiento DATE,
    esEstudiante    boolean_t,
    interes         multis_t,        
    biografia       CLOB
);
/

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

-- Tipo Ruta Dinamica
CREATE OR REPLACE TYPE dinamica_t UNDER ruta_t(
    propuestaFija NUMERIC(1),
    Crea REF usuario_t
);
/
 
-- Tipo Ruta Fija
CREATE OR REPLACE TYPE fija_t UNDER ruta_t(
);
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
    comentario          VARCHAR(140)
);
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


----------------- TABLAS -------------------

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
    CONSTRAINT cont_genero CHECK(genero IN ('F', 'M')));

-- Tabla Ruta
CREATE TABLE ruta_table OF ruta_t(
	PRIMARY KEY(nombre),
	CONSTRAINT cont_tip CHECK(tipo IN('dinamica','fija')),
	FOREIGN KEY(RutaEn) references hito_table,
	FOREIGN KEY(EstaEn) references ciudad_table);
	
  
  
  
-- Tabla Via
CREATE TABLE via_table OF via_t(
    CONSTRAINT  cont_tipvia CHECK (tipo IN('calle','avenida','caminerıa','autopista','elevado','camino','puente')),
    FOREIGN     key(SeEncuentraEn) references ciudad_table
);
    
-- Tabla Evento
CREATE TABLE evento_table OF evento_t(
    FOREIGN     key(ocurre) references hito_table,
    CONSTRAINT  cont_eventocat CHECK( categoria IN ('musical', 'entretenimiento', 'cultural', 'historico', 'social', 'festivo'))
);
  
  
  
-- Tabla Servicio
CREATE TABLE servicio_table OF servicio_t(
    CONSTRAINT cont_categoria CHECK (categoria IN ('salud', 'entretenimiento', 'comida', 'transporte', 'estacion de servicio', 'otros'))
);

-- Tabla Valoracion
CREATE TABLE valoracion_table of valoracion_t(
    CONSTRAINT cont_seguridad CHECK( nivelSeguridad IN (1,2,3,4,5)),
    CONSTRAINT cont_precioval CHECK( relacionPrecioValor IN (1,2,3,4,5)),
    CONSTRAINT cont_puntu CHECK( puntuacion IN (1,2,3,4,5))
);

-- Tabla Paquete. Falta el tipo paquete_t
CREATE TABLE paquete_table OF paquete_t(
    FOREIGN KEY(incluye) references ruta_table); 



  
  

----------------- ASOCIACIONES ---------------------
----------------- TIPOS-----------------------------
  
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


----- TABLAS ----------

CREATE TABLE SeAccedePor_table OF SeAccedePor(
 FOREIGN KEY(hito) references hito_table,
 FOREIGN KEY(via) references via_table);
 

 CREATE TABLE Tiene_table OF Tiene(
 FOREIGN KEY(hito) references hito_table,
 FOREIGN KEY(servicio) references servicio_table);


CREATE TABLE TieneServicio_table OF TieneServicio(
 FOREIGN KEY(servicio) references servicio_table,
 FOREIGN KEY(via) references via_table);
  

CREATE TABLE Toma_table OF Toma(
 FOREIGN KEY(usuarioToma) references usuario_table,
 FOREIGN KEY(rutaToma) references ruta_table);
  
  
-- Tablas Ternarias ---


CREATE TABLE ValoraCiudad_table OF ValoraCiudad_t(
FOREIGN KEY(usuariovaloraciudad) references usuario_table,
FOREIGN KEY(valoracionciudad) references valoracion_table,
FOREIGN KEY(ciudadvalorada) references ciudad_table);

CREATE TABLE ValoraHito_table OF ValoraHito_t(
FOREIGN KEY(usuariovalorahito) references usuario_table,
FOREIGN KEY(valoracionhito) references valoracion_table,
FOREIGN KEY(hitovalorado) references hito_table);

CREATE TABLE ValoraRuta_table OF ValoraRuta_t(
FOREIGN KEY(usuariovaloraruta) references usuario_table,
FOREIGN KEY(valoracionruta) references valoracion_table,
FOREIGN KEY(rutavalorada) references ruta_table);










  



  
  
  

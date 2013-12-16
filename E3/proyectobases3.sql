-- TIPOS NUEVOS .
CREATE OR REPLACE TYPE telefono_t AS OBJECT(
    codigo      NUMBER(5),
    numero      NUMBER(7)
);
/
CREATE OR REPLACE TYPE coordenada_t AS OBJECT(
    angulo      NUMERIC(20),
    minuto      NUMERIC(20),
    segundo     NUMERIC(20)
);
/
CREATE OR REPLACE TYPE boolean_t AS OBJECT(
    booleano    NUMBER(1)
);
/
CREATE OR REPLACE TYPE nombres_t AS OBJECT(
    nombre1     VARCHAR(20), 
    nombre2     VARCHAR(20), 
    apellido1   VARCHAR(20), 
    apellido2   VARCHAR(20)
);
/
CREATE OR REPLACE TYPE hito_t AS OBJECT(
    nombre                    VARCHAR(100),
    latitud                   coordenada_t,
    longitud                  coordenada_t,
    altitud                   coordenada_t,
    descripcion               CLOB,
    estado                    VARCHAR(50),
    --categoria               VARCHAR(50) AQUI FALTA VER COMO SON LOS CONTRAINT DE COSAS QUE DEBERIAN SER ARRAYS
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
  
CREATE OR REPLACE TYPE ciudad_t AS OBJECT (
    nombre              VARCHAR(100),
    pais                VARCHAR(100),
    nombreMonedaLocal   VARCHAR(30),
    relacionLocalUSD    NUMERIC(30,5)
);
/

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

CREATE OR REPLACE TYPE usuario_t AS OBJECT(
    alias           VARCHAR(100),
    nombre          nombres_t,  
    email           VARCHAR(100),
    contrasena      VARCHAR(30),       
    genero          VARCHAR(1),
    fechaNacimiento DATE,
    esEstudiante    boolean_t,
    --interes       (multivaluado) MANEJO DE ARRAYS...         
    biografia       CLOB
);
/

CREATE OR REPLACE TYPE dinamica_t UNDER ruta_t(
    propuestaFija NUMERIC(1),
    Crea REF usuario_t
);
/
 
CREATE OR REPLACE TYPE fija_t UNDER ruta_t();
/


CREATE TABLE telefonos_tab OF telefono_t;

CREATE TABLE coordenada_table OF coordenada_t;

CREATE TABLE boolean_table OF boolean_t(
    CONSTRAINT cont_boolean CHECK(booleano IN(0,1))
);

CREATE TABLE nombres_table OF nombres_t;


-- HITO 
CREATE TABLE hito_table OF hito_t(
    CONSTRAINT cont_estado CHECK(estado IN('disponible','en reparacion','clausurado temporalmente')),
    FOREIGN KEY(contiene) references hito_table
);
 

-- CUIDAD
CREATE TABLE ciudad_table OF ciudad_t;



-- RUTA
CREATE TABLE ruta_table OF ruta_t(
	PRIMARY KEY(nombre),
	CONSTRAINT cont_tip CHECK(tipo IN('dinamica','fija')),
	FOREIGN KEY(RutaEn) references hito_table,
	FOREIGN KEY(EstaEn) references ciudad_table,
	FOREIGN KEY(Crea)   references usuario_table
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
    SeEncuentraEn REF   ciudad_t
);
  
CREATE TABLE via_table OF via_t(
    CONSTRAINT  cont_tipvia CHECK (tipo IN('calle','avenida','caminerıa','autopista','elevado','camino','puente')),
    FOREIGN     key(SeEncuentraEn) references ciudad_table
);
    
-- EVENTO
CREATE OR REPLACE TYPE evento_t AS OBJECT( 
    nombre              VARCHAR(100),
    categoria           VARCHAR(100),    
    costoMonedaLocal    NUMERIC(30,5),
    descripcion         CLOB,
    ocurre              REF hito_t
    fechaInicio         DATE,
    fechaFin            DATE 
);
/
  
CREATE TABLE evento_table OF evento_t(
    FOREIGN     key(ocurre) references hito_table,
    CONSTRAINT  cont_eventocat CHECK( categoria IN ('musical', 'entretenimiento', 'cultural', 'historico', 'social', 'festivo'))
);
  

CREATE OR REPLACE TYPE Servicio_T AS OBJECT (  
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
)NOT FINAL;
/

CREATE TABLE servicio_table OF servicio_t(
    CONSTRAINT cont_categoria CHECK (categoría IN ('salud', 'entretenimiento', 'comida', 'transporte', 'estacion de servicio', 'otros'))
);

CREATE OR REPLACE TYPE paquete_t AS OBJECT UNDER servicio_t (
    nombre              VARCHAR(100),
    costoEstudiante     VARCHAR(100,5),
    costoEstandar       VARCHAR(100,5),
    costoTerceraEdad    VARCHAR(100,5),
    costoNino           VARCHAR(100,5),      
    descripcion         CLOB(175K),
    incluye REF fija_t
);
/
  
CREATE TABLE paquete_table OF paquete_t(
    FOREIGN KEY(Incluye) references fija_table)
); 


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
    biografia       CLOB
);
/

CREATE TABLE usuario_table OF usuario_t(
    CONSTRAINT cont_genero CHECK (genero IN ('F', 'M'))
  
);
  
CREATE OR REPLACE TYPE valoracion_t AS OBJECT (
    nivelSeguridad      INTEGER(10),
    relacionPrecioValor INTEGER(10),
    puntuacion          INTEGER(10),
    comentario          VARCHAR(140)
);
/

CREATE TABLE valoracion_table of valoracion_t(
    CONSTRAINT cont_seguridad CHECK( nivelSeguridad IN (1,2,3,4,5)),
    CONSTRAINT cont_precioval CHECK( relacionPrecioValor IN (1,2,3,4,5)),
    CONSTRAINT cont_puntu CHECK( puntuacion IN (1,2,3,4,5))
);

  
  
  
  
  
  

------ PARTE 2


CREATE OR REPLACE TYPE Contrata AS OBJECT (
  --tipo VARCHAR(30) -- Multivaluado 
  --numero INTEGER(20)
  paquete  REF paquete_t
  usuario REF usuario_t);
 

CREATE TABLE contrata_in OF Contrata(

foreign key(paquete) references paquete_table,\00;

foreign key (usuario) references usuario_table);\00,



  
CREATE OR REPLACE TYPE SeAccedePor AS OBJECT(
  hito REF hito_t,
  via  REF via_t);

CREATE TABLE SeAccedePor_table OF SeAccedePor(
 
 foreign key(hito) references hito_table,\00P

 foreign key (via) references via_table);\00P



CREATE OR REPLACE TYPE Tiene AS OBJECT(
  hito REF hito_t
  servicio REF servicio_t
  
  );
  

 CREATE TABLE Tiene_table OF Tiene(
 
 foreign key(hito) references hito_table,\00P

 foreign key (servicio) references servicio_table);\004

  
  
  CREATE OR REPLACE TYPE TieneServicio AS OBJECT(
servicio REF servicio_t,
via REF via_t);
  
  

CREATE TABLE TieneServicio_table OF TieneServicio(
 
 foreign key(servicio) references servicio_table,\00\00

 foreign key (via) references via_table);\00_

  
  




 CREATE OR REPLACE TYPE Toma AS OBJECT(
   usuarioToma REF usuario_t,
   rutaToma REF ruta_t,
   esAprobada boolean_t,
   horaInicio TIME,
   horaFin TIME);
  

CREATE TABLE Toma_table OF Toma(

 foreign key(usuarioToma) references usuario_table,\004

 foreign key (rutaToma) references ruta_table);\00l

  
);  
  

  
  




































--CREATE TABLE Ocurre_table OF Ocurre (

--foreign key(evento) references evento_table,\00\00
foreign key (hito) references hito_table
--)
  

















CREATE OR REPLACE TYPE ValoraCiudad AS OBJECT (
usuario REF usuario_t
valoracion valoracion_t
ciudad Ciudad_T

CREATE TABLE ValoraCiudad_table OF Ocurre (

foreign key(usuario) references usuario_table,\00\00
foreign key (valoracion) references valoracion_table
foreign key (ciudad) references Ciudad_table
)


CREATE OR REPLACE TYPE ValoraHito AS OBJECT(
usuario REF usuario_t
valoracion REF valoracion_t
hito REF hito_T

CREATE TABLE ValoraHito_table OF Ocurre (

foreign key(usuario) references usuario_table,\00t
foreign key (valoracion) references valoracion_table
foreign key (hito) references hito_table
)

CREATE OR REPLACE TYPE ValoraRuta AS OBJECT(
REF usuario_t
REF valoracion_t
REF ruta_t


  
  






  



  
  
  

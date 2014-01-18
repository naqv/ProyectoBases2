CREATE OR REPLACE TYPE via_t AS OBJECT(
    nombre              VARCHAR(100),
    tipo                VARCHAR(50),
    tiposTransporte     multis_t,
    inicioLatitud       coordenada_t,
    inicioLongitud      coordenada_t,
    finLatitud          coordenada_t,
    finLongintud        coordenada_t
)NOT FINAL;
/

CREATE OR REPLACE TYPE ref_to_via AS OBJECT (toVia REF via_t);
/

CREATE OR REPLACE TYPE refs_to_via AS TABLE OF ref_to_via;
/

CREATE OR REPLACE TYPE ruta_t AS OBJECT(
	nombre 					VARCHAR(100),
	inicioLatitud 			coordenada_t,
	inicioLongitud 			coordenada_t,
	finLatitud 				coordenada_t,
	finLongitud 			coordenada_t,
	cantidadVisitas 		INTEGER(20),
	tipo 					VARCHAR(20),
	fechaIngreso 			DATE,
	descripcion 			VARCHAR(500),
	partesVia 				refs_to_via 
);
/

CREATE OR REPLACE TYPE ref_to_ruta AS OBJECT (toRuta REF ruta_t);
/
CREATE OR REPLACE TYPE refs_to_ruta AS TABLE OF ref_to_ruta;
/

ALTER TYPE via_t ADD ATTRIBUTE (todoRuta refs_to_ruta) CASCADE;
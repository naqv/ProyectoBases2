-- Eliminar tablas.
DROP TABLE 	contrata_table;
DROP TABLE 	seaccedepor_table;
DROP TABLE 	tiene_table;
DROP TABLE 	tieneservicio_table;
DROP TABLE 	toma_table;
DROP TABLE 	valoraciudad_table;
DROP TABLE 	ciudad_table;
DROP TABLE 	valorahito_table;
DROP TABLE 	valoraruta_table;
DROP TABLE 	servicio_table;
DROP TABLE 	valoracion_table;
DROP TABLE 	paquete_table;
DROP TABLE 	agr_hito_table;
DROP TABLE 	telefonos_tab;
DROP TABLE 	coordenada_table;
DROP TABLE 	boolean_table;
DROP TABLE 	nombres_table;
DROP TABLE 	usuario_table;
DROP TABLE 	ruta_table;
DROP TABLE 	via_table;
DROP TABLE 	evento_table;
DROP TABLE 	hito_table;



-- Eliminar tipos.
DROP TYPE 	valoraciudad_t;
DROP TYPE 	Toma;
DROP TYPE 	fija_t;
DROP TYPE 	dinamica_t;
DROP TYPE 	valorahito_t;
DROP TYPE 	valoraruta_t;
DROP TYPE 	SeAccedePor;
DROP TYPE 	TieneServicio;
DROP TYPE 	Tiene;
DROP TYPE 	agr_hito_t;
DROP TYPE 	valoracion_t ;

purge recyclebin;

DROP TYPE 	telefono_t FORCE;
DROP TYPE 	coordenada_t FORCE;
DROP TYPE 	nombres_t FORCE;
DROP TYPE 	boolean_t FORCE;
DROP TYPE 	multis_t FORCE;
DROP TYPE 	multi_t FORCE;
DROP TYPE 	contrata_t;
DROP TYPE 	usuario_t;
DROP TYPE 	hito_t FORCE;
DROP TYPE 	refs_to_hito;
DROP TYPE 	ref_to_hito;
DROP TYPE 	ruta_t;
DROP TYPE 	evento_t;
DROP TYPE 	servicio_t;
DROP TYPE 	paquete_t;
DROP TYPE 	via_t;
DROP TYPE 	ciudad_t;
DROP TYPE 	acompanante_t FORCE;
DROP TYPE 	acompanantes_t ;
DROP TYPE 	refs_to_ruta;
DROP TYPE 	refs_to_evento;
DROP TYPE 	refs_to_via;
DROP TYPE 	time_t;

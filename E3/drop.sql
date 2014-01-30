---------------------------- Eliminar tablas ------------------------
DROP TABLE 	seaccedepor_table;
DROP TABLE 	tiene_table;
DROP TABLE 	tieneservicio_table;
DROP TABLE 	toma_table;
DROP TABLE 	valoraciudad_table;
DROP TABLE 	servicio_table;
DROP TABLE 	via_table;
DROP TABLE 	agr_hito_table;
DROP TABLE 	valoraruta_table;
DROP TABLE 	paquete_table;
DROP TABLE 	ruta_table;
DROP TABLE 	ciudad_table;
DROP TABLE 	valorahito_table;
DROP TABLE 	valoracion_table;
DROP TABLE 	evento_table;
DROP TABLE 	hito_table;
DROP TABLE 	usuario_table;
DROP TABLE 	telefonos_tab;
DROP TABLE 	coordenada_table;
DROP TABLE 	boolean_table;
DROP TABLE 	nombres_table;


PURGE RECYCLEBIN;


---------------------------- Eliminar tipos -------------------------

DROP TYPE 	SeAccedePor;
DROP TYPE 	Tiene;
DROP TYPE 	TieneServicio;
DROP TYPE 	Toma;
DROP TYPE 	valoraciudad_t;
DROP TYPE 	servicio_t;
DROP TYPE 	via_t FORCE;
DROP TYPE 	agr_hito_t;
DROP TYPE 	valoraruta_t;
DROP TYPE 	paquete_t;
DROP TYPE 	ruta_t FORCE;
DROP TYPE 	ciudad_t;
DROP TYPE 	valorahito_t;
DROP TYPE 	valoracion_t;
DROP TYPE 	evento_t FORCE;
DROP TYPE 	hito_t FORCE;
DROP TYPE 	dinamica_t;
DROP TYPE 	usuario_t;
DROP TYPE 	telefono_t;
DROP TYPE 	boolean_t;
DROP TYPE 	nombres_t;
DROP TYPE 	fija_t;
DROP TYPE 	multis_t;
DROP TYPE 	multi_t;
DROP TYPE 	acompanantes_t;
DROP TYPE 	acompanante_t;
DROP TYPE 	time_t;
DROP TYPE 	coordenada_t;

DROP TYPE 	refs_to_hito;
DROP TYPE 	ref_to_hito;

DROP TYPE 	refs_to_ruta;
DROP TYPE 	ref_to_ruta;

DROP TYPE 	refs_to_evento;
DROP TYPE 	ref_to_evento;

DROP TYPE 	refs_to_via;
DROP TYPE 	ref_to_via;

drop procedure listareventos;
drop view rutasconpaquetes;

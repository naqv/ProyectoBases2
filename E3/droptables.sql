drop table contrata_table;
 drop table seaccedepor_table;
 drop table tiene_table;
 drop table tieneservicio_table;
 drop table toma_table;
 drop table valoraciudad_table;
drop table valorahito_table;
drop table valoraruta_table;
drop table servicio_table;
drop table valoracion_table;
 drop table paquete_table;

drop table agr_via_tablet;
drop table agr_hito_tablet;
drop table telefonos_tab;
drop table coordenada_table;
drop table boolean_table;
drop table nombres_table;
drop table usuario_table;
drop table ruta_table;
drop table via_table;
drop table evento_table;
drop table hito_table;
drop table ciudad_table;



-- TYPES
DROP TYPE valoraciudad_t;
DROP TYPE Toma;
DROP TYPE fija_t;
DROP TYPE dinamica_t;
DROP TYPE valorahito_t;
DROP TYPE valoraruta_t;
DROP TYPE SeAccedePor;
DROP TYPE TieneServicio;
DROP TYPE Tiene;
DROP TYPE time_t;
DROP TYPE agr_via_t;
DROP TYPE agr_hito_t;
DROP TYPE valoracion_t ;




DROP TYPE telefono_t FORCE;
DROP TYPE coordenada_t FORCE;
DROP TYPE nombres_t FORCE;
DROP TYPE boolean_t FORCE;
DROP TYPE multis_t FORCE;
DROP TYPE multi_t FORCE;
DROP TYPE usuario_t;
DROP TYPE hito_t;
DROP TYPE ruta_t;
DROP TYPE evento_t;
DROP TYPE servicio_t;
DROP TYPE paquete_t;
DROP TYPE via_t;
DROP TYPE ciudad_t;
DROP TYPE acompanante_t FORCE;
DROP TYPE acompanantes_t ;
drop type refs_to_ruta_table;
drop type refs_to_evento;
drop type refs_to_via;

-- TABLES
DROP TABLE ruta_table;
DROP TABLE via_table;

PURGE RECYCLEBIN;

-- TYPES

DROP TYPE via_t FORCE;
DROP TYPE refs_to_ruta;
DROP TYPE ref_to_ruta;

DROP TYPE ruta_t;
DROP TYPE refs_to_via;
DROP TYPE ref_to_via;

DROP TYPE coordenada_t;
DROP TYPE multis_t;
DROP TYPE multi_t;
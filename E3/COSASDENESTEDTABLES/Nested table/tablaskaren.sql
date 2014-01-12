-- Tabla Ruta
CREATE TABLE ruta_table OF ruta_t(
	PRIMARY KEY(nombre),
	CONSTRAINT cont_tip CHECK(tipo IN('dinamica','fija')),
	FOREIGN KEY(RutaEn) references hito_table,
	FOREIGN KEY(EstaEn) references ciudad_table);

-- Tabla Ciudad
CREATE TABLE ciudad_table OF ciudad_t
NESTED TABLE estaEnRefs STORE AS RUTA_ESTAEN_CIUDAD;

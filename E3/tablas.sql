---------- TABLAS PRINCIPALES ---------------------------------------

---------------- Tabla Telefono -------------------------------------
CREATE TABLE telefonos_tab OF telefono_t;

---------------- Tabla Coordenada -----------------------------------
CREATE TABLE coordenada_table OF coordenada_t;

---------------- Tabla Boolean --------------------------------------
CREATE TABLE boolean_table OF boolean_t(
    CONSTRAINT cont_boolean CHECK(booleano IN(0,1))
);

---------------- Tabla Nombres --------------------------------------
CREATE TABLE nombres_table OF nombres_t;

---------------- Tabla Hito -----------------------------------------
CREATE TABLE hito_table OF hito_t(
    CONSTRAINT cont_estado CHECK(estado IN('disponible','en reparacion','clausurado temporalmente')),
    FOREIGN KEY(contieneRef) references hito_table)
    NESTED TABLE rutaEnRefs STORE AS RUTA_RUTAEN_HITO,
    NESTED TABLE contieneNT STORE AS HITO_CONTIENE_HITO;

---------------- Tabla Ciudad ---------------------------------------
CREATE TABLE ciudad_table OF ciudad_t
    NESTED TABLE SeEncuentraEnRefs STORE AS VIA_SEENCUENTRAEN_CIUDAD,
    NESTED TABLE estaEnRefs STORE AS RUTA_ESTAEN_CIUDAD;

---------------- Tabla Usuario --------------------------------------
CREATE TABLE usuario_table OF usuario_t(
    CONSTRAINT cont_genero CHECK (genero IN ('F', 'M')));

---------------- Tabla Ruta -----------------------------------------
CREATE TABLE ruta_table OF ruta_t(
	CONSTRAINT cont_tip CHECK(tipo IN('dinamica','fija')),
	FOREIGN KEY(RutaEn) references hito_table,
	FOREIGN KEY(EstaEn) references ciudad_table)
    NESTED TABLE partesVia STORE AS PARTESVIA_RUTA;
	
---------------- Tabla Via ------------------------------------------
CREATE TABLE via_table OF via_t(
    CONSTRAINT  cont_tipvia CHECK (tipo IN('calle','avenida','caminerıa','autopista','elevado','camino','puente')),
    FOREIGN     key(SeEncuentraEn) references ciudad_table)
    NESTED TABLE todoRuta STORE AS TODORUTA_VIA;
    
---------------- Tabla Evento ---------------------------------------
CREATE TABLE evento_table OF evento_t(
    FOREIGN     key(ocurre) references hito_table,
    CONSTRAINT  cont_eventocat CHECK( categoria IN ('musical', 'entretenimiento', 'cultural', 'historico', 'social', 'festivo')));

---------------- Tabla Servicio -------------------------------------
CREATE TABLE servicio_table OF servicio_t(
    CONSTRAINT cont_categoria CHECK (categoria IN ('salud', 'entretenimiento', 'comida', 'transporte', 'estacion de servicio', 'otros'))
);

---------------- Tabla Valoracion -----------------------------------
CREATE TABLE valoracion_table of valoracion_t(
    CONSTRAINT cont_seguridad CHECK( nivelSeguridad IN (1,2,3,4,5)),
    CONSTRAINT cont_precioval CHECK( relacionPrecioValor IN (1,2,3,4,5)),
    CONSTRAINT cont_puntu CHECK( puntuacion IN (1,2,3,4,5))
);

---------------- Tabla Paquete --------------------------------------
CREATE TABLE paquete_table OF paquete_t(
    FOREIGN KEY(incluye) references ruta_table); 


---------- TABLAS ASOCIACIONES BINARIAS -----------------------------


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


---------- TABLAS ASOCIACIONES TERNARIAS ----------------------------

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


---------- TABLA AGREGACION RUTA-HITO ----------------------------

CREATE TABLE agr_hito_table OF agr_hito_t(
    FOREIGN KEY (ruta) REFERENCES ruta_table,
    FOREIGN KEY (hito) REFERENCES hito_table );






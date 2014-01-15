CREATE OR REPLACE PROCEDURE sem_fijo_etiq (dom_name1 VARCHAR2, usuario1 VARCHAR2, etiqueta1 VARCHAR2, dominio1 NUMBER, grado1 NUMBER)
is
	gradoviejo NUMBER;
BEGIN
	INSERT INTO semejanza_fijo_etiqueta VALUES (usuario1, dom_name1, etiqueta1, dominio1, grado1);
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		UPDATE semejanza_fijo_etiqueta SET grado = grado1 WHERE dom_name = dom_name1 AND usuario = usuario1 AND etiqueta = etiqueta1 AND dominio = dominio1;
END;
/

CREATE OR REPLACE PROCEDURE sem_etiquetas (dom_name1 VARCHAR2, usuario1 VARCHAR2, etiqueta1 VARCHAR2, etiqueta2 VARCHAR2, grado1 NUMBER)
is
	gradoviejo NUMBER;
BEGIN
	INSERT INTO semejanza_etiquetas VALUES (usuario1, dom_name1, etiqueta1, etiqueta2, grado1);
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
	UPDATE semejanza_etiquetas SET grado = grado1 WHERE dom_name = dom_name1 AND usuario = usuario1 AND etiqueta_1 = etiqueta1 AND etiqueta_2 = etiqueta2;
END;
/
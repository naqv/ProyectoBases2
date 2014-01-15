conn userdef/1234;

CREATE OR REPLACE PROCEDURE CA_Sem_Fijo_Etiq (dom IN VARCHAR2, et IN VARCHAR2, val IN NUMBER, grado IN NUMBER) 
is
us NUMBER(20);
    BEGIN
    SELECT grado INTO us
    FROM semejanza_fijo_etiqueta 
    WHERE usuario = user AND dom_name = dom AND etiqueta = et AND dominio = val;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      INSERT INTO semejanza_fijo_etiqueta VALUES (user, dom, et, val, grado);
END;
/

CREATE OR REPLACE PROCEDURE CA_Sem_Etiq (dom IN VARCHAR2, et1 IN VARCHAR2, et2 IN VARCHAR2, grado IN NUMBER) 
is
us VARCHAR2(20);
    BEGIN
    SELECT usuario INTO us
    FROM semejanza_etiquetas
    WHERE usuario = user AND dom_name = dom AND ((etiqueta_1 = et1 AND etiqueta_2 = et2) OR (etiqueta_1 = et2 AND etiqueta_2 = et1));
    EXCEPTION WHEN NO_DATA_FOUND THEN
      INSERT INTO semejanza_etiquetas VALUES (user, dom, et1, et2, grado);
END;
/

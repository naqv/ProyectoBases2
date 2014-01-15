conn userdef/1234;

CREATE OR REPLACE TYPE BODY dominio_fijo_t AS

CONSTRUCTOR FUNCTION dominio_fijo_t (dom IN VARCHAR2, et IN VARCHAR2, val IN NUMBER, grado IN NUMBER) RETURN SELF AS RESULT IS
  identificador NUMBER(4);
  BEGIN
    SELECT codigo INTO identificador FROM D_Tono_Muscular WHERE valor = val;
    CA_Sem_Fijo_Etiq(dom, et, val, grado);
    SELF:=dominio_fijo_t(identificador, val);
    RETURN;
  END;

CONSTRUCTOR FUNCTION dominio_fijo_t (val IN NUMBER) RETURN SELF AS RESULT IS
  identificador NUMBER(4);
  BEGIN
    SELECT codigo INTO identificador FROM D_Tono_Muscular WHERE valor = val;
    SELF:=dominio_fijo_t(identificador, val);
    RETURN;
  END;

MEMBER FUNCTION FEQ (et in NUMBER) return real is
BEGIN
   IF (self.valor = et) THEN
      return 1;
   ELSE
      return 0;
   END IF;
END;

MEMBER FUNCTION FEQ (dom in VARCHAR2, et in VARCHAR2) return real is
temp NUMBER (4,2):= 0;
BEGIN
   SELECT grado INTO temp
   FROM semejanza_fijo_etiqueta
   WHERE etiqueta = et AND dominio = self.valor AND usuario = user AND dom_name = dom;
   
   RETURN temp;
   
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN 0;
END;

END;
/

CREATE OR REPLACE TYPE BODY etiqueta_t AS

CONSTRUCTOR FUNCTION etiqueta_t (dom IN VARCHAR2, et1 IN VARCHAR2, et2 IN VARCHAR2, grado IN NUMBER) RETURN SELF AS RESULT IS
  identificador NUMBER(4);
  BEGIN
    SELECT codigo INTO identificador FROM etiqueta_carac_marcha WHERE etiq = et1;
    CA_Sem_Etiq(dom, et1, et2, grado);
    SELF:=etiqueta_t(identificador, et1);
    RETURN;
  END;

CONSTRUCTOR FUNCTION etiqueta_t (et IN VARCHAR2) RETURN SELF AS RESULT IS
  identificador NUMBER(4);
  BEGIN
    SELECT codigo INTO identificador FROM etiqueta_carac_marcha WHERE etiq = et;
    SELF:=etiqueta_t(identificador, et);
    RETURN;
  END;

MEMBER FUNCTION FEQ (dom in VARCHAR2, et in VARCHAR2) return real is
temp NUMBER(4,2):= 0;
BEGIN
   IF (et = self.etiq) THEN
      RETURN 1;
   END IF;
   SELECT grado INTO temp 
   FROM semejanza_etiquetas 
   WHERE (etiqueta_1 = self.etiq AND etiqueta_2 = et) OR (etiqueta_1 = et AND etiqueta_2 = self.etiq) AND dom_name = dom;
   
   RETURN temp;
   
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN 0;
END;

END;
/

CREATE OR REPLACE TYPE BODY Paciente_t AS
MEMBER FUNCTION FEQ (et in NUMBER) return real is
cursor inv1_idiomas is
SELECT dispositivo FROM dispositivos_usados WHERE paciente = self.CI ORDER BY dispositivo;
cursor inv2_idiomas is
SELECT dispositivo FROM dispositivos_usados WHERE paciente = et ORDER BY dispositivo;
idioma1 VARCHAR2(50);
idioma2 VARCHAR2(50);
valor1 NUMBER(4,2);
valor2 NUMBER(4,2);
resp NUMBER(4,2);
BEGIN
IF (self.CI = et) THEN
  RETURN 1;
END IF;
   OPEN inv1_idiomas;
   OPEN inv2_idiomas;
      LOOP
         FETCH inv1_idiomas INTO idioma1;
         EXIT WHEN inv1_idiomas%NOTFOUND;
         FETCH inv2_idiomas INTO idioma2;
         EXIT WHEN inv2_idiomas%NOTFOUND;
            IF (idioma1 <> idioma2) THEN
              RETURN 0;
            END IF;
      END LOOP;

    --FETCH inv1_idiomas INTO idioma1;
    IF inv1_idiomas%NOTFOUND THEN
      FETCH inv2_idiomas INTO idioma2;
      IF inv2_idiomas%FOUND THEN
        RETURN 0;
      ELSE
        SELECT MIN(grado) INTO valor1 FROM dispositivos_usados WHERE paciente = self.ci;
        SELECT MIN(grado) INTO valor2 FROM dispositivos_usados WHERE paciente = et;

        resp := least(valor1, valor2);

        RETURN resp;
      END IF;
    ELSE
      RETURN 0;
    END IF;

    --FETCH inv2_idiomas INTO idioma2;
    IF inv2_idiomas%NOTFOUND THEN
      RETURN 0;
    END IF;

   CLOSE inv2_idiomas;
   CLOSE inv1_idiomas;

SELECT MIN(grado) INTO valor1 FROM dispositivos_usados WHERE paciente = self.ci;
SELECT MIN(grado) INTO valor2 FROM dispositivos_usados WHERE paciente = et;

resp := least(valor1, valor2);

RETURN resp;

END FEQ;

MEMBER FUNCTION prom_parecido3 (et in NUMBER) return real is
cursor inv1_idiomas is
SELECT dispositivo FROM dispositivos_usados WHERE paciente = self.CI ORDER BY dispositivo;
cursor inv2_idiomas is
SELECT dispositivo FROM dispositivos_usados WHERE paciente = et ORDER BY dispositivo;
idioma1 VARCHAR2(50);
idioma2 VARCHAR2(50);
valor1 NUMBER(4,2);
valor2 NUMBER(4,2);
resp NUMBER(4,2);
BEGIN
IF (self.CI = et) THEN
  RETURN 1;
END IF;
   OPEN inv1_idiomas;
   OPEN inv2_idiomas;
      LOOP
         FETCH inv1_idiomas INTO idioma1;
         EXIT WHEN inv1_idiomas%NOTFOUND;
         FETCH inv2_idiomas INTO idioma2;
         EXIT WHEN inv2_idiomas%NOTFOUND;
            IF (idioma1 <> idioma2) THEN
              RETURN 0;
            END IF;
      END LOOP;

    --FETCH inv1_idiomas INTO idioma1;
    IF inv1_idiomas%NOTFOUND THEN
      FETCH inv2_idiomas INTO idioma2;
      IF inv2_idiomas%FOUND THEN
        RETURN 0;
      ELSE
        SELECT MIN(grado) INTO valor1 FROM dispositivos_usados WHERE paciente = self.ci;
        SELECT MIN(grado) INTO valor2 FROM dispositivos_usados WHERE paciente = et;

        resp := ((valor1 + valor2) / 2);

        RETURN resp;
      END IF;
    ELSE
      RETURN 0;
    END IF;

    --FETCH inv2_idiomas INTO idioma2;
    IF inv2_idiomas%NOTFOUND THEN
      RETURN 0;
    END IF;

   CLOSE inv2_idiomas;
   CLOSE inv1_idiomas;

SELECT MIN(grado) INTO valor1 FROM dispositivos_usados WHERE paciente = self.ci;
SELECT MIN(grado) INTO valor2 FROM dispositivos_usados WHERE paciente = et;

resp := ((valor1 + valor2) / 2);

RETURN resp;

END prom_parecido3;

END;
/


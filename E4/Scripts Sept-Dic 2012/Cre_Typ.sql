conn userdef/1234;

CREATE OR REPLACE TYPE UserDef_objtyp AS OBJECT (
  NickName     VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE  Fuzzy_objtyp AS OBJECT (
   dom_name VARCHAR2(50),
   MEMBER FUNCTION LSHOW (Dom IN VARCHAR2) RETURN VARCHAR2,
   MEMBER FUNCTION SHOW RETURN VARCHAR2,
   MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL
)
NOT FINAL;
/

CREATE OR REPLACE TYPE Trapezoid_objtyp AS OBJECT (
   T_a		NUMBER(12,3),
   T_b		NUMBER(12,3),
   T_c		NUMBER(12,3),
   T_d		NUMBER(12,3),
   CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, N IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, L1 IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT,
   MEMBER FUNCTION FEQT (T1 IN Trapezoid_objtyp) RETURN REAL,
   MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL,
   MEMBER FUNCTION LSHOW(Dom IN VARCHAR2) RETURN VARCHAR2,
   MEMBER FUNCTION SHOW RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE DT_objtyp UNDER Fuzzy_objtyp (
   Label VARCHAR2(50),
   Trap Trapezoid_objtyp,
   CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Lab IN VARCHAR2) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Num IN NUMBER) RETURN SELF AS RESULT,
   OVERRIDING MEMBER FUNCTION LSHOW (Dom IN VARCHAR2) RETURN VARCHAR2,
   OVERRIDING MEMBER FUNCTION SHOW RETURN VARCHAR2,
   OVERRIDING MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL
)
NOT FINAL;
/

CREATE OR REPLACE TYPE  D_Peso UNDER DT_objtyp (
   CONSTRUCTOR FUNCTION D_Peso (Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION D_Peso (Lab IN VARCHAR2) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION D_Peso (Num IN NUMBER) RETURN SELF AS RESULT,
   MEMBER FUNCTION LSHOW RETURN VARCHAR2,
   MEMBER FUNCTION FEQ (L1 IN VARCHAR2) RETURN REAL   
);
/

CREATE OR REPLACE TYPE  D_FlexCad UNDER DT_objtyp (
   CONSTRUCTOR FUNCTION D_FlexCad (Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION D_FlexCad (Lab IN VARCHAR2) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION D_FlexCad (Num IN NUMBER) RETURN SELF AS RESULT,
   MEMBER FUNCTION LSHOW RETURN VARCHAR2,
   MEMBER FUNCTION FEQ (L1 IN VARCHAR2) RETURN REAL   
);
/

CREATE OR REPLACE TYPE Medico_t AS OBJECT(
   CI NUMBER(10),
   Nombres VARCHAR2(50),
   Apellidos VARCHAR2(50),
   Usuario VARCHAR2(20),
   Contrasena VARCHAR2(20),
   Fisio NUMBER(1)
) NOT FINAL;
/

CREATE OR REPLACE TYPE Paciente_t AS OBJECT(
   CI NUMBER(10),
   Nombres VARCHAR2(50),
   Apellidos VARCHAR2(50),
   Profesion VARCHAR2(50),
   Lugar_Residencia VARCHAR2(50),
   Fecha_Nacimiento DATE,
   ID_Historial NUMBER(6),
   Diagnostico VARCHAR2(200),
   Intervenciones_Quir VARCHAR2(150),
   MEMBER FUNCTION FEQ (et IN NUMBER) return real,
   MEMBER FUNCTION prom_parecido3 (et IN NUMBER) return real
) NOT FINAL;
/


CREATE OR REPLACE TYPE dominio_t AS OBJECT(
   codigo NUMBER(4)
) NOT INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE dominio_fijo_t UNDER dominio_t(
   valor NUMBER(4,2),
   CONSTRUCTOR FUNCTION dominio_fijo_t (dom IN VARCHAR2, et IN VARCHAR2, val IN NUMBER, grado IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION dominio_fijo_t (val IN NUMBER) RETURN SELF AS RESULT,
   MEMBER FUNCTION FEQ (et in NUMBER) return real,
   MEMBER FUNCTION FEQ (dom in VARCHAR2, et in VARCHAR2) return real
);
/

CREATE OR REPLACE TYPE etiqueta_t UNDER dominio_t(
   etiq VARCHAR2(50),
   CONSTRUCTOR FUNCTION etiqueta_t (dom IN VARCHAR2, et1 IN VARCHAR2, et2 IN VARCHAR2, grado IN NUMBER) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION etiqueta_t (et IN VARCHAR2) RETURN SELF AS RESULT,
   MEMBER FUNCTION FEQ (dom in VARCHAR2, et in VARCHAR2) return real
);
/

CREATE OR REPLACE TYPE semejanza_fijo_etiqueta_t AS OBJECT(
   usuario VARCHAR2(50),
   dom_name VARCHAR2(50),
   etiqueta VARCHAR(50),
   dominio NUMBER(4,2),
   grado NUMBER(4,2)
);
/

CREATE OR REPLACE TYPE dispositivos_usados_t AS OBJECT(
   paciente NUMBER(10),
   ID_Historial NUMBER(10),
   dispositivo VARCHAR2(50),
   grado NUMBER(4,2)
);
/


CREATE OR REPLACE TYPE semejanza_etiquetas_t AS OBJECT(
   usuario VARCHAR2(50),
   dom_name VARCHAR2(50),
   etiqueta_1 VARCHAR2(50),
   etiqueta_2 VARCHAR2(50),
   grado NUMBER(4,2)
);
/


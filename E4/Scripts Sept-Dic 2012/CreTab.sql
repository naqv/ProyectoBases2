conn userdef/1234;

CREATE SEQUENCE Id_Per
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE Id_Dominio
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE TABLE User_tab OF UserDef_objtyp (
  CONSTRAINT PK_User PRIMARY KEY (NickName) 
);

CREATE TABLE Usuarios OF UserDef_objtyp (
  CONSTRAINT PK_Usuarios PRIMARY KEY (NickName) 
);

CREATE TABLE Domain_tab OF Fuzzy_objtyp (
  CONSTRAINT PK_Domain PRIMARY KEY (dom_name)  
);

-- "PESO", "TONO_MUSCULAR", "DISPOSITIVOS", "CARAC_MARCHA"
 
CREATE TABLE UDLinLab_tab (
  Label       VARCHAR2(50),
  User_name   VARCHAR2(50),
  Dom_name    VARCHAR2(50),
  Trapezoid   Trapezoid_objtyp,
  CONSTRAINT  PK_LL PRIMARY KEY (Label, User_name, Dom_name),
  CONSTRAINT  FK_LL_Dom FOREIGN KEY (Dom_name) REFERENCES Domain_tab
);

CREATE SEQUENCE Id_Historiales
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;


CREATE TABLE Medico OF Medico_t(
  CONSTRAINT PK_MEDICO PRIMARY KEY (usuario)
);

CREATE TABLE Paciente OF Paciente_t(
  CONSTRAINT PK_PACIENTE PRIMARY KEY (CI, ID_Historial)
);

CREATE TABLE D_Tono_Muscular OF dominio_fijo_t(
  CONSTRAINT PK_D_TONO PRIMARY KEY (valor),
  CHECK (valor IN ('1', '2', '3', '4'))
);

CREATE TABLE etiqueta_tono_muscular OF etiqueta_t(
  CONSTRAINT PK_ETIQ_TONO PRIMARY KEY (etiq)
);

CREATE TABLE semejanza_fijo_etiqueta OF semejanza_fijo_etiqueta_t(
  CONSTRAINT PK_SEM_FIJO_ETIQ PRIMARY KEY (etiqueta, dominio, usuario, dom_name),
  CONSTRAINT FK_DOM_TONO FOREIGN KEY (dominio) REFERENCES D_Tono_Muscular(valor),
  CONSTRAINT FK_ETIQ_TONO FOREIGN KEY (etiqueta) REFERENCES etiqueta_Tono_Muscular(etiq),
  CONSTRAINT FK_DOMINIO_VAR FOREIGN KEY (dom_name) REFERENCES Domain_tab(dom_name),
  CONSTRAINT FK_USER FOREIGN KEY (usuario) REFERENCES Usuarios(NickName),
  CHECK (grado BETWEEN 0.00 and 1.00)
);

CREATE TABLE etiqueta_carac_marcha OF etiqueta_t(
  PRIMARY KEY (etiq)
);

CREATE TABLE semejanza_etiquetas OF semejanza_etiquetas_t (
  CONSTRAINT PK_SEM_ETIQ PRIMARY KEY (etiqueta_1, etiqueta_2, usuario, dom_name),
  CONSTRAINT FK_ETIQ_1 FOREIGN KEY (etiqueta_1) REFERENCES etiqueta_carac_marcha(etiq),
  CONSTRAINT FK_ETIQ_2 FOREIGN KEY (etiqueta_2) REFERENCES etiqueta_carac_marcha(etiq),
  CONSTRAINT FK_DOMINIO_ETIQ FOREIGN KEY (dom_name) REFERENCES Domain_tab(dom_name),
  CONSTRAINT FK_USER_ETIQ FOREIGN KEY (usuario) REFERENCES Usuarios(NickName)
);

CREATE TABLE dispositivo OF etiqueta_t(
  PRIMARY KEY (etiq)
);

CREATE TABLE dispositivos_usados OF dispositivos_usados_t(
  PRIMARY KEY (paciente, dispositivo),
  FOREIGN KEY (paciente, ID_Historial) REFERENCES Paciente(CI, ID_Historial),
  FOREIGN KEY (dispositivo) REFERENCES dispositivo(etiq),
  CHECK (grado BETWEEN 0.00 and 1.00)
);

CREATE TABLE EFA_tab (
  ID_Persona    NUMBER(10),
  ID_Historial  NUMBER(6),
  Fecha_Examen  DATE,
  Medico_Int    VARCHAR2(50),
  Medico_Fisio  VARCHAR2(50),
  Peso          D_Peso,
  Tono_Flex_Dor_Izq dominio_fijo_t,
  Tono_Flex_Dor_Der dominio_fijo_t,
  Carac_Marcha  etiqueta_t,
  CONSTRAINT FK_ID_PERSON FOREIGN KEY (ID_Persona, ID_Historial) REFERENCES Paciente(CI, ID_Historial),
  CONSTRAINT FK_Med_Fisio FOREIGN KEY (Medico_Fisio) REFERENCES Medico (usuario),
  CONSTRAINT PK_EFA PRIMARY KEY (ID_Persona, Fecha_Examen)
);
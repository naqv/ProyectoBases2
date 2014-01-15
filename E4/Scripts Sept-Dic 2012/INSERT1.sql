conn user1/1234;
INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Jose Castillo', 175, D_Peso(100), 'Deportista', D_FlexCad('DLN',120,130,140,150), D_FlexCad(155), 'Normal', 4, 4);
INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Cesar Rondon', 170, D_Peso(90), 'Locutor', D_FlexCad('Bajo',0,0,120,130), D_FlexCad('Alto', 140,160,360,360), 'Parkinson', 1, 1);
INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Maria Rivas', 177, D_Peso('Normal'), 'Cantante', D_FlexCad('DLN'), D_FlexCad('Bajo'), 'Normal', 4, 4);

REM 
REM ** CON ETIQUETA INVALIDA **
REM INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Maria Rivas', 177, D_Peso('Alto'), 'Cantante', DT_objtyp('FleCad','DLN'), D_FlexCad('Bajo'), 'Normal', 4, 4);
REM **
REM

conn user2/1234;
INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Jose Bardina', 180, D_Peso(99), 'Actor', D_FlexCad('DLN',110,125,145,160), D_FlexCad(155), 'Normal', 4, 4);
INSERT INTO EFA_tab VALUES (Id_Per.nextval, 'Luis Lopez', 170, D_Peso(120), 'Electricista', D_FlexCad('Bajo',0,0,110,125), D_FlexCad('Alto', 145,160,360,360), 'Ataxica', 1, 1);

COMMIT;
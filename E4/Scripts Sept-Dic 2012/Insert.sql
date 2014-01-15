conn USERDEF/1234;
INSERT INTO Domain_tab VALUES ('FlexCad');
INSERT INTO Domain_tab VALUES ('Peso');
INSERT INTO Domain_tab VALUES ('Tono_Flexores_Dorsales_Der');
INSERT INTO Domain_tab VALUES ('Tono_Flexores_Dorsales_Izq');
INSERT INTO Domain_tab VALUES ('Carac_Marcha');
INSERT INTO Domain_tab VALUES ('Dispositivos');

INSERT INTO User_tab VALUES ('USERDEF');
--INSERT INTO Usuarios VALUES ('MEDICO1');
--INSERT INTO User_tab VALUES ('MEDICO2');

--INSERT INTO UDLinLab_tab VALUES ('Normal', 'USERDEF', 'Peso', Trapezoid_objtyp(80,90,100,110));
--INSERT INTO UDLinLab_tab VALUES ('Obeso', 'USERDEF', 'Peso', Trapezoid_objtyp(100,110,300,300));
--INSERT INTO UDLinLab_tab VALUES ('Delgado', 'USERDEF', 'Peso', Trapezoid_objtyp(0,0,80,90));

--INSERT INTO UDLinLab_tab VALUES ('Delgado', 'MEDICO1', 'Peso', Trapezoid_objtyp(0,0,80,90));
--INSERT INTO UDLinLab_tab VALUES ('Normal', 'MEDICO1', 'Peso', Trapezoid_objtyp(80,90,100,110));

--INSERT INTO Medico VALUES(12345678, 'pedro', 'perez', 'MEDICO1', '1234', 1);
--INSERT INTO Medico VALUES(23456789, 'pablo', 'perez', 'MEDICO2', '1234', 1);

INSERT INTO D_Tono_Muscular VALUES (id_dominio.nextval, '1');
INSERT INTO D_Tono_Muscular VALUES (id_dominio.nextval, '2');
INSERT INTO D_Tono_Muscular VALUES (id_dominio.nextval, '3');
INSERT INTO D_Tono_Muscular VALUES (id_dominio.nextval, '4');

INSERT INTO etiqueta_Tono_Muscular VALUES (id_dominio.nextval, 'atonia');
INSERT INTO etiqueta_Tono_Muscular VALUES (id_dominio.nextval, 'hipotonia');
INSERT INTO etiqueta_Tono_Muscular VALUES (id_dominio.nextval, 'normotonia');
INSERT INTO etiqueta_Tono_Muscular VALUES (id_dominio.nextval, 'hipertonia');

INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'hemiplejica');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'espastica');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'ataxica');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'parkinsoniana');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'danzante');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'antialgica');
INSERT INTO etiqueta_carac_marcha VALUES (id_dominio.nextval, 'normal');

-- Marcha normal, 

INSERT INTO dispositivo VALUES(id_dominio.nextval, 'Muletas');
INSERT INTO dispositivo VALUES(id_dominio.nextval, 'Silla de ruedas');
INSERT INTO dispositivo VALUES(id_dominio.nextval, 'Andadera');
INSERT INTO dispositivo VALUES(id_dominio.nextval, 'Baston');

--conn MEDICO1/1234;

--EXEC sem_fijo_etiq('Tono_Flexores_Dorsales_Izq', 'MEDICO1', 'atonia', 1, 1);

--INSERT INTO Paciente VALUES (19380899, 'andreina', 'loriente', 'estudiante', 'ccs', to_date('31-01-1990', 'DD-MM-YYYY'), ID_Historiales.nextval, 'problema cadera', 'operacion');
--INSERT INTO Paciente VALUES (19380898, 'veronica', 'hernandez', 'estudiante', 'ccs', to_date('10-12-1989', 'DD-MM-YYYY'), ID_Historiales.nextval, 'problema', 'operacion2');
--INSERT INTO Paciente VALUES (19380900, 'andres', 'loriente', 'estudiante', 'ccs', to_date('31-01-1990', 'DD-MM-YYYY'), ID_Historiales.nextval, 'problema', 'operacion2');


--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Izq', 'atonia', 1, 1);
--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Izq', 'normotonia', 1, 0);
--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Izq', 'hipertonia', 1, 0);

--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Der', 'atonia', 1, 1);
--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Der', 'normotonia', 1, 0.5);
--INSERT INTO Semejanza_Fijo_Etiqueta VALUES ('MEDICO1', 'Tono_Flexores_Dorsales_Der', 'hipertonia', 1, 0.5);

--INSERT INTO Semejanza_Etiquetas VALUES ('MEDICO1', 'Carac_Marcha', 'etiqueta1', 'etiqueta2', 0.5);
--INSERT INTO Semejanza_Etiquetas VALUES ('MEDICO1', 'Carac_Marcha', 'etiqueta1', 'etiqueta4', 0);
--INSERT INTO Semejanza_Etiquetas VALUES ('MEDICO1', 'Carac_Marcha', 'etiqueta2', 'etiqueta3', 0.5);
--INSERT INTO Semejanza_Etiquetas VALUES ('MEDICO1', 'Carac_Marcha', 'etiqueta2', 'etiqueta4', 0.2);

--INSERT INTO dispositivos_usados VALUES (19380899, 1, 'muletas', 1);
--INSERT INTO dispositivos_usados VALUES (19380899, 1, 'silla de ruedas', 0.6);

--INSERT INTO dispositivos_usados VALUES (19380898, 2, 'muletas', 0.6);
--INSERT INTO dispositivos_usados VALUES (19380898, 2, 'silla de ruedas', 1);

--INSERT INTO EFA_tab VALUES (19380899, 1, to_date('20-11-2012', 'DD-MM-YYYY'), 'MEDICO1', 'MEDICO2', D_Peso(70), dominio_fijo_t('Tono_Flexores_Dorsales_Der', 'hipotonia', 1, 0.5), dominio_fijo_t(2), etiqueta_t('etiqueta1'));
--INSERT INTO EFA_tab VALUES (19380900, 3, to_date('20-11-2012', 'DD-MM-YYYY'), 'MEDICO1', 'MEDICO2', D_Peso(70), dominio_fijo_t(1), dominio_fijo_t(4), etiqueta_t('Carac_Marcha', 'etiqueta1', 'etiqueta3', 0.2));


COMMIT;

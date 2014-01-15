conn medico1/1234
SELECT P.Nombres, P.Apellidos, E.Fecha_Examen, E.Tono_Muscular.FEQ(1) Tono_Muscular
FROM EFA_tab E, Paciente P
WHERE E.ID_persona = P.CI;

SELECT P.Nombres, P.Apellidos, E.Fecha_Examen, E.Tono_Muscular.FEQ(1) Tono_Muscular
FROM EFA_tab E, Paciente P
WHERE E.ID_persona = P.CI;

conn medico2/1234
SELECT P.Nombres, P.Apellidos, E.Fecha_Examen, E.Tono_Muscular.FEQ(1) Tono_Muscular
FROM EFA_tab E, Paciente P
WHERE E.ID_persona = P.CI;

conn medico1/1234
SELECT P.Nombres, P.Apellidos, E.Fecha_Examen, E.Carac_Marcha.FEQ('etiqueta3') Carac_Marcha
FROM EFA_tab E, Paciente P
WHERE E.ID_persona = P.CI;

conn medico2/1234
SELECT P.Nombres, P.Apellidos, E.Fecha_Examen, E.Carac_Marcha.FEQ('etiqueta3') Carac_Marcha
FROM EFA_tab E, Paciente P
WHERE E.ID_persona = P.CI;

SELECT E.Nombres, E.Apellidos, E.FEQ(19380898) Dispositivos
FROM Paciente E;

SELECT E.Tono_Muscular.FEQ(1) FROM EFA_tab E WHERE E.ID_persona =  AND E.ID_Historial = ;

SELECT E.Carac_Marcha.FEQ(F.Carac_Marcha.etiq) Carac_Marcha
FROM EFA_tab E, EFA_tab F 
WHERE E.ID_persona = 19380899 AND E.Fecha_Examen = to_date('20-11-2012', 'DD-MM-YYYY') AND F.ID_persona = 19380900 AND E.Fecha_Examen = to_date('20-11-2012', 'DD-MM-YYYY');

SELECT E.Carac_Marcha.FEQ('etiqueta3') Carac_Marcha FROM EFA_tab E WHERE E.ID_persona = 19380900 AND E.Fecha_Examen = to_date('20-11-2012', 'DD-MM-YYYY');

SELECT p.Nombres, P.Apellidos, P.ci, E.Id_Historial, E.Carac_Marcha.FEQ('etiqueta2') FROM EFA_tab E, Paciente P WHERE E.ID_persona = P.ci;

SELECT P.Nombres, P.Apellidos, P.ci, P.Id_Historial, P.FEQ(19380899) FROM Paciente P WHERE P.FEQ(19380899) > 0;

SELECT P.Nombres, P.Apellidos, P.ci, P.Id_Historial, P.prom_parecido3(19380899) FROM Paciente P WHERE P.prom_parecido3(19380899) > 0;
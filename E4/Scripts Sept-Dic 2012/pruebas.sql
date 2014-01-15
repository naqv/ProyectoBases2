select a.grado, b.grado, b.dispositivo from dispositivos_usados a full outer join dispositivos_usados b on a.dispositivo = b.dispositivo and a.paciente = 2 and b.paciente = 3;

create view view1 as
select dispositivo, grado
from dispositivos_usados
where paciente = 19380898;

create view view2 as
select dispositivo, grado
from dispositivos_usados
where paciente = 19380899;

SELECT p.Nombres, P.Apellidos, P.ci, E.Id_Historial, E.Fecha_Examen, E.Peso.FEQ('Tono_Flexores_Dorsales_Izq','normotonia') FROM EFA_tab E, Paciente P WHERE E.ID_persona = P.ci AND E.Tono_Flex_Dor_Izq.FEQ('Tono_Flexores_Dorsales_Izq','normotonia') > 0 AND ROWNUM between 1 AND 10



pacientes 2 y 3

        P1         P2         G1         G2 D
---------- ---------- ---------- ---------- -------------
                    2                     1 Muletas
         2          3          1        .75 Muletas
                    3                   .25 Andadera
                    4                    .5 Muletas
         4                    .5
         3                   .75
         3                   .25


pacientes 2 y 4

        P1         P2         G1         G2 D
---------- ---------- ---------- ---------- ------------------------------------
                    2                     1 Muletas
                    3                   .75 Muletas
                    3                   .25 Andadera
         2          4          1         .5 Muletas
         4                    .5
         3                   .75
         3                   .25


pacientes 3 y 4

        P1         P2         G1         G2 D
---------- ---------- ---------- ---------- ---------------------------------
                    2                     1 Muletas
                    3                   .75 Muletas
                    3                   .25 Andadera
         3          4        .75         .5 Muletas
         4                    .5
         2                     1
         3                   .25



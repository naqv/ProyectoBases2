------------------------------ METODOS ------------------------------


------------ listarEvento -------------------------------------------


------------ calcularCostoUSD Y listarEventos ---------------------------------------

CREATE OR REPLACE TYPE BODY hito_t AS
    MEMBER FUNCTION calcularCostoEnUSD return NUMERIC AS
        costoDolar NUMERIC(30,5);
        relacionMoneda  NUMERIC(30,5);
       
   BEGIN

   
        SELECT DEREF(DEREF(ruta).estaEn).relacionLocalUSD INTO relacionMoneda
        FROM agr_hito_table          
        WHERE (DEREF(hito)).nombre =self.nombre AND rownum <=1;
 
        costoDolar:= self.costoTicketMonedaLocal / relacionMoneda;
            
            
             RETURN (costoDolar);
  END;
MEMBER PROCEDURE listarEventos AS   
    CURSOR evento_cursor IS
       SELECT   nombre       
       FROM     evento_table e
       WHERE    e.ocurre.nombre = self.nombre;
       --;

    BEGIN

        FOR eventoNombre IN evento_cursor
        LOOP
            DBMS_OUTPUT.put_line(eventoNombre.nombre);
        END LOOP;
  END;
END;
/


-----------------------PROCEDIMIENTO QUE TODAVIA NO FUNCIONA---------------------------


select h.calcularCostoEnUSD() from hito_table h
where h.nombre = 'UniversidadSimonBolivar';


CREATE OR REPLACE PROCEDURE PRUEBA AS
hito_prueba hito_t;
BEGIN

select * INTO hito_prueba
FROM hito_table h
WHERE h.nombre ='MuseoArtesModernas';
execute hito_prueba.listarEventos);

END;
/
------------------------------ TRIGGERS -----------------------------

-- Trigger 1: Se agrega en Via un atributo derivado que es el número de rutas que la tienen. El trigger sería actualizar ese valor.

CREATE or REPLACE TRIGGER Num_Rutas_En_Via_Trigger
AFTER INSERT 
    ON ruta_table
    -- [FOR EACH ROW]   Averiguar que hace.
DECLARE
   @nestedTable AS refs_to_via
   @identificador AS VARCHAR
   @nuevo AS INT
BEGIN

/* Sacar de la nestedtable de ruta_table las vias
 * Recorrerlas y para una hay que hacer lo siguiente
 * Para cada instancia de nestedtable*/

    SET @nestedTable = (SELECT partesVia FROM INSERTED)
    /* Como recorrer la Nested Table?*/
    SET @identificador= (SELECT nombre FROM via_table); /*DUDA*/
    /* Teniendo la via, guardo el nombre */ 
    SET @nuevo= 1 + (SELECT rutasPresentes FROM via_table)

UPDATE via_table
SET rutasPresentes = nuevo
WHERE nombre LIKE @identificador
EXCEPTION
    WHEN /* Excepcion */
END;





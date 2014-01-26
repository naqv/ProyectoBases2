------------------------------ METODOS ------------------------------


------------ listarEvento -------------------------------------------

CREATE OR REPLACE PROCEDURE listarEventos (nombreHito VARCHAR) AS   
    CURSOR evento_cursor IS
       SELECT   nombre       
       FROM     evento_table e
       WHERE    e.ocurre.nombre = nombreHito;
       --;

    BEGIN

        FOR eventoNombre IN evento_cursor
        LOOP
            DBMS_OUTPUT.put_line(eventoNombre.nombre);
        END LOOP;

    END;
/


------------ calcularCostoUSD ---------------------------------------

CREATE OR REPLACE TYPE BODY hito_t AS
    MEMBER FUNCTION calcularCostoEnUSD(relacionLocalUSD IN NUMERIC) return NUMERIC AS
        costoDolar NUMERIC(30,5);
        agregacionHito  agr_hito_t;
        rutaT           ruta_t;
        ciudad          ciudad_t;
        guardar         REF ciudad_t;
        relacionMoneda  NUMERIC(30,5);
        costoTicket     NUMERIC(30,5);
        nuevo VARCHAR(100);
  BEGIN

   
        SELECT DEREF(DEREF(ruta).estaEn).relacionLocalUSD INTO relacionMoneda
        FROM agr_hito_table          
        WHERE (DEREF(hito)).nombre =self.nombre AND rownum <=1;
 
        costoDolar:= self.costoTicketMonedaLocal * relacionMoneda;
            
            
             RETURN (costoDolar);
  END;
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




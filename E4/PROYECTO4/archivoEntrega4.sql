------------------------------ METODOS ------------------------------


------------ listarEvento -------------------------------------------

CREATE OR REPLACE PROCEDURE listarEventos (nombreHito VARCHAR) AS   
    CURSOR evento_cursor IS
       SELECT   nombre       
       FROM     evento_table e
       WHERE    e.ocurre.nombre = nombreHito;

    BEGIN

        FOR eventoNombre IN evento_cursor
        LOOP
            DBMS_OUTPUT.put_line(eventoNombre.nombre);
        END LOOP;

    END;
/

------------ calcularCostoUSD ---------------------------------------

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
END;
/

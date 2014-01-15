CREATE OR REPLACE TYPE BODY DF_objtyp AS 
 CONSTRUCTOR FUNCTION DF_objtyp (Dom IN VARCHAR2, Lab IN VARCHAR2) RETURN SELF AS RESULT IS
  ES_reg ElementSet_objtyp;
  BEGIN
    SELECT t2.* bulk collect into Es_reg
    FROM  BasicDomain_tab t1, TABLE(t1.ElementSet) t2 
    WHERE   Dom_name=Dom AND LabelDF=Lab;
    SELF:=DF_objtyp(Dom,Lab,ES_reg);
    RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
       Raise_application_error(-20001,'*** Basic Domain Not Found *** ');
  END;
  
END;
/

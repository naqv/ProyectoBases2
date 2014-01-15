conn userdef/1234;

CREATE OR REPLACE TYPE BODY Trapezoid_objtyp AS 
 
CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN SELF AS RESULT IS
  UD_reg UDLinLab_tab%rowtype;
  CT_T Trapezoid_Objtyp;
  BEGIN
    SELECT  * INTO UD_reg
   FROM    UDLinLab_tab
   WHERE   User_name=user AND Label=L1 AND Dom_name=D1;
   SELF:=UD_reg.Trapezoid;
   RETURN;
   EXCEPTION when NO_DATA_FOUND THEN
        SELF:= CA_UserDefault(D1, L1);
        RETURN;
 END;

CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, N IN NUMBER) RETURN SELF AS RESULT IS
 BEGIN
    SELF:=Trapezoid_Objtyp( N, N, N, N);
    RETURN;
 END;

CONSTRUCTOR FUNCTION Trapezoid_objtyp (D1 IN VARCHAR2, L1 IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT IS
CT_T Trapezoid_Objtyp;
BEGIN
   CA_LinLab(D1, L1, User , N1, N2, N3, N4);
   SELF:=Trapezoid_Objtyp( N1, N2, N3, N4);
   RETURN;
END;
  
MEMBER FUNCTION FEQT (T1 IN Trapezoid_objtyp) RETURN REAL IS
  FEQR  NUMBER (3,2); 
  S_a   NUMBER(12,3);
  S_b   NUMBER(12,3);
  T1_a  NUMBER(12,3);
  T1_b  NUMBER(12,3);
  BEGIN
   IF (SELF.T_a= 0 AND SELF.T_b= 0) THEN 
    S_a:=SELF.T_c;
    S_b:=SELF.T_c;
    ELSE
    S_a:=SELF.T_a;
    S_b:=SELF.T_b;
   END IF;
   IF (T1.T_a= 0 AND T1.T_b= 0) THEN 
    T1_a:=T1.T_c;
    T1_b:=T1.T_c;
    ELSE
    T1_a:=T1.T_a;
    T1_b:=T1.T_b;
   END IF;
   IF (SELF.T_a= T1.T_a AND SELF.T_b = T1.T_b AND SELF.T_c= T1.T_c AND SELF.T_d = T1.T_d) THEN FEQR:=1;  
     ELSIF (SELF.T_a= T1.T_a AND SELF.T_b = T1.T_b AND ((SELF.T_c<= T1.T_c AND SELF.T_d <= T1.T_d) OR (SELF.T_c>= T1.T_c AND SELF.T_d >= T1.T_d))) THEN FEQR:=1;
       ELSIF (S_a >= T1.T_d OR SELF.T_d <= T1_a) THEN FEQR:=0;
         ELSIF (SELF.T_c < T1_b AND SELF.T_d > T1_a) THEN 
           FEQR:=(SELF.T_d - T1_a)/((T1_b - T1_a)-(SELF.T_c - SELF.T_d));
             ELSIF  (S_b > T1.T_c AND S_a < T1.T_d) THEN
                FEQR:=(T1.T_d - S_a)/((S_b - S_a)-(T1.T_c - T1.T_d));
              ELSE
                FEQR:=1;
    END IF;
    RETURN FEQR;
  END;

MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL IS
  T1 Trapezoid_objtyp;
  BEGIN
    T1:=CA_Trap(D1,L1);
    RETURN SELF.FEQT(T1);
  END;

MEMBER FUNCTION LSHOW(Dom IN VARCHAR2) RETURN VARCHAR2 IS
   Trap Trapezoid_objtyp;
   TYPE CUR_TYP IS REF CURSOR;
   c_cursor   CUR_TYP;
   Lab1       VarCHAR2(20);
   FEQ        Number(3,2);
   v_query    VARCHAR2(255);
   str        VARCHAR(60);
 BEGIN
  Trap:=SELF;
  v_query := 'SELECT L.Trapezoid.FEQT(:T1), Label
   FROM UDLinLab_TAB L 
   WHERE User_name=User AND Dom_name=:D AND L.Trapezoid.FEQT(:T2)>0'; 
  OPEN c_cursor FOR v_query USING Trap, Dom, Trap;
    LOOP
      FETCH c_cursor INTO FEQ, Lab1;
      EXIT WHEN c_cursor%NOTFOUND;
      str:=str||FEQ||'/'||Lab1||'; ';
    END LOOP;
  CLOSE c_cursor;
  RETURN str;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    Raise_application_error(-20001,'*** User Not Found *** ');
 END;

MEMBER FUNCTION SHOW RETURN VARCHAR2 IS
   T Trapezoid_objtyp;
   str VARCHAR(60);
 BEGIN
  T:=SELF;
  str:=str||'('||T.T_A||', '||T.T_B||', '||T.T_C||', '||T.T_D||')';
  RETURN str;
 END;

END;
/

CREATE OR REPLACE TYPE BODY DT_objtyp AS 
 
 CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    CA_LinLab(Dom, Lab, User , N1, N2, N3, N4);
    SELF:=DT_objtyp(Dom, Lab, Trapezoid_objtyp(N1, N2, N3, N4));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Lab IN VARCHAR2) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=DT_objtyp(Dom, Lab, Trapezoid_objtyp(Dom, Lab));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION DT_objtyp (Dom IN VARCHAR2, Num IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=DT_objtyp(Dom, NULL , Trapezoid_objtyp(Dom, Num));
    RETURN;
  END;

OVERRIDING MEMBER FUNCTION LSHOW (Dom IN VARCHAR2) RETURN VARCHAR2 IS
 BEGIN
  RETURN SELF.Trap.LSHOW(Dom);
 END;

OVERRIDING MEMBER FUNCTION SHOW RETURN VARCHAR2 IS
 BEGIN
  RETURN SELF.Trap.SHOW();
 END;

OVERRIDING MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL IS
  BEGIN
    RETURN SELF.Trap.FEQ(D1,L1);
  END;
  
END;
/

CREATE OR REPLACE TYPE BODY Fuzzy_objtyp AS 
 MEMBER FUNCTION LSHOW (Dom IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN NULL;
  END;
 MEMBER FUNCTION SHOW RETURN VARCHAR2 IS
  BEGIN
    RETURN NULL;
  END;
  MEMBER FUNCTION FEQ (D1 IN VARCHAR2, L1 IN VARCHAR2) RETURN REAL IS
  BEGIN
    RETURN NULL;
  END;
  
END;
/

CREATE OR REPLACE TYPE BODY D_Peso AS 
 
 CONSTRUCTOR FUNCTION D_Peso (Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    CA_LinLab('Peso', Lab, User , N1, N2, N3, N4);
    SELF:=D_Peso('Peso', Lab, Trapezoid_objtyp(N1, N2, N3, N4));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION D_Peso (Lab IN VARCHAR2) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=D_Peso('Peso', Lab, Trapezoid_objtyp('Peso', Lab));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION D_Peso (Num IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=D_Peso('Peso', NULL , Trapezoid_objtyp('Peso', Num));
    RETURN;
  END;

MEMBER FUNCTION LSHOW RETURN VARCHAR2 IS
 BEGIN
  RETURN SELF.Trap.LSHOW('Peso');
 END;

MEMBER FUNCTION FEQ (L1 IN VARCHAR2) RETURN REAL IS
  BEGIN
    RETURN SELF.Trap.FEQ('Peso',L1);
  END;

END;
/

CREATE OR REPLACE TYPE BODY D_FlexCad AS 
 
 CONSTRUCTOR FUNCTION D_FlexCad (Lab IN VARCHAR2, N1 IN NUMBER, N2 IN NUMBER, N3 IN NUMBER, N4 IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    CA_LinLab('FlexCad', Lab, User , N1, N2, N3, N4);
    SELF:=D_FlexCad('FlexCad', Lab, Trapezoid_objtyp(N1, N2, N3, N4));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION D_FlexCad (Lab IN VARCHAR2) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=D_FlexCad('FlexCad', Lab, Trapezoid_objtyp('FlexCad', Lab));
    RETURN;
  END;

 CONSTRUCTOR FUNCTION D_FlexCad (Num IN NUMBER) RETURN SELF AS RESULT IS
  BEGIN
    SELF:=D_FlexCad('FlexCad', NULL , Trapezoid_objtyp('FlexCad', Num));
    RETURN;
  END;

MEMBER FUNCTION LSHOW RETURN VARCHAR2 IS
 BEGIN
  RETURN SELF.Trap.LSHOW('FlexCad');
 END;

MEMBER FUNCTION FEQ (L1 IN VARCHAR2) RETURN REAL IS
  BEGIN
    RETURN SELF.Trap.FEQ('FlexCad',L1);
  END;

END;
/




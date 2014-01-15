create or replace
FUNCTION CA_FEQ (N1 IN NUMBER, Dom IN VARCHAR2, Lab IN VARCHAR2) RETURN REAL IS
  T1 Trapezoid_objtyp;
  BEGIN
    T1:=CA_Trap(Dom,Lab);
    RETURN T1.FEQT(trapezoid_objtyp(N1, N1, N1, N1));
  END;
/
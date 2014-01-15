CREATE OR REPLACE FUNCTION UserDefault 
   RETURN VARCHAR
is
  User_Def VARCHAR(10);
BEGIN
   SELECT NICKNAME INTO User_Def
   FROM USER_tab;
   RETURN User_Def; 
   EXCEPTION WHEN NO_DATA_FOUND THEN
      Raise_application_error(-20001,'*** User Default Not Found *** ');
END;
/
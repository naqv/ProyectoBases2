CREATE OR REPLACE FUNCTION UserContext 
   RETURN NUMBER
is
  User_Con varchar2(10);
BEGIN
   SELECT NickName INTO User_Con
   FROM USER_tab
   WHERE nickname=USER;
   RETURN User_Con; 
   EXCEPTION WHEN NO_DATA_FOUND THEN
      Raise_application_error(-20001,'*** User Not Found *** ');
END;
/
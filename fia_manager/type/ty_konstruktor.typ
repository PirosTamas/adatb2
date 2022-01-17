create or replace type ty_konstruktor as object
(
  id                 number,
  nev                varchar2(30),
  nemzetiseg         varchar2(3),
  evi_koltseg_limit  number,
  csapatfonok_nev    varchar(30),
  
  CONSTRUCTOR FUNCTION ty_konstruktor RETURN SELF AS RESULT
)
/
create or replace type body ty_konstruktor is
  
 CONSTRUCTOR FUNCTION ty_konstruktor RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  
end;
/

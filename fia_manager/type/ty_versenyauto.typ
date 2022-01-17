create or replace type ty_versenyauto as object
(
  id               number,
  nev              varchar2(10),
  pilotaid         number,
  beallitas_tipus  varchar(30),
  elsoszarny       number,
  hatsoszarny      number,
  motor            varchar2(10),
  gumiKeverek      varchar2(10), 
  
  CONSTRUCTOR FUNCTION ty_versenyauto RETURN SELF AS RESULT
)
/
create or replace type body ty_versenyauto is
  
  CONSTRUCTOR FUNCTION ty_versenyauto RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  
end;
/

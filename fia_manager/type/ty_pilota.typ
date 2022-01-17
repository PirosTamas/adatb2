create or replace type ty_pilota as object
(
  id                              number,
  csapatid                        number,
  keresztnev                      varchar2(20),
  vezeteknev                      varchar2(20),
  nemzetiseg                      varchar2(3),
  rajtszam                        number,
  szuletesi_datum                 date,
  teljesitett_futamok             number,
  vilagbajnoki_cimek_szama        number,
  
  CONSTRUCTOR FUNCTION ty_pilota RETURN SELF AS RESULT
)
/
create or replace type body ty_pilota is
  
 CONSTRUCTOR FUNCTION ty_pilota RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  
end;
/

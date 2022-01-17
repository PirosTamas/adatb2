create or replace type ty_futam as object
(
  id                       number,
  orszag                   varchar2(30),
  varos                    varchar(30),
  elso_helyezett_id        number,
  masodik_helyezett_id     number,
  harmadik_helyezett_id    number,
  kiesettek_szama          number,
  biztonsagi_auto          char(1),
  
  CONSTRUCTOR FUNCTION ty_futam RETURN SELF AS RESULT
)
/
create or replace type body ty_futam is
  
 CONSTRUCTOR FUNCTION ty_futam RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  
end;
/

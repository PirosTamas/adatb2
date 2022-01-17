create or replace function same_nationality(p_orszag varchar2) 
return ty_pilota_list is
res ty_pilota_list;

begin
  select * bulk collect into res from (select ty_pilota( p.id,
                                                         p.csapatid,
                                                         p.keresztnev,
                                                         p.vezeteknev,
                                                         p.nemzetiseg,
                                                         p.rajtszam,
                                                         p.szuletesi_datum,
                                                         p.teljesitett_futamok,
                                                         p.vilagbajnoki_cimek_szama)
                                                         from pilota p where p.nemzetiseg = p_orszag);
  return res;
end;
/

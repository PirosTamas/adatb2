create or replace package pilota_pkg is

  procedure pilota_delete(p_id number);
  
  procedure pilota_insert(p_id                              number,
                          p_csapatid                        number,
                          p_keresztnev                      varchar2,
                          p_vezeteknev                      varchar2,
                          p_nemzetiseg                      varchar2,
                          p_rajtszam                        number,
                          p_szuletesi_datum                 date,
                          p_teljesitett_futamok             number,
                          p_vilagbajnoki_cimek_szama        number);
                          
  procedure pilota_update(p_id                              number,
                          p_csapatid                        number,
                          p_keresztnev                      varchar2,
                          p_vezeteknev                      varchar2,
                          p_nemzetiseg                      varchar2,
                          p_rajtszam                        number,
                          p_szuletesi_datum                 date,
                          p_teljesitett_futamok             number,
                          p_vilagbajnoki_cimek_szama        number);
                          
  function pilota_select(p_id number) return ty_pilota;

end pilota_pkg;
/
create or replace package body pilota_pkg is

  procedure pilota_delete(p_id number) is
  begin
    delete from pilota p where p.id = p_id;
  end pilota_delete;
  
  procedure pilota_insert(p_id                              number,
                          p_csapatid                        number,
                          p_keresztnev                      varchar2,
                          p_vezeteknev                      varchar2,
                          p_nemzetiseg                      varchar2,
                          p_rajtszam                        number,
                          p_szuletesi_datum                 date,
                          p_teljesitett_futamok             number,
                          p_vilagbajnoki_cimek_szama        number) is                       
  begin
    insert into pilota
      (id,                           
       csapatid,                        
       keresztnev,                      
       vezeteknev,                      
       nemzetiseg,                      
       rajtszam,                        
       szuletesi_datum,                 
       teljesitett_futamok,             
       vilagbajnoki_cimek_szama)
     values
       (p_id,
        p_csapatid,
        p_keresztnev,
        p_vezeteknev,
        p_nemzetiseg,
        p_rajtszam,
        p_szuletesi_datum,
        p_teljesitett_futamok,
        p_vilagbajnoki_cimek_szama);
    end pilota_insert;  
    
  procedure pilota_update (p_id                             number,
                          p_csapatid                        number,
                          p_keresztnev                      varchar2,
                          p_vezeteknev                      varchar2,
                          p_nemzetiseg                      varchar2,
                          p_rajtszam                        number,
                          p_szuletesi_datum                 date,
                          p_teljesitett_futamok             number,
                          p_vilagbajnoki_cimek_szama        number) is 
  v_pilota pilota%ROWTYPE;
  BEGIN
     BEGIN
     SELECT *
      INTO v_pilota
      FROM pilota p
     WHERE p.id = p_id;
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_no_pilota_exc_code, 'Nincs ilyen ID-val rendelkezo pilota!');
  END;

  IF p_id IS NOT NULL
  THEN
    v_pilota.id := p_id;
  END IF;

  IF p_csapatid IS NOT NULL
  THEN
    v_pilota.csapatid := p_csapatid;
  END IF;

  IF p_keresztnev IS NOT NULL
  THEN
    v_pilota.keresztnev := p_keresztnev;
  END IF;
  
   IF p_vezeteknev IS NOT NULL
  THEN
    v_pilota.vezeteknev := p_vezeteknev;
  END IF;
  
   IF p_nemzetiseg IS NOT NULL
  THEN
    v_pilota.nemzetiseg := p_nemzetiseg;
  END IF;
  
   IF p_rajtszam IS NOT NULL
  THEN
    v_pilota.rajtszam := p_rajtszam;
  END IF;

   IF p_szuletesi_datum IS NOT NULL
  THEN
    v_pilota.szuletesi_datum := p_szuletesi_datum;
  END IF;
  
   IF p_teljesitett_futamok IS NOT NULL
  THEN
    v_pilota.teljesitett_futamok := p_teljesitett_futamok;
  END IF;
  
   IF p_vilagbajnoki_cimek_szama IS NOT NULL
  THEN
    v_pilota.vilagbajnoki_cimek_szama := p_vilagbajnoki_cimek_szama;
  END IF;
  
  UPDATE pilota p
     SET p.id       = v_pilota.id
        ,p.csapatid = v_pilota.csapatid
        ,p.keresztnev = v_pilota.keresztnev
        ,p.vezeteknev = v_pilota.vezeteknev
        ,p.nemzetiseg = v_pilota.nemzetiseg
        ,p.rajtszam = v_pilota.rajtszam
        ,p.szuletesi_datum = v_pilota.szuletesi_datum
        ,p.teljesitett_futamok = v_pilota.teljesitett_futamok
        ,p.vilagbajnoki_cimek_szama = v_pilota.vilagbajnoki_cimek_szama
   WHERE p.id = p_id;
END pilota_update;   

    FUNCTION pilota_select(p_id number)
      RETURN ty_pilota IS
  res ty_pilota;
BEGIN
  res := ty_pilota();
  
  SELECT p.id
        ,p.csapatid
        ,p.keresztnev
        ,p.vezeteknev
        ,p.nemzetiseg
        ,p.rajtszam
        ,p.szuletesi_datum
        ,p.teljesitett_futamok
        ,p.vilagbajnoki_cimek_szama
    INTO res.id
        ,res.csapatid
        ,res.keresztnev
        ,res.vezeteknev
        ,res.nemzetiseg
        ,res.rajtszam
        ,res.szuletesi_datum
        ,res.teljesitett_futamok
        ,res.vilagbajnoki_cimek_szama
    FROM pilota p
   WHERE p.id = p_id;
   
  RETURN(res);
END pilota_select; 
  
end pilota_pkg;
/

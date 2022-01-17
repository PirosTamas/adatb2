create or replace package versenyauto_pkg is

  procedure versenyauto_delete(p_id number);
  
  procedure versenyauto_insert(p_id               number,
                               p_nev              varchar2,
                               p_pilotaid         number,
                               p_beallitas_tipus  varchar2,
                               p_elsoszarny       number,
                               p_hatsoszarny      number,
                               p_motor            varchar2,
                               p_gumiKeverek      varchar2);
                          
  procedure versenyauto_update(p_id               number,
                               p_nev              varchar2,
                               p_pilotaid         number,
                               p_beallitas_tipus  varchar2,
                               p_elsoszarny       number,
                               p_hatsoszarny      number,
                               p_motor            varchar2,
                               p_gumiKeverek      varchar2);
                               
  function versenyauto_select(p_id number) return ty_versenyauto;

end versenyauto_pkg;
/
create or replace package body versenyauto_pkg is

  procedure versenyauto_delete(p_id number) is
  begin
    delete from versenyauto a where a.id = p_id;
  end versenyauto_delete;
  
  procedure versenyauto_insert(p_id               number,
                               p_nev              varchar2,
                               p_pilotaid         number,
                               p_beallitas_tipus  varchar2,
                               p_elsoszarny       number,
                               p_hatsoszarny      number,
                               p_motor            varchar2,
                               p_gumiKeverek      varchar2) is                       
  begin
    insert into versenyauto
      (id,                           
       nev,
       pilotaid,
       beallitas_tipus,
       elsoszarny,
       hatsoszarny,
       motor,
       gumiKeverek)
     values
       (p_id,
        p_nev,
        p_pilotaid,
        p_beallitas_tipus,
        p_elsoszarny,
        p_hatsoszarny,
        p_motor,
        p_gumiKeverek);
  end versenyauto_insert;
  
  procedure versenyauto_update (p_id                  number,
                                p_nev                 varchar2,
                                p_pilotaid            number,
                                p_beallitas_tipus     varchar2,
                                p_elsoszarny          number,
                                p_hatsoszarny         number,
                                p_motor               varchar2,
                                p_gumiKeverek         varchar2) is 
  v_versenyauto versenyauto%ROWTYPE;
  BEGIN
     BEGIN
     SELECT *
      INTO v_versenyauto
      FROM versenyauto a
     WHERE a.id = p_id;
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_no_versenyauto_exc_code, 'Nincs ilyen ID-val rendelkezo versenyauto');
  END;

  IF p_id IS NOT NULL
  THEN
    v_versenyauto.id := p_id;
  END IF;

  IF p_nev IS NOT NULL
  THEN
    v_versenyauto.nev := p_nev;
  END IF;

  IF p_pilotaid IS NOT NULL
  THEN
    v_versenyauto.pilotaid := p_pilotaid;
  END IF;
  
   IF p_beallitas_tipus IS NOT NULL
  THEN
    v_versenyauto.beallitas_tipus := p_beallitas_tipus;
  END IF;
  
   IF p_elsoszarny IS NOT NULL
  THEN
    v_versenyauto.elsoszarny := p_elsoszarny;
  END IF;
  
  IF p_hatsoszarny IS NOT NULL
  THEN
    v_versenyauto.hatsoszarny := p_hatsoszarny;
  END IF;
  
  IF p_motor IS NOT NULL
  THEN
    v_versenyauto.motor := p_motor;
  END IF;
  
  IF p_gumiKeverek IS NOT NULL
  THEN
    v_versenyauto.gumiKeverek := p_gumiKeverek;
  END IF;
  
  UPDATE versenyauto a
     SET a.id              = v_versenyauto.id
        ,a.nev             = v_versenyauto.nev
        ,a.pilotaid        = v_versenyauto.pilotaid
        ,a.beallitas_tipus = v_versenyauto.beallitas_tipus
        ,a.elsoszarny      = v_versenyauto.elsoszarny
        ,a.hatsoszarny     = v_versenyauto.hatsoszarny
        ,a.motor           = v_versenyauto.motor
        ,a.gumiKeverek     = v_versenyauto.gumikeverek
   WHERE a.id = p_id;
END versenyauto_update;    

FUNCTION versenyauto_select(p_id number)
      RETURN ty_versenyauto IS
  res ty_versenyauto;
BEGIN
  res := ty_versenyauto();
  
  SELECT a.id
        ,a.nev
        ,a.pilotaid
        ,a.beallitas_tipus
        ,a.elsoszarny
        ,a.hatsoszarny
        ,a.motor
        ,a.gumiKeverek
    INTO res.id
        ,res.nev
        ,res.pilotaid
        ,res.beallitas_tipus
        ,res.elsoszarny
        ,res.hatsoszarny
        ,res.motor
        ,res.gumiKeverek
    FROM versenyauto a
   WHERE a.id = p_id;
   
  RETURN(res);
END versenyauto_select;
  
end versenyauto_pkg;
/

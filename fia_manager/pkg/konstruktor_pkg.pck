create or replace package konstruktor_pkg is

  procedure konstruktor_delete(p_id number);
  
  procedure konstruktor_insert(p_id                 number,
                               p_nev                varchar2,
                               p_nemzetiseg         varchar2,
                               p_evi_koltseg_limit  number,
                               p_csapatfonok_nev    varchar2);
                          
  procedure konstruktor_update(p_id                 number,
                               p_nev                varchar2,
                               p_nemzetiseg         varchar2,
                               p_evi_koltseg_limit  number,
                               p_csapatfonok_nev    varchar2);
                               
  function konstruktor_select(p_id number) return ty_konstruktor;
end konstruktor_pkg;
/
create or replace package body konstruktor_pkg is
 
  procedure konstruktor_delete(p_id number) is
  begin
    delete from konstruktor k where k.id = p_id;
  end konstruktor_delete;
  
  procedure konstruktor_insert(p_id                  number,
                                p_nev                 varchar2,
                                p_nemzetiseg          varchar2,
                                p_evi_koltseg_limit   number,
                                p_csapatfonok_nev     varchar2) is                       
  begin
    insert into konstruktor
      (id,                           
       nev,
       nemzetiseg,
       evi_koltseg_limit,
       csapatfonok_nev)
     values
       (p_id,
        p_nev,
        p_nemzetiseg,
        p_evi_koltseg_limit,
        p_csapatfonok_nev);
  end konstruktor_insert;
  
  procedure konstruktor_update (p_id                  number,
                                p_nev                 varchar2,
                                p_nemzetiseg          varchar2,
                                p_evi_koltseg_limit   number,
                                p_csapatfonok_nev     varchar2) is 
  v_konstruktor konstruktor%ROWTYPE;
  BEGIN
     BEGIN
     SELECT *
      INTO v_konstruktor
      FROM konstruktor k
     WHERE k.id = p_id;
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_no_konstruktor_exc_code, 'Nincs ilyen ID-val rendelkezo konstruktor!');
  END;

  IF p_id IS NOT NULL
  THEN
    v_konstruktor.id := p_id;
  END IF;

  IF p_nev IS NOT NULL
  THEN
    v_konstruktor.nev := p_nev;
  END IF;

  IF p_nemzetiseg IS NOT NULL
  THEN
    v_konstruktor.nemzetiseg := p_nemzetiseg;
  END IF;
  
   IF p_evi_koltseg_limit IS NOT NULL
  THEN
    v_konstruktor.evi_koltseg_limit := p_evi_koltseg_limit;
  END IF;
  
   IF p_csapatfonok_nev IS NOT NULL
  THEN
    v_konstruktor.csapatfonok_nev := p_csapatfonok_nev;
  END IF;
  
  UPDATE konstruktor k
     SET k.id       = v_konstruktor.id
        ,k.nev = v_konstruktor.nev
        ,k.nemzetiseg = v_konstruktor.nemzetiseg
        ,k.evi_koltseg_limit = v_konstruktor.evi_koltseg_limit
        ,k.csapatfonok_nev = v_konstruktor.csapatfonok_nev
   WHERE k.id = p_id;
END konstruktor_update;    

FUNCTION konstruktor_select(p_id number)
      RETURN ty_konstruktor IS
  res ty_konstruktor;
BEGIN
  res := ty_konstruktor();
  
  SELECT k.id
        ,k.nev
        ,k.nemzetiseg
        ,k.evi_koltseg_limit
        ,k.csapatfonok_nev
    INTO res.id
        ,res.nev
        ,res.nemzetiseg
        ,res.evi_koltseg_limit
        ,res.csapatfonok_nev
    FROM konstruktor k
   WHERE k.id = p_id;
   
  RETURN(res);
END konstruktor_select;
      
end konstruktor_pkg;
/

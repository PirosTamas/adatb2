create or replace package futam_pkg is

  procedure futam_delete(p_id number);
  
  procedure futam_insert(p_id                       number,
                         p_orszag                   varchar2,
                         p_varos                    varchar2,
                         p_elso_helyezett_id        number,
                         p_masodik_helyezett_id     number,
                         p_harmadik_helyezett_id    number,
                         p_kiesettek_szama          number,
                         p_biztonsagi_auto          char);
                               
  procedure futam_update(p_id                       number,
                         p_orszag                   varchar2,
                         p_varos                    varchar2,
                         p_elso_helyezett_id        number,
                         p_masodik_helyezett_id     number,
                         p_harmadik_helyezett_id    number,
                         p_kiesettek_szama          number,
                         p_biztonsagi_auto          char);
                         
  function futam_select(p_id number) return ty_futam;

end futam_pkg;
/
create or replace package body futam_pkg is

  procedure futam_delete(p_id number) is
  begin
    delete from futam f where f.id = p_id;
  end futam_delete;
  
  procedure futam_insert(p_id                       number,
                         p_orszag                   varchar2,
                         p_varos                    varchar2,
                         p_elso_helyezett_id        number,
                         p_masodik_helyezett_id     number,
                         p_harmadik_helyezett_id    number,
                         p_kiesettek_szama          number,
                         p_biztonsagi_auto          char) is
    begin
    insert into futam
      (id,                           
       orszag,
       varos,
       elso_helyezett_id,
       masodik_helyezett_id,
       harmadik_helyezett_id,
       kiesettek_szama,
       biztonsagi_auto)
     values
       (p_id,                           
        p_orszag,
        p_varos,
        p_elso_helyezett_id,
        p_masodik_helyezett_id,
        p_harmadik_helyezett_id,
        p_kiesettek_szama,
        p_biztonsagi_auto);
  end futam_insert;
  
  procedure futam_update (p_id                       number,
                          p_orszag                   varchar2,
                          p_varos                    varchar2,
                          p_elso_helyezett_id        number,
                          p_masodik_helyezett_id     number,
                          p_harmadik_helyezett_id    number,
                          p_kiesettek_szama          number,
                          p_biztonsagi_auto          char) is 
  v_futam futam%ROWTYPE;
  BEGIN
     BEGIN
     SELECT *
      INTO v_futam
      FROM futam f
     WHERE f.id = p_id;
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_no_pilota_exc_code, 'Nincs ilyen ID-val rendelkezo futam!');
  END;

  IF p_id IS NOT NULL
  THEN
    v_futam.id := p_id;
  END IF;

  IF p_orszag IS NOT NULL
  THEN
    v_futam.orszag := p_orszag;
  END IF;

  IF p_varos IS NOT NULL
  THEN
    v_futam.varos := p_varos;
  END IF;
  
   IF p_elso_helyezett_id IS NOT NULL
  THEN
    v_futam.elso_helyezett_id := p_elso_helyezett_id;
  END IF;
  
   IF p_masodik_helyezett_id IS NOT NULL
  THEN
    v_futam.masodik_helyezett_id := p_masodik_helyezett_id;
  END IF;
  
  IF p_harmadik_helyezett_id IS NOT NULL
  THEN
    v_futam.harmadik_helyezett_id := p_harmadik_helyezett_id;
  END IF;
  
  IF p_kiesettek_szama IS NOT NULL
  THEN
    v_futam.kiesettek_szama := p_kiesettek_szama;
  END IF;
  
  IF p_biztonsagi_auto IS NOT NULL
  THEN
    v_futam.biztonsagi_auto := p_biztonsagi_auto;
  END IF;
  
  UPDATE futam f
     SET f.id              = v_futam.id
        ,f.orszag          = v_futam.orszag
        ,f.varos           = v_futam.varos
        ,f.elso_helyezett_id = v_futam.elso_helyezett_id
        ,f.masodik_helyezett_id = v_futam.masodik_helyezett_id
        ,f.harmadik_helyezett_id = v_futam.harmadik_helyezett_id
        ,f.kiesettek_szama       = v_futam.kiesettek_szama
        ,f.biztonsagi_auto       = v_futam.biztonsagi_auto
   WHERE f.id = p_id;
END futam_update;      

FUNCTION futam_select(p_id number)
      RETURN ty_futam IS
  res ty_futam;
BEGIN
  res := ty_futam();
  
  SELECT f.id
        ,f.orszag
        ,f.varos
        ,f.elso_helyezett_id
        ,f.masodik_helyezett_id
        ,f.harmadik_helyezett_id
        ,f.kiesettek_szama
        ,f.biztonsagi_auto
    INTO res.id
        ,res.orszag
        ,res.varos
        ,res.elso_helyezett_id
        ,res.masodik_helyezett_id
        ,res.harmadik_helyezett_id
        ,res.kiesettek_szama
        ,res.biztonsagi_auto
    FROM futam f
   WHERE f.id = p_id;
   
  RETURN(res);
END futam_select;

end futam_pkg;
/

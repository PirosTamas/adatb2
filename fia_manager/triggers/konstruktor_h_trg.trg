CREATE OR REPLACE TRIGGER konstruktor_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON konstruktor
  FOR EACH ROW
DECLARE
  v_mod_user futam_h.mod_user%TYPE;
  v_mod_time futam_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO konstruktor_h(id,
                              nev,
                              nemzetiseg,
                              evi_koltseg_limit,
                              csapatfonok_nev,
                              last_mod,
                              created,
                              mod_user,
                              dml_flag,
                              version)
                              values(:old.id,
                                     :old.nev,
                                     :old.nemzetiseg,
                                     :old.evi_koltseg_limit,
                                     :old.csapatfonok_nev,
                                     v_mod_time,
                                     :old.created,
                                     v_mod_user,
                                     'D',
                                     :old.version+1);
  ELSE
    INSERT INTO konstruktor_h(id,
                              nev,
                              nemzetiseg,
                              evi_koltseg_limit,
                              csapatfonok_nev,
                              last_mod,
                              created,
                              mod_user,
                              dml_flag,
                              version)
                              values(:new.id,
                                     :new.nev,
                                     :new.nemzetiseg,
                                     :new.evi_koltseg_limit,
                                     :new.csapatfonok_nev,
                                     :new.last_mod,
                                     :new.created,
                                     :new.mod_user,
                                     :new.dml_flag,
                                     :new.version);
  END IF;
END;
/

CREATE OR REPLACE TRIGGER versenyauto_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON versenyauto
  FOR EACH ROW
DECLARE
  v_mod_user futam_h.mod_user%TYPE;
  v_mod_time futam_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO versenyauto_h(id,
                              nev,
                              pilotaid,
                              beallitas_tipus,
                              elsoszarny,
                              hatsoszarny,
                              motor,
                              gumiKeverek,
                              last_mod,
                              created,
                              mod_user,
                              dml_flag,
                              version)
                              values(:old.id,
                                     :old.nev,
                                     :old.pilotaid,
                                     :old.beallitas_tipus,
                                     :old.elsoszarny,
                                     :old.hatsoszarny,
                                     :old.motor,
                                     :old.gumiKeverek,
                                     v_mod_time,
                                     :old.created,
                                     v_mod_user,
                                     'D',
                                     :old.version+1);
  ELSE
    INSERT INTO versenyauto_h(id,
                              nev,
                              pilotaid,
                              beallitas_tipus,
                              elsoszarny,
                              hatsoszarny,
                              motor,
                              gumiKeverek,
                              last_mod,
                              created,
                              mod_user,
                              dml_flag,
                              version)
                              values(:new.id,
                                     :new.nev,
                                     :new.pilotaid,
                                     :new.beallitas_tipus,
                                     :new.elsoszarny,
                                     :new.hatsoszarny,
                                     :new.motor,
                                     :new.gumiKeverek,
                                     :new.last_mod,
                                     :new.created,
                                     :new.mod_user,
                                     :new.dml_flag,
                                     :new.version);
  END IF;
END;
/

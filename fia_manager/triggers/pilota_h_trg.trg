CREATE OR REPLACE TRIGGER pilota_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON pilota
  FOR EACH ROW
DECLARE
  v_mod_user futam_h.mod_user%TYPE;
  v_mod_time futam_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO pilota_h(id,
                         csapatid,
                         keresztnev,
                         vezeteknev,
                         nemzetiseg,
                         rajtszam,
                         szuletesi_datum,
                         teljesitett_futamok,
                         vilagbajnoki_cimek_szama,
                         last_mod,
                         created,
                         mod_user,
                         dml_flag,
                         version)
                         values(:old.id,
                                :old.csapatid,
                                :old.keresztnev,
                                :old.vezeteknev,
                                :old.nemzetiseg,
                                :old.rajtszam,
                                :old.szuletesi_datum,
                                :old.teljesitett_futamok,
                                :old.vilagbajnoki_cimek_szama,
                                v_mod_time,
                                :old.created,
                                v_mod_user,
                                'D',
                                :old.version+1);
  ELSE
    INSERT INTO pilota_h(id,
                         csapatid,
                         keresztnev,
                         vezeteknev,
                         nemzetiseg,
                         rajtszam,
                         szuletesi_datum,
                         teljesitett_futamok,
                         vilagbajnoki_cimek_szama,
                         last_mod,
                         created,
                         mod_user,
                         dml_flag,
                         version)
                         values(:new.id,
                                :new.csapatid,
                                :new.keresztnev,
                                :new.vezeteknev,
                                :new.nemzetiseg,
                                :new.rajtszam,
                                :new.szuletesi_datum,
                                :new.teljesitett_futamok,
                                :new.vilagbajnoki_cimek_szama,
                                :new.last_mod,
                                :new.created,
                                :new.mod_user,
                                :new.dml_flag,
                                :new.version);
  END IF;
END;
/

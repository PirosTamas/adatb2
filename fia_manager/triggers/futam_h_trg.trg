CREATE OR REPLACE TRIGGER futam_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON futam
  FOR EACH ROW
DECLARE
  v_mod_user futam_h.mod_user%TYPE;
  v_mod_time futam_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO futam_h(id,
                        orszag,
                        varos,
                        elso_helyezett_id,
                        masodik_helyezett_id,
                        harmadik_helyezett_id,
                        kiesettek_szama,
                        biztonsagi_auto,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:old.id,
                               :old.orszag,
                               :old.varos,
                               :old.elso_helyezett_id,
                               :old.masodik_helyezett_id,
                               :old.harmadik_helyezett_id,
                               :old.kiesettek_szama,
                               :old.biztonsagi_auto,
                               v_mod_time,
                               :old.created,
                               v_mod_user,
                               'D',
                               :old.version+1);
  ELSE
    INSERT INTO futam_h(id,
                        orszag,
                        varos,
                        elso_helyezett_id,
                        masodik_helyezett_id,
                        harmadik_helyezett_id,
                        kiesettek_szama,
                        biztonsagi_auto,
                        last_mod,
                        created,
                        mod_user,
                        dml_flag,
                        version)
                        values(:new.id,
                               :new.orszag,
                               :new.varos,
                               :new.elso_helyezett_id,
                               :new.masodik_helyezett_id,
                               :new.harmadik_helyezett_id,
                               :new.kiesettek_szama,
                               :new.biztonsagi_auto,
                               :new.last_mod,
                               :new.created,
                               :new.mod_user,
                               :new.dml_flag,
                               :new.version);
  END IF;
END;
/

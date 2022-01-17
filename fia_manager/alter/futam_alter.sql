ALTER TABLE futam
      ADD CONSTRAINT elso_helyezett_id_fk FOREIGN KEY (elso_helyezett_id) REFERENCES pilota(id);
ALTER TABLE futam
      ADD CONSTRAINT masodik_helyezett_id_fk FOREIGN KEY (masodik_helyezett_id) REFERENCES pilota(id);
ALTER TABLE futam
      ADD CONSTRAINT harmadik_helyezett_id_fk FOREIGN KEY (harmadik_helyezett_id) REFERENCES pilota(id);
ALTER TABLE futam
      ADD CONSTRAINT biztonsagi_auto_boolean CHECK (biztonsagi_auto = 'Y' OR biztonsagi_auto = 'N');

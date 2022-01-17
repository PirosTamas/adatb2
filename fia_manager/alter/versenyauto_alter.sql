ALTER TABLE versenyauto
      ADD CONSTRAINT pilota_id_fk FOREIGN KEY (pilotaid) REFERENCES pilota(id);



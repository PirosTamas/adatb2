ALTER TABLE pilota
      ADD CONSTRAINT csapat_id_fk FOREIGN KEY (csapatid) REFERENCES konstruktor(id);

PROMPT Installing DB...

-- Install sequences
@./seq/pilota_seq.sql
@./seq/konstruktor_seq.sql
@./seq/futam_seq.sql
@./seq/versenyauto_seq.sql

-- Install tables
@./tables/pilota.sql
@./tables/konstruktor.sql
@./tables/futam.sql
@./tables/versenyauto.sql

--history tables
@./tables/pilota_h.sql
@./tables/konstruktor_h.sql
@./tables/futam_h.sql
@./tables/versenyauto_h.sql


--Type
@./type/ty_konstruktor.typ
@./type/ty_pilota.typ
@./type/ty_versenyauto.typ
@./type/ty_futam.typ
@./type/ty_pilota_list.typ
@./type/ty_konstruktor.typ

-- Triggers
@./triggers/pilota_trg.trg
@./triggers/konstruktor_trg.trg
@./triggers/futam_trg.trg
@./triggers/versenyauto_trg.trg

@./triggers/pilota_h_trg.trg
@./triggers/konstruktor_h_trg.trg
@./triggers/futam_h_trg.trg
@./triggers/versenyauto_h_trg.trg

-- FK
@./alter/pilota_alter.sql
@./alter/futam_alter.sql
@./alter/versenyauto_alter.sql

-- Tabla data
@./data/konstruktor_data.sql
@./data/pilota_data.sql
@./data/futam_data.sql
@./data/versenyauto_data.sql

--Packages
@./pkg/pkg_exception.spc
@./pkg/konstruktor_pkg.pck
@./pkg/pilota_pkg.pck
@./pkg/futam_pkg.pck
@./pkg/versenyauto_pkg.pck

--Views
@./view/champion_wins_2021.sql
@./view/most_agressive_setup.sql
@./view/safety_car_finish.sql

--Function
@./function/same_nationality.fnc



commit;

PROMPT Done.

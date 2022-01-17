create table futam_h(
       id                       number,
       orszag                   varchar2(30),
       varos                    varchar(30),
       elso_helyezett_id        number,
       masodik_helyezett_id     number,
       harmadik_helyezett_id    number,
       kiesettek_szama          number,
       biztonsagi_auto          char(1),
       last_mod                 timestamp(6),
       created                  timestamp(6),
       mod_user                 varchar2(300),
       dml_flag                 varchar2(1),
       version                  number  
);

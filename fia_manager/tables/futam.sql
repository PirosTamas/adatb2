create table futam(
       id                       number primary key,
       orszag                   varchar2(30),
       varos                    varchar(30),
       elso_helyezett_id        number not null,
       masodik_helyezett_id     number not null,
       harmadik_helyezett_id    number not null,
       kiesettek_szama          number,
       biztonsagi_auto          char(1) not null,
       last_mod                 timestamp(6),
       created                  timestamp(6),
       mod_user                 varchar2(300),
       dml_flag                 varchar2(1),
       version                  number  
);

create table konstruktor(
       id                 number primary key,
       nev                varchar2(30),
       nemzetiseg         varchar2(3),
       evi_koltseg_limit  number,
       csapatfonok_nev    varchar2(30),
       last_mod           timestamp(6),
       created            timestamp(6),
       mod_user           varchar2(300),
       dml_flag           varchar2(1),
       version            number      
);



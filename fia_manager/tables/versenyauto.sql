create table versenyauto(
       id               number primary key,
       nev              varchar2(10),
       pilotaid         number not null,
       beallitas_tipus  varchar2(30),
       elsoszarny       number,
       hatsoszarny      number,
       motor            varchar2(10),
       gumiKeverek      varchar2(10),  
       last_mod         timestamp(6),
       created          timestamp(6),
       mod_user         varchar2(300),
       dml_flag         varchar2(1),
       version          number      
);

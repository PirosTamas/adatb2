create table pilota(
       id                              number primary key,
       csapatid                        number,
       keresztnev                      varchar2(20) not null,
       vezeteknev                      varchar2(20) not null,
       nemzetiseg                      varchar2(3),
       rajtszam                        number,
       szuletesi_datum                 date,
       teljesitett_futamok             number,
       vilagbajnoki_cimek_szama        number,
       last_mod                        timestamp(6),
       created                         timestamp(6),
       mod_user                        varchar2(300),
       dml_flag                        varchar2(1),
       version	                       number
);


create or replace view champion_wins_2021 as
select
p.keresztnev ||' ' || p.vezeteknev as Versenyzo,
k.nev,
p.rajtszam,
s.darab,
round(months_between(sysdate, p.szuletesi_datum)/12, 0) as Eletkor
from pilota p
join konstruktor k
on p.csapatid = k.id
left join (select f.elso_helyezett_id, count(*) as darab from futam f group by f.elso_helyezett_id) s
on p.id = s.elso_helyezett_id
where
p.vilagbajnoki_cimek_szama > 0
order by p.szuletesi_datum desc;


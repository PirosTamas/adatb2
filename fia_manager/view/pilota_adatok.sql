create or replace view pilota_adatok as
select 
p.keresztnev || ' ' || p.vezeteknev as Versenyzo,
p.rajtszam,
p.nemzetiseg,
k.nev
from
pilota p
join konstruktor k
on p.csapatid = k.id;

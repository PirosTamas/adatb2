select 
k.nev,
k.nemzetiseg,
k.csapatfonok_nev,
a.motor as motor_beszallito
from konstruktor k
join pilota p
on p.csapatid = k.id
join versenyauto a
on p.id = a.pilotaid;

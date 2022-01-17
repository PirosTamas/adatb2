create or replace view safety_car_finish as 
select 
p1.keresztnev ||' ' || p1.vezeteknev as Elso,
p2.keresztnev ||' ' || p2.vezeteknev as Masodik,
p3.keresztnev ||' ' || p3.vezeteknev as Harmadik,
f.orszag,
f.kiesettek_szama
from futam f
join pilota p1
on f.elso_helyezett_id = p1.id
join pilota p2
on f.masodik_helyezett_id = p2.id
join pilota p3
on f.harmadik_helyezett_id = p3.id
where f.biztonsagi_auto = 'Y'
order by f.id;

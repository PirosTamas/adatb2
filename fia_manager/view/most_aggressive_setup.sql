create or replace view most_aggressive_setup as
select 
p.keresztnev ||' ' || p.vezeteknev as Versenyzo,
a.nev as versenyauto_neve,
a.beallitas_tipus,
a.elsoszarny,
a.hatsoszarny,
a.gumikeverek
from versenyauto a
join pilota p
on a.pilotaid = p.id 
where 
a.beallitas_tipus = 'high_downforce' and a.elsoszarny > 4 and a.hatsoszarny > 4 and a.gumikeverek = 'soft';

select * from most_aggressive_setup;

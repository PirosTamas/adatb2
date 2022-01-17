create or replace view kozepes_hosszu as
select
count(a.gumikeverek) as autokszama
from versenyauto a
where
a.gumikeverek = 'hard' and a.beallitas_tipus = 'medium_downforce';

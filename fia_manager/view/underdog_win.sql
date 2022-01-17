select 
p.keresztnev ||' '|| p.vezeteknev as Versenyzo,
f.orszag,
f.varos,
f.kiesettek_szama
from 
futam f
join pilota p
on p.id = f.elso_helyezett_id
where
f.elso_helyezett_id != 1 AND f.elso_helyezett_id != 3;

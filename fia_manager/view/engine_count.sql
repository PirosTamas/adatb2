create or replace view engine_count as
select 
s.motor,
count(*) as darab
from
(select distinct p.csapatid, v.motor from versenyauto v join pilota p on p.id = v.pilotaid ) s
group by s.motor;

select * from engine_count;

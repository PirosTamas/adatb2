create or replace function motor_darab (p_motor varchar2) 
return number is
res number;

begin
  select 
  count(*) into res
  from (select distinct p.csapatid, v.motor from versenyauto v join pilota p on p.id = v.pilotaid where v.motor = p_motor ) s
  group by s.motor;
  
  return res;
  
end;
/

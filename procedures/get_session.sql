create or replace function get_session(person_id_val int8, device_id_val text)
returns setof session
language sql
begin atomic
    select * from session s
    where s.person_id = person_id_val
    and s.device_id = device_id_val;
end;

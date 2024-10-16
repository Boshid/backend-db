create or replace procedure close_session(session_id_val int8, person_id_val int8, device_id_val text)
language sql
begin atomic
    update session set
    enabled = false
    where person_id = person_id_val and device_id = device_id_val;
end;

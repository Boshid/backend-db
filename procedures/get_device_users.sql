create or replace procedure get_device_users(session_id_val int8, device_id_val text)
language sql
begin atomic
    select person_id from session
    where device_id = device_id_val;
end;

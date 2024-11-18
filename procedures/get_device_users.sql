create or replace procedure get_device_users(device_id_val text)
language sql
begin atomic
    select person_id from session
    where device_id = device_id_val;
end;

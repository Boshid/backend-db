create or replace procedure create_session(person_id_val int8, expire_date_val timestamp, device_id_val text)
language sql
begin atomic
    insert into session(person_id, expire_date, device_id)
    values (person_id_val, expire_date_val, device_id_val)
    on conflict do nothing
    returning id;
end;

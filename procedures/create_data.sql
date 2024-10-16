create or replace procedure create_data(session_id_val int8, val int8[])
language sql
begin atomic
    select * from get_session(session_id_val)
    insert into data values (unnest(val))
    on conflict do nothing;
end;
